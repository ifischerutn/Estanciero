# Estanciero
TP Paradigmas De Programacion UTN FRBA

Jacobo y su hermano Samuel son unos enfermitos del estanciero y para mejorar sus tácticas y estudiar nuevas estrategias deciden modelar su juego preferido en Wollok.

De cada jugador nos va a interesar el dinero que posee (por el hecho de cobrar y pagar) y las propiedades que tiene (por el hecho de comprarlas).


Se dispone de un tablero con casilleros. En su mayoría los casilleros son propiedades, donde de cada propiedad se conoce su precio de compra inicial y su dueño. Los otros casilleros son premios y el casillero de salida, explicados más adelante.
Caída en una propiedad
Cuando un jugador J cae en una propiedad puede ocurrir alguna de estas tres cosas
Que la propiedad no pertenezca a nadie (es decir, que el dueño sea el Banco): 
En este caso el jugador que cayó ahí compra la propiedad pagándole al Banco
Que el dueño de la propiedad sea un jugador rival (esto es J ≠ dueño)
El jugador debe abonarle al dueño el valor de la renta de esa propiedad.
Que el dueño sea de uno mismo (esto es J = dueño)
No pasa nada
Tipos de Propiedades
Hay 2 tipos de propiedades: Los campos y las empresas
I. Campos
Algunas propiedades son "Campos" y están agrupadas en grupos llamados "Provincias". 

De cada campo se conoce su valor de renta fijo (o sea, el valor de la renta sin estancias), se conoce el costo de construcción de cada estancia (en ese campo) y se conoce la cantidad de estancias que están construidas en él.

Además, cada campo debe saber decirnos el valor de renta para los casos en que la propiedad tenga construida estancias, que se calcula con la siguiente fórmula:
Renta para N estancias = 2N * valor renta fijo

Ejemplo, si al campo "Campo Bravo" tiene construidas en él 3 estancias y tiene un valor de renta fijo de $3000 su renta es $24.000 porque 23 * 3000 = 24000

Construcción de estancias: Deben validarse 2 cosas en la provincia
ser monopolio: que todos los campos de la provincia tengan el mismo dueño
construcción pareja: la cantidad de estancias en el campo en donde se realiza la construcción debe ser menor o igual a la cantidad de estancias que tiene cada campo de la provincia
Una provincia conoce los campos que tiene y cada campo conoce a qué provincia pertenece. 

II. Empresas
Otras propiedades son empresas, son tres en todo el juego y la renta aumenta según la cantidad que se posee. 

Si un jugador cae en una empresa ese jugador debe
tirar los dados nuevamente (asumamos que saco X)
pagarle al dueño de dicha empresa:
X * $30.000 de renta si el dueño tiene una sola empresa (X * 30000 * 1)
X * $60.000 de renta si el dueño tiene 2 empresas (X * 30000 * 2)
X * $90.000 de renta si el dueño tiene 3 empresas (X * 30000 * 3)


Notas: 
Ya se cuenta con algunas clases y objetos que serán provistos por la cátedra.
Asumimos que todas las propiedades, al momento de ser creadas, tienen como dueño al banco.
Requerimientos

Obtener la colección de dueños que tiene una provincia sin repetidos. O sea, los dueños de sus campos (en la colección puede haber jugadores y el banco)
Agregar una estancia en un campo validando que se pueda construir. Para la validación preguntarle a su provincia si se puede construir en ese campo (Ver Construcción de estancias) no olvidarse de que el dueño pague lo correspondiente por dicha estancia al Banco (cada campo conoce el precio de construcción)

Hacer que todas las propiedades entiendan el mensaje sosEmpresa(), los campos devuelven false y las empresas devuelven true
Saber la cantidad de empresas que tiene un jugador, solo en este punto se puede utilizar un "if" con un mensaje del estilo sosEmpresa()...

Hacer que un jugador entienda el mensaje tirarDados(). Esto devuelve una cantidad que es la suma de dos números aleatorios entre 1 y 6

Hacer que todas las propiedades entiendan el mensaje rentaPara(jugadorQueCayo)
Para los campos tener en cuenta las estancias que hay construidas allí
Para las empresas tener en cuenta
la cantidad que saco en los dados el jugador que cayó (recuerden que el jugador que cayó tiene que tirar los dados nuevamente)
la cantidad de empresas que tiene el dueño de la propiedad

Hacer que un jugador pague una suma de dinero a un acreedor; si no tiene dinero suficiente se debe lanzar un error. Cuando un jugador paga a otro, su dinero disminuye y el del acreedor aumenta. Los jugadores y el banco deben ser polimórficos.

Hacer que cualquier casillero entienda el mensaje pasó(unJugador)
Por defecto cuando un jugador pasa por un casillero no sucede nada
Si un jugador pasa por la Salida cobra $5000(*)

Hacer que cualquier casillero entienda el mensaje cayó(unJugador)
Cuando un jugador cae en una propiedad lo que pasa depende del dueño.
- Si es el banco este le dice al jugador que compre la propiedad
- Si el dueño es otro jugador rival este le dice al jugador que cayó que le pague la renta de la propiedad. Recurden 
Cuando cae en Premio Ganadero el jugador cobra $2500
Cuando cae en Salida no pasa nada

Hacer que un jugador se mueva sobre una colección de casilleros que le llega por parámetro. Esto hace que:
El jugador pase por todos los casilleros de esa colección
El jugador caiga en el último casillero de esa colección
El casillero actual del jugador sea el último casillero de esa colección

Hacer el método queJuegue(unJugador) en la clase Juego en donde unJugador tiene que
tirar los dados (digamos que sacó X) y,
moverse sobre los casilleros correspondientes (¡OJO! primero tienen que saber en dónde está el jugador para que recorra desde ahí hasta X)

Realizar los tests necesarios para cubrir todas las funcionalidades del enunciado.
