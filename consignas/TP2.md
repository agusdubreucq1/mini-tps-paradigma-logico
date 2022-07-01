# Consigna TP2: Existe, No Existe, Para Todo

## Objetivos

- Definir predicados en Prolog, identificando correctamente cuándo corresponde trabajar con existencia, no existencia y para todo.
- Asegurar que los predicados principales sean inversibles.

> En caso de que por problemas técnicos no puedas usar la instalación recomendada de SWI-Prolog + VSCode que se explica en el TP0, armamos una [guía en Mumuki](https://mumuki.io/nym/complements/269-pdep-mit-2021-tp-logico) para ayudarte mientras tanto.
>
> Asegurate de que tus tutores estén al tanto de tu situación para guiarte en la instalación del ambiente local para más adelante.

## Atrápalos a todos!

   ![Profesor Oak](imagenes/TP2/Profesor_Oak.png)

El Profesor Oak nos encomendó la tarea de registrar la información sobre diversas especies de pokemones para aprender más sobre estas simpáticas criaturas.

Tenemos una base de conocimientos de este estilo:

``` prolog
% tipo(Especie, Tipo).
tipo(charmander, fuego).
tipo(charmeleon, fuego).
tipo(charizard, fuego).
tipo(charizard, volador).
% ... etc

% evolucion(Especie, Evolucion).
evolucion(charmander, charmeleon).
evolucion(charmeleon, charizard).
% ... etc

puedeEvolucionar(Especie, Evolucion):-
  evolucion(Especie, Evolucion).
puedeEvolucionar(Especie, Evolucion):-
  evolucion(Especie, OtraEspecie),
  puedeEvolucionar(OtraEspecie, Evolucion).
```

> Nota: la relación `evolucion/2` es antisimétrica, irreflexiva y no transitiva; indica que la segunda especie es una evolución directa de la primera. Mientras que `puedeEvolucionar/2` sí es transitiva.

Sabemos que hay muchísimas especies y constantemente se descubren nuevas, por eso necesitamos armar un programa que nos permita analizar la información que fuimos recolectando.

### Análisis de tipos :fire: :leaves:

Necesitamos saber si dos tipos (ej. fuego, planta, volador...) son **incompatibles**. Decimos que dos tipos son incompatibles si no existe ninguna especie que tenga ambos tipos a la vez.

Por ejemplo, agua y planta deberían ser incompatibles de acuerdo a la base de conocimientos inicial, pero fuego y volador no (porque charizard, por ejemplo, tiene ambos tipos).

> Desarrollar un predicado `incompatibles/2` que cumpla con lo solicitado asegurando que sea inversible.

> Al correr los tests con `run_tests.` vas a encontrar los resultados para esta parte bajo el título **% PL-Unit: tests_tp2_tiposIncompatibles**

### Especies y evoluciones :bug: :butterfly:

En base a la información que tenemos de las distintas especies necesitamos desarrollar los siguientes predicados inversibles para:

- Saber si una especie es `ultimaEvolucion/1`, que se cumple para aquellas especies que son evolución de alguna otra especie pero no evolucionan en otra.

Ejemplos:

```prolog
?- ultimaEvolucion(charizard).
true.

?- ultimaEvolucion(charmeleon).
false.

?- ultimaEvolucion(farfetchd).
false.
```

> :exclamation: Asegurar que el predicado `ultimaEvolucion/1` sea inversible.

> Al correr los tests con `run_tests.` vas a encontrar los resultados para esta parte bajo el título **% PL-Unit: tests_tp2_ultimaEvolucion**

- Saber si una especie es `predecible/1`, que se cumple para una especie de un determinado tipo si todas las especies a las que **puede evolucionar** (de haber alguna) también tienen ese tipo.

Ejemplos:

```prolog
?- predecible(pikachu).
true.

?- predecible(eevee).
false.

?- predecible(porygon).
false.

?- predecible(flareon).
true.
```

> :exclamation: Asegurar que el predicado `predecible/1` sea inversible.

> Al correr los tests con `run_tests.` vas a encontrar los resultados para esta parte bajo el título **% PL-Unit: tests_tp2_predecible**

## Subir tu solución

Acordate que deberían pasar todas las pruebas si cumpliste con los requerimientos pedidos, sin embargo podés subir soluciones intermedias tantas veces como quieras. Si algo no te funciona y necesitás ayuda para destrabarte, podés subir tu solución y crear un issue en GitHub arrobando a tus tutores para que te guíen.

La forma de subir tus cambios es la misma que se explicó en el TP0, usando los comandos add, commit y push de git.

Luego de terminar el trabajo práctico, recordá crear un issue de entrega, arrobando a tus tutores y crear un tag para que se corran las pruebas en el servidor de GitHub (el badge que muestra el estado de tus TPs se actualizará automáticamente cuando se ejecuten).