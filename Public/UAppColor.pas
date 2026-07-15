unit UAppColor;

interface

uses
  scGPPagers, scGPFontControls, scModernControls, Winapi.Messages, Vcl.Dialogs,
  scControls, System.Actions, Vcl.ActnList, UIVMsgs, scDrawUtils, VMsgMonitor,
  scGPExtControls, scGPControls, Vcl.Graphics, Winapi.Windows,
  Variants, Forms, System.SysUtils, System.Classes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  Data.DB, FireDAC.Comp.Client, cxLookAndFeelPainters,
  cxGraphics, dxSkinsCore, cxClasses,
  Vcl.Controls,   cxStyles, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.DApt,
  FireDAC.Phys.SQLiteVDataSet, FireDAC.Stan.StorageBin, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxLookAndFeels, dxSkinsForm;

type
   //参考https://element.eleme.cn/#/zh-CN/component/button
  TEdtColor = class(TPersistent)
  private
    FHotColor: TColor;
    FCaptionColor: TColor;
    FNormalColor: TColor;
    FFrameHotColor: TColor;
    FFrameNormalColor: TColor;
    FFocusedColor: TColor;
    FFrameFocusedColor: TColor;
  public
    constructor Create();
  published
    property FocusedColor: TColor read FFocusedColor write FFocusedColor;
    property NormalColor: TColor read FNormalColor write FNormalColor;
    property HotColor: TColor read FHotColor write FHotColor;
    property FrameFocusedColor: TColor read FFrameFocusedColor write FFrameFocusedColor;
    property FrameNormalColor: TColor read FFrameNormalColor write FFrameNormalColor;
    property FrameHotColor: TColor read FFrameHotColor write FFrameHotColor;
  end;

  TBtnColor = class(TPersistent)
  private
    FHotColor: TColor;
    FPressedColor: TColor;
    FCaptionColor: TColor;
    FNormalColor: TColor;
    FFramePressedColor: TColor;
    FFrameHotColor: TColor;
    FFrameNormalColor: TColor;
    FFocusedColor: TColor;
    FFrameFocusedColor: TColor;
  public
    constructor Create();
  published
    property FocusedColor: TColor read FFocusedColor write FFocusedColor;
    property NormalColor: TColor read FNormalColor write FNormalColor;
    property HotColor: TColor read FHotColor write FHotColor;
    property PressedColor: TColor read FPressedColor write FPressedColor;
    property FrameFocusedColor: TColor read FFrameFocusedColor write FFrameFocusedColor;
    property FrameNormalColor: TColor read FFrameNormalColor write FFrameNormalColor;
    property FrameHotColor: TColor read FFrameHotColor write FFrameHotColor;
    property FramePressedColor: TColor read FFramePressedColor write FFramePressedColor;
  end;

  TPanelColor = class(TPersistent)
  private
    FNormalColor2: TColor;
    FFrameNormalColor: TColor;
    FNormalColor: TColor;
    FFontColor: TColor;
  public
    constructor Create();
  published
    property NormalColor: TColor read FNormalColor write FNormalColor;
    property NormalColor2: TColor read FNormalColor2 write FNormalColor2;
    property FrameNormalColor: TColor read FFrameNormalColor write FFrameNormalColor;
    property FontColor: TColor read FFontColor write FFontColor;
  end;

  TPageControlColor = class(TPersistent)
  private
    FFrameActiveColor: TColor;
    FPageColor: TColor;
    FFontColor: TColor;
    FTabsBGFillColor: TColor;
    FFrameNormalColor: TColor;
    FFrameMouseInColor: TColor;
  public
    constructor Create();
  published
   //初步定义这么多，也需要的自己添加
    property TabsBGFillColor: TColor read FTabsBGFillColor write FTabsBGFillColor;
    property FrameNormalColor: TColor read FFrameNormalColor write FFrameNormalColor;
    property FrameMouseInColor: TColor read FFrameMouseInColor write FFrameMouseInColor;
    property FrameActiveColor: TColor read FFrameActiveColor write FFrameActiveColor;
    property PageColor: TColor read FPageColor write FPageColor;
    property FontColor: TColor read FFontColor write FFontColor;
  end;

  TAppColor = class(TComponent)
  private
    FPrimaryBtn: TBtnColor; //主按钮
    FInfoBtn: TBtnColor;    //信息按钮
    FInfoBtn2: TBtnColor;   //信息按钮 更黑一点
    FWarningBtn: TBtnColor;
    FPrimaryEdt: TEdtColor;
