// -----------------------------------------------------------------------------
// Copyright (c) Kuro. All rights reserved.
// Licensed under the MIT License.
// -----------------------------------------------------------------------------

unit mProp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, mMain, mPerMonitorDpi;

type
  TCenterForm = class(TScaledForm)
  private
    { Private éŒ¾ }
  protected
    { Protected éŒ¾ }
    procedure CreateParams(var Params: TCreateParams); override;
    procedure DoShow; override;
  public
    { Public éŒ¾ }
    constructor Create(AOwner: TComponent); override;
  end;

  TPropForm = class(TCenterForm)
    BarPosLabel: TLabel;
    BarPosComboBox: TComboBox;
    AltGoToNodeCheckBox: TCheckBox;
    ModeLabel: TLabel;
    ModeComboBox: TComboBox;
    IndentTypeLabel: TLabel;
    IndentTypeComboBox: TComboBox;
    ViewLevelLabel: TLabel;
    ViewLevelComboBox: TComboBox;
    DefaultLevelLabel: TLabel;
    DefaultLevelComboBox: TComboBox;
    LevelLabel: TLabel;
    MatchLabel: TLabel;
    RegExLabel: TLabel;
    ReplaceLabel: TLabel;
    LevelLabel1: TLabel;
    MatchEdit1: TEdit;
    RegExCheckBox1: TCheckBox;
    ReplaceEdit1: TEdit;
    LevelLabel2: TLabel;
    MatchEdit2: TEdit;
    RegExCheckBox2: TCheckBox;
    ReplaceEdit2: TEdit;
    LevelLabel3: TLabel;
    MatchEdit3: TEdit;
    RegExCheckBox3: TCheckBox;
    ReplaceEdit3: TEdit;
    LevelLabel4: TLabel;
    MatchEdit4: TEdit;
    RegExCheckBox4: TCheckBox;
    ReplaceEdit4: TEdit;
    LevelLabel5: TLabel;
    MatchEdit5: TEdit;
    ReplaceEdit5: TEdit;
    RegExCheckBox5: TCheckBox;
    LevelLabel6: TLabel;
    MatchEdit6: TEdit;
    RegExCheckBox6: TCheckBox;
    ReplaceEdit6: TEdit;
    LevelLabel7: TLabel;
    MatchEdit7: TEdit;
    RegExCheckBox7: TCheckBox;
    ReplaceEdit7: TEdit;
    LevelLabel8: TLabel;
    MatchEdit8: TEdit;
    RegExCheckBox8: TCheckBox;
    ReplaceEdit8: TEdit;
    CommentsCheckBox: TCheckBox;
    Bevel1: TBevel;
    ResetButton: TButton;
    Bevel2: TBevel;
    OKButton: TButton;
    CancelButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ModeComboBoxChange(Sender: TObject);
    procedure IndentTypeComboBoxChange(Sender: TObject);
    procedure ResetButtonClick(Sender: TObject);
  private
    { Private éŒ¾ }
    FMode: Integer;
    FItems: TPropItems;
    procedure UpdateData(AProp: TProp);
  public
    { Public éŒ¾ }
  end;

function Prop(AOwner: TComponent; var APos: Integer; var AAltGoToNode: Boolean;
  AProps: TPropItems; AProp: TProp): Boolean;

var
  PropForm: TPropForm;

implementation

{$R *.dfm}


uses
  System.Math, Winapi.MultiMon, mCommon;

function Prop(AOwner: TComponent; var APos: Integer; var AAltGoToNode: Boolean;
  AProps: TPropItems; AProp: TProp): Boolean;
var
  Item: TPropItem;
