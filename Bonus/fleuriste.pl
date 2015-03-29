/* Dans le village, il n'y a que 5 maisons, toutes habitées.

Chaque personnage n'habite qu'une maison, n'a qu'une profession, ne boit qu'une seule boisson et n'a qu'une nationalité.

Les 5 maisons sont alignées.
L'Anglais habite la maison rouge.
L'Espagnol est cultivateur.
L'habitant de la maison verte boit du café.
Le Suisse boit du thé.
La maison verte est située immédiatement à droite de la maison blanche.
Bernard est professeur de russe.
Paul habite la maison jaune.
Le buveur de lait habite la maison du milieu.
Le Français habite la première maison à partir de la gauche.
Jacques habite la maison mitoyenne du dentiste.
Le boucher habite la maison mitoyenne de Paul.
Henri boit du cidre.
André est Italien.
Le Français habite à côté de la maison orange.

Qui boit de l'eau ? Qui est fleuriste ? */

%Maison, profession, boisson, nationalité, prenom

appartient(X, [X|_]).
appartient(X, [_|Ys]) :- appartient(X, Ys).

premiere(X, [X|_]).

a_gauche(X, Y, [X, Y|_]).
a_gauche(X,Y, [_|Zs]) :- a_gauche(X, Y, Zs).

voisin(X, Y, Zs) :- a_gauche(X, Y, Zs).
voisin(X, Y, Zs) :- a_gauche(Y, X, Zs).

milieu(X, [_,_,X,_,_]).

resoudre(Set_final):-
	Set_final = [_,_,_,_,_],

	appartient(maison(rouge, _, _, anglais, _), Set_final),
	appartient(maison(_, cultivateur, _, espagnol, _), Set_final),
	appartient(maison(verte, _, cafe, _, _), Set_final),
	appartient(maison(_, _, the, suisse, _), Set_final),

	a_gauche(maison(blanche, _, _, _, _), maison(verte, _, _, _, _), Set_final),

	appartient(maison(_, professeur_de_russe, _, _, bernard), Set_final),
	appartient(maison(jaune, _, _, _, paul), Set_final),

	milieu(maison(_, _, lait, _, _), Set_final),

	premiere(maison(_, _, _, francais, _), Set_final),

	voisin(maison(_, _, _, _, jacques), maison(_, dentiste, _, _, _), Set_final),
	voisin(maison(_, boucher, _, _, _), maison(_, _, _, _, paul), Set_final),

	appartient(maison(_, _, cidre, _, henri), Set_final),
	appartient(maison(_, _, _, italien, andre), Set_final),

	voisin(maison(_, _, _, francais, _), maison(orange, _, _, _, _), Set_final),

	appartient(maison(_, fleuriste, _, _, _), Set_final),
	appartient(maison(_, _, eau, _, _), Set_final).

	qui(Buveur, Profession):-
		resoudre(Set_final),
		appartient(maison(_, fleuriste, _, _, Profession), Set_final),
		appartient(maison(_, _, eau, _, Buveur), Set_final).
