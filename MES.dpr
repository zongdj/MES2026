program MES;

uses
  ShareMem,
  Windows,
  Messages,
  SysUtils,
  Vcl.Forms,
  Data.FmtBcd,
  Data.SqlTimSt,
  MacAddrUnt,
  SysUserUnt,
  UAppColor in 'Public\UAppColor.pas',
  MainUnt in 'Form\MainUnt.pas' {MainForm},
  DMUnt in 'Form\DMUnt.pas' {DM: TDataModule},
  ufraModuleBase in 'Form\ufraModuleBase.pas' {fraModuleBase: TFrame},
  uFrmGPBase in 'Form\uFrmGPBase.pas' {FrmGPBase},
  uFrmSplash in 'Form\uFrmSplash.pas' {FrmSplash},
  uFrmColorSet in 'Form\uFrmColorSet.pas' {FrmColorSet},
  MessageUnit in 'Form\MessageUnit.pas' {MessageForm},
  uLogin in 'Form\uLogin.pas' {FrmLogin},
  UIVMsgs in 'Public\UIVMsgs.pas',
  VMsgMonitor in 'Public\VMsgMonitor.pas',
  uFrmSelectSkin in 'Form\uFrmSelectSkin.pas' {FrmSelectSkin},
  uPublic in 'Public\uPublic.pas',
  uIniOptions in 'Public\uIniOptions.pas',
  uLoadFromUrlThread in 'Public\uLoadFromUrlThread.pas',
  FrameCommonUnt in 'Form\FrameCommonUnt.pas',
  DBConfigUnt in 'Form\DBConfigUnt.pas',
  MessageServiceUnt in 'Form\MessageServiceUnt.pas',
  WriteLogUnt in 'Form\WriteLogUnt.pas',
  LoginManagerUnt in 'Form\LoginManagerUnt.pas',
  LanguageUnt in 'Public\LanguageUnt.pas',
  HookUtils in 'Public\HookUtils.pas',
  ufraModuleReport in 'Form\ufraModuleReport.pas' {fraModuleReport},
  ufraModuleDyeing in 'Form\ufraModuleDyeing.pas' {fraModuleDyeing},
  uFrmYarnListUnt in 'Form\uFrmYarnListUnt.pas' {uFrmYarnList},
  ufrmOnWork in 'Form\ufrmOnWork.pas' {frmOnWork},
  fmSizingBeamListUnt in 'Form\fmSizingBeamListUnt.pas' {fmSizingBeamList},
  ufraModuleSetup in 'Form\ufraModuleSetup.pas' {fraModuleSetup},
  ProcessBarUnt in 'Public\ProcessBarUnt.pas',
  AutoRestart in 'Public\AutoRestart.pas',
  ufraModuleSizing in 'Form\ufraModuleSizing.pas' {fraModuleSizing},
  ufraModuleWarping in 'Form\ufraModuleWarping.pas' {fraModuleWarping},
  fmBeamListUnt in 'Form\fmBeamListUnt.pas',
  ufraModuleFenJing in 'Form\ufraModuleFenJing.pas' {fraModuleFenJing},
  fmFenJingBeamListUnt in 'Form\fmFenJingBeamListUnt.pas',
  LanguageManager in 'Public\LanguageManager.pas',
  BuiltinTranslations in 'Public\BuiltinTranslations.pas';

{$R *.res}
var
  h: HWND;
  str: string;
  s: AnsiString;
  i: Integer;
  ds: TCopyDataStruct;
  F: TextFile;
begin

  s := '';
  for i := 1 to ParamCount() do
  begin
    str := ParamStr(i);
    if SameText(Copy(str, 1, 7), 'HUANSI:') {or SameText(Copy(str, 1, 5), 'FORM=')} then
    begin
      s := AnsiString(str);
      Break;
    end;
  end;
  h := 0;
  if s <> '' then
    h := FindWindow('TMainForm', nil);
  if h > 0 then
  begin
    ds.cbData := Length(s) + 1 * SizeOf(AnsiChar);
    GetMem(ds.lpData, ds.cbData);
    // StrCopy(ds.lpData, PAnsiChar(s));
    Move(PAnsiChar(s)^, ds.lpData^, ds.cbData);
    SendMessage(h, WM_COPYDATA, 0, Integer(@ds));
    SetForegroundWindow(h);
    FreeMem(ds.lpData);
  end
  else
  begin
    Application.Initialize;
    ReportMemoryLeaksOnShutdown := False;
    SplashForm := TfrmSplash.Create(Application);
    SplashForm.Show;
    SplashForm.Update;
    // .pas/.dpr 中文直接写，不要用 #码点
    SplashForm.StatusText := '准备启动...';
    SplashForm.StatusText := '正在创建数据连接...';
    Application.CreateForm(TDM, DM);
    SplashForm.StatusText := '正在测试服务器通讯是否正常...';
    if not DM.ConnectServer then
    begin
    {$IFDEF RELEASE}
      SplashForm.Free;
    {$ENDIF}
      Exit;
    end;
    SplashForm.StatusText := '正在加载系统信息...';
    FSysUser.LocalHostName := MacAddrUnt.LocalHostName;
    FSysUser.LocalMacAddr := MacAddrUnt.LocalMacAddr;
    Application.MainFormOnTaskbar := true;
    SplashForm.StatusText := '正在创建主窗体模块...';
    Application.CreateForm(TMainForm, MainForm);
    SplashForm.StatusText := '正在初始化皮肤选择窗体...';
    Application.CreateForm(TFrmSelectSkin, FrmSelectSkin);
    Application.Run;
  end;

end.
