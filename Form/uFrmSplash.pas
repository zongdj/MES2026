unit uFrmSplash;

interface

uses
  uIniOptions, UAppColor, scGPPagers, scGPFontControls, scModernControls,
  Winapi.Messages, Vcl.Dialogs, scControls, System.Actions, Vcl.ActnList,
  scDrawUtils, Winapi.Windows, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, scGPControls,
  scStyledForm;

type
  TFrmSplash = class(TForm)
    scStyledForm1: TscStyledForm;
    PnlInfo: TscGPPanel;
    scGPPanel1: TscGPPanel;
    scGPLabel1: TscGPLabel;
    scGPLabel2: TscGPLabel;
    scGPLabel3: TscGPLabel;
    LblStatus: TscGPLabel;
    scGPLabel5: TscGPLabel;
    procedure FormCreate(Sender: TObject);
  private
    FParam: Pointer;
    procedure SetStatusText(const Value: string);
    { Private declarations }
     procedure UpdateColorSkin;
  public
    class function Execute(AParam: Pointer): Boolean;
    { Public declarations }
    property StatusText: string write SetStatusText;
  end;

var
  SplashForm: TFrmSplash;

implementation

{$R *.dfm}
{ TFrmSplash }

class function TFrmSplash.Execute(AParam: Pointer): Boolean;
begin
  with TFrmSplash.Create(nil) do
  try
    FParam := AParam;
    Result := ShowModal = mrOk;
  finally
    Free;
  end;
end;

procedure TFrmSplash.FormCreate(Sender: TObject);
begin
  UpdateColorSkin;
end;

procedure TFrmSplash.SetStatusText(const Value: string);
var
  i: Integer;
begin
  LblStatus.Caption := Value;
  Update; // 这句非常重要，不加的话，界面会阻塞，文字也就不会更新显示
//  Sleep(150); // 这句根据自己实际情况来调整，主要是怕闪屏太快关闭，达不到效果
  for i := 0 to 9 do
  begin
    Sleep(10);
    Application.ProcessMessages;
  end;

end;

procedure TFrmSplash.UpdateColorSkin;
begin
  if IniOptions.IsUseColorSkin then
  begin
    scGPPanel1.FillColor := IniOptions.PrimaryColor;
    scGPLabel5.Font.Color := IniOptions.PrimaryColor;
    PnlInfo.FrameColor := IniOptions.PrimaryColor;
  end;

end;

end.

