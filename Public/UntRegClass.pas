unit UntRegClass;

interface
  {$WARN  UNIT_PLATFORM OFF}

          {$WARN SYMBOL_PLATFORM OFF}
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, StdCtrls, ShellAPI,  StrUtils;

const
  MAX_HOSTNAME_LEN = 128; { from IPTYPES.H }
  MAX_DOMAIN_NAME_LEN = 128;
  MAX_SCOPE_ID_LEN = 256;
  MAX_ADAPTER_NAME_LENGTH = 256;
  MAX_ADAPTER_DESCRIPTION_LENGTH = 128;
  MAX_ADAPTER_ADDRESS_LENGTH = 8;
  IniFileName = 'CTTSoft.ini';

type
  TIPAddressString = array [0 .. 4 * 4 - 1] of AnsiChar;
  TMacAddress = array[0..8] of byte;
  PIPAddrString = ^TIPAddrString;

  TIPAddrString = record
    Next: PIPAddrString;
    IPAddress: TIPAddressString;
    IPMask: TIPAddressString;
    Context: Integer;
  end;

  PFixedInfo = ^TFixedInfo;

  TFixedInfo = record { FIXED_INFO }
    HostName: array [0 .. MAX_HOSTNAME_LEN + 3] of AnsiChar;
    DomainName: array [0 .. MAX_DOMAIN_NAME_LEN + 3] of AnsiChar;
    CurrentDNSServer: PIPAddrString;
    DNSServerList: TIPAddrString;
    NodeType: Integer;
    ScopeId: array [0 .. MAX_SCOPE_ID_LEN + 3] of AnsiChar;
    EnableRouting: Integer;
    EnableProxy: Integer;
    EnableDNS: Integer;
  end;

  PIPAdapterInfo = ^TIPAdapterInfo;

  TIPAdapterInfo = record { IP_ADAPTER_INFO }
    Next: PIPAdapterInfo;
    ComboIndex: Integer;
    AdapterName: array [0 .. MAX_ADAPTER_NAME_LENGTH + 3] of AnsiChar;
    Description: array [0 .. MAX_ADAPTER_DESCRIPTION_LENGTH + 3] of AnsiChar;
    AddressLength: Integer;
    Address: array [1 .. MAX_ADAPTER_ADDRESS_LENGTH] of Byte;
    Index: Integer;
    _Type: Integer;
    DHCPEnabled: Integer;
    CurrentIPAddress: PIPAddrString;
    IPAddressList: TIPAddrString;
    GatewayList: TIPAddrString;
    DHCPServer: TIPAddrString;
    HaveWINS: Bool;
    PrimaryWINSServer: TIPAddrString;
    SecondaryWINSServer: TIPAddrString;
    LeaseObtained: Integer;
    LeaseExpires: Integer;
  end;


  TGetMacObj = class(TObject)
  private
  protected
    function EncryptionEngine(Src, Key: string; Encrypt: boolean): string;
  public
    constructor Create;
    destructor Destroy; override;
    function WriteMac(instr: string): SmallInt;
  end;


function GetMacAddr(var MacAddress: TMacAddress): boolean; forward;

function GetSysIniFile: string;
function ReadFromIni(sSection, sIdent, sDefault: string): string;
function ReadRegisterKeyFromIni: string;
procedure WriteToIni(sSection, sIdent, sValue: string);
function WriteRegisterKeyToIni(AWelcomeWord: string): boolean;
function GetLocalMacAddr: string;
procedure FillMacAddrIntoList(AList: TStrings);



implementation

uses Forms, IniFiles, WriteLogUnt;

type
  TRegChar = array [0 .. 100] of AnsiChar;

function GetAdaptersInfo(AI: PIPAdapterInfo; var BufLen: Integer): Integer; stdcall;
external 'iphlpapi.dll' Name 'GetAdaptersInfo';

function GetLocalMacAddr: string;
var
  AList: TStringList;
begin
  Result := '';
  AList := TStringList.Create;
  try
    AList.Sorted := True;
    FillMacAddrIntoList(AList);
    if AList.Count > 0 then
      Result := AList[0];
  finally
    AList.Free;
  end;
end;

procedure FillMacAddrIntoList(AList: TStrings);
var
  FPIPAdapterInfo, Work: PIPAdapterInfo;
  size: Integer;
  sl: TStringList;
  str: string;
