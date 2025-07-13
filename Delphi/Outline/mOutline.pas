// -----------------------------------------------------------------------------
// Copyright (c) Kuro. All rights reserved.
// Licensed under the MIT License.
// -----------------------------------------------------------------------------

unit mOutline;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, mCommon, mMain, mFrame,
  mPlugin;

resourcestring
  SName = 'アウトライン';
  SVersion = '3.2.4';

type
  TOutlineFrame = class(TFrame)
  private
    { Private 宣言 }
    FForm: TMainForm;
    FClientID: Cardinal;
    FPos: Integer;
    FBarPos: Integer;
    FOpenStartup: Boolean;
    function QueryProperties: Boolean;
    function SetProperties: Boolean;
    function PreTranslateMessage(hwnd: HWND; var Msg: tagMSG): Boolean;
    procedure OpenCustomBar;
    procedure CloseCustomBar;
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

procedure WorkThread(AForm: Pointer);

implementation

uses
  System.Types, System.IniFiles;

{ TOutlineFrame }

function TOutlineFrame.QueryProperties: Boolean;
begin
  Result := True;
end;

function TOutlineFrame.SetProperties: Boolean;
begin
  if FForm <> nil then
    Result := FForm.SetProperties
  else
  begin
    with TMainForm.CreateParented(Handle) do
      try
        BarPos := FBarPos;
        SetAppMode;
        Result := SetProperties;
        if Result then
          FBarPos := BarPos;
      finally
        Free;
      end;
  end;
end;

function TOutlineFrame.PreTranslateMessage(hwnd: HWND; var Msg: tagMSG): Boolean;
var
  LHandle: THandle;
  LCtrl, LShift: Boolean;
begin
  Result := False;
  if FForm <> nil then
  begin
    LHandle := GetFocus;
    if FForm.TreeView.Handle = LHandle then
    begin
      if Msg.message = WM_KEYDOWN then
      begin
        LCtrl := GetKeyState(VK_CONTROL) < 0;
        LShift := GetKeyState(VK_SHIFT) < 0;
        if not LCtrl then
        begin
          if Msg.wParam = VK_ESCAPE then
          begin
            if not LShift then
            begin
              Editor_ExecCommand(hwnd, MEID_WINDOW_ACTIVE_PANE);
              Result := True;
              Exit;
            end;
          end;
        end;
        if ((Msg.wParam >= VK_PRIOR) and (Msg.wParam <= VK_DELETE)) or (Msg.wParam = VK_TAB) or (Msg.wParam = VK_BACK) or (Msg.wParam = VK_ESCAPE) or (Msg.wParam = VK_RETURN) then
        begin
          SendMessage(GetFocus, Msg.message, Msg.wParam, Msg.lParam);
          Result := True;
          Exit;
        end;
        if (Msg.wParam = Ord('C')) and LCtrl then
        begin
          FForm.TreeCopy(nil);
          Result := True;
          Exit;
        end;
      end;
      if Msg.message = WM_SYSKEYDOWN then
      begin
        if ((Msg.wParam = VK_UP) or (Msg.wParam = VK_DOWN)) and (GetKeyState(VK_MENU) < 0) then
        begin
          FForm.TreeMove(nil, Msg.wParam = VK_DOWN);
          Result := True;
          Exit;
        end;
        if ((Msg.wParam in [VK_NUMPAD1 .. VK_NUMPAD9]) or (Msg.wParam in [$31 .. $38])) and (GetKeyState(VK_MENU) < 0) then
        begin
          with FForm do
            case Msg.wParam of
              VK_NUMPAD1, $31:
                CollapseAllMenuItemClick(nil);
              VK_NUMPAD2, $32:
                Level2MenuItemClick(Level2MenuItem);
              VK_NUMPAD3, $33:
                Level2MenuItemClick(Level3MenuItem);
              VK_NUMPAD4, $34:
                Level2MenuItemClick(Level4MenuItem);
              VK_NUMPAD5, $35:
                Level2MenuItemClick(Level5MenuItem);
              VK_NUMPAD6, $36:
                Level2MenuItemClick(Level6MenuItem);
              VK_NUMPAD7, $37:
                Level2MenuItemClick(Level7MenuItem);
              VK_NUMPAD8, $38:
                ExpandAllMenuItemClick(nil);
            end;
          Result := True;
          Exit;
        end;
      end;
      if IsDialogMessage(FForm.Handle, Msg) then
        Result := True;
    end
    else if FForm.AltGoToNode and IsChild(hwnd, LHandle) then
    begin
      if Msg.message = WM_SYSKEYDOWN then
      begin
        LCtrl := GetKeyState(VK_CONTROL) < 0;
        LShift := GetKeyState(VK_SHIFT) < 0;
        if (not LCtrl) and (not LShift) and ((Msg.wParam = VK_UP) or (Msg.wParam = VK_DOWN)) and (GetKeyState(VK_MENU) < 0) then
        begin
          FForm.TreeGoToNode(Msg.wParam = VK_DOWN, True);
          Result := True;
          Exit;
        end;
      end;
    end;
  end;
