unit Native;

interface

uses
{$IF CompilerVersion > 22.9}
  Winapi.Windows;
{$ELSE}
  Windows;
{$IFEND}


type
  NativeIntArray = array [0 .. $EFFFFFF] of NativeInt;

  PNativeIntArray = ^NativeIntArray;

  PNativePoint = ^TNativePoint;

  TNativePoint = record
    X: NativeInt;
    Y: NativeInt;
  end;

function NativePoint(X, Y: NativeInt): TNativePoint; overload;
function NativePoint(const Value: TPoint): TNativePoint; overload;
function Point(const Value: TNativePoint): TPoint; overload;

implementation

function NativePoint(X, Y: NativeInt): TNativePoint;
begin
  Result.X := X;
  Result.Y := Y;
end;

function NativePoint(const Value: TPoint): TNativePoint;
begin
  Result.X := Value.X;
  Result.Y := Value.Y;
end;

function Point(const Value: TNativePoint): TPoint;
begin
  Result.X := Value.X;
  Result.Y := Value.Y;
end;

end.
