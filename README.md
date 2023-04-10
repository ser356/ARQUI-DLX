# README.md

Implementación de una variante de la secuencia de Fibonacci. Tras la secuencia, se calcula una matriz de la que se extrae su determinante y su media.

Posteriormente, se calcula otra matriz asociada a la anterior y se calcula su determinante y su media.

El programa pretende estudiar el paralelismo de ejecución de la pipeline segmentada de la arquitectura del procesador DlX.

## Memoria

La memoria del procesador DlX es una memoria segmentada. Cada segmento tiene un tamaño de 2^16 bytes. La memoria se divide en 4 segmentos de 2^16 bytes cada uno. Cada segmento tiene un nombre y una dirección de inicio. Los nombres de los segmentos son:

## Pipeline segmentada

La pipeline segmentada del procesador DlX es una pipeline de 5 etapas. Cada etapa tiene un nombre y un segmento de memoria asociado. Los nombres de las etapas son:

* `IF`: Etapa de obtención de instrucciones. Obtiene las instrucciones del segmento de código.

* `ID`: Etapa de decodificación de instrucciones. Decodifica las instrucciones y obtiene los operandos.

* `EX`: Etapa de ejecución de instrucciones. Ejecuta las instrucciones.

* `MEM`: Etapa de acceso a memoria. Accede a la memoria para leer o escribir datos.

* `WB`: Etapa de escritura de resultados. Escribe los resultados en los registros.

## Registros

El procesador DlX tiene 16 registros para enteros. Los registros se dividen en 2 grupos, sean de propósito general o de acumulación:

* `R0`: Registro de acumulación. Se utiliza para almacenar resultados intermedios.
* `R1-R15`: Registros de propósito general. Se utilizan para almacenar operandos y resultados.
* `HI`: Registro de acumulación de 32 bits. Se utiliza para almacenar resultados intermedios de operaciones de 32 bits.
* `PC`: Registro de programa. Se utiliza para almacenar la dirección de la siguiente instrucción a ejecutar.
* `IR`: Registro de instrucción. Se utiliza para almacenar la instrucción que se está ejecutando.
* `MAR`: Registro de dirección de memoria. Se utiliza para almacenar la dirección de memoria de la que se va a leer o escribir.
* `MDR`: Registro de datos de memoria. Se utiliza para almacenar los datos que se van a escribir en memoria o los datos que se han leído de memoria.
* `PSR`: Registro de estado del procesador. Se utiliza para almacenar el estado del procesador.
* `SP`: Registro de pila. Se utiliza para almacenar la dirección de la cima de la pila.
* `LR`: Registro de enlace. Se utiliza para almacenar la dirección de retorno de una subrutina.

Registros de punto flotante de simple precisión

El procesador DlX tiene 16 registros de punto flotante. Los registros de punto flotante se identifican con un número de 4 bits. Los registros de punto flotante se dividen en 2 grupos:

* `F0`: Registro de acumulación de punto flotante. Se utiliza para almacenar resultados intermedios.
* `F1-F15`: Registros de propósito general de punto flotante. Se utilizan para almacenar operandos y resultados.
* `FHI`: Registro de acumulación de punto flotante de 32 bits. Se utiliza para almacenar resultados intermedios de operaciones de 32 bits.
* `FLO`: Registro de acumulación de punto flotante de 32 bits. Se utiliza para almacenar resultados intermedios de operaciones de 32 bits.
* `FCSR`: Registro de estado de punto flotante. Se utiliza para almacenar el estado de punto flotante.
* `FIR`: Registro de instrucción de punto flotante. Se utiliza para almacenar la instrucción de punto flotante que se está ejecutando.

Registros de punto flotante de doble precisión:

* `D0`: Registro de acumulación de punto flotante de doble precisión. Se utiliza para almacenar resultados intermedios.
* `D1-D15`: Registros de propósito general de punto flotante de doble precisión. Se utilizan para almacenar operandos y resultados.
* `DHI`: Registro de acumulación de punto flotante de doble precisión de 64 bits. Se utiliza para almacenar resultados intermedios de operaciones de 64 bits.
* `DLO`: Registro de acumulación de punto flotante de doble precisión de 64 bits. Se utiliza para almacenar resultados intermedios de operaciones de 64 bits.

## Instrucciones

El juego de instrucciones del procesador DLX es una versión reducida de la arquitectura MIPS. 

### END OF README

Teniendo en cuenta las anteriores premisas, se proporcionan dos ficheros, uno sin planificación ni optimización y otro con planificación y optimización.
