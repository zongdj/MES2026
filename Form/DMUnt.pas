unit DMUnt;

interface

uses
  System.SysUtils, System.Classes, Variants, FireDAC.Stan.StorageJSON,
  FireDAC.Stan.StorageXML, FireDAC.Stan.StorageBin, kbmMWClient,
  kbmMWInventoryClient, kbmMWBinaryStreamFormat, kbmMemTable, kbmMWStreamFormat,
  kbmMWClientDataset, kbmMWSecurity, kbmMWLZHCompression, kbmMWCrypt,
  kbmMWCustomConnectionPool, kbmMWCustomTransport, kbmMWZipStdTransStream,
  kbmMWTCPIPIndyClientTransport, Graphics, kbmMWExceptions,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, IniFiles, hsAES, hsBase64,
  SysUserUnt, hsDBManager, LoginManagerUnt, UAppColor, cxLookAndFeelPainters,
  cxGraphics, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxStyles, cxClasses, dxAlertWindow;

type
  TFrmState = (fssEdit, fssAppend, fssNono);

  TSelectYarnInfo = class
    sYarnInfo: string;
    sArrangeNo: string;
    sSizingNo: string;
    uGuid: string;
    ummMaterialGUID: string;
    sYarnLot: string;
  end;

  TSelectBeamInfo = class
    sYarnInfo: string;
    sArrangeNo: string;
    sSizingNo: string;
    uGuid: string;
    iOrderNo: Integer;
    iEnds: Integer;
    iSizingLen: Integer;
  end;

  TSelectFenJingBeamInfo = class
    sArrangeNo: string;
    sSizingNo: string;
    iOrderNo: Integer;
    iEnds: Integer;
    iSizingLen: Integer;
    sShelfNo: string;
    sBucketNo: string;
    sFactBeamNo: string;
    sBeamNo: string;
    uTaskGuid: string;

  end;

  TSelectSizingBeamInfo = class
    sArrangeNo: string;
    sSizingNo: string;
    iOrderNo: Integer;
    iEnds: Integer;
    iSizingLen: Integer;
    sOrderNo: string;
    sFactBeamType: string;
    uTaskGuid: string;
    sBeamNo: string;
    sCardNo: string;
  end;

