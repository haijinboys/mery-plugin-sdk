unit mMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ToolWin, Vcl.ComCtrls;

type
  TMainForm = class(TForm)
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private 宣言 }
    FEditorHandle: THandle;
  public
    { Public 宣言 }
  end;

function GetIniFileName(var FileName: string): Boolean;

var
  MainForm: TMainForm;

implementation

uses
  mCommon, mPlugin;

{$R *.dfm}


function GetIniFileName(var FileName: string): Boolean;
var
  S, T: string;
begin
  FileName := '';
  if GetAppIniFileName(S) then
  begin
    T := ChangeFileExt(ExtractFileName(GetModuleName(HInstance)), '');
    FileName := ExtractFilePath(S) + 'Plugins\' + T + '\' + T + '.ini';
    Result := ForceDirectories(ExtractFileDir(FileName));
  end
  else
    Result := False;
end;

{ TMainForm }

// -----------------------------------------------------------------------------
// フォーム生成時

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FEditorHandle := ParentWindow;
end;

// -----------------------------------------------------------------------------
// フォーム破棄時

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  //
end;

// -----------------------------------------------------------------------------
// ツールボタンクリック時

procedure TMainForm.ToolButton1Click(Sender: TObject);
begin
  Editor_Insert(FEditorHandle, PChar(TToolButton(Sender).Caption));
end;

end.
