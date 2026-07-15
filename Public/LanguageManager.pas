unit LanguageManager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Data.Win.ADODB, System.Generics.Collections, System.RTTI, System.Math;

type
  TiLanguageType = (ltiChinese, ltiEnglish, ltiVietnamese);

  TLanguageItem = record
    OriginalText: string;
    Chinese: string;
    English: string;
    Vietnamese: string;
  end;

  TTranslationEntry = record
    OriginalText: string;
    Chinese: string;
    English: string;
    Vietnamese: string;
  end;

  TLanguageManager = class
  private
    FCurrentLanguage: TiLanguageType;
    FLanguageDict: TDictionary<string, TLanguageItem>;
    FConnection: TADOConnection;
    FQuery: TADOQuery;
    FIsConnectionOwner: Boolean;
    FVisited: TDictionary<TComponent, Boolean>;
    FBaseFontSize: TDictionary<Pointer, Integer>;
    FBaseWidth: TDictionary<Pointer, Integer>;

    function NormalizeText(const Text: string): string;
    function TextsEqual(const A, B: string): Boolean;
    function FindLanguageItem(const AText: string; out Item: TLanguageItem): Boolean;
    function GetLanguageField(const Item: TLanguageItem; const ALanguage: TiLanguageType): string;
    function IsControlName(const Text: string; const Component: TComponent): Boolean;
    function ShouldSkipComponent(Component: TComponent): Boolean;
    function IsDataBoundValueControl(Component: TComponent): Boolean;
    function ShouldTranslateTextProperty(Component: TComponent): Boolean;
    procedure TranslateComponent(Component: TComponent; const ALanguage: TiLanguageType);
    procedure TranslateProperty(Component: TComponent; const PropName: string;
      const ALanguage: TiLanguageType);
    procedure EnsureUnicodeFont(Component: TComponent);
    function GetComponentFont(Component: TComponent): TFont;
    function GetComponentCaptionText(Component: TComponent): string;
    function GetAvailableTextWidth(Component: TComponent): Integer;
    procedure CacheBaseFontSize(Component: TComponent; FontObj: TFont);
    procedure RestoreBaseFontSize(Component: TComponent; FontObj: TFont);
    procedure CacheBaseWidth(Component: TComponent);
    procedure RestoreBaseWidth(Component: TComponent);
    procedure TryEnableWordWrap(Component: TComponent);
    procedure TryExpandControlWidth(Component: TComponent; NeedW: Integer);
    procedure FitControlText(Component: TComponent);
  public
    constructor Create(AUseExistingConnection: Boolean = False;
      AConnection: TADOConnection = nil; AQuery: TADOQuery = nil);
    destructor Destroy; override;

    procedure Initialize(const AConnectionString: string = '');
    function LoadTranslations: Boolean;
    procedure AddTranslation(const OriginalText, Chinese, English, Vietnamese: string);
    procedure AddTranslations(const Translations: array of TTranslationEntry);
    function GetLanguageDict: TDictionary<string, TLanguageItem>;
    procedure ClearTranslations;

    function TranslateText(const AText: string; const ALanguage: TiLanguageType): string;
    procedure TranslateForm(AControl: TWinControl; const ALanguage: TiLanguageType);

    procedure SetCurrentLanguage(const ALanguage: TiLanguageType);
    function GetCurrentLanguage: TiLanguageType;
    property CurrentLanguage: TiLanguageType read GetCurrentLanguage write SetCurrentLanguage;
  end;

var
  GlobalLanguageManager: TLanguageManager = nil;

procedure InitLanguageManager(const AConnectionString: string = '');
procedure FreeLanguageManager;

{ 应用内存储约定：0=中文, 1=英文, 2=越南文；兼容旧枚举 5=越南文 }
function ResolveUiLanguage(AStoredValue: Integer): TiLanguageType;
function UiLanguageToStored(ALanguage: TiLanguageType): Integer;
function UiLanguageFieldName(ALanguage: TiLanguageType): string;

