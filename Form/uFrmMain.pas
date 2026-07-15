unit uFrmMain;

interface

uses
  uIniOptions, VMsgMonitor, UIVMsgs, printers, udm, Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, scStyledForm, scGPControls, scControls,
  dxGDIPlusClasses, Vcl.ExtCtrls, scStyleManager, scModernControls, scGPPagers,
  scGPImages, scGPFontControls, scImageCollection, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, scGPVertPagers, cxClasses,
  dxSkinsForm, scHtmlControls, cxPC, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  scGPExtControls, dxCalloutPopup, Vcl.DockTabSet, dxSkiniMaginary,
  dxSkinOffice2010Silver, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCalc, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
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
  dxSkinXmas2008Blue;

const
  PageBkColor = clWhite;

type
  TFrameClass = class of TFrame;

  TFrmMain = class(TForm)
    scStyleManager1: TscStyleManager;
    BorderPanel: TscGPPanel;
    scGPImageCollection1: TscGPImageCollection;
    ClientPnl: TscGPPanel;
    scGPPanel3: TscGPPanel;
    pcMain: TscGPPageControl;
    MenuPage: TscGPPageControlPage;
    scGPPanel2: TscGPPanel;
    scGPLabel4: TscGPLabel;
    scGPLabel5: TscGPLabel;
    VerLab: TscGPLabel;
    ChengStateBtn: TscGPCharGlyphButton;
    NetStateBtn: TscGPCharGlyphButton;
    Timer1: TTimer;
    scGPSizeBox1: TscGPSizeBox;
    TimeTimer: TTimer;
    scStyledForm1: TscStyledForm;
    Callout: TdxCalloutPopup;
    CaiWPnl: TscGPPanel;
    scGPButton4: TscGPCharGlyphButton;
    scGPButton1: TscGPCharGlyphButton;
    scGPButton2: TscGPCharGlyphButton;
    scGPButton3: TscGPCharGlyphButton;
    ChuKuMenuPnl: TscGPPanel;
    scGPButton6: TscGPCharGlyphButton;
    scGPButton7: TscGPCharGlyphButton;
    scGPButton8: TscGPCharGlyphButton;
    AppBar: TscGPPanel;
    calcBtn: TscGPCharGlyphButton;
    FireGPFillButton1: TscGPCharGlyphButton;
    FireGPFillButton2: TscGPCharGlyphButton;
    FireGPFillButton3: TscGPCharGlyphButton;
    FireGPFillButton4: TscGPCharGlyphButton;
    MainTileLab: TscGPLabel;
    scGPPanel1: TscGPPanel;
    scGPPanel4: TscGPPanel;
    scGPPanel5: TscGPPanel;
    scGPGlyphButton8: TscGPCharGlyphButton;
    MinButton: TscGPCharGlyphButton;
    MaxButton: TscGPCharGlyphButton;
    MenuPnl: TscGPPanel;
    scGPCharGlyphButton1: TscGPCharGlyphButton;
    scGPCharGlyphButton2: TscGPCharGlyphButton;
    scGPGlyphButton1: TscGPCharGlyphButton;
    scGPGlyphButton3: TscGPCharGlyphButton;
    scGPGlyphButton4: TscGPCharGlyphButton;
    scGPGlyphButton5: TscGPCharGlyphButton;
    scGPGlyphButton6: TscGPCharGlyphButton;
    scGPGlyphButton9: TscGPCharGlyphButton;
    Image1: TImage;
    scGPPanel6: TscGPPanel;
    FireSuperButton4: TscGPButton;
    FireSuperButton5: TscGPButton;
    FireSuperButton6: TscGPButton;
    FireSuperButton8: TscGPButton;
    FireSuperButton9: TscGPButton;
    FireSuperButton10: TscGPButton;
    FireSuperButton11: TscGPButton;
    scGPPanel7: TscGPPanel;
    scGPPanel10: TscGPPanel;
    scGridPanel4: TscGridPanel;
    FireSuperButton14: TscGPButton;
    FireSuperButton12: TscGPButton;
    scGPPanel11: TscGPPanel;
    MaoZhongLab: TscGPLabel;
    scGridPanel3: TscGridPanel;
    ZheKouBtn: TscGPButton;
    scGPLabel18: TscGPLabel;
    ShuiFenEdt: TscGPNumericEdit;
    scGridPanel5: TscGridPanel;
    scGPButton5: TscGPButton;
    scGPLabel19: TscGPLabel;
    PiZhongEdt: TscGPNumericEdit;
    scGridPanel6: TscGridPanel;
    scGPLabel20: TscGPLabel;
    scGPLabel21: TscGPLabel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    scGridPanel8: TscGridPanel;
    scGPLabel15: TscGPLabel;
    scGridPanel9: TscGridPanel;
    scGPLabel36: TscGPLabel;
    scGridPanel10: TscGridPanel;
    scGPLabel17: TscGPLabel;
    scGPPanel8: TscGPPanel;
    CurrNongHuLab: TscGPLabel;
    SearchEdt: TscGPEdit;
    FireSuperButton1: TscGPButton;
    FireSuperButton2: TscGPButton;
    FireSuperButton3: TscGPButton;
    scGPLabel22: TscGPLabel;
    scGPLabel1: TscGPLabel;
    scGPLabel3: TscGPLabel;
    DateLab: TscGPLabel;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure scGPButton1Click(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure scGPGlyphButton8Click(Sender: TObject);
    procedure scGPGlyphButton7Click(Sender: TObject);
    procedure scGPGlyphButton6Click(Sender: TObject);
    procedure scGPGlyphButton5Click(Sender: TObject);
    procedure scGPGlyphButton3Click(Sender: TObject);
    procedure scGPGlyphButton1Click(Sender: TObject);
    procedure scGPGlyphButton9Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure MaxButtonClick(Sender: TObject);
    procedure scStyledForm1DWMClientMaximize(Sender: TObject);
    procedure scStyledForm1DWMClientRestore(Sender: TObject);
    procedure MinButtonClick(Sender: TObject);
    procedure MainTileLabClick(Sender: TObject);
    procedure TimeTimerTimer(Sender: TObject);
    procedure scGPCharGlyphButton1Click(Sender: TObject);
    procedure MainMenuBtnClick(Sender: TObject);
    procedure PopMenu(Sender: TObject);
    procedure MainMenuBtnMouseEnter(Sender: TObject);
    procedure scGPGlyphButton4MouseEnter(Sender: TObject);
    procedure calcBtnClick(Sender: TObject);
    procedure scGPButton2Click(Sender: TObject);
    procedure scGPButton8Click(Sender: TObject);
    procedure FireGPFillButton2Click(Sender: TObject);
    procedure scGPGlyphButton4MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure scGPCharGlyphButton2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure scGPCharGlyphButton2MouseEnter(Sender: TObject);
    procedure scGPGlyphButton6MouseEnter(Sender: TObject);
    procedure scGPGlyphButton7MouseEnter(Sender: TObject);
    procedure scGPGlyphButton7MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure scGPGlyphButton6MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure scGPCharGlyphButton2Click(Sender: TObject);
  private
    { Private declarations }
    procedure SetBestSize;
    procedure VMsgUpdateAppColor(Sender: TObject; AMsg: TVMsg);
    procedure VMsgNewJinHuoDProc(Sender: TObject; AMsg: TVMsg);
    procedure VMsgLoadJinHuoDProc(Sender: TObject; AMsg: TVMsg);

  public
    { Public declarations }
    FPage: TscGPPageControlPage;
    FJinHuoDFrame: TFrame;
    procedure CloseModule;
    function CreateModule(moduleClassName: string; myts: TscGPPageControlTab; iIsNew: Boolean = True): TFrame; overload;
    function CallModule(moduleSymbol, moduleCaption: string; AImageIndex: Integer = 0; AllowMultiInstance: Boolean = False): TFrame;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}
{ TFrmMain }

