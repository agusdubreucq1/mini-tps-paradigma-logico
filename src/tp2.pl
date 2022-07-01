% --------------------------------
% Predicados a desarrollar
% --------------------------------

incompatibles(???,???).

ultimaEvolucion(???).

predecible(???).

% --------------------------------
% Código inicial - NO TOCAR
% --------------------------------

% tipo(Especie, Tipo).
tipo(charmander, fuego).
tipo(charmeleon, fuego).
tipo(charizard, fuego).
tipo(charizard, volador).

tipo(bulbasaur, planta).
tipo(bulbasaur, veneno).
tipo(ivysaur, planta).
tipo(ivysaur, veneno).
tipo(venusaur, planta).
tipo(venusaur, veneno).

tipo(squirtle, agua).
tipo(wartortle, agua).
tipo(blastoise, agua).

tipo(pikachu, electrico).
tipo(raichu, electrico).

tipo(farfetchd, normal).
tipo(farfetchd, volador).

tipo(eevee, normal).
tipo(flareon, fuego).
tipo(jolteon, electrico).
tipo(vaporeon, agua).
tipo(leafeon, planta).

tipo(moltres, fuego).
tipo(moltres, volador).

tipo(porygon, normal).
tipo(porygon2, normal).
tipo(porygonX, electrico).

% evolucion(Especie, Evolucion).
evolucion(charmander, charmeleon).
evolucion(charmeleon, charizard).
evolucion(bulbasaur, ivysaur).
evolucion(ivysaur, venusaur).
evolucion(squirtle, wartortle).
evolucion(wartortle, blastoise).
evolucion(pikachu, raichu).
evolucion(eevee, flareon).
evolucion(eevee, jolteon).
evolucion(eevee, vaporeon).
evolucion(eevee, leafeon).
evolucion(porygon, porygon2).
evolucion(porygon2, porygonX).

puedeEvolucionar(Especie, Evolucion):-
  evolucion(Especie, Evolucion).
puedeEvolucionar(Especie, Evolucion):-
  evolucion(Especie, OtraEspecie),
  puedeEvolucionar(OtraEspecie, Evolucion).

% --------------------------------
% TESTS - NO TOCAR
% --------------------------------

:- begin_tests(tests_tp2_tiposIncompatibles).

test(siNingunaEspecieTieneAmbosTiposSonIncompatibles, nondet):-
        incompatibles(fuego,planta).

test(unTipoNoEsIncompatibleConsigoMismo, fail):-
        incompatibles(fuego, fuego).

test(siUnaMismaEspecieTieneDosTiposNoSonIncompatibles, fail):-
        incompatibles(planta,veneno).

test(incompatiblesEsInversibleParaSuPrimerParametro, set(Tipo == [normal, planta, agua, electrico, veneno])):-
        incompatibles(fuego, Tipo).

test(incompatiblesEsInversibleParaSuSegundoParametro, set(Tipo == [agua,electrico,fuego,normal,volador])):-
        incompatibles(Tipo,veneno).

:- end_tests(tests_tp2_tiposIncompatibles).

:- begin_tests(tests_tp2_ultimaEvolucion).

test(unaEvolucionIntermediaNoEsUltimaEvolucion, fail):-
        ultimaEvolucion(ivysaur).

test(unaEspecieBasicaQueNoEvolucionaNoEsUltimaEvolucion, fail):-
        ultimaEvolucion(farfetchd).

test(unaEspecieQueEsPrimerEvolucionEsUltimaSiNoHayUnaSegundaEvolucion, nondet):-
        ultimaEvolucion(flareon).

test(ultimaEvolucionEsInversible, set(Especie == [charizard, venusaur, blastoise, raichu, flareon, jolteon, vaporeon, leafeon, porygonX])):-
        ultimaEvolucion(Especie).
:- end_tests(tests_tp2_ultimaEvolucion).

:- begin_tests(tests_tp2_predecible).

test(unaEspecieEsPredecibleSiTodasSusEvolucionesTienenUnMismoTipoQueElla, nondet):-
        predecible(charmander).

test(unaEspecieNoEsPredecibleSiNoTieneUnTipoQueTodasSusEvolucionesTambienTengan, fail):-
        predecible(porygon).

test(unaEspecieQueNoPuedeEvolucionarEsPredecible, nondet):-
        predecible(flareon).

test(predecibleEsInversible, set(Especie == [charmander, charmeleon, charizard, bulbasaur, ivysaur, venusaur, squirtle, wartortle, blastoise, pikachu, raichu, farfetchd, flareon, jolteon, vaporeon, leafeon, moltres,porygonX])):-
        predecible(Especie).
:- end_tests(tests_tp2_predecible).