unit SysUserInfoUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, DB, ADODB, DateUtils;

type
  TSysUser = class(TObject)
  private
    FUserGUID: string;
    FUserEmpGUID: string;
    FiUserId: Integer;
    FUserId: string;
    FUserName: string;
    FUserPwd: string;
    FUserType: Integer;
    // FLogLoginGUID: string;
    FNeedChangePassword: Boolean;
    FUsePasswordStrategy: Boolean;
    // COMPANY
    FCompanyID: Integer;
    FCompanyCode: string;
    FCompanyName: string;
    FHeadCompany: Boolean;
    FPassword: string;
    FbRememberPassword: Boolean;
    FSysType: Integer;
    function EncryptionEngine(Src, Key: string; Encrypt: Boolean): string;
  public
    function MD5Pwd(const sPwd: string): string;
    function CheckPassword(const AUserId, APassword: string;
      const bLogin, bRaiseError: Boolean): Boolean;
    procedure ChangePwd(ANewPwd: string);
    property iUserId: Integer read FiUserId;
    property UserId: string read FUserId;
    property UserName: string read FUserName;
    property UserGUID: string read FUserGUID;
    property UserGmpGUID: string read FUserEmpGUID;
    property UserType: Integer read FUserType;
    property Password: string read FPassword write FPassword;
    // property LogLoginGUID: string read FLogLoginGUID;
    property NeedChangePassword: Boolean read FNeedChangePassword;
    property UsePasswordStrategy: Boolean read FUsePasswordStrategy;
    // COMPANY
    property CompanyID: Integer read FCompanyID write FCompanyID;
    property CompanyCode: string read FCompanyCode write FCompanyCode;
    property CompanyName: string read FCompanyName write FCompanyName;
    property HeadCompany: Boolean read FHeadCompany write FHeadCompany;
    //
    property bRememberPassword: Boolean read FbRememberPassword
      write FbRememberPassword;
    //
    property SysType: Integer read FSysType write FSysType;
  end;

var
  FSysUserInfo: TSysUser;

implementation

{ TSysUser }

uses DMUnt, ADOInt, UntAppMsg, UntRegClass, dxHash, System.Hash, MessageUnit,
  rtcMW.Comp.Client;

function TSysUser.EncryptionEngine(Src: string; Key: string;
  Encrypt: Boolean): string;
var
  // idx         :integer;
  KeyLen: Integer;
  KeyPos: Integer;
  offset: Integer;
  dest: string;
  SrcPos: Integer;
  SrcAsc: Integer;
  TmpSrcAsc: Integer;
  Range: Integer;
begin
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
    dest := format('%1.2x', [offset]);
    for SrcPos := 1 to Length(Src) do
    begin
      SrcAsc := (Ord(Src[SrcPos]) + offset) mod 255;
      if KeyPos < KeyLen then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;
      SrcAsc := SrcAsc xor Ord(Key[KeyPos]);
      dest := dest + format('%1.2x', [SrcAsc]);
      offset := SrcAsc;
    end;
  end
  else
  begin
    if Copy(Src, 1, 2) = '' then
      exit; // !!
    offset := StrToInt('$' + Copy(Src, 1, 2));
    SrcPos := 3;
    while SrcPos < Length(Src) do // repeat
    begin
      SrcAsc := StrToInt('$' + Copy(Src, SrcPos, 2));
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
      SrcPos := SrcPos + 2;
    end; // until SrcPos >= Length(Src);
  end;
  Result := dest;
end;

procedure TSysUser.ChangePwd(ANewPwd: string);
const
  sSql: string = 'SELECT * FROM smUser WHERE sUserId=:sUserId ';
var
  F: TField;
