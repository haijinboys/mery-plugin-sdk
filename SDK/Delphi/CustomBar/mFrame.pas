// -----------------------------------------------------------------------------
// プラグインフレーム
//
// Copyright (c) Kuro. All Rights Reserved.
// e-mail: info@haijin-boys.com
// www:    https://www.haijin-boys.com/
// -----------------------------------------------------------------------------

unit mFrame;

interface

uses
{$IF CompilerVersion > 22.9}
  Winapi.Windows, Winapi.Messages, System.Classes;
{$ELSE}
  Windows, Messages, Classes;
{$IFEND}


type
  TFrame = class(TPersistent)
  private
    { Private 宣言 }
    FHandle: THandle;
  protected
    { Protected 宣言 }
  public
    { Public 宣言 }
    procedure OnCommand(hwnd: HWND); virtual; abstract;
    function QueryStatus(hwnd: HWND; pbChecked: PBOOL): BOOL; virtual; abstract;
    procedure OnEvents(hwnd: HWND; nEvent: Cardinal; lParam: LPARAM); virtual; abstract;
    function PluginProc(hwnd: HWND; nMsg: Cardinal; wParam: WPARAM; lParam: LPARAM): LRESULT; virtual; abstract;
    property Handle: THandle read FHandle write FHandle;
  end;

  TFrameList = class(TList)
  private
    { Private 宣言 }
    function Get(Index: Integer): TFrame;
    procedure Put(Index: Integer; const Value: TFrame);
  public
    { Public 宣言 }
    destructor Destroy; override;
    function Find(const H: THandle): TFrame;
    property Items[Index: Integer]: TFrame read Get write Put; default;
  end;

implementation

{ TFrameList }

function TFrameList.Get(Index: Integer): TFrame;
begin
  Result := TFrame(inherited Get(Index));
end;

procedure TFrameList.Put(Index: Integer; const Value: TFrame);
begin
  inherited Put(Index, Value);
end;

destructor TFrameList.Destroy;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    Items[I].Free;
  inherited;
end;

function TFrameList.Find(const H: THandle): TFrame;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Count - 1 do
    if H = Items[I].Handle then
    begin
      Result := Items[I];
      Break;
    end;
end;

end.
