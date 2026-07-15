unit ufraModuleBase;

interface

uses
  scGPPagers, scGPFontControls, scGPExtControls, scGPControls, scModernControls,
  VMsgMonitor, UIVMsgs, DMUnt, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, scControls, System.Actions, Vcl.ActnList, cxClasses, cxStyles, LanguageManager;

type
  TCloseModuleEvent = procedure() of object;

  TfraModuleBase = class(TFrame)
    ClientPanel: TscPanel;
    actList: TActionList;
  private
    FHasData: Boolean;
    FOnCloseModule: TCloseModuleEvent;
    // FFocusControl: TcxBarEditItem;
    FDmModule: TDataModule;
    FCaption: string;
    procedure SetDmModul(const Value: TDataModule);
    // procedure SetFocusControl(const Value: TcxBarEditItem);
    procedure SetHasData(const Value: Boolean);
  public
    procedure VMsgUpdateAppColor(Sender: TObject; AMsg: TVMsg); virtual;
    procedure UpdateAppColor;
    property OnCloseModule: TCloseModuleEvent read FOnCloseModule write FOnCloseModule;
    property HasData: Boolean read FHasData write SetHasData;
    property dmModule: TDataModule read FDmModule write SetDmModul; // ��������������

    procedure InitModuleLayout; virtual;
    procedure GetData; virtual;
    procedure CloseData; virtual;
    procedure LockChangeEvent(lType: Integer = 1); virtual; abstract;
    procedure InitShortCut; virtual; // ��ʼ����ݼ�
    procedure SetDetailPrivilege; virtual; abstract;
    // �Ƴ���ݼ�
    procedure RemoveShortCut; virtual;
    // ����������
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property sCaption:string  read FCaption write FCaption;
  end;

implementation

{$R *.dfm}
{ TfraModuleBase }

procedure TfraModuleBase.CloseData;
begin

end;

constructor TfraModuleBase.Create(AOwner: TComponent);
begin
  inherited;
//  Width := dm.MainClientWidth;
//  Height := dm.MainClientHeight;
  InitShortCut; //�����෽���ж����˿ؼ���HelpKeyword
  //ע����Ϣ
  with GlobalVMsgMonitor do
  begin
    RegMsg(Self, TUpdateAppColorMsg, VMsgUpdateAppColor);
  end;
end;

destructor TfraModuleBase.Destroy;
begin
  GlobalVMsgMonitor.RemoveOwner(self);
  inherited;
end;

procedure TfraModuleBase.GetData;
begin
  // ģ����غ󰴵�ǰ����ˢ�¾�̬ Caption����̬ҵ�����ݲ��ڴ˷��룩
  TranslateFormLanguage(Self);
end;

procedure TfraModuleBase.InitModuleLayout;
begin
  UpdateAppColor;
end;

procedure TfraModuleBase.InitShortCut;
begin

end;

procedure TfraModuleBase.RemoveShortCut;
begin

end;

procedure TfraModuleBase.SetDmModul(const Value: TDataModule);
begin
  FDmModule := Value;
end;

procedure TfraModuleBase.SetHasData(const Value: Boolean);
begin
  FHasData := Value;
end;

procedure TfraModuleBase.UpdateAppColor;
begin
if AppColor.IsUseColorSkin = False then
    Exit;
  AppColor.UpdateAppColor(self);
end;

procedure TfraModuleBase.VMsgUpdateAppColor(Sender: TObject; AMsg: TVMsg);
begin
  UpdateAppColor;

end;

end.
