unit MainUnt;

interface

uses
  uIniOptions, VMsgMonitor, UIVMsgs, printers, Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, scStyledForm, scGPControls, scControls,
  dxGDIPlusClasses, Vcl.ExtCtrls, scStyleManager, scModernControls, scGPPagers,
  scGPImages, scGPFontControls, scImageCollection, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, scGPVertPagers, cxClasses,
  dxSkinsForm, scHtmlControls, cxPC, dxBarBuiltInMenu, cxContainer, cxEdit,
  Vcl.ComCtrls,
  dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  scGPExtControls, dxCalloutPopup, Vcl.DockTabSet, dxSkiniMaginary,
  dxSkinOffice2010Silver, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCalc, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, Vcl.Mask, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2013DarkGray,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, DMUnt, hsDBManager, clStringUnt, StrUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, SysUserUnt, LanguageUnt, uLogin,
  Vcl.AppEvnts, AutoRestart, LanguageManager, BuiltinTranslations;

const
  PageBkColor = clWhite;

type
  TFrameClass = class of TFrame;

  TMainForm = class(TForm)
    DBManager: ThsDBManager;
    scStyledForm1: TscStyledForm;
    scStyleManager1: TscStyleManager;
    scGPImageCollection1: TscGPImageCollection;
    aplMain: TApplicationEvents;
    Callout: TdxCalloutPopup;
    BorderPanel: TscGPPanel;
    ClientPnl: TscGPPanel;
    scGPPanel3: TscGPPanel;
    pcMain: TscGPPageControl;
    MenuPage: TscGPPageControlPage;
    pnlWarping: TscGPPanel;
    btnMES0103: TscGPCharGlyphButton;
    btnMES0102: TscGPCharGlyphButton;
    btnMES0101: TscGPCharGlyphButton;
    btnMES0104: TscGPCharGlyphButton;
    pnlSizing: TscGPPanel;
    btnMES0201: TscGPCharGlyphButton;
    btnMES0202: TscGPCharGlyphButton;
    OutPut: TscGPPanel;
    btnMES0303: TscGPCharGlyphButton;
    btnMES0301: TscGPCharGlyphButton;
    btnMES0302: TscGPCharGlyphButton;
    btnMES0304: TscGPCharGlyphButton;
    pnlReLogo: TscGPPanel;
    btnHelloMessage: TscGPCharGlyphButton;
    scGPPanel2: TscGPPanel;
    scGPLabel4: TscGPLabel;
    scGPLabel5: TscGPLabel;
    VerLab: TscGPLabel;
    ChengStateBtn: TscGPCharGlyphButton;
    NetStateBtn: TscGPCharGlyphButton;
    scGPSizeBox1: TscGPSizeBox;
    AppBar: TscGPPanel;
    Image1: TImage;
    calcBtn: TscGPCharGlyphButton;
    FireGPFillButton1: TscGPCharGlyphButton;
    FireGPFillButton2: TscGPCharGlyphButton;
    MainMenuBtn: TscGPCharGlyphButton;
    MainTileLab: TscGPLabel;
    scGPPanel1: TscGPPanel;
    scGPPanel4: TscGPPanel;
    scGPPanel5: TscGPPanel;
    scGPGlyphButton8: TscGPCharGlyphButton;
    MinButton: TscGPCharGlyphButton;
    MaxButton: TscGPCharGlyphButton;
    MenuPnl: TscGPPanel;
    btnClose: TscGPCharGlyphButton;
    btnSizing: TscGPCharGlyphButton;
    btnSeting: TscGPCharGlyphButton;
    btnReport: TscGPCharGlyphButton;
    btnWarp: TscGPCharGlyphButton;
    btnFirst: TscGPCharGlyphButton;
    procedure CloseButtonClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure scGPGlyphButton8Click(Sender: TObject);
    procedure MaxButtonClick(Sender: TObject);
    procedure scStyledForm1DWMClientMaximize(Sender: TObject);
    procedure scStyledForm1DWMClientRestore(Sender: TObject);
    procedure MinButtonClick(Sender: TObject);
    procedure MainMenuBtnClick(Sender: TObject);
    procedure calcBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Image1Click(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnMES0101Click(Sender: TObject);
    procedure FireGPFillButton2Click(Sender: TObject);
    procedure btnSizingClick(Sender: TObject);
    procedure btnSetingClick(Sender: TObject);
    procedure btnWarpClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure scGPCharGlyphButton1Click(Sender: TObject);
    procedure btnMES0102Click(Sender: TObject);
    procedure btnMES0103Click(Sender: TObject);
    procedure btnMES0104Click(Sender: TObject);
    procedure btnMES0202Click(Sender: TObject);
    procedure btnMES0201Click(Sender: TObject);
  private
    { Private declarations }
    FLoginTimes: Integer;
    FLanguageNameList: TStringList;
    FLanguageValueList: TStringList;
    FLoadedLanguate: Boolean;
    FLoadedLanguageType: TLanguageType;
    FLogon: TFrmLogin;
    FSysInUse: Boolean;
    FServiceNameList: TStringList;
    procedure SetBestSize;
    procedure VMsgUpdateAppColor(Sender: TObject; AMsg: TVMsg);
    procedure VMsgNewJinHuoDProc(Sender: TObject; AMsg: TVMsg);
    procedure VMsgLoadJinHuoDProc(Sender: TObject; AMsg: TVMsg);
    function LanguageTranslate(const AName: WideString): WideString;
    procedure LoginSuccess(bAutoLogo: Boolean);
    procedure CheckClient;
    procedure InitLogin(bRelogin: Boolean);
    procedure LoadLanguageList;
    procedure Login;
    procedure PersonalApply;
    function GetSysInUse: Boolean;
    procedure SetSysInUse(const Value: Boolean);
    procedure Logout;
    procedure AppException(Sender: TObject; E: Exception);
    procedure CheckDownFrameWork;
  protected
    procedure OnLogin(iCompanyID: Integer; sUserNo, sPassword: string;
      bRememberPassword: Boolean; bAutoLogo: Boolean);
    procedure OnUnLock(iCompanyID: Integer; sUserNo, sPassword: string;
      bRememberPassword: Boolean);
    procedure DoShow; override;
  published
    function TranslateMessageSelf(AMessage: string): string;
  public
    { Public declarations }
    FPage: TscGPPageControlPage;
    FJinHuoDFrame: TFrame;
    procedure FormatLanguage;
    procedure AfterConstruction; override;
    procedure CloseModule;
    function CreateModule(moduleClassName: string; myts: TscGPPageControlTab;
      iIsNew: Boolean = True): TFrame; overload;
    function CallModule(moduleSymbol, moduleCaption: string;
      AImageIndex: Integer = 0; AllowMultiInstance: Boolean = False): TFrame;
    property SysInUse: Boolean read GetSysInUse write SetSysInUse;
  end;

var
  MainForm: TMainForm;

const
  sLanguageCaption: array [TLanguageType] of string = ('无', '简体', 'English',
    '繁體', 'Indonesian', 'Vietnamese','','');
  siLanguageCaption: array [TiLanguageType] of string = ('简体中文', 'English', 'Vietnamese');
  sLanguageFieldName: array [TLanguageType] of string = ('', 'sChinese',
    'sEnglish', 'sTraditionalChinese', 'sIndonesian', 'sVietnamese','','');

implementation

{$R *.dfm}
{ TFrmMain }

uses
  UAppColor, uFrmSelectSkin, Winapi.ShellAPI,
  ufraModuleBase, MessageUnit, uFrmSplash,
  MessageServiceUnt, hsFrameUnt,
  FrameCommonUnt, clGuidUnt, frxRes, ufraModuleReport, ufraModuleWarping,
  ProcessBarUnt;

function GetRect(ARect: TRect): TRect;
begin
  Result := ARect;
  Result.Right := ARect.Right - 10;
  Result.Top := ARect.Top + 4;
end;

procedure TMainForm.AfterConstruction;
begin
  inherited;
  FLoginTimes := 0;
  FLanguageNameList := TStringList.Create;
  FLanguageValueList := TStringList.Create;
  FServiceNameList := TStringList.Create;
end;

procedure TMainForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.btnFirstClick(Sender: TObject);
begin
  CallModule('map', '首页', 3, False);
end;

function TMainForm.CallModule(moduleSymbol, moduleCaption: string;
  AImageIndex: Integer; AllowMultiInstance: Boolean): TFrame;
var
  ts: TscGPPageControlTab;
  tsName, moduleClassName: string;
  Page: TscGPPageControlPage;

  function GetUniqueName(const Name: string;
    const AComponent: TComponent): string;
  var
    LIdx: Integer;
  begin
    LIdx := 1;
    Result := Format(Name, [LIdx]);
    if AComponent <> nil then
    begin
      while AComponent.FindComponent(Result) <> nil do
      begin
        Inc(LIdx);
        Result := Format(Name, [LIdx]);
      end;
    end;
  end;

begin

  moduleClassName := 'TfraModule' + moduleSymbol;
  tsName := 'Page' + moduleSymbol;
  if AllowMultiInstance = False then // 不允许多开 ,看是否存在
  begin
    Page := pcMain.FindChildControl(tsName) as TscGPPageControlPage;
    if Page = nil then
    begin
      ts := pcMain.Tabs.Add;
      ts.Caption := '  ' + Translate(moduleCaption);
      ts.Page.Color := PageBkColor;
      ts.Page.BGStyle := scgppsColor;
      ts.Page.Name := tsName;
      ts.ImageIndex := AImageIndex;
      Result := CreateModule(moduleClassName, ts);

    end
    else
    begin
      pcMain.ActivePage := Page;
      if Page.ControlCount > 0 then
        if Page.Controls[0] is TfraModuleBase then
        begin
          pcMain.Tabs[0].Caption:= '  ' + Translate(moduleCaption);
          Result := TfraModuleBase(Page.Controls[0]);
          TfraModuleBase(Page.Controls[0]).sCaption:= '  ' + Translate(moduleCaption);
          TfraModuleBase(Page.Controls[0]).UpdateAppColor;
          TfraModuleBase(Page.Controls[0]).GetData;
        end;
    end;
  end
  else // 允许多开
  begin
    ts := pcMain.Tabs.Add;
    tsName := 'Page' + moduleSymbol + '%d';
    tsName := GetUniqueName(tsName, GetParentForm(Self));
    ts.Caption := Translate(moduleCaption);
    ts.Page.Color := PageBkColor;
    ts.Page.BGStyle := scgppsColor;
    ts.Page.Name := tsName;
    Result := CreateModule(moduleClassName, ts);
  end;

end;

procedure TMainForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.CloseModule;
begin

end;

function TMainForm.CreateModule(moduleClassName: string;
  myts: TscGPPageControlTab; iIsNew: Boolean): TFrame;
var
  fraClass: TFrameClass;
  aClass: TPersistentClass;
begin
  aClass := GetClass(moduleClassName);
  if Assigned(aClass) then
  begin
    fraClass := TFrameClass(aClass);
    Result := fraClass.Create(myts.Page);
    with TfraModuleBase(Result) do
    begin
      Visible := False;
      Name := 'fra' + Int64(Self.Handle).ToString;
      Top := 0;
      InitModuleLayout;
      Width := myts.Page.Width;
      Height := myts.Page.Height;
      Align := alClient;
      Parent := myts.Page;
      Visible := True;
      sCaption:= myts.Caption;
      GetData;
      OnCloseModule := CloseModule;
    end;
  end;
end;

procedure TMainForm.AppException(Sender: TObject; E: Exception);
var
  str: string;
begin
  // TfrmpbMessageBox.ShowErrorMessage(Screen.ActiveForm, E.Message, '系统错误提示');
  str := ReplaceStr(E.Message,
    '[FireDAC][Phys][ODBC][Microsoft][ODBC Driver 17 for SQL Server][SQL Server]',
    '');
  str := ReplaceStr(str, 'AfterSQL错误:', '脚本执行错误');
  UWPErrorMessage('系统错误提示', str);
end;

procedure TMainForm.CheckDownFrameWork;
const
  sSqlFileTime
    : string = 'SELECT sFileName,tFileTime FROM smFileManage WITH(NOLOCK) ' +
    'WHERE sFileName in (%s) ';
  sSqlText: string = 'SELECT gFile,tFileTime FROM smFileManage WITH(NOLOCK) ' +
    'WHERE sFileName = :sFileName AND gFile IS NOT NULL ';
var
  FFileName, NotPathFileName: string;
  FExeTime, tFileTime: TDateTime;
  sAppPath: string;
  i, j, iIndex: Integer;
  s, AFileName, AWriteFileName: string;
  sl, sl2: TStringList;
  qry, qryList: TFDMemTable;
  th: TThread;
  bExists, bTemp: Boolean;
begin
  for i := 1 to ParamCount() do
    if SameText(ParamStr(i), 'NOTUPDATE') then
      Exit;
  FFileName := Application.ExeName;
  sAppPath := ExtractFilePath(FFileName);
  NotPathFileName := ExtractFileName(FFileName);

  sl := TStringList.Create();
  sl2 := TStringList.Create();
  qry := TFDMemTable.Create(Self);
  qryList := TFDMemTable.Create(Self);
  try
    sl.Sorted := True;
    sl.Duplicates := dupIgnore;
    sl.CaseSensitive := False;
    sl2.Sorted := True;
    sl2.Duplicates := dupIgnore;
    sl2.CaseSensitive := False;
    // DBManager.FillStringsFromSql(sl, nil, 'select sFileName from dbo.smFileManage with(nolock) '
    // + 'where bAutoDownload = 1 and sFileName not in (N''HS.EXE'') and gFile is not null', []);
    //
    // for i := 0 to sl.Count - 1 do
    // begin
    // AFileName := sl[i];
    // if SameText(ExtractFileExt(AFileName),'.bpl') then
    // sl2.Add(AFileName);
    // end;

//    sl.Add('Help.chm');

    // {$IFNDEF DEVELOPERVERSION}
    sl.Add('MES.EXE=' + NotPathFileName);
    sl2.Add('MES.EXE');
    // {$ENDIF}

    AFileName := '';
    for i := 0 to sl.Count - 1 do
    begin
      s := sl[i];
      j := Pos('=', s);
      if j > 0 then
        s := Copy(s, 1, j - 1);
      AFileName := AFileName + ',N' + QuotedStr(s);
    end;
    System.Delete(AFileName, 1, 1);

    DBManager.QueryDataBySql(qryList, Format(sSqlFileTime, [AFileName]));

    for i := sl.Count - 1 downto 0 do
    begin
      s := sl[i];
      j := Pos('=', s);
      if j > 0 then
      begin
        AFileName := Copy(s, 1, j - 1);
        AWriteFileName := sAppPath + Copy(s, j + 1, MaxInt);
      end
      else
      begin
        AFileName := s;
        AWriteFileName := sAppPath + s;
      end;
      if qryList.Locate('sFileName', AFileName, [loCaseInsensitive]) then
        tFileTime := qryList.FieldByName('tFileTime').AsDateTime
      else
        tFileTime := 0;
      if tFileTime <= 0 then
      begin
        j := sl2.IndexOf(s);
        if j >= 0 then
          sl2.Delete(j);
        sl.Delete(i);
      end
      else if FileExists(AWriteFileName) then
      begin
        FileAge(AWriteFileName, FExeTime);
        if tFileTime < FExeTime + 5 * 1 / (24 * 60 * 60) then
        begin
          j := sl2.IndexOf(AFileName);
          if j >= 0 then
            sl2.Delete(j);
          sl.Delete(i);
        end;
      end;
    end;
    if sl.Count > 0 then
    begin
      th := TThread.CreateAnonymousThread(
        procedure
        var
          i, j: Integer;
        begin
          for i := 0 to sl.Count - 1 do
          begin
            iIndex := i + 1;
            AFileName := sl[i];
            j := Pos('=', AFileName);
            if j > 0 then
            begin
              AWriteFileName := Copy(AFileName, j + 1, MaxInt);
              System.Delete(AFileName, j, MaxInt);
            end
            else
            begin
              AWriteFileName := AFileName;
            end;

            TThread.Synchronize(th,
              procedure
              begin
                TfmProcessBar.UpdateProcessBar(IntToStr(iIndex) + '/' +
                  IntToStr(sl.Count) + ' '+Translate('正在升级')+ ' ' + AWriteFileName);
              end);

            FFileName := sAppPath + AWriteFileName;

            bTemp := sl2.IndexOf(AFileName) >= 0;
            if bTemp then
              FFileName := FFileName + '.uTMP';

            bExists := FileExists(FFileName);

            if bExists then
            begin
              FileSetAttr(FFileName, 0);
              if not DeleteFile(FFileName) and not bTemp then
              begin
                sl2.Add(AFileName);
                FFileName := FFileName + '.uTMP';
                bExists := FileExists(FFileName);
                if bExists then
                begin
                  FileSetAttr(FFileName, 0);
                  DeleteFile(FFileName);
                end;
              end;
            end;

            if not FileExists(FFileName) then
            begin
              DBManager.QueryDataBySql(qry, sSqlText, [AFileName]);
              if qry.Active and not qry.IsEmpty then
              begin
                TBlobField(qry.FieldByName('gFile')).SaveToFile(FFileName);
                FileSetDate(FFileName,
                  DateTimeToFileDate(qry.FieldByName('tFileTime').AsDateTime));
              end;
            end;
          end;
          TThread.Synchronize(th,
            procedure
            begin
              TfmProcessBar.HideProcessBar;
            end);
        end);
      th.Start;
      TfmProcessBar.ShowProcessBar(' '+Translate('正在升级')+' ');
      if sl2.Count > 0 then
      begin
{$IFDEF RELEASE}
        FreeAndNil(SplashForm);
{$ENDIF}
        AutoRestart.Relaunch('NOTUPDATE');
      end;
    end;
  finally
    qry.Free;
    qryList.Free;
    sl.Free;
    sl2.Free;
  end;
end;

procedure TMainForm.DoShow;
var
  vLogon: TFrmLogin;
begin
  inherited;
  with SplashForm do
    try
      // 启动阶段直接写中文
      StatusText := '设定异常反馈机制...';
      aplMain.OnException := AppException;
      StatusText := '调整系统最佳分辨率...';
      SetBestSize;
      StatusText := '注册系统消息机制...';
      // 注册消息
      with GlobalVMsgMonitor do
      begin
        RegMsg(Self, TUpdateAppColorMsg, VMsgUpdateAppColor);
      end;
      StatusText := '开始加载系统风格信息...';
      LoadAppColorObj;
      appcolor.IsUseColorSkin := IniOptions.IsUseColorSkin;
      StatusText := '加载系统风格信息完成...';

      StatusText := '初始化数据加载完毕,程序即将启动...';
      SplashForm.hide;
      // SplashForm.Free;

      CheckDownFrameWork;

      InitLogin(False);
    finally

    end;
  VerLab.Caption := Translate('MES管理系统版本 V1.0'); // + GetApplicationVersion;
  pcMain.TabHeight := 0;
  // FormStyle := fsStayOnTop;
  AlphaBlend := False;
end;

procedure TMainForm.calcBtnClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar('calc.exe'), nil, nil, SW_SHOW);
end;

