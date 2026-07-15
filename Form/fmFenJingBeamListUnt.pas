unit fmFenJingBeamListUnt;

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
  TOnStartBeamEvent = procedure(sSizingNo, sArrangeNo,
  uTaskGuid, sShelfNo, sBucketNo, sFactBeamNo ,sBeamNo: string; iOrderNo, iEnds, iSizingLen: Integer) of object;

type
  TfmFenJingBeamList = class(TForm)
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
    colsBeamNo: TcxGridDBColumn;
    colnLength: TcxGridDBColumn;
    colsShelfNo: TcxGridDBColumn;
    colsBucketNo: TcxGridDBColumn;
    lbl3: TscGPLabel;
    lbl4: TscGPLabel;
    lbl5: TscGPLabel;
    lbl6: TscGPLabel;
    procedure FormShow(Sender: TObject);
    procedure FireSuperButton2Click(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
  private
    FOnStartBeam: TOnStartBeamEvent;
    { Private declarations }
  public
    { Public declarations }
    FCurrBeam: TSelectFenJingBeamInfo;
    FSearchText: string;
    FYarnInfo: string;
    property OnStartBeam: TOnStartBeamEvent read FOnStartBeam write FOnStartBeam;
  end;

var
  fmFenJingBeamList: TfmFenJingBeamList;

implementation

{$R *.dfm}

uses clDBUtilUnt;

procedure TfmFenJingBeamList.FireSuperButton2Click(Sender: TObject);
begin
  self.scStyledForm1.CloseUp(False);
end;

procedure TfmFenJingBeamList.FormShow(Sender: TObject);
var
  SQL:string;
begin
  grvBeamList.OptionsView.Header := False;
  AppColor.UpdateAppColor(self);
  SQL:= 'EXEC dbo.ppGetQZOuputTaskList :sTaskType,:sArrangeNo ';
  Self.SearchEdt.Caption:=FSearchText;
  self.fdmtYarn.Query(SQL,['FenJing',FSearchText]);
end;

procedure TfmFenJingBeamList.OkBtnClick(Sender: TObject);
begin
  with fdmtYarn do
  begin
    if IsEmpty then
      exit;

    FCurrBeam.sShelfNo := FieldByName('sShelfNo').AsString;
    FCurrBeam.sBucketNo := FieldByName('sBucketNo').AsString;
    FCurrBeam.sSizingNo := FieldByName('sSizingNo').AsString;
    FCurrBeam.sArrangeNo := FieldByName('sArrangeNo').AsString;
    FCurrBeam.uTaskGuid:= FieldByName('uGuid').AsString;
    FCurrBeam.iOrderNo:= FieldByName('iOrderNo').AsInteger;
    FCurrBeam.iEnds:= FieldByName('iEnds').AsInteger;
    FCurrBeam.iSizingLen:= FieldByName('iSizingLen').AsInteger;
    FCurrBeam.sBeamNo:= FieldByName('sBeamNo').AsString;
    FCurrBeam.sFactBeamNo:= FieldByName('sFactBeamNo').AsString;

  end;
  self.scStyledForm1.CloseUp(False);
  if Assigned(FOnStartBeam) then
  begin
    FOnStartBeam(FCurrBeam.sSizingNo, FCurrBeam.sArrangeNo, FCurrBeam.uTaskGuid, FCurrBeam.sShelfNo, FCurrBeam.sBucketNo,FCurrBeam.sBeamNo,FCurrBeam.sFactBeamNo, FCurrBeam.iOrderNo,FCurrBeam.iEnds, FCurrBeam.iSizingLen);
  end;
end;

end.
