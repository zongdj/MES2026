unit uFrmSelectUser;

interface

uses
  // UIVMsgs, VMsgMonitor,
  udm, Generics.Collections, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  scControls, scGPControls, scStyledForm, Vcl.Mask, scGPExtControls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxCalendar, cxTextEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, scModernControls, Vcl.ComCtrls, Vcl.StdCtrls,
  dxSkinOffice2010Silver, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, cxCustomData, cxFilter, cxData,
  dxSkiniMaginary, cxDataControllerConditionalFormattingRulesManagerDialog,
  cxDBExtLookupComboBox, cxCalc, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinXmas2008Blue;

type
  TFrmSelectUser = class(TForm)
    BtnBox: TscGPPanel;
    scStyledForm1: TscStyledForm;
    scGPPanel1: TscGPPanel;
    scGPPanel2: TscGPPanel;
    SearchEdt: TscGPEdit;
    scGPLabel5: TscGPLabel;
    OkBtn: TscGPButton;
    FireSuperButton2: TscGPButton;
    cxGrid1: TcxGrid;
    GridView: TcxGridDBTableView;
    GridViewColumn1: TcxGridDBColumn;
    MCCol: TcxGridDBColumn;
    GridViewColumn8: TcxGridDBColumn;
    GridViewColumn6: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
    procedure FireSuperButton2Click(Sender: TObject);
    procedure GridViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure scStyledForm1DropDown(ADropDownForm: TCustomForm; ADropDownControl: TControl);
    procedure scStyledForm1CloseUp(ADropDownForm: TCustomForm; ADropDownControl: TControl; AAcceptChanges: Boolean);
    procedure SearchEdtChange(Sender: TObject);
  private
    { Private declarations }
  public
    FSearchEdt: TscGPEdit;
    FUser: TUser;
    FTitleLab: TscGPLabel;
    { Public declarations }
    procedure GetZheKouDataAndCreateBtns;
  end;

var
  FrmSelectUser: TFrmSelectUser;

implementation

{$R *.dfm}

procedure TFrmSelectUser.OkBtnClick(Sender: TObject);
begin
  self.scStyledForm1.CloseUp(True);
end;

procedure TFrmSelectUser.scStyledForm1CloseUp(ADropDownForm: TCustomForm; ADropDownControl: TControl; AAcceptChanges: Boolean);
begin
  if AAcceptChanges then
  begin
    with dm.QryUser do
    begin
      if IsEmpty then
        exit;
      FUser.Id := FieldByName('Id').AsString;
      FUser.XingMing := FieldByName('XingMing').AsString;
      FUser.UserName := FieldByName('UserName').AsString;
      FTitleLab.Caption := FieldByName('XingMing').AsString;
      FSearchEdt.Text := FieldByName('XingMing').AsString;
    end;
  end;
end;

procedure TFrmSelectUser.scStyledForm1DropDown(ADropDownForm: TCustomForm; ADropDownControl: TControl);
begin
  SearchEdt.Text := FSearchEdt.Text;
  SearchEdt.SelStart := Length(SearchEdt.Text);
  SearchEdt.SelLength := length(SearchEdt.Text);
end;

procedure TFrmSelectUser.SearchEdtChange(Sender: TObject);
var
  vStr: string;
begin
  vStr := Trim(SearchEdt.Text);

  with dm.QryUser do
  begin
    if vStr.IsEmpty then
      SQL.Text := 'Select * from bUser '
    else
    begin
      vStr := QuotedStr('%' + vStr + '%');
      SQL.Text := Format('Select * from bUser where XingMing Like %s or Tel Like %s or PY Like %s', [vStr, vStr, vStr])
    end;
    Open();
  end;

end;

procedure TFrmSelectUser.FireSuperButton2Click(Sender: TObject);
begin
  scStyledForm1.CloseUp(True);
end;

procedure TFrmSelectUser.FormCreate(Sender: TObject);
begin
//   GridView.OptionsView.Header := False;
end;

procedure TFrmSelectUser.FormShow(Sender: TObject);
begin
  Dm.QryUser.Open();
  AppColor.UpdateAppColor(self);
end;

procedure TFrmSelectUser.GetZheKouDataAndCreateBtns;
begin

end;

procedure TFrmSelectUser.GridViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  OkBtnClick(nil);
end;

end.

