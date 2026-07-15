unit UntAppMsg;

interface

uses Windows, Classes, WinSock, SysUtils;

const
  BlockSize = 1024; //文件块大小

type
  //消息类型

  TMsgKind = (
    mkLogin = 1 {登录}
    , mkLoginResp = 2 {登录答得}
    , mkUpdateStatus = 3 {更新状态}
    , mkLogOut = 4 {退出}
    , mkBroadCast = 5
    , mkMsgItem = 6
    , mkAssignKey = 7
    , mkMakeHole = 8
    , mkHole = 9
    , mkLockSystem = 10 {用于用户在其他电脑登录时锁定}
    );

  TMsgShowType = (mstWin = 1, mstBar = 2, mstWinAndBar = 3);
  //消息头
  PMsgHead = ^TMsgHead;
  TMsgHead = packed record
    MsgKind: TMsgKind;
    UserID: array[0..30] of AnsiChar;
    ip: Longint;
    port: Word;
    case Integer of
      0: (
        WParam: Longint;
        LParam: Longint;
        Result: Longint);
      1: (
        WParamLo: Word;
        WParamHi: Word;
        LParamLo: Word;
        LParamHi: Word;
        ResultLo: Word;
        ResultHi: Word);
  end;
  //登陆消息
  PMsgLogin = ^TMsgLogin;
  TMsgLogin = packed record
    Head: TMsgHead;
    ComputerName: array[0..30] of AnsiChar;
    MacAddr: array[0..20] of AnsiChar;
    WelcomeWord: array[0..30] of AnsiChar;
    LoginGUID: array[0..100] of AnsiChar;
    LoginTime: TDateTime;
  end;

  TMsgLoginResp = packed record
    Head: TMsgHead;
    DBServerName: array[0..30] of AnsiChar;
    DBUserName: array[0..20] of AnsiChar;
    DBUserPassword: array[0..100] of AnsiChar;
    sInfo: array[0..500] of AnsiChar;
  end;

  TMsgUpdateStatus = packed record
    Head: TMsgHead;
    ComputerName: array[0..30] of AnsiChar;
    MacAddr: array[0..20] of AnsiChar;
    LoginTime: TDateTime;
    UpdateTime: TDateTime;
    LoginGUID: array[0..100] of AnsiChar;
  end;

  TMsgLogOut = packed record
    Head: TMsgHead;
    LogOutTime: TDateTime;
    MacAddr: array[0..20] of AnsiChar;
    LoginGUID: array[0..100] of AnsiChar;
  end;

  TMsgAssignKey = packed record
    Head: TMsgHead;
    AssignKey1: DWORD;
    AssignKey2: Dword;
  end;

  TMsgItem = packed record
    Head: TMsgHead;
    sID: TGUID;
    sReceiver: array[0..30] of AnsiChar;
    sTitle: array[0..100] of AnsiChar;
    sContent: array[0..800] of AnsiChar;
    usmMsgItemsGuid: TGUID;
    MsgShowType: TMsgShowType; //win,bar
  end;


var
  UDPLocalPort: Word;
  UDPServerPort: Word;
  ServerLockPort: Word;
  UDPServerHost: string;
  LocalIP: string;
  LocalHostName: string;
  LocalMacAddr: string;
  WelcomeWord: string;
  LocalLoginTime: TDateTime;
  FRomoteNum: Integer;
  FClientNum: Integer;

  sProvider: string;
  sServerName: string;

  sDBName: string;

  sDBUser: string;
  sDBPassword: string;
  sLoginId: string;
  sServiceName: string;
  iProjectId: Integer;

const
  MsgShowTypeName: array[TMsgShowType] of string = ('WIN', 'BAR', 'WIN;BAR');
  buflen = 2048;

function IpToString(ip: Integer): string; overload;
function IpToString(inaddr: in_addr): string; overload;
function StringToIp(sIP: string): Integer;
function getlocalip: string;

function MsgStrToString(AMsgStr: PAnsiChar): WideString;
procedure StringToMsgStr(AMsgStr: PAnsiChar; const S: WideString; MaxLen: Cardinal = 0);

implementation

function MsgStrToString(AMsgStr: PAnsiChar): WideString;
begin

  Result := UTF8ToString(AMsgStr);

end;

procedure StringToMsgStr(AMsgStr: PAnsiChar; const S: WideString; MaxLen: Cardinal);
var
  RS: RawByteString;

begin
  RS := UTF8Encode(S);
  if MaxLen <= 0 then
    MaxLen := Length(RS);
  StrPLCopy(AMsgStr, RS, MaxLen);
end;

function IpToString(ip: Integer): string;
var
  inaddr: in_addr;
begin
  inaddr.S_addr := ip;
  Result := IpToString(inaddr);
end;

function IpToString(inaddr: in_addr): string;
begin
  Result := string(inet_ntoa(inaddr));
end;

function StringToIp(sIP: string): Integer;
begin
  Result := inet_addr(PAnsiChar(AnsiString(sIP)));
end;

function getlocalip: string;
var
  aWSAData: TWSAData;
  myHost: PHostEnt;
  ch: array[0..50] of AnsiChar;
begin
  Result := '';
  if WSAStartup($0101, aWSAData) <> 0 then
    Exit;
  try
    FillChar(ch, SizeOf(ch), 0);
    if GetHostName(ch, 50) <> 0 then
      Exit;
    myHost := GetHostByName(ch);
    Result := string(inet_ntoa(PInAddr(myHost^.h_addr^)^));
  except
    Exit;
  end;
end;

end.
