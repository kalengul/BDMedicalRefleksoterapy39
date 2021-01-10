unit UChangePolis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFChangePolis = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    EdOldPolis: TEdit;
    EdNewPolis: TEdit;
    BtChange: TButton;
    procedure BtChangeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FChangePolis: TFChangePolis;

implementation

{$R *.dfm}

procedure TFChangePolis.BtChangeClick(Sender: TObject);
begin
FChangePolis.Close;
end;

end.
