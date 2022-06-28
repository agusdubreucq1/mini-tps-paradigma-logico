precio(asado,550).
precio(lomitoDeLaCasa,450).
precio(hamburguesa,350).
precio(papasFritas,220).
precio(ensalada,190).
precio(pizzetas, 250).
precio(polloALaPlancha, 320).
precio(tostadoVeggie, 150).

tieneCarne(asado).
tieneCarne(hamburguesa).
tieneCarne(lomitoDeLaCasa).
tieneCarne(polloALaPlancha).

% Cambiar la implementación para el predicado leGusta/2 de modo que relacione 
% a una persona con una comida (en ese orden) de acuerdo a lo pedido.

leGusta(juan, asado).
leGusta(gabriel, asado).
leGusta(gabriel, NacNpop):-
        precio(NacNpop, Precio),
        Precio < 300.
leGusta(juan, tostadoVeggie).
leGusta(soledad, Comida):-
        leGusta(gabriel, Comida),
        not((leGusta(juan, Comida))).
leGusta(tomas, Comida):-
        tieneCarne(Comida).
leGusta(celeste, Comida):-
        precio(Comida, _).



% Cambiar la implementación para el predicado puedePedir/2 de modo que relacione 
% a una persona con una comida (en ese orden) de acuerdo a lo pedido.

dispuestoAGastar(juan, 500).
dispuestoAGastar(celeste, 400).
dispuestoAGastar(soledad, Plata):-
        dispuestoAGastar(tomas, PlataTomas),
        Plata is PlataTomas * 2.
dispuestoAGastar(tomas, Plata):-
        precio(hamburguesa, Plata).
dispuestoAGastar(gabriel, Plata):-
        dispuestoAGastar(carolina, Plata1),
        Plata is Plata1 // 2.
dispuestoAGastar(carolina, Plata):-
        precio(papasFritas, Plata1),
        precio(asado, Plata2),
        Plata is Plata1 + Plata2.



puedePedir(Persona, Comida):-
        dispuestoAGastar(Persona, Plata),
        leGusta(Persona, Comida),
        precio(Comida, Precio),
        Plata >= Precio.

% --------------------------------
% TESTS - NO TOCAR
% --------------------------------

:- begin_tests(tests_tp1_leGusta).

test(genteALaQueLeGustaElAsado, set(Persona == [juan, gabriel, celeste, tomas])):-
        leGusta(Persona, asado).

test(gustosDeJuan, set(Comida == [asado, tostadoVeggie])):-
        leGusta(juan, Comida).

test(gustosDeGabriel, set(Comida == [asado, papasFritas, ensalada, pizzetas, tostadoVeggie])):-
        leGusta(gabriel, Comida).

test(gustosDeSoledad, set(Comida == [papasFritas, ensalada, pizzetas])):-
        leGusta(soledad, Comida).

test(gustosDeTomas, set(Comida == [asado, hamburguesa, lomitoDeLaCasa, polloALaPlancha])):-
        leGusta(tomas, Comida).

test(gustosDeCeleste, set(Comida == [asado, lomitoDeLaCasa, hamburguesa, papasFritas, ensalada, pizzetas, polloALaPlancha, tostadoVeggie])):-
        leGusta(celeste, Comida).

test(aCarolinaNoLeGustaNada, fail):-
        leGusta(carolina, _).

:- end_tests(tests_tp1_leGusta).

:- begin_tests(tests_tp1_puedePedir).

test(genteQuePuedePedirHamburguesa, set(Persona == [celeste, tomas])):-
        puedePedir(Persona, hamburguesa).

test(nadiePuedePedirAsado, fail):-
        puedePedir(_, asado).

test(aCelesteNoLeAlcanzaParaPedirElLomito, fail):-
        puedePedir(celeste, lomitoDeLaCasa).

test(aCelesteLeAlcanzaParaPedirPollo, nondet):-
        puedePedir(celeste, polloALaPlancha).

test(comidasQuePuedePedirJuan, set(Comida == [tostadoVeggie])):-
        puedePedir(juan, Comida).

test(comidasQuePuedePedirSoledad, set(Comida == [papasFritas, ensalada, pizzetas])):-
        puedePedir(soledad, Comida).

test(comidasQuePuedePedirTomas, set(Comida == [hamburguesa, polloALaPlancha])):-
        puedePedir(tomas, Comida).

test(comidasQuePuedePedirGabriel, set(Comida == [papasFritas, ensalada, pizzetas, tostadoVeggie])):-
        puedePedir(gabriel, Comida).

test(carolinaNoPuedePedirNadaPorqueNoLeGustaLoQueHay, fail):-
        puedePedir(carolina, _).

:- end_tests(tests_tp1_puedePedir).