uses
  ufraModuleXiaoShou, UAppColor, uFrmSelectSkin, uFrmMenu1, Winapi.ShellAPI,
  ufraModuleBase, MessageUnit, uLogin, uFrmSplash;

function GetRect(ARect: TRect): TRect;
begin
  Result := ARect;
  Result.Right := ARect.Right - 10;
  Result.Top := ARect.Top + 4;
end;

procedure TFrmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

function TFrmMain.CallModule(moduleSymbol, moduleCaption: string; AImageIndex: Integer; AllowMultiInstance: Boolean): TFrame;
var
  ts: TscGPPageControlTab;
  tsName, moduleClassName: string;
  Page: TscGPPageControlPage;

  function GetUniqueName(const Name: string; const AComponent: TComponent): string;
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
  // if (moduleSymbol = 'Login') then
  // begin
  // btnClose.Visible := True;
  // end
  // else
  // begin
  // btnClose.Visible := False;
  // end;
  //
  // if (moduleSymbol = 'Home') or (moduleSymbol = 'Login') then
  // begin
  // btnHome.Visible := False;
  // end
  // else
  // begin
  // btnHome.Visible := True;
  // end;
  //
  // if (moduleSymbol = 'Pos') then
  // begin
  // AppBar.Visible := False;
  // BorderPanel.FrameColor := clBlack;
  // end
  // else
  // begin
  // AppBar.Visible := True;
  // BorderPanel.FrameColor := $005D5D5D;
  // end;
  //
  // if (moduleSymbol = 'KuCun') then
  // begin
  // AppBar.Visible := False;
  /// /    BorderPanel.FrameColor := clBlack;
  // end
  // else
  // begin
  // AppBar.Visible := True;
  /// /    BorderPanel.FrameColor := $005D5D5D;
  // end;

  moduleClassName := 'TfraModule' + moduleSymbol;
  tsName := 'Page' + moduleSymbol;
  if AllowMultiInstance = False then // 不允许多开 ,看是否存在
  begin
    Page := pcMain.FindChildControl(tsName) as TscGPPageControlPage;
    if Page = nil then
    begin
      ts := pcMain.Tabs.Add;
      ts.Caption := '  ' + moduleCaption;
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
          Result := TfraModuleBase(Page.Controls[0]);
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
    ts.Caption := moduleCaption;
    ts.Page.Color := PageBkColor;
    ts.Page.BGStyle := scgppsColor;
    ts.Page.Name := tsName;
    Result := CreateModule(moduleClassName, ts);
  end;