begin
  with DM.qry do
  begin
    DM.qry.Open(sSql, [FUserId]);
    if not Active or IsEmpty then
      raise Exception.Create('当前用户未找到！');
    // Recordset.Properties.Get_Item('Update Criteria').Value := adCriteriaKey;
    Edit;
    FieldByName('sPassword').AsString := EncryptionEngine(ANewPwd,
      'CTTPASSWORD', True);
    F := FindField('sPasswordMD5');
    if AsSigned(F) then
      F.AsString := MD5Pwd(ANewPwd);
    F := FindField('bNeedChangePassword');
    if AsSigned(F) then
      F.AsBoolean := False;
    F := FindField('tChangePasswordTime');
    if AsSigned(F) then
      F.AsDateTime := DM.GetSystemDateTime;
    Post;
    DM.qry.ApplyUpdates();
    FUserPwd := ANewPwd;
    if NeedChangePassword then
      FNeedChangePassword := False;
  end;
end;

function TSysUser.CheckPassword(const AUserId, APassword: string;
  const bLogin, bRaiseError: Boolean): Boolean;
const
  sSql: string = 'SELECT *,tServerTime=GETDATE() ' +
    'FROM smUser WHERE bUsable=1 and sUserId = :UserId ';
var
  sPwd, sMac1, sMac2: string;
  F: TField;

  FLock, FMD5: TField;
  iMinutes, iPasswordLockMinutes: Integer;
  iValidateCount, iPasswordValidateCount: Integer;
  bLocked, bSavePwd, bInvalidPassword: Boolean;

  iPasswordValidDays: Integer;
  bUsePasswordStrategy: Boolean;
  qry: TRFDataSet;
