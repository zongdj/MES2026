unit uFrmGPBase;

interface

uses
  VMsgMonitor, UIVMsgs, DMUnt, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, scStyledForm, scControls, scGPControls, Vcl.ExtCtrls,
  Vcl.ComCtrls, scShellControls, scGPFontControls, hsDBManager;

type
  TFrmGPBase = class(TForm)
    scStyledForm1: TscStyledForm;
    AppBar: TscGPPanel;
    btnClose: TscGPCharGlyphButton;
    PnlInfo: TscGPPanel;
    LabTitle: TscGPLabel;
    DBManager: ThsDBManager;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FFormTitle: string;
    procedure setFormTitle(const Value: string);
    { Private declarations }
  public
    { Public declarations }

//    FrmState: TFrmState;
    procedure VMsgUpdateAppColor(Sender: TObject; AMsg: TVMsg); virtual;
    procedure UpdateColorSkin; virtual;
    property FormTitle: string read FFormTitle write setFormTitle;
    procedure HideLogo;
  end;

var
  FrmGPBase: TFrmGPBase;

implementation

{$R *.dfm}

procedure TFrmGPBase.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmGPBase.FormCreate(Sender: TObject);
begin
//  FrmState := fssNono;
  AppColor.UpdateAppColor(self);
   //×¢²áÏûÏ¢
  with GlobalVMsgMonitor do
  begin
    RegMsg(Self, TUpdateAppColorMsg, VMsgUpdateAppColor);
  end;
end;

procedure TFrmGPBase.FormDestroy(Sender: TObject);
begin
  GlobalVMsgMonitor.RemoveOwner(self);
end;

procedure TFrmGPBase.FormShow(Sender: TObject);
begin
  UpdateColorSkin;
end;

procedure TFrmGPBase.HideLogo;
begin

end;

procedure TFrmGPBase.setFormTitle(const Value: string);
begin
  FFormTitle := Value;
  LabTitle.Caption := Value;
end;

procedure TFrmGPBase.UpdateColorSkin;
begin
  if AppColor.IsUseColorSkin = False then
    Exit;
  AppColor.UpdateAppColor(self);
end;

procedure TFrmGPBase.VMsgUpdateAppColor(Sender: TObject; AMsg: TVMsg);
begin
  UpdateColorSkin;
end;

end.

