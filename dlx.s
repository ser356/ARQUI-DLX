;                                                                                             
;#####  #####   ####  #####  ####  #####  ####  ##### # #####   ####     #####  #      #    # 
;#    # #    # #    #   #   #    #   #   #    #   #   # #    # #    #    #    # #       #  #  
;#    # #    # #    #   #   #    #   #   #    #   #   # #    # #    #    #    # #        ##   
;#####  #####  #    #   #   #    #   #   #    #   #   # #####  #    #    #    # #        ##   
;#      #   #  #    #   #   #    #   #   #    #   #   # #      #    #    #    # #       #  #  
;#      #    #  ####    #    ####    #    ####    #   # #       ####     #####  ###### #    # 
;    
                                   ; variables de entrada: no modificar
.data
valor_inicial: .float 5
tamanho: .word 30
                                                        ; variables de salida: no modificar orden (todas formato float)
vector: .space 120
suma: .float 0
m: .float 0.0, 0.0, 0.0, 0.0
detm: .float 0.0
mediam: .float 0.0
v: .float 0.0, 0.0, 0.0, 0.0
detv: .float 0.0
mediav: .float 0.0
floatcount32: .word 0
zero_float: .float 0.0
cuatro: .float 4.0
.text
.global main
main:

    lf      f14,                cuatro                  ; f14=4.0
    lf      f0,                 valor_inicial           ; f0=5.0
    lw      r8,                 tamanho                 ; r8=30 pero se puede utilizar cualquier valor en rango de 10 a 30
    addi    r9,                 r0,             0       ; inicializamos el puntero de posicion del vector
    lf      f1,                 zero_float              ; f1=0 equivale a 0 para los registros float
    addf    f5,                 f5,             f1      ; se inicializa la suma a 0
    sf      vector(r9),         f1                      ; primera posicion del vector a 0 puesto que el primer valor d ela secuencia es 0
    addi    r9,                 r9,             4       ; incrementamos el puntero del vector en 4 bytes puesto que es un float
    sf      vector(r9),         f0                      ; segunda posicion del vector a 5 ya que es el valor inicial, segundo elemento en la secuencia
    addi    r10,                r0,             2       ; inicializamos el contador de tamanho de la secuencia
    addf    f5,                 f5,             f0      ; sumamos el valor inicial a la suma
    sf      suma,               f5                      ; almacenamos la suma en la posicion suma de memoria
loop:                                                   ; bucle principal contiene el algoritmo de calculo estilo fibonacci cc/ralves

    ;f2=vector-8(r9);f3=vector-4(r9)                    ; f4=vector(r9) a[n]=a[n-1]+a[n-2]
    addi    r9,                 r9,             4       ; incrementamos el puntero del vector
    lf      f2,                 vector-8(r9)
    lf      f3,                 vector-4(r9)
    addf    f4,                 f2,             f3      ; calculamos el valor de la secuencia en n
    sf      vector(r9),         f4                      ; almacenamos en memoria
    addi    r10,                r10,            1       ; incrementamos el contador de tamanho de la secuencia
    seq     r11,                r10,            r8      ; comparamos el tamanho actual con el tamanho maximo
    bnez    r11,                calculoMatriz           ; branch if not equal to zero, si hemos llegado al tamanho maximo salimos del bucle
    addf    f5,                 f5,             f4      ; si no hemos llegado al tamanho maximo sumamos el valor de la secuencia a la suma
    sf      suma,               f4                      ; almacenamos la suma en la posicion suma de memoria
    j       loop                                        ; iteramos

; una vez conseguido el vector podemos calcular el resto de elementos, la matriz, la matriz asociada v y los determinantes
; hasta el momento han sido usados los registros f0,f1,f2,f3,f4,f5
; y r0,r1,r10,r11,r9

calculoMatriz:                                          ; calculo de la matriz aqui se usan los registros f6,f7,f8,f9
    lf      f6,                 vector+20               ; cargamos en el registro f6 el valor de la posicion 20 del vector equivalente al elemento numero 5 de la secuencia
    lf      f7,                 vector+24               ; cargamos en el registro f7 el valor de la posicion 24 del vector equivalente al elemento numero 6 de la secuencia
    lf      f8,                 vector+28               ; cargamos en el registro f8 el valor de la posicion 28 del vector equivalente al elemento numero 7 de la secuencia
    lf      f9,                 vector+32               ; cargamos en el registro f9 el valor de la posicion 32 del vector equivalente al elemento numero 8 de la secuencia
    j       saveMatriz                                  ; salto auxiliar para guardar los valores en memoria. Una buena forma de optimizarlo ha sido elegir escribir en memoria cuando ya se ha trabajado con todos los registros, eliminando posibles dependencias RAW

calculoMedia:
    addf    f15,                f14,            f1      ; intentamos eliminar el stall de lectura f15=4+0 en vez de cargar de memoria leo del registro f1 que ya se cargo con el valor 0 y de f14 que se cargo con el valor 4 al principio del programa
    addf    f10,                f7,             f8
    addf    f11,                f9,             f6
    addf    f12,                f10,            f11     ; obtenemos la suma de todos los elementos de la matriz
    divf    f13,                f10,            f15     ; obtenemos la media de la matriz
    j       saveMedia                                   ; salto auxiliar para guardar los valores en memoria. Al igual que en el calculo de la matriz, se ha elegido escribir en memoria al final de la operacion para evitar dependencias RAW.
saveMatriz:
    sf      m,                  f6                      ; guardamos el primer elemento de la matriz en memoria
    sf      m+4,                f7                      ; guardamos el segundo elemento de la matriz en memoria
    sf      m+8,                f8                      ; guardamos el tercer elemento de la matriz en memoria
    sf      m+12,               f9                      ; guardamos el cuarto elemento de la matriz en memoria
    j       calculoMedia                                ; salto al calculo de la media de la matriz
saveMedia:
    sf      mediam,             f15
    trap    0                                           ; fin del programa aquí se obtienen dependencias pero no se por que todavía.