procedure TMainForm.Login;
begin
end;

procedure TMainForm.Image1Click(Sender: TObject);
begin
  MenuPnl.Visible := not MenuPnl.Visible;
end;

procedure TMainForm.InitLogin(bRelogin: Boolean);
begin

  dm.SystemStatus := 0;

  if not Assigned(FLogon) then
  begin
    // Owner 用 Application，避免挂在 MainForm 下被 FormatLanguage 一起翻译
    FLogon := TFrmLogin.Create(Application);
    try
      with FLogon do
      begin
        Caption := Translate('用户登录   V1.0');
        FSysUser.LoginId := clGuid.NewGuidAsString;
        FLogon.OnLogin := Self.OnLogin;
        ShowModal;
        if ModalResult <> mrOk then
        begin
          Application.Minimize;
          Application.Terminate;
          Abort;
        end;
      end;
    finally
      FreeAndNil(FLogon);
    end;
  end;

end;

procedure TMainForm.LoadLanguageList;
  procedure AddLangItem(sItem, sValue: string);
  var
    i: Integer;
  begin
    if (sValue = '') or (sValue = sItem) then
      Exit;

    if FLanguageNameList.Find(sItem, i) then
    begin
      FLanguageValueList[i] := sValue;
    end
    else
    begin
      FLanguageNameList.Insert(i, sItem);
      FLanguageValueList.Insert(i, sValue);
    end;
  end;

