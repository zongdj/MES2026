unit pbMessageBoxFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, dxForms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMemo, hsEditors, StdCtrls, cxButtons,
  hsButtons, cxLabel, ExtCtrls, hsFrameUnt, dxSkinsCore, dxSkinLilian,
  cxGroupBox, hsGroupBox, dxSkiniMaginary, dxSkinOffice2010Silver,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark;

type
  TfrmpbMessageBox = class(TdxForm)
    btnOK: ThsButton;
    btnCancel: ThsButton;
    lblMessage: ThsLabel;
    timClose: TTimer;
    pnlMain: ThsGroupBox;
    pnlToolbar: ThsGroupBox;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure timCloseTimer(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
    // 设置按钮及位置
    procedure SetButtonLocation(bQuestion: Boolean);
    // 信息提醒
    class function ShowInfoMessage(AOwner: TComponent; sMsg, sCaption: string;
      bAutoClose: Boolean; MsgArgs: array of const): Integer; overload;
    class function ShowInfoMessage(AOwner: TComponent; sMsg, sCaption: string;
      bAutoClose: Boolean = true): Integer; overload;
    // 警告提醒
    class function ShowWarningMessage(AOwner: TComponent;
      sMsg, sCaption: string; bAutoClose: Boolean; MsgArgs: array of const)
      : Integer; overload;
    class function ShowWarningMessage(AOwner: TComponent;
      sMsg, sCaption: string; bAutoClose: Boolean = true): Integer; overload;
    // 错误提醒
    class function ShowErrorMessage(AOwner: TComponent; sMsg, sCaption: string;
      bAutoClose: Boolean; MsgArgs: array of const): Integer; overload;
    class function ShowErrorMessage(AOwner: TComponent; sMsg, sCaption: string;
      bAutoClose: Boolean = true): Integer; overload;
    // 问答提醒
    class function ShowQuestionMessage(AOwner: TComponent;
      sMsg, sCaption: string; bAutoClose: Boolean; MsgArgs: array of const)
      : Integer; overload;
    class function ShowQuestionMessage(AOwner: TComponent;
      sMsg, sCaption: string; bAutoClose: Boolean = true): Integer; overload;
    procedure AfterConstruction; override;
  end;

implementation

{$R *.dfm}
{ TfrmpbMessageBox }

procedure TfrmpbMessageBox.AfterConstruction;
begin
  inherited;
  hsFrame.LanguageTranslateForm(Self);
end;

procedure TfrmpbMessageBox.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmpbMessageBox.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmpbMessageBox.SetButtonLocation(bQuestion: Boolean);
begin
  if bQuestion then
  begin
    btnOK.Left := Round(Self.Width / 2) - btnOK.Width - 6;
    btnCancel.Left := Round(Self.Width / 2) + 6;
    btnOK.Visible := true;
    btnCancel.Visible := true;
  end
  else
  begin
    btnOK.Left := Round((Self.Width - btnOK.Width) / 2);
    btnOK.Visible := true;
  end;
end;

class function TfrmpbMessageBox.ShowErrorMessage(AOwner: TComponent;
  sMsg, sCaption: string; bAutoClose: Boolean; MsgArgs: array of const)
  : Integer;
var
  oForm: TfrmpbMessageBox;
  i: Integer;
begin
  oForm := TfrmpbMessageBox.Create(AOwner);
  try
    oForm.SetButtonLocation(False);
    i := Pos('[SQL Server]', sMsg);
    if i > 0 then
      System.Delete(sMsg, 1, i + 11);
    i := Pos('(SERVER)', sMsg);
    if i > 0 then
      System.Delete(sMsg, i, MaxInt);
    oForm.Caption := hsFrame.TranslateMessageSelf(sCaption);
    sMsg := Format(hsFrame.TranslateMessageSelf(sMsg), MsgArgs);
    sMsg := StringReplace(sMsg, '\r', #13, [rfReplaceAll]);
    sMsg := StringReplace(sMsg, '\n', #13, [rfReplaceAll]);
    oForm.lblMessage.Caption := sMsg;
    oForm.timClose.Enabled := bAutoClose;
    oForm.ShowModal;
  finally
    oForm.Free;
  end;

  Result := mrOk;
end;

class function TfrmpbMessageBox.ShowInfoMessage(AOwner: TComponent;
  sMsg, sCaption: string; bAutoClose: Boolean; MsgArgs: array of const)
  : Integer;
var
  oForm: TfrmpbMessageBox;
  i: Integer;
begin
  oForm := TfrmpbMessageBox.Create(AOwner);
  try
    oForm.SetButtonLocation(False);
    i := Pos('[SQL Server]', sMsg);
    if i > 0 then
      System.Delete(sMsg, 1, i + 11);
    i := Pos('(SERVER)', sMsg);
    if i > 0 then
      System.Delete(sMsg, i, MaxInt);
    oForm.Caption := hsFrame.TranslateMessageSelf(sCaption);
    sMsg := Format(hsFrame.TranslateMessageSelf(sMsg), MsgArgs);
    sMsg := StringReplace(sMsg, '\r', #13, [rfReplaceAll]);
    sMsg := StringReplace(sMsg, '\n', #13, [rfReplaceAll]);
    oForm.lblMessage.Caption := sMsg;
    oForm.timClose.Enabled := bAutoClose;
    oForm.ShowModal;
  finally
    oForm.Free;
  end;

  Result := mrOk;
end;

class function TfrmpbMessageBox.ShowQuestionMessage(AOwner: TComponent;
  sMsg, sCaption: string; bAutoClose: Boolean; MsgArgs: array of const)
  : Integer;
var
  oForm: TfrmpbMessageBox;
  i: Integer;
begin
  oForm := TfrmpbMessageBox.Create(AOwner);
  try
    oForm.SetButtonLocation(true);
    i := Pos('[SQL Server]', sMsg);
    if i > 0 then
      System.Delete(sMsg, 1, i + 11);
    i := Pos('(SERVER)', sMsg);
    if i > 0 then
      System.Delete(sMsg, i, MaxInt);
    oForm.Caption := hsFrame.TranslateMessageSelf(sCaption);
    sMsg := Format(hsFrame.TranslateMessageSelf(sMsg), MsgArgs);
    sMsg := StringReplace(sMsg, '\r', #13, [rfReplaceAll]);
    sMsg := StringReplace(sMsg, '\n', #13, [rfReplaceAll]);
    oForm.lblMessage.Caption := sMsg;
    oForm.timClose.Enabled := bAutoClose;
    Result := oForm.ShowModal;
  finally
    oForm.Free;
  end;
end;

class function TfrmpbMessageBox.ShowWarningMessage(AOwner: TComponent;
  sMsg, sCaption: string; bAutoClose: Boolean; MsgArgs: array of const)
  : Integer;
var
  oForm: TfrmpbMessageBox;
  i: Integer;
begin
  oForm := TfrmpbMessageBox.Create(AOwner);
  try
    oForm.SetButtonLocation(False);
    i := Pos('[SQL Server]', sMsg);
    if i > 0 then
      System.Delete(sMsg, 1, i + 11);
    i := Pos('(SERVER)', sMsg);
    if i > 0 then
      System.Delete(sMsg, i, MaxInt);
    oForm.Caption := hsFrame.TranslateMessageSelf(sCaption);
    sMsg := Format(hsFrame.TranslateMessageSelf(sMsg), MsgArgs);
    sMsg := StringReplace(sMsg, '\r', #13, [rfReplaceAll]);
    sMsg := StringReplace(sMsg, '\n', #13, [rfReplaceAll]);
    oForm.lblMessage.Caption := sMsg;
    oForm.timClose.Enabled := bAutoClose;
    oForm.ShowModal;
  finally
    oForm.Free;
  end;
  Result := mrOk;
end;

procedure TfrmpbMessageBox.timCloseTimer(Sender: TObject);
begin
  timClose.Enabled := False;
  ModalResult := mrCancel;
end;

class function TfrmpbMessageBox.ShowErrorMessage(AOwner: TComponent;
  sMsg, sCaption: string; bAutoClose: Boolean): Integer;
begin
  Result := ShowErrorMessage(AOwner, sMsg, sCaption, bAutoClose, []);
end;

class function TfrmpbMessageBox.ShowInfoMessage(AOwner: TComponent;
  sMsg, sCaption: string; bAutoClose: Boolean): Integer;
begin
  Result := ShowInfoMessage(AOwner, sMsg, sCaption, bAutoClose, []);
end;

class function TfrmpbMessageBox.ShowQuestionMessage(AOwner: TComponent;
  sMsg, sCaption: string; bAutoClose: Boolean): Integer;
begin
  Result := ShowQuestionMessage(AOwner, sMsg, sCaption, bAutoClose, []);

end;

class function TfrmpbMessageBox.ShowWarningMessage(AOwner: TComponent;
  sMsg, sCaption: string; bAutoClose: Boolean): Integer;
begin
  Result := ShowWarningMessage(AOwner, sMsg, sCaption, bAutoClose, []);
end;

end.
