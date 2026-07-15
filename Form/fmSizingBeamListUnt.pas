unit fmSizingBeamListUnt;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, LanguageManager;
type
  TOnStartBeamEvent = procedure(sSizingNo, sArrangeNo,
  uTaskGuid, sOrderNo, sFactBeamType, sBeamNo, sCardNo: string; iOrderNo, iEnds, iSizingLen: Integer) of object;

type
  TfmSizingBeamList = class(TForm)
    BtnBox: TscGPPanel;
    scGPPanel1: TscGPPanel;
    SearchEdt: TscGPLabel;
    OkBtn: TscGPButton;
    FireSuperButton2: TscGPButton;
    scGPPanel2: TscGPPanel;
    scGridPanel1: TscGridPanel;
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
    colsArrangeNo: TcxGridDBColumn;
    colsSizingNo: TcxGridDBColumn;
    coliOrderNo: TcxGridDBColumn;
    fdmtYarn: TFDMemTable;
    colnLength: TcxGridDBColumn;
    lblArrangeNo: TscGPLabel;
    lblSizingNo: TscGPLabel;
    lblOrderNo: TscGPLabel;
    lblBeamLen1: TscGPLabel;
    colsCardNo: TcxGridDBColumn;
    colsOrderNo: TcxGridDBColumn;
    colsFactBeamType: TcxGridDBColumn;
    lblBeamLen2: TscGPLabel;
    lblBeamLen3: TscGPLabel;
    lblBeamLen4: TscGPLabel;
    procedure FormShow(Sender: TObject);
    procedure FireSuperButton2Click(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
  private
    FOnStartBeam: TOnStartBeamEvent;
    { Private declarations }
  public
    { Public declarations }
    FCurrBeam: TSelectSizingBeamInfo;
    FSearchText: string;
    FYarnInfo: string;
    property OnStartBeam: TOnStartBeamEvent read FOnStartBeam write FOnStartBeam;
  end;

var
  fmSizingBeamList: TfmSizingBeamList;

implementation

{$R *.dfm}

uses clDBUtilUnt;

procedure TfmSizingBeamList.FireSuperButton2Click(Sender: TObject);
begin
  self.scStyledForm1.CloseUp(False);
end;

procedure TfmSizingBeamList.FormShow(Sender: TObject);
var
  SQL:string;
begin
  grvBeamList.OptionsView.Header := False;
  AppColor.UpdateAppColor(self);
  SQL:= 'EXEC dbo.ppGetQZOuputTaskList :sTaskType,:sArrangeNo ';
  Self.SearchEdt.Caption:=FSearchText;
  self.fdmtYarn.Query(SQL,['Sizing',FSearchText]);
end;

procedure TfmSizingBeamList.OkBtnClick(Sender: TObject);
begin
  with fdmtYarn do
  begin
    if IsEmpty then
      exit;
    FCurrBeam.sBeamNo := FieldByName('sBeamNo').AsString;
    FCurrBeam.sSizingNo := FieldByName('sSizingNo').AsString;
    FCurrBeam.sArrangeNo := FieldByName('sArrangeNo').AsString;
    FCurrBeam.uTaskGuid:= FieldByName('uGuid').AsString;
    FCurrBeam.iOrderNo:= FieldByName('iBeamIndex').AsInteger;
    FCurrBeam.iSizingLen:= FieldByName('iSizingLen').AsInteger;
    FCurrBeam.sOrderNo:= FieldByName('sOrderNo').AsString;
    FCurrBeam.sFactBeamType:= FieldByName('sFactBeamType').AsString;
    FCurrBeam.sCardNo:= FieldByName('sCardNo').AsString;
  end;
  self.scStyledForm1.CloseUp(False);
  if Assigned(FOnStartBeam) then
  begin
    FOnStartBeam(FCurrBeam.sSizingNo, FCurrBeam.sArrangeNo, FCurrBeam.uTaskGuid, FCurrBeam.sOrderNo, FCurrBeam.sFactBeamType,FCurrBeam.sBeamNo,FCurrBeam.sCardNo,FCurrBeam.iOrderNo,FCurrBeam.iEnds, FCurrBeam.iSizingLen);
  end;
end;

end.
