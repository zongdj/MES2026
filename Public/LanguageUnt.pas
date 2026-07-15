unit LanguageUnt;

interface

uses Windows, SysUtils, SysUserUnt;

procedure LoadLanguage;

implementation

uses hsFrameUnt, HookUtils, frxRes, LanguageManager,
  frxrcClass_English, frxrcDesgn_English,
  frxrcExports_English, frxrcInsp_English,
  frxrcClass_Indonesian, frxrcDesgn_Indonesian,
  frxrcExports_Indonesian, frxrcInsp_Indonesian;

var
  FUiLanguage: TiLanguageType;
  FLanguageInited: Boolean;
  FOldProc: Pointer;

function LoadResStringDef(ResStringRec: PResStringRec): string;
var
  Buffer: array [0..4095] of Char;
begin
  if ResStringRec = nil then Exit;
  if ResStringRec.Identifier < 64*1024 then
    SetString(Result, Buffer,
      LoadString(FindResourceHInstance(ResStringRec.Module^),
        ResStringRec.Identifier, Buffer, Length(Buffer)))
  else
    Result := PChar(ResStringRec.Identifier);
end;

function LoadResStr(ResStringRec: PResStringRec): string;
var
  str: string;
begin
  Result := LoadResStringDef(ResStringRec);
  if Length(Result) < 50 then
  begin
     str := hsFrame.TranslateMessage(Result);
     if str <> '' then
       Result := str;
  end;
end;

procedure LoadLanguage;
var
  uiLang: TiLanguageType;
  sType: string;
begin
  if FOldProc = nil then
    HookProc(@System.LoadResString, @LoadResStr, FOldProc);

  uiLang := ResolveUiLanguage(Integer(FSysUser.LanguageType));
  if uiLang = ltiChinese then
    Exit;

  if FLanguageInited and (FUiLanguage = uiLang) then
    Exit;

  FUiLanguage := uiLang;
  FLanguageInited := True;

  sType := IntToStr(Integer(uiLang));
  if frxResources.Get('LanguageType') = sType then
    Exit;

  frxResources.Add('LanguageType', sType);

  // FastReport 无越南语资源包时，英/越均使用英文资源
  if uiLang in [ltiEnglish, ltiVietnamese] then
  begin
    frxrcClass_English.ResAdd;
    frxrcDesgn_English.ResAdd;
    frxrcExports_English.ResAdd;
    frxrcInsp_English.ResAdd;
  end;
end;

end.
