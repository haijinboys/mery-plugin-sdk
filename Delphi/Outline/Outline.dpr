// -----------------------------------------------------------------------------
// Copyright (c) Kuro. All rights reserved.
// Licensed under the MIT License.
// -----------------------------------------------------------------------------

library Outline;

{$RTTI EXPLICIT METHODS([]) FIELDS([]) PROPERTIES([])}
{$WEAKLINKRTTI ON}

{$R 'mPlugin.res' 'mPlugin.rc'}


uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  System.Types,
  mCommon in 'mCommon.pas',
  mMain in 'mMain.pas' {MainForm},
  mProp in 'mProp.pas' {PropForm},
  mFrame in 'mFrame.pas',
  mOutline in 'mOutline.pas',
  mPlugin in 'mPlugin.pas',
  mPerMonitorDpi in 'mPerMonitorDpi.pas';

const
  IDS_MENU_TEXT = 1;
  IDS_STATUS_MESSAGE = 2;
  IDI_ICON = 101;
  IDI_ICON_DARK = 201;

var
  FList: TFrameList;

{$IFDEF DEBUG}
{$R *.res}
{$ENDIF}


procedure OnCommand(hwnd: HWND); stdcall;
var
  LFrame: TFrame;
begin
  LFrame := FList.Find(hwnd);
  if LFrame <> nil then
    LFrame.OnCommand(hwnd);
end;

function QueryStatus(hwnd: HWND; pbChecked: PBOOL): BOOL; stdcall;
var
  LFrame: TFrame;
begin
  Result := False;
  LFrame := FList.Find(hwnd);
  if LFrame <> nil then
    Result := LFrame.QueryStatus(hwnd, pbChecked);
end;

function GetMenuTextID: Cardinal; stdcall;
begin
  Result := IDS_MENU_TEXT;
end;

function GetStatusMessageID: Cardinal; stdcall;
begin
  Result := IDS_STATUS_MESSAGE;
end;

function GetIconID: Cardinal; stdcall;
begin
  Result := IDI_ICON;
end;

function GetIconDarkID: Cardinal; stdcall;
begin
  Result := IDI_ICON_DARK;
end;

procedure OnEvents(hwnd: HWND; nEvent: Cardinal; lParam: LPARAM); stdcall;
var
  I: Integer;
  LFrame: TFrame;
begin
  if (nEvent and EVENT_CREATE) <> 0 then
  begin
    FList := TFrameList.Create;
  end
  else
  begin
    if Assigned(FList) then
    begin
      if (nEvent and EVENT_CREATE_FRAME) <> 0 then
      begin
        LFrame := TOutlineFrame.Create;
        with LFrame do
        begin
          Handle := hwnd;
          OnEvents(hwnd, nEvent, lParam);
        end;
        FList.Add(LFrame);
      end
      else if (nEvent and EVENT_CLOSE_FRAME) <> 0 then
      begin
        LFrame := FList.Find(hwnd);
        if LFrame <> nil then
          with LFrame do
          begin
            OnEvents(hwnd, nEvent, lParam);
            FList.Remove(LFrame);
            Free;
          end;
      end
      else if (nEvent and EVENT_CLOSE) <> 0 then
      begin
        for I := FList.Count - 1 downto 0 do
          FList[I].Free;
        FList.Free;
      end
      else
      begin
        LFrame := FList.Find(hwnd);
        if LFrame <> nil then
          LFrame.OnEvents(hwnd, nEvent, lParam);
      end;
    end;
  end;
end;

function PluginProc(hwnd: HWND; nMsg: Cardinal; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  LFrame: TFrame;
begin
  Result := 0;
  case nMsg of
    MP_GET_NAME:
      begin
        Result := Length(SName);
        if lParam <> 0 then
          lstrcpynW(PChar(lParam), PChar(SName), wParam);
      end;
    MP_GET_VERSION:
      begin
        Result := Length(SVersion);
        if lParam <> 0 then
          lstrcpynW(PChar(lParam), PChar(SVersion), wParam);
      end;
  else
    begin
      LFrame := FList.Find(hwnd);
      if LFrame = nil then
      begin
        hwnd := GetParent(hwnd);
        LFrame := FList.Find(hwnd);
      end;
      if LFrame <> nil then
        Result := LFrame.PluginProc(hwnd, nMsg, wParam, lParam);
    end;
  end;
end;

exports
  OnCommand,
  QueryStatus,
  GetMenuTextID,
  GetStatusMessageID,
  GetIconID,
  GetIconDarkID,
  OnEvents,
  PluginProc;

begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}

end.
