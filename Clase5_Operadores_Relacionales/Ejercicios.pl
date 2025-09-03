% Ejercicio 1: Cálculo de área y perímetro de un rectángulo
% Uso: rectangulo(Largo, Ancho, area_perimetro(Area, Perimetro)).
rectangulo(Largo, Ancho, area_perimetro(Area, Perimetro)) :-
	Area is Largo * Ancho,
	Perimetro is 2 * (Largo + Ancho).


% Ejercicio 2: Determinar si un número es par o impar
% Uso: par_impar(Numero).

% Condicion que determina si un numero es par
par_impar(Numero) :- 
    Numero mod 2 =:= 0,
    write('par'). 
% Condicion que determina si un numero es impar
par_impar(Numero) :-
    Numero mod 2 =\= 0,
    write('impar').


%Ejercicio 3: Tabla de multiplicar
% Uso: tabla_multiplicar(Numero).
tabla_multiplicar(Numero) :-
    tabla_multiplicar(Numero, 1).
tabla_multiplicar(_, 11) :- !.
tabla_multiplicar(Numero, Factor) :-
    Factor =< 10,
    Resultado is Numero * Factor,
    write(Numero), write(' x '), write(Factor), write(' = '), write(Resultado), nl,
    Siguiente is Factor + 1,
    tabla_multiplicar(Numero, Siguiente).


% Ejercicio 4: Mayor de dos números
% Uso: mayor(A, B).
mayor(A, B) :-
    (A >= B -> write('El mayor es '), write(A)
    ; write('El mayor es '), write(B)).


% Ejercicio 5: Rango de edad
% Uso: categoria_edad(Edad).
categoria_edad(Edad) :-
    Edad < 13, write('Niño').
categoria_edad(Edad) :-
    Edad >= 13, Edad < 18, write('Adolescente').
categoria_edad(Edad) :-
    Edad >= 18, Edad < 60, write('Adulto').
categoria_edad(Edad) :-
    Edad >= 60, write('Adulto mayor').


% Ejercicio 6: Nota de aprobación 
% Crear predicado aprobo
% Uso: aprobo(Nota).
aprobo(Nota) :-
    Nota >= 6.0, Nota < 10.1, write('Aprobado').
aprobo(Nota) :-  
    Nota < 6.0, write('Reprobado').
aprobo(Nota) :- 
    Nota >= 10.1, write('Rango de nota no valido').



% Ejercicio 7: Unifiacion de estructuras
% crear predicado es_hermano
:- [hermanosbase].
% Uso: es_hermano(X, Y).
es_hermano(X, Y) :- hermano(X, Y).

