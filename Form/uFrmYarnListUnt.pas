unit uFrmYarnListUnt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DMUnt, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkiniMaginary,
  dxSkinOffice2010Silver, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCalendar, cxTextEdit, scStyledForm, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  scControls, scModernControls, scGPControls, Vcl.StdCtrls, Vcl.Mask,
  scGPExtControls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue;
type
  TOnUpYarnEvent = procedure(sYarnInfo, sSizingNo ,sArrangeNo, uGuid, ummMaterialGUID, sYarnLot:string) of object;

type
  TuFrmYarnList = class(TForm)
    BtnBox: TscGPPanel;
    scGPPanel1: TscGPPanel;
    SearchEdt: TscGPLabel;
    OkBtn: TscGPButton;
    FireSuperButton2: TscGPButton;
    scGPPanel2: TscGPPanel;
    scGridPanel1: TscGridPanel;
    scGPLabel1: TscGPLabel;
    scGPLabel2: TscGPLabel;
    scGPLabel7: TscGPLabel;
    cxGrid1: TcxGrid;
    GridView: TcxGridDBTableView;
    GridViewColumn1: TcxGridDBColumn;
    GridViewColumn2: TcxGridDBColumn;
    ImageCol: TcxGridDBColumn;
    GridViewTiaoMa: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    scStyledForm1: TscStyledForm;
    ds: TDataSource;
    rfYarn: TFDMemTable;
    scGPLabel3: TscGPLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    StyleOdd: TcxStyle;
    cxStyle4: TcxStyle;
    colsYarnLot: TcxGridDBColumn;
    lbl1: TscGPLabel;
    procedure FormShow(Sender: TObject);
    procedure FireSuperButton2Click(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
  private
    FOnUpYarn: TOnUpYarnEvent;
    { Private declarations }
  public
    { Public declarations }
    FCurrYarn: TSelectYarnInfo;
    FSearchText: string;
    property OnUpYarn: TOnUpYarnEvent read FOnUpYarn write FOnUpYarn;
  end;

var
  uFrmYarnList: TuFrmYarnList;

implementation

{$R *.dfm}

uses clDBUtilUnt;

procedure TuFrmYarnList.FireSuperButton2Click(Sender: TObject);
begin
  self.scStyledForm1.CloseUp(False);
end;

procedure TuFrmYarnList.FormShow(Sender: TObject);
var
  SQL:string;
begin
  GridView.OptionsView.Header := False;
  AppColor.UpdateAppColor(self);
  SQL:= 'SELECT AA.sSizingNo, AA.sYarnInfo, AA.sArrangeNo,AA.ummMaterialGUID, AA.sYarnLot, uGuid=NEWID()' + #13#10 +
        'FROM' + #13#10 +
        '(' + #13#10 +
        'SELECT DISTINCT A.sSizingNo, C.sYarnInfo, A.sArrangeNo, M.sMaterialLot AS sYarnLot, F.ummMaterialGUID' + #13#10 +
        'FROM dbo.psArrange A WITH(NOLOCK)' + #13#10 +
        'INNER JOIN dbo.psMRPFabric B WITH(NOLOCK) ON A.sArrangeNo = B.sArrangeNo' + #13#10 +
        'INNER JOIN dbo.psMRPFabricBeam C WITH(NOLOCK) ON B.uGUID = C.upsMRPFabricGUID' + #13#10 +
        'INNER JOIN dbo.mmMaterialFabric D WITH(NOLOCK) ON D.ummMaterialGUID=B.ummMaterialGUID' + #13#10 +
        'INNER JOIN dbo.tmWarpArtHdr E WITH(NOLOCK) ON E.ummMaterialGUID=B.ummMaterialGUID' + #13#10 +
        'LEFT JOIN dbo.mmMaterialYarn F WITH(NOLOCK) ON C.sYarnInfo=F.sMaterialNo' + #13#10 +
       'LEFT JOIN dbo.psMRPYarn M WITH(NOLOCK) ON M.upsMRPFabricGUID = B.uGUID AND F.ummMaterialGUID=M.ummMaterialGUID '+#13#10+
        'WHERE D.iBeamTotalQty=E.iTotalEnds' + #13#10 +
        'AND A.sArrangeNo =:sArrangeNo' + #13#10 +
        ') AA';
  Self.SearchEdt.Caption:=FSearchText;
  self.rfYarn.Query(SQL,[Self.SearchEdt.Caption]);
end;

procedure TuFrmYarnList.OkBtnClick(Sender: TObject);
begin
  with rfYarn do
  begin
    if IsEmpty then
      exit;

    FCurrYarn.sYarnInfo := FieldByName('sYarnInfo').AsString;
    FCurrYarn.sSizingNo := FieldByName('sSizingNo').AsString;
    FCurrYarn.sArrangeNo := FieldByName('sArrangeNo').AsString;
    FCurrYarn.uGuid:= FieldByName('uGuid').AsString;
    FCurrYarn.ummMaterialGUID:= FieldByName('ummMaterialGUID').AsString;
    FCurrYarn.sYarnLot:= FieldByName('sYarnLot').AsString;
  end;
  self.scStyledForm1.CloseUp(False);
  if Assigned(FOnUpYarn) then
  begin
    FOnUpYarn(FCurrYarn.sYarnInfo, FCurrYarn.sSizingNo, FCurrYarn.sArrangeNo, FCurrYarn.uGuid, FCurrYarn.ummMaterialGUID, FCurrYarn.sYarnLot);
  end;
end;

end.