begin
  Result := False;
  qry := TRFDataSet.Create(nil);
  qry.Connection := DM.DBManager;
  try
    with qry do
    begin
      UpdateOptions.UpdateTableName := 'smUser';
      UpdateOptions.KeyFields := 'uGuid';
      Open(sSql, [AUserId]);
      if IsEmpty then
        raise Exception.Create('登录账号不存在');

      F := FindField('bUsePasswordStrategy');
      bUsePasswordStrategy := AsSigned(F) and F.AsBoolean;

      bSavePwd := False;
      bInvalidPassword := False;

      // 有MD5的直接判断MD5
      FMD5 := FindField('sPasswordMD5');
      if AsSigned(FMD5) and (FMD5.AsString <> '') then
      begin
        bInvalidPassword := not SameText(FMD5.AsString, MD5Pwd(APassword));
      end
      else
      begin
        try
          sPwd := EncryptionEngine(FieldByName('sPassword').AsString,
            'illustrious', False);
        except
          sPwd := '';
        end;
        if (sPwd = '') or (sPwd <> APassword) then
        begin
          sPwd := EncryptionEngine(FieldByName('sPassword').AsString,
            'CTTPASSWORD', False);
          bInvalidPassword := sPwd <> APassword;
        end;
        bSavePwd := not bInvalidPassword;
      end;

      bLocked := False;
      iPasswordLockMinutes := 0;
      Edit;
      // 修正成MD5密码
      if bSavePwd then
      begin
        FieldByName('sPassword').AsString := EncryptionEngine(APassword,
          'CTTPASSWORD', True);

        if AsSigned(FMD5) then
          FMD5.AsString := MD5Pwd(APassword);
      end;

      if bUsePasswordStrategy then
      begin
        iPasswordLockMinutes := DM.GetSysParamAsInteger('PasswordLockMinutes');
        if iPasswordLockMinutes <= 0 then
          iPasswordLockMinutes := 5;
        FLock := FindField('bLocked');
        bLocked := AsSigned(FLock) and FLock.AsBoolean;
        if bLocked then
        begin
          iMinutes := MinutesBetween(FieldByName('tValidateTime').AsDateTime,
            FieldByName('tServerTime').AsDateTime);
          if (iPasswordLockMinutes > 0) and (iPasswordLockMinutes > iMinutes)
          then
            raise Exception.CreateFmt('用户已经锁定,请过%d分钟再试!',
              [iPasswordLockMinutes - iMinutes]);
          // 超时解锁
          bLocked := False;
          FLock.AsBoolean := False;
          FieldByName('iValidateCount').AsInteger := 0;
        end;
        if bInvalidPassword then
        begin
          iPasswordValidateCount := DM.GetSysParamAsInteger
            ('PasswordValidateCount');
          if iPasswordValidateCount > 0 then
          begin
            iValidateCount := FieldByName('iValidateCount').AsInteger + 1;
            FieldByName('iValidateCount').AsInteger := iValidateCount;
            if iValidateCount >= iPasswordValidateCount then
            begin
              bLocked := True;
              FLock.AsBoolean := True;
            end;
          end;
        end
        else
        begin
          FieldByName('iValidateCount').AsInteger := 0;
        end;
      end;
      F := FindField('tValidateTime');
      if AsSigned(F) then
        F.AsDateTime := FieldByName('tServerTime').AsDateTime;
      if Modified then
        Post;
      // 保存数据
      if SysType <> 2 then
      begin
        ApplyUpdates();
      end;
      if bLocked then
        raise Exception.CreateFmt('用户已经锁定,请过%d分钟再试!', [iPasswordLockMinutes]);

      if bInvalidPassword then
        raise Exception.Create('登录密码错误!');

      if not FieldByName('bUsable').AsBoolean then
        raise Exception.Create('账号已禁用，请联系管理员!');

      // 验证网卡
      F := FindField('bValidateMacAddr');
      if AsSigned(F) and F.AsBoolean then
      begin
        sMac1 := UpperCase(Trim(LocalMacAddr));
        if sMac1 = '' then
          sMac1 := UpperCase(Trim(GetLocalMacAddr));
        F := FindField('sValidateMacAddrList');
        if AsSigned(F) then
          sMac2 := UpperCase(Trim(UpperCase(F.AsString)))
        else
          sMac2 := '';
        sMac2 := StringReplace(sMac2, ';', ',', [rfReplaceAll]);
        sMac2 := StringReplace(sMac2, #9, ',', [rfReplaceAll]);
        sMac2 := StringReplace(sMac2, #10, ',', [rfReplaceAll]);
        sMac2 := StringReplace(sMac2, #13, ',', [rfReplaceAll]);
        if Pos(',' + sMac1 + ',', ',' + sMac2 + ',') = 0 then
          raise Exception.Create('禁止在此台电脑上使用，请联系系统管理员！' + sMac1);
      end;

      // 登录时要改变信息
      if bLogin then
      begin
        F := FindField('iIden');
        if AsSigned(F) then
          FiUserId := F.AsInteger;
        FUserId := FieldByName('sUserId').AsString;
        FUserPwd := sPwd;
        FUserName := FieldByName('sUserName').AsString;
        FUserGUID := FieldByName('uGUID').AsString;
        FUserEmpGUID := FieldByName('uhrEmployeeGUID').AsString;
        FUserType := FieldByName('iUserType').AsInteger;
        FPassword := APassword;
        FUsePasswordStrategy := bUsePasswordStrategy;
        F := FindField('bNeedChangePassword');
        FNeedChangePassword := (F <> nil) and F.AsBoolean;
        if not FNeedChangePassword and bUsePasswordStrategy then
        begin
          iPasswordValidDays :=
            StrToIntDef(DM.GetParameterValue('PasswordValidDays'), 0);
          F := FindField('tChangePasswordTime');
          if (iPasswordValidDays > 0) and (F <> nil) then
            FNeedChangePassword := DM.DBManager.ServerDateTime - F.AsDateTime >
              iPasswordValidDays;
        end;
        // FLogLoginGUID := NewGUID;
      end;
    end;
  finally
    FreeAndNil(qry);
  end;
  Result := True;
end;

function TSysUser.MD5Pwd(const sPwd: string): string;
begin
  // Result := dxHash.dxMD5CalcStr(dxHash.dxMD5CalcStr(sPwd + 'HUANSI'));
  Result := THashMD5.Create.GetHashString
    (THashMD5.Create.GetHashString(sPwd + 'HUANSI'));
  // dxHash.dxMD5CalcStr(dxHash.dxMD5CalcStr(sPwd + 'HUANSI'));

end;

initialization

FSysUserInfo := TSysUser.Create;

finalization

FreeAndNil(FSysUserInfo);

end.
