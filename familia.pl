% Base de conocimiento extraída de la narrativa de Valle Verde

% Hechos
vive_en(ernesto, valle_verde).
vive_en(teresa, valle_verde).
vive_en(ana, valle_verde).
vive_en(miguel, valle_verde).
vive_en(rosa, valle_verde).
vive_en(fernanda, valle_verde).
vive_en(carmen, valle_verde).
vive_en(felipe, valle_verde).

vive_en(carlos, ciudad).
vive_en(sofia, ciudad).
vive_en(mateo, ciudad).
vive_en(valeria, ciudad).
vive_en(ricardo, ciudad).
vive_en(laura, ciudad).
vive_en(daniel, ciudad).
vive_en(lucia, ciudad).
vive_en(isabel, ciudad).

trabaja_en(ernesto, maestro).
trabaja_en(teresa, enfermera).
trabaja_en(carlos, ingeniero_civil).
trabaja_en(sofia, arquitecta).
trabaja_en(ana, profesora_matematicas).
trabaja_en(ricardo, abogado).
trabaja_en(laura, bibliotecaria).
trabaja_en(lucia, estudiante_medicina).
trabaja_en(fernanda, estudiante_biologia).
trabaja_en(isabel, estudiante_derecho).
trabaja_en(miguel, agricultor).
trabaja_en(rosa, administradora_tienda).
trabaja_en(felipe, comerciante).

casado_con(ernesto, teresa).
casado_con(teresa, ernesto).
casado_con(carlos, sofia).
casado_con(sofia, carlos).
casado_con(ricardo, laura).
casado_con(laura, ricardo).
casado_con(miguel, rosa).
casado_con(rosa, miguel).

padre(ernesto, carlos).
padre(ernesto, ana).
padre(ernesto, lucia).
padre(carlos, mateo).
padre(carlos, valeria).
padre(ricardo, daniel).
padre(miguel, fernanda).
padre(felipe, joaquin).

madre(teresa, carlos).
madre(teresa, ana).
madre(teresa, lucia).
madre(sofia, mateo).
madre(sofia, valeria).
madre(ana, andres).
madre(laura, daniel).
madre(rosa, fernanda).

hijo(carlos, ernesto).
hijo(ana, ernesto).
hijo(lucia, ernesto).
hijo(mateo, carlos).
hijo(valeria, carlos).
hijo(andres, ana).
hijo(daniel, ricardo).
hijo(fernanda, miguel).
hijo(joaquin, felipe).

amigo(carlos, ricardo).
amigo(ricardo, carlos).
amigo(mateo, daniel).
amigo(daniel, mateo).
amigo(mateo, valeria).
amigo(valeria, mateo).
amigo(andres, joaquin).
amigo(joaquin, andres).
amigo(fernanda, isabel).
amigo(isabel, fernanda).

primo(andres, mateo).
primo(andres, valeria).
primo(mateo, andres).
primo(valeria, andres).
primo(fernanda, andres).
primo(andres, fernanda).
primo(fernanda, mateo).
primo(mateo, fernanda).
primo(fernanda, valeria).
primo(valeria, fernanda).
primo(mateo, valeria).
primo(valeria, mateo).
primo(daniel, mateo).
primo(mateo, daniel).
primo(daniel, valeria).
primo(valeria, daniel).

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
