unit WriteLogUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Forms;

procedure WriteLog(ALog: string);

implementation

var
  FLock: TObject;
  sLogFileName: string;

procedure WriteLog(ALog: string);
var
  myFile: TFileStream;
  openModel: Word;
  byte: TBytes;
  bExist: Boolean;
begin
  // 日志文件名
  if ALog = '' then
    Exit;
  System.TMonitor.Enter(FLock);
  try
    bExist := FileExists(sLogFileName);
    if bExist then
      openModel := fmOpenWrite
    else
      openModel := fmCreate;

    myFile := TFileStream.Create(sLogFileName, openModel);
    try
      if bExist then
      begin
        myFile.Seek(0, soEnd);
      end
      else
      begin
        byte := TEncoding.UTF8.GetPreamble;
        myFile.WriteBuffer(byte, Length(byte));
      end;
      byte := TEncoding.UTF8.GetBytes(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now)
        + #13#10 + ALog +
        #13#10'==============================================='#13#10);
      myFile.WriteBuffer(byte, Length(byte));
    finally
      FreeAndNil(myFile);
    end;
  finally
    System.TMonitor.Exit(FLock);
  end;
end;

initialization

FLock := TObject.Create;
sLogFileName := SysUtils.ChangeFileExt(Application.ExeName, '.log');

finalization

FLock.Free;

end.
