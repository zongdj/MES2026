unit uFrmMainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, scStyledForm, scControls, scGPControls,
  scGPFontControls;

type
  TFrmMainMenu = class(TForm)
    scStyledForm1: TscStyledForm;
    scGPPanel4: TscGPPanel;
    pnlMenu: TscGPPanel;
    scGPPanel2: TscGPPanel;
    procedure FormCreate(Sender: TObject);
    procedure scStyledForm1DropDown(ADropDownForm: TCustomForm;
      ADropDownControl: TControl);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMainMenu: TFrmMainMenu;

implementation

{$R *.dfm}


procedure TFrmMainMenu.FormCreate(Sender: TObject);
begin
 Width :=70;
end;

procedure TFrmMainMenu.FormShow(Sender: TObject);
begin
Width :=70;
end;

procedure TFrmMainMenu.scStyledForm1DropDown(ADropDownForm: TCustomForm;
  ADropDownControl: TControl);
begin

  Width :=70;
end;

end.