var
  s: string;
  qry: TFDMemTable;
begin
  FLanguageNameList.Clear;
  FLanguageValueList.Clear;

  if ResolveUiLanguage(Integer(FSysUser.LanguageType)) = ltiChinese then
  begin
    // 兼容，中文固定翻译下对话框
    AddLangItem('Warning', '警告');
    AddLangItem('Error', '错误');
    AddLangItem('Information', '信息');
    AddLangItem('Confirm', '确认');
    AddLangItem('&Yes', '是(&Y)');
    AddLangItem('&No', '否(&N)');
    AddLangItem('OK', '确定');
    AddLangItem('Cancel', '取消');
    AddLangItem('&Help', '帮助(&H)');
    AddLangItem('Help', '帮助');
    AddLangItem('&Abort', '中止(&A)');
    AddLangItem('&Retry', '重试(&R)');
    AddLangItem('&Ignore', '忽略(&I)');
    AddLangItem('&All', '全部(&A)');
    AddLangItem('N&o to All', '全是(&O)');
    AddLangItem('Yes to &All', '全否(&A)');
    AddLangItem('&Close', '关闭(&C)');
  end;

  // 加载翻译列表（按 UI 语言映射字段，避免 0/1/2 与旧枚举错位）
  s := UiLanguageFieldName(ResolveUiLanguage(Integer(FSysUser.LanguageType)));
  if s = '' then
    Exit;

  qry := TFDMemTable.Create(Self);
  try
    DBManager.QueryDataBySql(qry, 'select a.sItem,a.' + s +
    ' from pbTextResource a with(nolock) ' + 'where a.sItem <> N'''' AND a.' +
    s + ' <> N'''' ');
    while not qry.Eof do
    begin
      // 只按名称翻译
      AddLangItem(clString.ToDBC(qry.Fields[0].AsString),
        qry.Fields[1].AsString);
      qry.Next;
    end;
    qry.Close;
  finally
    qry.Free;
  end;
