unit uPublic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, TypInfo, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  scControls, scGPControls, scExtControls, scGPPagers, scGPExtControls, Data.DB,
  Data.Win.ADODB, Vcl.DBCtrls, Vcl.ExtCtrls, System.Actions, Vcl.ActnList;

function ComponentToStr(AComponent: TComponent): string;

function StrToComponent(const Value: string; Instance: TComponent): TComponent;

implementation

function StrToComponent(const Value: string; Instance: TComponent): TComponent;
var
  StrStream: TStringStream;
  BinStream: TMemoryStream;
begin
  StrStream := TStringStream.Create(Value);
  try
    BinStream := TMemoryStream.Create;
    try
      ObjectTextToBinary(StrStream, BinStream);
      BinStream.Seek(0, soFromBeginning);
      Result := BinStream.ReadComponent(Instance);
    finally
      BinStream.Free;
    end;
  finally
    StrStream.Free;
  end;
end;

function ComponentToStr(AComponent: TComponent): string;
var
  BinStream: TMemoryStream;
  StrStream: TStringStream;
  s: string;
begin
  BinStream := TMemoryStream.Create;
  try
    StrStream := TStringStream.Create(s);
    try
      BinStream.WriteComponent(AComponent);
      BinStream.Seek(0, soFromBeginning);
      ObjectBinaryToText(BinStream, StrStream);
      StrStream.Seek(0, soFromBeginning);
      Result := StrStream.DataString;
    finally
      StrStream.Free;
    end;
  finally
    BinStream.Free
  end;
end;

end.