begin
  with TPropForm.Create(AOwner) do
    try
      FItems.Assign(AProps);
      BarPosComboBox.ItemIndex := APos;
      AltGoToNodeCheckBox.Checked := AAltGoToNode;
      with ModeComboBox do
      begin
        for Item in FItems do
          AddItem(Item.Prop.Caption, TObject(Item.ID));
        ItemIndex := Items.IndexOf(AProp.Caption);
      end;
      Result := ShowModal = mrOk;
      if Result then
      begin
        with ModeComboBox do
          if ItemIndex >= 0 then
            UpdateData((FItems.FindItemID(Integer(Items.Objects[ItemIndex])) as TPropItem).Prop);
        APos := BarPosComboBox.ItemIndex;
        AAltGoToNode := AltGoToNodeCheckBox.Checked;
        AProps.Assign(FItems);
      end;
    finally
      Release;
    end;
end;

{ TCenterForm }

constructor TCenterForm.Create(AOwner: TComponent);
var
  AppMon, WinMon: HMONITOR;
  I, J: Integer;
  LLeft, LTop: Integer;
begin
  inherited;
  AppMon := Screen.MonitorFromWindow(GetParent(Handle), mdNearest).Handle;
  WinMon := Monitor.Handle;
  for I := 0 to Screen.MonitorCount - 1 do
    if Screen.Monitors[I].Handle = AppMon then
      if AppMon <> WinMon then
        for J := 0 to Screen.MonitorCount - 1 do
          if Screen.Monitors[J].Handle = WinMon then
          begin
            LLeft := Screen.Monitors[I].Left + Left - Screen.Monitors[J].Left;
            if LLeft + Width > Screen.Monitors[I].Left + Screen.Monitors[I].Width then
              LLeft := Screen.Monitors[I].Left + Screen.Monitors[I].Width - Width;
            LTop := Screen.Monitors[I].Top + Top - Screen.Monitors[J].Top;
            if LTop + Height > Screen.Monitors[I].Top + Screen.Monitors[I].Height then
              LTop := Screen.Monitors[I].Top + Screen.Monitors[I].Height - Height;
            SetBounds(LLeft, LTop, Width, Height);
          end;
end;

procedure TCenterForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WndParent := TWinControl(Owner).Handle;
end;

procedure TCenterForm.DoShow;
var
  H: THandle;
  R1, R2, LRect: TRect;
  X, Y: Integer;
begin
  inherited;
  H := GetParent(Handle);
  if (H = 0) or IsIconic(H) then
    H := GetDesktopWindow;
  if GetWindowRect(H, R1) and GetWindowRect(Handle, R2) then
  begin
    X := R1.Left + (((R1.Right - R1.Left) - (R2.Right - R2.Left)) div 2);
    Y := R1.Top + (((R1.Bottom - R1.Top) - (R2.Bottom - R2.Top)) div 2);
    with R2 do
    begin
      LRect := Monitor.WorkareaRect;
      if X + Width > LRect.Right then
        X := LRect.Right - Width;
      if Y + Height > LRect.Bottom then
        Y := LRect.Bottom - Height;
      if X < LRect.Left then
        X := LRect.Left;
      if Y < LRect.Top then
        Y := LRect.Top;
      if Width > LRect.Width then
      begin
        HorzScrollBar.Tracking := True;
        VertScrollBar.Tracking := True;
        Width := LRect.Width;
        AutoScroll := True;
      end;
      if Height > LRect.Height then
      begin
        HorzScrollBar.Tracking := True;
        VertScrollBar.Tracking := True;
        Height := LRect.Height;
        AutoScroll := True;
      end;
      if AutoScroll then
        SetWindowPos(Handle, 0, X, Y, Width, Height, SWP_NOZORDER or SWP_NOACTIVATE)
      else
        SetWindowPos(Handle, 0, X, Y, 0, 0, SWP_NOSIZE or SWP_NOZORDER or SWP_NOACTIVATE);
    end;
  end;
end;

{ TPropForm }

procedure TPropForm.FormCreate(Sender: TObject);
begin
  FMode := -1;
  FItems := TPropItems.Create;
end;

procedure TPropForm.FormDestroy(Sender: TObject);
begin
  if Assigned(FItems) then
    FreeAndNil(FItems);
end;

procedure TPropForm.FormShow(Sender: TObject);
begin
  ModeComboBoxChange(nil);
  IndentTypeComboBoxChange(nil);
