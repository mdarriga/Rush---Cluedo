/*
J'ai empilé cinq livres de Mathématiques.
Les auteurs, les titres, les nombres de pages et les éditeurs sont différents.
Les couvertures des livres ont des couleurs différentes.

On possède les renseignements suivants :
le livre de Walter Rudin a 397 pages ;
le livre jaune est édité par InterEditions ;
le livre « Groupes finis et leurs représentations" » a 142 pages ;
le livre des éditions Nathan a 213 pages ;
l'éditeur de Claude Tisseron est Hermann ;
le livre « Topologie Espaces fonctionnels » est gris ;
le livre « Gödel Escher Bach » a 884 pages ;
le livre de Gérard Rauch est rouge ;
le livre « Analyse réelle et complexe » est orange ;
le livre de « Topologie Espaces fonctionnels » a 319 pages ;
le livre de chez Ellipses est au milieu de la pile ;
le livre de chez Masson est au bas de la pile ;
le livre de 319 pages est sur le sommet de la pile, à côté du livre édité par Nathan ;
le livre de Léonhard Épistemon est à côté du livre « Groupes finis et leurs représentations » ;
le livre de 397 pages est à côté du livre jaune ;
le livre de Douglas Hofstadter est à côté du livre de 319 pages ;
le livre « Algèbre » est au-dessus du livre « Groupes finis et leurs représentations ».

Qui a écrit le livre bleu ?
*/

% Auteur, Pages, Titre, Editeur, couleur

appartient(X, [X|_]).
appartient(X, [_|Ys]) :- appartient(X, Ys).

premier(X, [X|_]).

dernier(X, [_, _, _, _, X]).

a_gauche(X, Y, [X, Y|_]).
a_gauche(X,Y, [_|Zs]) :- a_gauche(X, Y, Zs).

voisin(X, Y, Zs) :- a_gauche(X, Y, Zs).
voisin(X, Y, Zs) :- a_gauche(Y, X, Zs).

milieu(X, [_,_,X,_,_]).

resoudre(Set_final):-
	Set_final = [_, _, _, _, _],

	appartient(livre(walter_rudin, 397, _, _, _), Set_final),
	appartient(livre(_, _, _, inter_editions, jaune), Set_final),
	appartient(livre(_, 142, groupes_finis_et_leur_representations, _, _), Set_final),
	appartient(livre(_, 213, _, nathan, _), Set_final),
	appartient(livre(claude_tisseron, _, _, hermann, _), Set_final),
	appartient(livre(_, _, topologie_espace_fonctionnels, _, gris), Set_final),
	appartient(livre(_, 884, godel_escher_bach, _, _), Set_final),
	appartient(livre(gerard_rauch, _, _, _, rouge), Set_final),
	appartient(livre(_, _, analyse_reelle_et_complexe, _, orange), Set_final),
	appartient(livre(_, 319, topologie_espace_fonctionnels, _, _), Set_final),

	milieu(livre(_, _, _, ellipses, _), Set_final),

	dernier(livre(_, _, _, masson, _), Set_final),

	premier(livre(_, 319, topologie_espace_fonctionnels, _, _), Set_final),

	voisin(livre(_, 319, topologie_espace_fonctionnels, _, _), livre(_, 213, _, nathan, _), Set_final),
	voisin(livre(leonard_epistemon, _, _, _, _), livre(_, 142, groupes_finis_et_leur_representations, _, _), Set_final),
	voisin(livre(_, 397, _, _, _), livre(_, _, _, _, jaune), Set_final),
	voisin(livre(douglas_hofstadter, _, _, _, _), livre(_, 319, _, _, _), Set_final),

	a_gauche(livre(_, _, algebre, _, _), livre(_, _, groupes_finis_et_leur_representations, _, _), Set_final),

	appartient(livre(_, _, _, _, bleu), Set_final).

	qui(Auteur):-
		resoudre(Set_final),
		appartient(livre(Auteur, _, _, _, bleu), Set_final).
