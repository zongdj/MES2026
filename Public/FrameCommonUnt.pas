unit FrameCommonUnt;

interface

uses Windows, SysUtils, Classes, DB, Variants, Graphics, WinSock, Forms,
  Controls, Winapi.ShellAPI;

function StreamToOleVariant(Stream: TStream): OleVariant; inline;
function OleVariantToStream(OV: OleVariant): TStream; inline;
function LoadPictureFromResource(APicture: TPicture; const AResName: string;
  AGraphicClass: TGraphicClass = nil): Boolean;
function LoadPictureFromFile(APicture: TPicture; const AFileName: string;
  AGraphicClass: TGraphicClass = nil): Boolean;
function LoadPictureFromField(APicture: TPicture; AField: TField;
  AGraphicClass: TGraphicClass = nil): Boolean;
function LoadPictureFromStream(APicture: TPicture; AStream: TStream;
  AGraphicClass: TGraphicClass = nil): Boolean;
function IpToString(ip: Integer): string; overload;
function IpToString(inaddr: in_addr): string; overload;
function StringToIp(sIP: string): Integer;
function GetLocalIp: string;
function GetNewGUID: string;
function GetConfigFileName: string;
function GetExePath: string;
procedure SystemError(Info: string; Flag: Integer = 0; AExit: Boolean = False);
procedure SetStringsValue(AStrings: TStrings; AName, AValue:string);
procedure PostControlEditValue(c: TControl);
function StringToBoolean(s: string): Boolean;
procedure OpenUrl(AUrl: string); // 异步打开默认浏览器

const
  sLoginKey: string = '{3B18C0B9-D074-49E3-AF51-D688F8169F4D}';
  sMsgKey: string = '{9F82FA49-D4F3-46AC-8098-1924AE9B0C9D}';

var
  sAppTitle: string = 'HS MES管理平台';
  sCompanyName: string = '绍兴环思智慧科技股份有限公司';
  sAppCaption: string = 'HS MES管理平台';

implementation

uses jpeg, dxGDIPlusClasses, ComObj, MessageServiceUnt, cxEdit, cxTextEdit;

type
  TcxCustomInnerTextEditAccess = class(TcxCustomInnerTextEdit);

procedure OpenUrl(AUrl: string);
var
  AProc: TProc;

  function LoadUrl(Url: string): TProc;
  begin
    Result :=
      procedure
      begin
        ShellExecute(Application.Handle, 'open', PChar(Url), '', nil, SW_SHOWNORMAL);
      end;
  end;

begin
  AProc := LoadUrl(AUrl);
  TThread.CreateAnonymousThread(AProc).Start;
end;

function LoadPictureFromResource(APicture: TPicture; const AResName: string;
  AGraphicClass: TGraphicClass): Boolean;
var
  AStream: TStream;
begin
  Result := False;
  if AResName <> '' then
  begin
    AStream := TResourceStream.Create(HInstance, AResName, RT_RCDATA);
    try
      Result := LoadPictureFromStream(APicture, AStream, AGraphicClass);
    finally
      AStream.Free;
    end;
  end
  else
    APicture.Assign(nil);
end;

function LoadPictureFromFile(APicture: TPicture; const AFileName: string;
  AGraphicClass: TGraphicClass): Boolean;
var
  AStream: TStream;
begin
  Result := False;
  if (AFileName <> '') and FileExists(AFileName) then
  begin
    AStream := TFileStream.Create(AFileName, fmOpenRead);
    try
      Result := LoadPictureFromStream(APicture, AStream, AGraphicClass);
    finally
      AStream.Free;
    end;
  end
  else
    APicture.Assign(nil);
end;

function LoadPictureFromField(APicture: TPicture; AField: TField;
  AGraphicClass: TGraphicClass): Boolean;
var
  AStream: TStream;
begin
  Result := False;
  if Assigned(AField) then
  begin
    AStream := AField.DataSet.CreateBlobStream(AField, bmRead);
    try
      Result := LoadPictureFromStream(APicture, AStream, AGraphicClass);
    finally
      AStream.Free;
    end;
  end
  else
    APicture.Assign(nil);
end;

function LoadPictureFromStream(APicture: TPicture; AStream: TStream;
  AGraphicClass: TGraphicClass = nil): Boolean;
{ Paradox graphic BLOB header - see DB.pas }
type
  TGraphicHeader = record
    Count: Word; { Fixed at 1 }
    HType: Word; { Fixed at $0100 }
    Size: Longint; { Size not including header }
  end;
var
  AGraphic: TGraphic;
  AHeader: TGraphicHeader;
  AWord: Word; { bely zhou }
  AGClass: TGraphicClass; { bely zhou }
