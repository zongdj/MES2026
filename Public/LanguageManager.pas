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

    function NormalizeText(const Text: string): string;
    function TextsEqual(const A, B: string): Boolean;
    function FindLanguageItem(const AText: string; out Item: TLanguageItem): Boolean;
    function GetLanguageField(const Item: TLanguageItem; const ALanguage: TiLanguageType): string;
    function IsControlName(const Text: string; const Component: TComponent): Boolean;
    function ShouldSkipComponent(Component: TComponent): Boolean;
    function ShouldTranslateTextProperty(Component: TComponent): Boolean;
    procedure TranslateComponent(Component: TComponent; const ALanguage: TiLanguageType);
    procedure TranslateProperty(Component: TComponent; const PropName: string;
      const ALanguage: TiLanguageType);
    procedure EnsureUnicodeFont(Component: TComponent);
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

function TLanguageManager.ShouldTranslateTextProperty(Component: TComponent): Boolean;
var
  Cn: string;
begin
  Result := False;
  if Component = nil then
    Exit;
  if Component is TCustomEdit then
    Exit(False);

  Cn := UpperCase(Component.ClassName);
  if (Pos('EDIT', Cn) > 0) or (Pos('MEMO', Cn) > 0) or (Pos('COMBO', Cn) > 0) or
     (Pos('SPIN', Cn) > 0) or (Pos('MASK', Cn) > 0) or (Pos('LOOKUP', Cn) > 0) or
     (Pos('DATE', Cn) > 0) or (Pos('TIME', Cn) > 0) then
    Exit(False);

  Result := True;
end;

procedure TLanguageManager.EnsureUnicodeFont(Component: TComponent);
var
  RttiContext: TRttiContext;
  RttiType: TRttiType;
  RttiProperty: TRttiProperty;
  FontObj: TFont;
begin
  if not (Component is TControl) then
    Exit;

  // GB2312/ANSI_CHARSET 无法正确绘制越南语带调字母，会显示成 ? / 生僻汉字
  RttiContext := TRttiContext.Create;
  try
    RttiType := RttiContext.GetType(Component.ClassType);
    RttiProperty := RttiType.GetProperty('Font');
    if Assigned(RttiProperty) and RttiProperty.IsReadable then
    begin
      try
        FontObj := RttiProperty.GetValue(Component).AsType<TFont>;
        if Assigned(FontObj) then
        begin
          FontObj.Charset := DEFAULT_CHARSET;
          FontObj.Name := 'Microsoft YaHei';
        end;
      except
      end;
    end;
  finally
    RttiContext.Free;
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

  TranslateProperty(Component, 'Caption', ALanguage);
  if ShouldTranslateTextProperty(Component) then
    TranslateProperty(Component, 'Text', ALanguage);
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
  // 不再改系统 Charset：会导致中文/登录页乱码；仅对需显示越文的控件设置 YaHei 字体
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
