unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, ExtCtrls, jpeg, Menus, ComCtrls,mmSystem;

type
  TForm1 = class(TForm)
    Matrice: TStringGrid;
    Inistial: TButton;
    Quitter: TButton;
    Narutu: TImage;
    Etat: TLabel;
    Label1: TLabel;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    Fichier1: TMenuItem;
    Aide1: TMenuItem;
    Quitter1: TMenuItem;
    LesRegles1: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    procedure QuitterClick(Sender: TObject);
    procedure InistialClick(Sender: TObject);
    procedure ChoixCOL(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Redessiner(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure Quitter1Click(Sender: TObject);
    procedure LesRegles1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MatriceClick(Sender: TObject);

  private


  public

  end;

var
  Form1: TForm1;
  partie_en_cours : boolean;


implementation

uses Unit3;

///////////////////////////////////// constante et type tablaua :)

const maxcol = 6;
      maxlig = 5;

type tableau = array[0..maxcol,0..maxlig] of string;


   //////////////////////////////  on comance el 5edma :)

        ///////  1 - > transformer tableau graf to tableau array :)
function Convertir : tableau;
var i,j : integer;
    t : tableau;
begin
  for i:=0 to maxcol do
    for j:=0 to maxlig do
      t[i,j] := Form1.Matrice.Cells[i,j];   // "Matrice.Cells" -> : M[i,j]
  Convertir := t;
end;
 //_____________________________________________________________________________

      ///// 2 - > nombre des cases libre fi kol colone " pour chaque colone " :)
function nbr_CasesVidesDansColonne (t : tableau ; col : integer) : integer;
var j,compt:integer;
Begin
  compt:=0;
    for j:=0 to maxlig do
      if (t[col,j]='') then compt:=compt+1;
  nbr_CasesVidesDansColonne := compt;
end;
//______________________________________________________________________________

  ////3 - > si ch1 = o passer o dans colon col , si ch = x passer x dans col :)
function AppliqueCoupJoueurDansColonne (t : tableau ; ch1 : string ; col : integer) : tableau;
begin
  t[col,nbr_CasesVidesDansColonne(t,col)-1] := ch1;
  AppliqueCoupJoueurDansColonne := t;
end;
 //// 4 - > test existe ligne verical horizental ou diagolan , bien linge 4
                            ///foto 1 :)
           // gagne si 4(1,0) ou 4(1,1) ou 4(0,1) ou 4(1,-1)
                    /// horize   diago1    vertcal   diago2
                    /// bonni   vert       a7mer     viole
                    //   foto 2 :)
function TestExisteLigneDeQuatre(t : tableau ; ch1 : string ; col,lig,x,y : integer) : boolean;
var i,maxx,maxy : integer;
Begin
  maxx := col+3*x;
  maxy := lig+3*y;
  if (maxx>maxcol) or (maxx<0) or (maxy>maxlig) or (maxy<0)
  then TestExisteLigneDeQuatre := false
  else begin
    i := 0;
    while ((i<4) and (t[col+i*x,lig+i*y]=ch1)) do i:=i+1;
    TestExisteLigneDeQuatre := (i=4);
  end;
end;
///_____________________________________________________________________________

         ////  5 - > teste si (ch = o ou x )  gagne  :)
function TestVictoire (situation : tableau ; ch1 : string) : boolean;
var col,lig : integer;
    gagne   : boolean;
begin
  gagne := false;
  col   := 0;
  while ((col<=maxcol) and (not(gagne))) do begin
    lig   := 0;
    while ((lig<=maxlig) and (not(gagne))) do begin
                // gagne si 4(1,0) ou 4(1,1) ou 4(0,1) ou 4(1,-1)
                    /// horize   diago1    vertcal   diago2
                    /// bonni   vert       a7mer     viole
                    //   foto 2 :)
      gagne := (TestExisteLigneDeQuatre(situation,ch1,col,lig,1,0)
             or TestExisteLigneDeQuatre(situation,ch1,col,lig,1,1)
             or TestExisteLigneDeQuatre(situation,ch1,col,lig,0,1)
             or TestExisteLigneDeQuatre(situation,ch1,col,lig,1,-1));
      lig := lig+1;
    end;
    col := col + 1;
  end;
  TestVictoire := gagne;
end;

 ///_____________________________________________________________________________

   /////        6 - > pour calcuer intere  ch (=o ou x) pour
        ///        si 4(1,0) ou 4(1,1) ou 4(0,1) ou 4(1,-1)
                    /// horize   diago1    vertcal   diago2
                    /// bonni   vert       a7mer     viole
                    //   foto 2 :)
function InteretCh1DansDirection(t : tableau ; ch1 : string ; col,lig,x,y : integer) : integer;
var i,maxx,maxy : integer;
    ch2     : string;
Begin
  maxx := col+3*x;
  maxy := lig+3*y;
  if (maxx>maxcol) or (maxx<0) or (maxy>maxlig) or (maxy<0)
  then InteretCh1DansDirection := 0
  else begin
    if (ch1='o')
    then ch2 := 'x'
    else ch2 := 'o';
    i    := 0;
    while ((i<4) and (t[col+i*x,lig+i*y]<>ch2)) do begin
      i:=i+1;
    end;
    if (i=4) then InteretCh1DansDirection := 1
    else InteretCh1DansDirection := 0;
  end;
end;
function InteretCh1Case (t : tableau ; ch1 : string ; col,lig : integer) : integer;
begin
  InteretCh1Case :=
    + InteretCh1DansDirection(t,ch1,col,lig,1,0)
    + InteretCh1DansDirection(t,ch1,col,lig,1,1)
    + InteretCh1DansDirection(t,ch1,col,lig,0,1)
    + InteretCh1DansDirection(t,ch1,col,lig,1,-1);
end;
 //________________________________________________________________________________


 // 7 - >  just boucle pour copmte tt les intere de chaque case
function InteretCh1Tableau (t : tableau ; ch1 : string) : integer;
var i,j,compt:integer;
Begin
compt:=0;
  for i:=0 to maxcol do
    for j:=0 to maxlig do
      compt := compt+InteretCh1Case(t,ch1,i,j);
  InteretCh1Tableau := compt;
end;
        /// 8 - > ( interr o - interr x)
function Evaluation (s : tableau) : integer;
begin
  Evaluation := InteretCh1Tableau (s,'o') - InteretCh1Tableau (s,'x');
end;

////__________________________________________________________________


     ////8 - >  ValeurMinMax  :: implenter l'algorithme min max
        //// avec profendeur = 3 ;
        ////   just traduire algorithme en pascal et ajoutent :::
        ///// si gagne o donc +1 // si gagne x donc -1
                  // foto 3 :)
function ValeurMinMax (s : tableau ; prof : integer ; test : boolean) : integer;
var i,score,bscore : integer;
begin
  if TestVictoire(s,'o')      then ValeurMinMax := +10000000
    else if TestVictoire(s,'x') then ValeurMinMax := -10000000
           else if (prof=0)then ValeurMinMax := Evaluation(s)
                  else begin
                            if (test) then begin
                              bscore   := -10001;
                              for i:=0 to maxcol do begin
                                   if (nbr_CasesVidesDansColonne(s,i) <> 0) then begin
                                       score := ValeurMinMax(AppliqueCoupJoueurDansColonne(s,'o',i),prof-1,false);
                                       if (score > bscore) then bscore   := score;
                                    end;
                              end;
                          ValeurMinMax := bscore;
                           end
                           else begin
                                 bscore   := 10001;
                                  for i:=0 to maxcol do begin
                                  if (nbr_CasesVidesDansColonne(s,i) <> 0) then begin
                                         score := ValeurMinMax(AppliqueCoupJoueurDansColonne(s,'x',i),prof-1,true);
                                         if (score < bscore) then bscore := score;
                                    end;
                            end;
                            ValeurMinMax := bscore;
                  end;
            end;
end;
       /// pmax = profmax = 3 ;
function DecisionMinMax (s : tableau ; profmax : integer) : integer;
var i,score,candidat,bscore : integer;

begin
  candidat := -1; // des valeur negative pour inisialisation  et le remplace par min val ... :)
  bscore   := -10001;
  for i:=0 to maxcol do begin
    if (nbr_CasesVidesDansColonne(s,i) <> 0) then begin
      Form1.Etat.Refresh;    /// comme F5
      score := ValeurMinMax(AppliqueCoupJoueurDansColonne (s,'o',i),profmax,false);
      if (score > bscore) then begin
        bscore   := score;
        candidat := i;
      end;
    end;
  end;
  DecisionMinMax := candidat;
end;
{$R *.DFM}

//___________________________________________________________

//////<>>>><<<>>>>>><>>>>>>>><<<<<<<<<<<<><<<<>>>>>

procedure TForm1.QuitterClick(Sender: TObject);
begin
  close;
end;
procedure FaireTomberPion (var s : tableau ; col : integer ; ch1 : string);
var dest : integer;
begin
  dest := nbr_CasesVidesDansColonne(s,col)-1;
  form1.matrice.cells[col,dest] := ch1;
  s := AppliqueCoupJoueurDansColonne(s,ch1,col);
end;
procedure TForm1.InistialClick(Sender: TObject);
var col,lig:integer;
begin
Inistial.Visible:=false ;
   for col:=0 to maxcol do
     for lig:=0 to maxlig do
       matrice.cells[col,lig]:='';
   partie_en_cours := true;

end;
procedure TForm1.ChoixCOL(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
var
    situation : tableau;
begin
  if (partie_en_cours) then begin
    situation := Convertir;
    if (nbr_CasesVidesDansColonne(situation,Acol) <> 0) then
    begin
       FaireTomberPion(situation,Acol,'x');
       if TestVictoire(situation,'x') then begin
         Etat.caption:='Tu as gagné !!!';
         partie_en_cours := false;
       end
       else begin
                          Acol := DecisionMinMax(situation,3);
          FaireTomberPion(situation,Acol,'o');
          if TestVictoire(situation,'o') then begin
            Etat.caption:='Tu as perdu...';
            partie_en_cours := false;
          end;
       end;
    end;
  end;
end;
///// par internet   --------  <'_'>
procedure TForm1.Redessiner(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if Matrice.Cells[ACol,ARow] = 'x'
  then  begin
        Matrice.Canvas.Brush.Color:= clblue;
        matrice.Canvas.ellipse(rect)
        end;

  if matrice.Cells[ACol,ARow] = 'o'
  then  begin
        matrice.Canvas.Brush.Color:= clred;
        matrice.Canvas.ellipse(rect)
        end;
end;
{ Initialisations de début de programme }
procedure TForm1.Quitter1Click(Sender: TObject);
begin
close;
end;

procedure TForm1.LesRegles1Click(Sender: TObject);
begin
Form3.visible:=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
sndPlaySound('C:\Program Files (x86)\AlibiMouradPuissance4\aa.wav', SND_LOOP or SND_ASYNC);

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Form3.visible:=true;
end;

procedure TForm1.MatriceClick(Sender: TObject);
begin
Inistial.Visible:=true ;
end;

initialization

  randomize;
  partie_en_cours := true;

end.
