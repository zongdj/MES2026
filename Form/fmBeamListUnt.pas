unit fmBeamListUnt;

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
  TOnStartBeamEvent = procedure(sYarnInfo, sSizingNo, sArrangeNo,
  uGuid: string; iOrderNo, iEnds, iSizingLen: Integer) of object;

type
  TfmBeamList = class(TForm)
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
    grvBeamList: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    scStyledForm1: TscStyledForm;
    ds: TDataSource;
    scGPLabel3: TscGPLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    StyleOdd: TcxStyle;
    cxStyle4: TcxStyle;
    lbl1: TscGPLabel;
    lbl2: TscGPLabel;
    colsYarnInfo: TcxGridDBColumn;
    colsArrangeNo: TcxGridDBColumn;
    colsSizingNo: TcxGridDBColumn;
    coliOrderNo: TcxGridDBColumn;
    coliEnds: TcxGridDBColumn;
    fdmtYarn: TFDMemTable;
    procedure FormShow(Sender: TObject);
    procedure FireSuperButton2Click(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
  private
    FOnStartBeam: TOnStartBeamEvent;
    { Private declarations }
  public
    { Public declarations }
    FCurrBeam: TSelectBeamInfo;
    FSearchText: string;
    FYarnInfo: string;
    property OnStartBeam: TOnStartBeamEvent read FOnStartBeam write FOnStartBeam;
  end;

var
  fmBeamList: TfmBeamList;

implementation

{$R *.dfm}

uses clDBUtilUnt;

procedure TfmBeamList.FireSuperButton2Click(Sender: TObject);
begin
  self.scStyledForm1.CloseUp(False);
end;

procedure TfmBeamList.FormShow(Sender: TObject);
var
  SQL:string;
begin
  grvBeamList.OptionsView.Header := False;
  AppColor.UpdateAppColor(self);
  SQL:= 'SELECT  A.sSizingNo, A.sArrangeNo, C.sYarnInfo, C.iOrderNo, C.iEnds, B.iSizingLen, C.uGUID' + #13#10 +
        'FROM dbo.psArrange A WITH(NOLOCK)' + #13#10 +
        'INNER JOIN dbo.psMRPFabric B WITH(NOLOCK) ON A.sArrangeNo = B.sArrangeNo' + #13#10 +
        'INNER JOIN dbo.psMRPFabricBeam C WITH(NOLOCK) ON B.uGUID = C.upsMRPFabricGUID' + #13#10 +
        'INNER JOIN dbo.mmMaterialFabric D WITH(NOLOCK) ON D.ummMaterialGUID=B.ummMaterialGUID' + #13#10 +
        'INNER JOIN dbo.tmWarpArtHdr E WITH(NOLOCK) ON E.ummMaterialGUID=B.ummMaterialGUID AND D.iBeamTotalQty=E.iTotalEnds' + #13#10 +
        'WHERE A.sArrangeNo=:sArrangeNo AND C.sYarnInfo=:sYarnInfo' + #13#10 +
        'AND NOT EXISTS(SELECT * FROM dbo.ppDropBeamJob AA WITH(NOLOCK) WHERE AA.uGuid=C.uGUID)'+ #13#10 +
        'ORDER BY C.iOrderNo';
  Self.SearchEdt.Caption:=FSearchText;
  self.fdmtYarn.Query(SQL,[FSearchText, FYarnInfo]);
end;

procedure TfmBeamList.OkBtnClick(Sender: TObject);
begin
  with fdmtYarn do
  begin
    if IsEmpty then
      exit;

    FCurrBeam.sYarnInfo := FieldByName('sYarnInfo').AsString;
    FCurrBeam.sSizingNo := FieldByName('sSizingNo').AsString;
    FCurrBeam.sArrangeNo := FieldByName('sArrangeNo').AsString;
    FCurrBeam.uGuid:= FieldByName('uGuid').AsString;
    FCurrBeam.iOrderNo:= FieldByName('iOrderNo').AsInteger;
    FCurrBeam.iEnds:= FieldByName('iEnds').AsInteger;
    FCurrBeam.iSizingLen:= FieldByName('iSizingLen').AsInteger;
  end;
  self.scStyledForm1.CloseUp(False);
  if Assigned(FOnStartBeam) then
  begin
    FOnStartBeam(FCurrBeam.sYarnInfo, FCurrBeam.sSizingNo, FCurrBeam.sArrangeNo, FCurrBeam.uGuid,FCurrBeam.iOrderNo,FCurrBeam.iEnds, FCurrBeam.iSizingLen);
  end;
end;

end.