begin
  size := 8192;
  GetMem(FPIPAdapterInfo, size);
  sl := TStringList.Create;
  try
    sl.Sorted := True;
    if (GetAdaptersInfo(FPIPAdapterInfo, size) = ERROR_SUCCESS) and (FPIPAdapterInfo <> nil) then
    begin
      Work := FPIPAdapterInfo;
      repeat
        // 只取  _Type 为 6 的网卡
        if (Work^.AddressLength = 6) and (Work^._Type in [6, 71]) then
        begin
          if (Work^.Address[1] <> 0) or (Work^.Address[2] <> 0) or (Work^.Address[3] <> 0) or (Work^.Address[4] <> 0)
            or (Work^.Address[5] <> 0) or (Work^.Address[6] <> 0) then
          begin
            str := Format('%2.2x%2.2x%2.2x%2.2x%2.2x%2.2x', [Work^.Address[1], Work^.Address[2], Work^.Address[3],
              Work^.Address[4], Work^.Address[5], Work^.Address[6]]);
            if Pos('Virtual', Work^.Description) > 0 then
              sl.Add(str)
            else
              AList.Add(str);
          end;
        end;
        Work := Work^.Next;
      until (Work = nil);
    end;
    if AList.Count = 0 then
      AList.Assign(sl);
  finally
    sl.Free;
    FreeMem(FPIPAdapterInfo);
  end;
end;

function formatIntstr(str: TRegChar): string;
var
  i: Integer;
  c: AnsiChar;
begin
  Result := '';
  for i := Low(str) to High(str) do
  begin
    c := str[i];
    if c in ['0' .. '9', 'a' .. 'f', 'A' .. 'F'] then
      Result := Result + Char(c)
    else if Result <> '' then
      Exit;
  end;
end;

function GetMacAddr(var MacAddress: TMacAddress): boolean;
var
  AI, Work: PIPAdapterInfo;
  size: Integer;
  Res: Integer;
begin
  size := 8192;
  GetMem(AI, size);
  Res := GetAdaptersInfo(AI, size);
  if (Res <> ERROR_SUCCESS) then
  begin
    Result := false;
  end
  else
  begin
    Work := AI;
    MacAddress[0] := Work^.Address[1];
    MacAddress[1] := Work^.Address[2];
    MacAddress[2] := Work^.Address[3];
    MacAddress[3] := Work^.Address[4];
    MacAddress[4] := Work^.Address[5];
    MacAddress[5] := Work^.Address[6];
    Result := True;
  end;
  FreeMem(AI);
end;

function EncryptServerKey(Src: string): string;
var
  Key: string;
  KeyLen: Integer;
  KeyPos: Integer;
  offset: Integer;
  dest: string;
  SrcPos: Integer;
  SrcAsc: Integer;
  Range: Integer;
begin
  Result := '';
  if Src = '' then
    Exit;
  dest := '';
  Key := 'dk#' + '@Il' + 'aAL@I' + 'AJ8DK' + '2981E';
  KeyLen := Length(Key);
  KeyPos := 0;
  Range := 256;
  Randomize;
  offset := Random(Range);
  Src := ReverseString(Src);
  dest := Format('%1.2x', [offset]);
  for SrcPos := 1 to Length(Src) do
  begin
    SrcAsc := (Ord(Src[SrcPos]) + offset) mod 255;
    if KeyPos < KeyLen then
      KeyPos := KeyPos + 1
    else
      KeyPos := 1;
    SrcAsc := SrcAsc xor Ord(Key[KeyPos]);
    dest := Format('%1.2x', [SrcAsc]) + dest;
    offset := SrcAsc;
  end;
  Result := UpperCase(ReverseString(dest));
end;

function DecryptServerKey(Src: string): string;
var
  Key: string;
  KeyLen: Integer;
  KeyPos: Integer;
  offset: Integer;
  dest: string;
  SrcPos: Integer;
  SrcAsc: Integer;
  TmpSrcAsc: Integer;
begin
  Result := '';
  if Length(Src) <= 2 then
    Exit;
  dest := '';
  Key := 'dk#' + '@Il' + 'aAL@I' + 'AJ8DK' + '2981E';
  KeyLen := Length(Key);
  KeyPos := 0;
  Src := ReverseString(Src);
  offset := StrToInt('$' + copy(Src, Length(Src) - 1, 2));
  for SrcPos := Length(Src) div 2 - 2 downto 0 do
  begin
    SrcAsc := StrToInt('$' + copy(Src, SrcPos * 2 + 1, 2));
    if KeyPos < KeyLen then
      KeyPos := KeyPos + 1
    else
      KeyPos := 1;
    TmpSrcAsc := SrcAsc xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= offset then
      TmpSrcAsc := 255 + TmpSrcAsc - offset
    else
      TmpSrcAsc := TmpSrcAsc - offset;
    dest := dest + chr(TmpSrcAsc);
    offset := SrcAsc;
  end;
  Result := ReverseString(dest);
