unit ufraModuleReport;

interface

uses
  DMUnt,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  ufraModuleBase, System.Actions, Vcl.ActnList, scControls, scGPControls,
  scGPPagers, scImageCollection, VclTee.TeeGDIPlus, VclTee.Series, Vcl.ExtCtrls,
  Data.DB, VclTee.DBChart, scGPImages, scGPFontControls, VclTee.TeEngine,
  VclTee.TeeSpline, VclTee.TeeProcs, VclTee.Chart, cxClasses, cxStyles,
  scModernControls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkiniMaginary, dxSkinOffice2010Silver, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData,
  cxGridCustomLayoutView, cxGridCardView, cxGridDBCardView, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
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
  TfraModuleReport = class(TfraModuleBase)
    scGPPanel1: TscGPPanel;
    scGPLabel1: TscGPLabel;
    scGPPageControl1: TscGPPageControl;
    scGPPageControlPage3: TscGPPageControlPage;
    scGPPageControlPage2: TscGPPageControlPage;
    scGPPageControlPage1: TscGPPageControlPage;
    scGPPageControlPage4: TscGPPageControlPage;
    scImageCollection1: TscImageCollection;
    scGPPanel15: TscGPPanel;
    scGPPanel16: TscGPPanel;
    scGPPanel17: TscGPPanel;
    scGPLabel14: TscGPLabel;
    scGPPanel18: TscGPPanel;
    scGPPanel19: TscGPPanel;
    scGPLabel15: TscGPLabel;
    Chart2: TDBChart;
    BarSeries1: TBarSeries;
    scGPPanel20: TscGPPanel;
    scGPPanel21: TscGPPanel;
    scGPLabel16: TscGPLabel;
    DBChart2: TDBChart;
    PieSeries2: TPieSeries;
    DBChart1: TDBChart;
    btnSwitchMonthChart: TscGPButton;
    Series1: TBarSeries;
    imgData80: TscGPImageCollection;
    scGPPanel22: TscGPPanel;
    scGPPanel23: TscGPPanel;
    scGPImage1: TscGPImage;
    scGPLabel17: TscGPLabel;
    lab_DayCount: TscGPLabel;
    scGPPanel24: TscGPPanel;
    scGPImage2: TscGPImage;
    scGPLabel18: TscGPLabel;
    lab_WeekCount: TscGPLabel;
    scGPPanel25: TscGPPanel;
    scGPImage3: TscGPImage;
    scGPLabel19: TscGPLabel;
    lab_MonthCount: TscGPLabel;
    scGPPanel26: TscGPPanel;
    scGPImage4: TscGPImage;
    scGPLabel20: TscGPLabel;
    lab_Count: TscGPLabel;
    scGPPanel27: TscGPPanel;
    scGPPanel28: TscGPPanel;
    scGPLabel21: TscGPLabel;
    DBChart3: TDBChart;
    Series2: TLineSeries;
    TeeGDIPlus1: TTeeGDIPlus;
    scGPPanel29: TscGPPanel;
    scGPPanel30: TscGPPanel;
    scGPLabel22: TscGPLabel;
    DBChart4: TDBChart;
    LineSeries1: TLineSeries;
    Series3: TAreaSeries;
    scGridPanel1: TscGridPanel;
    scGPPanel5: TscGPPanel;
    scGPLabel4: TscGPLabel;
    scGPPanel6: TscGPPanel;
    scGPLabel5: TscGPLabel;
    scGPPanel7: TscGPPanel;
    scGPLabel6: TscGPLabel;
    scGPPanel8: TscGPPanel;
    scGPLabel7: TscGPLabel;
    scGPPanel13: TscGPPanel;
    scGPLabel12: TscGPLabel;
    scGPPanel14: TscGPPanel;
    scGPLabel13: TscGPLabel;
    scGPPanel11: TscGPPanel;
    scGPLabel10: TscGPLabel;
    scGPPanel12: TscGPPanel;
    scGPLabel11: TscGPLabel;
    scGPPanel9: TscGPPanel;
    scGPLabel8: TscGPLabel;
    scGPPanel10: TscGPPanel;
    scGPLabel9: TscGPLabel;
    scGPPanel3: TscGPPanel;
    scGPLabel2: TscGPLabel;
    scGPPanel4: TscGPPanel;
    scGPLabel3: TscGPLabel;
    dsShangPin: TDataSource;
    QryShangPin: TFDQuery;
    QryShangPinid: TFDAutoIncField;
    QryShangPin商品名称: TStringField;
    QryShangPin规格: TStringField;
    QryShangPin进价: TFMTBCDField;
    QryShangPin零售价: TFMTBCDField;
    QryShangPin库存: TIntegerField;
    QryShangPin拼音码: TStringField;
    QryShangPin商品编码: TStringField;
    QryShangPin备注: TStringField;
    QryShangPin条码: TStringField;
    QryShangPin单位: TStringField;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1id: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView2id: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn7: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn8: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn9: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle_Row: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
  private
    { Private declarations }
  public
    { Public declarations }
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
  fraModuleReport: TfraModuleReport;

implementation

{$R *.dfm}
{ TfraModuleReport }

procedure TfraModuleReport.CloseData;
begin
  inherited;

end;

procedure TfraModuleReport.CloseModule;
begin

end;

constructor TfraModuleReport.Create(AOwner: TComponent);
begin
  inherited;
   //QryShangPin.Open();
end;

destructor TfraModuleReport.Destroy;
begin

  inherited;
end;

procedure TfraModuleReport.GetData;
begin
  inherited;

end;

procedure TfraModuleReport.InitModuleLayout;
begin
  inherited;

end;

procedure TfraModuleReport.InitShortCut;
begin
  inherited;

end;

procedure TfraModuleReport.LockChangeEvent(lType: Integer);
begin
  inherited;

end;

procedure TfraModuleReport.RemoveShortCut;
begin
  inherited;

end;

procedure TfraModuleReport.SetDetailPrivilege;
begin
  inherited;

end;

initialization
  RegisterClass(TfraModuleReport);

end.