end;

procedure TFrmMain.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMain.CloseModule;
begin

end;

function TFrmMain.CreateModule(moduleClassName: string; myts: TscGPPageControlTab; iIsNew: Boolean): TFrame;
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
      top := 0;
      InitModuleLayout;
      Width := myts.Page.Width;
      Height := myts.Page.Height;
      Align := alClient;
      Parent := myts.Page;
      Visible := True;
      GetData;
      OnCloseModule := CloseModule;
    end;
  end;
end;

procedure TFrmMain.calcBtnClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar('calc.exe'), nil, nil, SW_SHOW);
end;

procedure TFrmMain.FireGPFillButton2Click(Sender: TObject);
begin
  FrmSelectSkin.scStyledForm1.DropDown(FireGPFillButton2);
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  vLogon: TFrmLogin;
begin
  SetBestSize;
   //注册消息
  with GlobalVMsgMonitor do
  begin
    RegMsg(Self, TUpdateAppColorMsg, VMsgUpdateAppColor);
    RegMsg(Self, TNewJinHuoDvMsg, VMsgNewJinHuoDProc);
    RegMsg(Self, TLoadJinHuoDMsg, VMsgLoadJinHuoDProc);
  end;
  LoadAppColorObj;
  appcolor.IsUseColorSkin := IniOptions.IsUseColorSkin;
  //
  with SplashForm do
  try
    StatusText := ('开始初始化内存...');
    StatusText := ('初始化内存完成');
    StatusText := ('开始加载客户端列表...');
    StatusText := ('加载客户端列表完成');
    StatusText := ('开始初始化内存');
    StatusText := ('开始初始化数据...');
    StatusText := ('全部数据加载完毕，程序即将启动...');
    SplashForm.hide;
    SplashForm.Free;
    vLogon := TFrmLogin.Create(Self);
    with vLogon do
    begin
      Caption := '用户登录   V' + GetApplicationVersion;
      ShowModal;
      if ModalResult <> mrOk then
      begin
        Application.Terminate;
        exit;
      end;
      disposeOf;
    end;
  finally

  end;
  VerLab.Caption := 'MES管理系统版本 V' + GetApplicationVersion;
  pcMain.TabHeight := 0;
  FormStyle := fsStayOnTop;
  AlphaBlend := False;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
