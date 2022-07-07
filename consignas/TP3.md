# Consigna TP3: Functores y Polimorfismo.

## Objetivos

- Definir predicados en Prolog trabajando con individuos simples y compuestos adecuadamente.
- Evitar repeticiones de lógica, aprovechando el uso de predicados polimórficos.

> En caso de que por problemas técnicos no puedas usar la instalación recomendada de SWI-Prolog + VSCode que se explica en el TP0, armamos una [guía en Mumuki](https://mumuki.io/nym/complements/269-pdep-mit-2021-tp-logico) para ayudarte mientras tanto.
>
> Asegurate de que tus tutores estén al tanto de tu situación para guiarte en la instalación del ambiente local para más adelante.

## Lecturas y lectores

Queremos armar un programa para analizar los hábitos de lectura de un grupo de personas, así como los diferentes materiales de lectura que leen.

Los distintos materiales de lectura que consideraremos para nuestro modelo son haikus, libros, papers y sagas de libros, pero a futuro debería ser fácil de incorporar nuevos tipos de materiales de lectura.

Considerar que los distintos materiales de lectura se representan con **functores** con esta forma:

- `haiku(Texto)`
- `libro(Nombre, Editorial, CantidadDePaginas)`
- `paper(Titulo, CantidadDePaginas, CantidadDeVisitas)`
- `saga(Nombre, CantidadDeLibros)`

### Lecturas Intensas :books:

Definir un predicado `lecturaIntensa/1` para saber si un material de lectura es intenso:

- Un libro es intenso si tiene al menos 500 páginas o si es de editorial `paidos`.
- Un paper es intenso si la diferencia entre la cantidad de páginas y la cantidad de visitas es mayor que 100.
- Una saga es intensa si tiene más de tres libros.
- Los haikus son poemas muy cortos (tres versos de 5, 7 y 5 sílabas), por lo que no se consideran intensos.

A continuación se muestran algunos ejemplos de uso:

```Prolog
?- lecturaIntensa(saga(elSeniorDeLosAnillos,3)).
false

?- lecturaIntensa(libro(elAleph,paidos,146)).
true

?- lecturaIntensa(paper("Las fronteras de cristal en la carrera laboral de las mujeres. Género, subjetividad y globalización", 12, 130)).
false

?- lecturaIntensa(haiku("Mil pequeños peces blancos/Como si hirviera/El color del agua")).
false
```

> :exclamation: **No se espera que este predicado sea inversible.**

> Al correr los tests con `run_tests.` vas a encontrar los resultados para esta parte bajo el título **% PL-Unit: tests_tp3_lecturaIntensa**

## Lectores casuales :eyeglasses:

Para analizar los hábitos de las personas, contamos con un predicado `leyo/2` que relaciona a una persona con cada material de lectura que leyó.

A partir de esta información y usando el predicado `lecturaIntensa/1` del ejercicio anterior, definir un predicado `lectorCasual/1` que se cumpla para una persona cuando **nada de lo que leyó es intenso**.

> :exclamation: Se espera que el predicado `lectorCasual/1` sea inversible.

> Al correr los tests con `run_tests.` vas a encontrar los resultados para esta parte bajo el título **% PL-Unit: tests_tp3_lectorCasual**

## Lectura más larga :clock10:

Por último queremos saber cuál es la **lectura más larga que leyó una persona** mediante un predicado `lecturaMasLarga/2` que relacione a la persona con el material de lectura correspondiente. Sabemos que:

- Una saga es más larga que otra si tiene más libros.
- Las sagas son más largas que los libros y los papers.
- En general un material de lectura para el cual conocemos la cantidad de páginas que tiene se considera más largo que otro cuando la cantidad de páginas es mayor.
- Cualquier material **que no sea un haiku** es más largo que un haiku.

Por ejemplo, si una persona leyó un haiku cualquiera, un libro de 200 páginas, un paper de 20 páginas, una saga de 2 libros y otra saga de 5 libros, su lectura más larga debería ser la saga de 5 libros.

A continuación se muestran algunos ejemplos de consulta y respuesta a modo de referencia, teniendo en cuenta la información que disponemos de las personas en nuestra base de conocimientos:

```Prolog
> lecturaMasLarga(javi, Lectura).
Lectura = libro(wicked, planeta, 420).
> lecturaMasLarga(nico, Lectura).
Lectura = saga(dune,14).
```

> :exclamation: Se espera que `lecturaMasLarga/2` sea completamente inversible.

> Al correr los tests con `run_tests.` vas a encontrar los resultados para esta parte bajo el título **% PL-Unit: tests_tp3_lecturaMasLarga**

## Subir tu solución

Acordate que deberían pasar todas las pruebas si cumpliste con los requerimientos pedidos, sin embargo podés subir soluciones intermedias tantas veces como quieras. Si algo no te funciona y necesitás ayuda para destrabarte, podés subir tu solución y crear un issue en GitHub arrobando a tus tutores para que te guíen.

La forma de subir tus cambios es la misma que se explicó en el TP0, usando los comandos add, commit y push de git.

Luego de terminar el trabajo práctico, recordá crear un issue de entrega, arrobando a tus tutores y crear un tag para que se corran las pruebas en el servidor de GitHub (el badge que muestra el estado de tus TPs se actualizará automáticamente cuando se ejecuten).