unit uFrmSelectSkin;

interface

uses
  GraphUtil, uIniOptions, UAppColor, DMUnt, Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, scStyledForm, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore,

  scGPControls, scColorControls,
  dxCustomTileControl, cxClasses, dxTileControl, scControls, scGPPagers,
  System.ImageList, Vcl.ImgList, cxImageList, Vcl.StdCtrls, Vcl.Mask,
  scGPExtControls, scModernControls, dxSkinOffice2010Silver,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkiniMaginary, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue   ;

type
  TFrmSelectSkin = class(TForm)
    scStyledForm1: TscStyledForm;
    scGPPanel1: TscGPPanel;
    ColorPage: TscGPPageControl;
    themePage: TscGPPageControlPage;
    customPage: TscGPPageControlPage;
    ColorTile: TdxTileControl;
    dxTileControl1Item1: TdxTileControlItem;
    dxTileControl1Item2: TdxTileControlItem;
    dxTileControl1Item3: TdxTileControlItem;
    dxTileControl1Item4: TdxTileControlItem;
    dxTileControl1Item5: TdxTileControlItem;
    dxTileControl1Item6: TdxTileControlItem;
    ColorTileGroup: TdxTileControlGroup;
    dxTileControl1Item8: TdxTileControlItem;
    dxTileControl1Item9: TdxTileControlItem;
    dxTileControl1Item10: TdxTileControlItem;
    dxTileControl1Item11: TdxTileControlItem;
    dxTileControl1Item7: TdxTileControlItem;
    dxTileControl1Item12: TdxTileControlItem;
    dxTileControl1Item13: TdxTileControlItem;
    dxTileControl1Item14: TdxTileControlItem;
    dxTileControl1Item15: TdxTileControlItem;
    dxTileControl1Item16: TdxTileControlItem;
    dxTileControl1Item17: TdxTileControlItem;
    dxTileControl1Item18: TdxTileControlItem;
    cxImageList1: TcxImageList;
    scGPLabel1: TscGPLabel;
    HSColorPicker: TscHSColorPicker;
    scLColorPicker1: TscLColorPicker;
    ColorEdt: TscGPEdit;
    FireSuperButton3: TscGPButton;
    ColorTileItem1: TdxTileControlItem;
    ColorTileItem2: TdxTileControlItem;
    ColorTileItem4: TdxTileControlItem;
    ColorTileItem3: TdxTileControlItem;
    ColorTileItem5: TdxTileControlItem;
    ColorTileItem6: TdxTileControlItem;
    ColorTileItem7: TdxTileControlItem;
    ColorTileItem8: TdxTileControlItem;
    ColorTileItem9: TdxTileControlItem;
    IsUseColorSkinSwitch: TscGPToggleSwitch;
    procedure dxTileControl1Item8Click(Sender: TdxTileControlItem);
    procedure HSColorPickerChange(Sender: TObject);
    procedure scLColorPicker1Change(Sender: TObject);
    procedure scStyledForm1DropDown(ADropDownForm: TCustomForm; ADropDownControl: TControl);
    procedure ColorEdtChange(Sender: TObject);
    procedure ColorTileItem4Click(Sender: TdxTileControlItem);
    procedure IsUseColorSkinSwitchChangeState(Sender: TObject);
    procedure FireSuperButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelectSkin: TFrmSelectSkin;

implementation

{$R *.dfm}



procedure TFrmSelectSkin.ColorTileItem4Click(Sender: TdxTileControlItem);
begin
  ColorPage.ActivePage := customPage;
end;

procedure TFrmSelectSkin.dxTileControl1Item8Click(Sender: TdxTileControlItem);
var
  i: Integer;
  vColor: TColor;
begin
  vColor := Sender.Style.GradientBeginColor;
  for i := 0 to ColorTileGroup.ItemCount - 1 do
    ColorTileGroup.Items[i].Glyph.ImageIndex := -1;
  Sender.Glyph.ImageIndex := 0;

  AppColor.PrimaryColor := vColor;
  appcolor.UpdateColor;
  IniOptions.PrimaryColor := vColor;
  SaveAppColorObj;

  try
    IniOptions.SaveToFile(ExtractFilePath(ParamStr(0)) + '\data\config.InI');
  except
    on E: Exception do
      ShowMessage(e.Message);
  end;

  scLColorPicker1.OnChange := nil;
  HSColorPicker.SelectedColor := vColor;
  scLColorPicker1.SelectedColor := vColor;
  scLColorPicker1.OnChange := scLColorPicker1Change;
