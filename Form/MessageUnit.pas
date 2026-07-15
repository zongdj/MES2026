unit MessageUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  scControls,
  scModernControls, scExtControls, scStyledForm, scStyleManager,
  Vcl.ExtCtrls, ShellApi, scAdvancedControls,
  scDrawUtils, scGPControls, scGPExtControls, Vcl.Menus,
  scGPFontControls, scGPPagers, LanguageManager;

type
  TMessageForm = class(TForm)
    scStyleManager1: TscStyleManager;
    scStyledForm1: TscStyledForm;
    BorderPanel: TscGPPanel;
    MessageImage: TscGPCharImage;
    MessageLabel: TscLabel;
    scGPPanel2: TscGPPanel;
    CloseButton: TscGPGlyphButton;
    btnPanel: TscGPPanel;
    GridPanel1: TGridPanel;
    scGPPanel3: TscGPPanel;
    CancelButton: TscGPButton;
    scGPPanel4: TscGPPanel;
    OkButton: TscGPButton;
    CaptionLabel: TscGPLabel;
    procedure CloseButtonClick(Sender: TObject);
    procedure scStyledForm1ChangeActive(Sender: TObject);
  end;

procedure UWPInfoMessage(const MsgCaption, Msg: string);

procedure UWPErrorMessage(const MsgCaption, Msg: string);

function UWPQuestionMessage(const MsgCaption, Msg: string): Integer;

var
  MessageForm: TMessageForm;

implementation

{$R *.dfm}

procedure UWPInfoMessage(const MsgCaption, Msg: string);
var
  F: TMessageForm;
begin
  F := TMessageForm.Create(nil);
  F.CaptionLabel.Font.Charset := DEFAULT_CHARSET;
  F.MessageLabel.Font.Charset := DEFAULT_CHARSET;
  F.CaptionLabel.Font.Name := 'Microsoft YaHei';
  F.MessageLabel.Font.Name := 'Microsoft YaHei';
  F.CaptionLabel.Caption := Translate(MsgCaption);
  F.MessageLabel.Caption := Translate(Msg);
  F.scGPPanel3.Visible := False;
  F.GridPanel1.ColumnCollection[0].Value:=0;
  F.GridPanel1.ColumnCollection[1].Value:=100;
  F.CancelButton.Caption:=Translate('取消');
  F.OkButton.Caption:=Translate('确定');
  F.ShowModal;
  F.Free;
end;

procedure UWPErrorMessage(const MsgCaption, Msg: string);
var
  F: TMessageForm;
begin
  F := TMessageForm.Create(nil);
  F.CaptionLabel.Font.Charset := DEFAULT_CHARSET;
  F.MessageLabel.Font.Charset := DEFAULT_CHARSET;
  F.CaptionLabel.Font.Name := 'Microsoft YaHei';
  F.MessageLabel.Font.Name := 'Microsoft YaHei';
  F.CaptionLabel.Caption := Translate(MsgCaption);
  F.MessageImage.ImageIndex := 87;
  F.MessageImage.ImageColor := $004040FF;
  F.BorderPanel.FrameColor := $004040FF;
  if Length(Msg)>50 then
    F.MessageLabel.Font.Size:=9
  else F.MessageLabel.Font.Size:=13;
  F.MessageLabel.Caption := Translate(Msg);
  F.scGPPanel3.Visible := False;
  F.GridPanel1.ColumnCollection[0].Value:=0;
  F.GridPanel1.ColumnCollection[1].Value:=100;
  F.CancelButton.Caption:=Translate('取消');
  F.OkButton.Caption:=Translate('确定');
  F.ShowModal;
  F.Free;
end;

function UWPQuestionMessage(const MsgCaption, Msg: string): Integer;
var
  F: TMessageForm;
begin
  F := TMessageForm.Create(nil);
  F.CaptionLabel.Font.Charset := DEFAULT_CHARSET;
  F.MessageLabel.Font.Charset := DEFAULT_CHARSET;
  F.CaptionLabel.Font.Name := 'Microsoft YaHei';
  F.MessageLabel.Font.Name := 'Microsoft YaHei';
  F.CaptionLabel.Caption := Translate(MsgCaption);
  F.MessageImage.ImageIndex := 89;
  F.MessageLabel.Caption := Translate(Msg);
  F.CancelButton.Caption:=Translate('取消');
  F.OkButton.Caption:=Translate('确定');
  F.ShowModal;
  Result := F.ModalResult;
  F.Free;
end;

procedure TMessageForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TMessageForm.scStyledForm1ChangeActive(Sender: TObject);
begin
  if Active then
  begin
    // CaptionLabel.Font.Color := clWindowText;
    CloseButton.GlyphOptions.NormalColorAlpha := 255;
  end
  else
  begin
    // CaptionLabel.Font.Color := clGray;
    CloseButton.GlyphOptions.NormalColorAlpha := 150;
  end;
end;

end.