type
  TDM = class(TDataModule)
    kbmMWClientConnectionPool1: TkbmMWClientConnectionPool;
    kbmMWTCPIPIndyClientTransport1: TkbmMWTCPIPIndyClientTransport;
    kbmMWPooledSession1: TkbmMWPooledSession;
    kbmMWCrypt1: TkbmMWCrypt;
    kbmMWLZHCompression1: TkbmMWLZHCompression;
    kbmMWClientBriefCaseBinaryStreamFormat1
      : TkbmMWClientBriefCaseBinaryStreamFormat;
    kbmMWBinaryStreamFormat1: TkbmMWBinaryStreamFormat;
    kbmMWInventoryClient1: TkbmMWInventoryClient;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDMemTable1: TFDMemTable;
    DBManager: ThsDBManager;
    MyTip: TdxAlertWindowManager;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    StyleOdd: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle_PayType: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle_WhiteBk: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyleOrderDrag: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyleCommision1: TcxStyle;
    StyleEven: TcxStyle;
    Style_BK: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    SelectStyle: TcxStyle;
    CaiGouDStyle: TcxStyle;
    CaiGouDSelectStyle: TcxStyle;
    DingDanStyle: TcxStyle;
    Style_Select_35px: TcxStyle;
    procedure kbmMWTCPIPIndyClientTransport1ConnectionLost(Sender: TObject);
    procedure kbmMWTCPIPIndyClientTransport1Connected(Sender: TObject;
      Info: IkbmMWCustomTransportInfo);
    procedure DataModuleCreate(Sender: TObject);
  private
    FCurDate: TDateTime;
    FCurServerIP: string;
    FCurServerPort: Integer;
    FCurServiceName: string;
    FSystemStatus: Integer;
    FConnectServerTime: TDateTime;
    FLoginManager: TLoginManager;
    FGroupNo: string;
    FUserId: string;
    FTurnName: string;
    FWorkerList: string;
    FWorkerNameList: string;
    FUserName: string;
    FGroupName: string;
    FGatherOn: string;
    FsOutPutType: string;
    FLocalWorkCenter: string;
    FCycle: string;
    FsMacNo: string;
    FWorkingProcedureName: string;
    FMachineProcedureName: string;
    FDesignReport: string;
    function getAppPath: string;
    procedure setAppPath(const Value: string);
  public
    property UserId: string read FUserId write FUserId;
    property UserName: string read FUserName write FUserName;
    property AppPath: string read getAppPath write setAppPath;
    property GroupNo: string read FGroupNo write FGroupNo;
    property GroupName: string read FGroupName write FGroupName;
    property TurnName: string read FTurnName write FTurnName;
    property WorkerList: string read FWorkerList write FWorkerList;
    property WorkerNameList: string read FWorkerNameList write FWorkerNameList;
    function ReadBKPicFileFromIni: string;
    function ReadFontSizeFromIni: Integer;
    procedure WriteFontSizeFromIni(AFontSize: Integer);
    function WriteBKPicFileToIni(APicFile: string): Boolean;
    function ReadBKImgStreamFromDB(APicture: TPicture): Boolean;
    procedure WriteConnectParamToIni;
    procedure ReadDefaultUserFromIni(var aDefaultUser: string;
      var iLanguageType: TLanguageType; var iDefaultCompanyID: Integer;
      var sDefaultPassword: string; var bRememberPassword: Boolean;
      var bAutoLogo: Boolean);
    procedure WriteDefaultUserToIni(aDefaultUser: string;
      iLanguageType: TLanguageType; iDefaultCompanyID: Integer;
      sDefaultPassword: string; bRememberPassword: Boolean; bAutoLogo: Boolean);
    procedure WriteDefaultLanguageToIni(iLanguageType: TLanguageType);
    procedure WriteLockSystemMinuteToIni(iLockSystemMinute: Integer);
    function ReadLockSystemMinuteFromIni: Integer;
    function bDisableCheckLocalTime: Boolean;
    function bUseSystemDateFormat: Boolean;
    function DBConnect(bRaiseError: Boolean; out sErrMsg: string): Boolean;
    procedure ChangeServiceName(sServiceName: string);
    procedure ChangeUserNo(sUserNo: string);
    function ConnectServer: Boolean;
    function CheckLocalDateTime: Boolean;
    procedure AfterConstruction; override;
    procedure WriteParamToInit(sParam: string; Value: Variant);
    procedure ReadConnectParamFromIni(bReadParam: Boolean);
    procedure FillStringsFromSql(s1, s2: TStrings; sql: string;
      Params: array of Variant);
    destructor Destroy; override;

    // 0,未登录,1,已经登记,2,系统锁定
    property SystemStatus: Integer read FSystemStatus write FSystemStatus;
    property LoginManager: TLoginManager read FLoginManager;
    property sMacNo: string read FsMacNo write FsMacNo;
    property LocalWorkCenter: string read FLocalWorkCenter
      write FLocalWorkCenter;
    property sOutPutType: string read FsOutPutType write FsOutPutType;
    property sWorkingProcedureName: string read FWorkingProcedureName
      write FWorkingProcedureName;
    property sMachineProcedureName: string read FMachineProcedureName
      write FMachineProcedureName;
    property GatherOn: string read FGatherOn write FGatherOn;
    property Cycle: string read FCycle write FCycle;
    property DesignReport: string read FDesignReport write FDesignReport;
  end;

var
  DM: TDM;
  sFallbackServers: string;
  AppColor: TAppColor;

implementation

// {%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

uses
  FrameCommonUnt, DBConfigUnt, DateUtils, Windows, MessageServiceUnt,
  clDBUtilUnt;

{ TDM }

procedure TDM.FillStringsFromSql(s1, s2: TStrings; sql: string;
  Params: array of Variant);
var
  qryTemp, ds: TFDMemTable;
  F1, F2: TField;
  sFieldValue: string;
