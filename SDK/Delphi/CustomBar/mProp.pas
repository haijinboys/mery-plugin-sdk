unit mProp;

interface

uses
{$IF CompilerVersion > 22.9}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls,
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
{$IFEND}
  mMain;

type
  TPropForm = class(TForm)
    BarPosLabel: TLabel;
    BarPosComboBox: TComboBox;
    Bevel: TBevel;
    OKButton: TButton;
    CancelButton: TButton;
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

function Prop(AOwner: TComponent; var APos: NativeInt): Boolean;

var
  PropForm: TPropForm;

implementation

{$R *.dfm}


function Prop(AOwner: TComponent; var APos: NativeInt): Boolean;
begin
  with TPropForm.Create(AOwner) do
    try
      BarPosComboBox.ItemIndex := APos;
      Result := ShowModal = mrOk;
      if Result then
        APos := BarPosComboBox.ItemIndex;
    finally
      Release;
    end;
end;

end.