//    FGridPanelColor: TColor;
    FPrimaryColor: TColor;
//    FGridHeadColor: TColor;
//    FGridHeadFontColor: TColor;
    FMainMenuBtn: TBtnColor;
    FMainTileColor: TColor;
    FSuccessBtn: TBtnColor;
    FDataPanel: TPanelColor;
    FMainBKColor: TColor;
    FGrayBKColor: TColor;
    FBottomLineTab: TPageControlColor;
    FTitlePanel: TPanelColor;
    FGridHeadPanel: TPanelColor;
    FPrimaryGridHeadPanel: TPanelColor;
    FGrayGridHeadPanel: TPanelColor;
    FPrimaryGroupBtn: TBtnColor;
    FIsUseColorSkin: Boolean;
    procedure SetPrimaryColor(const Value: TColor);
  protected
   { protected declarations }
  public
    constructor Create();
    destructor Destroy; override;
    procedure UpdateColor;
    class procedure UpdateAppColor(AOwner: TWinControl);
  published
    property BottomLineTab: TPageControlColor read FBottomLineTab write FBottomLineTab;
    property DataPanel: TPanelColor read FDataPanel write FDataPanel;
    property GridHeadPanel: TPanelColor read FGridHeadPanel write FGridHeadPanel;
    property PrimaryGridHeadPanel: TPanelColor read FPrimaryGridHeadPanel write FPrimaryGridHeadPanel;
    property GrayGridHeadPanel: TPanelColor read FGrayGridHeadPanel write FGrayGridHeadPanel;
    property TitlePanel: TPanelColor read FTitlePanel write FTitlePanel;
    property MainMenuBtn: TBtnColor read FMainMenuBtn write FMainMenuBtn;
    property PrimaryBtn: TBtnColor read FPrimaryBtn write FPrimaryBtn;
    property SuccessBtn: TBtnColor read FSuccessBtn write FSuccessBtn;
    property InfoBtn: TBtnColor read FInfoBtn write FInfoBtn;
    property InfoBtn2: TBtnColor read FInfoBtn2 write FInfoBtn2;
    property WarningBtn: TBtnColor read FWarningBtn write FWarningBtn;
    property PrimaryGroupBtn: TBtnColor read FPrimaryGroupBtn write FPrimaryGroupBtn;
    property PrimaryEdt: TEdtColor read FPrimaryEdt write FPrimaryEdt;
//    property GridPanelColor: TColor read FGridPanelColor write FGridPanelColor;
//    property GridHeadColor: TColor read FGridHeadColor write FGridHeadColor;
//    property GridHeadFontColor: TColor read FGridHeadFontColor write FGridHeadFontColor;
    property PrimaryColor: TColor read FPrimaryColor write SetPrimaryColor;
    property MainBKColor: TColor read FMainBKColor write FMainBKColor;
    property GrayBKColor: TColor read FGrayBKColor write FGrayBKColor;
    property MainTileColor: TColor read FMainTileColor write FMainTileColor;
    property IsUseColorSkin: Boolean read FIsUseColorSkin write FIsUseColorSkin;
  end;

var
  iAppColor: TAppColor;

function AppUIColor: TAppColor;

procedure SaveAppColorObj;

procedure LoadAppColorObj;

implementation

uses
  DMUnt, uPublic;

procedure SaveAppColorObj;
var
  vList: TStringList;
begin
  vList := TStringList.Create;
  try
    vList.Text := ComponentToStr(AppColor);
    vList.SaveToFile(ExtractFilePath(ParamStr(0)) + '\data\AppColor.InI');
  finally
    vList.Free;
  end;
end;

procedure LoadAppColorObj;
var
  vList: TStringList;
begin
  vList := TStringList.Create;
  try
    vList.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\data\AppColor.InI');
    StrToComponent(vList.text, AppColor);
    AppColor.UpdateColor;
  finally
    vList.Free;
  end;
end;

function AppUIColor: TAppColor;
begin
  if iAppColor = nil then
    iAppColor := TAppColor.Create;
  Result := iAppColor;
end;
{ TAppColor }

constructor TAppColor.Create;
begin
  IsUseColorSkin := False;
  FMainBKColor := $00FDFDFD;
  FGrayBKColor := $00EFEFEF;
  FMainTileColor := clWhite;