//  Timer1.Enabled := True;
//  CallModule('Map', '首页', 3, False);
  scStyledForm1.DWMClientMaximize;
  CallModule('report', '报表', 3, False);
end;

procedure TFrmMain.MaxButtonClick(Sender: TObject);
begin
  if scStyledForm1.IsDWMClientMaximized then
    scStyledForm1.DWMClientRestore
  else
    scStyledForm1.DWMClientMaximize;
end;

procedure TFrmMain.MinButtonClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TFrmMain.btnHomeClick(Sender: TObject);
begin
  CallModule('Home', '首页', 3, False);
end;

procedure TFrmMain.scGPButton1Click(Sender: TObject);
begin
  CallModule('Login', '登录', 3, False);
end;

procedure TFrmMain.scGPButton2Click(Sender: TObject);
begin
  Callout.Close;
  UWPInfoMessage('提示', '哈喽，账户信息');
end;

procedure TFrmMain.scGPButton8Click(Sender: TObject);
begin
  Callout.Close;
  FJinHuoDFrame := CallModule('JinHuoD', '进货单', 3, False);
end;

procedure TFrmMain.scGPCharGlyphButton1Click(Sender: TObject);
begin
//  ShowMessage(IniOptions.ColorSkinAppColorObj);
//  exit;
//  IniOptions.ColorSkinAppColorObj := TNetEncoding.Base64.Encode(ComponentToStr(AppColor));


  exit;
  Close;
end;

procedure TFrmMain.scGPCharGlyphButton2Click(Sender: TObject);
begin
//  CallModule('_PiFaPos', '出货单', 3, False);
end;

procedure TFrmMain.scGPCharGlyphButton2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if scGPCharGlyphButton2.Down then
    PopMenu(Sender);
end;

procedure TFrmMain.scGPCharGlyphButton2MouseEnter(Sender: TObject);
begin
  if scGPCharGlyphButton2.Down then
    PopMenu(Sender);

end;

procedure TFrmMain.scGPGlyphButton1Click(Sender: TObject);
begin
//  CallModule('Setup', '设置', 3, False);
end;

procedure TFrmMain.MainMenuBtnClick(Sender: TObject);
begin
  MenuPnl.Visible := not MenuPnl.Visible;
end;

procedure TFrmMain.MainMenuBtnMouseEnter(Sender: TObject);
begin
  // 注释掉了，不够完美
  // if MenuPnl.Visible=false then
  // begin
  // MenuPnl.Parent := Form1;
  // MenuPnl.top:= 0;
  // MenuPnl.left:=0;
  // MenuPnl.Visible := True;
  // Form1.scStyledForm1.DropDown(MainMenuBtn);
  // end;

end;

procedure TFrmMain.scGPGlyphButton3Click(Sender: TObject);
begin
  CallModule('report', '报表', 3, False);
end;

procedure TFrmMain.PopMenu(Sender: TObject);
var
  vObj: TWinControl;
  vOwner: TControl;
begin
//  //请在菜单按钮的 Hint属性里填写弹出菜单Panel的Name
//  if Sender is TWinControl then
//  begin
//    vObj := Sender as TWinControl;
//    vOwner := MenuPage.FindChildControl(vObj.Hint);
//    if (vOwner = nil) or not (vOwner is TWinControl) then
//      exit;
//    Callout.PopupControl := vOwner as TWinControl;
//    Callout.Popup(vObj);
//  end;
end;

