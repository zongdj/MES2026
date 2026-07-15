unit uFraModuleMap;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, uFraModuleBase,
  dxBar, cxGraphics, cxTL, Vcl.ComCtrls, cxPC, dxSkinsCore, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxTextEdit,
  cxTLdxBarBuiltInMenu, cxDataControllerConditionalFormattingRulesManagerDialog,
  dxBarBuiltInMenu, cxInplaceContainer, cxClasses, System.Actions, Vcl.ActnList,
  Vcl.ExtCtrls, cxContainer, cxEdit, dxBarCode, dxSkiniMaginary,
  dxCustomTileControl, Vcl.Menus, cxLabel, dxGDIPlusClasses, scControls,
  scGPControls, System.ImageList, Vcl.ImgList, cxImageList, Vcl.StdCtrls,
  Vcl.Mask, scGPExtControls;

type
  TfraModuleMap = class(TfraModuleBase)
    Img1: TcxImageList;
    scGPPanel1: TscGPPanel;
    scGPPanel2: TscGPPanel;
    scGPPanel3: TscGPPanel;
    Image2: TImage;
    scGPLabel5: TscGPLabel;
    scGPLabel6: TscGPLabel;
    scGPLabel7: TscGPLabel;
    scGPLabel8: TscGPLabel;
    scGPPanel4: TscGPPanel;
    scGPPanel5: TscGPPanel;
    scGPPanel6: TscGPPanel;
    scGPLabel2: TscGPLabel;
    cxImageList1: TcxImageList;
    scGPButton2: TscGPButton;
    scGPButton1: TscGPButton;
    scGPButton3: TscGPButton;
    scGPButton4: TscGPButton;
    scGPButton5: TscGPButton;
    scGPPanel7: TscGPPanel;
    scGPLabel1: TscGPLabel;
    scGPLabel3: TscGPLabel;
    scGPLabel4: TscGPLabel;
    scGPLabel9: TscGPLabel;
    scGPLabel10: TscGPLabel;
    scGPLabel11: TscGPLabel;
    scGPLabel12: TscGPLabel;
    scGPLabel13: TscGPLabel;
    scGPLabel14: TscGPLabel;
    scGPLabel15: TscGPLabel;
    scGPLabel16: TscGPLabel;
    scGPLabel17: TscGPLabel;
    scGPLabel18: TscGPLabel;
    scGPPanel8: TscGPPanel;
    scGPPanel9: TscGPPanel;
    scGPPanel10: TscGPPanel;
    scGPButton6: TscGPButton;
    scGPButton7: TscGPButton;
    scGPButton8: TscGPButton;
    SearchEdt: TscGPEdit;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InitModuleLayout; override;
    procedure GetData; override;
    procedure CloseData; override;
    procedure LockChangeEvent(lType: Integer = 1); override;
    procedure InitShortCut; override; // 初始化快捷键
    procedure SetDetailPrivilege; override;
    // 移除快捷键
    procedure RemoveShortCut; override;
    // 创建与销毁
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CloseModule;
  end;

var
  fraModuleMap: TfraModuleMap;

implementation

{$R *.dfm}
{$R WindowsXP.res}
{ TfraModuleBase1 }

procedure TfraModuleMap.CloseModule;
begin

end;

constructor TfraModuleMap.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TfraModuleMap.Destroy;
begin

  inherited;
end;

procedure TfraModuleMap.CloseData;
begin
  inherited;

end;

procedure TfraModuleMap.GetData;
begin
  inherited;

end;

procedure TfraModuleMap.InitModuleLayout;
begin
  inherited;

end;

procedure TfraModuleMap.InitShortCut;
begin
  inherited;

end;

procedure TfraModuleMap.LockChangeEvent(lType: Integer);
begin
  inherited;

end;

procedure TfraModuleMap.RemoveShortCut;
begin
  inherited;

end;

procedure TfraModuleMap.SetDetailPrivilege;
begin
  inherited;

end;

initialization
  RegisterClass(TfraModuleMap);

end.