begin
  if not Assigned(s1) then
    Exit;
  s1.Clear;
  if not Assigned(s2) then
    Exit;
  s2.Clear;

  if sql.IsEmpty then
    Exit;

  try
    ds := TFDMemTable.Create(nil);
    ds.Query(sql, Params);
    qryTemp := TFDMemTable.Create(nil);
    try
      qryTemp.CloneCursor(ds, True);
      qryTemp.First;
      if qryTemp.FieldList.Count > 1 then
      begin
        F1 := qryTemp.FieldList[0];
        if Assigned(s2) then
          F2 := qryTemp.FieldList[1]
        else
          F2 := nil;
      end;
      while not qryTemp.Eof do
      begin
        sFieldValue := F1.AsString;
        if (s1.IndexOf(sFieldValue) = -1) then
        begin
          s1.Add(sFieldValue);
          if Assigned(F2) then
            s2.Add(F2.AsString);
        end;
        qryTemp.Next;
      end;
    finally
      if qryTemp.Active and (qryTemp.Table.DefaultView.Sort <> '') then
        qryTemp.Table.DefaultView.Sort := '';
      FreeAndNil(qryTemp);
    end;
  finally
    FreeAndNil(ds);
  end;
end;

procedure TDM.WriteParamToInit(sParam: string; Value: Variant);
var
  tIni: TMemIniFile;
  procedure WriteIniEncodeString(Section, Ident, Value: string);
  begin
{$IFDEF ENCODECONFIG}
    if Value <> '' then
      Value := 'CV1!' + hsBase64.Base64EncodeBytes(hsAES.EncryptBytes(Value,
        'e%72,Ives'));
{$ENDIF}
    tIni.WriteString(Section, Ident, Value);
  end;

begin
  tIni := TMemIniFile.Create(GetConfigFileName);
  try
    WriteIniEncodeString('LocalParam', sParam, VarToStr(Value));
    tIni.Encoding := TEncoding.UTF8;
    tIni.UpdateFile;
  finally
    tIni.Free;
  end;
end;

procedure TDM.AfterConstruction;
begin
  inherited;
  FLoginManager := TLoginManager.Create(Self);
end;

function TDM.bDisableCheckLocalTime: Boolean;
var
  tIni: TMemIniFile;
  sParamName, s: string;
begin
  tIni := TMemIniFile.Create(GetConfigFileName);
  try
    sParamName := 'DisableCheckLocalTime';
    s := LowerCase(tIni.ReadString('BACKGROUND', sParamName, ''));
    if s = '' then
    begin
      tIni.WriteString('BACKGROUND', sParamName, 'False');
      tIni.Encoding := TEncoding.UTF8;
      tIni.UpdateFile;
    end;
    Result := StringToBoolean(s);
  finally
    tIni.Free;
  end;
end;

function TDM.bUseSystemDateFormat: Boolean;
var
  sParamName, s: string;
begin
  sParamName := 'UseSystemDateFormat';
  s := Trim(DBManager.SysParamAsString[sParamName]);
  if s = '' then
  begin
    DBManager.SysParamAsString[sParamName] := 'False';
  end;
  Result := StringToBoolean(s);
end;

procedure TDM.ChangeServiceName(sServiceName: string);
begin
  SetStringsValue(kbmMWClientConnectionPool1.Params, 'ServiceName',
    sServiceName);
end;

procedure TDM.ChangeUserNo(sUserNo: string);
begin
  SetStringsValue(kbmMWClientConnectionPool1.Params, 'Token',
    sLoginKey + sClientType + '.' + sUserNo + '|' + FSysUser.LoginId);
end;

function TDM.CheckLocalDateTime: Boolean;
var
  dNow: TDateTime;
  dSysDate: TDateTime;
  sysTime: TSystemTime;
begin
  if not bDisableCheckLocalTime then
  begin
    // 检查本地时间和服务器时间是否一致
    dNow := Now;
    dSysDate := DBManager.GetSystemDateTime;
    if MinutesBetween(dNow, dSysDate) > 5 then
    begin
      DateTimeToSystemTime(dSysDate, sysTime);
      SetLocalTime(sysTime);
    end;
  end;
  Result := True;
end;

function TDM.ConnectServer: Boolean;
var
  sMsg: string;