procedure TFrmMain.scGPGlyphButton4MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Callout.PopupControl := CaiWPnl;
  Callout.Popup(scGPGlyphButton4, GetRect(scGPGlyphButton4.ClientRect));
end;

procedure TFrmMain.scGPGlyphButton4MouseEnter(Sender: TObject);
begin
  Callout.PopupControl := CaiWPnl;
  Callout.Popup(scGPGlyphButton4, GetRect(scGPGlyphButton4.ClientRect));
end;

procedure TFrmMain.scGPGlyphButton5Click(Sender: TObject);
begin
//  CallModule('NongHu', '农户', 3, False);
end;

procedure TFrmMain.scGPGlyphButton6Click(Sender: TObject);
begin
  CallModule('JinHuoDList', '进货单列表', 3, False);
end;

procedure TFrmMain.scGPGlyphButton6MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Callout.PopupControl := CaiWPnl;
  Callout.Popup(scGPGlyphButton6, GetRect(scGPGlyphButton6.ClientRect));
end;

procedure TFrmMain.scGPGlyphButton6MouseEnter(Sender: TObject);
begin
  Callout.PopupControl := CaiWPnl;
  Callout.Popup(scGPGlyphButton6, GetRect(scGPGlyphButton6.ClientRect));
end;

procedure TFrmMain.scGPGlyphButton7Click(Sender: TObject);
//var
//  vObj: TWinControl;
//  vOwner: TControl;
begin
//  Callout.Close;
// FJinHuoDFrame := CallModule('JinHuoD', '进货单', 3, False);
//  if FJinHuoDFrame <> nil then
//  begin
//    with TfraModuleJinHuoD(FJinHuoDFrame) do
//    begin
//      if DanWeiEdt.Enabled then
//
//      DanWeiEdt.SetFocus;
//    end;
//  end;
end;

procedure TFrmMain.scGPGlyphButton7MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Callout.PopupControl := ChuKuMenuPnl;
  Callout.Popup(scGPGlyphButton7, GetRect(scGPGlyphButton7.ClientRect));
end;

procedure TFrmMain.scGPGlyphButton7MouseEnter(Sender: TObject);
begin
  Callout.PopupControl := ChuKuMenuPnl;
  Callout.Popup(scGPGlyphButton7, GetRect(scGPGlyphButton7.ClientRect));
end;

procedure TFrmMain.scGPGlyphButton8Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmMain.scGPGlyphButton9Click(Sender: TObject);
begin
  CallModule('ShangPinList', '商品列表', 3, False);
end;

procedure TFrmMain.MainTileLabClick(Sender: TObject);
begin
  UWPInfoMessage('提示', '基于StyleControl+DEV开发');
end;

procedure TFrmMain.scStyledForm1DWMClientMaximize(Sender: TObject);
begin
  MaxButton.GlyphOptions.Index := 722; // scgpbgkRestore;
  scGPSizeBox1.Visible := False;
  BorderPanel.Sizeable := False;
end;

procedure TFrmMain.scStyledForm1DWMClientRestore(Sender: TObject);
begin
  MaxButton.GlyphOptions.Index := 720; // scgpbgkMaximize;
  scGPSizeBox1.Visible := True;
  BorderPanel.Sizeable := True;
end;

procedure TFrmMain.SetBestSize;
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

procedure TFrmMain.Timer1Timer(Sender: TObject);
begin

//  Timer1.Enabled := False;
//   FormStyle := fsNormal;
//  UWPInfoMessage('提示', '特别说明：目前版本为1.0版本，其它细节功能根据需要再版本迭代');
end;

procedure TFrmMain.TimeTimerTimer(Sender: TObject);
begin
  DateLab.Caption := FormatDateTime('YYYY年mm月dd日', Now);
