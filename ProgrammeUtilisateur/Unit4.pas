unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Unit1, FMX.Controls.Presentation;

type
  TFiche2 = class(TFormTraduite)
    Label1: TLabel;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure TraduireTextes; override;
  end;

var
  Fiche2: TFiche2;

implementation

{$R *.fmx}

uses Unit2;

{ TFiche2 }

procedure TFiche2.TraduireTextes;
begin
  inherited;
  caption := GetLangue;
end;

end.