begin
  Result := False;
  ReadConnectParamFromIni(True);
  if not DBConnect(False, sMsg) then
  begin
    if sServerName <> '' then
    begin
      if SysLocale.PriLangID = LANG_CHINESE then
        MessageService.ShowError
          ('不能连接服务器，请联系管理员！'#13#10'如果配置发生变化，请删除配置文件重新配置。'#13#10 + sMsg)
      else
        MessageService.ShowError
          ('Unable to connect to the server, please contact the administrator!'#13#10'If the configuration changes, please delete the configuration file and reconfigure.'#13#10
          + sMsg);
      Exit;
    end;
    if not TfmDBConfig.Execute then
      Exit;
  end;
  try
    // 读数据库时间测试数据库连接
    FConnectServerTime := DBManager.GetValueBySqlAsDateTime
      ('SELECT tTime=GETDATE()');
  except
    on E: Exception do
    begin
      if SysLocale.PriLangID = LANG_CHINESE then
        MessageService.ShowError('出现错误。'#13#10 + E.Message)
      else
        MessageService.ShowError('Error.'#13#10 + E.Message);
      Exit;
    end;
  end;
  // ChangeServiceName(sServiceName);
  Result := True;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  AppColor := AppUIColor;
end;

function TDM.DBConnect(bRaiseError: Boolean; out sErrMsg: string): Boolean;
var
  sl: TStringList;
  s: string;
  I: Integer;
begin
  sErrMsg := '';

  if (sServerName = '') or (iServerPort = 0) then
  begin
    Result := False;
    Exit;
  end;

  try
    if (FCurServerIP <> sServerName) or (FCurServiceName <> sServiceName) or
      (FCurServerPort <> iServerPort) then
    begin
      FCurServerIP := sServerName;
      FCurServiceName := sServiceName;
      FCurServerPort := iServerPort;

      kbmMWClientConnectionPool1.AutoActivate := False;
      kbmMWClientConnectionPool1.Active := False;
      kbmMWClientConnectionPool1.Cache.ClearCache;
      kbmMWClientConnectionPool1.KillConnections;
      kbmMWTCPIPIndyClientTransport1.Active := False;

      kbmMWTCPIPIndyClientTransport1.Host := sServerName;
      kbmMWTCPIPIndyClientTransport1.Port := iServerPort;
      SetStringsValue(kbmMWClientConnectionPool1.Params, 'Token',
        sLoginKey + sClientType);
      SetStringsValue(kbmMWClientConnectionPool1.Params, 'ServiceName',
        sServiceName);

      kbmMWTCPIPIndyClientTransport1.MaxRetries := 1;
      kbmMWTCPIPIndyClientTransport1.ConnectTimeout := 10;
      kbmMWTCPIPIndyClientTransport1.StreamFormat := 'ZIPPED';

      kbmMWTCPIPIndyClientTransport1.FallbackServers.Clear;
      kbmMWTCPIPIndyClientTransport1.AutoFallback := False;
      kbmMWTCPIPIndyClientTransport1.MaxRetriesAlternative := 0;
      if sFallbackServers <> '' then
      begin
        sl := TStringList.Create;
        try
          sl.Text := StringReplace(sFallbackServers, ';', #13#10,
            [rfReplaceAll]);
          for I := 0 to sl.Count - 1 do
          begin
            s := Trim(sl[I]);
            if s <> '' then
              kbmMWTCPIPIndyClientTransport1.FallbackServers.Add
                ('HOST=' + s.Replace(':', ';PORT='));
          end;
        finally
          sl.Free;
        end;

        if kbmMWTCPIPIndyClientTransport1.FallbackServers.Count > 0 then
        begin
          kbmMWTCPIPIndyClientTransport1.MaxRetriesAlternative :=
            kbmMWTCPIPIndyClientTransport1.FallbackServers.Count;
          kbmMWTCPIPIndyClientTransport1.AutoFallback := True;
        end;
      end;

      kbmMWClientConnectionPool1.Active := True;
    end;

    // 测试连接
    FCurDate := DBManager.GetSystemDateTime;

    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      sErrMsg := E.Message;
      if bRaiseError then
        raise;
    end;
  end;
end;

destructor TDM.Destroy;
begin
  kbmMWClientConnectionPool1.Active := False;
  kbmMWClientConnectionPool1.Cache.ClearCache;
  kbmMWClientConnectionPool1.KillConnections;
  kbmMWTCPIPIndyClientTransport1.Active := False;
  inherited;
end;

function TDM.getAppPath: string;
begin

end;

procedure TDM.kbmMWTCPIPIndyClientTransport1Connected(Sender: TObject;
  Info: IkbmMWCustomTransportInfo);
var
  ct: TkbmMWTCPIPIndyClientTransport;
begin
  if Sender is TkbmMWTCPIPIndyClientTransport then
  begin
    ct := Sender as TkbmMWTCPIPIndyClientTransport;
    if kbmMWTCPIPIndyClientTransport1.Host <> ct.Host then
      kbmMWTCPIPIndyClientTransport1.Host := ct.Host;
    if kbmMWTCPIPIndyClientTransport1.Port <> ct.Port then
      kbmMWTCPIPIndyClientTransport1.Port := ct.Port;
  end;
end;

procedure TDM.kbmMWTCPIPIndyClientTransport1ConnectionLost(Sender: TObject);
begin
  // 连接异常
  if Sender is TkbmMWTCPIPIndyClientTransport then
    TkbmMWTCPIPIndyClientTransport(Sender).Active := False;
end;

function TDM.ReadBKImgStreamFromDB(APicture: TPicture): Boolean;
const
  sSql: string =
    '/*nolog*/ SELECT gFile FROM smFileManage WITH(NOLOCK) WHERE sFileName=:sFileName';
var
  qry: TFDMemTable;
begin
  Result := False;
  qry := TFDMemTable.Create(nil);
  try
    DBManager.QueryDataBySql(qry, sSql, ['BackgroundImg']);
    if qry.Active and not qry.IsEmpty then
      Result := LoadPictureFromField(APicture, qry.FieldByName('gFile'));
  finally
    qry.Free;
  end;
end;

function TDM.ReadBKPicFileFromIni: string;
var
  FIniFile: string;
  tIni: TMemIniFile;
begin
  Result := '';
  FIniFile := GetConfigFileName;
  if FileExists(FIniFile) then
  begin
    tIni := TMemIniFile.Create(FIniFile);
    try
      Result := tIni.ReadString('BACKGROUND', 'Pic', '');
    finally
      tIni.Free;
    end;
  end;
end;

procedure TDM.ReadConnectParamFromIni(bReadParam: Boolean);
var
  FIniFile: string;
  tIni: TMemIniFile;
  Str: string;
  I: Integer;

  function ReadIniEncodeString(Section, Ident: string): string;
  begin
    Result := tIni.ReadString(Section, Ident, '');
    if (Length(Result) > 4) and SameText(Copy(Result, 1, 4), 'CV1!') then
      Result := hsAES.DecryptBytes(hsBase64.Base64DecodeBytes(Copy(Result, 5,
        MaxInt)), 'e%72,!kaakd');
  end;

begin
  try
    sServerName := '';
    iServerPort := 0;
    sServiceName := '';
    sFallbackServers := '';

    if bReadParam then
      for I := 1 to ParamCount() do
      begin
        Str := ParamStr(I);
        if SameText(Copy(Str, 1, 11), 'SERVERNAME=') then
          sServerName := Copy(Str, 12, MaxInt)
        else if SameText(Copy(Str, 1, 5), 'PORT=') then
          iServerPort := StrToIntDef(Copy(Str, 6, MaxInt), 4068)
        else if SameText(Copy(Str, 1, 12), 'SERVICENAME=') then
          sServiceName := Copy(Str, 13, MaxInt);
      end;
    FIniFile := GetConfigFileName;
    if FileExists(FIniFile) then
    begin
      tIni := TMemIniFile.Create(FIniFile);
      try
        if sServerName = '' then
          sServerName := ReadIniEncodeString('ConnectParam', 'ServerName');
        if iServerPort = 0 then
          iServerPort := StrToIntDef(ReadIniEncodeString('ConnectParam',
            'Port'), 0);
        if sServiceName = '' then
          sServiceName := ReadIniEncodeString('ConnectParam', 'ServiceName');
        if sFallbackServers = '' then
          sFallbackServers := ReadIniEncodeString('ConnectParam',
            'FallbackServers');

        sMacNo := ReadIniEncodeString('LocalParam', 'LocalMacNo');
        LocalWorkCenter := ReadIniEncodeString('LocalParam', 'LocalWorkCenter');
        sWorkingProcedureName := ReadIniEncodeString('LocalParam',
          'LocalWorkingProcedureName');
        sMachineProcedureName := ReadIniEncodeString('LocalParam',
          'LocalMachineProcedureName');
        Cycle := ReadIniEncodeString('LocalParam', 'LocalCycle');
        if Cycle.IsEmpty then
          Cycle := '5';
        GatherOn := ReadIniEncodeString('LocalParam', 'LocalGatherOn');
        if GatherOn.IsEmpty then
          GatherOn := 'false';

        DesignReport := ReadIniEncodeString('LocalParam', 'LocalReport');
        if DesignReport.IsEmpty then
          DesignReport := 'false';

      finally
        tIni.Free;
      end;
    end;
    if iServerPort <= 0 then
      iServerPort := 4068;
  except
  end;
end;

function TDM.WriteBKPicFileToIni(APicFile: string): Boolean;
var
  tIni: TMemIniFile;
begin
  tIni := TMemIniFile.Create(GetConfigFileName);
  try
    tIni.WriteString('BACKGROUND', 'Pic', APicFile);
    tIni.Encoding := TEncoding.UTF8;
    tIni.UpdateFile;
    Result := True;
  finally
    tIni.Free;
  end;
end;

procedure TDM.WriteConnectParamToIni;
var
  tIni: TMemIniFile;
  procedure WriteIniEncodeString(Section, Ident, Value: string);
  begin
{$IFDEF ENCODECONFIG}
    if Value <> '' then
      Value := 'CV1!' + hsBase64.Base64EncodeBytes(hsAES.EncryptBytes(Value,
        'e%72,!kaakd'));
{$ENDIF}
    tIni.WriteString(Section, Ident, Value);
  end;

begin
  tIni := TMemIniFile.Create(GetConfigFileName);
  try
    WriteIniEncodeString('ConnectParam', 'ServerName', sServerName);
    WriteIniEncodeString('ConnectParam', 'Port', IntToStr(iServerPort));
    WriteIniEncodeString('ConnectParam', 'ServiceName', sServiceName);
    WriteIniEncodeString('ConnectParam', 'FallbackServers', sFallbackServers);
    tIni.Encoding := TEncoding.UTF8;
    tIni.UpdateFile;
  finally
    tIni.Free;
  end;
end;

procedure TDM.ReadDefaultUserFromIni(var aDefaultUser: string;
  var iLanguageType: TLanguageType; var iDefaultCompanyID: Integer;
  var sDefaultPassword: string; var bRememberPassword: Boolean;
  var bAutoLogo: Boolean);
var
  FIniFile: string;
  tIni: TMemIniFile;
begin
  aDefaultUser := '';
  iDefaultCompanyID := -1;
  FIniFile := GetConfigFileName;
  if FileExists(FIniFile) then
  begin
    tIni := TMemIniFile.Create(FIniFile);
    try
      aDefaultUser := tIni.ReadString('BACKGROUND', 'DefaultUser', '');
      try
        iLanguageType := TLanguageType(tIni.ReadInteger('BACKGROUND',
          'DefaultLanguage', 0));
      except
        iLanguageType := ltNone;
      end;
      iDefaultCompanyID := tIni.ReadInteger('BACKGROUND', 'DefaultCompany', -1);
      bRememberPassword := tIni.ReadBool('BACKGROUND',
        'RememberPassword', False);
      sDefaultPassword := tIni.ReadString('BACKGROUND', 'DefaultPassword', '');
      bAutoLogo := tIni.ReadBool('BACKGROUND', 'AutoLogo', False);
      if sDefaultPassword <> '' then
      begin
        try
          sDefaultPassword := hsAES.DecryptBytes
            (hsBase64.Base64DecodeBytes(sDefaultPassword), 'a&^32KLoka2');
        except
          sDefaultPassword := '';
        end;
      end;
      if (sDefaultPassword = '') or (aDefaultUser = '') then
        bRememberPassword := False;

    finally
      tIni.Free;
    end;
  end;
end;

function TDM.ReadFontSizeFromIni: Integer;
var
  tIni: TMemIniFile;
begin
  tIni := TMemIniFile.Create(GetConfigFileName);
  try
    Result := tIni.ReadInteger('BACKGROUND', 'FontSize', -1);
    if Result = -1 then
    begin
      Result := 0;
      tIni.WriteInteger('BACKGROUND', 'FontSize', Result);
      tIni.Encoding := TEncoding.UTF8;
      tIni.UpdateFile;
    end;
  finally
    tIni.Free;
  end;
end;

function TDM.ReadLockSystemMinuteFromIni: Integer;
var
  tIni: TMemIniFile;
begin
  tIni := TMemIniFile.Create(GetConfigFileName);
  try
    Result := tIni.ReadInteger('BACKGROUND', 'LockSystemMinute', 0);
  finally
    tIni.Free;
  end;
end;

procedure TDM.setAppPath(const Value: string);
begin

end;

procedure TDM.WriteDefaultLanguageToIni(iLanguageType: TLanguageType);
var
  tIni: TMemIniFile;
begin
  tIni := TMemIniFile.Create(GetConfigFileName);
  try
    tIni.WriteInteger('BACKGROUND', 'DefaultLanguage', Integer(iLanguageType));
    tIni.Encoding := TEncoding.UTF8;
    tIni.UpdateFile;
  finally
    tIni.Free;
  end;
end;

procedure TDM.WriteLockSystemMinuteToIni(iLockSystemMinute: Integer);
var
  tIni: TMemIniFile;
begin
  tIni := TMemIniFile.Create(GetConfigFileName);
  try
    tIni.WriteInteger('BACKGROUND', 'LockSystemMinute', iLockSystemMinute);
    tIni.Encoding := TEncoding.UTF8;
    tIni.UpdateFile;
  finally
    tIni.Free;
  end;
end;

procedure TDM.WriteDefaultUserToIni(aDefaultUser: string;
  iLanguageType: TLanguageType; iDefaultCompanyID: Integer;
  sDefaultPassword: string; bRememberPassword: Boolean; bAutoLogo: Boolean);
var
  tIni: TMemIniFile;
begin
  tIni := TMemIniFile.Create(GetConfigFileName);
  try
    tIni.WriteString('BACKGROUND', 'DefaultUser', aDefaultUser);
    tIni.WriteInteger('BACKGROUND', 'DefaultLanguage', Integer(iLanguageType));
    tIni.WriteInteger('BACKGROUND', 'DefaultCompany', iDefaultCompanyID);
    if not bRememberPassword then
      sDefaultPassword := '';
    if sDefaultPassword <> '' then
    begin
      sDefaultPassword := hsBase64.Base64EncodeBytes
        (hsAES.EncryptBytes(sDefaultPassword, 'a&^32KLoka2'));
    end;
    tIni.WriteBool('BACKGROUND', 'RememberPassword', bRememberPassword);
    tIni.WriteBool('BACKGROUND', 'AutoLogo', bAutoLogo);
    tIni.WriteString('BACKGROUND', 'DefaultPassword', sDefaultPassword);
    tIni.Encoding := TEncoding.UTF8;
    tIni.UpdateFile;
  finally
    tIni.Free;
  end;
end;

procedure TDM.WriteFontSizeFromIni(AFontSize: Integer);
var
  tIni: TMemIniFile;
begin
  tIni := TMemIniFile.Create(GetConfigFileName);
  try
    if AFontSize <= 8 then
      AFontSize := 0;
    tIni.WriteInteger('BACKGROUND', 'FontSize', AFontSize);
    tIni.Encoding := TEncoding.UTF8;
    tIni.UpdateFile;
  finally
    tIni.Free;
  end;
end;

end.
