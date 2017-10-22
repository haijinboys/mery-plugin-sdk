unit mCustomBar;

interface

uses
  Windows, Messages, SysUtils, mMain, mFrame, mPlugin;

resourcestring
  SName = 'カスタムバーを使用したサンプル';
  SVersion = '1.0.0';

type
  TCustomBarFrame = class(TFrame)
  private
    { Private 宣言 }
    FForm: TMainForm;
    FClientID: Cardinal;
    FBarPos: Integer;
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

implementation

{ TCustomBarFrame }

function TCustomBarFrame.QueryProperties: Boolean;
begin
  Result := True;
end;

function TCustomBarFrame.SetProperties: Boolean;
begin
  if FForm <> nil then
    Result := FForm.SetProperties
  else
  begin
    with TMainForm.Create(nil) do
      try
        Result := SetProperties;
      finally
        Free;
      end;
  end;
end;

function TCustomBarFrame.PreTranslateMessage(hwnd: HWND; var Msg: tagMSG): Boolean;
var
  Ctrl, Shift: Boolean;
begin
  Result := False;
  if (FForm <> nil) and (FForm.Memo.Handle = GetFocus) then
  begin
    if Msg.message = WM_KEYDOWN then
    begin
      Ctrl := GetKeyState(VK_CONTROL) < 0;
      Shift := GetKeyState(VK_SHIFT) < 0;
      if not Ctrl then
      begin
        if Msg.wParam = VK_ESCAPE then
        begin
          if not Shift then
          begin
            Editor_ExecCommand(hwnd, MEID_WINDOW_ACTIVE_PANE);
            Result := True;
            Exit;
          end;
        end;
      end;
      if ((Msg.wParam >= VK_PRIOR) and (Msg.wParam <= VK_DELETE)) or (Msg.wParam <= VK_TAB) or (Msg.wParam <= VK_BACK) or (Msg.wParam <= VK_ESCAPE) or (Msg.wParam <= VK_RETURN) then
      begin
        SendMessage(GetFocus, Msg.message, Msg.wParam, Msg.lParam);
        Result := True;
        Exit;
      end;
    end;
    if IsDialogMessage(FForm.Handle, Msg) then
      Result := True;
  end;
end;

procedure TCustomBarFrame.OpenCustomBar;
var
  Info: TCustomBarInfo;
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
    with Info do
    begin
      cbSize := SizeOf(Info);
      hwndClient := FForm.Handle;
      pszTitle := PChar(SName);
      iPos := FBarPos;
    end;
    FClientID := Editor_CustomBarOpen(Handle, @Info);
    if FClientID = 0 then
      CustomBarClosed
    else
      with FForm do
        UpdateCustomBar := True;
  end;
end;

procedure TCustomBarFrame.CloseCustomBar;
begin
  if FForm <> nil then
  begin
    Editor_CustomBarClose(Handle, FClientID);
    CustomBarClosed;
  end;
end;

procedure TCustomBarFrame.CustomBarClosed;
begin
  if FForm <> nil then
    FreeAndNil(FForm);
  FClientID := 0;
end;

procedure TCustomBarFrame.OnIdle;
begin
  if FForm <> nil then
  begin
    with FForm do
    begin
      if UpdateCustomBar then
        CustomBarAll;
      if UpdateCustomBar then
      begin
        if FBarPos <> BarPos then
        begin
          FBarPos := BarPos;
          CloseCustomBar;
          OpenCustomBar;
          Exit;
        end;
      end;
      UpdateCustomBar := False;
    end;
  end;
end;

procedure TCustomBarFrame.OnCommand(hwnd: HWND);
begin
  if FForm = nil then
    OpenCustomBar
  else
    CloseCustomBar;
end;

function TCustomBarFrame.QueryStatus(hwnd: HWND; pbChecked: PBOOL): BOOL;
begin
  pbChecked^ := FForm <> nil;
  Result := True;
