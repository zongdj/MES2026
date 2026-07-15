unit qmInputBoxFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, dxForms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, StdCtrls, cxButtons, hsButtons, cxTextEdit,
  hsEditors, cxLabel, Keyboard, KeyboardTypes, ExtCtrls, hsFrameUnt, cxGroupBox,
  hsGroupBox, cxMaskEdit, dxSkinsCore, dxSkiniMaginary, dxSkinOffice2010Silver,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  TfrmqmInputBox = class(TdxForm)
    txtNo: ThsMaskEdit;
    btnOK: ThsButton;
    btnCancel: ThsButton;
    tkbMain: TTouchKeyboard;
    btnNullValue: ThsButton;
    btnChange: ThsButton;
    timScanner: TTimer;
    timScannerExec: TTimer;
    pnlToolbar: ThsGroupBox;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure txtNoKeyPress(Sender: TObject; var Key: Char);
    procedure btnNullValueClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure timScannerTimer(Sender: TObject);
    procedure timScannerExecTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    //是扫描头读取繁忙
    bReadScannerBusy: Boolean;
    //是否数字
    bIsNumeric: Boolean;
    FbNullable: Boolean;
    sValue: string;

    procedure SetbNullable(const Value: Boolean);
    procedure SetValueWidth;
    //是否允许为空
    property bNullable: Boolean read FbNullable write SetbNullable;
  public
    //调用
    class function GetInputInfo(AOwner:TComponent;sCaption: string; bIsNumeric, bNullable, bDefaultNumericWithTextMode: boolean; sDefault: string; var sInput: string): Boolean;
  end;


implementation

uses pbMessageBoxFrm, pbScannerUnt;

{$R *.dfm}

procedure TfrmqmInputBox.btnCancelClick(Sender: TObject);
begin
  sValue:='';
  ModalResult:=mrCancel;
end;

procedure TfrmqmInputBox.btnChangeClick(Sender: TObject);
begin
  if tkbMain.Layout='Standard' then
  begin
    tkbMain.Layout:='NumPad';
    btnChange.Caption:='字符(&S)';
  end
  else
  begin
    tkbMain.Layout:='Standard';
    btnChange.Caption:='数字(&D)';
  end;

  txtNo.SetFocus;
  if Trim(txtNo.Text)<>'' then
  begin
    txtNo.SelStart:=Length(txtNo.Text);
  end;
end;

procedure TfrmqmInputBox.btnNullValueClick(Sender: TObject);
begin
  if bIsNumeric then
    sValue:='0'
  else
    sValue:='';

  ModalResult:=mrOk;
end;

procedure TfrmqmInputBox.btnOKClick(Sender: TObject);
var
  s: string;
begin
  s := Trim(txtNo.Text);
  if (s = '') and not bNullable then
  begin
    txtNo.SetFocus;
    txtNo.SelectAll;
    TfrmpbMessageBox.ShowWarningMessage(Self,'输入内容不能为空！', '警告', True);
    Exit;
  end;

  if (s <> '') and bIsNumeric then
  begin
    try
      StrToFloat(s);
    except
      on E:Exception do
      begin
        txtNo.SetFocus;
        txtNo.SelectAll;
        TfrmpbMessageBox.ShowErrorMessage(Self,'输入内容必须为数字！\r\n%s', '错误', True,[E.Message]);
        Exit;
      end;
    end;
  end;

  sValue:=s;
  ModalResult:=mrOk;
end;

procedure TfrmqmInputBox.FormActivate(Sender: TObject);
begin
  if txtNo.CanFocus then
    txtNo.SetFocus;
end;

procedure TfrmqmInputBox.FormShow(Sender: TObject);
begin
  if pbScannerUnt.ComScannerSerialOpened then
  begin
    ComScannerCurrValue:='';
    timScanner.Enabled:=True;
  end;
end;

class function TfrmqmInputBox.GetInputInfo(AOwner:TComponent; sCaption: string; bIsNumeric, bNullable, bDefaultNumericWithTextMode: boolean; sDefault: string; var sInput: string): Boolean;
var
  oForm: TfrmqmInputBox;
begin
  Result:=False;
  sInput:='';
  oForm:=TfrmqmInputBox.Create(AOwner);
  try
    if Trim(sCaption)<>'' then
      oForm.Caption:=hsFrame.TranslateMessageSelf(sCaption);
    oForm.txtNo.Text:=sDefault;
    oForm.bNullable:=bNullable;
    if bIsNumeric then
    begin
      oForm.tkbMain.Layout:='NumPad';
      oForm.txtNo.Properties.MaskKind := emkRegExpr;
      oForm.txtNo.Properties.EditMask := '\-?\d+\.?\d+?';
    end
    else
    begin
      if bDefaultNumericWithTextMode then
      begin
        oForm.tkbMain.Layout:='NumPad';
        oForm.btnChange.Caption:=hsFrame.TranslateMessageSelf('字符(&S)');
      end;
    end;
    oForm.bIsNumeric:=bIsNumeric;
    oForm.SetValueWidth;

    if oForm.ShowModal=mrOk then
    begin
      sInput:=oForm.sValue;
      Result:=True;
    end;
  finally
    oForm.Free;
  end;
end;

procedure TfrmqmInputBox.SetbNullable(const Value: Boolean);
begin
  FbNullable := Value;
  if not FbNullable then
  begin
    txtNo.Left:=2;
    txtNo.Width:=btnOK.Left-5;
    btnNullValue.Visible:=False;
  end;
end;

procedure TfrmqmInputBox.SetValueWidth;
begin
  btnNullValue.Visible:=FbNullable;
  btnChange.Visible:=(not bIsNumeric);
  if (not btnNullValue.Visible) and btnChange.Visible then
    btnChange.Left:=2;
  if btnChange.Visible then
  begin
    txtNo.Left:=btnChange.Left+btnChange.Width+2;
    txtNo.Width:=btnOK.Left-txtNo.Left-2;
  end
  else
  begin
    if btnNullValue.Visible then
    begin
      txtNo.Left:=btnNullValue.Width+2+2;
      txtNo.Width:=btnOK.Left-txtNo.Left-2;
    end
    else
    begin
      txtNo.Left:=2;
      txtNo.Width:=btnOK.Left-4;
    end;
  end;

  hsFrame.LanguageTranslateForm(Self);
end;

procedure TfrmqmInputBox.timScannerExecTimer(Sender: TObject);
begin
  timScannerExec.Enabled:=False;
  if btnOK.Visible and btnOK.Enabled then
    btnOK.Click;
end;

procedure TfrmqmInputBox.timScannerTimer(Sender: TObject);
var
  sNo: string;
begin
  if (bReadScannerBusy) then
    Exit;
  bReadScannerBusy:= true;
  try
    if Trim(ComScannerCurrValue)<>'' then
    begin
      sNo:=ComScannerCurrValue;
      ComScannerCurrValue:='';
      txtNo.Text:=sNo;
      timScannerExec.Enabled:=True;
    end;
  finally
    bReadScannerBusy:= False;
  end;

end;

procedure TfrmqmInputBox.txtNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    btnOK.Click;
  end;
end;

end.
