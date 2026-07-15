unit ProcessBarUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxControls, cxContainer, cxEdit,
  cxProgressBar, ExtCtrls, Buttons, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, jpeg, cxImage, cxGroupBox, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxGDIPlusClasses;

type
  TfmProcessBar = class(TForm)
    lblProcessing: TcxLabel;
    pgbMain: TcxProgressBar;
    Image1: TcxImage;
    pnlBase: TcxGroupBox;
  private
    procedure SetProcessBar(sText: string; iPosition: Integer = -1;
      iMin: Integer = 0; iMax: Integer = 100);
  public
    class procedure ShowProcessBar(sText: string;
      iPosition: Integer = -1; iMin: Integer = 0; iMax: Integer = 100);
    class procedure UpdateProcessBar(sText: string;
      iPosition: Integer = -1; iMin: Integer = 0; iMax: Integer = 100);
    class procedure HideProcessBar;
    procedure AfterConstruction; override;
  end;

implementation

{$R *.dfm}

uses FrameCommonUnt;

var
  FProcessBar: TfmProcessBar;

  { TfmHsProcessBar }

procedure TfmProcessBar.AfterConstruction;
begin
  inherited;
  //LoadPictureFromResource(Image1.Picture, 'ProcessBarImg');
end;

class procedure TfmProcessBar.HideProcessBar;
begin
  if AsSigned(FProcessBar) then
    FProcessBar.Close;
end;

procedure TfmProcessBar.SetProcessBar(sText: string;
  iPosition, iMin, iMax: Integer);
begin
  lblProcessing.Caption := sText;
  if (iMax <= 0) or (iPosition < 0) then
  begin
    pgbMain.Properties.Marquee := True;
  end
  else
  begin
    pgbMain.Properties.Marquee := False;
    pgbMain.Properties.ShowTextStyle := cxtsPercent;
    pgbMain.Properties.Min := iMin;
    pgbMain.Properties.Max := iMax;
    pgbMain.Position := iPosition;
  end;
end;

class procedure TfmProcessBar.ShowProcessBar(sText: string; iPosition, iMin,
  iMax: Integer);
begin
  if not AsSigned(FProcessBar) then
    FProcessBar := TfmProcessBar.Create(nil);
  FProcessBar.SetProcessBar(sText, iPosition, iMin, iMax);
  FProcessBar.ShowModal;
end;

class procedure TfmProcessBar.UpdateProcessBar(sText: string;
  iPosition, iMin, iMax: Integer);
begin
  if AsSigned(FProcessBar) then
    FProcessBar.SetProcessBar(sText, iPosition, iMin, iMax);
end;

initialization

finalization

FreeAndNil(FProcessBar);

end.
