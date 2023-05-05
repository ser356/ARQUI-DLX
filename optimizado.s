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
uno:    .float 1.0
.text
.global main
main:
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;
                                                    ; Calculo de los primeros 10 elementos de la secuencia
    lf      f1,             cuatro
    lf      f0,             valor_inicial           ; f0=5.0
    lw      r8,             tamanho
    addi    r9,             r0,             120     ; incrementamos el puntero del vector para poder recorrerlo al completo
                                                    ; nos podemos saltar el primer valor ya que la memoria esta rellena de 0.0 y este es el valor cero de la secuencia

    sf      vector-116(r9), f0                      ; almacenamos en memoria el valor uno
    sf      vector-112(r9), f0                      ; segunda posicion del vector a 5
    addf    f18,            f0,             f0

; vamos calculando los correspondientes valores de la secuencia y los almacenamos en memoria

    sf      vector-108(r9), f18
    addf    f19,            f18,            f0

    sf      vector-104(r9), f19
    addf    f20,            f19,            f18

    sf      vector-100(r9), f20



    addf    f4,             f20,            f19


    sf      vector-96(r9),  f4


    addf    f8,             f20,            f4
    sf      vector-92(r9),  f8



    addf    f11,            f8,             f4
    sf      vector-88(r9),  f11



    addf    f14,            f11,            f8
    sf      vector-84(r9),  f14



    addf    f17,            f14,            f11

; hasta aqui hemos calculado los primeros 10 valores de la secuencia

    addf    f15,            f17,            f14     ; calculamos el valor de la secuencia en 11 nos sirve que este calculado antes


    sf      vector-80(r9),  f17                     ; almacenamos en memoria el numero 10 de la secuencia


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

    jal     opMat                                   ; SALTO INCONDICIONAL PARA CALCULAR MATRIZ ASOCIADA A LA SECUENCIA
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;
    addi    r11,            r10,            10
    seqi    r11,            r8,             10
    bnez    r11,            fin



; el comportamiento del algoritmo descrito anteriormente es similar a continuacion
; se calculan los siguientes 5 valores de la secuencia y se almacenan en memoria

    sf      vector-76(r9),  f15


    addf    f8,             f15,            f17
    sf      vector-72(r9),  f8



    addf    f11,            f8,             f15
    sf      vector-68(r9),  f11



    addf    f14,            f11,            f8
    sf      vector-64(r9),  f14



    addf    f17,            f14,            f11


    addf    f15,            f17,            f14     ; calculamos el valor de la secuencia en  16 nos sirve que este calculado antes

    sf      vector-60(r9),  f17                     ; almacenamos en memoria el número 15 de la secuencia



    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

    ;SE     HAN,            CALCULADO,      OTROS,  CINCO,VALORES,DE,LA,SECUENCIA; EL ENUNCIADO PIDE MULTIPLOS DE 5


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

    addi    r11,            r10,            10
    seq     r11,            r8,             15
    bnez    r11,            fin



    sf      vector-56(r9),  f15


    addf    f8,             f15,            f17
    sf      vector-52(r9),  f8



    addf    f11,            f8,             f15
    sf      vector-48(r9),  f11


    addf    f14,            f11,            f8
    sf      vector-44(r9),  f14

    addf    f17,            f14,            f11

    addf    f15,            f17,            f14     ; calculamos el valor de la secuencia en  21 nos sirve que este calculado antes

    sf      vector-40(r9),  f17                     ; almacenamos en memoria el número 20 de la secuencia

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

; OTROS 5 VALORES DE LA SECUENCIA HAN SIDO CALCULADOS

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

    addi    r11,            r10,            10
    seq     r11,            r8,             20
    bnez    r11,            fin



    sf      vector-36(r9),  f15                     ; almacenamos en memoria el valor de la secuencia calculado antes


    addf    f8,             f15,            f17
    sf      vector-32(r9),  f8



    addf    f11,            f8,             f15
    sf      vector-28(r9),  f11



    addf    f14,            f11,            f8
    sf      vector-24(r9),  f14



    addf    f17,            f14,            f11

    addf    f15,            f17,            f14     ; calculamos el valor de la secuencia en  26 nos sirve que este calculado antes

    sf      vector-20(r9),  f17                     ; almacenamos en memoria

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

; OTROS 5 VALORES DE LA SECUENCIA HAN SIDO CALCULADOS
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

    addi    r11,            r10,            10
    seq     r11,            r8,             25
    bnez    r11,            fin


    sf      vector-16(r9),  f15


    addf    f8,             f15,            f17
    sf      vector-12(r9),  f8



    addf    f11,            f8,             f15
    sf      vector-8(r9),   f11



    addf    f14,            f11,            f8
    sf      vector-4(r9),   f14



    addf    f5,             f14,            f11

    addf    f28,            f5,             f14 


; end secuencia













fin:



    subf    f16,            f28,            f0      ; hay que ser justos en esta vida y calcular el ultimo valor de la secuencia
    sf      suma,           f16
    trap    0




opMat:

    multf   f10,            f20,            f11     ; calculo diagonal principal


    subf    f27,            f17,            f4      ; calculo de la suma total de la matriz
    multf   f12,            f4,             f8      ; calculamos diagonal secundaria
    divf    f28,            f27,            f1      ; calculo de la media de la matriz M




    subf    f13,            f10,            f12     ; calculo de la determinante
    divf    f6,             f2,             f13     ; calculo de la determinante
    sf      detM,           f13

    divf    f29,            f28,            f13     ; calculo de la media de la matriz V




    sf      M,              f20
    sf      M+4,            f4
    sf      M+8,            f8
    sf      M+12,           f11
    sf      detV,           f6
    sf      mediaM,         f28
    sf      mediaV,         f29
    jr      r31