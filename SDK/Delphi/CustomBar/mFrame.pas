unit mFrame;

interface

uses
  Windows, Messages, Classes;

type
  TFrame = class(TPersistent)
  private
    { Private éŒ¾ }
    FHandle: THandle;
  protected
    { Protected éŒ¾ }
  public
    { Public éŒ¾ }
    procedure OnCommand(hwnd: HWND); virtual; abstract;
    function QueryStatus(hwnd: HWND; pbChecked: PBOOL): BOOL; virtual; abstract;
    procedure OnEvents(hwnd: HWND; nEvent: NativeInt; lParam: LPARAM); virtual; abstract;
    function PluginProc(hwnd: HWND; nMsg: NativeInt; wParam: WPARAM; lParam: LPARAM): LRESULT; virtual; abstract;
    property Handle: THandle read FHandle write FHandle;
  end;

  TFrameList = class(TList)
  private
    { Private éŒ¾ }
    function Get(Index: Integer): TFrame;
    procedure Put(Index: Integer; const Value: TFrame);
  public
    { Public éŒ¾ }
    destructor Destroy; override;
    function Find(const H: THandle): TFrame;
    property Items[Index: Integer]: TFrame read Get write Put; default;
  end;

implementation

{ TFrameList }

function TFrameList.Get(Index: Integer): TFrame;
begin
  Result := TFrame( inherited Get(Index));
end;

procedure TFrameList.Put(Index: Integer; const Value: TFrame);
begin
  inherited Put(Index, Value);
end;

destructor TFrameList.Destroy;
var
  I: NativeInt;
begin
  for I := 0 to Count - 1 do
    Items[I].Free;
  inherited;
end;

function TFrameList.Find(const H: THandle): TFrame;
var
  I: NativeInt;
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
