unit mPerMonitorDpi;

interface

uses
{$IF CompilerVersion > 22.9}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Winapi.MultiMon;
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MultiMon;
{$IFEND}


const
  SHCORE_LIB = 'shcore.dll';

type
  PROCESS_DPI_AWARENESS = (PROCESS_DPI_UNAWARE, PROCESS_SYSTEM_DPI_AWARE, PROCESS_PER_MONITOR_DPI_AWARE);
  MONITOR_DPI_TYPE = (MDT_EFFECTIVE_DPI, MDT_ANGULAR_DPI, MDT_RAW_DPI);

const
  WM_DPICHANGED = $02E0;
  MDT_DEFAULT = MDT_EFFECTIVE_DPI;

type
  TScaledForm = class(TForm)
  private
    { Private êÈåæ }
    FFixedSize: Boolean;
  protected
    { Protected êÈåæ }
    procedure DoShow; override;
    procedure ReadState(Reader: TReader); override;
    procedure WMDpiChanged(var Message: TMessage); message WM_DPICHANGED;
  public
    { Public êÈåæ }
    constructor Create(AOwner: TComponent); override;
    property FixedSize: Boolean read FFixedSize write FFixedSize default False;
  end;

  TGetProcessDpiAwareness = function(hprocess: THandle; var value: PROCESS_DPI_AWARENESS): HRESULT; stdcall;
  TGetDpiForMonitor = function(hmonitor: HMONITOR; dpiType: MONITOR_DPI_TYPE; out dpiX: UINT; out dpiY: UINT): HRESULT; stdcall;

var
  FSHCoreHandle: THandle;
  FSHCoreLoaded: Boolean;
  GetProcessDpiAwareness: TGetProcessDpiAwareness;
  GetDpiForMonitor: TGetDpiForMonitor;

implementation

{ TScaledForm }

function SHCoreLoadLibrary: Boolean;
begin
  FSHCoreHandle := LoadLibrary(SHCORE_LIB);
  Result := FSHCoreHandle <> 0;
  if Result then
  begin
    @GetProcessDpiAwareness := GetProcAddress(FSHCoreHandle, 'GetProcessDpiAwareness');
    @GetDpiForMonitor := GetProcAddress(FSHCoreHandle, 'GetDpiForMonitor');
  end;
end;

procedure SHCoreFreeLibrary;
begin
  if FSHCoreHandle <> 0 then
    FreeLibrary(FSHCoreHandle);
  FSHCoreHandle := 0;
end;

function IsPerMonitorDpiAware: Boolean;
var
  H: THandle;
  P: PROCESS_DPI_AWARENESS;
begin
  Result := False;
  if FSHCoreLoaded then
  begin
    H := OpenProcess(PROCESS_ALL_ACCESS, False, GetCurrentProcessId);
    if (H > 0) and Succeeded(GetProcessDpiAwareness(H, P)) then
      Result := P = PROCESS_PER_MONITOR_DPI_AWARE;
  end;
end;

constructor TScaledForm.Create(AOwner: TComponent);
begin
  inherited;
  FFixedSize := True;
  PixelsPerInch := 96;
end;

procedure TScaledForm.DoShow;
var
  M: TMonitor;
  X, Y: UINT;
  P: NativeInt;
begin
  if FSHCoreLoaded and IsPerMonitorDpiAware then
  begin
    M := Screen.MonitorFromWindow(Self.Handle, mdNearest);
    if (M.Handle <> 0) and (GetDpiForMonitor(M.Handle, MDT_DEFAULT, X, Y) = S_OK) then
    begin
      P := PixelsPerInch;
      PixelsPerInch := Y;
      if P <> PixelsPerInch then
        ChangeScale(PixelsPerInch, P);
    end;
  end
  else
  begin
    P := PixelsPerInch;
    PixelsPerInch := Screen.PixelsPerInch;
    if P <> PixelsPerInch then
      ChangeScale(PixelsPerInch, P);
  end;
  inherited;
  FFixedSize := False;
end;

procedure TScaledForm.ReadState(Reader: TReader);
begin
  Scaled := False;
  inherited;
end;

procedure TScaledForm.WMDpiChanged(var Message: TMessage);
var
  R: PRect;
  P: NativeInt;
begin
  if FSHCoreLoaded and IsPerMonitorDpiAware then
  begin
    if not FFixedSize then
    begin
      R := PRect(Message.LParam);
      SetWindowPos(Self.Handle, 0, R.Left, R.Top, R.Right - R.Left, R.Bottom - R.Top, SWP_NOZORDER or SWP_NOOWNERZORDER or SWP_NOACTIVATE);
    end;
    P := PixelsPerInch;
    PixelsPerInch := HIWORD(Message.WParam);
    if P <> PixelsPerInch then
    begin
      ScaleControls(PixelsPerInch, P);
      Font.Height := MulDiv(Font.Height, PixelsPerInch, P);
      ScaleConstraints(PixelsPerInch, P);
      Resize;
    end;
  end;
end;

initialization

if (Win32MajorVersion > 6) or ((Win32MajorVersion = 6) and (Win32MinorVersion >= 3)) then
  FSHCoreLoaded := SHCoreLoadLibrary;

finalization

if FSHCoreLoaded then
  SHCoreFreeLibrary;

end.