end;

procedure TMainForm.FireGPFillButton2Click(Sender: TObject);
begin
  FrmSelectSkin.scStyledForm1.DropDown(FireGPFillButton2);
end;

procedure TMainForm.FormatLanguage;
var
  i: Integer;
  SelectedLanguage: TiLanguageType;
begin
  // 翻译 FastReport
  for i := 0 to frxResources.Values.Count - 1 do
    frxResources.Values[i] := TranslateMessageSelf(frxResources.Values[i]);

  // 统一解析：0=中文,1=英文,2=越南文；兼容旧值 5=越南文
  SelectedLanguage := ResolveUiLanguage(Integer(FSysUser.LanguageType));

  InitLanguageManager;
  GlobalLanguageManager.ClearTranslations;
  GlobalLanguageManager.CurrentLanguage := SelectedLanguage;

  // 仅使用内置词典，避免 TranslationsEx 错位/乱码覆盖
  LoadBuiltinTranslations(GlobalLanguageManager);

  TranslateFormLanguage(Self, SelectedLanguage);

  // 页签标题也按当前语言刷新
  for i := 0 to pcMain.Tabs.Count - 1 do
    pcMain.Tabs[i].Caption := Translate(Trim(pcMain.Tabs[i].Caption));
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (dm.SystemStatus = 1) and (UWPQuestionMessage('系统询问', '是否确认退出系统？') = 2)
  then
  begin
    CanClose := False;
  end;

  if CanClose and (dm.SystemStatus > 0) then
  begin
    dm.SystemStatus := 0;
    Logout;
  end;

  if CanClose and (dm.SystemStatus > 0) then
  begin
    dm.SystemStatus := 0;
    Logout;
  end;
end;

procedure TMainForm.Logout;
begin
  try
    dm.LoginManager.Logout(FSysUser.LoginId);
  except
    // 出错不提示
  end;
end;

function TMainForm.GetSysInUse: Boolean;
begin
  Result := FSysInUse and (dm.SystemStatus = 1) and
    (WindowState <> wsMinimized);
end;

procedure TMainForm.MaxButtonClick(Sender: TObject);
begin
  if scStyledForm1.IsDWMClientMaximized then
    scStyledForm1.DWMClientRestore
  else
    scStyledForm1.DWMClientMaximize;
end;