end;

procedure TCustomBarFrame.OnEvents(hwnd: HWND; nEvent: Cardinal; lParam: LPARAM);
var
  Info: TCustomBarCloseInfo;
begin
  if (nEvent and EVENT_CREATE_FRAME) <> 0 then
  begin
    //
  end;
  if (nEvent and EVENT_CLOSE_FRAME) <> 0 then
  begin
    CloseCustomBar;
  end;
  if (nEvent and (EVENT_MODE_CHANGED or EVENT_DOC_SEL_CHANGED)) <> 0 then
  begin
    if FForm <> nil then
      with FForm do
        UpdateCustomBar := True;
  end;
  if (nEvent and EVENT_CUSTOM_BAR_CLOSING) <> 0 then
  begin
    Info := PCustomBarCloseInfo(lParam)^;
    if Info.nID = FClientID then
    begin
      if FForm <> nil then
        FreeAndNil(FForm);
    end;
  end;
  if (nEvent and EVENT_CUSTOM_BAR_CLOSED) <> 0 then
  begin
    Info := PCustomBarCloseInfo(lParam)^;
    if Info.nID = FClientID then
      CustomBarClosed;
  end;
  if (nEvent and EVENT_FILE_SAVED) <> 0 then
  begin
    if FForm <> nil then
      FForm.UpdateCustomBar := True;
  end;
  if (nEvent and EVENT_IDLE) <> 0 then
    OnIdle;
  if FForm <> nil then
    with FForm do
    begin
      if (nEvent and EVENT_CREATE) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_CREATE');
      if (nEvent and EVENT_CLOSE) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_CLOSE');
      if (nEvent and EVENT_CREATE_FRAME) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_CREATE_FRAME');
      if (nEvent and EVENT_CLOSE_FRAME) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_CLOSE_FRAME');
      if (nEvent and EVENT_SET_FOCUS) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_SET_FOCUS');
      if (nEvent and EVENT_KILL_FOCUS) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_KILL_FOCUS');
      if (nEvent and EVENT_FILE_OPENED) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_FILE_OPENED');
      if (nEvent and EVENT_FILE_SAVED) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_FILE_SAVED');
      if (nEvent and EVENT_MODIFIED) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_MODIFIED');
      if (nEvent and EVENT_CARET_MOVED) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_CARET_MOVED');
      if (nEvent and EVENT_SCROLL) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_SCROLL');
      if (nEvent and EVENT_SEL_CHANGED) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_SEL_CHANGED');
      if (nEvent and EVENT_CHANGED) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_CHANGED');
      if (nEvent and EVENT_CHAR) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_CHAR');
      if (nEvent and EVENT_MODE_CHANGED) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_MODE_CHANGED');
      if (nEvent and EVENT_DOC_SEL_CHANGED) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_DOC_SEL_CHANGED');
      if (nEvent and EVENT_DOC_CLOSE) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_DOC_CLOSE');
      if (nEvent and EVENT_TAB_MOVED) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_TAB_MOVED');
      if (nEvent and EVENT_CUSTOM_BAR_CLOSING) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_CUSTOM_BAR_CLOSING');
      if (nEvent and EVENT_CUSTOM_BAR_CLOSED) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_CUSTOM_BAR_CLOSED');
      if (nEvent and EVENT_TOOL_BAR_CLOSED) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_TOOL_BAR_CLOSED');
      if (nEvent and EVENT_TOOL_BAR_SHOW) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_TOOL_BAR_SHOW');
      if (nEvent and EVENT_FILE_SAVING) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_FILE_SAVING');
      if (nEvent and EVENT_DPI_CHANGED) <> 0 then
        Memo.Lines.Insert(0, 'EVENT_DPI_CHANGED');
    end;
end;

function TCustomBarFrame.PluginProc(hwnd: HWND; nMsg: Cardinal; wParam: WPARAM; lParam: LPARAM): LRESULT;
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
