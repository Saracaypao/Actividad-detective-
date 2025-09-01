estudiante(kelvin).
estudiante(raul).
estudiante(florence).
estudiante(mauricio).
estudiante(melissa).

% Si ellacuria no es estudiante (usando negacion)
no_estudiante(X) :- \+ estudiante(X).

% Obtener solo el primer estudiante de la lista (con corte)
primer_estudiante(X) :- estudiante(X), !.

% Listar todo los estudiantes (con fail)
listar_estudiantes(X) :- estudiante(X), write(X), nl, fail.

% Entrada y salida: pedir al usuario que ingrese un nombre y verificar si es estudiante
verificar_estudiante :- 
    write('Ingrese el nombre del estudiante: '), 
    read(Nombre), 
    (estudiante(Nombre) -> 
        write(Nombre), write(' es un estudiante.'), nl 
    ; 
        write(Nombre), write(' no es un estudiante.'), nl
    ).

% es una regla debe de tener tres parametros para cumplir con fallos  inicio y fin 
estudiante(Nombre, Entrada, Salida) :- 
    write('Ingrese el nombre del estudiante: '), 
    read(Entrada), 
    (estudiante(Entrada) -> 
        Nombre = Entrada,
        Salida = 'es un estudiante.'
    ; 
        Nombre = Entrada,
        Salida = 'no es un estudiante.'
    ).