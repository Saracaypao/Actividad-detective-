% Base de conocimiento - Rutinas y Actividades

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

% Extensión creativa - Nuevo personaje: luis
amigo(luis, pedro).   % luis es amigo de pedro
amigo(sofia, luis).   % sofia y luis son amigos

