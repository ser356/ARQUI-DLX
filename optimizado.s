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
.text
.global main
main:
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;
                                                    ; Calculo de los primeros 10 elementos de la secuencia
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;
    lf      f0,             valor_inicial           ; f0=5.0
    lw      r8,             tamanho                 ; r8=30 pero se puede utilizar cualquier valor en rango de 10 a 30
    addi    r9,             r0,             0       ; inicializamos el puntero de posicion del vector
    sf      vector+4(r9),   f1                      ; primera posicion del vector a 0 puesto que el primer valor d ela secuencia es 0
    sf      vector+8(r9),   f0                      ; segunda posicion del vector a 5 ya que es el valor inicial, segundo elemento en la secuencia
    addf    f18,            f0,             f1
    sf      vector+12(r9),  f18                     ; almacenamos en memoria el valor de la secuencia en vector[n]
    addf    f19,            f18,            f0
    sf      vector+16(r9),  f19                     ; almacenamos en memoria el valor de la secuencia en vector[n]
    addf    f20,            f19,            f18
    sf      vector+20(r9),  f20                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addi    r9,             r9,             20      ; incrementamos el puntero del vector



    movf    f2,             f19                     ; cargamos el valor de la secuencia en n-2
    movf    f3,             f20                     ; cargamos el valor de la secuencia en n-1
    addf    f4,             f2,             f3
    sf      vector-16(r9),  f4                      ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f8,             f3,             f4
    sf      vector-12(r9),  f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f11,            f8,             f4
    sf      vector-8(r9),   f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f14,            f11,            f8
    sf      vector-4(r9),   f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f17,            f14,            f11

    sf      vector(r9),     f17                     ; almacenamos en memoria

    add     r10,            r0,             10      ; hasta este momento no ha sido necesario determinar en que punto de la secuencia se encuentra el programa
                                                    ; inicializamos r10 y evaluamos si el valor de r8 es mayor que 10, en caso de serlo, se ejecutara fin
    addi    r11,            r10,            10
    seqi    r11,            r8,             10
    bnez    r11,            fin

    addi    r9,             r9,             20      ; incrementamos el puntero del vector



    movf    f2,             f14
    movf    f3,             f17
    addf    f4,             f2,             f3
    sf      vector-16(r9),  f4                      ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f8,             f3,             f4
    sf      vector-12(r9),  f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f11,            f8,             f4
    sf      vector-8(r9),   f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f14,            f11,            f8
    sf      vector-4(r9),   f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f17,            f14,            f11

    sf      vector(r9),     f17                     ; almacenamos en memoria

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

; +5valores


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

    addi    r11,            r10,            10
    seq     r11,            r8,             15
    bnez    r11,            fin
    addi    r9,             r9,             20      ; incrementamos el puntero del vector



    movf    f2,             f14
    movf    f3,             f17
    addf    f4,             f2,             f3
    sf      vector-16(r9),  f4                      ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f8,             f3,             f4
    sf      vector-12(r9),  f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f11,            f8,             f4
    sf      vector-8(r9),   f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f14,            f11,            f8
    sf      vector-4(r9),   f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]

    addf    f17,            f14,            f11
    sf      vector(r9),     f17                     ; almacenamos en memoria

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

; OTROS 5 VALORES DE LA SECUENCIA HAN SIDO CALCULADOS

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

    addi    r11,            r10,            10
    seq     r11,            r8,             20
    bnez    r11,            fin
    addi    r9,             r9,             20      ; incrementamos el puntero del vector



    movf    f2,             f14
    movf    f3,             f17
    addf    f4,             f2,             f3
                                                    ; se aprovecha el tiempo que se tarda en guardar el valor en memoria para almacenar el valor de la secuencia en el vector
    sf      vector-16(r9),  f4                      ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f8,             f3,             f4
    sf      vector-12(r9),  f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f11,            f8,             f4
    sf      vector-8(r9),   f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f14,            f11,            f8
    sf      vector-4(r9),   f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f17,            f14,            f11

    sf      vector(r9),     f17                     ; almacenamos en memoria

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

; OTROS 5 VALORES DE LA SECUENCIA HAN SIDO CALCULADOS
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;

    addi    r11,            r10,            10
    seq     r11,            r8,             25
    bnez    r11,            fin
    addi    r9,             r9,             20      ; incrementamos el puntero del vector



    movf    f2,             f14
    movf    f3,             f17
    addf    f4,             f2,             f3
    sf      vector-16(r9),  f4                      ; almacenamos en memoria el valor de la secuencia en vector[n]


    addf    f8,             f3,             f4
    sf      vector-12(r9),  f8                      ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f11,            f8,             f4
    sf      vector-8(r9),   f11                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f14,            f11,            f8
    sf      vector-4(r9),   f14                     ; almacenamos en memoria el valor de la secuencia en vector[n]



    addf    f17,            f14,            f11

    sf      vector(r9),     f17                     ; almacenamos en memoria

    


; end secuencia













fin:
  
  jal opMat

; calculamos 2valores mas de la suma
; nuevo = f17 +f14
; ultimo=nuevo+f17
; sf suma,ultimo

    addf    f20,            f17,            f14
    addf    f21,            f20,            f17
    subf    f21,            f21,            f0
    sf      suma,           f21



    trap    0                                       ; fin programa





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