end;

procedure TFrmSelectSkin.FireSuperButton3Click(Sender: TObject);
begin
  ShowMessage('下个版本完善此功能');
   //该功能还需完善。临时注释
//  if not Assigned(FrmColorSet) then
//    FrmColorSet := TFrmColorSet.Create(Self);
//  FrmColorSet.Show;
end;

procedure TFrmSelectSkin.HSColorPickerChange(Sender: TObject);
begin
  scLColorPicker1.SelectedColor := HSColorPicker.SelectedColor;

end;

procedure TFrmSelectSkin.IsUseColorSkinSwitchChangeState(Sender: TObject);
begin
  AppColor.IsUseColorSkin := IsUseColorSkinSwitch.IsOn;
  AppColor.UpdateColor;
  IniOptions.IsUseColorSkin := AppColor.IsUseColorSkin;
  IniOptions.PrimaryColor := AppColor.PrimaryColor;
  SaveAppColorObj;
  try
    IniOptions.SaveToFile(ExtractFilePath(ParamStr(0)) + '\data\config.InI');
  except
    on E: Exception do
      ShowMessage(e.Message);
  end;
end;

procedure TFrmSelectSkin.scLColorPicker1Change(Sender: TObject);
begin
  AppColor.PrimaryColor := scLColorPicker1.SelectedColor;
  appcolor.UpdateColor;
  IniOptions.PrimaryColor := AppColor.PrimaryColor;
  SaveAppColorObj;
  try
    IniOptions.SaveToFile(ExtractFilePath(ParamStr(0)) + '\data\config.InI');
  except
    on E: Exception do
      ShowMessage(e.Message);
  end;

end;

procedure TFrmSelectSkin.scStyledForm1DropDown(ADropDownForm: TCustomForm; ADropDownControl: TControl);
var
  i: Integer;
begin
  for i := 0 to ColorTileGroup.ItemCount - 2 do
    if ColorTileGroup.Items[i].Style.GradientBeginColor = AppColor.PrimaryColor then
    begin
      ColorTileGroup.Items[i].Glyph.ImageIndex := 0;
      Break;
    end
    else
      ColorTileGroup.Items[i].Glyph.ImageIndex := -1;
  if i > (ColorTileGroup.ItemCount - 2) then
  begin
    ColorTileItem4.Style.GradientBeginColor := AppColor.PrimaryColor;
    ColorTileItem4.Glyph.ImageIndex := 0
  end
  else
  begin
    ColorTileItem4.Glyph.ImageIndex := -1;
    ColorTileItem4.Style.GradientBeginColor := clDefault;
  end;
  scLColorPicker1.OnChange := nil;
  HSColorPicker.SelectedColor := AppColor.PrimaryColor;
  scLColorPicker1.SelectedColor := AppColor.PrimaryColor;
  scLColorPicker1.OnChange := scLColorPicker1Change;
  IsUseColorSkinSwitch.OnChangeState := nil;
  if AppColor.IsUseColorSkin then
    IsUseColorSkinSwitch.State := scswOn
  else
    IsUseColorSkinSwitch.State := scswOff;
  IsUseColorSkinSwitch.OnChangeState := IsUseColorSkinSwitchChangeState;
  ColorPage.ActivePage := themePage;
end;

procedure TFrmSelectSkin.ColorEdtChange(Sender: TObject);
var
  i: Integer;
  vColor: TColor;
begin
  try
    ColorEdt.Text := trim(ColorEdt.Text);
    if ColorEdt.Text = string.Empty then
      exit;
    if Pos('#', ColorEdt.Text) <= 0 then
      ColorEdt.Text := '#' + ColorEdt.Text;

    vColor := WebColorStrToColor(ColorEdt.Text);
    HSColorPicker.SelectedColor := vColor;
  except
    on E: Exception do
      ShowMessage(e.Message);
  end;
end;

end.

