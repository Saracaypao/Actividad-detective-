% Código - Repaso Parcial 1 Prolog
% Carga la base de conocimiento
:- [base_conocimiento].

%regla para definir hijos

hijo(Hijo,Padre) :- padre(Padre,Hijo).

%regla recip esposo 
casado_con(Esposa,Esposo) :- casado_con(Esposo,Esposa).

%regla define madre
madre(Madre,Hijo) :- casado_con(Madre,Padre),padre(Padre,Hijo).

%regla para definir hermanos recip
hermano(X,Y) :- padre(Z,Y), padre(Z,X), madre(A,X),  madre(A,Y).
hermano(Y,X) :- hermano(X,Y).

%regla vive en para hijos
vive_en(Per,Lug) :- padre(X,Per),vive_en(X,Lug) ; madre(Y,Per),vive_en(Y,Lug).

%regla para definr primo 
primo(X,Y) :- hijo(X,Z), hijo(Y,A), hermano(A,Z).

%regla para definir sobrino / tio 
sobrino(Sob, Tio) :- hijo(Sob, X), hermano(X,Tio); hijo(Sob, X), primo(X,Tio).

%recip mejor amigo
amigo(X,Y) :- amigo(Y,X).

%abuelo 
abuelo(Ab, Ni) :- hijo(Ni,Pa), hijo(Pa,Ab).

%hijo (X,ernesto).
%abuelo(X,mateo).
%