procedure TMainForm.MinButtonClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TMainForm.OnLogin(iCompanyID: Integer; sUserNo, sPassword: string;
bRememberPassword: Boolean; bAutoLogo: Boolean);
const
  // {$IFDEF DEVELOPERVERSION}
  sSqlText: string =
    'SELECT B.iCompanyID,B.sCompanyCode,B.sCompanyName,B.bHeadCompany ' +
    'FROM smLocalCompany B WITH(NOLOCK) ' + 'WHERE B.iCompanyID = :iCompanyID ';
  // {$ELSE}
  // sSqlText: string = 'SELECT A.iCompanyID,B.sCompanyCode,B.sCompanyName,B.bHeadCompany '
  // + 'FROM smUserCompany A WITH(NOLOCK) '
  // + 'JOIN smLocalCompany B WITH(NOLOCK) ON B.iCompanyID=A.iCompanyID '
  // + 'WHERE A.iCompanyID = :iCompanyID AND A.sUserID = :sUserID ';
  // {$ENDIF}
var
  sMsg: string;
  sCompanyCode: string;
  sCompanyName: string;
  bHeadCompany, bVerify: Boolean;
  qry: TFDMemTable;
  sPublicKey, sRSAPassWord, sVerify: string;
begin
  if sUserNo = '' then
  begin
    MessageService.ShowError('用户名或密码错误!');
    Exit;
  end;

  qry := TFDMemTable.Create(nil);
  try
    dm.DBManager.QueryDataBySql(qry, sSqlText, [iCompanyID, sUserNo]);
    if qry.IsEmpty then
    begin
      MessageService.ShowError('没有公司权限!');
      Exit;
    end;
    sCompanyCode := qry.FieldByName('sCompanyCode').AsString;
    sCompanyName := qry.FieldByName('sCompanyName').AsString;
    bHeadCompany := qry.FieldByName('bHeadCompany').AsBoolean;
  finally
    qry.Free;
  end;

  try
    if FSysUser.CheckPassword(sUserNo, sPassword, True, True,
    {$IFDEF DeBug} True {$ELSE} False {$ENDIF}) then
    begin
      FSysUser.CompanyID := iCompanyID;
      FSysUser.CompanyCode := sCompanyCode;
      FSysUser.CompanyName := sCompanyName;
      FSysUser.HeadCompany := bHeadCompany;
      FSysUser.RememberPassword := bRememberPassword;
      try
        dm.LoginManager.Login(FSysUser.LoginId, FSysUser.UserNo,
          FSysUser.UserName, FSysUser.LocalHostName, FSysUser.LocalMacAddr,
          FSysUser.CompanyID, sServerName, iServerPort, sMsg);

        if sMsg <> '' then
        begin
          MessageService.ShowMessage(sMsg);
          // Application.MessageBox(PChar(sMsg), '提示', MB_ICONINFORMATION);
        end;
      except
        on E: Exception do
        begin
          sMsg := E.Message;
          if System.Copy(sMsg, 1, 14) = 'Remote error: ' then
            System.Delete(sMsg, 1, 14);
          Application.ShowMainForm := False;
          SystemError(sMsg, MB_OK, False);
        end;
      end;

      LoginSuccess(bAutoLogo);
    end;
  except
    on E: Exception do
    begin
      Inc(FLoginTimes);
      sMsg := Trim(E.Message);
      if sMsg = '' then
        sMsg := '用户名或密码错误!';
      if FLoginTimes >= 3 then
        sMsg := sMsg + char(13) + char(10) + '错误次数过多,点击[确定]将关闭系统！';

      MessageService.ShowError(sMsg);

      if FLoginTimes >= 3 then
      begin
        Application.Minimize;
        Application.Terminate;
        Abort;
      end;
    end;
  end;
end;

procedure TMainForm.CheckClient;
const
  sSqlRegInfo: string = 'SELECT * FROM smSysRegInfo ' +
    'WHERE sMacAddr = :sMacAddr AND sComputerName = :sComputerName AND sClientType = :sClientType ';
var
  qry: TFDMemTable;
  F: TField;
  i: Integer;
begin
  // 本地处理
  qry := TFDMemTable.Create(nil);
  try
    qry.CachedUpdates := True;
    qry.UpdateOptions.UpdateTableName := 'smSysRegInfo';
    dm.DBManager.QueryDataBySql(qry, sSqlRegInfo,
      [FSysUser.LocalMacAddr, FSysUser.LocalHostName, sClientType]);

    if qry.IsEmpty then
    begin
      qry.Append();
      qry.FieldByName('uGUID').AsString := dm.DBManager.GetNewGuidAsString;
      qry.FieldByName('sMacAddr').AsString := FSysUser.LocalMacAddr;
      qry.FieldByName('sComputerName').AsString := FSysUser.LocalHostName;
      qry.FieldByName('sUserID').AsString := FSysUser.UserNo;
      qry.FieldByName('sClientType').AsString := sClientType;
      qry.FieldByName('bDisabled').AsBoolean := False;
      qry.FieldByName('bAuthorization').AsBoolean := False;
      qry.FieldByName('tRegTime').AsDateTime := dm.DBManager.GetSystemDateTime;
      for i := 0 to qry.FieldCount - 1 do
      begin
        F := qry.Fields[i];
        if F.IsNull and F.Required and F.CanModify then
        begin
          case F.DataType of
            ftBoolean:
              F.AsBoolean := False;
            ftSmallint, ftInteger, ftWord, ftAutoInc, ftLargeint, ftFloat,
              ftCurrency, ftBCD:
              F.AsInteger := 0;
            ftDate, ftTime, ftDateTime:
              F.AsDateTime := Date;
          else
            F.AsString := '';
          end;
        end;
      end;
    end
    else
      qry.Edit;
    qry.FieldByName('sIP').AsString := FSysUser.LocalIP;
    qry.FieldByName('sLastLoginUserID').AsString := FSysUser.UserNo;
    qry.FieldByName('tLastLoginTime').AsDateTime := Now;
    qry.Post;
    dm.DBManager.SaveData([qry]);

    if qry.FieldByName('bDisabled').AsBoolean then
    begin
      SystemError('此电脑已被禁用!', 0, True);
    end;

    // 检查授权
    if not qry.FieldByName('bAuthorization').AsBoolean and
      dm.DBManager.SysParamAsBoolean['bAuthorizedUsersLogin'] then
    begin
      SystemError('此电脑未授权使用!', 0, True);
    end;

  finally
    qry.Free;
  end;
end;

procedure TMainForm.LoginSuccess(bAutoLogo: Boolean);
const
  sSql: string = 'EXEC dbo.spsmLoginCheck @sUserId = :sUserId ' +
    ', @iCompanyId = :iCompanyId , @uLoginId = :uLoginId ';
