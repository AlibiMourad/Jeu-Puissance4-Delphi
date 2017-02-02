unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls , mmSystem;
type
  TForm3 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
begin

  label2.Caption:='Le but du jeu est d_aligner 4 pions sur une grille comptant';
  label2.Caption:=label2.Caption+' 6 rangées et 7 colonnes. Chaque joueur '#13#10'' ;
  label2.Caption:=label2.Caption+'dispose de 21 pions du couleur   ' ;
   label2.Caption:=label2.Caption+' vert et rouge.'#13#10'' ;
   label2.Caption:=label2.Caption+'Tour à tour les deux joueurs placent '  ;
   label2.Caption:=label2.Caption+'un pion dans la colonne de leur choix, '#13#10'' ;
   label2.Caption:=label2.Caption+'le pion coulisse alors jusqu_à la position' ;
  label2.Caption:=label2.Caption+' la plus basse possible dans la dite colonne'#13#10'';
  label2.Caption:=label2.Caption+'à la suite de quoi c_est à l_adversaire de ';
  label2.Caption:=label2.Caption+' jouer. Le vainqueur est le joueur qui '#13#10'';
 label2.Caption:=label2.Caption+' réalise le premierun alignement (horizontal,';
 label2.Caption:=label2.Caption+' vertical ou diagonal) d_au moins quatre pions'#13#10'';
label2.Caption:=label2.Caption+'de sa couleur. Si, alors que toutes les cases ';
label2.Caption:=label2.Caption+' de la grille de jeu sont remplies, aucun'#13#10' ';
label2.Caption:=label2.Caption+'des deux joueurs n_a réalisé un tel alignement,';
 label2.Caption:=label2.Caption+'la partie est déclarée nulle.'#13#10'';
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
close;
end;

end.