//  GridPanelColor := $00FF9E40;
//  FGridHeadColor := $00F3EDEC;
//  FGridHeadFontColor := $00222222;
  FPrimaryBtn := TBtnColor.Create;
  FSuccessBtn := TBtnColor.Create;
  FInfoBtn := TBtnColor.Create;
  FInfoBtn2 := TBtnColor.Create;
  FWarningBtn := TBtnColor.Create;
  FPrimaryEdt := TEdtColor.Create;
  FMainMenuBtn := TBtnColor.Create;
  FPrimaryGroupBtn := TBtnColor.Create;

  FDataPanel := TPanelColor.Create;
  FTitlePanel := TPanelColor.Create;
  FBottomLineTab := TPageControlColor.Create;
  FGridHeadPanel := TPanelColor.Create;
  FGrayGridHeadPanel := TPanelColor.Create;
  FPrimaryGridHeadPanel := TPanelColor.Create;

  PrimaryColor := $00FF9E40;

  with FSuccessBtn do   //
  begin
    FNormalColor := $003AC267;
    FHotColor := $0061CE85;
    FPressedColor := $0061CE85;
    FFocusedColor := $0061CE85;
    FFrameNormalColor := $003AC267;
    FFrameHotColor := $0061CE85;
    FFramePressedColor := $0061CE85;
    FFrameFocusedColor := $0061CE85;
  end;

  with FInfoBtn do
  begin
    FNormalColor := $00999390;
    FHotColor := $00ADA9A6;
    FPressedColor := $00ADA9A6;
    FFocusedColor := $00ADA9A6;
    FFrameNormalColor := $00999390;
    FFrameHotColor := $00ADA9A6;
    FFramePressedColor := $00ADA9A6;
    FFrameFocusedColor := $00ADA9A6;
  end;

  with FInfoBtn2 do
  begin
    FNormalColor := $00F5F4F4; // $00D5D5D5;
    FHotColor := $00999390;
    FPressedColor := $00999390;
    FFocusedColor := $00999390;
    FFrameNormalColor := $00D6D4D3;
    FFrameHotColor := $00999390;
    FFramePressedColor := $00999390;
    FFrameFocusedColor := $00999390;
  end;

  with FWarningBtn do   //醒目按钮
  begin
    FNormalColor := $000F47FF; // $00D5D5D5;
    FHotColor := $0033ADFF;
    FPressedColor := $0033ADFF;
    FFocusedColor := $0033ADFF;
    FFrameNormalColor := $000F47FF;
    FFrameHotColor := $0033ADFF;
    FFramePressedColor := $0033ADFF;
    FFrameFocusedColor := $0033ADFF;
  end;

  with FPrimaryEdt do
  begin
    FNormalColor := clWhite;
    FHotColor := clWhite;
    FFocusedColor := clWhite;
    FFrameNormalColor := $00FF9E40;
    FFrameHotColor := $00FF9E40;
    FFrameFocusedColor := $00FF9E40;
  end;

  with FMainMenuBtn do
  begin
    FNormalColor := $00D2900E;
    FHotColor := $00D2900E;
    FPressedColor := $008F620A;
    FFocusedColor := $00D2900E;
    FFrameNormalColor := $00D2900E;
    FFrameHotColor := $00D2900E;
    FFramePressedColor := $008080FF;
    FFrameFocusedColor := $00D2900E;
  end;

  with FDataPanel do
  begin
    NormalColor := $00FF9E40;
    NormalColor2 := LighterColor(NormalColor, 65);
    FrameNormalColor := NormalColor;
  end;

  with FBottomLineTab do
  begin
    FFrameActiveColor := PrimaryColor;
    FPageColor := MainBKColor;
    FFontColor := $00292929;
    FTabsBGFillColor := GrayBKColor;
    FFrameNormalColor := GrayBKColor;
    FFrameMouseInColor := DarkerColor(GrayBKColor, 60);

  end;

  with FTitlePanel do
  begin
    NormalColor := FMainBKColor;
    FrameNormalColor := PrimaryColor;
  end;

end;

destructor TAppColor.Destroy;
begin
  FPrimaryBtn.Free;
  FInfoBtn.Free;
  FInfoBtn2.Free;
  FWarningBtn.Free;
  FPrimaryEdt.Free;
  FMainMenuBtn.Free;
  FSuccessBtn.Free;
  FDataPanel.free;
  FBottomLineTab.free;
  FTitlePanel.Free;
  FGridHeadPanel.Free;
  FGrayGridHeadPanel.free;
  FPrimaryGridHeadPanel.free;
  FPrimaryGroupBtn.Free;
  inherited;
end;

procedure TAppColor.SetPrimaryColor(const Value: TColor);
var
  IsLight: Boolean;