var
  str: string;
  i, iErrType: Integer;
  sMessage: string;
  qry: TFDMemTable;
begin
  dm.ChangeUserNo(FSysUser.UserNo);
  CheckClient;
  iErrType := 0;
  sMessage := '';
  qry := TFDMemTable.Create(nil);
  try
    DBManager.QueryDataBySql(qry, sSql, [FSysUser.UserNo, FSysUser.CompanyID,
      FSysUser.LoginId]);
    if not qry.IsEmpty then
    begin
      iErrType := qry.FieldByName('iErrType').AsInteger;
      sMessage := qry.FieldByName('sMessage').AsString;
    end;
  finally
    qry.Free;
  end;

  if iErrType = 1 then
  begin
    MessageService.ShowError(sMessage);
  end
  else if iErrType = 2 then
  begin
    SystemError(sMessage, 0, True);
  end;

  Self.FLogon.ModalResult := mrOk;
  //
  // InitStatusBarText;
  dm.UserId := FSysUser.UserNo;
  dm.WriteDefaultUserToIni(FSysUser.UserNo, FSysUser.LanguageType,
    FSysUser.CompanyID, FSysUser.Password, FSysUser.RememberPassword,
    bAutoLogo);

  PersonalApply;
  // 最后改状态
  dm.SystemStatus := 1;
end;

procedure TMainForm.PersonalApply;
var
  s: string;
  sl: TStringList;
  i: Integer;
begin
  // 切换账套
  s := DBManager.SysParamAsString['bChangeServiceName'];
  if s = '' then
  begin
    DBManager.SysParamAsBoolean['bChangeServiceName'] := False;
    DBManager.SysParamAsString['sChangeServiceNameList'] := '';
  end;
  if SameText(s, 'True') or SameText(s, '1') then
  begin
    FServiceNameList.CommaText := dm.LoginManager.GetServiceNameList;
    if FServiceNameList.Count > 0 then
    begin
      sl := TStringList.Create;
      try
        sl.Sorted := True;
        sl.CommaText := DBManager.SysParamAsString['sChangeServiceNameList'];
        if sl.Count > 0 then
        begin
          for i := FServiceNameList.Count - 1 downto 0 do
            if sl.IndexOf(FServiceNameList[i]) = -1 then
              FServiceNameList.Delete(i);
        end;
      finally
        sl.Free;
      end;
    end;
  end;

  FormatLanguage;

  s := DBManager.SysParamAsString['smSystemName'];
  if s = '' then
    s := Caption;

  if FSysUser.CompanyName <> '' then
    s := s + ' [' + FSysUser.CompanyName + ']';

  if not DBManager.SysParamAsBoolean['smHideDatabaseName'] then
    s := s + ' [' + sServerName + '\' + sServiceName + ']';

  Caption := s;

  SysInUse := True;

  scStyledForm1.DWMClientMaximize;
  if dm.sWorkingProcedureName = '整经' then
  begin
    Callout.Close;
    CallModule('Warping', '整经报工', 3, False);
    MenuPnl.Visible := False;
  end
  else if dm.sWorkingProcedureName = '染色' then
  begin
    Callout.Close;
    CallModule('Dyeing', '球染报工', 3, False);
    MenuPnl.Visible := False;
  end
  else if dm.sWorkingProcedureName = '分经' then
  begin
    Callout.Close;
    CallModule('FenJing', '分经报工', 3, False);
    MenuPnl.Visible := False;
  end
  else if pos('浆',dm.sWorkingProcedureName)>0 then
  begin
    Callout.Close;
    CallModule('Sizing', '浆轴报工', 3, False);
    MenuPnl.Visible := False;
  end
  else
  begin
    Callout.Close;
    CallModule('SetUp', '系统设置', 3, False);
    MenuPnl.Visible := False;
  end;

end;

procedure TMainForm.OnUnLock(iCompanyID: Integer; sUserNo, sPassword: string;
bRememberPassword: Boolean);
begin

end;

procedure TMainForm.btnHomeClick(Sender: TObject);
begin
  CallModule('Home', '首页', 3, False);
end;

procedure TMainForm.btnMES0101Click(Sender: TObject);
begin
  Callout.Close;
  CallModule('Warping', '整经报工', 3, False);
  MenuPnl.Visible := False;
end;

procedure TMainForm.btnMES0102Click(Sender: TObject);
begin
  Callout.Close;
  CallModule('Warping', '球经报工', 3, False);
  MenuPnl.Visible := False;
end;

procedure TMainForm.btnMES0103Click(Sender: TObject);
begin
  Callout.Close;
  CallModule('FenJing', '分经报工', 3, False);
  MenuPnl.Visible := False;
end;

procedure TMainForm.btnMES0104Click(Sender: TObject);
begin
  Callout.Close;
  CallModule('Dyeing', '染色报工', 3, False);
  MenuPnl.Visible := False;
end;

procedure TMainForm.btnMES0201Click(Sender: TObject);
begin
  Callout.Close;
  CallModule('Sizing', '染浆联报工', 3, False);
  MenuPnl.Visible := False;
end;

procedure TMainForm.btnMES0202Click(Sender: TObject);
begin
  Callout.Close;
  CallModule('Sizing', '浆轴报工', 3, False);
  MenuPnl.Visible := False;
end;

procedure TMainForm.btnReportClick(Sender: TObject);
var
  vObj: TWinControl;
  vOwner: TControl;
begin
  if Sender is TWinControl then
  begin
    vObj := Sender as TWinControl;
    vOwner := MenuPage.FindChildControl(vObj.Hint);
    if (vOwner = nil) or not(vOwner is TWinControl) then
      Exit;
    Callout.PopupControl := vOwner as TWinControl;
    Callout.Popup(vObj);
  end;
end;

procedure TMainForm.btnSetingClick(Sender: TObject);
begin
  CallModule('Setup', '设置', 3, False);
end;

procedure TMainForm.btnSizingClick(Sender: TObject);
var
  vObj: TWinControl;
  vOwner: TControl;
begin
  // 请在菜单按钮的 Hint属性里填写弹出菜单Panel的Name
  if Sender is TWinControl then
  begin
    vObj := Sender as TWinControl;
    vOwner := MenuPage.FindChildControl(vObj.Hint);
    if (vOwner = nil) or not(vOwner is TWinControl) then
      Exit;
    Callout.PopupControl := vOwner as TWinControl;
    Callout.Popup(vObj);
  end;
