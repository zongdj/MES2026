unit LoginManagerUnt;

interface

uses
  System.SysUtils, System.Classes, Variants,
  kbmMWGlobal, kbmMWClient,
  kbmMWInventoryClient, kbmMWBinaryStreamFormat, kbmMemTable, kbmMWStreamFormat,
  kbmMWClientDataset, kbmMWSecurity, kbmMWLZHCompression, kbmMWCrypt,
  kbmMWCustomConnectionPool, kbmMWCustomTransport,
  kbmMWTCPIPIndyClientTransport,
  System.Generics.Collections, System.Generics.Defaults;

type
  TLoginManager = class(TComponent)
  private
  public
    procedure AfterConstruction; override;
    destructor Destroy; override;

    function GetConnectionPool: TkbmMWClientConnectionPool;
    function GetSimpleClient: TkbmMWPooledSimpleClient;

    // Login
    function Login(sLoginId,  sUserNo, sUserName, sComputerName, sMacAddr: string;
    iCompanyId: Integer; sServerName: string; iServerPort: Integer; out sMsg: string): Boolean;
    // Login
    function UpdateLogin(sLoginId,  sUserNo, sUserName, sComputerName, sMacAddr: string; iCompanyId: Integer): Integer;
    // Logout
    procedure Logout(sLoginId: string);
    // GetServiceNameList
    function GetServiceNameList: string;
  end;

implementation

{ TLoginManager }

procedure TLoginManager.AfterConstruction;
begin
  inherited;
end;

destructor TLoginManager.Destroy;
begin
  inherited;
end;


function TLoginManager.GetConnectionPool: TkbmMWClientConnectionPool;
var
  ses: TkbmMWPooledSession;
begin
  ses := kbmMWSessionList.SessionByName('MAINDB');
  if ses = nil then
    Result := nil
  else
    Result := ses.ConnectionPool as TkbmMWClientConnectionPool;
end;

function TLoginManager.GetServiceNameList: string;
var
  c: TkbmMWPooledSimpleClient;
begin
  c := GetSimpleClient;
  if c = nil then
    raise Exception.Create('Connection nil !');
  try
    Result := c.Request('LOGINSERVICE', '', 'GetServiceNameList', []);
  finally
    c.Free;
  end;
end;

function TLoginManager.GetSimpleClient: TkbmMWPooledSimpleClient;
var
  pool: TkbmMWClientConnectionPool;
begin
  pool := GetConnectionPool;
  if Assigned(pool) then
  begin
    Result := TkbmMWPooledSimpleClient.Create(nil);
    Result.ConnectionPool := pool;
    Result.Token := pool.Params.Values['Token'];
    Result.Data := pool.Params.Values['ServiceName'];
  end
  else
  begin
    Result := nil;
  end;
end;

function TLoginManager.Login(sLoginId, sUserNo, sUserName, sComputerName, sMacAddr: string;
    iCompanyId: Integer; sServerName: string; iServerPort: Integer;out sMsg: string): Boolean;
var
  c: TkbmMWPooledSimpleClient;
  v: Variant;
begin
  c := GetSimpleClient;
  if c = nil then
    raise Exception.Create('Connection nil !');
  try
    v := c.Request('LOGINSERVICE', '', 'Login', [sLoginId,  sUserNo, sUserName, sComputerName, sMacAddr, iCompanyId,
    sServerName, iServerPort]);
    sMsg := v[1];
    Result := v[0];
  finally
    c.Free;
  end;
end;

function TLoginManager.UpdateLogin(sLoginId, sUserNo, sUserName, sComputerName, sMacAddr: string;iCompanyId: Integer): Integer;
var
  c: TkbmMWPooledSimpleClient;
begin
  c := GetSimpleClient;
  if c = nil then
    raise Exception.Create('Connection nil !');
  try
    Result := c.Request('LOGINSERVICE', '', 'UpdateLogin', [sLoginId, sUserNo, sUserName, sComputerName, sMacAddr, iCompanyId]);
  finally
    c.Free;
  end;
end;

procedure TLoginManager.Logout(sLoginId: string);
var
  c: TkbmMWPooledSimpleClient;
begin
  c := GetSimpleClient;
  if c = nil then
    Exit;
  try
    c.Request('LOGINSERVICE', '', 'Logout', [sLoginId]);
  finally
    c.Free;
  end;
end;

end.