end;

procedure TPropForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //
end;

procedure TPropForm.ModeComboBoxChange(Sender: TObject);
begin
  with ModeComboBox do
  begin
    if ItemIndex >= 0 then
    begin
      if (FMode >= 0) and (FMode <> ItemIndex) then
        UpdateData((FItems.FindItemID(Integer(Items.Objects[FMode])) as TPropItem).Prop);
      with (FItems.FindItemID(Integer(Items.Objects[ItemIndex])) as TPropItem).Prop do
      begin
        IndentTypeComboBox.ItemIndex := IndentType;
        ViewLevelComboBox.ItemIndex := Pred(ViewLevel);
        DefaultLevelComboBox.ItemIndex := Integer(DefaultLevel);
        CommentsCheckBox.Checked := Comments;
        MatchEdit1.Text := Match[0];
        RegExCheckBox1.Checked := RegEx[0];
        ReplaceEdit1.Text := Replace[0];
        MatchEdit2.Text := Match[1];
        RegExCheckBox2.Checked := RegEx[1];
        ReplaceEdit2.Text := Replace[1];
        MatchEdit3.Text := Match[2];
        RegExCheckBox3.Checked := RegEx[2];
        ReplaceEdit3.Text := Replace[2];
        MatchEdit4.Text := Match[3];
        RegExCheckBox4.Checked := RegEx[3];
        ReplaceEdit4.Text := Replace[3];
        MatchEdit5.Text := Match[4];
        RegExCheckBox5.Checked := RegEx[4];
        ReplaceEdit5.Text := Replace[4];
        MatchEdit6.Text := Match[5];
        RegExCheckBox6.Checked := RegEx[5];
        ReplaceEdit6.Text := Replace[5];
        MatchEdit7.Text := Match[6];
        RegExCheckBox7.Checked := RegEx[6];
        ReplaceEdit7.Text := Replace[6];
        MatchEdit8.Text := Match[7];
        RegExCheckBox8.Checked := RegEx[7];
        ReplaceEdit8.Text := Replace[7];
      end;
      FMode := ItemIndex;
    end;
  end;
  IndentTypeComboBoxChange(nil);
end;

