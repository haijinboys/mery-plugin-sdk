unit mMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, mPerMonitorDpi;

type
  TMainForm = class(TScaledForm)
    PopupMenu: TPopupMenu;
    PropMenuItem: TMenuItem;
    Memo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PropMenuItemClick(Sender: TObject);
  private
    { Private 宣言 }
    FEditor: THandle;
    FBarPos: NativeInt;
    FUpdateCustomBar: Boolean;
  public
    { Public 宣言 }
    procedure CustomBarAll;
    procedure SetScale(const Value: NativeInt);
    function SetProperties: Boolean;
    property BarPos: NativeInt read FBarPos write FBarPos;
    property UpdateCustomBar: Boolean read FUpdateCustomBar write FUpdateCustomBar;
    property Editor: THandle read FEditor write FEditor;
  end;

var
  MainForm: TMainForm;

implementation

uses
  mPlugin, mProp;

{$R *.dfm}

{ TMainForm }

// -----------------------------------------------------------------------------
// フォーム生成時

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FEditor := ParentWindow;
  FUpdateCustomBar := False;
end;

// -----------------------------------------------------------------------------
// フォーム破棄時

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  //
end;

// -----------------------------------------------------------------------------
// プロパティクリック時

procedure TMainForm.PropMenuItemClick(Sender: TObject);
begin
  SetProperties;
end;

// -----------------------------------------------------------------------------
// カスタムバー更新

procedure TMainForm.CustomBarAll;
begin
  //
end;

// -----------------------------------------------------------------------------
// スケール設定

procedure TMainForm.SetScale(const Value: NativeInt);
var
  P: NativeInt;
begin
  P := PixelsPerInch;
  PixelsPerInch := Value;
  with Font do
    Height := MulDiv(Height, Self.PixelsPerInch, P);
end;

// -----------------------------------------------------------------------------
// プロパティ設定

function TMainForm.SetProperties: Boolean;
begin
  Result := False;
  if Prop(Self, FBarPos) then
  begin
    FUpdateCustomBar := True;
    Result := True;
  end;
end;

end.
