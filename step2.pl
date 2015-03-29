%couleur, nationnalite, animal, boisson, cigare

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

	appartient(maison(rouge, anglais, _, _, _), Set_final),
	appartient(maison(_, suedois, chien, _, _), Set_final),
	appartient(maison(_, danois, _, the, _), Set_final),

	a_gauche(maison(verte, _, _, _, _), maison(blanche, _, _, _, _), Set_final),

	appartient(maison(verte, _, _, cafe, _), Set_final),
	appartient(maison(_, _, oiseaux, _, pall_mall), Set_final),
	appartient(maison(jaune, _, _, _, dunhill), Set_final),

	milieu(maison(_, _, _, lait, _), Set_final),

	premiere(maison(_, norvegien, _, _, _), Set_final),

	voisin(maison(_, _, _, _, blend), maison(_, _, chat, _, _), Set_final),
	voisin(maison(_, _, cheval, _, _), maison(_, _, _, _, dunhill), Set_final),

	appartient(maison(_, _, _, biere, blue_master), Set_final),
	appartient(maison(_, allemand, _, _, prince), Set_final),

	voisin(maison(_, norvegien, _, _, _), maison(bleue, _, _, _, _), Set_final),
	voisin(maison(_, _, _, _, blend), maison(_, _, _, eau, _), Set_final),

	appartient(maison(_, _, poisson, _, _), Set_final).

qui(Proprietaire) :-
	resoudre(Set_final),
	appartient(maison(_, Proprietaire, poisson, _, _), Set_final).
