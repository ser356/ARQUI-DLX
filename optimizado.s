.data
valor_inicial: .float 5
tamanho: .word 30
vector: .space 120
suma: .float 0

M: .float 0.0, 0.0
.float 0.0, 0.0
detM: .float 0.0
mediaM: .float 0.0

V: .float 0.0, 0.0
.float 0.0, 0.0
detV: .float 0.0
mediaV: .float 0.0
.text
.global main
main:

    ;COMENTARIO PARA TOMAS !!!HAY QUE TERMINAR EN EL MAIN LO DE CALCULAR LOS CINCO PRIMEROS VALORES!!!!
    lf      f0,         valor_inicial           ; f0=5.0
    lw      r8,         tamanho                 ; r8=30 pero se puede utilizar cualquier valor en rango de 10 a 30
    addi    r9,         r0,             0       ; inicializamos el puntero de posicion del vector
    addf    f5,         f5,             f1      ; se inicializa la suma a 0
    sf      vector(r9), f1                      ; primera posicion del vector a 0 puesto que el primer valor d ela secuencia es 0
    addi    r9,         r9,             4       ; incrementamos el puntero del vector en 4 bytes puesto que es un float
    sf      vector(r9), f0                      ; segunda posicion del vector a 5 ya que es el valor inicial, segundo elemento en la secuencia
    addi    r10,        r0,             5       ; inicializamos el contador de tamanho de la secuencia
    addf    f5,         f5,             f0      ; sumamos el valor inicial a la suma

; hasta este punto estan usados los registros de coma flotante f0,f1,f5
loop:                                           ; bucle principal contiene el algoritmo de calculo estilo fibonacci cc/ralves

    addi    r9,         r9,             4       ; incrementamos el puntero del vector
    lf      f2,         vector-8(r9)            ; cargamos el valor de la secuencia en n-2
    lf      f3,         vector-4(r9)            ; cargamos el valor de la secuencia en n-1
    addf    f4,         f2,             f3      ; calculamos el valor de la secuencia en n
    addf    f5,         f5,             f4      ; sumamos el valor de la secuencia en n a la suma
                                                ; se aprovecha el tiempo que se tarda en guardar el valor en memoria para almacenar el valor de la secuencia en el vector
    sf      vector(r9), f4                      ; almacenamos en memoria el valor de la secuencia en vector[n]

    addi    r9,         r9,             4       ; incrementamos el puntero del vector
    lf      f6,         vector-8(r9)            ; cargamos el valor de la secuencia en n-2
    lf      f7,         vector-4(r9)            ; cargamos el valor de la secuencia en n-1
    addf    f8,         f6,             f7      ; calculamos el valor de la secuencia en n
    addf    f5,         f5,             f8      ; sumamos el valor de la secuencia en n a la suma
    sf      vector(r9), f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addi    r9,         r9,             4       ; incrementamos el puntero del vector
    lf      f9,         vector-8(r9)            ; cargamos el valor de la secuencia en n-2
    lf      f10,        vector-4(r9)            ; cargamos el valor de la secuencia en n-1
    addf    f11,        f10,            f9      ; calculamos el valor de la secuencia en n
    addf    f5,         f5,             f11     ; sumamos el valor de la secuencia en n a la suma
    sf      vector(r9), f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addi    r9,         r9,             4       ; incrementamos el puntero del vector
    lf      f12,        vector-8(r9)            ; cargamos el valor de la secuencia en n-2
    lf      f13,        vector-4(r9)            ; cargamos el valor de la secuencia en n-1
    addf    f14,        f13,            f12     ; calculamos el valor de la secuencia en n
    addf    f5,         f5,             f14     ; sumamos el valor de la secuencia en n a la suma
    sf      vector(r9), f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addi    r9,         r9,             4       ; incrementamos el puntero del vector
    lf      f15,        vector-8(r9)
    lf      f16,        vector-4(r9)
    addf    f17,        f16,            f15     ; calculamos el valor de la secuencia en n
    addf    f5,         f5,             f17     ; sumamos el valor de la secuencia en n a la suma

    sf      vector(r9), f17                     ; almacenamos en memoria



; notese que se deja para el final para aprovechar el tiempo de ejecucion del bucle
    sf      suma,       f5                      ; almacenamos la suma en memoria




; control de la salida del bucle

    addi    r10,        r10,            5       ; incrementamos el contador de tamanho de la secuencia
    seq     r11,        r10,            r8      ; comparamos el contador de  la secuencia con el tamanho
    bnez    r11,        fin                     ; si el bool es 1 salimos del bucle

    j       loop                                ; si no volvemos a ejecutar el bucle



fin:
    trap    0                                   ; fin del programa
