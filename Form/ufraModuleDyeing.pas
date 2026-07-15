unit ufraModuleDyeing;

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
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Stan.StorageBin, FireDAC.Comp.Client,
  FireDAC.Stan.Async,
  FireDAC.DApt, scGPDBControls, FireDAC.Comp.DataSet, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Mask, scGPFontControls,
  cxImageList, dxSkinOffice2010Silver, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  cxCustomData, cxFilter, cxData, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  dxSkiniMaginary,
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
  fmBeamListUnt, MessageUnit, System.StrUtils, LanguageManager;

type
  TfraModuleDyeing = class(TfraModuleBase)
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
    scGPPanel9: TscGPPanel;
    scGPLabel7: TscGPLabel;
    lbl13: TscGPLabel;
    swtch1: TscGPToggleSwitch;
    dxgcntrl3: TdxGaugeControl;
    dxgcntrl3DBDigitalScale1: TdxGaugeDBDigitalScale;
    btnAjustStart: TscGPButton;
    dxGaugeControl1: TdxGaugeControl;
    dxGaugeDBDigitalScale1: TdxGaugeDBDigitalScale;
    btnAjustEnd: TscGPButton;
    rpt1: ThsReportControl;
    dxgcntrl1: TdxGaugeControl;
    dxgcntrl1ContainerScale1: TdxGaugeContainerScale;
    gcnLength: TdxGaugeDigitalScale;
    dxgdgtlsclcptnLengthCaption1: TdxGaugeDigitalScaleCaption;
    dxgcntrl2: TdxGaugeControl;
    dxgcntrl2ContainerScale1: TdxGaugeContainerScale;
    gcnSpeed: TdxGaugeCircularScale;
    dxgcntrl2CircularScale1Caption1: TdxGaugeQuantitativeScaleCaption;
    coluGuid: TcxGridDBColumn;
    grdTaskList: TcxGrid;
    grvTaskList: TcxGridDBTableView;
    col1: TcxGridDBColumn;
    col2: TcxGridDBColumn;
    col3: TcxGridDBColumn;
    col8: TcxGridDBColumn;
    colDelTaskList: TcxGridDBColumn;
    col10: TcxGridDBColumn;
    grlTaskList: TcxGridLevel;
    pnl4: TscGPPanel;
    btnCancelTask: TscGPButton;
    scgrdpnl2: TscGridPanel;
    lbl27: TscGPLabel;
    lbl28: TscGPLabel;
    lbl29: TscGPLabel;
    lbl33: TscGPLabel;
    lbl34: TscGPLabel;
    btnStart: TscGPButton;
    fdmtDyeingTaskList: TFDMemTable;
    dsTaskList: TDataSource;
    colTaskListColumn1: TcxGridDBColumn;
    rptBeam: ThsReportControl;
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
    procedure btnFinishedUpClick(Sender: TObject);
    procedure btnYarnSaveClick(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure edtsSizingLotNoExKeyPress(Sender: TObject; var Key: Char);
    procedure scGPButton4Click(Sender: TObject);
    procedure tmrTimer(Sender: TObject);
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
    procedure rptBeamGetReportSourceEvent(uReportFormatHdrGUID,
      uReportFormatDtlGUID: TGUID; sReportFormatName: string;
      var oReportSource: TRptDataSets);
    procedure btnStartClick(Sender: TObject);
    procedure grvTaskListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCancelTaskClick(Sender: TObject);
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
    procedure OnStartBeam(sYarnInfo, sSizingNo, sArrangeNo, uGuid: string;
      iOrderNo, iEnds, iSizingLen: Integer);
  public
    { Public declarations }
    FTaskGuid: string;
    FEditMode: Boolean;
    FAdd: Integer;
    FYarnList: TuFrmYarnList;
    FBeamList: TfmBeamList;
    FCurrYarn: TSelectYarnInfo;
    FCurrBeam: TSelectBeamInfo;
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
  fraModuleDyeing: TfraModuleDyeing;

implementation

{$R *.dfm}

{ TfraModuleDingDan }
uses qmInputBoxFrm, clGuidUnt, clDBUtilUnt, SFUnt;

procedure TfraModuleDyeing.btnYarnSaveClick(Sender: TObject);
begin
  inherited;
  if (rfYarn.State in [dsEdit, dsInsert]) then
    rfYarn.Post;
  DM.DBManager.SaveData([rfYarn]);
  FEditMode := False;
  RefreshButton;
  UWPInfoMessage('系统提醒', '保存上纱信息完成');
end;

procedure TfraModuleDyeing.btnUpClick(Sender: TObject);
begin
  inherited;
  OnWork;
end;

procedure TfraModuleDyeing.OnWork;
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

procedure TfraModuleDyeing.CloseData;
begin
  inherited;

end;

procedure TfraModuleDyeing.CloseModule;
begin

end;

constructor TfraModuleDyeing.Create(AOwner: TComponent);
begin
  inherited;
  Align := alClient;
  FCurrYarn := TSelectYarnInfo.Create;
  FCurrBeam := TSelectBeamInfo.Create;

  // DM.sOutPutType:='高速整经';
  DM.sOutPutType := DM.sMachineProcedureName;
  Self.lblFormCaption.Caption := DM.sMachineProcedureName;
  FAdd := 0;

  if FYarnList = nil then
    FYarnList := TuFrmYarnList.Create(Self);
  if not Assigned(FFrmOnWork) then
    FFrmOnWork := TfrmOnWork.Create(nil);

end;

destructor TfraModuleDyeing.Destroy;
begin
  FreeAndNil(FCurrYarn);
  FreeAndNil(FCurrBeam);
  inherited;
end;

procedure TfraModuleDyeing.dxgcntrl3KeyPress(Sender: TObject; var Key: Char);
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

procedure TfraModuleDyeing.GetData;
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

  if not DM.WorkerList.IsEmpty then
  Begin
    btnUp.Caption := Translate('已上班');
    btnUp.Font.Style := [fsBold, fsUnderline];
  End;

  fdmtDyeingTaskList.CachedUpdates := True;
  fdmtDyeingTaskList.KeyFieldName := 'uGuid';
  fdmtDyeingTaskList.TableName := 'ppDyeingTaskList';
  fdmtDyeingTaskList.Query
    ('SELECT *, bNew=cast(0 AS BIT),Del=CAST(0 AS int) FROM dbo.ppDyeingTaskList A WITH(NOLOCK) WHERE A.sEquipmentNo=:sEquipmentNo AND A.bFinished=0 and sWorkingProcedureName=:sWorkingProcedureName and sMachineProcedureName=:sMachineProcedureName ',
    [DM.sMacNo, DM.sWorkingProcedureName, DM.sMachineProcedureName]);
  if not fdmtDyeingTaskList.IsEmpty then
  begin
    FTaskGuid := fdmtDyeingTaskList.GetFieldValueAsString('uUnionTaskGuid');
  end;

  if FTaskGuid.IsEmpty then
    FTaskGuid := clGuid.Guid_Zero;

  rfOutPut.TableName := 'ppAppQzBeamInfo';
  rfOutPut.KeyFieldName := 'uGuid';
  rfOutPut.Query('SELECT A.*, bNew=cast(0 AS BIT), Del=CAST(1 AS int)' + #13#10
    + 'FROM dbo.ppAppQzBeamInfo A WITH(NOLOCK)' + #13#10 +
    'WHERE A.uTaskGuid=:uTaskGuid' + #13#10 + 'ORDER BY tCreatetime ASC',
    [FTaskGuid]);

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

procedure TfraModuleDyeing.GridViewColumn2GetDisplayText
  (Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  AText := (ARecord.Index + 1).ToString;
end;

procedure TfraModuleDyeing.GridViewCustomDrawCell
  (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if AViewInfo.Item.VisibleIndex = Sender.VisibleItemCount - 1 then
    AViewInfo.Borders := AViewInfo.Borders - [bRight];
end;

procedure TfraModuleDyeing.grvOutPutMouseDown(Sender: TObject;
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
  RefreshButton;
end;

procedure TfraModuleDyeing.grvTaskListMouseDown(Sender: TObject;
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

  if not fdmtDyeingTaskList.IsEmpty and not fdmtDyeingTaskList.FieldByName
    ('bNew').AsBoolean then
  begin
    Exit;
  end;

  if TcxGridRecordCellHitTest(AHitTest).Item = colDelTaskList then
  begin
    if UWPQuestionMessage('系统询问', '是否确认删除浆缸信息？') = 2 then
      Exit;
    if Self.fdmtDyeingTaskList.Active and not fdmtDyeingTaskList.IsEmpty and
      fdmtDyeingTaskList.FieldByName('bNew').AsBoolean then
    begin
      fdmtDyeingTaskList.Delete;
      RefreshButton;
    end
    else
      raise Exception.Create('已报工数据不允许删除');
  end;
end;

procedure TfraModuleDyeing.grvUserListCustomDrawCell
  (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if AViewInfo.Item.VisibleIndex = Sender.VisibleItemCount - 1 then
    AViewInfo.Borders := AViewInfo.Borders - [bRight];
end;

procedure TfraModuleDyeing.InitModuleLayout;
begin
  inherited;

end;

procedure TfraModuleDyeing.InitShortCut;
begin
  inherited;
  // edtsYarnLot.OnEnter := TextEditEnter;
  // edtnYarnCount.OnEnter := TextEditEnter;
  // edtnDrumfeetCount.OnEnter := TextEditEnter;
  // edtnWeight.OnEnter := TextEditEnter;
  // edtnNewDrumfeetCount.OnEnter := TextEditEnter;
  // edtsFactBeamNo.OnEnter:=TextEditEnter;

  // edtiStartLen.OnEnter:= TextEditEnter;
  // edtiEndLen.OnEnter:= TextEditEnter;
end;

procedure TfraModuleDyeing.LockChangeEvent(lType: Integer);
begin
  inherited;

end;

procedure TfraModuleDyeing.OnStartBeam(sYarnInfo, sSizingNo, sArrangeNo,
  uGuid: string; iOrderNo, iEnds, iSizingLen: Integer);
begin
  if (rfBeam.Active and not rfBeam.IsEmpty) then
  begin
    UWPErrorMessage('系统提醒', '当前轴还未标识完成,请先确认完成任务后再操作');
    FCurrBeam.sYarnInfo := rfBeam.FieldByName('sYarnInfo').AsString;
    FCurrBeam.sSizingNo := rfBeam.FieldByName('sSizingNo').AsString;
    FCurrBeam.sArrangeNo := rfBeam.FieldByName('sArrangeNo').AsString;
    FCurrBeam.uGuid := rfBeam.FieldByName('uGuid').AsString;
    FCurrBeam.iOrderNo := rfBeam.FieldByName('iOrderNo').AsInteger;
    FCurrBeam.iEnds := rfBeam.FieldByName('iEnds').AsInteger;
    FCurrBeam.iSizingLen := rfBeam.FieldByName('iSizingLen').AsInteger;
    Exit;
  end;

  rfBeam.UpdateOptions.UpdateTableName := 'ppDropBeamJob';
  rfBeam.UpdateOptions.KeyFields := 'uGuid';
  rfBeam.Query('select * FROM ppDropBeamJob with(nolock) WHERE 1=2 ', []);
  rfBeam.Append;
  rfBeam.FieldByName('uGuid').AsString := uGuid;
  rfBeam.FieldByName('uHangingYarnGuid').AsString := FCurrYarn.uGuid;
  rfBeam.FieldByName('sMacNo').AsString := DM.sMacNo;
  rfBeam.FieldByName('sYarnInfo').AsString := sYarnInfo;
  rfBeam.FieldByName('sSizingNo').AsString := sSizingNo;
  rfBeam.FieldByName('sArrangeNo').AsString := sArrangeNo;
  rfBeam.FieldByName('sCreator').AsString := DM.WorkerList;
  rfBeam.FieldByName('tCreateTime').AsDateTime :=
    SF.DBManager.GetSystemDateTime;
  rfBeam.FieldByName('iOrderNo').AsInteger := iOrderNo;
  rfBeam.FieldByName('iEnds').AsInteger := iEnds;
  rfBeam.FieldByName('sType').AsString := DM.sOutPutType;
  rfBeam.FieldByName('sBeamNo').AsString := sArrangeNo +
    RightStr('00' + IntToStr(iOrderNo), 2);
  rfBeam.FieldByName('iSizingLen').AsInteger := iSizingLen;
  rfBeam.Post;
  dsBeam.AutoEdit := True;
  FEditMode := True;
  RefreshButton;
end;

procedure TfraModuleDyeing.OnUpYarn(sYarnInfo, sSizingNo, sArrangeNo, uGuid,
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

procedure TfraModuleDyeing.RefreshButton;
var
  bUp, bHaveTask: Boolean;
begin
  bUp := not DM.WorkerList.IsEmpty;
  bHaveTask := fdmtDyeingTaskList.Active and not fdmtDyeingTaskList.IsEmpty and
    fdmtDyeingTaskList.FieldByName('tStartTime').IsNull;
  btnStart.Enabled := bUp and bHaveTask;
  btnCancelTask.Enabled := fdmtDyeingTaskList.Active and
    not fdmtDyeingTaskList.IsEmpty and not fdmtDyeingTaskList.FieldByName
    ('tStartTime').IsNull and bUp and rfOutPut.Active and
    (rfOutPut.RecordCount = 0) and (rfOutPut.ChangeCount = 0);

  btnFinishJob.Enabled := bUp and rfOutPut.Active and (rfOutPut.RecordCount > 0)
    and (rfOutPut.ChangeCount = 0);

  btnBG.Enabled := bUp and fdmtDyeingTaskList.Active and
    not fdmtDyeingTaskList.IsEmpty and not fdmtDyeingTaskList.FieldByName
    ('tStartTime').IsNull and not fdmtDyeingTaskList.GetFieldValueAsBoolean
    ('bFinished');

  if rfOutPut.Active and not rfOutPut.IsEmpty and (rfOutPut.ChangeCount > 0)
  then
    btnBG.Caption := Translate('保存产量')
  else
    btnBG.Caption := Translate('报工');
  btnAjustStart.Enabled := GetEdidMode(311);
  btnAjustEnd.Enabled := GetEdidMode(311);
  edtSizingLotNo.Enabled := (FTaskGuid = clGuid.Guid_Zero);
end;

function TfraModuleDyeing.GetEdidMode(iTag: Integer): Boolean;
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
    // bEditMode:= (btnWork.Caption='开始任务') and rfBeam.Active and not rfBeam.IsEmpty;
  end
  else if (iTag > 31) then
  begin
    bEditMode := btnBG.Enabled and (btnBG.Caption = Translate('保存产量')) and
      rfOutPut.Active and not rfOutPut.IsEmpty;
  end;
  Result := bEditMode;
end;

procedure TfraModuleDyeing.TextEditEnter(Sender: TObject);
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

procedure TfraModuleDyeing.tmrTimer(Sender: TObject);
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

procedure TfraModuleDyeing.RemoveShortCut;
begin
  inherited;

end;

procedure TfraModuleDyeing.rpt1GetReportSourceEvent(uReportFormatHdrGUID,
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

procedure TfraModuleDyeing.rptBeamGetReportSourceEvent(uReportFormatHdrGUID,
  uReportFormatDtlGUID: TGUID; sReportFormatName: string;
  var oReportSource: TRptDataSets);
begin
  inherited;
  oReportSource.Add('轴信息', clDBUtil.GetGridSelectedDataSet
    (grvOutPut.DataController, 'uGuid', True));
end;

procedure TfraModuleDyeing.btnFinishJobClick(Sender: TObject);
var
  SQL: string;
begin
  if UWPQuestionMessage('系统询问', '是否确认完结在机任务？') = 2 then
    Exit;

  try
    fdmtDyeingTaskList.DisableControls;
    fdmtDyeingTaskList.First;
    while not fdmtDyeingTaskList.Eof do
    begin
      fdmtDyeingTaskList.Edit;
      fdmtDyeingTaskList.SetFieldValue('bFinished', True);
      fdmtDyeingTaskList.SetFieldValue('tFinishedTime',
        SF.DBManager.GetSystemDateTime);
      fdmtDyeingTaskList.SetFieldValue('sFinishedMan', DM.WorkerList);
      fdmtDyeingTaskList.Post;
      fdmtDyeingTaskList.Next;
    end;
  finally
    fdmtDyeingTaskList.EnableControls;
  end;

  SQL := 'EXEC dbo.spppQZFinsihOutput :sWorkingProcedureName,:sMachineProcedureName,:sPlanMachineNo,:sTaskNo,:uTaskGuid';
  DM.DBManager.SaveData([fdmtDyeingTaskList], [], '', [], SQL,
    [DM.sWorkingProcedureName, DM.sMachineProcedureName, DM.sMacNo, '',
    FTaskGuid], True);
  fdmtDyeingTaskList.Query
    ('SELECT *, bNew=cast(0 AS BIT),Del=CAST(0 AS int) FROM dbo.ppDyeingTaskList A WITH(NOLOCK) WHERE A.sEquipmentNo=:sEquipmentNo AND A.bFinished=0 and sWorkingProcedureName=:sWorkingProcedureName and sMachineProcedureName=:sMachineProcedureName ',
    [DM.sMacNo, DM.sWorkingProcedureName, DM.sMachineProcedureName]);
  FTaskGuid := clGuid.Guid_Zero;

  rfOutPut.Query('SELECT A.*, bNew=cast(0 AS BIT), Del=CAST(1 AS int)' + #13#10
    + 'FROM dbo.ppAppQzBeamInfo A WITH(NOLOCK)' + #13#10 +
    'WHERE A.uTaskGuid=:uTaskGuid' + #13#10 + 'ORDER BY tCreatetime ASC',
    [FTaskGuid]);
  UWPInfoMessage('系统提醒', '任务已完结');
  RefreshButton;
end;

procedure TfraModuleDyeing.btnAjustEndClick(Sender: TObject);
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

procedure TfraModuleDyeing.btnAjustStartClick(Sender: TObject);
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

procedure TfraModuleDyeing.scGPButton4Click(Sender: TObject);
begin
  inherited;
  if (rfBeam.State in [dsEdit, dsInsert]) then
    rfBeam.Post;
  DM.DBManager.SaveData([rfBeam]);
  UWPInfoMessage('系统提醒', '保存开机轴任务');
end;

procedure TfraModuleDyeing.btnStartClick(Sender: TObject);
begin
  if not fdmtDyeingTaskList.Active and fdmtDyeingTaskList.IsEmpty then
    raise Exception.Create('请先扫描任务再开机');
  FTaskGuid := clGuid.NewGuidAsString;
  try
    fdmtDyeingTaskList.DisableControls;
    fdmtDyeingTaskList.First;
    while not fdmtDyeingTaskList.Eof do
    begin
      fdmtDyeingTaskList.Edit;
      fdmtDyeingTaskList.SetFieldValue('uUnionTaskGuid', FTaskGuid);
      fdmtDyeingTaskList.SetFieldValue('tStartTime',
        SF.DBManager.GetSystemDateTime);
      fdmtDyeingTaskList.Post;
      fdmtDyeingTaskList.Next;
    end;
  finally
    fdmtDyeingTaskList.EnableControls;
  end;
  fdmtDyeingTaskList.SaveData();
  RefreshButton;
end;

procedure TfraModuleDyeing.btnBGClick(Sender: TObject);
var
  nLastValue: Variant;
  SQL: string;
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
    rfOutPut.FieldByName('uTaskGuid').AsString := FTaskGuid;
    rfOutPut.FieldByName('sGroupNo').AsString := DM.GroupNo;
    rfOutPut.FieldByName('sGroupName').AsString := DM.GroupName;
    rfOutPut.FieldByName('sOperatorNo').AsString := DM.WorkerList;
    rfOutPut.FieldByName('sOperatorName').AsString := DM.WorkerNameList;
    rfOutPut.FieldByName('sClassNo').AsString := DM.TurnName;
    // rfOutPut.FieldByName('iEnds').AsInteger:= rfBeam.FieldByName('iEnds').AsInteger;
    // rfOutPut.FieldByName('sFactBeamNo').AsString:= rfBeam.FieldByName('sFactBeamNo').AsString;
    // rfOutPut.FieldByName('iBeamNoIndex').AsInteger:= rfBeam.FieldByName('iOrderNo').AsInteger;
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
    rfOutPut.FieldByName('sPlanMachineNo').AsString := DM.sMacNo;
    // rfOutPut.FieldByName('sBeamNo').AsString:= rfBeam.FieldByName('sBeamNo').AsString;
    rfOutPut.FieldByName('sSizingLotNo').AsString :=
      fdmtDyeingTaskList.FieldByName('sSizingNo').AsString;
    rfOutPut.FieldByName('sArrangeNo').AsString :=
      fdmtDyeingTaskList.FieldByName('sArrangeNo').AsString;
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

      SQL := 'exec dbo.spppDyeSaveShaft @uGuid=' +
        QuotedStr(rfOutPut.FieldByName('uGuid').AsString);
      if rfOutPut.ChangeCount > 0 then
      begin
        DM.DBManager.SaveData([rfOutPut], [], '', [], SQL, [], True);

        rfOutPut.Query
          ('SELECT *, bNew=cast(0 AS BIT), Del=CAST(1 AS int) FROM ppAppQzBeamInfo with(nolock) WHERE uTaskGuid=:uTaskGuid ORDER BY tCreatetime ASC ',
          [FTaskGuid]);
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

procedure TfraModuleDyeing.btnCancelTaskClick(Sender: TObject);
begin
  if not FTaskGuid.IsEmpty then
    SF.DBManager.ExecuteSql('exec ppDyeingCancelTask :a,:b ',
      [FTaskGuid, DM.WorkerList]);
  fdmtDyeingTaskList.Query
    ('SELECT *, bNew=cast(0 AS BIT),Del=CAST(0 AS int) FROM dbo.ppDyeingTaskList A WITH(NOLOCK) WHERE 1=2',
    []);
  FTaskGuid := clGuid.Guid_Zero;
  RefreshButton;
end;

procedure TfraModuleDyeing.btnDownClick(Sender: TObject);
var
  SQL: string;
begin
  if rfOutPut.Active and not rfOutPut.IsEmpty and
    (rfOutPut.State in [dsEdit, dsInsert]) then
    rfOutPut.Post;
  tmr.Enabled := False;
  try
    if rfOutPut.Active and not rfOutPut.IsEmpty and
      (rfOutPut.State in [dsEdit, dsInsert]) then
      rfOutPut.Post;
    if (rfOutPut.FieldByName('iStartLen').AsInteger >=
      rfOutPut.FieldByName('iEndLen').AsInteger) or
      (rfOutPut.FieldByName('iEndLen').AsInteger = 0) then
      raise Exception.Create('开始长度不能小于等于结束长度或结束长度不能等于0,请认真检查手工调整');

    SQL := 'exec dbo.spppDyeSaveShaft @uGuid=' +
      QuotedStr(rfOutPut.FieldByName('uGuid').AsString);
    if rfOutPut.ChangeCount > 0 then
    begin
      DM.DBManager.SaveData([rfOutPut], [], '', [], SQL, [], True);

      rfOutPut.Query
        ('SELECT *, bNew=cast(0 AS BIT), Del=CAST(1 AS int) FROM ppAppQzBeamInfo with(nolock) WHERE uTaskGuid=:uTaskGuid ORDER BY tCreatetime ASC ',
        [FTaskGuid]);
      rfOutPut.Last;

      btnBG.Caption := Translate('报工');
    end;
  finally
    if StrToBool(DM.GatherOn) then
      tmr.Enabled := True;
  end;

  rfWorker.First;
  while not rfWorker.Eof do
  begin
    rfWorker.Edit;
    rfWorker.FieldByName('tOffWorkTime').AsDateTime :=
      SF.DBManager.GetSystemDateTime;
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

procedure TfraModuleDyeing.btnFinishedUpClick(Sender: TObject);
begin
  inherited;
  if not rfBeam.IsEmpty then
    raise Exception.Create('请先完成落轴任务再上纱');
  SF.DBManager.ExecuteSql
    ('update ppHangingYarn SET bFinished =1 WHERE uGuid=:uGuid ',
    [rfYarn.FieldByName('uGuid').AsString], True);
  rfYarn.Query('select * FROM ppHangingYarn with(nolock) WHERE 1=2 ', []);
  rfBeam.Query('SELECT * FROM dbo.ppDropBeamJob A WITH(NOLOCK) where 1=2');
  rfOutPut.Query('SELECT A.*, bNew=cast(0 AS BIT), Del=CAST(1 AS int)' + #13#10
    + 'FROM dbo.ppAppQzBeamInfo A WITH(NOLOCK)' + #13#10 +
    'INNER JOIN dbo.ppDropBeamJob B WITH(NOLOCK) ON A.uTaskGuid=B.uGuid' +
    #13#10 + 'WHERE 1=2', []);

  FCurrYarn.sYarnInfo := '';
  FCurrYarn.sSizingNo := '';
  FCurrYarn.sArrangeNo := '';
  FCurrYarn.uGuid := clGuid.Guid_Zero;

  Self.FEditMode := False;

  UWPInfoMessage('系统提醒', '用纱完成标识结束,可以继续上纱操作！');
  RefreshButton;
end;

procedure TfraModuleDyeing.edtSizingLotNoKeyPress(Sender: TObject;
  var Key: Char);
const
  sSQL: string = 'SELECT TOP 200 sArrangeNo,sSizingNo' + #13#10 + 'FROM' +
    #13#10 + '(' + #13#10 + 'SELECT  sArrangeNo,sSizingNo' + #13#10 +
    'FROM psArrange WITH(NOLOCK)' + #13#10 + 'UNION ALL' + #13#10 +
    'SELECT sOrderNo,sSizingNo' + #13#10 + 'FROM sdOrderYarnHdr WITH(NOLOCK)' +
    #13#10 + ') a' + #13#10 + 'WHERE sArrangeNo=:sArrangeNo';
var
  fd: TFDMemTable;
begin
  if Key = Char(13) then
  begin
    if DM.WorkerList.IsEmpty then
      raise Exception.Create('请先上班');
    try
      fd := TFDMemTable.Create(nil);
      fd.Query(sSQL, [edtSizingLotNo.Text]);
      if fd.IsEmpty then
        raise Exception.Create('计划、浆缸号不存在,请认真核对');
      if fdmtDyeingTaskList.Locate('sArrangeNo', edtSizingLotNo.Text) then
        raise Exception.Create('计划、浆缸号已存在,请认真核对');
      fdmtDyeingTaskList.Append;
      fdmtDyeingTaskList.SetFieldValue('uGuid', clGuid.NewGuidAsString);
      fdmtDyeingTaskList.AssignRecord(fd);
      fdmtDyeingTaskList.FieldByName('bNew').AsBoolean := True;
      fdmtDyeingTaskList.FieldByName('Del').AsInteger := 1;
      fdmtDyeingTaskList.SetFieldValue('sEquipmentNo', DM.sMacNo);
      fdmtDyeingTaskList.SetFieldValue('sWorkingProcedureName',
        DM.sWorkingProcedureName);
      fdmtDyeingTaskList.SetFieldValue('sMachineProcedureName',
        DM.sMachineProcedureName);
      fdmtDyeingTaskList.SetFieldValue('tCreatetime',
        SF.DBManager.GetSystemDateTime);
      fdmtDyeingTaskList.SetFieldValue('sCreator', DM.WorkerList);
      fdmtDyeingTaskList.Post;
      RefreshButton;
    finally
      FreeAndNil(fd);
      edtSizingLotNo.Clear;
    end;
  end;
end;

procedure TfraModuleDyeing.edtSizingLotNoRightButtonClick(Sender: TObject);
const
  sSQL: string = 'SELECT TOP 200 sArrangeNo,sSizingNo' + #13#10 + 'FROM' +
    #13#10 + '(' + #13#10 + 'SELECT  sArrangeNo,sSizingNo' + #13#10 +
    'FROM psArrange WITH(NOLOCK)' + #13#10 + 'UNION ALL' + #13#10 +
    'SELECT sOrderNo,sSizingNo' + #13#10 + 'FROM sdOrderYarnHdr WITH(NOLOCK)' +
    #13#10 + ') a' + #13#10 + 'WHERE sArrangeNo=:sArrangeNo';
var
  fd: TFDMemTable;
begin
  if DM.WorkerList.IsEmpty then
    raise Exception.Create('请先上班');
  try
    fd := TFDMemTable.Create(nil);
    fd.Query(sSQL, [edtSizingLotNo.Text]);
    if fd.IsEmpty then
      raise Exception.Create('计划、浆缸号不存在,请认真核对');
    if fdmtDyeingTaskList.Locate('sArrangeNo', edtSizingLotNo.Text) then
      raise Exception.Create('计划、浆缸号已存在,请认真核对');
    fdmtDyeingTaskList.Append;
    fdmtDyeingTaskList.SetFieldValue('uGuid', clGuid.NewGuidAsString);
    fdmtDyeingTaskList.AssignRecord(fd);
    fdmtDyeingTaskList.FieldByName('bNew').AsBoolean := True;
    fdmtDyeingTaskList.FieldByName('Del').AsInteger := 1;
    fdmtDyeingTaskList.SetFieldValue('sEquipmentNo', DM.sMacNo);
    fdmtDyeingTaskList.SetFieldValue('sWorkingProcedureName',
      DM.sWorkingProcedureName);
    fdmtDyeingTaskList.SetFieldValue('sMachineProcedureName',
      DM.sMachineProcedureName);
    fdmtDyeingTaskList.SetFieldValue('tCreatetime',
      SF.DBManager.GetSystemDateTime);
    fdmtDyeingTaskList.SetFieldValue('sCreator', DM.WorkerList);
    fdmtDyeingTaskList.Post;
    RefreshButton;
  finally
    FreeAndNil(fd);
    edtSizingLotNo.Clear;
  end;
end;

procedure TfraModuleDyeing.edtsSizingLotNoExKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    if DM.WorkerList.IsEmpty then
      Exit;
    if not rfYarn.Active or rfYarn.IsEmpty then
      raise Exception.Create('请先上纱');

    if not Assigned(FBeamList) then
      FBeamList := TfmBeamList.Create(Self);
    FBeamList.OnStartBeam := Self.OnStartBeam;
    FBeamList.FYarnInfo := rfYarn.FieldByName('sYarnInfo').AsString;
    FBeamList.FCurrBeam := FCurrBeam;
  end;
end;

procedure TfraModuleDyeing.SetDetailPrivilege;
begin
  inherited;

end;

procedure TfraModuleDyeing.swtch1ChangeState(Sender: TObject);
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

procedure TfraModuleDyeing.VMsgUpdateAppColor(Sender: TObject; AMsg: TVMsg);
begin
  inherited;

end;

initialization

RegisterClass(TfraModuleDyeing);

end.
