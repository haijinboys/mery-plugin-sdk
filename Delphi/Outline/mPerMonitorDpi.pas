// -----------------------------------------------------------------------------
// Copyright (c) Kuro. All rights reserved.
// Licensed under the MIT License.
// -----------------------------------------------------------------------------

unit mPerMonitorDpi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms;

type
  TScaledForm = class(TForm)
  private
    { Private êÈåæ }
    class var FDefaultFont: TFont;
    class constructor Create;
    class destructor Destroy;
    class procedure SetDefaultFont(const Value: TFont); static;
  protected
    { Protected êÈåæ }
    procedure DoShow; override;
  public
    { Public êÈåæ }
    class property DefaultFont: TFont read FDefaultFont write SetDefaultFont;
  end;

implementation

{ TScaledForm }

class constructor TScaledForm.Create;
begin
  FDefaultFont := TFont.Create;
end;

class destructor TScaledForm.Destroy;
begin
  if Assigned(FDefaultFont) then
    FreeAndNil(FDefaultFont);
end;

procedure TScaledForm.DoShow;
var
  LFont: TFont;
begin
  LFont := TFont.Create;
  try
    with LFont do
    begin
      Assign(FDefaultFont);
      Height := MulDiv(Height, Self.PixelsPerInch, Screen.PixelsPerInch);
    end;
    with Font do
      if (Name <> LFont.Name) or (Height <> LFont.Height) or (Charset <> LFont.Charset) then
      begin
        Self.ChangeScale(Abs(LFont.Height), Abs(Height));
        Assign(LFont);
      end;
  finally
    LFont.Free;
  end;
  inherited;
end;

class procedure TScaledForm.SetDefaultFont(const Value: TFont);
begin
  FDefaultFont.Assign(Value);
end;

end.