begin
  FPrimaryColor := Value;
  IsLight := IsLightColor(Value);
//  GridPanelColor := Value;
//  FGridHeadColor := Value;

  with FMainMenuBtn do
  begin
    FNormalColor := Value;
    FPressedColor := DarkerColor(Value, 30);
    if IsLight then
      FFramePressedColor := DarkerColor(Value, 60)
    else
      FFramePressedColor := LighterColor(Value, 70)
  end;
  if IsLight then
  begin
    FMainTileColor := DarkerColor(clBlack, 80);
//    FGridHeadFontColor := DarkerColor(clBlack, 80);
  end
  else
  begin
    FMainTileColor := clWhite;
//    FGridHeadFontColor := clWhite;
  end;

  with FPrimaryBtn do   //
  begin
    FNormalColor := Value;
    FHotColor := DarkerColor(Value, 20);
    FPressedColor := DarkerColor(Value, 20);
    FFocusedColor := DarkerColor(Value, 20);
    FFrameNormalColor := Value;
    FFrameHotColor := DarkerColor(Value, 20);
    FFramePressedColor := DarkerColor(Value, 20);
    FFrameFocusedColor := DarkerColor(Value, 20);
  end;
  with FPrimaryGroupBtn do   //
  begin
    FNormalColor := $00E6E6E6;
    FHotColor := Value;
    FPressedColor := Value;
    FFocusedColor := DarkerColor(Value, 20);
    FFrameNormalColor := clGray;
    FFrameHotColor := DarkerColor(Value, 20);
    FFramePressedColor := DarkerColor(Value, 20);
    FFrameFocusedColor := DarkerColor(Value, 20);
  end;

  with FPrimaryEdt do
  begin
    FNormalColor := MainBKColor;
    FHotColor := MainBKColor;
    FFocusedColor := MainBKColor;
    FFrameNormalColor := Value;
    FFrameHotColor := Value;
    FFrameFocusedColor := Value;
  end;

  with FDataPanel do
  begin
    NormalColor := Value;
    NormalColor2 := LighterColor(NormalColor, 65);
    FrameNormalColor := NormalColor;
  end;

  with FBottomLineTab do
  begin
    FFrameActiveColor := PrimaryColor;
    FPageColor := MainBKColor;
    FFontColor := $00292929;
    FTabsBGFillColor := GrayBKColor;
    FFrameNormalColor := GrayBKColor;
    FFrameMouseInColor := DarkerColor(GrayBKColor, 60);

  end;
  with FTitlePanel do
  begin
    NormalColor := FMainBKColor;
    FrameNormalColor := PrimaryColor;
    FontColor := PrimaryColor;
  end;

  with FGridHeadPanel do
  begin
    NormalColor := FMainBKColor;
    FrameNormalColor := FMainBKColor;

    FontColor := clBlack;
  end;

  with FGrayGridHeadPanel do
  begin
    NormalColor := $00F3EDEC;
    FrameNormalColor := $00F3EDEC;

    FontColor := $00222222;
  end;
  with FPrimaryGridHeadPanel do
  begin
    if IsLight then
    begin
      NormalColor := Value;
      FrameNormalColor := Value;

      FontColor := DarkerColor(clBlack, 50);
    end
    else
    begin
      NormalColor := LighterColor(Value, 20);
      FrameNormalColor := LighterColor(Value, 20);
      FontColor := DarkerColor(clWhite, 2);
    end;

  end;

end;

class procedure TAppColor.UpdateAppColor(AOwner: TWinControl);
var
  i, j: Integer;
  vbtn: TscGPButton;
  vBtnColor: TBtnColor;
