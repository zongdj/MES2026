unit uIniOptions;

interface

uses
  Classes, SysUtils, IniFiles, Forms, Windows;

const
  csIniLoginSection = 'Login';
  csIniColorSkinSection = 'ColorSkin';

  {Section: Login}
  csIniLoginUserName = 'UserName';
  csIniLoginPassWord = 'PassWord';

  {Section: ColorSkin}
  csIniColorSkinPrimaryColor = 'PrimaryColor';
  csIniColorSkinIsUseColorSkin = 'IsUseColorSkin';

type
  TIniOptions = class(TObject)
  private
    {Section: Login}
    FLoginUserName: string;
    FLoginPassWord: string;
    FPrimaryColor: Integer;
    FIsUseColorSkin: Boolean;
  public
    procedure LoadSettings(Ini: TIniFile);
    procedure SaveSettings(Ini: TIniFile);
    procedure LoadFromFile(const FileName: string);
    procedure SaveToFile(const FileName: string);

    {Section: Login}
    property LoginUserName: string read FLoginUserName write FLoginUserName;
    property LoginPassWord: string read FLoginPassWord write FLoginPassWord;

    {Section: ColorSkin}
    property PrimaryColor: Integer read FPrimaryColor write FPrimaryColor;
    property IsUseColorSkin: Boolean read FIsUseColorSkin write FIsUseColorSkin;
  end;

var
  IniOptions: TIniOptions = nil;

implementation

procedure TIniOptions.LoadSettings(Ini: TIniFile);
begin
  if Ini <> nil then
  begin
    {Section: Login}
    FLoginUserName := Ini.ReadString(csIniLoginSection, csIniLoginUserName, 'abc');
    FLoginPassWord := Ini.ReadString(csIniLoginSection, csIniLoginPassWord, 'aaa');

    {Section: ColorSkin}
    FPrimaryColor := Ini.ReadInteger(csIniColorSkinSection, csIniColorSkinPrimaryColor, $00FF9E40);
    FIsUseColorSkin := Ini.ReadBool(csIniColorSkinSection, csIniColorSkinIsUseColorSkin, False);
  end;
end;

procedure TIniOptions.SaveSettings(Ini: TIniFile);
begin
  if Ini <> nil then
  begin
    {Section: Login}
    Ini.WriteString(csIniLoginSection, csIniLoginUserName, FLoginUserName);
    Ini.WriteString(csIniLoginSection, csIniLoginPassWord, FLoginPassWord);

    {Section: ColorSkin}
    Ini.WriteInteger(csIniColorSkinSection, csIniColorSkinPrimaryColor, FPrimaryColor);
    Ini.WriteBool(csIniColorSkinSection, csIniColorSkinIsUseColorSkin, FIsUseColorSkin);
  end;
end;

procedure TIniOptions.LoadFromFile(const FileName: string);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FileName);
  try
    LoadSettings(Ini);
  finally
    Ini.Free;
  end;
end;

procedure TIniOptions.SaveToFile(const FileName: string);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FileName);
  try
    SaveSettings(Ini);
  finally
    Ini.Free;
  end;
end;

initialization
  IniOptions := TIniOptions.Create;
  IniOptions.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\data\config.InI');

finalization
  IniOptions.Free;

end.