end;

procedure TOutlineFrame.OpenCustomBar;
var
  LInfo: TCustomBarInfo;
begin
  if FForm = nil then
  begin
    FForm := TMainForm.CreateParented(Handle);
    with FForm do
    begin
      Left := 0;
      Top := 0;
      Visible := True;
      BarPos := FBarPos;
    end;
    with LInfo do
    begin
      cbSize := SizeOf(LInfo);
      hwndClient := FForm.Handle;
      pszTitle := PChar(SName);
      iPos := FBarPos;
    end;
    FClientID := Editor_CustomBarOpen(Handle, @LInfo);
    if FClientID = 0 then
      CustomBarClosed
    else
      with FForm do
      begin
        ResetThread;
        ReadIni;
        SetFont;
        UpdateOutline := True;
      end;
  end;
end;

procedure TOutlineFrame.CloseCustomBar;
begin
  if FForm <> nil then
  begin
    FForm.ResetThread;
    Editor_CustomBarClose(Handle, FClientID);
    CustomBarClosed;
  end;
end;

procedure TOutlineFrame.CustomBarClosed;
begin
  if FForm <> nil then
  begin
    FForm.ResetThread;
    FreeAndNil(FForm);
  end;
  FClientID := 0;
end;

procedure TOutlineFrame.OnIdle;
var
  LId: Cardinal;
begin
  if FForm <> nil then
  begin
    with FForm do
    begin
      if UpdateOutline or UpdateTreeSel then
      begin
        if WorkHandle = 0 then
        begin
          LId := 0;
          WorkHandle := BeginThread(nil, 0, @WorkThread, @FForm, 0, LId);
          if WorkHandle > 0 then
            SetThreadPriority(WorkHandle, THREAD_PRIORITY_LOWEST);
        end;
      end;
      if UpdateOutline then
      begin
        if FBarPos <> BarPos then
        begin
          FBarPos := BarPos;
          CloseCustomBar;
          OpenCustomBar;
          Exit;
        end;
        WorkFlag := WorkOutlineAll;
        SetEvent(QueEvent);
      end
      else if UpdateTreeSel then
      begin
        WorkFlag := WorkTreeSel;
        SetEvent(QueEvent);
      end;
      UpdateOutline := False;
      UpdateTreeSel := False;
    end;
  end;
end;

procedure TOutlineFrame.OnCommand(hwnd: HWND);
begin
  if FForm = nil then
    OpenCustomBar
  else
    CloseCustomBar;
end;

function TOutlineFrame.QueryStatus(hwnd: HWND; pbChecked: PBOOL): BOOL;
begin
  pbChecked^ := FForm <> nil;
  Result := True;
end;

procedure TOutlineFrame.OnEvents(hwnd: HWND; nEvent: Cardinal; lParam: LPARAM);
var
  S: string;
  LInfo: TCustomBarCloseInfo;
  LPos: TPoint;