begin
 if AppColor.IsUseColorSkin = False then
    Exit;

  with AppColor do
  begin

    for i := 0 to AOwner.ComponentCount - 1 do
    begin

      if AOwner.Components[i] is TscGPCharGlyphButton then
      begin

        with AOwner.Components[i] as TscGPCharGlyphButton do
        begin
          if HelpKeyword <> 'NoSkin' then
          begin
            if HelpKeyword.Equals('PrimaryBtn') then    //主要按钮
            begin
              with PrimaryBtn do
              begin
                Options.NormalColor := NormalColor;
                Options.FocusedColor := NormalColor;
                Options.HotColor := HotColor;
                Options.PressedColor := PressedColor;
                Options.FocusedColor := FocusedColor;
                Options.FrameNormalColor := FrameNormalColor;
                Options.FrameHotColor := FrameHotColor;
                Options.FramePressedColor := FramePressedColor;
                Options.FrameFocusedColor := FrameFocusedColor;
                GlyphOptions.NormalColor := NormalColor;
                GlyphOptions.HotColor := HotColor;
                GlyphOptions.PressedColor := PressedColor;
                GlyphOptions.FocusedColor := FocusedColor;
              end;

            end
            else if HelpKeyword.Equals('SuccessBtn') then   //按钮
            begin
              with SuccessBtn do
              begin
                Options.NormalColor := NormalColor;
                Options.HotColor := HotColor;
                Options.PressedColor := PressedColor;
                Options.FocusedColor := FocusedColor;
                Options.FrameNormalColor := FrameNormalColor;
                Options.FrameHotColor := FrameHotColor;
                Options.FramePressedColor := FramePressedColor;
                Options.FrameFocusedColor := FrameFocusedColor;
              end;

            end
            else if HelpKeyword.Equals('WarningBtn') then   //警示按钮
            begin
              with WarningBtn do
              begin
                Options.NormalColor := NormalColor;
                Options.HotColor := HotColor;
                Options.PressedColor := PressedColor;
                Options.FocusedColor := FocusedColor;
                Options.FrameNormalColor := FrameNormalColor;
                Options.FrameHotColor := FrameHotColor;
                Options.FramePressedColor := FramePressedColor;
                Options.FrameFocusedColor := FrameFocusedColor;
              end;

            end
            else if HelpKeyword.Equals('InfoBtn') then   //信息按钮
            begin
              with InfoBtn do
              begin
                Options.NormalColor := NormalColor;
                Options.PressedColor := PressedColor;
                Options.HotColor := HotColor;
              end;
            end
            else if HelpKeyword.Equals('InfoBtn2') then   //信息按钮 朴素
            begin
              with InfoBtn2 do
              begin
                Options.NormalColor := NormalColor;
                Options.HotColor := HotColor;
                Options.PressedColor := PressedColor;
                Options.FocusedColor := FocusedColor;
                Options.FrameNormalColor := FrameNormalColor;
                Options.FrameHotColor := FrameHotColor;
                Options.FramePressedColor := FramePressedColor;
                Options.FrameFocusedColor := FrameFocusedColor;
              end;

            end;

          end;
        end;

      end
      else
      //TscGPButton
