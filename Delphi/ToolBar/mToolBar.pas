// -----------------------------------------------------------------------------
// Copyright (c) Kuro. All rights reserved.
// Licensed under the MIT License.
// -----------------------------------------------------------------------------

unit mToolBar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, Vcl.Forms, mCommon, mMain,
  mFrame, mPlugin;

resourcestring
  SName = 'ツール バーを使用したサンプル';
  SVersion = '1.0.0';

resourcestring
  STitle = 'サンプル';
  SInvalidVersion = 'Mery Ver 2.8.3 以上が必要です。';

type
  TToolBarFrame = class(TFrame)
  private
    { Private 宣言 }
    FForm: TMainForm;
    FClientID: Cardinal;
    FOpenStartup: Boolean;
    FIndex: Integer;
    FBreak: Boolean;
    FWidth: Integer;
    FVisible: Boolean;
    procedure ReadIni;
    procedure WriteIni;
    procedure WriteOpenStartup;
    function QueryProperties: Boolean;
    function SetProperties: Boolean;
    function PreTranslateMessage(hwnd: HWND; var Msg: tagMSG): Boolean;
    procedure DisplayBar(AVisible: Boolean);
    function IsVisible: Boolean;
    procedure CustomBarClosed;
  protected
    { Protected 宣言 }
  public
    { Public 宣言 }
    procedure OnIdle;
    procedure OnCommand(hwnd: HWND); override;
    function QueryStatus(hwnd: HWND; pbChecked: PBOOL): BOOL; override;
    procedure OnEvents(hwnd: HWND; nEvent: Cardinal; lParam: LPARAM); override;
    function PluginProc(hwnd: HWND; nMsg: Cardinal; wParam: WPARAM; lParam: LPARAM): LRESULT; override;
  end;

implementation

uses
  System.IniFiles;

{ TToolBarFrame }

procedure TToolBarFrame.ReadIni;
var
  S: string;
begin
  if not GetIniFileName(S) then
    Exit;
  with TMemIniFile.Create(S, TEncoding.UTF8) do
    try
      FOpenStartup := ReadBool('ToolBar', 'OpenStartup', False);
      FIndex := ReadInteger('ToolBar', 'Index', -1);
      FBreak := ReadBool('ToolBar', 'Break', False);
      FWidth := ReadInteger('ToolBar', 'Width', -1);
    finally
      Free;
    end;
end;

procedure TToolBarFrame.WriteIni;
var
  S: string;
begin
  if FIniFailed or (not GetIniFileName(S)) then
    Exit;
  try
    with TMemIniFile.Create(S, TEncoding.UTF8) do
      try
        WriteInteger('ToolBar', 'Index', FIndex);
        WriteBool('ToolBar', 'Break', FBreak);
        WriteInteger('ToolBar', 'Width', FWidth);
        UpdateFile;
      finally
        Free;
      end;
  except
    FIniFailed := True;
  end;
end;

procedure TToolBarFrame.WriteOpenStartup;
var
  S: string;
begin
  if FIniFailed or (not GetIniFileName(S)) then
    Exit;
  try
    with TMemIniFile.Create(S, TEncoding.UTF8) do
      try
        WriteBool('ToolBar', 'OpenStartup', FOpenStartup);
        UpdateFile;
      finally
        Free;
      end;
  except
    FIniFailed := True;
  end;
end;

function TToolBarFrame.QueryProperties: Boolean;
begin
  Result := True;
end;

function TToolBarFrame.SetProperties: Boolean;
begin
  Result := False;
end;

function TToolBarFrame.PreTranslateMessage(hwnd: HWND; var Msg: tagMSG): Boolean;
var
  LFocus: THandle;
  LCtrl, LShift: Boolean;
begin
  Result := False;
  LFocus := GetFocus;
  if IsVisible and IsChild(FForm.ToolBar.Handle, LFocus) then
  begin
    if Msg.message = WM_KEYDOWN then
    begin
      LCtrl := GetKeyState(VK_CONTROL) < 0;
      LShift := GetKeyState(VK_SHIFT) < 0;
      if not LCtrl then
      begin
        case Msg.wParam of
          VK_ESCAPE:
            if not LShift then
            begin
              Editor_ExecCommand(hwnd, MEID_WINDOW_ACTIVE_PANE);
              Result := True;
              Exit;
            end;
        end;
      end;
    end;
    if IsDialogMessage(FForm.ToolBar.Handle, Msg) then
      Result := True;
  end;
