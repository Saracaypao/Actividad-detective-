:- [actividad].

% Personas en la mansión. 
:- persona(X).

% Quien tiene un motivo para matar.
:- motivo(X, _).    

% Quien estuvo en la biblioteca.
:- estuvo(X, biblioteca).

% Motivo y oportunidad.
:- motivo(X, _), estuvo(X, biblioteca).

% Ajusta tu base de conocimiento para que la única coincidencia sea con el arma correcta (cuerda).
:- acceso(X, cuerda).

% Quién es el asesino culpable y realiza la consulta correspondiente.
:- motivo(X, _), estuvo(X, biblioteca), acceso(X, cuerda).
