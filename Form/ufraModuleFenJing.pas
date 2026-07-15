unit ufraModuleFenJing;

interface

uses
  DMUnt, VMsgMonitor,
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, ufraModuleBase, System.Actions, Vcl.ActnList, scControls,
  scGPControls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, cxCalendar, cxTextEdit, cxCalc, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, scModernControls, scGPExtControls,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.StorageBin, FireDAC.Comp.Client, FireDAC.Stan.Async,
  FireDAC.DApt,
  scGPDBControls,

  FireDAC.Comp.DataSet, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Mask, scGPFontControls,
  cxImageList, dxSkinOffice2010Silver, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  cxCustomData, cxFilter, cxData,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, dxSkiniMaginary,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxImageComboBox,
  uFrmYarnListUnt, cxContainer,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, frxVariables, frxClass, frxDesgn,
  frxDBSet, hsReportControl, Vcl.ExtCtrls, cxMemo, cxDBEdit, hsEditors,
  dxGaugeQuantitativeScale, dxGaugeCircularScale, dxGaugeDBScale,
  dxGaugeCustomScale, dxGaugeDigitalScale, dxGaugeControl, MainUnt, ufrmOnWork,
  fmFenJingBeamListUnt, MessageUnit, System.StrUtils, LanguageManager;

type
  TfraModuleFenJing = class(TfraModuleBase)
    GridViewPnl: TscGPPanel;
    scGPPanel3: TscGPPanel;
    cxImageList3: TcxImageList;
    scGPPanel2: TscGPPanel;
    rfUser: TFDMemTable;
    ds: TDataSource;
    cxImageList1: TcxImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    StyleOdd: TcxStyle;
    cxStyle4: TcxStyle;
    scGPPanel1: TscGPPanel;
    scGPLabel2: TscGPLabel;
    scGPPanel12: TscGPPanel;
    lblFormCaption: TscGPLabel;
    rfYarn: TFDMemTable;
    dsYarn: TDataSource;
    scGPLabel4: TscGPLabel;
    scGPLabel9: TscGPLabel;
    pnlLeft: TscGPPanel;
    pnlTopYarn: TscGPPanel;
    scGPLabel21: TscGPLabel;
    edtSizingLotNo: TscGPEdit;
    scGPPanel15: TscGPPanel;
    scGPPanel4: TscGPPanel;
    btnDown: TscGPButton;
    btnUp: TscGPButton;
    lblWorkList: TscGPLabel;
    scGPLabel3: TscGPLabel;
    rfSQLEXEC: TFDMemTable;
    rfWorker: TFDMemTable;
    dsBeam: TDataSource;
    rfBeam: TFDMemTable;
    edtCurrsSizingLotNo: TscGPDBText;
    tmr: TTimer;
    rfMachine: TFDMemTable;
    dsMachine: TDataSource;
    scGPPanel6: TscGPPanel;
    scGPPanel7: TscGPPanel;
    scGPPanel8: TscGPPanel;
    btnFinishJob: TscGPButton;
    scgrdpnl1: TscGridPanel;
    lbl5: TscGPLabel;
    lbl6: TscGPLabel;
    lbl7: TscGPLabel;
    lbl8: TscGPLabel;
    lbl9: TscGPLabel;
    lbl10: TscGPLabel;
    lbl11: TscGPLabel;
    grd1: TcxGrid;
    grvOutPut: TcxGridDBTableView;
    colColumn1: TcxGridDBColumn;
    coliBeamNoIndex: TcxGridDBColumn;
    coliEnds: TcxGridDBColumn;
    colsFactBeamNo: TcxGridDBColumn;
    colColumn4: TcxGridDBColumn;
    coliStartLen: TcxGridDBColumn;
    coliEndLen: TcxGridDBColumn;
    colColumn3: TcxGridDBColumn;
    grl1: TcxGridLevel;
    scGPLabel5: TscGPLabel;
    ColDel: TcxGridDBColumn;
    rfOutPut: TFDMemTable;
    dsOutput: TDataSource;
    btnBG: TscGPButton;
    swtch1: TscGPToggleSwitch;
    rpt1: ThsReportControl;
    btnPrint: TscGPButton;
    rptBeam: ThsReportControl;
    dxgcntrl1: TdxGaugeControl;
    dxgcntrl1ContainerScale1: TdxGaugeContainerScale;
    gcnLength: TdxGaugeDigitalScale;
    dxgdgtlsclcptnLengthCaption1: TdxGaugeDigitalScaleCaption;
    dxgcntrl2: TdxGaugeControl;
    dxgcntrl2ContainerScale1: TdxGaugeContainerScale;
    gcnSpeed: TdxGaugeCircularScale;
    dxgcntrl2CircularScale1Caption1: TdxGaugeQuantitativeScaleCaption;
    scGPButton1: TscGPButton;
    coluGuid: TcxGridDBColumn;
    lbl4: TscGPLabel;
    lbl12: TscGPLabel;
    edtiOrderNo: TcxDBTextEdit;
    edtsBeamNo: TcxDBTextEdit;
    lbl2: TscGPLabel;
    lbl21: TscGPLabel;
    edtsFactBeamNo: TcxDBTextEdit;
    edtsArrangeNo: TcxDBTextEdit;
    lbl1: TscGPLabel;
    dxgcntrl3: TdxGaugeControl;
    dxgdbdgtlscliStartLen: TdxGaugeDBDigitalScale;
    btnAjustStart: TscGPButton;
    lbl13: TscGPLabel;
    dxgcntrl4: TdxGaugeControl;
    dxgdbdgtlscliEndLen: TdxGaugeDBDigitalScale;
    btnAjustEnd: TscGPButton;
    edtsSizingNo: TcxDBTextEdit;
    edtiSizingLen: TcxDBTextEdit;
    edtsBucketNo: TcxDBTextEdit;
    edtsShelfNo: TcxDBTextEdit;
    lbl22: TscGPLabel;
    lbl3: TscGPLabel;
    lbl14: TscGPLabel;
    lbl15: TscGPLabel;
    pnl4: TscGPPanel;
    btnWork: TscGPButton;
    procedure GridViewColumn2GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure GridViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure grvUserListCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure edtSizingLotNoKeyPress(Sender: TObject; var Key: Char);
    procedure edtSizingLotNoRightButtonClick(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure scGPButton4Click(Sender: TObject);
    procedure tmrTimer(Sender: TObject);
    procedure btnWorkClick(Sender: TObject);
    procedure grvOutPutMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnBGClick(Sender: TObject);
    procedure btnFinishJobClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure swtch1ChangeState(Sender: TObject);
    procedure dxgcntrl3KeyPress(Sender: TObject; var Key: Char);
    procedure btnAjustStartClick(Sender: TObject);
    procedure btnAjustEndClick(Sender: TObject);
    procedure rpt1GetReportSourceEvent(uReportFormatHdrGUID,
      uReportFormatDtlGUID: TGUID; sReportFormatName: string;
      var oReportSource: TRptDataSets);
    procedure btnPrintClick(Sender: TObject);
    procedure rptBeamGetReportSourceEvent(uReportFormatHdrGUID,
      uReportFormatDtlGUID: TGUID; sReportFormatName: string;
      var oReportSource: TRptDataSets);
    procedure scGPButton1Click(Sender: TObject);
  private
    FBusy: Boolean;
    FFrmOnWork: TfrmOnWork;
    procedure TextEditEnter(Sender: TObject);
    procedure OnWork;
    procedure RefreshButton;
    function GetEdidMode(iTag: Integer): Boolean;
    { Private declarations }
  protected
    procedure OnUpYarn(sYarnInfo, sSizingNo, sArrangeNo, uGuid, ummMaterialGUID,
      sYarnLot: string);
    procedure OnStartBeam(sSizingNo, sArrangeNo,
  uTaskGuid, sShelfNo, sBucketNo, sFactBeamNo ,sBeamNo: string; iOrderNo, iEnds, iSizingLen: Integer);
  public
    { Public declarations }
    FEditMode: Boolean;
    FAdd: Integer;
    FYarnList: TuFrmYarnList;
    FBeamList: TfmFenJingBeamList;
    FCurrYarn: TSelectYarnInfo;
    FCurrBeam: TSelectFenJingBeamInfo;
    procedure VMsgUpdateAppColor(Sender: TObject; AMsg: TVMsg); override;
    procedure InitModuleLayout; override;
    procedure GetData; override;
    procedure CloseData; override;
    procedure LockChangeEvent(lType: Integer = 1); override;
    procedure InitShortCut; override; // 初始化快捷键
    procedure SetDetailPrivilege; override;
    // 移除快捷键
    procedure RemoveShortCut; override;
    // 创建与销毁
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CloseModule;

  end;

var
  fraModuleFenJing: TfraModuleFenJing;

implementation

{$R *.dfm}

{ TfraModuleDingDan }
uses qmInputBoxFrm, clGuidUnt, clDBUtilUnt, SFUnt;

procedure TfraModuleFenJing.btnUpClick(Sender: TObject);
begin
  inherited;
  OnWork;
end;

procedure TfraModuleFenJing.OnWork;
begin
  if not Assigned(FFrmOnWork) then
    FFrmOnWork := TfrmOnWork.Create(nil);
  with FFrmOnWork do
  begin
    try
      MainForm.scStyledForm1.ShowClientInActiveEffect;
      ShowModal;
      if ModalResult = mrOk then
      begin
        DM.GroupNo := rfWork.FieldByName('sWorkerGroupNo').AsString;
        DM.GroupName := rfWork.FieldByName('sWorkerGroupName').AsString;
        DM.TurnName := rfWork.FieldByName('sTurnName').AsString;
        DM.WorkerList := clDBUtil.CommaText(FFrmOnWork.rfWork, 'sWorkerNo');
        DM.WorkerNameList := clDBUtil.CommaText(FFrmOnWork.rfWork,
          'sWorkerName');
        lblWorkList.Caption := DM.WorkerNameList;
        if not DM.WorkerNameList.IsEmpty then
        begin
          btnUp.Caption := Translate('已上班');
          btnUp.Font.Style := [fsBold, fsUnderline];
          btnDown.Caption := Translate('下班');
          btnDown.Font.Style := [fsBold];
        end;
      end;
    finally
      RefreshButton;
      MainForm.scStyledForm1.HideClientInActiveEffect;
    end;

  end;

end;

procedure TfraModuleFenJing.CloseData;
begin
  inherited;

end;

procedure TfraModuleFenJing.CloseModule;
begin

end;

constructor TfraModuleFenJing.Create(AOwner: TComponent);
begin
  inherited;
  Align := alClient;
  FCurrYarn := TSelectYarnInfo.Create;
  FCurrBeam := TSelectFenJingBeamInfo.Create;

  DM.sOutPutType := DM.sMachineProcedureName;
  Self.lblFormCaption.Caption := DM.sMachineProcedureName;
  FAdd := 0;

  if FYarnList = nil then
    FYarnList := TuFrmYarnList.Create(Self);
  if not Assigned(FFrmOnWork) then
    FFrmOnWork := TfrmOnWork.Create(nil);

end;

destructor TfraModuleFenJing.Destroy;
begin
  FreeAndNil(FCurrYarn);
  FreeAndNil(FCurrBeam);
  inherited;
end;

procedure TfraModuleFenJing.dxgcntrl3KeyPress(Sender: TObject; var Key: Char);
var
  iType: Integer;
  oEdit: TcxDBTextEdit;
  sValue, sFieldName: string;
  dValue: Double;
begin
  inherited;
  if not GetEdidMode(111) then
    Exit;

  if TfrmqmInputBox.GetInputInfo(Self, '请输入值', True, False, False, sValue,
    sValue) then
  begin
    if TryStrToFloat(sValue, dValue) then
    begin
      if not(rfOutPut.State in [dsEdit, dsInsert]) then
        rfOutPut.Edit;
      rfOutPut.FieldByName(sFieldName).AsVariant := sValue;
      rfOutPut.Post;
    end;
  end;

end;

procedure TfraModuleFenJing.GetData;
var
  sSQL, TaskGuid: string;
begin
  Self.lblFormCaption.Caption := sCaption;
  rfWorker.KeyFieldName := 'uGuid';
  rfWorker.TableName := 'ppOnWork';
  rfWorker.Query
    ('SELECT *, Del=cast(0 as int) FROM dbo.ppOnWork A WITH(NOLOCK) WHERE A.sMacNo=:sMacNo AND A.sType=:sOutPutType AND A.tOffWorkTime IS NULL',
    [DM.sMacNo, DM.sOutPutType]);
  if not rfWorker.IsEmpty then
  begin
    DM.GroupNo := rfWorker.FieldByName('sWorkerGroupNo').AsString;
    DM.GroupName := rfWorker.FieldByName('sWorkerGroupName').AsString;
    DM.TurnName := rfWorker.FieldByName('sTurnName').AsString;
    DM.WorkerList := clDBUtil.CommaText(rfWorker, 'sWorkerNo');
    DM.WorkerNameList := clDBUtil.CommaText(rfWorker, 'sWorkerName');
    lblWorkList.Caption := DM.WorkerNameList;
  end;

  rfBeam.KeyFieldName := 'uGuid';
  rfBeam.TableName := 'ppDropBeamJob';
  rfBeam.Query
    ('SELECT * FROM dbo.ppDropBeamJob A WITH(NOLOCK) WHERE A.sMacNo=:sMacNo AND A.sType=:sOutPutType AND A.bFinished =0 AND bCancel=0',
    [DM.sMacNo, DM.sOutPutType]);
  if not DM.WorkerList.IsEmpty then
  Begin
    btnUp.Caption := Translate('已上班');
    btnUp.Font.Style := [fsBold, fsUnderline];
  End;
  if not rfBeam.IsEmpty then
    TaskGuid := rfBeam.FieldByName('uGuid').AsString
  else
    TaskGuid := clGuid.Guid_Zero;

  rfOutPut.TableName := 'ppAppQzBeamInfo';
  rfOutPut.KeyFieldName := 'uGuid';
  rfOutPut.Query('SELECT A.*, bNew=cast(0 AS BIT), Del=CAST(1 AS int)' + #13#10
    + 'FROM dbo.ppAppQzBeamInfo A WITH(NOLOCK)' + #13#10 +
    'INNER JOIN dbo.ppDropBeamJob B WITH(NOLOCK) ON A.uTaskGuid=B.uGuid' +
    #13#10 + 'WHERE B.uGuid=:uGuid' + #13#10 +
    'ORDER BY tCreatetime ASC', [TaskGuid]);

  RefreshButton;
  if DM.GatherOn.IsEmpty then
    DM.GatherOn := 'False';
  Self.tmr.Enabled := StrToBool(DM.GatherOn);
  if DM.Cycle.IsEmpty then
    DM.Cycle := '5';
  tmr.Interval := StrToInt(DM.Cycle) * 1000;

  if StrToBool(DM.GatherOn) then
    swtch1.State := scswOn
  else
    swtch1.State := scswOff;
  TranslateFormLanguage(Self);

end;

procedure TfraModuleFenJing.GridViewColumn2GetDisplayText
  (Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  AText := (ARecord.Index + 1).ToString;
end;

procedure TfraModuleFenJing.GridViewCustomDrawCell
  (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if AViewInfo.Item.VisibleIndex = Sender.VisibleItemCount - 1 then
    AViewInfo.Borders := AViewInfo.Borders - [bRight];
end;

procedure TfraModuleFenJing.grvOutPutMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  AHitTest: TcxCustomGridHitTest;
  AView: TcxGridDBTableView;
begin
  AView := TcxGridDBTableView(((Sender as TcxGridSite).GridView));
  AHitTest := AView.ViewInfo.GetHitTest(X, Y);
  if AHitTest.HitTestCode <> htCell then
  begin
    Exit;
  end;

  if not rfOutPut.IsEmpty and not rfOutPut.FieldByName('bNew').AsBoolean then
  begin
    Exit;
  end;

  if TcxGridRecordCellHitTest(AHitTest).Item = ColDel then
  begin
    if UWPQuestionMessage('系统询问', '是否确认删除报工记录？') = 2 then
      Exit;
    if Self.rfOutPut.Active and not rfOutPut.IsEmpty and
      rfOutPut.FieldByName('bNew').AsBoolean then
    begin
      rfOutPut.Delete;
      btnBG.Caption := Translate('报工');
    end
    else
      raise Exception.Create('已报工数据不允许删除');
  end;
end;

procedure TfraModuleFenJing.grvUserListCustomDrawCell
  (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if AViewInfo.Item.VisibleIndex = Sender.VisibleItemCount - 1 then
    AViewInfo.Borders := AViewInfo.Borders - [bRight];
end;

procedure TfraModuleFenJing.InitModuleLayout;
begin
  inherited;

end;

procedure TfraModuleFenJing.InitShortCut;
begin
  inherited;
  if StrToBool(DM.DesignReport) then
    btnPrint.DropDownMenu := rptBeam.PopupMenu;
  if DM.UserId = 'cttsoft' then
    btnPrint.Visible := True
  else
    btnPrint.Visible := False;
  // edtiStartLen.OnEnter:= TextEditEnter;
  // edtiEndLen.OnEnter:= TextEditEnter;
end;

procedure TfraModuleFenJing.LockChangeEvent(lType: Integer);
begin
  inherited;
end;

procedure TfraModuleFenJing.OnStartBeam(sSizingNo, sArrangeNo,
  uTaskGuid, sShelfNo, sBucketNo, sFactBeamNo ,sBeamNo: string; iOrderNo, iEnds, iSizingLen: Integer);
begin
  if (rfBeam.Active and not rfBeam.IsEmpty) then
  begin
    UWPErrorMessage('系统提醒', '当前轴还未标识完成,请先确认完成任务后再操作');
    FCurrBeam.sSizingNo := rfBeam.FieldByName('sSizingNo').AsString;
    FCurrBeam.sArrangeNo := rfBeam.FieldByName('sArrangeNo').AsString;
    FCurrBeam.uTaskGuid:=rfBeam.FieldByName('uTaskGuid').AsString;
    FCurrBeam.iOrderNo := rfBeam.FieldByName('iOrderNo').AsInteger;
    FCurrBeam.iEnds := rfBeam.FieldByName('iEnds').AsInteger;
    FCurrBeam.iSizingLen := rfBeam.FieldByName('iSizingLen').AsInteger;
    FCurrBeam.sShelfNo:= rfBeam.GetFieldValueAsString('sShelfNo');
    FCurrBeam.sBucketNo:= rfBeam.GetFieldValueAsString('sBucketNo');
    FCurrBeam.sFactBeamNo:= rfBeam.GetFieldValueAsString('sFactBeamNo');
    FCurrBeam.sBeamNo:= rfBeam.GetFieldValueAsString('sBeamNo');
    FCurrBeam.iSizingLen:= rfBeam.GetFieldValueAsInteger('iSizingLen');
    Exit;
  end;

  rfBeam.UpdateOptions.UpdateTableName := 'ppDropBeamJob';
  rfBeam.UpdateOptions.KeyFields := 'uGuid';
  rfBeam.Query('select * FROM ppDropBeamJob with(nolock) WHERE 1=2 ', []);
  rfBeam.Append;
  rfBeam.FieldByName('uGuid').AsString := clGuid.NewGuidAsString;
  rfBeam.FieldByName('uTaskGuid').AsString := uTaskGuid;
  rfBeam.FieldByName('sMacNo').AsString := DM.sMacNo;
  rfBeam.FieldByName('sSizingNo').AsString := sSizingNo;
  rfBeam.FieldByName('sArrangeNo').AsString := sArrangeNo;
  rfBeam.FieldByName('sCreator').AsString := DM.WorkerList;
  rfBeam.FieldByName('tCreateTime').AsDateTime :=
    SF.DBManager.GetSystemDateTime;
  rfBeam.FieldByName('iOrderNo').AsInteger := iOrderNo;
  rfBeam.FieldByName('iEnds').AsInteger := iEnds;
  rfBeam.FieldByName('sType').AsString := DM.sOutPutType;
  rfBeam.FieldByName('iSizingLen').AsInteger := iSizingLen;
  rfBeam.FieldByName('sFactBeamNo').AsString := sFactBeamNo;
  rfBeam.FieldByName('sBeamNo').AsString := sBeamNo;

  rfBeam.FieldByName('sBucketNo').AsString := sBucketNo;
  rfBeam.FieldByName('sShelfNo').AsString := sShelfNo;

  rfBeam.Post;
  dsBeam.AutoEdit := True;
  FEditMode := True;
  RefreshButton;
end;

procedure TfraModuleFenJing.OnUpYarn(sYarnInfo, sSizingNo, sArrangeNo, uGuid,
  ummMaterialGUID, sYarnLot: string);
var
  i: Integer;
begin
  if (rfYarn.Active and not rfYarn.IsEmpty) then
  begin
    UWPErrorMessage('系统询问', '上次上纱还未用完,请先完成用纱进行上纱操作');
    FCurrYarn.sYarnInfo := rfYarn.FieldByName('sYarnInfo').AsString;
    FCurrYarn.sSizingNo := rfYarn.FieldByName('sSizingNo').AsString;
    FCurrYarn.sArrangeNo := rfYarn.FieldByName('sArrangeNo').AsString;
    FCurrYarn.uGuid := rfYarn.FieldByName('uGuid').AsString;
    FCurrYarn.sYarnLot := rfYarn.FieldByName('sYarnLot').AsString;
    FCurrYarn.ummMaterialGUID := rfYarn.FieldByName('ummMaterialGUID').AsString;
    Exit;
  end;

  rfYarn.Query('select * FROM ppHangingYarn with(nolock) WHERE 1=2 ', []);
  rfYarn.Append;
  rfYarn.FieldByName('uGuid').AsString := uGuid;
  rfYarn.FieldByName('sMacNo').AsString := DM.sMacNo;
  rfYarn.FieldByName('sYarnInfo').AsString := sYarnInfo;
  rfYarn.FieldByName('sSizingNo').AsString := sSizingNo;
  rfYarn.FieldByName('sArrangeNo').AsString := sArrangeNo;
  rfYarn.FieldByName('sCreator').AsString := DM.WorkerList;
  rfYarn.FieldByName('tCreateTime').AsDateTime :=
    SF.DBManager.GetSystemDateTime;
  rfYarn.FieldByName('ummMaterialGUID').AsString := ummMaterialGUID;
  rfYarn.FieldByName('sYarnLot').AsString := sYarnLot;
  rfYarn.Post;
  Self.FEditMode := True;
  RefreshButton;
end;

procedure TfraModuleFenJing.RefreshButton;
var
  bUp: Boolean;
begin
  bUp := not DM.WorkerList.IsEmpty;
  // btnYarnSave.Enabled:=rfYarn.Active and not rfYarn.IsEmpty and bUp;
  // dsYarn.AutoEdit:= btnYarnSave.Enabled;
  // //btnYarnSave.Caption:='修改上纱信息';
  // btnFinishedUp.Enabled:= btnYarnSave.Enabled ;
  btnFinishJob.Enabled := bUp and rfBeam.Active and not rfBeam.IsEmpty and
    rfOutPut.Active and (rfOutPut.RecordCount > 0) and
    (rfOutPut.ChangeCount = 0);
  btnWork.Enabled := bUp and rfBeam.Active and not rfBeam.IsEmpty;
  if btnWork.Enabled and not rfBeam.FieldByName('tStartTime').IsNull then
    btnWork.Caption := Translate('取消任务')
  else
    btnWork.Caption := Translate('开始任务');
  btnBG.Enabled := bUp and (btnWork.Caption = Translate('取消任务'));
  if rfOutPut.Active and not rfOutPut.IsEmpty and (rfOutPut.ChangeCount > 0)
  then
    btnBG.Caption := Translate('保存产量')
  else
    btnBG.Caption := Translate('报工');
  btnAjustStart.Enabled := GetEdidMode(311);
  btnAjustEnd.Enabled := GetEdidMode(311);
end;

function TfraModuleFenJing.GetEdidMode(iTag: Integer): Boolean;
var
  bEditMode: Boolean;
  bUp: Boolean;
begin
  bUp := not DM.WorkerList.IsEmpty;
  bEditMode := False;
  if iTag in [1, 2, 3] then
  begin
    bEditMode := Self.FEditMode and bUp;
  end
  else if iTag in [11, 21, 31] then
  begin
    bEditMode := (btnWork.Caption = Translate('开始任务')) and rfBeam.Active and
      not rfBeam.IsEmpty;
  end
  else if (iTag > 31) then
  begin
    bEditMode := btnBG.Enabled and (btnBG.Caption = Translate('保存产量')) and
      rfOutPut.Active and not rfOutPut.IsEmpty;
  end;
  Result := bEditMode;
end;

procedure TfraModuleFenJing.TextEditEnter(Sender: TObject);
var
  iType: Integer;
  oEdit: TcxDBTextEdit;
  sValue, sFieldName: string;
  dValue: Double;
begin

  pnlLeft.SetFocus;
  oEdit := TcxDBTextEdit(Sender);
  sFieldName := oEdit.CustomData;
  iType := oEdit.Tag;

  if not GetEdidMode(iType) then
    Exit;
  sValue := oEdit.Text;
  case iType of
    // 字符
    1, 11, 111:
      begin
        if TfrmqmInputBox.GetInputInfo(Self, '请输入值', False, False, False,
          sValue, sValue) then
        begin
          if iType = 1 then
          begin
            if not(rfYarn.State in [dsEdit, dsInsert]) then
              rfYarn.Edit;
            rfYarn.FieldByName(sFieldName).AsVariant := sValue;
            rfYarn.Post;
          end
          else if iType = 11 then
          begin
            if not(rfBeam.State in [dsEdit, dsInsert]) then
              rfBeam.Edit;
            rfBeam.FieldByName(sFieldName).AsVariant := sValue;
            rfBeam.Post;
          end
          else
          begin
            if not(rfOutPut.State in [dsEdit, dsInsert]) then
              rfOutPut.Edit;
            rfOutPut.FieldByName(sFieldName).AsVariant := sValue;
            rfOutPut.Post;
          end;

        end;
      end;
    // 数字
    2, 21, 211:
      begin
        if TfrmqmInputBox.GetInputInfo(Self, '请输入值', True, False, False, sValue,
          sValue) then
        begin
          if TryStrToFloat(sValue, dValue) then
          begin
            if iType = 2 then
            begin
              if not(rfYarn.State in [dsEdit, dsInsert]) then
                rfYarn.Edit;
              rfYarn.FieldByName(sFieldName).AsVariant := sValue;
              rfYarn.Post;
            end
            else if iType = 21 then
            begin
              if not(rfBeam.State in [dsEdit, dsInsert]) then
                rfBeam.Edit;
              rfBeam.FieldByName(sFieldName).AsVariant := sValue;
              rfBeam.Post;
            end
            else
            begin
              if not(rfOutPut.State in [dsEdit, dsInsert]) then
                rfOutPut.Edit;
              rfOutPut.FieldByName(sFieldName).AsVariant := sValue;
              rfOutPut.Post;
            end;
          end;
        end;
      end;
    // 可为空字符
    3, 31, 311:
      begin
        if TfrmqmInputBox.GetInputInfo(Self, '请输入值', False, True, False, sValue,
          sValue) then
        begin
          if iType = 3 then
          begin
            if not(rfYarn.State in [dsEdit, dsInsert]) then
              rfYarn.Edit;
            rfYarn.FieldByName(sFieldName).AsVariant := sValue;
            rfYarn.Post;
          end
          else if iType = 31 then
          begin
            if not(rfBeam.State in [dsEdit, dsInsert]) then
              rfBeam.Edit;
            rfBeam.FieldByName(sFieldName).AsVariant := sValue;
            rfBeam.Post;
          end
          else
          begin
            if not(rfOutPut.State in [dsEdit, dsInsert]) then
              rfOutPut.Edit;
            rfOutPut.FieldByName(sFieldName).AsVariant := sValue;
            rfOutPut.Post;
          end;
        end;
      end;
  end;
end;

procedure TfraModuleFenJing.tmrTimer(Sender: TObject);
begin
  inherited;
  if FBusy then
    Exit;
  FBusy := True;
  try
    rfMachine.Query('exec spppGetMachineRealTimeInfo :a,:b,:c',
      [DM.sMacNo, DM.sWorkingProcedureName, DM.sMachineProcedureName]);
    if not rfMachine.IsEmpty then
    begin
      gcnLength.Value := rfMachine.FieldByName('nOutPut').AsVariant;
      gcnSpeed.Value := rfMachine.FieldByName('nSpeed').AsVariant;
    end;
    if rfOutPut.Active and (rfOutPut.ChangeCount > 0) and not rfOutPut.IsEmpty
    then
    begin
      rfOutPut.Last;
      rfOutPut.Edit;
      rfOutPut.FieldByName('iEndLen').AsInteger :=
        rfMachine.FieldByName('nOutPut').AsInteger;
      rfOutPut.Post;
    end;
  finally
    FBusy := False;
  end;
end;

procedure TfraModuleFenJing.RemoveShortCut;
begin
  inherited;

end;

procedure TfraModuleFenJing.rpt1GetReportSourceEvent(uReportFormatHdrGUID,
  uReportFormatDtlGUID: TGUID; sReportFormatName: string;
  var oReportSource: TRptDataSets);
// var
// dataset:TFDMemTable;
begin
  inherited;
  // dataset:=TFDMemTable.Create(nil);
  // dataset.Data:=rfOutPut.Data;
  // oReportSource.Add('aaa',dataset);
end;

procedure TfraModuleFenJing.rptBeamGetReportSourceEvent(uReportFormatHdrGUID,
  uReportFormatDtlGUID: TGUID; sReportFormatName: string;
  var oReportSource: TRptDataSets);
begin
  inherited;
  oReportSource.Add('轴信息', clDBUtil.GetGridSelectedDataSet
    (grvOutPut.DataController, 'uGuid', True));
end;

procedure TfraModuleFenJing.btnFinishJobClick(Sender: TObject);
var
  SQL,TaskGuid:string;
begin
  if UWPQuestionMessage('系统询问', '是否确认完结在机任务？') = 2 then
    Exit;
  rfBeam.Edit;
  rfBeam.KeyFieldName := 'uGuid';
  rfBeam.TableName := 'ppDropBeamJob';
  rfBeam.FieldByName('bFinished').AsBoolean := True;
  rfBeam.FieldByName('tFinishedTime').AsDateTime :=
    SF.DBManager.GetSystemDateTime;
  rfBeam.FieldByName('sFinishedMan').AsString := DM.WorkerList;
  rfBeam.Post;

  SQL := 'EXEC dbo.spppQZFinsihOutput :sWorkingProcedureName,:sMachineProcedureName,:sPlanMachineNo,:sTaskNo,:uTaskGuid';
  DM.DBManager.SaveData([rfBeam], [], '', [], SQL,
    [DM.sWorkingProcedureName, DM.sMachineProcedureName, DM.sMacNo, '', rfBeam.GetFieldValueAsString('uGuid')], True);

  rfBeam.Query('SELECT A.* FROM dbo.ppDropBeamJob A WITH(NOLOCK) WHERE A.sMacNo=:sMacNo AND A.sType=:sOutPutType AND A.bFinished =0 AND bCancel=0 ',[DM.sMacNo, DM.sOutPutType]);

  if not rfBeam.IsEmpty then
    TaskGuid := rfBeam.FieldByName('uGuid').AsString
  else
    TaskGuid := clGuid.Guid_Zero;

  rfOutPut.Query('SELECT A.*, bNew=cast(0 AS BIT), Del=CAST(1 AS int)' + #13#10
    + 'FROM dbo.ppAppQzBeamInfo A WITH(NOLOCK)' + #13#10 +
    'INNER JOIN dbo.ppDropBeamJob B WITH(NOLOCK) ON A.uTaskGuid=B.uGuid' +
    #13#10 + 'WHERE B.uGuid=:uGuid' + #13#10 +
    'ORDER BY tCreatetime ASC', [TaskGuid]);

  UWPInfoMessage('系统提醒', '任务已完结');
  RefreshButton;
end;

procedure TfraModuleFenJing.btnPrintClick(Sender: TObject);
// var
// frxReport1: TfrxReport;
begin
  // frxDBDataset1.UserName:='frxDBDataset1';
  // frxDBDataset1.DataSet:=rfOutPut;
  // rpt.DataSet:=frxDBDataset1;
  /// /    rpt.Report.PrintOptions.Printer := '打印机名称';
  // rpt.LoadFromFile('C:\Users\Ives\Desktop\测试报表.fr3') ;
  /// /    rpt.ShowReport(True);
  // rpt.DesignReport;;
  Self.rptBeam.ReportPrint;
end;

procedure TfraModuleFenJing.btnAjustEndClick(Sender: TObject);
var
  iType: Integer;
  oEdit: TcxDBTextEdit;
  sValue, sFieldName: string;
  dValue: Double;
begin
  sValue := rfOutPut.FieldByName('iEndLen').AsString;
  if TfrmqmInputBox.GetInputInfo(Self, '请输调整的结束值', True, False, False, sValue,
    sValue) then
  begin
    if TryStrToFloat(sValue, dValue) then
    begin
      if not(rfOutPut.State in [dsEdit, dsInsert]) then
        rfOutPut.Edit;
      rfOutPut.FieldByName('iEndLen').AsVariant := sValue;
      rfOutPut.Post;
    end;
  end;
end;

procedure TfraModuleFenJing.btnAjustStartClick(Sender: TObject);
var
  iType: Integer;
  oEdit: TcxDBTextEdit;
  sValue, sFieldName: string;
  dValue: Double;
begin
  sValue := rfOutPut.FieldByName('iStartLen').AsString;
  if TfrmqmInputBox.GetInputInfo(Self, '请输调整的开始值', True, False, False, sValue,
    sValue) then
  begin
    if TryStrToFloat(sValue, dValue) then
    begin
      if not(rfOutPut.State in [dsEdit, dsInsert]) then
        rfOutPut.Edit;
      rfOutPut.FieldByName('iStartLen').AsVariant := sValue;
      rfOutPut.Post;
    end;
  end;
end;

procedure TfraModuleFenJing.scGPButton1Click(Sender: TObject);
begin
  Self.rptBeam.ReportPrint;
end;

procedure TfraModuleFenJing.scGPButton4Click(Sender: TObject);
begin
  inherited;
  if (rfBeam.State in [dsEdit, dsInsert]) then
    rfBeam.Post;
  DM.DBManager.SaveData([rfBeam]);
  UWPInfoMessage('系统提醒', '保存开机轴任务');
end;

procedure TfraModuleFenJing.btnWorkClick(Sender: TObject);
begin
  rfBeam.KeyFieldName := 'uGuid';
  rfBeam.TableName := 'ppDropBeamJob';
  if btnWork.Caption = Translate('开始任务') then
  begin
    if not(rfBeam.State in [dsEdit, dsInsert]) then
    begin
      rfBeam.Edit;
      rfBeam.FieldByName('tStartTime').AsDateTime :=
        SF.DBManager.GetSystemDateTime;
      rfBeam.Post;
    end;
    if rfBeam.FieldByName('sFactBeamNo').IsNull then
      raise Exception.Create('请先填写实际轴号,再开启任务');
    DM.DBManager.SaveData([rfBeam]);
    UWPInfoMessage('系统提醒', '已经成功开始任务');
    dsBeam.AutoEdit := False;
    btnWork.Caption := Translate('取消任务');
  end
  else
  begin
    if rfOutPut.Active and not rfOutPut.IsEmpty then
      raise Exception.Create('已经报工,不允许取消任务');
    if UWPQuestionMessage('系统询问', '是否确认取消在机任务？') = 2 then
      Exit;
    rfBeam.Edit;
    rfBeam.FieldByName('bCancel').AsBoolean := True;
    rfBeam.FieldByName('tCancelTime').AsDateTime :=
      SF.DBManager.GetSystemDateTime;
    rfBeam.FieldByName('sCancelMan').AsString := DM.WorkerList;
    rfBeam.Post;
    DM.DBManager.SaveData([rfBeam]);
    rfBeam.Query
      ('SELECT A.* FROM dbo.ppDropBeamJob A WITH(NOLOCK) WHERE A.sMacNo=:sMacNo AND A.sType=:sOutPutType AND A.bFinished =0 AND bCancel=0 ',
      [DM.sMacNo, DM.sOutPutType]);
    btnWork.Caption := Translate('开始任务');
  end;
  RefreshButton;
end;

procedure TfraModuleFenJing.btnBGClick(Sender: TObject);
var
  nLastValue: Variant;
  SQL, TaskGuid: string;
begin
  if (btnBG.Caption = Translate('报工')) then
  begin
    if not rfOutPut.Active then
      rfOutPut.Query
        ('select *, bNew=cast(0 AS BIT), Del=CAST(1 AS int)  from dbo.ppAppQzBeamInfo with(nolock) where 1=2',
        []);
    rfOutPut.Last;
    if not rfOutPut.IsEmpty then
    begin
      nLastValue := rfOutPut.FieldByName('iEndLen').AsVariant;
      // rfOutPut.Edit;
      // rfOutPut.FieldByName('iEndLen').AsInteger:= rfMachine.FieldByName('nOutPut').AsInteger;
      // rfOutPut.Post;
    end
    else
    begin
      if StrToBool(DM.GatherOn) then
        nLastValue := rfMachine.FieldByName('nOutPut').AsInteger
      else
        nLastValue := 0;
    end;
    rfOutPut.Append;
    rfOutPut.FieldByName('uGuid').AsString := clGuid.NewGuidAsString;
    rfOutPut.FieldByName('uTaskGuid').AsString :=
      rfBeam.FieldByName('uGuid').AsString;
    rfOutPut.FieldByName('sGroupNo').AsString := DM.GroupNo;
    rfOutPut.FieldByName('sGroupName').AsString := DM.GroupName;
    rfOutPut.FieldByName('sOperatorNo').AsString := DM.WorkerList;
    rfOutPut.FieldByName('sOperatorName').AsString := DM.WorkerNameList;
    rfOutPut.FieldByName('sClassNo').AsString := DM.TurnName;
    rfOutPut.FieldByName('iEnds').AsInteger := rfBeam.FieldByName('iEnds')
      .AsInteger;
    rfOutPut.FieldByName('sFactBeamNo').AsString :=
      rfBeam.FieldByName('sFactBeamNo').AsString;
    rfOutPut.FieldByName('iBeamNoIndex').AsInteger :=
      rfBeam.FieldByName('iOrderNo').AsInteger;
    rfOutPut.FieldByName('iStartLen').AsInteger := nLastValue;
    if StrToBool(DM.GatherOn) then
      rfOutPut.FieldByName('iEndLen').AsInteger :=
        rfMachine.FieldByName('nOutPut').AsInteger
    else
      rfOutPut.FieldByName('iEndLen').AsInteger := nLastValue;
    rfOutPut.FieldByName('bNew').AsBoolean := True;
    rfOutPut.FieldByName('sOperatorName').AsString := lblWorkList.Caption;
    rfOutPut.FieldByName('tCreatetime').AsDateTime :=
      SF.DBManager.GetSystemDateTime;
    rfOutPut.FieldByName('Del').AsInteger := 0;
    rfOutPut.FieldByName('sWorkingProcedureName').AsString :=
      DM.sWorkingProcedureName;
    rfOutPut.FieldByName('sMachineProcedureName').AsString :=
      DM.sMachineProcedureName;
    rfOutPut.FieldByName('sPlanMachineNo').AsString :=
      rfBeam.FieldByName('sMacNo').AsString;
    rfOutPut.FieldByName('sBeamNo').AsString :=
      rfBeam.FieldByName('sBeamNo').AsString;
    rfOutPut.FieldByName('sSizingLotNo').AsString :=
      rfBeam.FieldByName('sSizingNo').AsString;
    rfOutPut.FieldByName('sArrangeNo').AsString :=
      rfBeam.FieldByName('sArrangeNo').AsString;
    rfOutPut.Post;
    btnBG.Caption := Translate('保存产量');
  end
  else
  begin
    tmr.Enabled := False;
    try
      if rfOutPut.Active and not rfOutPut.IsEmpty and
        (rfOutPut.State in [dsEdit, dsInsert]) then
        rfOutPut.Post;
      if (rfOutPut.FieldByName('iStartLen').AsInteger >=
        rfOutPut.FieldByName('iEndLen').AsInteger) or
        (rfOutPut.FieldByName('iEndLen').AsInteger = 0) then
        raise Exception.Create('开始长度不能小于等于结束长度或结束长度不能等于0,请认真检查手工调整');

      SQL := 'exec dbo.spppFenjSaveShaft @uGuid=' +
        QuotedStr(rfOutPut.FieldByName('uGuid').AsString);
      if rfOutPut.ChangeCount > 0 then
      begin
        clDBUtil.IsExistsRepeatField(rfOutPut,
          'iBeamNoIndex=轴序,sBeamNo=轴号,sFactBeamNo=实际轴号,iEnds=头份,iStartLen=开始长度,iEndLen=结束长度,');

        DM.DBManager.SaveData([rfOutPut], [], '', [], SQL, [], True);

        if not rfBeam.IsEmpty then
          TaskGuid := rfBeam.FieldByName('uGuid').AsString
        else
          TaskGuid := clGuid.Guid_Zero;

        rfOutPut.Query('SELECT *, bNew=cast(0 AS BIT), Del=CAST(1 AS int) FROM ppAppQzBeamInfo with(nolock) WHERE uTaskGuid=:uTaskGuid ORDER BY tCreatetime ASC ',[TaskGuid]);
        rfOutPut.Last;

        btnBG.Caption := Translate('报工');
        UWPInfoMessage('系统提醒', '保存产量数据完成');
      end
      else
        UWPInfoMessage('系统提醒', '产量数据已经保存,无需重复保存');
    finally
      if StrToBool(DM.GatherOn) then
        tmr.Enabled := True;
    end;
  end;
  RefreshButton;
end;

procedure TfraModuleFenJing.btnDownClick(Sender: TObject);
var
  SQL: string;
begin
  if rfOutPut.Active and not rfOutPut.IsEmpty and
    (rfOutPut.State in [dsEdit, dsInsert]) then
    rfOutPut.Post;
  if rfOutPut.ChangeCount > 0 then
  begin
    SQL := 'exec dbo.spppFenjSaveShaft @uGuid=' + QuotedStr(rfOutPut.FieldByName('uGuid').AsString);
    DM.DBManager.SaveData([rfOutPut], SQL);
    btnBG.Caption := Translate('报工');
  end;

  rfWorker.First;
  while not rfWorker.Eof do
  begin
    rfWorker.Edit;
    rfWorker.FieldByName('tOffWorkTime').AsDateTime := SF.DBManager.GetSystemDateTime;
    rfWorker.Post;
    rfWorker.Next;
  end;
  DM.DBManager.SaveData([rfWorker]);
  DM.WorkerList := '';
  DM.WorkerNameList := '';
  DM.GroupNo := '';
  DM.GroupName := '';
  DM.TurnName := '';
  lblWorkList.Caption := '';
  btnUp.Caption := Translate('请上班');
  btnDown.Caption := Translate('已下班');
  btnDown.Font.Style := [fsBold, fsUnderline];
  btnUp.Font.Style := [fsBold];
  RefreshButton;
end;

procedure TfraModuleFenJing.edtSizingLotNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = Char(13) then
  begin
    if DM.WorkerList.IsEmpty then
      Exit;
    if not Assigned(FBeamList) then
      FBeamList := TfmFenJingBeamList.Create(Self);
    FBeamList.OnStartBeam := Self.OnStartBeam;
    FBeamList.FSearchText := edtSizingLotNo.Text;
    FBeamList.FCurrBeam := FCurrBeam;
    FBeamList.scStyledForm1.DropDown(edtSizingLotNo);
  end;
end;

procedure TfraModuleFenJing.edtSizingLotNoRightButtonClick(Sender: TObject);
begin
  if DM.WorkerList.IsEmpty then
    Exit;

  if not Assigned(FBeamList) then
    FBeamList := TfmFenJingBeamList.Create(Self);
  FBeamList.OnStartBeam := Self.OnStartBeam;
  FBeamList.FSearchText := edtSizingLotNo.Text;
  FBeamList.FCurrBeam := FCurrBeam;
  FBeamList.scStyledForm1.DropDown(edtSizingLotNo);
end;

procedure TfraModuleFenJing.SetDetailPrivilege;
begin
  inherited;

end;

procedure TfraModuleFenJing.swtch1ChangeState(Sender: TObject);
begin
  if swtch1.State = scswOff then
  begin
    tmr.Enabled := False;
    Exit;
  end
  else
  begin
    tmr.Enabled := True;
    Exit;
  end;
end;

procedure TfraModuleFenJing.VMsgUpdateAppColor(Sender: TObject; AMsg: TVMsg);
begin
  inherited;

end;

initialization

RegisterClass(TfraModuleFenJing);

end.
