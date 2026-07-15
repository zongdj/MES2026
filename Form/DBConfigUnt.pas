unit DBConfigUnt;

interface

uses
  IniFiles, cxTextEdit, DB, jpeg, cxMaskEdit, cxDropDownEdit,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxForms, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxLabel, dxGDIPlusClasses, Vcl.ExtCtrls, cxGroupBox, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, Winapi.ShellAPI, dxSkinsCore, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  kbmMWClient, kbmMWCustomTransport, kbmMWTCPIPIndyClientTransport,
  dxSkinVisualStudio2013Light, hsEditors, cxImage, cxMemo;

type
  TfmDBConfig = class(TdxForm)
    edtServerName: ThsTextEdit;
    edtServerPort: ThsTextEdit;
    lblServerName: ThsLabel;
    lblServerPort: ThsLabel;
    Bevel1: TBevel;
    BtnOK: TcxButton;
    BtnCancel: TcxButton;
    lblServiceName: ThsLabel;
    cbbServiceName: ThsComboBox;
    kbmMWTCPIPIndyClientTransport1: TkbmMWTCPIPIndyClientTransport;
    kbmMWSimpleClient1: TkbmMWSimpleClient;
    imgServer: ThsImage;
    lblFallbackServers: ThsLabel;
    memFallbackServers: ThsMemo;
    lblInfo: ThsLabel;
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cbbServiceNameEnter(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AfterConstruction; override;
    destructor Destroy; override;
    { Public declarations }
    class function Execute: Boolean;
  end;

implementation

uses
  DMUnt, SysUserUnt, FrameCommonUnt, MessageServiceUnt;

{$R *.dfm}
{ TFrmDBSetup }

class function TfmDBConfig.Execute: Boolean;
var
  fm: TfmDBConfig;
begin
  //Result := False;
  fm := TfmDBConfig.Create(nil);
  try
    fm.Position:=poScreenCenter;
    Result := fm.ShowModal = mrOK;
    fm.kbmMWTCPIPIndyClientTransport1.Active := False;
  finally
    fm.Free;
  end;
end;

procedure TfmDBConfig.cbbServiceNameEnter(Sender: TObject);
var
  sName: string;
  iPort: Integer;
begin
{$IFDEF ENCODECONFIG}
  Exit;
{$ENDIF}

  sName := Trim(edtServerName.Text);
  if sName = '' then
  begin
    edtServerName.SetFocus;
    raise Exception.Create('请输入服务器名！');
  end;
  iPort := StrToIntDef(Trim(edtServerPort.Text), 0);
  if iPort <= 0 then
  begin
    edtServerPort.SetFocus;
    raise Exception.Create('请输入服务端口！');
  end;

  kbmMWTCPIPIndyClientTransport1.Active := False;
  kbmMWTCPIPIndyClientTransport1.Host := sName;
  kbmMWTCPIPIndyClientTransport1.Port := iPort;

  //避免测试时间过长
  kbmMWTCPIPIndyClientTransport1.MaxRetries := 1;
  kbmMWTCPIPIndyClientTransport1.ConnectTimeout := 10;
  kbmMWTCPIPIndyClientTransport1.StreamFormat := 'ZIPPED';

  kbmMWSimpleClient1.Token := sLoginKey+sClientType;
  //kbmMWSimpleClient1.Username := sClientType;
  //kbmMWSimpleClient1.Password := sClientType;

  cbbServiceName.Properties.Items.CommaText := VarToStr(
    kbmMWSimpleClient1.Request('LOGINSERVICE', '', 'GetServiceNameList', []));
end;

procedure TfmDBConfig.AfterConstruction;
begin
  inherited;

{$IFDEF ENCODECONFIG}
  cbbServiceName.Properties.PasswordChar := '*';
  cbbServiceName.Properties.EchoMode := eemPassword;
  edtServerName.Properties.PasswordChar := '*';
  edtServerName.Properties.EchoMode := eemPassword;
  edtServerPort.Properties.PasswordChar := '*';
  edtServerPort.Properties.EchoMode := eemPassword;
{$ENDIF}
end;

destructor TfmDBConfig.Destroy;
begin
  inherited;
end;

procedure TfmDBConfig.BtnOKClick(Sender: TObject);
var
  s0, s1, s2, sMsg: string;
  iPort: Integer;
begin
  s0 := Trim(cbbServiceName.Text);
  s1 := Trim(edtServerName.Text);
  s2 := Trim(edtServerPort.Text);

  iPort := StrToIntDef(s2, 0);

  if (s0 = '') or (s1 = '') or (iPort = 0) then
    raise Exception.Create('必须提供完整信息!');

  kbmMWTCPIPIndyClientTransport1.Active := False;
  kbmMWTCPIPIndyClientTransport1.Host := s1;
  kbmMWTCPIPIndyClientTransport1.Port := iPort;

  //避免测试时间过长
  kbmMWTCPIPIndyClientTransport1.MaxRetries := 1;
  kbmMWTCPIPIndyClientTransport1.ConnectTimeout := 10;
  kbmMWTCPIPIndyClientTransport1.StreamFormat := 'ZIPPED';

  sServiceName := s0;
  sServerName := s1;
  iServerPort := iPort;

  sFallbackServers := StringReplace(memFallbackServers.Text, #13#10, ';', [rfReplaceAll]
    ).Replace(#13,'').Replace(#10,'').Replace(#9,'').Replace(' ', '').Trim();

  if not dm.DBConnect(True, sMsg) then
    Exit;

  dm.WriteConnectParamToIni;
  if SysLocale.PriLangID = LANG_CHINESE then
    sMsg := '注册完成'
  else
    sMsg := 'Save Finished';
  MessageService.ShowMessage(sMsg);
  ModalResult := mrOK;
end;

procedure TfmDBConfig.FormShow(Sender: TObject);
begin
  lblServerPort.Caption := '端　　口';
  lblServiceName.Caption := '账　　套';
  cbbServiceName.Properties.DropDownListStyle := lsEditList;

  if SysLocale.PriLangID <> LANG_CHINESE then
  begin
    Caption := 'Database Configuration';
    lblServerName.Caption := 'Server Name';
    lblServerPort.Caption := 'Server Port';
    BtnOK.Caption := '&OK';
    BtnCancel.Caption := '&Cancel';
    lblFallbackServers.Caption := '&Fallback';
    lblInfo.Caption := 'Example:IP1:Port1;IP2:Port2';
  end;

  edtServerName.Text := sServerName;

  edtServerPort.Text := IntToStr(iServerPort);
  cbbServiceName.Text := sServiceName;

  if edtServerName.Text = '' then
    edtServerName.Text := '127.0.0.1';

  if StrToIntDef(edtServerPort.Text, 0) <= 0 then
    edtServerPort.Text := '3000';

  memFallbackServers.Text := sFallbackServers;

end;

procedure TfmDBConfig.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
