unit uFrmColorSet;

interface

uses
  VMsgMonitor, UIVMsgs, DMUnt, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkiniMaginary, scGPControls, scControls,
  scGPExtControls, dxGDIPlusClasses, Vcl.ExtCtrls, dxBarBuiltInMenu, cxPC,
  cxClasses, Vcl.ComCtrls, scExtControls, scAdvancedPager, Vcl.ActnMan,
  Vcl.ActnMenus, System.Actions, Vcl.ActnList, scStyledForm,
  Vcl.StdCtrls, Vcl.Mask,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt,
  cxStyles, cxDataStorage, cxEdit, cxNavigator,
  Data.DB, cxDBData, cxTextEdit, dxColorEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, FireDAC.Comp.DataSet, FireDAC.Comp.Client, scGPFontControls,
  cxInplaceContainer, cxVGrid, cxOI, dxSkinOffice2010Silver,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark,  cxCustomData, cxFilter,
  cxData,   FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxSkinBlack,
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
  dxSkinXmas2008Blue;

type
  TFrmColorSet = class(TForm)
    scGPPanel3: TscGPPanel;
    scGPPanel2: TscGPPanel;
    scGPGlyphButton1: TscGPGlyphButton;
    scGPGlyphButton3: TscGPGlyphButton;
    c: TscStyledForm;
    scGPGlyphButton2: TscGPGlyphButton;
    QryColor: TFDQuery;
    DataSource1: TDataSource;
    NornalColorBtn: TscColorButton;
    PressedColorBtn: TscColorButton;
    HotColorBtn: TscColorButton;
    SelectColorBtn: TscColorButton;
    MainCaptionColorBtn: TscColorButton;
    cxGrid1: TcxGrid;
    GridViewXiaoShouD: TcxGridDBTableView;
    GridViewXiaoShouDColumn1: TcxGridDBColumn;
    GridViewXiaoShouDColumn2: TcxGridDBColumn;
    GridViewXiaoShouDNornalColor: TcxGridDBColumn;
    GridViewXiaoShouDHotColor: TcxGridDBColumn;
    GridViewXiaoShouDPressedColor: TcxGridDBColumn;
    GridViewXiaoShouDSelectColor: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    LabTitle: TscGPLabel;
    scGPCharGlyphButton1: TscGPCharGlyphButton;
    cxRTTIInspector1: TcxRTTIInspector;
    scGPPanel1: TscGPPanel;
    scGPButton1: TscGPButton;
    scGPButton2: TscGPButton;
    scGPButton3: TscGPButton;
    MCEdt: TscGPEdit;
    procedure scGPGlyphButton1Click(Sender: TObject);
    procedure scGPButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NornalColorBtnChangeColor(Sender: TObject);
    procedure cxRTTIInspector1FilterProperty(Sender: TObject; const PropertyName: string; var Accept: Boolean);
    procedure scGPButton3Click(Sender: TObject);
    procedure cxRTTIInspector1DrawRowHeader(Sender: TObject; ACanvas: TcxCanvas; APainter: TcxvgPainter; AHeaderViewInfo: TcxCustomRowHeaderInfo; var Done: Boolean);
    procedure FormShow(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmColorSet: TFrmColorSet;

implementation

{$R *.dfm}
uses
  MainUnt, scDrawUtils;

procedure TFrmColorSet.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.WndParent := GetDesktopWindow;

end;

procedure TFrmColorSet.cxRTTIInspector1DrawRowHeader(Sender: TObject; ACanvas: TcxCanvas; APainter: TcxvgPainter; AHeaderViewInfo: TcxCustomRowHeaderInfo; var Done: Boolean);
var
  propCn, Str, str2: string;
  i, flag: Integer;
  CurrPropName, ParentPropName: string;
begin

  CurrPropName := AHeaderViewInfo.CaptionsInfo.Items[0].Caption;

  if not (AHeaderViewInfo.Row.parent = nil) then // 判断是否有父
  begin
    if CurrPropName = 'FocusedColor' then
      AHeaderViewInfo.CaptionsInfo.Items[0].Caption := '焦点时颜色'
    else if CurrPropName = 'NormalColor' then
      AHeaderViewInfo.CaptionsInfo.Items[0].Caption := '正常时颜色'
    else if CurrPropName = 'HotColor' then
      AHeaderViewInfo.CaptionsInfo.Items[0].Caption := '鼠标移上时颜色';

        // 有父时
//    flag := AHeaderViewInfo.Row.parent.tag;
//    if Locate('OrderID', flag, []) then
//    begin
//      ParentPropName := FieldByName('Prop').AsString;
//      if Locate('Prop;Parent;CompClass', VarArrayOf([CurrPropName, ParentPropName, CurrCompClass]), []) then
//          // 搜索父名称和自己的名称
//      begin
//        propCn := FieldByName('PropCn').AsString;
//        if not (propCn = '') then
//        begin
//          AHeaderViewInfo.CaptionsInfo.Items[0].Caption := CurrPropName + '(' + propCn + ')';
//
//        end;
//        AHeaderViewInfo.Row.tag := FieldByName('OrderID').AsInteger;
//      end ;
//
//
//    end;
  end
  else
  begin // 无父时
    if CurrPropName = 'PrimaryColor' then
      AHeaderViewInfo.CaptionsInfo.Items[0].Caption := '主颜色'
    else if CurrPropName = 'GridHeadColor' then
      AHeaderViewInfo.CaptionsInfo.Items[0].Caption := '网格标题背景色'
    else if CurrPropName = 'GridHeadFontColor' then
      AHeaderViewInfo.CaptionsInfo.Items[0].Caption := '网格标题字体颜色';
  end;
end;

procedure TFrmColorSet.cxRTTIInspector1FilterProperty(Sender: TObject; const PropertyName: string; var Accept: Boolean);
begin
  if PropertyName = 'Options' then
    Accept := True;

end;

procedure TFrmColorSet.FormCreate(Sender: TObject);
begin
  cxRTTIInspector1.InspectedObject := AppColor;
  QryColor.close;
  QryColor.open;
end;

procedure TFrmColorSet.FormShow(Sender: TObject);
begin
cxRTTIInspector1.InspectedObject := nil;
cxRTTIInspector1.InspectedObject := AppColor;
end;

procedure TFrmColorSet.NornalColorBtnChangeColor(Sender: TObject);
var
  NornalColor: TColor;
  HotColor: TColor;
  PressedColor: TColor;
  SelectColor: TColor;
  MainCaptionColor: TColor;
  i: Integer;
begin

  with MainForm do
  begin
    NornalColor := NornalColorBtn.ColorValue;
    HotColor := HotColorBtn.ColorValue;
    PressedColor := PressedColorBtn.ColorValue;
    SelectColor := SelectColorBtn.ColorValue;
    MainCaptionColor := MainCaptionColorBtn.ColorValue;

    ClientPnl.FillColor := NornalColor;
    BorderPanel.FillColor := NornalColor;
    BorderPanel.FillColor2 := NornalColor;

  //处理主菜单
    for i := 0 to MenuPnl.ControlCount - 1 do
    begin
      (MenuPnl.Controls[i] as TscGPCharGlyphButton).Options.PressedColor := PressedColor;
      (MenuPnl.Controls[i] as TscGPCharGlyphButton).Options.FramePressedColor := SelectColor;
    end;
  //处理二级菜单
    Callout.BorderColor := PressedColor;
    Callout.Color := PressedColor;
//    for i := 0 to MenuPage.ControlCount - 1 do
//    begin
//      (MenuPage.Controls[i] as Tscgppanel).FillColor := NornalColor;
//      (MenuPage.Controls[i] as Tscgppanel).FillColor2 := PressedColor;
//    end;
  end;

end;

procedure TFrmColorSet.scGPButton1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmColorSet.scGPButton3Click(Sender: TObject);
var
  vMsg: TUpdateAppColorMsg;
  i: Integer;
begin
  vMsg := TUpdateAppColorMsg.Create;
  GlobalVMsgMonitor.PostVMsg(vMsg);
  dm.CaiGouDSelectStyle.Color := LighterColor(AppColor.PrimaryColor, 65);
  Dm.Style_Select_35px.Color := LighterColor(AppColor.PrimaryColor, 65);
  Dm.SelectStyle.Color := LighterColor(AppColor.PrimaryColor, 65);
  with dm do
  begin
    for i := 0 to cxStyleRepository1.Count - 1 do
    begin
      with cxStyleRepository1.Items[i] as TcxStyle do
      begin
        if Name = 'CaiGouDSelectStyle' then
        begin

        end;

      end;
    end;
  end;
end;

procedure TFrmColorSet.scGPGlyphButton1Click(Sender: TObject);
begin
  close;
end;

end.

