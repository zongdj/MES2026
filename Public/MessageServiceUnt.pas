unit MessageServiceUnt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.ComCtrls, Vcl.Clipbrd, Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  MessageService = class
  private
    class function TranslateMessageSelf(sMessage: string): string;
  public
    class procedure ShowMessage(sMessage: string);
    class procedure ShowWarning(sMessage: string);
    class procedure ShowError(sMessage: string);
    class function AskQuestion(sMessage: string): Boolean;
  end;

implementation

uses MainUnt;

{ TMessageService }

class function MessageService.AskQuestion(sMessage: string): Boolean;
begin
  Result := MessageDlg(TranslateMessageSelf(sMessage), mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

class procedure MessageService.ShowError(sMessage: string);
begin
  MessageDlg(TranslateMessageSelf(sMessage), mtError, [mbOk], 0);
end;

class procedure MessageService.ShowMessage(sMessage: string);
begin
  MessageDlg(TranslateMessageSelf(sMessage), mtInformation, [mbOk], 0);
end;

class procedure MessageService.ShowWarning(sMessage: string);
begin
  MessageDlg(TranslateMessageSelf(sMessage), mtWarning, [mbOk], 0);
end;

class function MessageService.TranslateMessageSelf(sMessage: string): string;
begin
  if Assigned(MainForm) then
    Result := MainForm.TranslateMessageSelf(sMessage)
  else
    result := sMessage;
end;

end.