if AOwner.Components[i] is TscGPButton then
      begin
        vbtn := AOwner.Components[i] as TscGPButton;
        with vbtn do
        begin
          if HelpKeyword <> 'NoSkin' then
          begin
            if HelpKeyword.Equals('PrimaryBtn') then    //主要按钮
            begin
              with PrimaryBtn do
              begin
                Options.NormalColor := NormalColor;
                Options.HotColor := HotColor;
                Options.PressedColor := PressedColor;
                Options.FocusedColor := FocusedColor;
                Options.FrameNormalColor := FrameNormalColor;
                Options.FrameHotColor := FrameHotColor;
                Options.FramePressedColor := FramePressedColor;
                Options.FrameFocusedColor := FrameFocusedColor;
              end;

            end
            else if HelpKeyword.Equals('PrimaryGroupBtn') then    //主要按钮
            begin
              with PrimaryGroupBtn do
              begin
                Options.NormalColor := NormalColor;
                Options.HotColor := HotColor;
                Options.PressedColor := PressedColor;
                Options.FocusedColor := FocusedColor;
                Options.FrameNormalColor := FrameNormalColor;
                Options.FrameHotColor := FrameHotColor;
                Options.FramePressedColor := FramePressedColor;
                Options.FrameFocusedColor := FrameFocusedColor;
              end;

            end
            else if HelpKeyword.Equals('SuccessBtn') then   //按钮
            begin
              with SuccessBtn do
              begin
                Options.NormalColor := NormalColor;
                Options.HotColor := HotColor;
                Options.PressedColor := PressedColor;
                Options.FocusedColor := FocusedColor;
                Options.FrameNormalColor := FrameNormalColor;
                Options.FrameHotColor := FrameHotColor;
                Options.FramePressedColor := FramePressedColor;
                Options.FrameFocusedColor := FrameFocusedColor;
              end;

            end
            else if HelpKeyword.Equals('WarningBtn') then   //警示按钮
            begin
              with WarningBtn do
              begin
                Options.NormalColor := NormalColor;
                Options.HotColor := HotColor;
                Options.PressedColor := PressedColor;
                Options.FocusedColor := FocusedColor;
                Options.FrameNormalColor := FrameNormalColor;
                Options.FrameHotColor := FrameHotColor;
                Options.FramePressedColor := FramePressedColor;
                Options.FrameFocusedColor := FrameFocusedColor;
              end;

            end
            else if HelpKeyword.Equals('InfoBtn') then   //信息按钮
            begin
              with InfoBtn do
              begin
                Options.NormalColor := NormalColor;
                Options.PressedColor := PressedColor;
                Options.HotColor := HotColor;
              end;
            end
            else if HelpKeyword.Equals('InfoBtn2') then   //信息按钮 朴素
            begin
              with InfoBtn2 do
              begin
                Options.NormalColor := NormalColor;
                Options.HotColor := HotColor;
                Options.PressedColor := PressedColor;
                Options.FocusedColor := FocusedColor;
                Options.FrameNormalColor := FrameNormalColor;
                Options.FrameHotColor := FrameHotColor;
                Options.FramePressedColor := FramePressedColor;
                Options.FrameFocusedColor := FrameFocusedColor;
              end;

            end
            else if HelpKeyword.Equals('OnlyCaption') then   //OnlyCaption
            begin
              Options.FontNormalColor := AppColor.PrimaryColor;
            end

          end;
        end;
      end  //TscGPToggleSwitch
      else if AOwner.Components[i] is TscGPToggleSwitch then
      begin
        with AOwner.Components[i] as TscGPToggleSwitch do
        begin
          if HelpKeyword <> 'NoSkin' then
          begin
            vBtnColor := nil;
            if HelpKeyword.Equals('PrimaryBtn') then    //主要按钮
              vBtnColor := PrimaryBtn
            else if HelpKeyword.Equals('SuccessBtn') then   //就绪按钮
              vBtnColor := SuccessBtn
            else if HelpKeyword.Equals('WarningBtn') then   //警示按钮
              vBtnColor := WarningBtn
            else if HelpKeyword.Equals('InfoBtn') then   //信息按钮
              vBtnColor := InfoBtn
            else if HelpKeyword.Equals('InfoBtn2') then   //信息按钮 朴素
              vBtnColor := InfoBtn2;
            if vBtnColor <> nil then
              FrameOnColor := vBtnColor.NormalColor;
          end;
        end;

      end
      else if AOwner.Components[i] is TscGPCheckBox then
      begin
        with AOwner.Components[i] as TscGPCheckBox do
        begin
          if HelpKeyword <> 'NoSkin' then
          begin
            vBtnColor := nil;
            if HelpKeyword.Equals('PrimaryBtn') then    //主要按钮
              vBtnColor := PrimaryBtn
            else if HelpKeyword.Equals('SuccessBtn') then   //就绪按钮
              vBtnColor := SuccessBtn
            else if HelpKeyword.Equals('WarningBtn') then   //警示按钮
              vBtnColor := WarningBtn
            else if HelpKeyword.Equals('InfoBtn') then   //信息按钮
              vBtnColor := InfoBtn
            else if HelpKeyword.Equals('InfoBtn2') then   //信息按钮 朴素
              vBtnColor := InfoBtn2;
            if vBtnColor <> nil then
            begin
              Options.FrameNormalColor := vBtnColor.NormalColor;
              Options.FrameHotColor := vBtnColor.NormalColor;
              Options.FramePressedColor := vBtnColor.NormalColor;

              OptionsChecked.FrameNormalColor := vBtnColor.NormalColor;
              OptionsChecked.FrameHotColor := vBtnColor.NormalColor;
              OptionsChecked.FramePressedColor := vBtnColor.NormalColor;
              OptionsChecked.NormalColor := vBtnColor.NormalColor;
              OptionsChecked.HotColor := vBtnColor.NormalColor;
              OptionsChecked.PressedColor := vBtnColor.NormalColor;
            end;

          end;
        end;

      end

      else if AOwner.Components[i] is TscGPEdit then  //TscGPEdit
      begin

        with AOwner.Components[i] as TscGPEdit do
        begin
          if HelpKeyword <> 'NoSkin' then
          begin
            if HelpKeyword.Equals('PrimaryEdt') then    //主要
            begin
              with PrimaryEdt do
              begin
                Options.NormalColor := NormalColor;
                Options.HotColor := HotColor;
                Options.FocusedColor := FocusedColor;
                Options.FrameNormalColor := FrameNormalColor;
                Options.FrameHotColor := FrameHotColor;
                Options.FrameFocusedColor := FrameFocusedColor;
                LeftButton.GlyphColor := FrameNormalColor;
                RightButton.GlyphColor := FrameNormalColor;
              end;

            end;

          end;
        end;

      end
      else if AOwner.Components[i] is TscGPDateEdit then  //TscGPDateEdit
      begin

        with AOwner.Components[i] as TscGPDateEdit do
        begin
          if HelpKeyword <> 'NoSkin' then
          begin
            if HelpKeyword.Equals('PrimaryEdt') then    //主要
            begin
              with PrimaryEdt do
              begin
                Options.NormalColor := NormalColor;
                Options.HotColor := HotColor;
                Options.FocusedColor := FocusedColor;
                Options.FrameNormalColor := FrameNormalColor;
                Options.FrameHotColor := FrameHotColor;
                Options.FrameFocusedColor := FrameFocusedColor;
                LeftButton.GlyphColor := FrameNormalColor;
                RightButton.GlyphColor := FrameNormalColor;
              end;

            end;

          end;
        end;

      end


      else if AOwner.Components[i] is TscGPPasswordEdit then  //TscGPPasswordEdit
      begin

        with AOwner.Components[i] as TscGPPasswordEdit do
        begin
          if HelpKeyword <> 'NoSkin' then
          begin
            if HelpKeyword.Equals('PrimaryEdt') then    //主要
            begin
              with PrimaryEdt do
              begin
                Options.NormalColor := NormalColor;
                Options.HotColor := HotColor;
                Options.FocusedColor := FocusedColor;
                Options.FrameNormalColor := FrameNormalColor;
                Options.FrameHotColor := FrameHotColor;
                Options.FrameFocusedColor := FrameFocusedColor;

              end;

            end;

          end;
        end;

      end
      else if AOwner.Components[i] is TscGPComboBox then  //TscGPComboBox
      begin
        with AOwner.Components[i] as TscGPComboBox do
        begin
          if HelpKeyword <> 'NoSkin' then
          begin
            if HelpKeyword.Equals('PrimaryEdt') then    //主要
            begin
              with PrimaryEdt do
              begin
                Options.NormalColor := NormalColor;
                Options.HotColor := HotColor;
                Options.FocusedColor := FocusedColor;
                Options.FrameNormalColor := FrameNormalColor;
                Options.FrameHotColor := FrameHotColor;
                Options.FrameFocusedColor := FrameFocusedColor;

              end;

            end;

          end;
        end;

      end
      else if AOwner.Components[i] is TscGPDateEdit then  //TscGPDateEdit
      begin
        with AOwner.Components[i] as TscGPDateEdit do
        begin
          if HelpKeyword <> 'NoSkin' then
          begin
            if HelpKeyword.Equals('PrimaryEdt') then    //主要
            begin
              with PrimaryEdt do
              begin
                Options.NormalColor := NormalColor;
                Options.HotColor := HotColor;
                Options.FocusedColor := FocusedColor;
                Options.FrameNormalColor := FrameNormalColor;
                Options.FrameHotColor := FrameHotColor;
                Options.FrameFocusedColor := FrameFocusedColor;

              end;

            end;

          end;
        end;

      end

      else if AOwner.Components[i] is TscGPSpinEdit then  //TscGPSpinEdit
      begin
        with AOwner.Components[i] as TscGPSpinEdit do
        begin
          if HelpKeyword <> 'NoSkin' then
          begin
            if HelpKeyword.Equals('PrimaryEdt') then    //主要
            begin
              with PrimaryEdt do
              begin
                Options.NormalColor := NormalColor;
                Options.HotColor := HotColor;
                Options.FocusedColor := FocusedColor;
                Options.FrameNormalColor := FrameNormalColor;
                Options.FrameHotColor := FrameHotColor;
                Options.FrameFocusedColor := FrameFocusedColor;

              end;

            end;

          end;
        end;

      end      //TscGridPanel
      else if AOwner.Components[i] is TscGridPanel then
      begin
        with AOwner.Components[i] as TscGridPanel do
        begin
          if HelpKeyword = 'NoSkin' then
            exit;
          if HelpKeyword.Equals('GridHead') then    //主要
          begin
            Color := GridHeadPanel.NormalColor;
          end
          else if HelpKeyword.Equals('GrayGridHeadPanel') then    //主要
          begin
            Color := GrayGridHeadPanel.NormalColor;
          end
          else if HelpKeyword.Equals('PrimaryGridHeadPanel') then    //主要
          begin
            Font.Color := PrimaryGridHeadPanel.FontColor;
            Color := PrimaryGridHeadPanel.NormalColor;
          end;
          Update;
          Repaint;
        end;

      end
      else if AOwner.Components[i] is TscGPPanel then
      begin
        with AOwner.Components[i] as TscGPPanel do
        begin
          if HelpKeyword = 'NoSkin' then
            exit;
          if HelpKeyword.Equals('DataPanel') then
          begin
            FillColor := DataPanel.NormalColor;
            FillColor2 := DataPanel.NormalColor2;
            FrameColor := DataPanel.FrameNormalColor;
          end
          else if HelpKeyword.Equals('TitlePanel') then
          begin
            FillColor := TitlePanel.NormalColor;
            FillColor2 := TitlePanel.NormalColor2;
            FrameColor := TitlePanel.FrameNormalColor;
          end else if HelpKeyword.Equals('PrimaryPanel') then
          begin
            FillColor := PrimaryColor;
            FillColor2 := PrimaryColor;
            FrameColor := PrimaryColor;
          end;



        end;

      end  //TscGPLabel
      else if AOwner.Components[i] is TscGPLabel then
      begin
        with AOwner.Components[i] as TscGPLabel do
        begin
          if HelpKeyword = 'NoSkin' then
            exit;
          if HelpKeyword.Equals('GridHead') then
          begin
            FillColor := GridHeadPanel.NormalColor;
            Font.Color := GridHeadPanel.FontColor;
          end
          else if HelpKeyword.Equals('GrayGridHeadPanel') then    //主要
          begin
            Font.Color := GrayGridHeadPanel.FontColor;
            FillColor := GrayGridHeadPanel.NormalColor;
            FrameColor := GrayGridHeadPanel.NormalColor;
          end
          else if HelpKeyword.Equals('PrimaryGridHeadPanel') then    //主要
          begin
            Font.Color := PrimaryGridHeadPanel.FontColor;
            FillColor := PrimaryGridHeadPanel.NormalColor;
            FrameColor := PrimaryGridHeadPanel.NormalColor;
          end
          else if HelpKeyword.Equals('TitlePanel') then    //主要
          begin
            Font.Color := TitlePanel.FontColor;
            FillColor := TitlePanel.NormalColor;
            FrameColor := TitlePanel.NormalColor;
          end

        end;

      end  //TscGPPageControl
      else if AOwner.Components[i] is TscGPPageControl then
      begin
        with AOwner.Components[i] as TscGPPageControl do
        begin
          if HelpKeyword = 'NoSkin' then
            exit;
          if HelpKeyword.Equals('BottomLineTab') then
          begin
            TabsBGFillColor := BottomLineTab.TabsBGFillColor;
            TabOptions.FontNormalColor := BottomLineTab.FontColor;
            TabOptions.FontActiveColor := BottomLineTab.FontColor;
            TabOptions.FontFocusedColor := BottomLineTab.FontColor;
            TabOptions.FontMouseInColor := BottomLineTab.FontColor;
            TabOptions.FrameActiveColor := BottomLineTab.FrameActiveColor;
            TabOptions.FrameFocusedColor := BottomLineTab.FrameActiveColor;
            TabOptions.FrameMouseInColor := BottomLineTab.FrameMouseInColor;
            TabOptions.FrameNormalColor := BottomLineTab.FrameNormalColor;
            for j := 0 to Tabs.Count - 1 do
              Tabs.Items[j].Page.Color := BottomLineTab.PageColor;
          end;

        end;

      end;

    end;

  end;

end;

procedure TAppColor.UpdateColor;
var
  vMsg: TUpdateAppColorMsg;
  i: Integer;
begin
  if IsUseColorSkin=False then  exit;

  vMsg := TUpdateAppColorMsg.Create;
  GlobalVMsgMonitor.PostVMsg(vMsg);
  dm.CaiGouDSelectStyle.Color := LighterColor(AppColor.PrimaryColor, 65);
  Dm.Style_Select_35px.Color := LighterColor(AppColor.PrimaryColor, 65);
  Dm.SelectStyle.Color := LighterColor(AppColor.PrimaryColor, 65);
end;

{ TBtnColor }
constructor TBtnColor.Create;
begin

end;

{ TEdtColor }

constructor TEdtColor.Create;
begin

end;

{ TPanelColor }

constructor TPanelColor.Create;
begin

end;

{ TPageControlColor }

constructor TPageControlColor.Create;
begin

end;

initialization
  RegisterClass(TAppColor);
  RegisterClass(TPanelColor);
  RegisterClass(TPageControlColor);
  RegisterClass(TEdtColor);
  RegisterClass(TBtnColor);

end.

