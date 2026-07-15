unit ufrmOnWork;

interface

uses
  DMUnt, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmGPBase,
  scStyledForm, scControls, scGPControls, Vcl.ExtCtrls, scGPExtControls,
  Vcl.Mask, scGPImages, scGPFontControls, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkiniMaginary,
  dxSkinOffice2010Silver, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCalendar, cxTextEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, scModernControls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxImageComboBox, System.ImageList, Vcl.ImgList, cxImageList, dxSkinBlack,
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
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, hsDBManager, LanguageManager;

type
  TfrmOnWork = class(TFrmGPBase)
    scScrollBox1: TscScrollBox;
    scGPLabel1: TscGPLabel;
    scGPLabel3: TscGPLabel;
    LabZiYuanNameXing: TscGPLabel;
    cbbGroupNo: TscGPComboBox;
    scGPLabel11: TscGPLabel;
    edtWorkerNo: TscGPEdit;
    btnPanel: TscGPPanel;
    GridPanel1: TGridPanel;
    scGPPanel1: TscGPPanel;
    btnCancel: TscGPButton;
    scGPPanel2: TscGPPanel;
    btnOK: TscGPButton;
    P_ErrInfo: TscGPPanel;
    scGPButton2: TscGPButton;
    cbbClass: TscGPComboBox;
    pnl1: TscGPPanel;
    scGridPanel1: TscGridPanel;
    lbl1: TscGPLabel;
    lbl2: TscGPLabel;
    lbl3: TscGPLabel;
    lbl4: TscGPLabel;
    grd1: TcxGrid;
    grvWork: TcxGridDBTableView;
    colsWorkerGroupNo: TcxGridDBColumn;
    colsWorkerGroupName: TcxGridDBColumn;
    colsWorkerNo: TcxGridDBColumn;
    colsWorkerName: TcxGridDBColumn;
    grl1: TcxGridLevel;
    ds: TDataSource;
    scGPLabel2: TscGPLabel;
    rfWork: TFDMemTable;
    scGPLabel4: TscGPLabel;
    colsTurnName: TcxGridDBColumn;
    colDel: TcxGridDBColumn;
    cxImageList1: TcxImageList;
    scGPImage1: TscGPImage;
    LabErrInfo: TscGPLabel;
    FDMemTable: TFDMemTable;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtWorkerNoKeyPress(Sender: TObject; var Key: Char);
    procedure grvWorkMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FErrMsg: string;
    procedure setErrMsg(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    FRoleID: string;
    property ErrMsg: string read FErrMsg write setErrMsg;
    procedure InitVcl;
  end;

var
  frmOnWork: TfrmOnWork;

implementation

{$R *.dfm}

uses
  RegularExpressions, clGuidUnt,  MessageUnit, clDBUtilUnt, SFUnt;

procedure TfrmOnWork.btnCancelClick(Sender: TObject);
begin
  inherited;
  if Self.rfWork.Active and not rfWork.IsEmpty and (rfWork.ChangeCount>0) then
    if UWPQuestionMessage('系统询问', '是否确认放弃上班打卡？')=2 then
      Exit;
  ModalResult := mrCancel;
end;

procedure TfrmOnWork.btnOKClick(Sender: TObject);
begin
  if cbbGroupNo.ItemIndex < 0 then
  begin
    cbbGroupNo.SetFocus;
    ErrMsg := Translate('请选择班组');
    exit;
  end;
  if cbbClass.ItemIndex < 0 then
  begin
    cbbClass.SetFocus;
    ErrMsg := Translate('请选择班别');
    exit;
  end;
  if rfWork.IsEmpty then
  begin
    ErrMsg := Translate('员工为空，请扫描员工卡上班');
    exit;
  end;
  if rfWork.State in [dsEdit,dsInsert] then
    rfWork.Post;
  DM.DBManager.SaveData([rfWork]);
  ModalResult := mrOk;
end;

procedure TfrmOnWork.edtWorkerNoKeyPress(Sender: TObject; var Key: Char);
var
  SQL:string;
  qry:TFDMemTable;
begin
  SQL:='SELECT D.sWorkerNo,D.sWorkerName' + #13#10 +
      'FROM dbo.ppWorkerGroup A WITH(NOLOCK)' + #13#10 +
      'INNER JOIN dbo.ppWorkerGroupRelation C WITH(NOLOCK) ON C.uppWorkerGroupGUID=A.uGUID' + #13#10 +
      'INNER JOIN dbo.ppWorker D WITH(NOLOCK) ON D.uGUID=C.uppWorkerGUID' + #13#10 +
      'INNER JOIN dbo.pbWorkCentre E WITH(NOLOCK) ON E.uGUID = A.upbWorkCentreGUID' + #13#10 +
      'WHERE  E.sWorkCentreNo=:sWorkCentreNo AND D.sWorkerNo=:sWorkerNo' + #13#10 +
      'ORDER BY A.sWorkerGroupNo, D.sWorkerNo';
  if Key=Char(13) then
  begin
     if rfWork.Locate('sWorkerNo',edtWorkerNo.Text,[]) then
     begin
       setErrMsg('员工已存在,不能重复刷卡');
       edtWorkerNo.Clear;
       exit;
     end;
      qry:=TFDMemTable.Create(nil);
      try
        qry.Query(SQL,[DM.LocalWorkCenter,edtWorkerNo.Text]);
        if not qry.IsEmpty then
        begin
          rfWork.Append;
          rfWork.FieldByName('uGuid').AsString:=clGuid.NewGuidAsString;
          rfWork.CopyRecord(qry);
          rfWork.FieldByName('sWorkerGroupNo').AsString:= cbbGroupNo.Items[cbbGroupNo.ItemIndex].Detail;
          rfWork.FieldByName('sWorkerGroupName').AsString:= cbbGroupNo.Items[cbbGroupNo.ItemIndex].Caption;
          rfWork.FieldByName('sTurnName').AsString:= cbbClass.Items[cbbClass.ItemIndex].Caption;
          rfWork.FieldByName('sType').AsString:= DM.sOutPutType;
          rfWork.FieldByName('sMacNo').AsString:= DM.sMacNo;
          rfWork.FieldByName('tOnWorkTime').AsDateTime:=SF.DBManager.GetSystemDateTime;
          rfWork.FieldByName('Del').AsInteger:=0;
          rfWork.FieldByName('sWorkingProcedureName').AsString:= DM.sWorkingProcedureName;
          rfWork.FieldByName('sMachineProcedureName').AsString:= DM.sMachineProcedureName;
          rfWork.Post;
          setErrMsg('刷卡成功');
        end
        else
        begin
          setErrMsg('员工不存在,请仔细检查员工卡');
          exit;
        end;
      finally
        FreeAndNil(qry);
        edtWorkerNo.Clear;
      end;
  end;
end;

procedure TfrmOnWork.FormShow(Sender: TObject);
begin
  inherited;
  InitVcl;
  rfWork.KeyFieldName:='uGuid';
  rfWork.TableName:='ppOnWork';
  rfWork.Query('SELECT *, Del=cast(0 as int) FROM dbo.ppOnWork A WITH(NOLOCK) WHERE A.sMacNo=:sMacNo AND A.sType=:sOutPutType AND A.tOffWorkTime IS NULL',[DM.sMacNo, DM.sOutPutType]);
  if not rfWork.IsEmpty then
  begin
    cbbGroupNo.ItemIndex:= cbbGroupNo.IndexOfDetail(rfWork.FieldByName('sWorkerGroupNo').AsString);
    cbbClass.ItemIndex:= cbbClass.IndexOfDetail(rfWork.FieldByName('sTurnName').AsString);
  end;
   btnOK.Options.FontNormalColor := AppColor.PrimaryColor;
end;

procedure TfrmOnWork.grvWorkMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
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

  if TcxGridRecordCellHitTest(AHitTest).Item = ColDel then
  begin
    if UWPQuestionMessage('系统询问', '是否确认删除打卡记录？')=2 then
      Exit;
    if self.rfWork.Active and  not rfWork.IsEmpty then
    begin
      rfWork.Delete;
    end;
  end;
end;

procedure TfrmOnWork.InitVcl;
var
  qry:TFDMemTable;
  sSQLGroup, sSQLClass:string;

begin
  sSQLGroup:='SELECT A.sWorkerGroupNo,A.sWorkerGroupName , B.sWorkCentreNo, B.sWorkCentreName' + #13#10 +
            'FROM dbo.ppWorkerGroup A WITH(NOLOCK)' + #13#10 +
            'INNER JOIN dbo.pbWorkCentre B WITH(NOLOCK) ON B.uGUID = A.upbWorkCentreGUID' + #13#10 +
            'AND A.bUsable = 1' + #13#10 +
            'WHERE B.sWorkCentreNo=:sWorkCentreNo' + #13#10 +
            'ORDER BY A.sWorkerGroupNo';
  sSQLClass:= 'SELECT A.sTurnName' + #13#10 +
              'FROM dbo.ppWorkerTurn A WITH(NOLOCK)' + #13#10 +
              'LEFT JOIN dbo.pbWorkCentre B WITH(NOLOCK) ON A.upbWorkCentreGUID = B.uGUID' + #13#10 +
              'WHERE A.bIsProduct=1 AND (B.sWorkCentreNo =:sWorkCentreNo OR upbWorkCentreGUID =dbo.fnpbZeroGUID())' + #13#10 +
              'ORDER BY sTurnName';
  if cbbGroupNo.Items.Count=0 then
  begin
    qry:=TFDMemTable.Create(nil);
    try
    qry.Query(sSQLGroup,[DM.LocalWorkCenter]);
    with qry do
    begin
      First;
      cbbGroupNo.Items.Clear;
      while not Eof do
      begin
        with cbbGroupNo.Items.Add do
        begin
          Caption := FieldByName('sWorkerGroupName').AsString;
          Detail := FieldByName('sWorkerGroupNo').AsString;
        end;
        Next;
      end;
    end;
    finally
      FreeAndNil(qry);
    end;
  end;

  if cbbClass.Items.Count=0 then
  begin
    qry:=TFDMemTable.Create(nil);
    try
    qry.Query(sSQLClass,[DM.LocalWorkCenter]);
    with qry do
    begin
      First;
      cbbClass.Items.Clear;
      while not Eof do
      begin
        with cbbClass.Items.Add do
        begin
          Caption := FieldByName('sTurnName').AsString;
          Detail := FieldByName('sTurnName').AsString;
        end;
        Next;
      end;
    end;
    finally
      FreeAndNil(qry);
    end;
  end;

end;

procedure TfrmOnWork.setErrMsg(const Value: string);
begin
  FErrMsg := Translate(Value);
  LabErrInfo.Caption := Translate(Value);
  P_ErrInfo.Visible := True;
end;

end.

