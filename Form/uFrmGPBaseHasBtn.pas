unit uFrmGPBaseHasBtn;

interface

uses
  uDm, VMsgMonitor, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, uFrmGPBase, scStyledForm, scGPControls, scControls, scGPImages,
  Vcl.ExtCtrls, scGPFontControls;

type
  TFrmGPBaseHasBtn = class(TFrmGPBase)
    btnPanel: TscGPPanel;
    GridPanel1: TGridPanel;
    scGPPanel1: TscGPPanel;
    btnCancel: TscGPButton;
    scGPPanel2: TscGPPanel;
    btnOK: TscGPButton;
    P_ErrInfo: TscGPPanel;
    LabErrInfo: TscGPLabel;
    scGPImage1: TscGPImage;
    scGPButton2: TscGPButton;
    procedure P_ErrInfoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FErrMsg: string;
    procedure setErrMsg(const Value: string);
  public
    { Public declarations }
    property ErrMsg: string read FErrMsg write setErrMsg;
    procedure VMsgUpdateAppColor(Sender: TObject; AMsg: TVMsg);
  end;

var
  FrmGPBaseHasBtn: TFrmGPBaseHasBtn;

implementation

{$R *.dfm}
{ TFrmGPBaseHasBtn }

procedure TFrmGPBaseHasBtn.FormCreate(Sender: TObject);
begin
  inherited;
   btnOK.HelpKeyword := 'OnlyCaption';
end;

procedure TFrmGPBaseHasBtn.FormShow(Sender: TObject);
begin
  inherited;
 btnOK.Options.FontNormalColor := AppColor.PrimaryColor;
end;

procedure TFrmGPBaseHasBtn.P_ErrInfoClick(Sender: TObject);
begin
  inherited;
  P_ErrInfo.Visible := False;
end;

procedure TFrmGPBaseHasBtn.setErrMsg(const Value: string);
begin
  FErrMsg := Value;
  LabErrInfo.Caption := Value;
  P_ErrInfo.Visible := True;
end;

procedure TFrmGPBaseHasBtn.VMsgUpdateAppColor(Sender: TObject; AMsg: TVMsg);
begin
  inherited;

end;

end.