end;

function GetSysIniFile: string;
begin
  Result := ExtractFilePath(ParamStr(0)) + IniFileName;
end;

function ReadFromIni(sSection, sIdent, sDefault: string): string;
var
  tIni: TMemIniFile;
begin
  Result := '';
  if Trim(sIdent) <> '' then
  begin
    if Trim(sSection) = '' then
      sSection := 'General';
    tIni := TMemIniFile.Create(GetSysIniFile);
    try
      Result := Trim(tIni.ReadString(sSection, sIdent, ''));
      if (Result = '') and (Trim(sDefault) <> '') then
      begin
        Result := Trim(sDefault);
        tIni.WriteString(sSection, sIdent, Result);
        tIni.UpdateFile;
      end;
    finally
      tIni.Free;
    end;
  end;
end;

function ReadRegisterKeyFromIni: string;
begin
  Result := ReadFromIni('LANGUAGE', 'WelcomeWord', '');
end;

procedure WriteToIni(sSection, sIdent, sValue: string);
var
  tIni: TMemIniFile;
begin
  if Trim(sSection) = '' then
    sSection := 'General';
  if Trim(sIdent) <> '' then
  begin
    tIni := TMemIniFile.Create(GetSysIniFile);
    try
      tIni.WriteString(sSection, sIdent, sValue);
      tIni.UpdateFile;
    finally
      tIni.Free;
    end;
  end;
end;

function WriteRegisterKeyToIni(AWelcomeWord: string): boolean;
begin
  WriteToIni('LANGUAGE', 'WelcomeWord', AWelcomeWord);
  Result := True;
end;

{ TGetMacObj }

function TGetMacObj.EncryptionEngine(Src, Key: string; Encrypt: boolean): string;
var
  KeyLen: Integer;
  KeyPos: Integer;
  offset: Integer;
  dest: string;
  SrcPos: Integer;
  SrcAsc: Integer;
  TmpSrcAsc: Integer;
  Range: Integer;
begin
  Result := '';
  dest := '';
  try

    KeyLen := Length(Key);

    if KeyLen = 0 then


    Key := 'HSNATION';


    KeyLen := Length(Key);
    KeyPos := 0;
    Range := 256;
    if Encrypt then
    begin
      Randomize;
      offset := Random(Range);
      dest := Format('%1.2x', [offset]);
      for SrcPos := 1 to Length(Src) do
      begin
        SrcAsc := (Ord(Src[SrcPos]) + offset) mod 255;
        if KeyPos < KeyLen then
          KeyPos := KeyPos + 1
        else
          KeyPos := 1;
        SrcAsc := SrcAsc xor Ord(Key[KeyPos]);
        dest := dest + Format('%1.2x', [SrcAsc]);
        offset := SrcAsc;
      end;
    end
    else
    begin
      if copy(Src, 1, 2) = '' then
        Exit; // !!
      offset := StrToInt('$' + copy(Src, 1, 2));
      SrcPos := 3;
      while SrcPos < Length(Src) do // repeat
      begin
        SrcAsc := StrToInt('$' + copy(Src, SrcPos, 2));
        if KeyPos < KeyLen then
          KeyPos := KeyPos + 1
        else
          KeyPos := 1;
        TmpSrcAsc := SrcAsc xor Ord(Key[KeyPos]);
        if TmpSrcAsc <= offset then
          TmpSrcAsc := 255 + TmpSrcAsc - offset
        else
          TmpSrcAsc := TmpSrcAsc - offset;
        dest := dest + Char(TmpSrcAsc);
        offset := SrcAsc;
        SrcPos := SrcPos + 2;
      end; // until SrcPos >= Length(Src);
    end;
    Result := dest;

  except
    Result := '';
  end;
end;

constructor TGetMacObj.Create;
begin
end;

destructor TGetMacObj.Destroy;
begin
  inherited;
end;

function TGetMacObj.WriteMac(instr: string): SmallInt;
begin
    WriteRegisterKeyToIni(instr);
    Result := 0;
end;

end.