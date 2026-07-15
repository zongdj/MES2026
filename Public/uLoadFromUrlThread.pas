unit uLoadFromUrlThread;

interface

uses
  dxSmartImage, VMsgMonitor, UIVMsgs, DMUnt, Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, uFrmGPBase, scStyledForm, scGPControls, scControls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, //dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxTextEdit,
  cxDBLookupComboBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, scModernControls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxCurrencyEdit, Soap.EncdDecd, System.Net.HttpClientComponent,
  scHtmlControls, cxCalc, cxImage, //uMyLib.PictureHelper,
  cxGridDBDataDefinitions;

type
  TLoadFromUrlThread = class(TThread)
  private
    FMem: TDataSet;
    FImgValue: AnsiString;
    FUrl: string;
    FRecordIndex: Integer;
    FPictureColumnIndex: Integer;
    FFlag: Integer;
    FHandle: Int64;
    FImageStream: TMemoryStream;
    FDataController: TcxGridDBDataController;
    { Private declarations }
    procedure UpdateImage;
  protected
    procedure Execute; override;
  public
    constructor Create(AUrl: string; ADataController: TcxGridDBDataController; ARecordIndex, APictureColumnIndex: Integer; AFlag: Integer; AHandle: Int64; mem: TDataSet); overload;
    destructor Destroy; override;
//    procedure Free; reintroduce;
  end;

implementation


//procedure LoadPictures(ADataController: TcxCustomDataController;
//  AFileNameColumnIndex, APictureColumnIndex: Integer);
//var
//  I: Integer;
//begin
//  ADataController.BeginUpdate;
//  try
//    for I := 0 to ADataController.RecordCount - 1 do
//      UpdateRecordPicture(ADataController, I, AFileNameColumnIndex,
//        APictureColumnIndex);
//  finally
//    ADataController.EndUpdate;
//  end;
//end;


{ TLoadFromUrlThread }

constructor TLoadFromUrlThread.Create(AUrl: string; ADataController: TcxGridDBDataController; ARecordIndex, APictureColumnIndex, AFlag: Integer; AHandle: Int64; mem: TDataSet);
begin
  Create(False);
  FImgValue := '';
  FUrl := 'https://www.likefont.com/images/advert/fontgoods/fontgoods300_250r.png'; // AUrl;
  FDataController := ADataController;
  FRecordIndex := ARecordIndex;
  FPictureColumnIndex := APictureColumnIndex;
  FFlag := AFlag;
  FHandle := AHandle;
  FImageStream := TMemoryStream.Create;
  FMem := mem;
end;

destructor TLoadFromUrlThread.Destroy;
begin
  FImageStream.DisposeOf;
  inherited;
end;

procedure TLoadFromUrlThread.Execute;
var
  vHTTPClient: TNetHTTPClient;
  APicture: TPicture;
  vImage: TcxImage;
begin
  FreeOnTerminate := True;
  if FDataController = nil then
    exit;

  vHTTPClient := TNetHTTPClient.Create(nil);
  vHTTPClient.ConnectionTimeout := 3000;
  vHTTPClient.ResponseTimeout := 10000;
  try
    try
      vHTTPClient.Get(FUrl, FImageStream);
      if FImageStream.Size > 0 then
      begin
        vImage := TcxImage.Create(nil);
        APicture := TPicture.Create;
        try
          FreeOnTerminate := True;
          while True do

          begin
            if Terminated then
              break;
            if FMem.RecordCount>0 then
            begin
               vImage.Picture.LoadFromStream(FImageStream);
              APicture.Assign(vImage.Picture);
             SavePicture(APicture, FImgValue);
            end;


          end;

        finally
          vImage.free;
          APicture.Free;
        end;
      end;
      Synchronize(UpdateImage);
    except

    end;
  finally
    vHTTPClient.DisposeOf;
  end;
end;

procedure TLoadFromUrlThread.UpdateImage;
begin
  if FDataController = nil then
    exit;
//  FDataController.DataSet.MoveBy(FRecordIndex);
//  FDataController.DataSet.Edit;
//  FDataController.DataSet.FieldByName('ImageValue').Value := FImgValue;
//  FDataController.DataSet.Post;

 // FDataController.SetValue(FRecordIndex, fPictureColumnIndex, FImgValue);
  FDataController.Values[FRecordIndex, fPictureColumnIndex] := FImgValue;
end;

end.