end;

procedure TMainForm.btnWarpClick(Sender: TObject);
var
  vObj: TWinControl;
  vOwner: TControl;
begin
  // CallModule('NongHu', '农户', 3, False);
  if Sender is TWinControl then
  begin
    vObj := Sender as TWinControl;
    vOwner := MenuPage.FindChildControl(vObj.Hint);
    if (vOwner = nil) or not(vOwner is TWinControl) then
      Exit;
    Callout.PopupControl := vOwner as TWinControl;
    Callout.Popup(vObj);
  end;
end;

procedure TMainForm.scGPCharGlyphButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.MainMenuBtnClick(Sender: TObject);
begin
  MenuPnl.Visible := not MenuPnl.Visible;
end;

procedure TMainForm.scGPGlyphButton8Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.scStyledForm1DWMClientMaximize(Sender: TObject);
begin
  MaxButton.GlyphOptions.Index := 722; // scgpbgkRestore.scgpbgkExit;
  scGPSizeBox1.Visible := False;
  BorderPanel.Sizeable := False;
end;

procedure TMainForm.scStyledForm1DWMClientRestore(Sender: TObject);
begin
  MaxButton.GlyphOptions.Index := 720; // scgpbgkMaximize; //720;
  scGPSizeBox1.Visible := True;
  BorderPanel.Sizeable := True;
end;

procedure TMainForm.SetBestSize;
begin
  // 如果宽高大于屏幕宽高，则调整为屏幕宽高的90%
  if Width > Screen.WorkAreaWidth then
    Width := trunc(Screen.WorkAreaWidth * 0.9);
  if Height > Screen.WorkAreaHeight then
    Height := trunc(Screen.WorkAreaHeight * 0.9);
  // 如果宽高小于屏幕宽高的60%，则调整为屏幕宽高的80%
  if Width < trunc(Screen.WorkAreaWidth * 0.6) then
    Width := trunc(Screen.WorkAreaWidth * 0.8);
  if Height < trunc(Screen.WorkAreaHeight * 0.6) then
    Height := trunc(Screen.WorkAreaHeight * 0.8);
end;

procedure TMainForm.SetSysInUse(const Value: Boolean);
begin
  if FSysInUse = Value then
    Exit;
  FSysInUse := Value;

  if not FSysInUse then
  begin
    // 断开连接
    dm.kbmMWClientConnectionPool1.Active := False;
    dm.kbmMWClientConnectionPool1.Cache.ClearCache;
    dm.kbmMWClientConnectionPool1.KillConnections;
    dm.kbmMWTCPIPIndyClientTransport1.Active := False;
    // 清除缓存后再次Active
    dm.kbmMWClientConnectionPool1.Active := True;
  end;

  FSysUser.UserInfo.Values['SysInUse'] := BoolToStr(FSysInUse, True);
end;

procedure TMainForm.VMsgLoadJinHuoDProc(Sender: TObject; AMsg: TVMsg);
begin

end;

function TMainForm.TranslateMessageSelf(AMessage: string): string;
begin
  Result := LanguageTranslate(AMessage);
  if Result = '' then
    Result := AMessage;
end;

function TMainForm.LanguageTranslate(const AName: WideString): WideString;
  function Trans(const AName: string): string;
  var
    i: Integer;
  begin
    if FLanguageNameList.Count > 0 then
    begin
      if FLanguageNameList.Find(AName, i) then
        Result := FLanguageValueList[i]
      else
        Result := '';
    end;
  end;
  procedure SaveUntranslated(AItem: string);
  const
    sSql: string = 'DECLARE @sItem NVARCHAR(200) = :sItem '#13#10 +
      'IF NOT EXISTS(SELECT TOP 1 1 FROM dbo.pbTextResource '#13#10 +
      'WHERE sItem = @sItem) '#13#10 +
      'INSERT dbo.pbTextResource(sItem) VALUES(@sItem) ';
  var
    n, l: Integer;
    s: string;
  begin
    // 只处理中文
    s := Trim(AItem);
    l := Length(s);
    if l = 0 then
      Exit;
    n := Ord(s[1]);
    if (n < $4E00) or (n > $9FEF) then
    begin
      if l <= 3 then
        Exit;
      n := Ord(s[4]);
      if (n < $4E00) or (n > $9FEF) then
        Exit;
    end;
    DBManager.executeSql(sSql, [AItem])
  end;

var
  i, j, l, iIndex: Integer;
  sName, sFirst, sLast, s, sQuickChar: string;
  a: array of TVarRec;
begin
  sName := clString.ToDBC(AName);
  if (sName = '') or (sName = '*') then
  begin
    Result := '';
    Exit;
  end;

  Result := Trans(sName);
  if Result = '' then
  begin
    sFirst := '';
    sLast := '';

    if (sName[1] = '*') then
    begin
      sFirst := Copy(sName, 1, 1);
      sName := Copy(sName, 2, MaxInt);
    end;

    sQuickChar := '';
    i := Pos('&', sName);
    if i > 1 then
    begin
      if Length(sName) > i then
        sQuickChar := sName[i + 1];

      Dec(i);
      if CharInSet(sName[i], ['(', '[']) then
        Dec(i);
      if i > 1 then
      begin
        sLast := Copy(sName, i + 1, MaxInt);
        sName := Copy(sName, 1, i);
      end;
    end;

    Result := Trans(sName);

    // 把[]处理成[%s]
    if (Result = '') and (PosEx('[', sName, 1) > 0) and
      (PosEx('%s', sName, 1) = 0) then
    begin
      s := '';
      j := 1;
      iIndex := 0;
      i := PosEx('[', sName, 1);
      while True do
      begin
        s := s + Copy(sName, j, i - j + 1);
        j := PosEx(']', sName, i + 1);
        if j > 0 then
        begin
          SetLength(a, iIndex + 1);
          a[iIndex].VType := vtUnicodeString;
          l := j - i - 1;
          SetString(UnicodeString(a[iIndex].VUnicodeString),
            PChar(Copy(sName, i + 1, l)), l);
          s := s + '%s';
          Inc(iIndex);

          i := PosEx('[', sName, j + 1);
          if i = 0 then
          begin
            s := s + Copy(sName, j, MaxInt);
            Break;
          end;
        end
        else
        begin
          s := s + Copy(sName, i + 1, MaxInt);
          Break;
        end;
      end;
      Result := Trans(s);
      if Result <> '' then
      begin
        Result := Format(Result, a);
      end
      else
      begin
        // 记录日志
{$IFDEF SAVEUNTRANSLATED}
        SaveUntranslated(s);
{$ENDIF}
      end;
    end
    else
    begin
      // 记录日志
{$IFDEF SAVEUNTRANSLATED}
      SaveUntranslated(sName);
{$ENDIF}
    end;
    if Result <> '' then
    begin
      i := 0;
      if sQuickChar <> '' then
        i := Pos(UpperCase(sQuickChar), UpperCase(Result));
      if i > 0 then
      begin
        Insert('&', Result, i);
        Result := sFirst + Result;
      end
      else
        Result := sFirst + Result + sLast;
    end;

  end;
