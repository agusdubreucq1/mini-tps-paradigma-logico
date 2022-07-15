# Consigna TP4: Listas. Agregación.

## Objetivos

- Definir predicados en Prolog trabajando con individuos simples y compuestos adecuadamente.
- Resolver problemas que requieren trabajar con conjuntos, evitando soluciones poco declarativas. En caso de ser posible expresar una solución de forma sencilla en términos de existencia/no existencia/para todo, **no usar listas**.
- Asegurar la inversibilidad de aquellos predicados que lo requieran.

> En caso de que por problemas técnicos no puedas usar la instalación recomendada de SWI-Prolog + VSCode que se explica en el TP0, armamos una [guía en Mumuki](https://mumuki.io/nym/complements/269-pdep-mit-2021-tp-logico) para ayudarte mientras tanto.
>
> Asegurate de que tus tutores estén al tanto de tu situación para guiarte en la instalación del ambiente local para más adelante.

## Votaciones Nacionales

Estamos armando un programa para analizar los resultados de una votación realizada a nivel nacional.

Tenemos una base de conocimientos con información sobre cuántos votos sacó cada partido político en las distintas provincias del país mediante un predicado `votos/3`, que relaciona al partido con la provincia y los votos conseguidos en esa provincia.

Además también hay un predicado `padron/2` que relaciona una provincia con la cantidad de personas empadronadas.

### Votos Totales :argentina:

Definir un predicado `votosTotales/2` para saber cuántos votos sacó un partido a nivel nacional.

Por ejemplo:

```prolog
?- votosTotales(pps, VotosTotales).
VotosTotales = 3200555.
```

> :exclamation: El predicado `votosTotales/2` debe ser inversible para sus dos argumentos.

> Al correr los tests con `run_tests.` vas a encontrar los resultados para esta parte bajo el título **% PL-Unit: tests_tp4_votosTotales**

### Análisis de Padrón :bar_chart:

Queremos sacar algunas conclusiones de los resultados de la votación a nivel provincial teniendo en cuenta la información de empadronamiento que disponemos.

- Definir un predicado `repartida/1` que se cumpla para una provincia si hay al menos 3 partidos que hayan **sacado muchos votos** (porque más del 20% de los empadronados de esa provincia lo votaron).

- Definir un predicado `pocofollower/1` que se cumpla para un partido si no hay provincias en las cuales haya **sacado mucho votos**.

> :exclamation: Tanto `repartida/1` como `pocofollower/1` deben ser inversibles.

> Al correr los tests con `run_tests.` vas a encontrar los resultados para esta parte bajo los títulos **% PL-Unit: tests_tp4_repartida** y  **% PL-Unit: tests_tp4_pocofollower** respectivamente

## Subir tu solución

Acordate que deberían pasar todas las pruebas si cumpliste con los requerimientos pedidos, sin embargo podés subir soluciones intermedias tantas veces como quieras. Si algo no te funciona y necesitás ayuda para destrabarte, podés subir tu solución y crear un issue en GitHub arrobando a tus tutores para que te guíen.

La forma de subir tus cambios es la misma que se explicó en el TP0, usando los comandos add, commit y push de git.

Luego de terminar el trabajo práctico, recordá crear un issue de entrega, arrobando a tus tutores y crear un tag para que se corran las pruebas en el servidor de GitHub (el badge que muestra el estado de tus TPs se actualizará automáticamente cuando se ejecuten).