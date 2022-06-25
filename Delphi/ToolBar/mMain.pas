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
    { Private �錾 }
    FEditorHandle: THandle;
  public
    { Public �錾 }
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
// �t�H�[��������

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FEditorHandle := ParentWindow;
end;

// -----------------------------------------------------------------------------
// �t�H�[���j����

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  //
end;

// -----------------------------------------------------------------------------
// �c�[���{�^���N���b�N��

procedure TMainForm.ToolButton1Click(Sender: TObject);
begin
  Editor_Insert(FEditorHandle, PChar(TToolButton(Sender).Caption));
end;

end.