//  TimeLab.Caption := FormatDateTime('DDDD   hh时nn分', Now);
end;

procedure TFrmMain.VMsgLoadJinHuoDProc(Sender: TObject; AMsg: TVMsg);
var
  vMsg:TLoadJinHuoDMsg;
begin
   vMsg :=  TLoadJinHuoDMsg(AMsg);
   FJinHuoDFrame := CallModule('JinHuoD', '进货单', 3, False);
    if FJinHuoDFrame <> nil then
  begin
    with TfraModuleJinHuoD(FJinHuoDFrame) do
    begin
      LoadJinHuoDById(vMsg.DanJvId);
    end;
  end;

end;

procedure TFrmMain.VMsgNewJinHuoDProc(Sender: TObject; AMsg: TVMsg);
begin
    FJinHuoDFrame := CallModule('JinHuoD', '进货单', 3, False);
  if FJinHuoDFrame <> nil then
  begin
    with TfraModuleJinHuoD(FJinHuoDFrame) do
    begin
      initNewDanJv;
      DanWeiEdt.SetFocus;
    end;
  end;
end;

procedure TFrmMain.VMsgUpdateAppColor(Sender: TObject; AMsg: TVMsg);
var
  i: Integer;
begin
  if not (AMsg is TUpdateAppColorMsg) then
    exit;
  if AppColor.IsUseColorSkin = False then
    Exit;
  with AppColor do
  begin
    ClientPnl.FillColor := MainMenuBtn.NormalColor;
    BorderPanel.FillColor := MainMenuBtn.NormalColor;
    BorderPanel.FillColor2 := MainMenuBtn.NormalColor;
    MainTileLab.Font.Color := MainTileColor;
  //处理二级菜单边框
    Callout.BorderColor := MainMenuBtn.PressedColor;
    Callout.Color := MainMenuBtn.PressedColor;

    for i := 0 to self.ComponentCount - 1 do
    begin
      //TMyscGPButton
      if Self.Components[i] is TscGPCharGlyphButton then
      begin
        with Self.Components[i] as TscGPCharGlyphButton do
        begin
          if HelpKeyword <> 'NoSkin' then
          begin
            if HelpKeyword.Equals('MainMenuBtn') then    //主菜单按钮
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
            else if HelpKeyword.Equals('WarningBtn') then   //警示按钮
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
            else if HelpKeyword.Equals('InfoBtn') then   //信息按钮
            begin
              with InfoBtn do
              begin
                Options.NormalColor := NormalColor;
                Options.PressedColor := PressedColor;
                Options.HotColor := HotColor;
              end;
            end
            else if HelpKeyword.Equals('InfoBtn2') then   //信息按钮 朴素
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
      //TMyscGPEdit
if Self.Components[i] is TscGPEdit then
      begin
        with Self.Components[i] as TscGPEdit do
        begin
          if HelpKeyword <> 'NoSkin' then
          begin
            if HelpKeyword.Equals('PrimaryEdt') then    //主要
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

      end  //TscGridPanel
      else if Self.Components[i] is TscGridPanel then
      begin
        with Self.Components[i] as TscGridPanel do
        begin
          if HelpKeyword = 'NoSkin' then
            exit;
          if HelpKeyword.Equals('GridHead') then    //主要
          begin
            Color := GridHeadPanel.NormalColor;

          end;

        end;

      end      //TscLabel
      else if Self.Components[i] is TscLabel then
      begin
        with Self.Components[i] as TscLabel do
        begin
          if HelpKeyword = 'NoSkin' then
            exit;
          if HelpKeyword.Equals('GridHead') then
          begin
            Color := GridHeadPanel.NormalColor;
            Font.Color := GridHeadPanel.FontColor;
            ;
          end;

        end;

      end  //Tscgppanel
      else if Self.Components[i] is Tscgppanel then
      begin
        with Self.Components[i] as Tscgppanel do
        begin
          if HelpKeyword = 'NoSkin' then
            exit;
          if HelpKeyword.Equals('SecondMenuPnl') then  //二级菜单
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

