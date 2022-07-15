% --------------------------------
% Predicados a desarrollar
% --------------------------------

lecturaIntensa(???).

lectorCasual(???).

lecturaMasLarga(???, ???).

% --------------------------------
% Código inicial - NO TOCAR
% --------------------------------

leyo(nico, saga(dune,14)).
leyo(nico, saga(harryPotter,7)).
leyo(nico, libro(rebelionEnLaGranja,deBolsillo,144)).
leyo(nico, paper("No Silver Bullet: Essence and Accidents of Software Engineering", 230, 100)).
leyo(nico, paper("The relationship between design and verification", 250, 300)).
leyo(nico, haiku("Primavera en el hogar/No hay nada/y sin embargo hay de todo")).

leyo(daiu, libro(elAleph,paidos,146)).
leyo(daiu, paper("The relationship between design and verification", 250, 300)).

leyo(clara, paper("Evidence for a Distant Giant Planet in the Solar System", 170, 130)).
leyo(clara, paper("No Silver Bullet: Essence and Accidents of Software Engineering", 230, 100)).
leyo(clara, libro(rayuela,alfaguara,600)).
leyo(clara, saga(harryPotter,7)).

leyo(juli, saga(harryPotter,7)).
leyo(juli, saga(elSeniorDeLosAnillos,3)).

leyo(juan, libro(cosmos,planeta,362)).
leyo(juan, saga(elSeniorDeLosAnillos,3)).

leyo(flor, libro(rebelionEnLaGranja,deBolsillo,144)).
leyo(flor, paper("No Silver Bullet: Essence and Accidents of Software Engineering", 230, 100)).

leyo(javi, haiku("Mil pequeños peces blancos/Como si hirviera/El color del agua")).
leyo(javi, libro(wicked, planeta, 420)).
leyo(javi, libro(rebelionEnLaGranja,deBolsillo,144)).
leyo(javi, paper("Evidence for a Distant Giant Planet in the Solar System", 170, 130)).

leyo(sol, haiku("Mil pequeños peces blancos/Como si hirviera/El color del agua")).
leyo(sol, haiku("Primavera en el hogar/No hay nada/y sin embargo hay de todo")).

leyo(leo, haiku("Mil pequeños peces blancos/Como si hirviera/El color del agua")).
leyo(leo, haiku("Primavera en el hogar/No hay nada/y sin embargo hay de todo")).
leyo(leo, paper("No Silver Bullet: Essence and Accidents of Software Engineering", 230, 100)).

leyo(andy, haiku("Mil pequeños peces blancos/Como si hirviera/El color del agua")).
leyo(andy, haiku("Primavera en el hogar/No hay nada/y sin embargo hay de todo")).
leyo(andy, libro(elAleph,paidos,146)).

leyo(luz, haiku("Mil pequeños peces blancos/Como si hirviera/El color del agua")).
leyo(luz, haiku("Primavera en el hogar/No hay nada/y sin embargo hay de todo")).
leyo(luz, saga(elSeniorDeLosAnillos,3)).

% --------------------------------
% TESTS - NO TOCAR
% --------------------------------

:- begin_tests(tests_tp3_lecturaIntensa).
test('un libro con muchas páginas es intenso', nondet):-
	lecturaIntensa(libro(rayuela,alfaguara,600)).

test('un libro de editorial paidos es intenso', nondet):-
  lecturaIntensa(libro(elAleph,paidos,146)).

test('un libro corto de otra editorial no es intenso', fail):-
  lecturaIntensa(libro(rebelionEnLaGranja,deBolsillo,144)).

test('un paper es intenso si la diferencia entre la cantidad de hojas y la cantidad de visitas es mayor que 100', nondet):-
  lecturaIntensa(paper("No Silver Bullet: Essence and Accidents of Software Engineering", 230, 100)).

test('un paper no es intenso si la diferencia entre la cantidad de hojas y visitas no llega a 100', fail):-
  lecturaIntensa(paper("The relationship between design and verification", 250, 300)).

test('una saga es intensa si tiene más de tres libros', nondet):-
  lecturaIntensa(saga(dune,14)).

test('una saga de 3 libros no es intensa', fail):-
  lecturaIntensa(saga(elSeniorDeLosAnillos,3)).

test('un haiku no es intenso', fail):-
  lecturaIntensa(haiku("Mil pequeños peces blancos/Como si hirviera/El color del agua")).

test('una lectura puede ser intensa independientemente de si alguien la leyó', true):-
  lecturaIntensa(saga(mundoDisco, 40)).

:- end_tests(tests_tp3_lecturaIntensa).

:- begin_tests(tests_tp3_lectorCasual).
test('alguien que leyó más de una cosa, y ninguna es intensa es lector casual', nondet):-
  lectorCasual(juan).

test('alguien que leyó de todo, incluyendo alguna lectura intensa y alguna que no lo es, no es lector casual', fail):-
  lectorCasual(nico).

test('alguien que no leyó algún tipo de material no es lector casual si alguna de sus lecturas es intensa', fail):-
  lectorCasual(daiu).

test('alguien que no leyó nada no es lector casual', fail):-
  lectorCasual(tito).

test('se puede consultar quienes son lectores casuales', set(Persona = [juan, javi, sol, luz])):-
  lectorCasual(Persona).
:- end_tests(tests_tp3_lectorCasual).

:- begin_tests(tests_tp3_lecturaMasLarga).
test('la lectura más larga, cuando se leyó más de una saga, es la saga con más libros', nondet):-
  lecturaMasLarga(nico, saga(dune,14)).

test('la lectura más larga de una persona que leyó papers y libros, pero no sagas, es la que tiene más páginas', nondet):-
  lecturaMasLarga(javi, libro(wicked, planeta, 420)).

test('la lectura más larga de una persona que sólo leyó haikus y una saga es la saga', nondet):-
  lecturaMasLarga(luz, saga(_,_)).

test('la lectura más larga de una persona que sólo leyó haikus y un libro es el libro', nondet):-
  lecturaMasLarga(andy, libro(_,_,_)).

test('la lectura más larga de una persona que sólo leyó haikus y un paper es el paper', nondet):-
  lecturaMasLarga(leo, paper(_,_,_)).

test('no existe una lectura más larga para una persona que sólo leyó haikus', fail):-
  lecturaMasLarga(sol, _).

test('se puede consultar cuál es la lectura más larga para una persona', set(Lectura = [paper("No Silver Bullet: Essence and Accidents of Software Engineering", 230, 100)])):-
  lecturaMasLarga(flor, Lectura).

test('se puede consultar para quiénes una lectura es la más larga', set(Persona = [clara, juli])):-
  lecturaMasLarga(Persona, saga(harryPotter,7)).
:- end_tests(tests_tp3_lecturaMasLarga).