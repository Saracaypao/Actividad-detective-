% Base de conocimiento

% aldea(Nombre).
aldea(rivoria).
aldea(durania).

% familia
esposa(mariela,esteban).
hija(clara, esteban).
hija(clara, mariela).
hijo(rodolfo, esteban).
hijo(rodolfo, mariela).
hijo(ismael, esteban).
hijo(rodolfo, mariela).
esposa(clara, andres).
hija(sofia, clara).
hija(sofia, andres).

esposa(teresa, rodolfo).
hijo(lucas, rodolfo).
hijo(lucas, teresa).
hija(martina, rodolfo).
hija(martina, teresa).

amigo(ismael, hector).

%aldea(Nombre).

aldea(montelar).

%familia
esposa(beatriz, alonso).
hijo(felipe, alonso).
hijo(felipe, beatriz).
hija(catalina, alonso).
hija(catalina, beatriz).
hija(emilia, alonso).
hija(emilia, beatriz).

esposa(catalina, andres).
esposa(irene, mateo).

% oficios de rivoria
oficio(hector, herrero).
oficio(teresa, tejedora).
oficio(clara, maestra).
oficio(lucas, herrero).

%oficios de montelar
oficio(catalina, curandera).
oficio(felipe, explorador).
oficio(emilia, ceramista).

%oficios de durania
oficio(mateo, agricultor).
oficio(irene, comeriante).

%alianza entre aldeas
aliada(rivoria, durania).

%rivalidades entre aldeas
rival(rodolfo, felipe).
rival(clara, catalina).

%creencias y costumbres
celebra(rivoria, fiesta_del_rio).
celebra(montelar, ceremonia_de_la_luna).
celebra(durania, feria_del_grano).

%espiritus protectores
veneraba(rivoria, espiritu_del_agua).
veneraba(montelar, espiritu_de_montaña).
veneraba(durania, espiritu_de_la_tierra).