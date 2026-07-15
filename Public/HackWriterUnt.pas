unit HackWriterUnt;

interface

uses System.SysUtils, System.Variants, System.Classes,
  System.Generics.Defaults, System.Generics.Collections,
  System.Types, System.TypInfo, System.Rtti;

procedure HackWriteComponent(AStream: TStream; AComponent: TComponent);

implementation

var
  FFilterList: TStringList;

function FilterWriteComponentProperty(const Name: string): Boolean;
begin
  Result := FFilterList.IndexOf(Name) >= 0;
end;

procedure HackWriteComponent(AStream: TStream; AComponent: TComponent);
var
  Writer: TWriter;
begin
  Writer := TWriter.Create(AStream, 4096);
  //DontWriteComponentProperty := FilterWriteComponentProperty;
  try
    Writer.WriteDescendent(AComponent, nil);
  finally
    //DontWriteComponentProperty := nil;
    Writer.Free;
  end;
end;

initialization

FFilterList := TStringList.Create;
FFilterList.Sorted := True;
FFilterList.Add('TFDMemTable.Active');

finalization

FreeAndNil(FFilterList);

end.
