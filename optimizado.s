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
uno: .float 1.0
.text
.global main
main:
    lf      f0,             valor_inicial

    addi    r9,             r0,             120     ; puntero al vector 120=30*4 podemos desplazarnos por todo el vector de un salto

; los dos stores seguidos se reordenan para aprovechar el tiempo de calculo de la multiplicacion
; calculo de la secuencia hasta 10 terminos
; se adelantan hasta 3 (10+3)valores de la siguiente secuencia para que el calculo sea optimizado
; ademas los valores 11 y 12 sirven para calcular la media de la secuencia
    addf    f18,            f0,             f0
    lw      r8,             tamanho

    addf    f19,            f18,            f0


    sf      vector-104(r9), f19


    addf    f20,            f19,            f18
    lf      f3,             uno

    addf    f4,             f20,            f19

    sf      vector-100(r9), f20

    sf      vector-96(r9),  f4



    addf    f8,             f20,            f4
    sf      vector-92(r9),  f8


    addf    f11,            f8,             f4
    sf      vector-88(r9),  f11
    sf      M+8,            f8

    multf   f10,            f20,            f11
    sf      vector-108(r9), f18

    addf    f14,            f11,            f8

    lf      f1,             cuatro

    multf   f12,            f4,             f8

    sf      vector-84(r9),  f14




    sf      vector-116(r9), f0                      ; se han introducido aqui para aprovechar el tiempo de calculo de la multiplicacion

    subf    f13,            f10,            f12

    sf      detM,           f13

    divf    f8,             f3,             f13

    sf      vector-112(r9), f0

    multf   f7,             f8,             f20
    sf      M,              f20


    sf      mediaV,         f29

    sf      detV,           f8

    addf    f17,            f14,            f11

    multf   f16,            f8,             f4
    sf      V,              f7

    addf    f15,            f17,            f14
    subf    f27,            f17,            f4

    divf    f28,            f27,            f1
    sf      mediaM,         f28
    sf      M+4,            f4
    multf   f29,            f28,            f8
    sf      V+4,            f16

    addf    f30,            f16,            f7
    sf      M+12,           f11

    addf    f2,             f16,            f30
    sf      V+8,            f30
    sf      V+12,           f2

    sf      mediaV,         f29
    seqi    r11,            r8,             10

    addf    f8,             f7,             f6
    addf    f4,             f15,            f17
    movf    f22,            f15

; salto condicional para valores de la secuencia hasta 10

    bnez    r11,            fin







; Calculamos el resto de los valores de la secuencia

    sf      vector-80(r9),  f17



    addf    f5,             f4,             f15
    sf      vector-68(r9),  f5

    addf    f6,             f5,             f4
    sf      vector-64(r9),  f6


; se adelantan 3 de la siguiente
    addf    f7,             f6,             f5
    sf      vector-76(r9),  f15


    addf    f8,             f7,             f6
    sf      vector-72(r9),  f4

    seqi    r11,            r8,             15

    movf    f22,            f8
    addf    f9,             f8,             f7

; salto condicional para valores de la secuencia hasta 15
    bnez    r11,            fin





    addf    f10,            f9,             f8
    sf      vector-48(r9),  f10

    addf    f11,            f10,            f9
    sf      vector-44(r9),  f11

    addf    f12,            f11,            f10
    sf      vector-60(r9),  f7

    addf    f13,            f12,            f11
    sf      vector-56(r9),  f8

    movf    f22,            f13
    sf      vector-52(r9),  f9
    seqi    r11,            r8,             20

    addf    f14,            f13,            f12
                                                    ; se pueden adelantar hasta 3 valores de la secuencia para que el calculo sea optimizado
    bnez    r11,            fin








    addf    f15,            f14,            f13
    sf      vector-28(r9),  f15

    addf    f16,            f15,            f14
    sf      vector-24(r9),  f16
    addf    f17,            f16,            f15
    sf      vector-40(r9),  f12

    addf    f18,            f17,            f16
    sf      vector-36(r9),  f13

    movf    f22,            f18
    sf      vector-32(r9),  f14
    seqi    r11,            r8,             25

    addf    f19,            f18,            f17
    bnez    r11,            fin







    sf      vector-12(r9),  f19

    addf    f20,            f19,            f18
    sf      vector-8(r9),   f20

    addf    f21,            f20,            f19
    sf      vector-4(r9),   f21

    addf    f22,            f21,            f20
    sf      vector-20(r9),  f17

    addf    f23,            f22,            f21
    sf      vector-16(r9),  f18

    subf    f23,            f23,            f0
    sf      suma,           f23
    trap    0

fin:
    subf    f23,            f22,            f0
    sf      suma,           f23
    trap    0