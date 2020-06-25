unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Unit1, FMX.Edit, FMX.Controls.Presentation;

type
  TForm1 = class(TFormTraduite)
    Label1: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure TraduireTextes; override;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses Unit2, Unit4;

procedure TForm1.Button1Click(Sender: TObject);
begin
  showmessage(_('hw', 'Hello World'));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ChangeLangue('fr');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ChangeLangue('en');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Fiche2.Show;
end;

procedure TForm1.TraduireTextes;
begin
  inherited;
  Button1.Text := _('xx', 'MonBouton');
end;

end.