function Translate(const AText: string): string; overload;
function Translate(const AText: string; const ALanguage: TiLanguageType): string; overload;
procedure TranslateFormLanguage(AControl: TWinControl); overload;
procedure TranslateFormLanguage(AControl: TWinControl; const ALanguage: TiLanguageType); overload;
function GetCurrentAppLanguage: TiLanguageType;
procedure SetCurrentAppLanguage(const ALanguage: TiLanguageType);

implementation

function ResolveUiLanguage(AStoredValue: Integer): TiLanguageType;
begin
  case AStoredValue of
    0: Result := ltiChinese;
    1: Result := ltiEnglish;
    2: Result := ltiVietnamese;
    3: Result := ltiChinese;
    4: Result := ltiEnglish;
    5: Result := ltiVietnamese;
  else
    Result := ltiChinese;
  end;
end;

function UiLanguageToStored(ALanguage: TiLanguageType): Integer;
begin
  Result := Integer(ALanguage);
end;

function UiLanguageFieldName(ALanguage: TiLanguageType): string;
begin
  case ALanguage of
    ltiChinese: Result := 'sChinese';
    ltiEnglish: Result := 'sEnglish';
    ltiVietnamese: Result := 'sVietnamese';
  else
    Result := 'sChinese';
  end;
end;

function TLanguageManager.NormalizeText(const Text: string): string;
var
  TempStr: string;
  i: Integer;
  CharCode: Integer;
  LastSpace: Boolean;
  Ch: Char;
