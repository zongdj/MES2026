unit uFrmColConfig;

interface

uses
  uDm, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmGPBaseHasBtn,
  scStyledForm, Vcl.ExtCtrls, scGPControls, scControls, scGPImages,
  scGPFontControls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkiniMaginary, dxSkinOffice2010Silver,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog,
  Data.DB, cxDBData, cxTextEdit, cxCheckBox, cxCalc, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, dxBar, Vcl.Grids, Vcl.DBGrids,
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
  TFrmColConfig = class(TFrmGPBaseHasBtn)
    cxGrid1: TcxGrid;
    GridView: TcxGridDBTableView;
    GridViewColumn1: TcxGridDBColumn;
    MCCol: TcxGridDBColumn;
    GridViewColumn8: TcxGridDBColumn;
    GridViewColumn6: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    QryCol: TFDQuery;
    dsShangPin: TDataSource;
    QryColid: TFDAutoIncField;
    QryColCreateDate: TSQLTimeStampField;
    QryColOrderId: TIntegerField;
    QryColFieldName: TStringField;
    QryColCnName: TStringField;
    QryColIsVisible: TIntegerField;
    QryColWidth: TIntegerField;
    QryColdefCnName: TStringField;
    QryColdefOrderId: TIntegerField;
    QryColModelName: TStringField;
    QryColColName: TStringField;
    QryColGridViewName: TStringField;
    GridViewColumn2: TcxGridDBColumn;
    scGPPanel3: TscGPPanel;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarDockControl1: TdxBarDockControl;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure GridViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure dxBarLargeButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmColConfig: TFrmColConfig;

implementation

{$R *.dfm}

procedure TFrmColConfig.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;

end;

procedure TFrmColConfig.dxBarLargeButton1Click(Sender: TObject);
var
  n1, n2: Integer;
begin
  with QryCol do
  begin

    DisableControls;
    n1 := FieldByName('OrderId').AsInteger;
    Next;
    if Eof then
    begin
      EnableControls;
      Exit;
    end;

    n2 := FieldByName('OrderId').AsInteger;
    //
    Edit;
    FieldByName('OrderId').AsInteger := n1;
    Post;
    //
    Prior;
    Edit;
    FieldByName('OrderId').AsInteger := n2;
    Post;
    Close;
    Open;
    Locate('OrderId', n2);
    EnableControls;
  end;

end;

procedure TFrmColConfig.dxBarLargeButton2Click(Sender: TObject);
var
  n1, n2: Integer;
begin
  with QryCol do
  begin

    DisableControls;
    n1 := FieldByName('OrderId').AsInteger;
    Prior;
    if Bof then
    begin
      EnableControls;
      Exit;
    end;

    n2 := FieldByName('OrderId').AsInteger;
    Edit;
    FieldByName('OrderId').AsInteger := n1;
    Post;
    Next;
    Edit;
    FieldByName('OrderId').AsInteger := n2;
    Post;

    Close;
    Open;
    Locate('OrderId', n2);
    EnableControls;
  end;

end;

procedure TFrmColConfig.dxBarLargeButton4Click(Sender: TObject);
begin
  Dm.FDConnection1.ExecSQL('Update bGridView_Congfig set OrderId=defOrderId,CnName=defCnName, Width=defWidth');
  QryCol.Close;
  QryCol.Open();
end;

procedure TFrmColConfig.FormShow(Sender: TObject);
begin
  inherited;
  QryCol.Open();
end;

procedure TFrmColConfig.GridViewCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
   if AViewInfo.Item.VisibleIndex = Sender.VisibleItemCount - 1 then
    AViewInfo.Borders := AViewInfo.Borders - [bRight];


end;

end.

