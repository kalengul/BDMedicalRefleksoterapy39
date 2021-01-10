unit UVivodDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TFDate = class(TForm)
    Vvod: TDateTimePicker;
    BtOk: TButton;
    BtCansel: TButton;
    procedure BtOkClick(Sender: TObject);
    procedure BtCanselClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDate: TFDate;

implementation

Uses UMainForm;

{$R *.dfm}

procedure TFDate.BtOkClick(Sender: TObject);
begin
   With FMain do begin
  ADOSave.Close;
  ADOSave.SQL.Clear;
  ADOSave.SQL.Add('Update TKyrs');
  ADOSave.SQL.Add('Set dateEnd_Kyrs = '+Chr(39)+DateToStr(Vvod.Date)+Chr(39));
  ADOSave.SQL.Add('Where ');
  ADOSave.SQL.Add(' Id_Kyrs = '+FMain.DbKyrs.DataSource.DataSet.Fields[0].AsString+';');
  ADOSave.ExecSQL;
  ADOSave.Open;
  ReBaseKyrs;
  end;
  FDate.Enabled:=false;
  fDate.Visible:=false;
end;

procedure TFDate.BtCanselClick(Sender: TObject);
begin
  FDate.Enabled:=false;
  fDate.Visible:=false;
end;

procedure TFDate.FormActivate(Sender: TObject);
begin
Vvod.Date:=date;
end;

end.
