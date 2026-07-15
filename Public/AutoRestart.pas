

unit AutoRestart;

interface

{$WARN SYMBOL_PLATFORM OFF}

uses
  Windows, Messages, Classes, Controls, Graphics, Dialogs, ShellAPI;

procedure Relaunch(const ParamStr: string);
procedure DeleteTemporaryFiles;

implementation

uses Forms, Consts, SysUtils;

const
  UpgraderModuleName = 'HSUPGD';
  TMPExt = '.uTMP';

var
  LanguageID: Word = 0;
  UpgraderFileName: string; // "Upgrader.exe", see Initialization section

{$R AutoRestart.res}

function LoadResourceToStream(Instance: hInst; ResName, ResType: PChar; Stream: TStream): Boolean;
var
  ResSrc: hRSrc;
  ResGlobal: hGlobal;
  ResAddr: Pointer;
  ResLength: DWord;
begin
  Result := False;
  if Stream = nil then Exit;

  ResSrc := FindResource(Instance, ResName, ResType);
  if ResSrc = 0 then Exit;
  ResGlobal := LoadResource(Instance, ResSrc);
  if ResGlobal = 0 then Exit;
  ResAddr := LockResource(ResGlobal);
  FreeResource(ResGlobal);
  if ResAddr = nil then Exit;

  ResLength := SizeOfResource(Instance, ResSrc);
  if ResLength = 0 then Exit;

  try
    Stream.WriteBuffer(ResAddr^, ResLength);
    Result := True;
  except
  end;
end;

procedure ShutdownApplication;
begin
  if Assigned(Application.MainForm) then
    Application.MainForm.Close;
  Application.Terminate;
  Abort;
end;

function GetTempDir: string;
{
var
  PC: array[0..MAX_PATH + 1] of Char;
}
begin
{
  GetTempPath(MAX_PATH, PC);
  Result := IncludeTrailingBackslash(StrPas(PC));
  if not DirectoryExists(Result) then
}
  //就用EXE目录，临时文件夹360会检查
  Result := IncludeTrailingBackslash(ExtractFilePath(Application.ExeName));
end;

procedure Relaunch(const ParamStr: string);
var
  Dummy: DWord;
  MS: TMemoryStream;
  FileHandle: hFile;
begin
  //文件存在不创建
  if not FileExists(UpgraderFileName) then
  begin
    { writting Upgrader.exe (self upgrading module) }
    FileHandle := CreateFile(PChar(UpgraderFileName), GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE, nil,
      CREATE_ALWAYS, FILE_ATTRIBUTE_TEMPORARY, 0);
    if FileHandle <> INVALID_HANDLE_VALUE then
    begin
      MS := TMemoryStream.Create;
      try
        LoadResourceToStream(hInstance, UpgraderModuleName, UpgraderModuleName, MS);
        WriteFile(FileHandle, MS.Memory^, MS.Size, Dummy, nil);
      finally
        MS.Free;
      end;
      CloseHandle(FileHandle);
    end;
  end;


  { start self-upgrading mechanism }
  //ShowMessage(UpgraderFileName);
  //showmessage(UpgraderFileName + ' ' + Application.ExeName + ' +' + ParamStr);
  //更新不成功，改用shellexec
  ShellExecute(GetDesktopWindow,'open',PChar(UpgraderFileName)
    ,PChar(Application.ExeName + ' +' + ParamStr),
  PChar(ExtractFileDir(Application.ExeName)),SW_SHOWNORMAL);
  //Windows.WinExec(PAnsiChar(AnsiString(UpgraderFileName + ' ' + Application.ExeName + ' +' + ParamStr)), SW_SHOWNORMAL);

  ShutdownApplication;
end;


procedure DeleteTemporaryFiles;
var
  FindHandle: THandle;
  FindData: TWin32FindData;
begin
  FindHandle := FindFirstFile(PChar(IncludeTrailingBackslash(ExtractFilePath(Application.ExeName)) + '*.uTMP'), FindData);
  if FindHandle <> INVALID_HANDLE_VALUE then
  begin
    repeat
      DeleteFile(FindData.cFileName);
    until not FindNextFile(FindHandle, FindData);
    Windows.FindClose(FindHandle);
  end;
end;

initialization
  UpgraderFileName := GetTempDir + 'HsUpdate5.exe'; // v3x

end.

