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
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;
                                                    ; Calculo de los primeros 10 elementos de la secuencia
    lf      f0,             valor_inicial           ; f0=5.0
    lw      r8,             tamanho                 ; r8=30 pero se puede utilizar cualquier valor en rango de 10 a 30
    addi    r9,             r0,             0       ; inicializamos el puntero de posicion del vector
    sf      vector(r9),     f1                      ; primera posicion del vector a 0 puesto que el primer valor d ela secuencia es 0
    addi    r9,             r9,             4       ; incrementamos el puntero del vector en 4 bytes puesto que es un float
    sf      vector(r9),     f0                      ; segunda posicion del vector a 5 ya que es el valor inicial, segundo elemento en la secuencia
    addi    r10,            r0,             5       ; inicializamos el contador de tamanho de la secuencia
    addi    r9,             r9,             4       ; incrementamos el puntero del vector en 4 bytes puesto que es un float
    addf    f18,            f0,             f1      ; calculamos el valor de la secuencia en n
    sf      vector(r9),     f18                     ; almacenamos en memoria el valor de la secuencia en vector[n]
    addi    r9,             r9,             4       ; incrementamos el puntero del vector en 4 bytes puesto que es un float
    addf    f19,            f18,            f0      ; calculamos el valor de la secuencia en n
    sf      vector(r9),     f19                     ; almacenamos en memoria el valor de la secuencia en vector[n]
    addi    r9,             r9,             4       ; incrementamos el puntero del vector en 4 bytes puesto que es un float
    addf    f20,            f19,            f18     ; calculamos el valor de la secuencia en n
    sf      vector(r9),     f20                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addi    r9,             r9,             20      ; incrementamos el puntero del vector



    movf    f2,             f19                     ; cargamos el valor de la secuencia en n-2
    movf    f3,             f20                     ; cargamos el valor de la secuencia en n-1
    addf    f4,             f2,             f3      ; calculamos el valor de la secuencia en n
    sf      vector-16(r9),  f4                      ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f8,             f3,             f4      ; calculamos el valor de la secuencia en n
    sf      vector-12(r9),  f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f11,            f8,             f4      ; calculamos el valor de la secuencia en n
    sf      vector-8(r9),   f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f14,            f11,            f8      ; calculamos el valor de la secuencia en n
    sf      vector-4(r9),   f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f17,            f14,            f11     ; calculamos el valor de la secuencia en n

    sf      vector(r9),     f17                     ; almacenamos en memoria

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

    jal     opMat                                   ; SALTO INCONDICIONAL PARA CALCULAR MATRIZ ASOCIADA A LA SECUENCIA
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;
    addi    r11,            r10,            10
    seqi    r11,            r8,             10
    bnez    r11,            fin

    addi    r9,             r9,             20      ; incrementamos el puntero del vector



    movf    f2,             f14                     ; cargamos el valor de la secuencia en n-2
    movf    f3,             f17                     ; cargamos el valor de la secuencia en n-1
    addf    f4,             f2,             f3      ; calculamos el valor de la secuencia en n
                                                    ; se aprovecha el tiempo que se tarda en guardar el valor en memoria para almacenar el valor de la secuencia en el vector
    sf      vector-16(r9),  f4                      ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f8,             f3,             f4      ; calculamos el valor de la secuencia en n
    sf      vector-12(r9),  f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f11,            f8,             f4      ; calculamos el valor de la secuencia en n
    sf      vector-8(r9),   f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f14,            f11,            f8      ; calculamos el valor de la secuencia en n
    sf      vector-4(r9),   f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f17,            f14,            f11     ; calculamos el valor de la secuencia en n

    sf      vector(r9),     f17                     ; almacenamos en memoria

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

    ;SE     HAN,            CALCULADO,      OTROS,  CINCO,VALORES,DE,LA,SECUENCIA; EL ENUNCIADO PIDE MULTIPLOS DE 5


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

    addi    r11,            r10,            10
    seq     r11,            r8,             15
    bnez    r11,            fin
    addi    r9,             r9,             20      ; incrementamos el puntero del vector



    movf    f2,             f14                     ; cargamos el valor de la secuencia en n-2
    movf    f3,             f17                     ; cargamos el valor de la secuencia en n-1
    addf    f4,             f2,             f3      ; calculamos el valor de la secuencia en n
                                                    ; se aprovecha el tiempo que se tarda en guardar el valor en memoria para almacenar el valor de la secuencia en el vector
    sf      vector-16(r9),  f4                      ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f8,             f3,             f4      ; calculamos el valor de la secuencia en n
    sf      vector-12(r9),  f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f11,            f8,             f4      ; calculamos el valor de la secuencia en n
    sf      vector-8(r9),   f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f14,            f11,            f8      ; calculamos el valor de la secuencia en n
    sf      vector-4(r9),   f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]

    addf    f17,            f14,            f11     ; calculamos el valor de la secuencia en n

    sf      vector(r9),     f17                     ; almacenamos en memoria

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

; OTROS 5 VALORES DE LA SECUENCIA HAN SIDO CALCULADOS

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

    addi    r11,            r10,            10
    seq     r11,            r8,             20
    bnez    r11,            fin
    addi    r9,             r9,             20      ; incrementamos el puntero del vector



    movf    f2,             f14                     ; cargamos el valor de la secuencia en n-2
    movf    f3,             f17                     ; cargamos el valor de la secuencia en n-1
    addf    f4,             f2,             f3      ; calculamos el valor de la secuencia en n
                                                    ; se aprovecha el tiempo que se tarda en guardar el valor en memoria para almacenar el valor de la secuencia en el vector
    sf      vector-16(r9),  f4                      ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f8,             f3,             f4      ; calculamos el valor de la secuencia en n
    sf      vector-12(r9),  f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f11,            f8,             f4      ; calculamos el valor de la secuencia en n
    sf      vector-8(r9),   f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f14,            f11,            f8      ; calculamos el valor de la secuencia en n
    sf      vector-4(r9),   f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f17,            f14,            f11     ; calculamos el valor de la secuencia en n

    sf      vector(r9),     f17                     ; almacenamos en memoria

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

; OTROS 5 VALORES DE LA SECUENCIA HAN SIDO CALCULADOS
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

    addi    r11,            r10,            10
    seq     r11,            r8,             25
    bnez    r11,            fin
    addi    r9,             r9,             20      ; incrementamos el puntero del vector



    movf    f2,             f14                     ; cargamos el valor de la secuencia en n-2
    movf    f3,             f17                     ; cargamos el valor de la secuencia en n-1
    addf    f4,             f2,             f3      ; calculamos el valor de la secuencia en n
    sf      vector-16(r9),  f4                      ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f8,             f3,             f4      ; calculamos el valor de la secuencia en n
    sf      vector-12(r9),  f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f11,            f8,             f4      ; calculamos el valor de la secuencia en n
    sf      vector-8(r9),   f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f14,            f11,            f8      ; calculamos el valor de la secuencia en n
    sf      vector-4(r9),   f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f17,            f14,            f11     ; calculamos el valor de la secuencia en n

    sf      vector(r9),     f17                     ; almacenamos en memoria


; end secuencia













fin:
    addf    f20,            f17,            f14
    addf    f8,             f3,             f4

    addf    f21,            f20,            f8
    
        subf f21,f0
        sf  suma,f21    
    trap    0




; no se esta ejecutando el codigo de abajo
opMat:
    movf    f20,            f3
    sf      M,              f3
    movf    f21,            f4
    sf      M+4,            f4
    movf    f22,            f8
    sf      M+8,            f8
    movf    f23,            f11
    sf      M+12,           f11
    jr      r31