end;

procedure TMainForm.VMsgNewJinHuoDProc(Sender: TObject; AMsg: TVMsg);
begin
  FJinHuoDFrame := CallModule('JinHuoD', '进货单', 3, False);
  if FJinHuoDFrame <> nil then
  begin
    // with TfraModuleJinHuoD(FJinHuoDFrame) do
    // begin
    // initNewDanJv;
    // DanWeiEdt.SetFocus;
    // end;
  end;
end;

procedure TMainForm.VMsgUpdateAppColor(Sender: TObject; AMsg: TVMsg);
var
  i: Integer;
begin
  if not(AMsg is TUpdateAppColorMsg) then
    Exit;
  if appcolor.IsUseColorSkin = False then
    Exit;
  with appcolor do
  begin
    ClientPnl.FillColor := MainMenuBtn.NormalColor;
    BorderPanel.FillColor := MainMenuBtn.NormalColor;
    BorderPanel.FillColor2 := MainMenuBtn.NormalColor;
    MainTileLab.Font.Color := MainTileColor;
    // 处理二级菜单边框
    Callout.BorderColor := MainMenuBtn.PressedColor;
    Callout.Color := MainMenuBtn.PressedColor;

    for i := 0 to Self.ComponentCount - 1 do
    begin
      // TMyscGPButton
      if Self.Components[i] is TscGPCharGlyphButton then
      begin
        with Self.Components[i] as TscGPCharGlyphButton do
        begin
          if HelpKeyword <> 'NoSkin' then
          begin
            if HelpKeyword.Equals('MainMenuBtn') then // 主菜单按钮
            begin
              with MainMenuBtn do
              begin
                Options.NormalColor := NormalColor;
                Options.HotColor := HotColor;
                Options.PressedColor := PressedColor;
                Options.FocusedColor := FocusedColor;
                Options.FrameNormalColor := FrameNormalColor;
                Options.FrameHotColor := FrameHotColor;
                Options.FramePressedColor := FramePressedColor;
                Options.FrameFocusedColor := FrameFocusedColor;
              end;
            end
            else if HelpKeyword.Equals('WarningBtn') then // 警示按钮
            begin
              with WarningBtn do
              begin
                Options.NormalColor := NormalColor;
                Options.HotColor := HotColor;
                Options.PressedColor := PressedColor;
                Options.FocusedColor := FocusedColor;
                Options.FrameNormalColor := FrameNormalColor;
                Options.FrameHotColor := FrameHotColor;
                Options.FramePressedColor := FramePressedColor;
                Options.FrameFocusedColor := FrameFocusedColor;
              end;

            end
            else if HelpKeyword.Equals('InfoBtn') then // 信息按钮
            begin
              with InfoBtn do
              begin
                Options.NormalColor := NormalColor;
                Options.PressedColor := PressedColor;
                Options.HotColor := HotColor;
              end;
            end
            else if HelpKeyword.Equals('InfoBtn2') then // 信息按钮 朴素
            begin
              with InfoBtn2 do
              begin
                Options.NormalColor := NormalColor;
                Options.HotColor := HotColor;
                Options.PressedColor := PressedColor;
                Options.FocusedColor := FocusedColor;
                Options.FrameNormalColor := FrameNormalColor;
                Options.FrameHotColor := FrameHotColor;
                Options.FramePressedColor := FramePressedColor;
                Options.FrameFocusedColor := FrameFocusedColor;
              end;

            end;

          end;
        end;

      end
      else
        // TMyscGPEdit
        if Self.Components[i] is TscGPEdit then
        begin
          with Self.Components[i] as TscGPEdit do
          begin
            if HelpKeyword <> 'NoSkin' then
            begin
              if HelpKeyword.Equals('PrimaryEdt') then // 主要
              begin
                with PrimaryEdt do
                begin
                  Options.NormalColor := NormalColor;
                  Options.HotColor := HotColor;
                  Options.FocusedColor := FocusedColor;
                  Options.FrameNormalColor := FrameNormalColor;
                  Options.FrameHotColor := FrameHotColor;
                  Options.FrameFocusedColor := FrameFocusedColor;
                  LeftButton.GlyphColor := FrameNormalColor;
                  RightButton.GlyphColor := FrameNormalColor;
                end;

              end;

            end;
          end;

        end // TscGridPanel
        else if Self.Components[i] is TscGridPanel then
        begin
          with Self.Components[i] as TscGridPanel do
          begin
            if HelpKeyword = 'NoSkin' then
              Exit;
            if HelpKeyword.Equals('GridHead') then // 主要
            begin
              Color := GridHeadPanel.NormalColor;

            end;

          end;

        end // TscLabel
        else if Self.Components[i] is TscLabel then
        begin
          with Self.Components[i] as TscLabel do
          begin
            if HelpKeyword = 'NoSkin' then
              Exit;
            if HelpKeyword.Equals('GridHead') then
            begin
              Color := GridHeadPanel.NormalColor;
              Font.Color := GridHeadPanel.FontColor;;
            end;

          end;

        end // Tscgppanel
        else if Self.Components[i] is TscGPPanel then
        begin
          with Self.Components[i] as TscGPPanel do
          begin
            if HelpKeyword = 'NoSkin' then
              Exit;
            if HelpKeyword.Equals('SecondMenuPnl') then // 二级菜单
            begin
              FillColor := MainMenuBtn.NormalColor;
              FillColor2 := MainMenuBtn.PressedColor;
            end;

          end;

        end;

    end;
  end;

end;

end.
