/* On définit ici, les variables qui serviront ci-dessous pour limiter le nombre de lignes à faire */
change(e,o).
change(o,e).

/* Cas ou l'on déplace le loup avec le fermier */
move([X,X,Chevre,Chou],loup,[Y,Y,Chevre,Chou]) :- change(X,Y).

/* Cas ou l'on déplace la chèvre avec le fermier */
move([X,Loup,X,Chou],chevre,[Y,Loup,Y,Chou]) :- change(X,Y).

/* Cas ou l'on déplace le chou avec le fermier */
move([X,Loup,Chevre,X],chou,[Y,Loup,Chevre,Y]) :- change(X,Y).

/* Cas ou l'on se déplace seul */
move([X,Loup,Chevre,Chou],personne,[Y,Loup,Chevre,Chou]) :- change(X,Y).

/* Ici, on regarde que le fermier soit toujours avec les éléments sensibles du problème */
memeRive(X,X,_).
memeRive(X,_,X).

/* Cette ligne teste la condition qui fait que tout est sûr pour le mouvement */
safe([Fermier,Loup,Chevre,Chou]) :- memeRive(Fermier,Chevre,Loup), memeRive(Fermier,Chevre,Chou).

/* Appel de la fonction de résolution de notre problème si déjà au bon endroit*/
solution([e,e,e,e],[]).

/* Appel de la fonction de résolution, déroulement de notre algo récurssif */
solution(Etat,[Bouge|AutresMouv]) :-
move(Etat,Bouge,SuivantEtat),
safe(SuivantEtat),
solution(SuivantEtat,AutresMouv).
