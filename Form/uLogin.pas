unit uLogin;

interface

uses
  DMUnt, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkiniMaginary, scGPControls, dxImageSlider, scControls, scGPExtControls,
  dxGDIPlusClasses, Vcl.ExtCtrls, dxBarBuiltInMenu, cxPC, cxClasses,
  Vcl.ComCtrls, scExtControls, scAdvancedPager, Vcl.ActnMan, Vcl.ActnMenus,
  System.Actions, Vcl.ActnList, scStyledForm, System.ImageList, Vcl.ImgList,
  cxImageList, Vcl.StdCtrls, Vcl.Mask, dxSkinOffice2010Silver,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2013DarkGray, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, DateUtils, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, hsEditors, hsFrameUnt, SysUserUnt,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, LanguageManager;

type
  TLoginEvent = procedure(iCompanyID: integer; sUserNo, sPassword: string;
    bRememberPassword: Boolean ;bAutoLogo: Boolean ) of object;

type
  TFrmLogin = class(TForm)
    dxImageSlider1: TdxImageSlider;
    scGPPanel3: TscGPPanel;
    scGPPanel2: TscGPPanel;
    scGPGlyphButton1: TscGPGlyphButton;
    scGPGlyphButton3: TscGPGlyphButton;
    cxImageCollection1: TcxImageCollection;
    cxImageCollection1Item1: TcxImageCollectionItem;
    cxImageCollection1Item2: TcxImageCollectionItem;
    cxImageCollection1Item3: TcxImageCollectionItem;
    scAdvancedPager1: TscAdvancedPager;
    scAdvancedPagerPage2: TscAdvancedPagerPage;
    scAdvancedPagerPage1: TscAdvancedPagerPage;
    scGPPanel1: TscGPPanel;
    lblTitle: TscGPLabel;
    btnLoginOK: TscGPButton;
    scGPLabel3: TscGPLabel;
    chkRememberMe: TscGPCheckBox;
    chkAutoLogin: TscGPCheckBox;
    scGPPanel4: TscGPPanel;
    scGPLabel7: TscGPLabel;
    scGPEdit3: TscGPEdit;
    scGPEdit4: TscGPEdit;
    scGPButton2: TscGPButton;
    scGPEdit5: TscGPEdit;
    cxImageList1: TcxImageList;
    Timer1: TTimer;
    c: TscStyledForm;
    PassWordPnl: TscGPPanel;
    scGPButton3: TscGPButton;
    scGPLabel8: TscGPLabel;
    tmrAutoClick: TTimer;
    pnlCompany: TscGPPanel;
    btn1: TscGPButton;
    cbbCompany: ThsComboBox;
    edtPassword: TcxTextEdit;
    pnlUserNo: TscGPPanel;
    btn2: TscGPButton;
    edtUserNo: TcxTextEdit;
    procedure scGPGlyphButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLoginOKClick(Sender: TObject);
    procedure scGPLabel4Click(Sender: TObject);
    procedure scGPButton2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure scGPGlyphButton3Click(Sender: TObject);
    procedure tmrAutoClickTimer(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  private
    { Private declarations }
    FLoginFilterCompany: Boolean;
    FOnLogin: TLoginEvent;
    FDefaultCompanyID: integer;
    FLanguageType: TLanguageType;
    procedure UpdateAppColorSkin;
    function GetUserNo(bCheckExist: Boolean): string;
    procedure InitConfig;
    procedure edtUserNoExit(Sender: TObject);
    procedure RefreshCompany;
  public
    procedure Restore;
    property OnLogin: TLoginEvent read FOnLogin write FOnLogin;
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses FrameCommonUnt, MainUnt, clDBUtilUnt, SFUnt;

procedure TFrmLogin.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.WndParent := GetDesktopWindow;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  scAdvancedPager1.TabHeight := 0;
  scAdvancedPager1.ActivePage := scAdvancedPagerPage1;
  UpdateAppColorSkin;
  Restore;
end;

procedure TFrmLogin.Restore;
var
  sDefaultUser, sDefaultPassword, sParamName, s: string;
  bRememberPassword, bAutoLogo: Boolean;
begin
  sDefaultUser := '';
  dm.ReadDefaultUserFromIni(sDefaultUser, FLanguageType, FDefaultCompanyID,
    sDefaultPassword, bRememberPassword, bAutoLogo);

  FSysUser.LanguageType := FLanguageType; // 先设置为默认的
  edtUserNo.Text := sDefaultUser;
  edtPassword.Text := sDefaultPassword;
  chkAutoLogin.Checked:=bAutoLogo;
  chkRememberMe.Checked := bRememberPassword;
  InitConfig;
end;

procedure TFrmLogin.edtUserNoExit(Sender: TObject);
begin
  RefreshCompany;
end;

procedure TFrmLogin.InitConfig;
var
  sParam, sValue: string;
begin
//  FLoginFilterCompany := StringToBoolean(sValue);
//  if FLoginFilterCompany then
//    edtUserNo.OnExit := edtUserNoExit
//  else
//    edtUserNo.OnExit := nil;
  RefreshCompany;
  self.tmrAutoClick.Enabled:=True;
end;

procedure TFrmLogin.RefreshCompany;
const
  sSqlText: string = 'SELECT B.iCompanyID,B.sCompanyName ' +
    'FROM smLocalCompany B WITH(NOLOCK) ' + 'WHERE (%s) AND B.bUsable = 1 ' +
    'ORDER BY B.iCompanyID ';
var
  sUserNo, sCondition, sValue: string;
  iIndex: integer;
begin
  if FLoginFilterCompany then
  begin
    sUserNo := GetUserNo(False);
    if sUserNo <> '' then
      sCondition := 'iCompanyID IN (SELECT iCompanyID ' +
        'FROM smUserCompany A WITH(NOLOCK) ' + 'WHERE A.sUserID=N' +
        QuotedStr(sUserNo) + ')'
    else
      sCondition := '';
  end
  else
    sCondition := '1=1';
  iIndex := cbbCompany.ItemIndex;
  if iIndex >= 0 then
    sValue := cbbCompany.Properties.Items[iIndex]
  else
    sValue := '';
  if sCondition = '' then
  begin
    cbbCompany.ItemIndex := -1;
    cbbCompany.Properties.Items.Clear;
    cbbCompany.Properties.DisplayItems.Clear;
  end
  else
  begin
     dm.FillStringsFromSql(cbbCompany.Properties.Items, cbbCompany.Properties.DisplayItems, Format(sSqlText, [sCondition]), []);
    if cbbCompany.Properties.Items.Count > 0 then
    begin
      iIndex := -1;
      if sValue <> '' then
        iIndex := cbbCompany.Properties.Items.IndexOf(sValue);
      if (iIndex = -1) and (FDefaultCompanyID > 0) then
        iIndex := cbbCompany.Properties.Items.IndexOf
          (IntToStr(FDefaultCompanyID));
      if iIndex = -1 then
        iIndex := 0;
      cbbCompany.ItemIndex := iIndex;
    end;
  end;
end;

procedure TFrmLogin.btnLoginOKClick(Sender: TObject);
var
  dNow, dSysDate: TDateTime;
begin
  tmrAutoClick.Enabled := False; // 防止重复调用

  edtPassword.PostEditValue;

  dNow := Now;
  dSysDate := SF.DBManager.GetSystemDateTime;

  if (MinutesBetween(dNow, dSysDate) > 5) and not dm.bDisableCheckLocalTime then
  begin
    SystemError('服务器时间和本地时间不一致，请调整！'#13#10'服务器时间：' +
      FormatDateTime('yyyy-MM-dd HH:nn:ss', dSysDate) + #13#10'本地　时间：' +
      FormatDateTime('yyyy-MM-dd HH:nn:ss', dNow));
  end;

  if VarToStr(cbbCompany.EditValue).IsEmpty then
  begin
    hsFrame.MessageBox('请选择公司！', '提示', MB_ICONINFORMATION);
    self.cbbCompany.SetFocus;
    Exit;
  end;

  if VarToStr(self.edtUserNo.EditValue).IsEmpty then
  begin
    hsFrame.MessageBox('请输入用户名！', '提示', MB_ICONINFORMATION);
    self.edtUserNo.SetFocus;
    Exit;
  end;

{$IFDEF Release}
  if VarToStr(edtPassword.EditValue).IsEmpty then
  begin
    hsFrame.MessageBox('请输入密码！', '提示', MB_ICONINFORMATION);
    self.edtPassword.SetFocus;
    Exit;
  end;
{$ENDIF}
  if Assigned(FOnLogin) then
  begin
    FOnLogin(StrToIntDef(VarToStr(self.cbbCompany.EditValue), 0),
      GetUserNo(True), VarToStr(self.edtPassword.EditValue),
      self.chkRememberMe.Checked, chkAutoLogin.Checked);
  end;

end;

function TFrmLogin.GetUserNo(bCheckExist: Boolean): string;
const
  sSql: string = 'DECLARE @sUserId NVARCHAR(50)=:sUserId '#13#10 +
    ' SELECT TOP 1 sUserID ' + ' FROM dbo.smUser A WITH(NOLOCK) ' +
    ' WHERE (sUserID = @sUserID OR sMobileNo = @sUserID OR sEmployeeNo = @sUserID) '
    + ' AND bUsable = 1 '#13#10 +
    ' ORDER BY CASE WHEN sUserID = @sUserID THEN 1 ELSE 2 END ';
var
  s: string;
  qry: TFDMemTable;
begin
  Result := Trim(edtUserNo.Text);
  if Result = '' then
    Exit;
  try
    qry:=TFDMemTable.Create(nil);
    qry.Query(sSql, [Result]);
    if not qry.IsEmpty then
      s := qry.FieldByName('sUserID').AsString;
  finally
    qry.Free;
  end;
  if s <> '' then
    Result := s
  else if bCheckExist then
    Result := '';
end;

procedure TFrmLogin.scGPButton2Click(Sender: TObject);
begin
  scAdvancedPager1.ActivePage := scAdvancedPagerPage1;
end;

procedure TFrmLogin.scGPGlyphButton1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmLogin.scGPGlyphButton3Click(Sender: TObject);
begin
  OpenUrl('http://')
end;

procedure TFrmLogin.scGPLabel4Click(Sender: TObject);
begin
  scAdvancedPager1.ActivePage := scAdvancedPagerPage2;
end;

procedure TFrmLogin.Timer1Timer(Sender: TObject);
begin
  if dxImageSlider1.CanGoToNextImage then
    dxImageSlider1.GoToNextImage
  else
    dxImageSlider1.GoToImage(0);
end;

procedure TFrmLogin.tmrAutoClickTimer(Sender: TObject);
begin
  tmrAutoClick.Enabled := False;
  if chkRememberMe.Checked and (edtPassword.Text <> '') and chkAutoLogin.Checked
  then
    btnLoginOK.ButtonClick;
end;

procedure TFrmLogin.UpdateAppColorSkin;
begin
  if AppColor.IsUseColorSkin then
  begin
//    edtUserNo.Options.FrameNormalColor := AppColor.PrimaryColor;
//    edtUserNo.Options.FrameHotColor := AppColor.PrimaryColor;
//    edtUserNo.Options.FrameFocusedColor := AppColor.PrimaryColor;
    // UserEdt.LeftButton.GlyphColor :=AppColor.PrimaryColor;
    pnlCompany.FrameColor := AppColor.PrimaryColor;
    PassWordPnl.FrameColor := AppColor.PrimaryColor;
    pnlUserNo.FrameColor := AppColor.PrimaryColor;
    lblTitle.Font.Color := AppColor.PrimaryColor;

    with btnLoginOK, AppColor.PrimaryBtn do
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

end.
