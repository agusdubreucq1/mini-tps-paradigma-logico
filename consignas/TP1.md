# Consigna TP1: Intro a Lógico

## Objetivos

- Definir predicados en Prolog usando hechos y reglas, trabajando con individuos simples (átomos y números).
- Identificar correctamente cuándo corresponde trabajar con disyunción, conjunción y negación.
- Asegurar que los predicados desarrollados sean inversibles.
- Abstraer y evitar repetir lógica.

> En caso de que por problemas técnicos no puedas usar la instalación recomendada de SWI-Prolog + VSCode que se explica en el TP0, armamos una [guía en Mumuki](https://mumuki.io/nym/complements/269-pdep-mit-2021-tp-logico) para ayudarte mientras tanto.
>
> Asegurate de que tus tutores estén al tanto de tu situación para guiarte en la instalación del ambiente local para más adelante.

## Comilona de bar

Seis amigues están planeando juntarse a comer en su bar favorito. Del bar se sabe cuáles son las comidas que ofrece y cuánto sale cada una de ellas:

``` prolog
precio(asado,550).
precio(lomitoDeLaCasa,450).
precio(hamburguesa,350).
precio(papasFritas,220).
precio(ensalada,190).
precio(pizzetas, 250).
precio(polloALaPlancha, 320).
precio(tostadoVeggie, 150).
precio(tortilla, 280).

tieneCarne(asado).
tieneCarne(hamburguesa).
tieneCarne(lomitoDeLaCasa).
tieneCarne(polloALaPlancha).
```

Queremos armar un programa que nos ayude a entender el comportamiento de este grupo a la hora de comer afuera.

> Tener en cuenta que si se agregaran otras comidas o cambiaran los precios del bar, el programa debería seguir comportándose de forma consistente en base a lo que se describe a continuación para cada persona.

### Gustos de comidas :pizza:

Desarrollar un predicado `leGusta/2` que relacione a cada persona con cada comida de su agrado de las que están en el bar sabiendo que:

* A Juan y Gabriel les gusta el asado.
* A Gabriel también le gusta la comida nacNpop, que es cualquier comida que salga menos de $300.
* A Juan le gusta el tostado veggie.
* A Soledad le gustan todas las cosas que le gustan a Gabriel, excepto aquellas que también le gustan a Juan.
* A Tomás le gustan las comidas que tienen carne.
* A Celeste le gusta todo lo que el bar ofrece.
* Carolina es bastante especial para comer, no le gusta nada de lo que ofrece este bar.

Por ejemplo, esta consulta debería ser cierta:

```prolog
?- leGusta(celeste, hamburguesa).
```

> :exclamation: Asegurar que el predicado `leGusta/2` sea inversible.

> Al correr los tests con `run_tests.` vas a encontrar los resultados para esta parte bajo el título **% PL-Unit: tests_tp1_leGusta**

### ¿Qué se piden? :fork_and_knife:

Necesitamos agregar a la base de conocimientos la siguiente información respecto a cuánta plata está dispuesta a gastar cada persona:

* Juan está dispuesto a gastar $500 y Celeste $400.
* Soledad está dispuesta a gastar el doble que Tomás.
* Tomás está dispuesto a gastar lo que saldría pedir una hamburguesa.
* Gabriel está dispuesto a gastar la mitad que Carolina.
* Carolina está dispuesta a gastar lo que saldría pedir asado con papas fritas.

Y desarrollar lo necesario para responder a la siguiente pregunta:

```prolog
?- puedePedir(Persona, Comida).
```

... teniendo en cuenta que una persona puede pedir una comida del bar si le gusta esa comida y esa comida no sale más de lo que está dispuesta a pagar.

> :exclamation: Asegurar que el predicado `puedePedir/2` sea inversible.

> Al correr los tests con `run_tests.` vas a encontrar los resultados para esta parte bajo el título **% PL-Unit: tests_tp1_puedePedir**

## Subir tu solución

Acordate que deberían pasar todas las pruebas si cumpliste con los requerimientos pedidos, sin embargo podés subir soluciones intermedias tantas veces como quieras. Si algo no te funciona y necesitás ayuda para destrabarte, podés subir tu solución y crear un issue en GitHub arrobando a tus tutores para que te guíen.

La forma de subir tus cambios es la misma que se explicó en el TP0, usando los comandos add, commit y push de git.

Luego de terminar el trabajo práctico, recordá crear un issue de entrega, arrobando a tus tutores y crear un tag para que se corran las pruebas en el servidor de GitHub (el badge que muestra el estado de tus TPs se actualizará automáticamente cuando se ejecuten).