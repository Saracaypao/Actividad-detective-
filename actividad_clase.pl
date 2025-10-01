% Parte 1  Hechos basicos

%Hechos basicos
cocina(ana).
estudia(maria).
trabaja(juan).
juega(pedro).
descansa(sofia).

% Amigos
amigo(juan, ana).
amigo(juan, maria).

% Familiares
hermano(ana, pedro).
hermano(pedro, ana).

primo(maria, sofia).
primo(sofia, maria).

trabajan_juntos(pedro, sofia).
estudian_juntos(maria, juan).

% Semana
dia(lunes). dia(martes). dia(miercoles). dia(jueves). dia(viernes).
dia(sabado). dia(domingo).

entre_semana(lunes).
entre_semana(martes).
entre_semana(miercoles).
entre_semana(jueves).
entre_semana(viernes).

fin_de_semana(sabado).
fin_de_semana(domingo).

% Rutinas por dia 
actividad(ana, D, cocinar) :- dia(D), \+ cansada(ana, D).

% Juan estudia entre semana y descansa fines de semana.
actividad(juan, D, estudiar) :- entre_semana(D).
actividad(juan, D, descansar) :- fin_de_semana(D).

% Pedro trabaja de lunes a viernes y juega los sábados.
actividad(pedro, D, trabajar) :- entre_semana(D).
actividad(pedro, sabado, jugar).

% Sofía trabaja en la tienda y estudia idiomas por las noches 
actividad(sofia, D, trabajar) :- dia(D).
actividad_nocturna(sofia, D, estudiar) :- dia(D).

% María estudia en la universidad y descansa los domingos.
actividad(maria, D, estudiar) :- dia(D), D \= domingo.
actividad(maria, domingo, descansar).

% Parte 2  Reglas

% actividad/1 es verdadera si X realiza alguna de las actividades básicas.
actividad(X) :-
    cocina(X);
    estudia(X);
    trabaja(X);
    juega(X).

% descansa/2: Verdadera si una persona no tiene otra actividad declarada para ese día.
% Caso explícito: cuando actividad/3 indica 'descansar'.
% Caso por defecto: si no existe ninguna actividad/3 para ese día.
descansa(P, D) :-
    actividad(P, D, descansar), !.
descansa(P, D) :-
    dia(D),
    \+ actividad(P, D, _).

% familia/2: parentesco directo (hermanos o primos), en ambos sentidos.
familia(X, Y) :-
    hermano(X, Y);
    hermano(Y, X);
    primo(X, Y);
    primo(Y, X).

% Parte 3 Reglas recursivas

% (A) Amistad (directa e indirecta)
% Base (caso base): hay amistad directa (en algún sentido).
amistad_directa(X, Y) :-
    amigo(X, Y);
    amigo(Y, X).

% Caso base: X e Y son amigos directos (amistad_directa/2)
% Caso general: existe Z tal que X es amigo directo de Z y Z está conectado (recursivamente) con Y.
es_amigo(X, Y) :-
    X \= Y,
    camino_amigos(X, Y, [X]).

camino_amigos(X, Y, _) :-
    X \= Y,
    amistad_directa(X, Y).
camino_amigos(X, Y, Visitados) :-
    X \= Y,
    amistad_directa(X, Z),
    Z \= X,
    \+ miembro(Z, Visitados),
    camino_amigos(Z, Y, [Z|Visitados]).

% Caso base: el elemento coincide con la cabeza.
% Caso general: el elemento está en la cola.
miembro(X, [X|_]).
miembro(X, [_|T]) :-
    miembro(X, T).

% Caso base: la inversa de la lista vacía es la lista vacía.
% Caso general: invertir la cola y luego pegar la cabeza al final.
invertir([], []).
invertir([H|T], R) :-
    invertir(T, RT),
    append(RT, [H], R).

% Parte 5 Extención creativa 

% Nuevo personaje: luis
% Relaciones y rutinas:
amigo(luis, pedro).   % luis es amigo de pedro
amigo(sofia, luis).   % sofia y luis son amigos

% Rutina de luis:
%   - Lunes a miércoles: estudia
%   - Jueves y viernes: trabaja
%   - Sábado: juega
%   - Domingo: descansa
actividad(luis, D, estudiar) :- miembro(D, [lunes, martes, miercoles]).
actividad(luis, D, trabajar) :- miembro(D, [jueves, viernes]).
actividad(luis, sabado, jugar).
actividad(luis, domingo, descansar).

% Caso base: X y Y están conectidos por un sola relación (amigos directos o familia).
% Caso general: existe Z tal que X se conecta con Z por una relación (amigos/familia) y Z se conecta recursivamente con Y, evitando visitar nodos ya vistos.
cadena_social(X, Y) :-
    X \= Y,
    cadena_social_(X, Y, [X]).

cadena_social_(X, Y, _) :-
    X \= Y,
    ( amistad_directa(X, Y)
    ; familia(X, Y)
    ).
cadena_social_(X, Y, Visitados) :-
    X \= Y,
    ( amistad_directa(X, Z)
    ; familia(X, Z)
    ),
    Z \= X,
    \+ miembro(Z, Visitados),
    cadena_social_(Z, Y, [Z|Visitados]).

% Parte 6 Explicación técnica

% Casos para es_amigo/2  y camino_amigos/3
% Caso base: hay amistad_directa(X,Y); si X e Y son amigos directos, se detiene la busqueda.
% Caso general: se busca un Z tal que X sea amigo (directo) de Z y, siempre que Z no haya sido visitado,
% y se sigue recursivamente hasta Y.

% Casos para miembro/2
% Caso base: el elemento X coincide con la cabeza de la lista [X|_].
% Caso general: si no coincide con la cabeza, se busca recursivamente en la cola con miembro(X,T).

% Casos para invertir/2
% Caso base: la inversa de la lista vacia es [].
% Caso general: se invierte recursivamente la cola T (obteniendo RT) y luego se añade la cabeza H al final: append(RT,[H],R).

% Casos para cadena_social/2 y cadena_social_/3
% Caso base: X y Y están conectados por una sola relación (amistad_directa o familia), así que se para.
% Caso general: existe un Z tal que X se conecta con Z por una relación (amigo/familia),
% y se continua recursivamente desde Z hasta Y, controlando visitados para no repetir nodos.

% Las rutinas se modelaron con el predicado actividad(Persona, Día, Acción), apoyado en entre_semana/1 y fin_de_semana/1 para capturar patrones y evitar repeticiones.
% Las excepciones se resolvieron mediante negación por falla (p. ej., Ana cocina salvo que cansada(ana, D)).
% Cuando no existe una actividad/3 para un día, descansa/2 deduce descanso por defecto.
% Los casos particulares (como Luis) se expresaron con pertenencia a listas, y las actividades nocturnas se aislaron en actividad_nocturna/3.