procedure TPropForm.IndentTypeComboBoxChange(Sender: TObject);
begin
  MatchEdit1.Enabled := (IndentTypeComboBox.ItemIndex = IndentCustom) or (IndentTypeComboBox.ItemIndex = IndentCustomBeginEnd);
  LevelLabel.Enabled := MatchEdit1.Enabled;
  MatchLabel.Enabled := MatchEdit1.Enabled;
  RegExLabel.Enabled := MatchEdit1.Enabled;
  ReplaceLabel.Enabled := MatchEdit1.Enabled;
  LevelLabel1.Enabled := MatchEdit1.Enabled;
  MatchEdit2.Enabled := (IndentTypeComboBox.ItemIndex = IndentCustom) or (IndentTypeComboBox.ItemIndex = IndentCustomBeginEnd);
  LevelLabel2.Enabled := MatchEdit2.Enabled;
  MatchEdit3.Enabled := IndentTypeComboBox.ItemIndex = IndentCustom;
  LevelLabel3.Enabled := MatchEdit3.Enabled;
  MatchEdit4.Enabled := IndentTypeComboBox.ItemIndex = IndentCustom;
  LevelLabel4.Enabled := MatchEdit4.Enabled;
  MatchEdit5.Enabled := IndentTypeComboBox.ItemIndex = IndentCustom;
  LevelLabel5.Enabled := MatchEdit5.Enabled;
  MatchEdit6.Enabled := IndentTypeComboBox.ItemIndex = IndentCustom;
  LevelLabel6.Enabled := MatchEdit6.Enabled;
  MatchEdit7.Enabled := IndentTypeComboBox.ItemIndex = IndentCustom;
  LevelLabel7.Enabled := MatchEdit7.Enabled;
  MatchEdit8.Enabled := IndentTypeComboBox.ItemIndex = IndentCustom;
  LevelLabel8.Enabled := MatchEdit8.Enabled;
  RegExCheckBox1.Enabled := (IndentTypeComboBox.ItemIndex = IndentCustom) or (IndentTypeComboBox.ItemIndex = IndentCustomBeginEnd);
  RegExCheckBox2.Enabled := (IndentTypeComboBox.ItemIndex = IndentCustom) or (IndentTypeComboBox.ItemIndex = IndentCustomBeginEnd);
  RegExCheckBox3.Enabled := IndentTypeComboBox.ItemIndex = IndentCustom;
  RegExCheckBox4.Enabled := IndentTypeComboBox.ItemIndex = IndentCustom;
  RegExCheckBox5.Enabled := IndentTypeComboBox.ItemIndex = IndentCustom;
  RegExCheckBox6.Enabled := IndentTypeComboBox.ItemIndex = IndentCustom;
  RegExCheckBox7.Enabled := IndentTypeComboBox.ItemIndex = IndentCustom;
  RegExCheckBox8.Enabled := IndentTypeComboBox.ItemIndex = IndentCustom;
  ReplaceEdit1.Enabled := IndentTypeComboBox.ItemIndex = IndentCustom;
  ReplaceEdit2.Enabled := IndentTypeComboBox.ItemIndex = IndentCustom;
  ReplaceEdit3.Enabled := IndentTypeComboBox.ItemIndex = IndentCustom;
  ReplaceEdit4.Enabled := IndentTypeComboBox.ItemIndex = IndentCustom;
  ReplaceEdit5.Enabled := IndentTypeComboBox.ItemIndex = IndentCustom;
  ReplaceEdit6.Enabled := IndentTypeComboBox.ItemIndex = IndentCustom;
  ReplaceEdit7.Enabled := IndentTypeComboBox.ItemIndex = IndentCustom;
  ReplaceEdit8.Enabled := IndentTypeComboBox.ItemIndex = IndentCustom;
end;

procedure TPropForm.ResetButtonClick(Sender: TObject);
begin
  with ModeComboBox do
  begin
    if ItemIndex >= 0 then
      (FItems.FindItemID(Integer(Items.Objects[ItemIndex])) as TPropItem).Prop.Reset;
  end;
  ModeComboBoxChange(nil);
  IndentTypeComboBoxChange(nil);
end;

procedure TPropForm.UpdateData(AProp: TProp);
begin
  with AProp do
  begin
    IndentType := IndentTypeComboBox.ItemIndex;
    ViewLevel := Succ(ViewLevelComboBox.ItemIndex);
    DefaultLevel := TDefaultLevel(DefaultLevelComboBox.ItemIndex);
    Comments := CommentsCheckBox.Checked;
    Match[0] := MatchEdit1.Text;
    RegEx[0] := RegExCheckBox1.Checked;
    Replace[0] := ReplaceEdit1.Text;
    Match[1] := MatchEdit2.Text;
    RegEx[1] := RegExCheckBox2.Checked;
    Replace[1] := ReplaceEdit2.Text;
    Match[2] := MatchEdit3.Text;
    RegEx[2] := RegExCheckBox3.Checked;
    Replace[2] := ReplaceEdit3.Text;
    Match[3] := MatchEdit4.Text;
    RegEx[3] := RegExCheckBox4.Checked;
    Replace[3] := ReplaceEdit4.Text;
    Match[4] := MatchEdit5.Text;
    RegEx[4] := RegExCheckBox5.Checked;
    Replace[4] := ReplaceEdit5.Text;
    Match[5] := MatchEdit6.Text;
    RegEx[5] := RegExCheckBox6.Checked;
    Replace[5] := ReplaceEdit6.Text;
    Match[6] := MatchEdit7.Text;
    RegEx[6] := RegExCheckBox7.Checked;
    Replace[6] := ReplaceEdit7.Text;
    Match[7] := MatchEdit8.Text;
    RegEx[7] := RegExCheckBox8.Checked;
    Replace[7] := ReplaceEdit8.Text;
  end;
end;

end.