begin
  Result := False;
  if Assigned(AStream) and (AStream.Size > SizeOf(AHeader)) then
  begin
    AGClass := nil; // bely zhou

    AStream.Position := 0;
    if AStream.Size > SizeOf(AWord) then { bely zhou 判断图片类型支持多种格式 }
    begin
      AStream.read(AWord, SizeOf(AWord));
      case AWord of
        $0000:
          AGClass := TIcon; // Icon Cursor
        $0001:
          AGClass := TMetafile; // EMF
        $4947:
          AGClass := nil; // Gif
        $4D42:
          AGClass := Graphics.TBitmap; // Bitmap
        $CDD7:
          AGClass := TMetafile; // WMF
        $D8FF:
          AGClass := TJPEGImage; // Jpeg
        $5089:
          AGClass := TdxPNGImage; // PNG
      end;
    end;

    AStream.Position := 0;
    AStream.read(AHeader, SizeOf(AHeader));
    if (AHeader.Count <> 1) or (AHeader.HType <> $0100) or
      (AHeader.Size <> AStream.Size - SizeOf(AHeader)) then
      AStream.Position := 0;

    if AGClass <> nil then // bely zhou
      AGraphicClass := AGClass;
    try
      if AGraphicClass = nil then
      begin
        APicture.Bitmap.LoadFromStream(AStream);
      end
      else
      begin
        AGraphic := AGraphicClass.Create;
        try
          AGraphic.LoadFromStream(AStream);
          APicture.Graphic := AGraphic;
        finally
          AGraphic.Free;
        end;
      end;
      Result := True;
    except
      APicture.Assign(nil);
    end;
  end
  else
    APicture.Assign(nil);
end;

function StreamToOleVariant(Stream: TStream): OleVariant;
var
  Data: PByteArray;
begin
  Result := VarArrayCreate([0, Stream.Size - 1], varByte);
  Data := VarArrayLock(Result);
  try
    Stream.Position := 0;
    Stream.ReadBuffer(Data^, Stream.Size);
  finally
    VarArrayUnlock(Result);
  end;
end;

function OleVariantToStream(OV: OleVariant): TStream;
var
  Data: PByteArray;
  Size: Integer;
begin
  Result := TMemoryStream.Create;
  try
    Size := VarArrayHighBound(OV, 1) - VarArrayLowBound(OV, 1) + 1;
    Data := VarArrayLock(OV);
    try
      Result.Position := 0;
      Result.WriteBuffer(Data^, Size);
    finally
      VarArrayUnlock(OV);
    end;
  except
    Result.Free;
  end;
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
  Result := string(AnsiString(inet_ntoa(inaddr)));
end;

function StringToIp(sIP: string): Integer;
begin
  Result := inet_addr(PAnsiChar(AnsiString(sIP)));
end;

function GetLocalIp: string;
var
  aWSAData: TWSAData;
  myHost: PHostEnt;
  ch: array [0 .. 50] of AnsiChar;
begin
  Result := '';
  if WSAStartup($0101, aWSAData) <> 0 then
    Exit;
  try
    FillChar(ch, SizeOf(ch), 0);
    if GetHostName(ch, 50) <> 0 then
      Exit;
    myHost := GetHostByName(ch);
    Result := string(AnsiString(inet_ntoa(PInAddr(myHost^.h_addr^)^)));
  except
    Exit;
  end;
end;

function GetNewGUID: string;
var
  u: TGUID;
begin
  CreateGUID(u);
  Result := GUIDToString(u);
end;

function GetConfigFileName: string;
begin
  Result := ExtractFilePath(ParamStr(0)) + 'MES.ini';
end;

function GetExePath: string;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

procedure SystemError(Info: string; Flag: Integer = 0; AExit: Boolean = False);
begin
  //Result := Application.MessageBox(PChar(Info), '系统错误', Flag + MB_ICONERROR);
  MessageService.ShowError(Info);
  if AExit then
  begin
    Application.Minimize;
    Application.Terminate;
    Abort;
  end;
end;

procedure SetStringsValue(AStrings: TStrings; AName, AValue:string);
var
  I: Integer;
begin
  I := AStrings.IndexOfName(AName);
  if I >= 0 then
    AStrings.Delete(I);
  AStrings.Add(AName + '=' + AValue);
end;

procedure PostControlEditValue(c: TControl);
begin
  if Assigned(c) then
  begin
    if c is TcxCustomInnerTextEdit then
      c := TcxCustomInnerTextEditAccess(c).Container;
    if (c is TcxCustomEdit) then
      if TcxCustomEdit(c).EditModified then
      TcxCustomEdit(c).PostEditValue;
  end;
end;

function StringToBoolean(s: string): Boolean;
begin
  s := LowerCase(s);
  Result := (s = 'true') or (s = 't') or (s = '1') or (s = 'yes') or (s = 'y');
end;

end.
