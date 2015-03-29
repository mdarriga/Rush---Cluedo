%Definition des femmes.
femme(anne).
femme(betty).
femme(eve).
femme(sylvie).
femme(lisa).
femme(julie).
femme(valerie).

%Definition des hommes.
homme(marc).
homme(luc).
homme(jean).
homme(jules).
homme(leon).
homme(loic).
homme(gerard).
homme(paul).
homme(herve).
homme(jacques).

%Definition des mari_de.
mari_de(marc, anne).
mari_de(luc, betty).
mari_de(loic, eve).
mari_de(jules, lisa).
mari_de(leon, sylvie).
mari_de(paul, julie).

%Definition des femme_de
femme_de(FEMME, MARI) :- femme(FEMME), homme(MARI), mari_de(MARI, FEMME).

%Definition des enfant_de
enfant_de(jean, marc).
enfant_de(jules, marc).
enfant_de(leon, marc).
enfant_de(lisa, luc).
enfant_de(loic, luc).
enfant_de(gerard, luc).
enfant_de(jacques, jules).
enfant_de(herve, leon).
enfant_de(julie, leon).
enfant_de(paul, loic).
enfant_de(valerie, loic).
enfant_de(ENFANT, FEMME) :- femme_de(FEMME, MARI), enfant_de(ENFANT, MARI).

%Definition des beaux peres.
beaupere_de(BEAUPERE, BEAUFILS) :- mari_de(BEAUFILS, FEMME), enfant_de(FEMME, BEAUPERE).
beaupere_de(BEAUPERE, BELLEFILLE) :- femme_de(BELLEFILLE, MARI), enfant_de(MARI, BEAUPERE).

%Definition des belles meres.
bellemere_de(BELLEMERE, ENFANT) :- femme_de(BELLEMERE, MARI), beaupere_de(MARI, ENFANT).

%Definition des ancetre_de.
ancetre_de(ANCETRE, PROGENITURE) :- enfant_de(PROGENITURE, ANCETRE).
ancetre_de(ANCETRE, PROGENITURE_2) :- enfant_de(PROGENITURE_2, PROGENITURE), ancetre_de(ANCETRE, PROGENITURE).
