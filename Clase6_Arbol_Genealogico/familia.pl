% Código - Árbol Genealógico
% Carga la base de conocimiento de Valle Verde
:- [familia_valle_verde].

% Reglas
abuelo(Abuelo, Nieto) :- padre(Abuelo, Padre), padre(Padre, Nieto).
abuelo(Abuelo, Nieto) :- padre(Abuelo, Madre), madre(Madre, Nieto).
abuela(Abuela, Nieto) :- madre(Abuela, Padre), padre(Padre, Nieto).
abuela(Abuela, Nieto) :- madre(Abuela, Madre), madre(Madre, Nieto).

hermano(Persona1, Persona2) :- padre(P, Persona1), padre(P, Persona2), Persona1 \= Persona2.
hermano(Persona1, Persona2) :- madre(M, Persona1), madre(M, Persona2), Persona1 \= Persona2.

tio(Tio, Sobrino) :- hermano(Tio, Padre), padre(Padre, Sobrino).
tio(Tio, Sobrino) :- hermano(Tio, Madre), madre(Madre, Sobrino).
tia(Tia, Sobrino) :- hermana(Tia, Padre), padre(Padre, Sobrino).
tia(Tia, Sobrino) :- hermana(Tia, Madre), madre(Madre, Sobrino).

hermana(Persona1, Persona2) :- hermano(Persona1, Persona2), trabaja_en(Persona1, _), trabaja_en(Persona2, _), Persona1 \= Persona2.

% Relación de primos
primos(Persona1, Persona2) :- primo(Persona1, Persona2).

% Amigo de un primo
es_amigo_de_primo(Persona, Primo) :- primo(Persona, X), amigo(X, Primo).