begin
  TempStr := Trim(Text);
  TempStr := StringReplace(TempStr, #$3000, ' ', [rfReplaceAll]);

  // 合并连续空白
  Result := '';
  LastSpace := False;
  for i := 1 to Length(TempStr) do
  begin
    Ch := TempStr[i];
    if (Ch = ' ') or (Ch = #9) then
    begin
      if not LastSpace then
        Result := Result + ' ';
      LastSpace := True;
      Continue;
    end;
    LastSpace := False;

    CharCode := Ord(Ch);
    if ((CharCode >= 32) and (CharCode <= 126)) or
       ((CharCode >= $00C0) and (CharCode <= $024F)) or
       ((CharCode >= $1EA0) and (CharCode <= $1EF9)) or
       ((CharCode >= $4E00) and (CharCode <= $9FFF)) or
       (CharCode = $00B0) then
      Result := Result + Ch;
  end;

  if Result = '' then
    Result := Trim(Text);
end;

function TLanguageManager.TextsEqual(const A, B: string): Boolean;
begin
  Result := SameText(NormalizeText(A), NormalizeText(B));
end;

constructor TLanguageManager.Create(AUseExistingConnection: Boolean = False;
  AConnection: TADOConnection = nil; AQuery: TADOQuery = nil);
begin
  inherited Create;
  FLanguageDict := TDictionary<string, TLanguageItem>.Create;
  FVisited := TDictionary<TComponent, Boolean>.Create;
  FBaseFontSize := TDictionary<Pointer, Integer>.Create;
  FBaseWidth := TDictionary<Pointer, Integer>.Create;
  FCurrentLanguage := ltiChinese;
  FIsConnectionOwner := False;

  if AUseExistingConnection and Assigned(AConnection) then
  begin
    FConnection := AConnection;
    if Assigned(AQuery) then
    begin
      FQuery := AQuery;
      FQuery.Connection := FConnection;
    end
    else
    begin
      FQuery := TADOQuery.Create(nil);
      FQuery.Connection := FConnection;
      FIsConnectionOwner := True;
    end;
  end
  else
  begin
    FConnection := TADOConnection.Create(nil);
    FQuery := TADOQuery.Create(nil);
    FQuery.Connection := FConnection;
    FIsConnectionOwner := True;
  end;
end;

destructor TLanguageManager.Destroy;
begin
  FreeAndNil(FVisited);
  FreeAndNil(FBaseFontSize);
  FreeAndNil(FBaseWidth);
  FreeAndNil(FLanguageDict);

  if FIsConnectionOwner then
  begin
    FreeAndNil(FQuery);
    if Assigned(FConnection) then
    begin
      if FConnection.Connected then
        FConnection.Connected := False;
      FreeAndNil(FConnection);
    end;
  end;

  inherited;
end;

procedure TLanguageManager.Initialize(const AConnectionString: string = '');
begin
  if AConnectionString <> '' then
  begin
    if FConnection.Connected then
      FConnection.Connected := False;
    FConnection.ConnectionString := AConnectionString;
    try
      FConnection.Connected := True;
    except
      on E: Exception do
        raise Exception.Create('数据库连接失败: ' + E.Message);
    end;
  end;
end;

function TLanguageManager.LoadTranslations: Boolean;
begin
  Result := True;
end;

procedure TLanguageManager.AddTranslation(const OriginalText, Chinese, English, Vietnamese: string);
var
  LanguageItem: TLanguageItem;
  Key: string;
begin
  if Trim(OriginalText) = '' then
    Exit;

  LanguageItem.OriginalText := OriginalText;
  if Trim(Chinese) <> '' then
    LanguageItem.Chinese := Chinese
  else
    LanguageItem.Chinese := OriginalText;
  LanguageItem.English := English;
  LanguageItem.Vietnamese := Vietnamese;

  Key := NormalizeText(OriginalText);
  FLanguageDict.AddOrSetValue(Key, LanguageItem);
end;

procedure TLanguageManager.AddTranslations(const Translations: array of TTranslationEntry);
var
  i: Integer;
begin
  for i := 0 to Length(Translations) - 1 do
    AddTranslation(Translations[i].OriginalText, Translations[i].Chinese,
      Translations[i].English, Translations[i].Vietnamese);
end;

function TLanguageManager.GetLanguageDict: TDictionary<string, TLanguageItem>;
begin
  Result := FLanguageDict;
end;

procedure TLanguageManager.ClearTranslations;
begin
  FLanguageDict.Clear;
end;

function TLanguageManager.GetLanguageField(const Item: TLanguageItem;
  const ALanguage: TiLanguageType): string;
begin
  case ALanguage of
    ltiChinese: Result := Item.Chinese;
    ltiEnglish: Result := Item.English;
    ltiVietnamese: Result := Item.Vietnamese;
  else
    Result := Item.Chinese;
  end;
  // 丢弃错误编码产生的“锟斤拷”
  if Pos('锟斤拷', Result) > 0 then
    Result := '';
  if Trim(Result) = '' then
  begin
    if ALanguage = ltiChinese then
      Result := Item.OriginalText
    else
      Result := Item.Chinese;
  end;
  if (Trim(Result) = '') or (Pos('锟斤拷', Result) > 0) then
    Result := Item.OriginalText;
end;

function TLanguageManager.FindLanguageItem(const AText: string; out Item: TLanguageItem): Boolean;
var
  Norm: string;
  Pair: TPair<string, TLanguageItem>;
begin
  Result := False;
  if Trim(AText) = '' then
    Exit;

  Norm := NormalizeText(AText);
  if FLanguageDict.TryGetValue(Norm, Item) then
    Exit(True);

  // 反向匹配：当前 Caption 可能已是英/越/中文任一版本
  // 跳过已乱码文本，避免越绑越乱
  if (Pos('锟斤拷', AText) > 0) or (Pos('?', Norm) > 0) then
    Exit(False);

  for Pair in FLanguageDict do
  begin
    Item := Pair.Value;
    if TextsEqual(AText, Item.OriginalText) or
       TextsEqual(AText, Item.Chinese) or
       TextsEqual(AText, Item.English) or
       TextsEqual(AText, Item.Vietnamese) then
      Exit(True);
  end;
end;

function TLanguageManager.IsControlName(const Text: string; const Component: TComponent): Boolean;
var
  i: Integer;
  OnlyIdent: Boolean;
begin
  Result := False;
  if (Component = nil) or (Text = '') then
    Exit;

  if SameText(Trim(Text), Component.Name) then
    Exit(True);

  if Length(Text) > 40 then
    Exit;

  OnlyIdent := True;
  for i := 1 to Length(Text) do
    if not (Text[i] in ['a'..'z', 'A'..'Z', '0'..'9', '_']) then
    begin
      OnlyIdent := False;
      Break;
    end;

  if not OnlyIdent then
    Exit;

  if SameText(Text, 'OK') or SameText(Text, 'Yes') or SameText(Text, 'No') or
     SameText(Text, 'Cancel') or SameText(Text, 'Help') or SameText(Text, 'USB') or
     SameText(Text, 'On') or SameText(Text, 'Off') then
    Exit(False);

  if Text[1] in ['A'..'Z', 'a'..'z', '_'] then
  begin
    for i := 2 to Length(Text) do
      if Text[i] in ['0'..'9'] then
        Exit(True);
    for i := 2 to Length(Text) do
      if Text[i] in ['A'..'Z'] then
        Exit(True);
  end;
end;

function TLanguageManager.ShouldSkipComponent(Component: TComponent): Boolean;
var
  P: TComponent;
begin
  Result := False;
  P := Component;
  while Assigned(P) do
  begin
    // 登录窗及其子控件不参与主界面翻译，避免销毁后指针复用错绑
    if SameText(P.ClassName, 'TFrmLogin') then
      Exit(True);
    P := P.Owner;
  end;
end;

function TLanguageManager.IsDataBoundValueControl(Component: TComponent): Boolean;
var
  Cn: string;
  RttiContext: TRttiContext;
  RttiType: TRttiType;
  RttiProperty: TRttiProperty;
  DataField: string;
  Binding: TValue;
  BindingObj: TObject;
  BindCtx: TRttiContext;
  FieldNameProp: TRttiProperty;
  FieldName: string;
begin
  { DBLabel/DBText 等：写入 Caption/Text 会写进数据集字段，需 dsEdit/dsInsert，
    否则报 Dataset not in edit or insert mode }
  Result := False;
  if Component = nil then
    Exit;

  Cn := UpperCase(Component.ClassName);
  if (Pos('DBLABEL', Cn) > 0) or (Pos('DBTEXT', Cn) > 0) or
     (Pos('DBEDIT', Cn) > 0) or (Pos('DBMEMO', Cn) > 0) or
     (Pos('DBSPIN', Cn) > 0) or (Pos('DBCALC', Cn) > 0) then
    Exit(True);

  // 非按钮/勾选/列的 DB 文本展示控件
  if (Pos('DB', Cn) > 0) and (Pos('BUTTON', Cn) = 0) and (Pos('CHECK', Cn) = 0) and
     (Pos('RADIO', Cn) = 0) and (Pos('COLUMN', Cn) = 0) and (Pos('GRID', Cn) = 0) and
     (Pos('COMBO', Cn) = 0) and
     ((Pos('LABEL', Cn) > 0) or ((Pos('TEXT', Cn) > 0) and (Pos('EDIT', Cn) = 0))) then
    Exit(True);

  RttiContext := TRttiContext.Create;
  try
    RttiType := RttiContext.GetType(Component.ClassType);
    RttiProperty := RttiType.GetProperty('DataField');
    if Assigned(RttiProperty) and RttiProperty.IsReadable then
    begin
      try
        DataField := Trim(RttiProperty.GetValue(Component).AsString);
        if (DataField <> '') and (Pos('CHECK', Cn) = 0) and (Pos('RADIO', Cn) = 0) and
           (Pos('BUTTON', Cn) = 0) and (Pos('COLUMN', Cn) = 0) then
          Exit(True);
      except
      end;
    end;

    RttiProperty := RttiType.GetProperty('DataBinding');
    if Assigned(RttiProperty) and RttiProperty.IsReadable then
    begin
      try
        Binding := RttiProperty.GetValue(Component);
        if (not Binding.IsEmpty) and Binding.IsObject then
        begin
          BindingObj := Binding.AsObject;
          if Assigned(BindingObj) then
          begin
            BindCtx := TRttiContext.Create;
            try
              FieldNameProp := BindCtx.GetType(BindingObj.ClassType).GetProperty('FieldName');
              if Assigned(FieldNameProp) and FieldNameProp.IsReadable then
              begin
                FieldName := Trim(FieldNameProp.GetValue(BindingObj).AsString);
                if (FieldName <> '') and (Pos('CHECK', Cn) = 0) and (Pos('RADIO', Cn) = 0) and
                   (Pos('BUTTON', Cn) = 0) and (Pos('EDIT', Cn) = 0) and
                   (Pos('COLUMN', Cn) = 0) then
                  Exit(True);
              end;
            finally
              BindCtx.Free;
            end;
          end;
        end;
      except
      end;
    end;
  finally
    RttiContext.Free;
  end;
end;

function TLanguageManager.ShouldTranslateTextProperty(Component: TComponent): Boolean;
var
  Cn: string;
begin
  Result := False;
  if Component = nil then
    Exit;
  if Component is TCustomEdit then
    Exit(False);
  if IsDataBoundValueControl(Component) then
    Exit(False);

  Cn := UpperCase(Component.ClassName);
  if (Pos('EDIT', Cn) > 0) or (Pos('MEMO', Cn) > 0) or (Pos('COMBO', Cn) > 0) or
     (Pos('SPIN', Cn) > 0) or (Pos('MASK', Cn) > 0) or (Pos('LOOKUP', Cn) > 0) or
     (Pos('DATE', Cn) > 0) or (Pos('TIME', Cn) > 0) or (Pos('DB', Cn) > 0) then
    Exit(False);

  Result := True;
end;

procedure TLanguageManager.EnsureUnicodeFont(Component: TComponent);
var
  FontObj: TFont;
begin
  // GB2312/ANSI_CHARSET 无法正确绘制越南语带调字母，会显示成 ? / 生僻汉字
  FontObj := GetComponentFont(Component);
  if Assigned(FontObj) then
  begin
    FontObj.Charset := DEFAULT_CHARSET;
    FontObj.Name := 'Microsoft YaHei';
  end;
end;

function TLanguageManager.GetComponentFont(Component: TComponent): TFont;
var
  RttiContext: TRttiContext;
  RttiType: TRttiType;
  RttiProperty: TRttiProperty;
begin
  Result := nil;
  if Component = nil then
    Exit;
  RttiContext := TRttiContext.Create;
  try
    RttiType := RttiContext.GetType(Component.ClassType);
    RttiProperty := RttiType.GetProperty('Font');
    if Assigned(RttiProperty) and RttiProperty.IsReadable then
    begin
      try
        Result := RttiProperty.GetValue(Component).AsType<TFont>;
      except
        Result := nil;
      end;
    end;
  finally
    RttiContext.Free;
  end;
end;

function TLanguageManager.GetComponentCaptionText(Component: TComponent): string;
var
  RttiContext: TRttiContext;
  RttiType: TRttiType;
  RttiProperty: TRttiProperty;
begin
  Result := '';
  if Component = nil then
    Exit;
  RttiContext := TRttiContext.Create;
  try
    RttiType := RttiContext.GetType(Component.ClassType);
    RttiProperty := RttiType.GetProperty('Caption');
    if not (Assigned(RttiProperty) and RttiProperty.IsReadable) then
      RttiProperty := RttiType.GetProperty('Text');
    if Assigned(RttiProperty) and RttiProperty.IsReadable then
    begin
      try
        Result := RttiProperty.GetValue(Component).AsString;
      except
        Result := '';
      end;
    end;
  finally
    RttiContext.Free;
  end;
end;

function TLanguageManager.GetAvailableTextWidth(Component: TComponent): Integer;
var
  RttiContext: TRttiContext;
  RttiType: TRttiType;
  RttiProperty: TRttiProperty;
  Ctrl: TControl;
begin
  Result := 0;
  if Component is TControl then
  begin
    Ctrl := TControl(Component);
    Result := Ctrl.ClientWidth;
    if Result <= 0 then
      Result := Ctrl.Width;
  end
  else
  begin
    // Grid 列等非 TControl：尝试读 Width
    RttiContext := TRttiContext.Create;
    try
      RttiType := RttiContext.GetType(Component.ClassType);
      RttiProperty := RttiType.GetProperty('Width');
      if Assigned(RttiProperty) and RttiProperty.IsReadable then
      begin
        try
          Result := RttiProperty.GetValue(Component).AsInteger;
        except
          Result := 0;
        end;
      end;
    finally
      RttiContext.Free;
    end;
  end;
  if Result > 4 then
    Dec(Result, 4);
end;

procedure TLanguageManager.CacheBaseFontSize(Component: TComponent; FontObj: TFont);
var
  Key: Pointer;
begin
  if (Component = nil) or (FontObj = nil) then
    Exit;
  Key := Pointer(Component);
  if not FBaseFontSize.ContainsKey(Key) then
    FBaseFontSize.Add(Key, FontObj.Size);
end;

procedure TLanguageManager.RestoreBaseFontSize(Component: TComponent; FontObj: TFont);
var
  BaseSize: Integer;
begin
  if (Component = nil) or (FontObj = nil) then
    Exit;
  if FBaseFontSize.TryGetValue(Pointer(Component), BaseSize) then
    FontObj.Size := BaseSize;
end;

procedure TLanguageManager.CacheBaseWidth(Component: TComponent);
var
  Key: Pointer;
  Ctrl: TControl;
begin
  if not (Component is TControl) then
    Exit;
  Ctrl := TControl(Component);
  Key := Pointer(Component);
  if not FBaseWidth.ContainsKey(Key) then
    FBaseWidth.Add(Key, Ctrl.Width);
end;

procedure TLanguageManager.RestoreBaseWidth(Component: TComponent);
var
  BaseW: Integer;
begin
  if not (Component is TControl) then
    Exit;
  if FBaseWidth.TryGetValue(Pointer(Component), BaseW) then
    TControl(Component).Width := BaseW;
end;

procedure TLanguageManager.TryEnableWordWrap(Component: TComponent);
var
  RttiContext: TRttiContext;
  RttiType: TRttiType;
  RttiProperty: TRttiProperty;
  Cn: string;
begin
  if Component = nil then
    Exit;
  Cn := UpperCase(Component.ClassName);
  // 仅标签类尝试换行；按钮换行会出现“lê / n sợi”断词，故排除
  if (Pos('BUTTON', Cn) > 0) or (Pos('BTN', Cn) > 0) then
    Exit;
  if (Pos('LABEL', Cn) = 0) and (Pos('STATIC', Cn) = 0) then
    Exit;

  RttiContext := TRttiContext.Create;
  try
    RttiType := RttiContext.GetType(Component.ClassType);
    RttiProperty := RttiType.GetProperty('WordWrap');
    if Assigned(RttiProperty) and RttiProperty.IsWritable then
    begin
      try
        RttiProperty.SetValue(Component, TValue.From<Boolean>(True));
      except
      end;
    end;
  finally
    RttiContext.Free;
  end;
end;

procedure TLanguageManager.TryExpandControlWidth(Component: TComponent; NeedW: Integer);
var
  Ctrl: TControl;
  ParentCtrl: TWinControl;
  MaxW, NewW: Integer;
  Cn: string;
begin
  if not (Component is TControl) then
    Exit;
  Ctrl := TControl(Component);
  Cn := UpperCase(Component.ClassName);
  // 放宽标签与按钮宽度（按钮宁可加宽，也不换行断词）
  if (Pos('LABEL', Cn) = 0) and (Pos('STATIC', Cn) = 0) and
     (Pos('CAPTION', Cn) = 0) and (Pos('BUTTON', Cn) = 0) and
     (Pos('BTN', Cn) = 0) then
    Exit;

  CacheBaseWidth(Component);

  NewW := NeedW + 6;
  if NewW <= Ctrl.Width then
    Exit;

  MaxW := NewW;
  if Ctrl.Parent is TWinControl then
  begin
    ParentCtrl := TWinControl(Ctrl.Parent);
    MaxW := ParentCtrl.ClientWidth - Ctrl.Left - 2;
    if MaxW < Ctrl.Width then
      MaxW := Ctrl.Width;
  end;
  if NewW > MaxW then
    NewW := MaxW;
  if NewW > Ctrl.Width then
    Ctrl.Width := NewW;
end;

procedure TLanguageManager.FitControlText(Component: TComponent);
var
  FontObj: TFont;
  Text: string;
  AvailW, TextW: Integer;
  Bmp: TBitmap;
  Cn: string;
begin
  if Component = nil then
    Exit;
  if IsDataBoundValueControl(Component) then
    Exit;

  Text := Trim(GetComponentCaptionText(Component));
  if Text = '' then
    Exit;

  FontObj := GetComponentFont(Component);
  // 切回中文/短文案时先恢复设计宽度与字号
  if Assigned(FontObj) then
  begin
    CacheBaseFontSize(Component, FontObj);
    RestoreBaseFontSize(Component, FontObj);
  end;
  CacheBaseWidth(Component);
  RestoreBaseWidth(Component);

  AvailW := GetAvailableTextWidth(Component);

  if FontObj = nil then
  begin
    Cn := UpperCase(Component.ClassName);
    if Pos('COLUMN', Cn) > 0 then
      TryEnableWordWrap(Component);
    Exit;
  end;

  Bmp := TBitmap.Create;
  try
    Bmp.SetSize(1, 1);
    Bmp.Canvas.Font.Assign(FontObj);
    TextW := Bmp.Canvas.TextWidth(Text);
    if AvailW < 8 then
      AvailW := TextW;

    if TextW > AvailW then
    begin
      TryExpandControlWidth(Component, TextW);
      AvailW := GetAvailableTextWidth(Component);
    end;

    if TextW > AvailW then
      TryEnableWordWrap(Component);
  finally
    Bmp.Free;
  end;
end;

procedure TLanguageManager.TranslateProperty(Component: TComponent; const PropName: string;
  const ALanguage: TiLanguageType);
var
  RttiContext: TRttiContext;
  RttiType: TRttiType;
  RttiProperty: TRttiProperty;
  CurrentValue, NewValue: string;
  Item: TLanguageItem;
begin
  RttiContext := TRttiContext.Create;
  try
    RttiType := RttiContext.GetType(Component.ClassType);
    RttiProperty := RttiType.GetProperty(PropName);
    if not (Assigned(RttiProperty) and RttiProperty.IsReadable and RttiProperty.IsWritable) then
      Exit;

    try
      CurrentValue := RttiProperty.GetValue(Component).AsString;
      if Trim(CurrentValue) = '' then
        Exit;
      if IsControlName(CurrentValue, Component) then
        Exit;
      // 已乱码的不继续翻译，避免扩散
      if Pos('锟斤拷', CurrentValue) > 0 then
        Exit;

      if not FindLanguageItem(CurrentValue, Item) then
        Exit;

      NewValue := GetLanguageField(Item, ALanguage);
      if (NewValue <> '') and (NewValue <> CurrentValue) then
      begin
        if ALanguage <> ltiChinese then
          EnsureUnicodeFont(Component);
        RttiProperty.SetValue(Component, TValue.From(NewValue));
        if SameText(PropName, 'Caption') or SameText(PropName, 'Text') or
           SameText(PropName, 'CaptionOn') or SameText(PropName, 'CaptionOff') then
          FitControlText(Component);
      end
      else if (NewValue <> '') and SameText(PropName, 'Caption') then
      begin
        // 文案未变也按当前语言重适配字号（例如切回中文需恢复基准字号）
        if ALanguage = ltiChinese then
          RestoreBaseFontSize(Component, GetComponentFont(Component))
        else
          FitControlText(Component);
      end;
    except
    end;
  finally
    RttiContext.Free;
  end;
end;

procedure TLanguageManager.TranslateComponent(Component: TComponent; const ALanguage: TiLanguageType);
var
  i: Integer;
  Child: TComponent;
  Ctrl: TControl;
begin
  if Component = nil then
    Exit;
  if ShouldSkipComponent(Component) then
    Exit;
  if FVisited.ContainsKey(Component) then
    Exit;
  FVisited.Add(Component, True);

  // 数据绑定值控件：绝不能改 Caption/Text，否则未 Edit 时会抛 EDatabaseError
  if not IsDataBoundValueControl(Component) then
  begin
    TranslateProperty(Component, 'Caption', ALanguage);
    if ShouldTranslateTextProperty(Component) then
      TranslateProperty(Component, 'Text', ALanguage);
  end;
  TranslateProperty(Component, 'Hint', ALanguage);
  // 开关控件文案
  TranslateProperty(Component, 'CaptionOn', ALanguage);
  TranslateProperty(Component, 'CaptionOff', ALanguage);

  // 1) 可视化父子树：Frame 的 Owner 常是 Page，不在 MainForm.Components 里，必须靠 Parent 链走到
  if Component is TWinControl then
    for i := 0 to TWinControl(Component).ControlCount - 1 do
    begin
      Ctrl := TWinControl(Component).Controls[i];
      if Ctrl <> Component then
        TranslateComponent(Ctrl, ALanguage);
    end;

  // 2) Owner 树：覆盖非可视化组件、以及 Parent 尚未挂上的子件
  for i := 0 to Component.ComponentCount - 1 do
  begin
    Child := Component.Components[i];
    if Child <> Component then
      TranslateComponent(Child, ALanguage);
  end;
end;

function TLanguageManager.TranslateText(const AText: string; const ALanguage: TiLanguageType): string;
var
  Item: TLanguageItem;
begin
  Result := AText;
  if FindLanguageItem(AText, Item) then
    Result := GetLanguageField(Item, ALanguage);
end;

procedure TLanguageManager.TranslateForm(AControl: TWinControl; const ALanguage: TiLanguageType);
begin
  if AControl = nil then
    Exit;

  FCurrentLanguage := ALanguage;
  // 不再改系统 Charset：会导致中文/登录页乱码；控件级字体由 FitControlText 处理
  FVisited.Clear;
  try
    TranslateComponent(AControl, ALanguage);
  finally
    FVisited.Clear;
  end;
end;

procedure TLanguageManager.SetCurrentLanguage(const ALanguage: TiLanguageType);
begin
  FCurrentLanguage := ALanguage;
end;

function TLanguageManager.GetCurrentLanguage: TiLanguageType;
begin
  Result := FCurrentLanguage;
end;

procedure InitLanguageManager(const AConnectionString: string = '');
begin
  if GlobalLanguageManager = nil then
  begin
    GlobalLanguageManager := TLanguageManager.Create;
    try
      if AConnectionString <> '' then
        GlobalLanguageManager.Initialize(AConnectionString);
    except
      on E: Exception do
      begin
        FreeAndNil(GlobalLanguageManager);
        raise Exception.Create('初始化语言管理器失败: ' + E.Message);
      end;
    end;
  end;
end;

procedure FreeLanguageManager;
begin
  FreeAndNil(GlobalLanguageManager);
end;

function Translate(const AText: string): string;
begin
  if GlobalLanguageManager = nil then
    Result := AText
  else
    Result := GlobalLanguageManager.TranslateText(AText, GlobalLanguageManager.CurrentLanguage);
end;

function Translate(const AText: string; const ALanguage: TiLanguageType): string;
begin
  if GlobalLanguageManager = nil then
    Result := AText
  else
    Result := GlobalLanguageManager.TranslateText(AText, ALanguage);
end;

procedure TranslateFormLanguage(AControl: TWinControl);
begin
  if GlobalLanguageManager <> nil then
    GlobalLanguageManager.TranslateForm(AControl, GlobalLanguageManager.CurrentLanguage);
end;

procedure TranslateFormLanguage(AControl: TWinControl; const ALanguage: TiLanguageType);
begin
  if GlobalLanguageManager <> nil then
    GlobalLanguageManager.TranslateForm(AControl, ALanguage);
end;

function GetCurrentAppLanguage: TiLanguageType;
begin
  if GlobalLanguageManager <> nil then
    Result := GlobalLanguageManager.CurrentLanguage
  else
    Result := ltiChinese;
end;

procedure SetCurrentAppLanguage(const ALanguage: TiLanguageType);
begin
  if GlobalLanguageManager <> nil then
    GlobalLanguageManager.CurrentLanguage := ALanguage;
end;

initialization
  // 不强制改系统代码页：本工程大量 GBK 源文件，改成 UTF-8 会导致登录/界面乱码

finalization
  FreeLanguageManager;

end.
