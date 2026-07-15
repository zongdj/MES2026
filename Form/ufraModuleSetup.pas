unit ufraModuleSetup;


interface

uses
  DMUnt, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  ufraModuleBase, System.Actions, Vcl.ActnList, scControls, scGPControls,
  scGPPagers, scModernControls, scGPExtControls, Vcl.Mask, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxTextEdit,
  cxImageComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Stan.Async, FireDAC.DApt, cxClasses,
  FireDAC.Comp.Client, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, scGPImages,

  System.ImageList, Vcl.ImgList, FireDAC.Comp.DataSet,
  Vcl.StdCtrls, cxCalendar, scExtControls, scGPFontControls, dxColorEdit,
  cxImageList, dxSkinOffice2010Silver, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  cxCustomData, cxFilter, cxData,   FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  dxSkiniMaginary, cxDataControllerConditionalFormattingRulesManagerDialog,
  Vcl.ExtCtrls ,SysUserUnt, cxContainer,
  dxSkinXmas2008Blue, cxMaskEdit, cxDropDownEdit, hsFrameUnt, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2013DarkGray,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, LanguageManager;

type
  TfraModuleSetup = class(TfraModuleBase)
    scGPPanel1: TscGPPanel;
    scGPLabel4: TscGPLabel;
    scGPLabel2: TscGPLabel;
    scGPPageControl1: TscGPPageControl;
    scGPPageControlPage2: TscGPPageControlPage;
    scGPPanel4: TscGPPanel;
    scGPPanel7: TscGPPanel;
    scGPButton2: TscGPButton;
    scGPLabel20: TscGPLabel;
    edtMacNo: TscGPEdit;
    scGPButton12: TscGPButton;
    scGPLabel21: TscGPLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    StyleOdd: TcxStyle;
    cxImageList1: TcxImageList;
    scGPButton6: TscGPButton;
    scGPLabel1: TscGPLabel;
    edtWorkcenter: TscGPEdit;
    cbbWorkingProcedureName: TscGPComboBox;
    lbl1: TscGPLabel;
    lbl2: TscGPLabel;
    cbbMachineProcedureName: TscGPComboBox;
    edtcycle: TscGPSpinEdit;
    scGPLabel19: TscGPLabel;
    swtchGatherOn: TscGPToggleSwitch;
    scGPPanel2: TscGPPanel;
    scGPPanel3: TscGPPanel;
    scGPLabel3: TscGPLabel;
    scGPLabel5: TscGPLabel;
    edtDQchangdu1: TscGPEdit;
    scGPLabel6: TscGPLabel;
    scGPLabel7: TscGPLabel;
    edtnSpeed1: TscGPEdit;
    scGPLabel8: TscGPLabel;
    scGPLabel9: TscGPLabel;
    scGPLabel10: TscGPLabel;
    scGPLabel11: TscGPLabel;
    edtnTouofen1: TscGPEdit;
    lbl4: TscGPLabel;
    edtnSDchangdu1: TscGPEdit;
    edtnSDsudu1: TscGPEdit;
    edtnDQmidu1: TscGPEdit;
    edtnDTshu1: TscGPEdit;
    edtnDTlv1: TscGPEdit;
    btn1: TscGPButton;
    edtDQchangdu2: TscGPEdit;
    edtnSpeed2: TscGPEdit;
    edtnTouofen2: TscGPEdit;
    edtnSDchangdu2: TscGPEdit;
    edtnSDsudu2: TscGPEdit;
    edtnDQmidu2: TscGPEdit;
    edtnDTshu2: TscGPEdit;
    edtnDTlv2: TscGPEdit;
    edtDQchangdu3: TscGPEdit;
    edtnSpeed3: TscGPEdit;
    edtnTouofen3: TscGPEdit;
    edtnSDchangdu3: TscGPEdit;
    edtnSDsudu3: TscGPEdit;
    edtnDQmidu3: TscGPEdit;
    edtnDTshu3: TscGPEdit;
    edtnDTlv3: TscGPEdit;
    btn2: TscGPButton;
    btn3: TscGPButton;
    tmrtest: TTimer;
    btnStart: TscGPButton;
    btnStop: TscGPButton;
    rfMachine: TFDMemTable;
    lbl5: TscGPLabel;
    pnl1: TscGPPanel;
    pnl2: TscGPPanel;
    lbl7: TscGPLabel;
    cbbLanguage: TcxComboBox;
    lbl6: TscGPLabel;
    procedure scGPButton2Click(Sender: TObject);
    procedure tmrtestTimer(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
  private
    { Private declarations }
    FBusy:Boolean;
    procedure PopulateLanguage;
    procedure cbbLanguagePropertiesChange(Sender: TObject);
  public
    procedure InitModuleLayout; override;
    procedure GetData; override;
    procedure CloseData; override;
    procedure LockChangeEvent(lType: Integer = 1); override;
    // 创建与销毁
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CloseModule;
  end;

var
  fraModuleSetup: TfraModuleSetup;

implementation

{$R *.dfm}

{ TfraModuleSetup }
uses MainUnt, MessageUnit, clDBUtilUnt;

procedure TfraModuleSetup.btnStartClick(Sender: TObject);
begin
  tmrtest.Interval:=StrToInt(edtcycle.EditText);
  tmrtest.Enabled:=True;
  btnStart.Enabled:=False;
  btnStop.Enabled:=True;
end;


procedure TfraModuleSetup.btnStopClick(Sender: TObject);
begin
  inherited;
  tmrtest.Enabled:=False;
  btnStart.Enabled:=True;
  btnStop.Enabled:=False;
end;

procedure TfraModuleSetup.CloseData;
begin
  inherited;
end;

procedure TfraModuleSetup.CloseModule;
begin
end;

constructor TfraModuleSetup.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TfraModuleSetup.Destroy;
begin
  inherited;
end;

procedure TfraModuleSetup.GetData;
begin
  edtMacNo.Text:=DM.sMacNo;
  edtWorkcenter.Text:=DM.LocalWorkCenter;
  cbbWorkingProcedureName.ItemIndex:= cbbWorkingProcedureName.IndexOfDetail(DM.sWorkingProcedureName);
  cbbMachineProcedureName.ItemIndex:= cbbMachineProcedureName.IndexOfDetail(DM.sMachineProcedureName);
  if DM.GatherOn.IsEmpty then
    DM.GatherOn:='false';
  if StrToBool(DM.GatherOn) then
    swtchGatherOn.State:=scswOn
  else swtchGatherOn.State:=scswOff;
  if DM.Cycle.IsEmpty then
    DM.Cycle:='5';
  edtcycle.Text:=DM.Cycle;

  PopulateLanguage;

  // Restore combo from stored language (0/1/2; legacy 5 = Vietnamese)
  cbbLanguage.ItemIndex := cbbLanguage.Properties.Items.IndexOf(
    IntToStr(UiLanguageToStored(ResolveUiLanguage(Integer(FSysUser.LanguageType)))));
  cbbLanguage.Properties.OnChange := Self.cbbLanguagePropertiesChange;

  // 静态标签按当前语言刷新（不覆盖运行中业务数据）
  TranslateFormLanguage(Self);
end;

procedure TfraModuleSetup.PopulateLanguage;
var
  lt: TiLanguageType;
begin
  cbbLanguage.Properties.DisplayItems.BeginUpdate;
  cbbLanguage.Properties.Items.BeginUpdate;
  try
    cbbLanguage.Properties.DisplayItems.Clear;
    cbbLanguage.Properties.Items.Clear;
    for lt := Low(TiLanguageType) to High(TiLanguageType) do
    begin
      cbbLanguage.Properties.DisplayItems.Add(siLanguageCaption[lt]);
      // 下拉存 0/1/2，与 ResolveUiLanguage / FormatLanguage 一致
      cbbLanguage.Properties.Items.Add(IntToStr(UiLanguageToStored(lt)));
    end;
  finally
    cbbLanguage.Properties.DisplayItems.EndUpdate;
    cbbLanguage.Properties.Items.EndUpdate;
  end;
end;

procedure TfraModuleSetup.cbbLanguagePropertiesChange(Sender: TObject);
const
  sSql: string = 'UPDATE smUser set iLanguageType = :iLanguageType ' + ' where sUserID = :sUserID ';
var
  UiLang: TiLanguageType;
  Stored: Integer;
begin
  if cbbLanguage.ItemIndex >= 0 then
  begin
    UiLang := ResolveUiLanguage(StrToIntDef(VarToStr(cbbLanguage.EditValue), 0));
    Stored := UiLanguageToStored(UiLang);
    FSysUser.LanguageType := TLanguageType(Stored);
    DM.WriteDefaultLanguageToIni(FSysUser.LanguageType);
    if FSysUser.UserNo <> '' then
      MainForm.DBManager.executeSql(sSql, [Stored, FSysUser.UserNo]);
    MainForm.FormatLanguage;
  end;
end;

procedure TfraModuleSetup.InitModuleLayout;
begin
  inherited;
end;

procedure TfraModuleSetup.LockChangeEvent(lType: Integer);
begin
  inherited;
end;

procedure TfraModuleSetup.scGPButton2Click(Sender: TObject);
begin
  inherited;
  DM.WriteParamToInit('LocalMacNo',edtMacNo.Text);
  DM.WriteParamToInit('LocalWorkCenter',edtWorkcenter.Text);
  DM.WriteParamToInit('LocalWorkingProcedureName',cbbWorkingProcedureName.Items[cbbWorkingProcedureName.ItemIndex].Caption);
  DM.WriteParamToInit('LocalMachineProcedureName',cbbMachineProcedureName.Items[cbbMachineProcedureName.ItemIndex].Caption);
  DM.WriteParamToInit('LocalGatherOn',BoolToStr(swtchGatherOn.State=scswOn));
  DM.WriteParamToInit('LocalCycle',edtcycle.Text);

  DM.sMacNo:= edtMacNo.Text;
  DM.LocalWorkCenter:=edtWorkcenter.Text;
  DM.sWorkingProcedureName:=cbbWorkingProcedureName.Items[cbbWorkingProcedureName.ItemIndex].Caption;
  DM.sMachineProcedureName:=cbbMachineProcedureName.Items[cbbMachineProcedureName.ItemIndex].Caption;
  DM.GatherOn:=BoolToStr((swtchGatherOn.State=scswOn));
  DM.Cycle:= edtcycle.Text;
  // 提示 / 设置完成 直接写中文，勿转码
  UWPInfoMessage('提示', '设置完成');
end;


procedure TfraModuleSetup.tmrtestTimer(Sender: TObject);
begin
  if FBusy then
   Exit;
   FBusy:=True;
  try
    rfMachine.Query('SELECT * FROM dbo.MacGather WITH(NOLOCK)');
    if not rfMachine.IsEmpty then
    begin
      if rfMachine.Locate('sMacNo','0001') then
      begin
        edtDQchangdu1.Text:= rfMachine.FieldByName('nOutPut').AsVariant;
        edtnSpeed1.Text:= rfMachine.FieldByName('nSpeed').AsVariant;
        edtnTouofen1.Text:= rfMachine.FieldByName('nTfen').AsVariant;
        edtnSDchangdu1.Text:= rfMachine.FieldByName('nSDchangdu').AsVariant;
        edtnSDsudu1.Text:= rfMachine.FieldByName('nSDsudu').AsVariant;
        edtnDQmidu1.Text:= rfMachine.FieldByName('nDQmidu').AsVariant;
        edtnDTshu1.Text:= rfMachine.FieldByName('nDTshu').AsVariant;
        edtnDTlv1.Text:= rfMachine.FieldByName('nDTlv').AsVariant;
      end;
      if rfMachine.Locate('sMacNo','0002') then
      begin
        edtDQchangdu2.Text:= rfMachine.FieldByName('nOutPut').AsVariant;
        edtnSpeed2.Text:= rfMachine.FieldByName('nSpeed').AsVariant;
        edtnTouofen2.Text:= rfMachine.FieldByName('nTfen').AsVariant;
        edtnSDchangdu2.Text:= rfMachine.FieldByName('nSDchangdu').AsVariant;
        edtnSDsudu2.Text:= rfMachine.FieldByName('nSDsudu').AsVariant;
        edtnDQmidu2.Text:= rfMachine.FieldByName('nDQmidu').AsVariant;
        edtnDTshu2.Text:= rfMachine.FieldByName('nDTshu').AsVariant;
        edtnDTlv2.Text:= rfMachine.FieldByName('nDTlv').AsVariant;
      end;
      if rfMachine.Locate('sMacNo','0003') then
      begin
        edtDQchangdu3.Text:= rfMachine.FieldByName('nOutPut').AsVariant;
        edtnSpeed3.Text:= rfMachine.FieldByName('nSpeed').AsVariant;
        edtnTouofen3.Text:= rfMachine.FieldByName('nTfen').AsVariant;
        edtnSDchangdu3.Text:= rfMachine.FieldByName('nSDchangdu').AsVariant;
        edtnSDsudu3.Text:= rfMachine.FieldByName('nSDsudu').AsVariant;
        edtnDQmidu3.Text:= rfMachine.FieldByName('nDQmidu').AsVariant;
        edtnDTshu3.Text:= rfMachine.FieldByName('nDTshu').AsVariant;
        edtnDTlv3.Text:= rfMachine.FieldByName('nDTlv').AsVariant;
      end;

    end;
  finally
    FBusy:=False;
  end;

end;

initialization
  RegisterClass(TfraModuleSetup);

end.

