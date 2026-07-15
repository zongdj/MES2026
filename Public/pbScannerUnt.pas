unit pbScannerUnt;

interface

uses SysUtils, Math, Variants, StrUtils, CPort;

var
  ComScannerCurrValue: string;
  ComScannerTempValue: AnsiString;
  ComScannerSerialOpened: Boolean;

  // 普泽扫描头
  // 按16进制接收，转为ASCII码
procedure ScannerSerialPortDataReceived(Sender: TObject; Count: Integer);

implementation

procedure ScannerSerialPortDataReceived(Sender: TObject; Count: Integer);
var
  ComPort: TComPort;
  sData: AnsiString;
  c: AnsiChar;
  i: Integer;
begin
  ComPort := TComPort(Sender);
  if Count > 0 then
  begin
    SetLength(sData, Count);
    ComPort.Read(sData[1], Count);
    for i := 1 to Count do
    begin
      c := sData[i];
      if (c = #13) or (c = #10) then
      begin
        if ComScannerTempValue <> '' then
        begin
          ComScannerCurrValue := string(ComScannerTempValue);
          ComScannerTempValue := '';
        end;
      end
      else
      begin
        ComScannerTempValue := ComScannerTempValue + c;
      end;
    end;
  end;
end;

end.