begin
  if (nEvent and EVENT_CREATE_FRAME) <> 0 then
  begin
    if not GetIniFileName(S) then
      Exit;
    with TMemIniFile.Create(S, TEncoding.UTF8) do
      try
        FBarPos := ReadInteger('Outline', 'CustomBarPos', CUSTOM_BAR_LEFT);
        FOpenStartup := ReadBool('Outline', 'OpenStartup', False);
      finally
        Free;
      end;
    if FOpenStartup then
      OnCommand(hwnd);
  end;
  if (nEvent and EVENT_CLOSE_FRAME) <> 0 then
  begin
    CloseCustomBar;
  end;
  if (nEvent and (EVENT_MODE_CHANGED or EVENT_DOC_SEL_CHANGED)) <> 0 then
  begin
    if FForm <> nil then
      with FForm do
      begin
        ResetThread;
        ReadIni;
        UpdateOutline := True;
        SetFont;
      end;
  end;
  if (nEvent and EVENT_CUSTOM_BAR_CLOSING) <> 0 then
  begin
    LInfo := PCustomBarCloseInfo(lParam)^;
    if LInfo.nID = FClientID then
    begin
      if FForm <> nil then
        FForm.ResetThread;
    end;
  end;
  if (nEvent and EVENT_CUSTOM_BAR_CLOSED) <> 0 then
  begin
    LInfo := PCustomBarCloseInfo(lParam)^;
    if LInfo.nID = FClientID then
    begin
      CustomBarClosed;
      FOpenStartup := (LInfo.dwFlags and CLOSED_FRAME_WINDOW) <> 0;
      if FIniFailed or (not GetIniFileName(S)) then
        Exit;
      try
        with TMemIniFile.Create(S, TEncoding.UTF8) do
          try
            WriteBool('Outline', 'OpenStartup', FOpenStartup);
            UpdateFile;
          finally
            Free;
          end;
      except
        FIniFailed := True;
      end;
    end;
  end;
  if (nEvent and EVENT_CHANGED) <> 0 then
  begin
    if FForm <> nil then
      FForm.UpdateOutline := True;
  end;
  if (nEvent and EVENT_CARET_MOVED) <> 0 then
  begin
    if FForm <> nil then
    begin
      Editor_GetCaretPos(hwnd, POS_LOGICAL, @LPos);
      if LPos.Y <> FPos then
      begin
        FPos := LPos.Y;
        FForm.UpdateTreeSel := True;
      end;
    end;
  end;
  if (nEvent and EVENT_IDLE) <> 0 then
    OnIdle;
  if (nEvent and EVENT_DPI_CHANGED) <> 0 then
  begin
    if FForm <> nil then
      FForm.SetScale(lParam);
  end;
  if (nEvent and EVENT_APP_MODE_CHANGED) <> 0 then
  begin
    if FForm <> nil then
      FForm.SetAppMode;
  end;
end;

function TOutlineFrame.PluginProc(hwnd: HWND; nMsg: Cardinal; wParam: WPARAM; lParam: LPARAM): LRESULT;
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

procedure WorkThread(AForm: Pointer);
var
  LForm: TMainForm;
  LFlag: Integer;
  LQueEvent: THandle;
  LMutex: THandle;
begin
  LForm := TMainForm(AForm^);
  if not Assigned(LForm) then
    Exit;
  LQueEvent := LForm.QueEvent;
  LMutex := LForm.Mutex;
  while not LForm.AbortThread do
  begin
    if WaitForSingleObject(LQueEvent, INFINITE) <> WAIT_OBJECT_0 then
      Break;
    if WaitForSingleObject(LMutex, INFINITE) <> WAIT_OBJECT_0 then
      Break;
    if LForm.AbortThread then
    begin
      ReleaseMutex(LMutex);
      Break;
    end;
    LFlag := LForm.WorkFlag;
    LForm.WorkFlag := 0;
    ResetEvent(LQueEvent);
    try
      case LFlag of
        WorkOutlineAll:
          LForm.OutlineAll;
        WorkTreeSel:
          LForm.UpdateTreeViewSel;
      end;
    except
      LForm.AbortThread := True;
    end;
    ReleaseMutex(LMutex);
  end;
  LForm.AbortThread := False;
end;

end.
