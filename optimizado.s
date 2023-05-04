.data
valor_inicial: .float 5.0
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
cuatro: .float 4.0
.text
.global main
main:
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;
                                                    ; Calculo de los primeros 10 elementos de la secuencia
    lf      f1,             cuatro
    lf      f0,             valor_inicial           ; f0=5.0
    lw      r8,             tamanho
    addi    r9,             r0,             120     ; incrementamos el puntero del vector
    sf      vector-116(r9), f0                      ; almacenamos en memoria el valor de la secuencia en vector[n]
    sf      vector-112(r9), f0                      ; segunda posicion del vector a 5 ya que es el valor inicial, segundo elemento en la secuencia
    addf    f18,            f0,             f0      ; calculamos el valor de la secuencia en n

    sf      vector-108(r9), f18                     ; almacenamos en memoria el valor de la secuencia en vector[n]
    addf    f19,            f18,            f0      ; calculamos el valor de la secuencia en n

    sf      vector-104(r9), f19                     ; almacenamos en memoria el valor de la secuencia en vector[n]
    addf    f20,            f19,            f18     ; calculamos el valor de la secuencia en n

    sf      vector-100(r9), f20                     ; almacenamos en memoria el valor de la secuencia en vector[n]





    movf    f2,             f19                     ; cargamos el valor de la secuencia en n-2
    movf    f3,             f20                     ; cargamos el valor de la secuencia en n-1
    addf    f4,             f19,            f20     ; calculamos el valor de la secuencia en n
    sf      vector-96(r9),  f4                      ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f8,             f3,             f4      ; calculamos el valor de la secuencia en n
    sf      vector-92(r9),  f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f11,            f8,             f4      ; calculamos el valor de la secuencia en n
    sf      vector-88(r9),  f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f14,            f11,            f8      ; calculamos el valor de la secuencia en n
    sf      vector-84(r9),  f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f17,            f14,            f11     ; calculamos el valor de la secuencia en n

    addf    f15,            f17,            f14     ; calculamos el valor de la secuencia en 11 nos sirve que este calculado antes


    sf      vector-80(r9),  f17                     ; almacenamos en memoria


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

    jal     opMat                                   ; SALTO INCONDICIONAL PARA CALCULAR MATRIZ ASOCIADA A LA SECUENCIA
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;
    addi    r11,            r10,            10
    seqi    r11,            r8,             10
    bnez    r11,            fin





; se aprovecha el tiempo que se tarda en guardar el valor en memoria para almacenar el valor de la secuencia en el vector
    sf      vector-76(r9),  f15                     ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f8,             f15,            f17     ; calculamos el valor de la secuencia en n
    sf      vector-72(r9),  f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f11,            f8,             f15     ; calculamos el valor de la secuencia en n
    sf      vector-68(r9),  f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f14,            f11,            f8      ; calculamos el valor de la secuencia en n
    sf      vector-64(r9),  f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f17,            f14,            f11     ; calculamos el valor de la secuencia en n

    sf      vector-60(r9),  f17                     ; almacenamos en memoria

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

    ;SE     HAN,            CALCULADO,      OTROS,  CINCO,VALORES,DE,LA,SECUENCIA; EL ENUNCIADO PIDE MULTIPLOS DE 5


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

    addi    r11,            r10,            10
    seq     r11,            r8,             15
    bnez    r11,            fin



    movf    f2,             f14                     ; cargamos el valor de la secuencia en n-2
    movf    f3,             f17                     ; cargamos el valor de la secuencia en n-1
    addf    f4,             f2,             f3      ; calculamos el valor de la secuencia en n
                                                    ; se aprovecha el tiempo que se tarda en guardar el valor en memoria para almacenar el valor de la secuencia en el vector
    sf      vector-56(r9),  f4                      ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f8,             f3,             f4      ; calculamos el valor de la secuencia en n
    sf      vector-52(r9),  f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f11,            f8,             f4      ; calculamos el valor de la secuencia en n
    sf      vector-48(r9),  f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f14,            f11,            f8      ; calculamos el valor de la secuencia en n
    sf      vector-44(r9),  f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]

    addf    f17,            f14,            f11     ; calculamos el valor de la secuencia en n

    sf      vector-40(r9),  f17                     ; almacenamos en memoria

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

; OTROS 5 VALORES DE LA SECUENCIA HAN SIDO CALCULADOS

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

    addi    r11,            r10,            10
    seq     r11,            r8,             20
    bnez    r11,            fin



    movf    f2,             f14                     ; cargamos el valor de la secuencia en n-2
    movf    f3,             f17                     ; cargamos el valor de la secuencia en n-1
    addf    f4,             f2,             f3      ; calculamos el valor de la secuencia en n
                                                    ; se aprovecha el tiempo que se tarda en guardar el valor en memoria para almacenar el valor de la secuencia en el vector
    sf      vector-36(r9),  f4                      ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f8,             f3,             f4      ; calculamos el valor de la secuencia en n
    sf      vector-32(r9),  f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f11,            f8,             f4      ; calculamos el valor de la secuencia en n
    sf      vector-28(r9),  f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f14,            f11,            f8      ; calculamos el valor de la secuencia en n
    sf      vector-24(r9),  f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f17,            f14,            f11     ; calculamos el valor de la secuencia en n

    sf      vector-20(r9),  f17                     ; almacenamos en memoria

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

; OTROS 5 VALORES DE LA SECUENCIA HAN SIDO CALCULADOS
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

    addi    r11,            r10,            10
    seq     r11,            r8,             25
    bnez    r11,            fin



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




; end secuencia













fin:


; al no calcular algunos valores por ahorrar instrucciones, existe offset en el puntero del vector
; por lo que ahora en vez de calcular dos valores mas de la secuencia se calcula uno mas y se almacena en memoria
    addf    f28,            f17,            f14     ; calculamos el valor de la secuencia en n reutilizamos registro no pasa nada
    subf    f29,            f28,            f0
    sf      suma,           f29
    trap    0




opMat:
    movf    f20,            f3                      ; primer valor de la matriz
    movf    f23,            f11                     ; ultimo valor de la matriz
    multf   f10,            f20,            f23     ; calculo diagonal principal

    movf    f21,            f4                      ; segundo valor de la matriz
    movf    f22,            f8                      ; tercer valor de la matriz
    subf    f27,            f17,            f21     ; calculo de la suma total de la matriz
                                                    ; extrapolando el calculo de la progresion aritmetica
                                                    ; se obtiene la formula de la suma de los elementos de la matriz

    multf   f11,            f21,            f22     ; calculamos diagonal secundaria
    divf    f28,            f27,            f1      ; calculo de la media de la matriz M




    subf    f12,            f10,            f11     ; calculo de la determinante

    divf    f29,            f28,            f12     ; calculo de la media de la matriz V
                                                    ; mediaM entre determinanteM




    sf      M,              f20
    sf      M+4,            f21
    sf      M+8,            f22
    sf      M+12,           f23

    sf      detM,           f12
    sf      mediaM,         f28
    sf      mediaV,         f29
    jr      r31