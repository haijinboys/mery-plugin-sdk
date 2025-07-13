// -----------------------------------------------------------------------------
// Copyright (c) Kuro. All rights reserved.
// Licensed under the MIT License.
// -----------------------------------------------------------------------------

unit DarkModeClasses;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils;

procedure FreeDarkModeLibrary;
function InitDarkModeLibrary: Boolean;
function IsDarkModeSupported: Boolean;

procedure UpdateDarkModeEnabled;

var
  DarkModeAvailable: Boolean = False;
  DarkModeSupported: Boolean = False;
  DarkModeEnabled: Boolean = False;

var
  UseDarkMode: Boolean = False;

implementation

uses
  System.SyncObjs;

var
  _ShouldAppsUseDarkMode: function: BOOL; stdcall;

function ShouldAppsUseDarkMode: Boolean;
begin
  if @_ShouldAppsUseDarkMode <> nil then
    Result := Boolean(Integer(_ShouldAppsUseDarkMode) and $01)
  else
    Result := False;
end;

function IsHighContrast: Boolean;
var
  LHighContrast: THighContrast;
begin
  LHighContrast.cbSize := SizeOf(THighContrast);
  SystemParametersInfo(SPI_GETHIGHCONTRAST, SizeOf(THighContrast), @LHighContrast, 0);
  Result := LHighContrast.dwFlags and HCF_HIGHCONTRASTON <> 0;
end;

procedure UpdateDarkModeEnabled;
begin
  DarkModeEnabled := ShouldAppsUseDarkMode and (not IsHighContrast);
  UseDarkMode := DarkModeSupported and DarkModeEnabled;
end;

const
  themelib = 'uxtheme.dll';

var
  DarkModeLibrary: THandle;
  ReferenceCount: Integer;
  Lock: TCriticalSection = nil;

procedure FreeDarkModeLibrary;
begin
  Lock.Enter;
  try
    if ReferenceCount > 0 then
      Dec(ReferenceCount);
    if (DarkModeLibrary <> 0) and (ReferenceCount = 0) then
    begin
      FreeLibrary(DarkModeLibrary);
      DarkModeLibrary := 0;
      _ShouldAppsUseDarkMode := nil;
    end;
  finally
    Lock.Leave;
  end;
end;

function InitDarkModeLibrary: Boolean;
begin
  if not(CheckWin32Version(10) and (TOSVersion.Build >= 17763)) then
    Exit(False);
  if Lock = nil then
    Exit(False);
  Lock.Enter;
  try
    Inc(ReferenceCount);
    if DarkModeLibrary = 0 then
    begin
      DarkModeLibrary := LoadLibrary(themelib);
      if DarkModeLibrary > 0 then
      begin
        _ShouldAppsUseDarkMode := GetProcAddress(DarkModeLibrary, MakeIntResource(132));
        if @_ShouldAppsUseDarkMode <> nil then
          DarkModeSupported := True;
      end;
    end;
    Result := DarkModeLibrary > 0;
  finally
    Lock.Leave;
  end;
end;

function IsDarkModeSupported: Boolean;
begin
  Result := CheckWin32Version(10) and (TOSVersion.Build >= 17763);
end;

initialization

Lock := TCriticalSection.Create;

finalization

while ReferenceCount > 0 do
  FreeDarkModeLibrary;
Lock.Free;
Lock := nil;

end.
