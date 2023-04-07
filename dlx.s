;                                                                                             
;#####  #####   ####  #####  ####  #####  ####  ##### # #####   ####     #####  #      #    # 
;#    # #    # #    #   #   #    #   #   #    #   #   # #    # #    #    #    # #       #  #  
;#    # #    # #    #   #   #    #   #   #    #   #   # #    # #    #    #    # #        ##   
;#####  #####  #    #   #   #    #   #   #    #   #   # #####  #    #    #    # #        ##   
;#      #   #  #    #   #   #    #   #   #    #   #   # #      #    #    #    # #       #  #  
;#      #    #  ####    #    ####    #    ####    #   # #       ####     #####  ###### #    # 
;                                                                                             
;variables de entrada: no modificar
    

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
    
    lf f0,valor_inicial
    lw r8,tamanho


    ;inicializar valores para secuencia de fibonacci antes del loop...todos los registros a utilizar deben ser inicializados aunque sea con cero;
    ;vease que para la suma de terminos se inicializa en esta region


    addi r9,r0,0
 
    lf  f1,zero_float
  
    sf  vector(r9),f1

    addi r9,r9,4 
 
    sf   vector(r9),f0  

    addi r10,r0,2  ;contador empieza en 2  

     

    
    lf f5,suma

    addf f5,f5,f1

    addf f5,f5,f0


    sf   suma,f5   ;calculamos los primeros dos factores de la secuencia y los almacenamos
    
    loop:

	addi r9,r9,4  ;incremento del counter float

        lf   f2,vector-8(r9) ; cargamos el valor en el registro f2 del vector en a[n-1]

	lf   f3,vector-4(r9) ; cargamos el valor en el registro f2 del vector en a[n-2]

	addf f4,f2,f3        

	sf   vector(r9),f4
   
        seq  r11,r10,r8   

        bnez r11,calculoMatriz
       
        addf f5,f5,f4

        sf   suma,f4

        addi r10,r10,1  ;r10++

        j loop


       ;una vez conseguido el vector podemos calcular el resto de elementos, la matriz, la matriz asociada v y los determinantes


    
       ;hasta el momento han sido usados los registros f0,f1,f2,f3,f4,f5

       ;y r0,r1,r10,r11,r9

 
   
  
  calculoMatriz:
         
        lf f14,cuatro  ; cuarto.cero para poder operar, dimension de la matriz

	lf  f6,vector+20 ; cargamos de memoria vector[6]

        sf  m,f6  ; lo almacenamos en f6

        lf  f7,vector+24 ; cargamos de memoria vector[7]

        sf  m+4,f7 ; lo almacenamos en f7

        lf  f8,vector+28 ; cargamos de memoria vector[8]


        sf  m+8,f8 ; lo almacenamos en f8


        lf  f9,vector+32 ; cargamos de memoria vector[9]

        sf  m+12,f9 ; lo almacenamos en f9

        addf f12,f6,f7   ;añadimos los dos primeros valores porque al estar vacio podemos aprovechar los operandos

        addf f12,f12,f9  ;añadimos el tercer miembro
        
        addf f12,f12,f8  ; añadimos el cuarto miembro

        divf f13,f12,f14  ; dividir por cuatro 
        
       


        sf    mediam,f13  ; lo almacenamos en media


  calculoDeterminante:


       ;una vez alojados en los registros los valores de la matriz, realizar el cálculo del determinante consiste en la resta de las diagonales

       multf f10,f6,f9 ; multiplicar primera diagonal

       multf f11,f7,f8 ; multiplicar segunda diagonal

       subf f12,f10,f11 ; realizar la resta en f12
       
       sf   detm,f12 ; alojar en memoria

    finish:
        
        trap 0 
         
    