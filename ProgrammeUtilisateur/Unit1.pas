unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFormTraduite = class(TForm)
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
    procedure TraduireTextes; virtual;
  end;

implementation

{$R *.fmx}

uses
  Unit2;

{ TFormTraduite }

constructor TFormTraduite.Create(AOwner: TComponent);
begin
  inherited;
  tthread.ForceQueue(nil,
    procedure
    begin
      TraduireTextes;
    end);
end;

procedure TFormTraduite.TraduireTextes;
var
  i: integer;
begin
  for i := 0 to Componentcount-1 do
    if (components[i] is TPresentedTextControl) then
      (components[i] as TPresentedTextControl).text :=
        _(Name + '.' + components[i].Name,
        (components[i] as TPresentedTextControl).text);
end;

end.