end;

procedure TToolBarFrame.DisplayBar(AVisible: Boolean);
var
  LInfo: TToolBarInfo;
begin
  if FForm <> nil then
  begin
    Editor_ToolBarShow(Handle, FClientID, AVisible);
    FVisible := AVisible;
  end
  else
  begin
    FVisible := False;
    if Editor_GetVersion(Handle) < 20803 then
    begin
      if FOpenStartup then
      begin
        FOpenStartup := False;
        WriteOpenStartup;
      end;
      Application.MessageBox(PChar(SInvalidVersion), PChar(SName), MB_OK or MB_ICONSTOP);
      Exit;
    end;
    FForm := TMainForm.CreateParented(Handle);
    with FForm do
    begin
      Left := 0;
      Top := 0;
      Width := 0;
      Height := 0;
      Visible := True;
    end;
    FillChar(LInfo, SizeOf(LInfo), #0);
    with LInfo do
    begin
      cbSize := SizeOf(LInfo);
      hwndClient := FForm.ToolBar.Handle;
      pszTitle := PChar(STitle);
      bVisible := AVisible;
      iIndex := FIndex;
      bBreak := FBreak;
      iWidth := FWidth;
    end;
    FClientID := Editor_ToolBarOpen(Handle, @LInfo);
    if FClientID = 0 then
      CustomBarClosed
    else
      FVisible := AVisible;
  end;
end;

function TToolBarFrame.IsVisible: Boolean;
begin
  Result := (FForm <> nil) and FVisible;
end;

procedure TToolBarFrame.CustomBarClosed;
begin
  if FForm <> nil then
    FreeAndNil(FForm);
  FClientID := 0;
end;

procedure TToolBarFrame.OnIdle;
begin
  //
end;

procedure TToolBarFrame.OnCommand(hwnd: HWND);
begin
  DisplayBar(not IsVisible);
end;

function TToolBarFrame.QueryStatus(hwnd: HWND; pbChecked: PBOOL): BOOL;
begin
  pbChecked^ := IsVisible;
  Result := True;
end;

procedure TToolBarFrame.OnEvents(hwnd: HWND; nEvent: Cardinal; lParam: LPARAM);
var
  LShow: Boolean;
  LInfo: TToolBarInfo;
begin
  if (nEvent and EVENT_CREATE_FRAME) <> 0 then
  begin
    ReadIni;
    LShow := FOpenStartup;
    DisplayBar(LShow);
  end;
  if (nEvent and EVENT_CLOSE_FRAME) <> 0 then
  begin
    if FForm <> nil then
    begin
      Editor_ToolBarClose(Handle, FClientID);
      CustomBarClosed;
    end;
  end;
  if (nEvent and EVENT_TOOL_BAR_CLOSED) <> 0 then
  begin
    LInfo := PToolBarInfo(lParam)^;
    if LInfo.nID = FClientID then
    begin
      CustomBarClosed;
      FIndex := LInfo.iIndex;
      FBreak := LInfo.bBreak;
      FWidth := LInfo.iWidth;
      WriteIni;
    end;
  end;
  if (nEvent and EVENT_TOOL_BAR_SHOW) <> 0 then
  begin
    LInfo := PToolBarInfo(lParam)^;
    if LInfo.nID = FClientID then
    begin
      FVisible := LInfo.bVisible;
      FOpenStartup := FVisible;
      WriteOpenStartup;
    end;
  end;
end;

function TToolBarFrame.PluginProc(hwnd: HWND; nMsg: Cardinal; wParam: WPARAM; lParam: LPARAM): LRESULT;
begin
  Result := 0;
  case nMsg of
    MP_QUERY_PROPERTIES:
      Result := LRESULT(QueryProperties);
    MP_SET_PROPERTIES:
      Result := LRESULT(SetProperties);
    MP_PRE_TRANSLATE_MSG:
      Result := LRESULT(PreTranslateMessage(hwnd, PMsg(lParam)^));
  end;
end;

end.
