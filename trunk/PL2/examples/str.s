########################## PRÁCTICA OBLIGATORIA DE PROGRAMACIÓN EN ENSAMBLADOR	#########################
#                         										#										
#    formato str: [xx"    "]										#
#     - xx = tamaño											#
#     - "" = texto											#
#													#
#   --> strcpy (ok); strncpy (ok)									#
#   --> strlen (ok)											#
#   --> strcat (ok); strncat ()										#
#   --> strcmp (); strncmp ()										#
#   --> strchr (); strrchr ()										#
#   --> toupper (); tolower (); strupr (); strlwr ()							#
#   --> atol (); atof (  )										#
#   --> strstr ()											#
#   --> printf ()											#
#													#
#########################################################################################################


####################################quitar estas lineas para entregar#########################################
.data

prueba: .byte 0
	.byte 5
	.ascii "aola0"


prueba2: .byte 0
	 .byte 4
	 .ascii "Hola"

letra:	.ascii "0"

msintro:
  .asciiz "\n"

pruebaNum: .byte 0
	   .byte 12
	   .ascii "  -4653.7558"

msaux:
  .asciiz " -->"

imp: .byte 0,6
	.ascii "Imp:%f"
	
msaux2: .asciiz "-"

msTamCadena:
  .asciiz "Tam_cadena = "

.text

.globl main
main:

#Reserva de la pila (para reservar espacio se resta en el puntero de pila)
sub $sp,$sp,16

#Salvado de $ra
sw $ra,($sp)

#salvado de parametros
sw $a0, 4($sp)
sw $a1, 8($sp)
sw $a2, 12($sp)

#Cuerpo del programa

la $a0, pruebaNum
la $a1, letra
lb $a1, ($a1)
li $a2, 3
jal atof


move $a1, $v0
la $a0, imp
jal printf

#Restauracion de parametros
lw $a0, 4($sp)
lw $a1, 8($sp)
lw $a2, 12($sp)

#restauracion de $ra
lw $ra,($sp)

#liberacion de la pila
add $sp,$sp,16

#salida 
jr $ra
#############################################Quitar hasta aqui########################################

            #--------------------------------------------------------------------------------#
            ##                                 -- strcpy --                                 ##

strcpy:

#Salvado de variables:
  #Reserva de la pila
  sub $sp,$sp,12

  #Salvado de $ra y parametros
  sw $ra,  ($sp)
  sw $a0, 4($sp)
  sw $s0, 8($sp)

#Cuerpo del programa:
  #if ($a0 == 0) --> $v0 = 0
  beqz $a0,strcpyCaso1
 
  #else if ($a1 == 0) --> $v0 = cadena vacia( "00")
  beqz $a1,strcpyCaso2

  # Caso 3: Tenemos una cadena para copiar
    # Lee el tamaño de la cadena
    move $s0,$a0	#Almacenamos la direccion a la cadena destino
    move $a0,$a1
    jal strlen
    move $t0,$v0	#Guardamos el tamaño de la cadena origen en $t0
    move $v0,$s0	#Marcamos el puntero a la cadena que devolveremos

    #Copiamos el tamaño	de la cadena origen a la destino
    lb $t2,  ($a1)
    sb $t2,  ($s0)
    lb $t2, 1($a1)
    sb $t2, 1($s0)

    # Copia la cadena                     Carga                Guardado
    # $t1 contador, $t2 auxiliar, $a1 = ($a1+$t1+2) && $s0 = ($a0+$t1+2)       
    li $t1,1
    strcpybucle:
    bgtu $t1, $t0, strcpyFin
      lb $t2, 2($a1)
      sb $t2, 2($s0)
      add $t1, $t1, 1
      add $a1, $a1, 1
      add $s0, $s0, 1
    b strcpybucle

  # Caso 1: $a0 == 0
  strcpyCaso1:
    li $v0, 0
    b strcpyFin

  # Caso 2: $a1 == 0
  strcpyCaso2:
    # Metemos la cadena vacia en $a0 y $v0
    li $t0, 0
    sh $t0, ($a0)
    move $v0, $a0

  #fin del metodo strcpy
  strcpyFin:

#Restauracion de parametros
  #Restauracion de variables
  lw $ra,  ($sp)
  lw $a0, 4($sp)
  lw $s0, 8($sp)

  #liberacion de la pila
  add $sp,$sp,12

#salida 
  jr $ra


            #---------------------------------------------------------------------------------#
            ##                                 -- strncpy --                                 ##
strncpy:

#Salvado de variables:
  #Reserva de la pila
  sub $sp,$sp,12

  #Salvado de $ra y parametros
  sw $ra,  ($sp)
  sw $a0, 4($sp)
  sw $s0, 8($sp)

#Cuerpo del programa
  #if $a0 == 0 --> $v0 = 0
  beqz $a0,strncpyCaso1

  #else if $a1 == 0 --> $v0 = cadena vacia( "00")
  beqz $a1,strncpyCaso2

  # Caso 3:
    # Lee el tamaño de la cadena
    move $s0,$a0	#Almacenamos la direccion a la cadena destino
    move $a0,$a1
    jal strlen
    move $t0,$v0	#Guardamos el tamaño de la cadena origen en $t0
    move $v0,$s0	#Marcamos el puntero a la cadena que devolveremos
 
    #if(tamCadena > nACopiar) --> strncpytamano
    bgeu $t0,$a2,strncpytamano

      # Sino Copiamos el tamaño de la cadena 1ª
      lb $t2,  ($a1)
      sb $t2,  ($s0)
      lb $t2, 1($a1)
      sb $t2, 1($s0)
      b strncpytext

      #Metemos el tamaño de los caracteres que vamos a copiar.
      strncpytamano:
      move $t0,$a2	#Metemos el tamaño a copiar en $t0 para restringir la copia
      div $t2, $t0, 256	#Tenemos que formatear el tamaño en base 256
      sb $t2,  ($s0) 
      rem $t2, $t0, 256	#Tenemos que formatear el tamaño en base 256
      sb $t2, 1($s0)

  strncpytext:
  # Copia la cadena                       Carga                Guardado
    # $t1 contador, $t2 auxiliar, $t3 = ($a1+$t1+2) && $t4 = ($a0+$t1+2)
    li $t1,1
    strncpybucle:
    bgtu $t1, $t0, strncpyFin
      lb $t2, 2($a1)
      sb $t2, 2($s0)
      add $t1, $t1, 1
      add $a1, $a1, 1
      add $s0, $s0, 1
    b strncpybucle

  # Caso 1: $a0 == 0
  strncpyCaso1:
    li $v0, 0
    b strncpyFin

  # Caso 2: $a1 == 0
  strncpyCaso2:
    # Metemos la cadena vacia en $a0 y $v0
    li $t0, 0
    sh $t0, ($a0)
    move $v0, $a0

  #fin del metodo strcpy
  strncpyFin:

#Restauracion de parametros
  #Restauracion de variables
  lw $ra,  ($sp)
  lw $a0, 4($sp)
  lw $s0, 8($sp)

  #liberacion de la pila
  add $sp,$sp,12

#salida
  jr $ra

              #--------------------------------------------------------------------------------#
              ##                                 -- strlen --                                 ##
strlen:

#Cuerpo del programa
  #if $a0 == 0 --> $v0 = -1
  beqz $a0,strlenNulo

  #Cargamos el valor numérico del tamaño
  lbu $t0, ($a0)
  lbu $t2,1($a0)
  mul $t0,$t0,256
  add $v0,$t0,$t2
  b strlenFin

  #Devolvemos un nulo
  strlenNulo:
    li $v0,-1

  #fin del metodo strlen
  strlenFin:

#salida 
  jr $ra

                #--------------------------------------------------------------------------------#
                ##                                 -- strcat --                                 ##
strcat:
#Salvado de variables:
  #Reserva de la pila
  sub $sp,$sp,16
  
  #Salvado de $ra y parametros
  sw $ra,   ($sp)
  sw $s0,  4($sp)
  sw $s6,  8($sp)
  sw $s7, 12($sp)

#Cuerpo del programa
  #if $a0 == 0 --> $v0 = 0
  beqz $a0, strcatFin

  #else if $a1 == 0 --> $v0 = $a0
  beqz $a1, strcatFin

  # Else --> Caso 2: 
    #Calculamos el tamaño de la nueva cadena:
      jal strlen
      move $s0, $v0	# $s0 <- tamaño cadena destino
    
      move $s6, $a0	# Guardamos $a0, para restaurarlo inmediatamente despues 
      move $a0, $a1
      jal strlen
      move $t0, $v0	# $t0 <- tamaño cadena origen
      move $a0,$s6	# Guardamos $a0, para restaurarlo inmediatamente despues 
    
      add $t6, $s0, $t0	# $t6 <- tamaño de la suma de las dos cadenas

      # Escribimos el nuevo tamaño
        div $t0, $t6, 256	#Ponemos el tamaño modulo 256
        sb $t0,  ($a0)
        rem $t0, $t6, 256	#Ponemos el tamaño modulo 256
        sb $t0, 1($a0)

    # Almacenamos la cadena origen despues de la destino
      # $t0 -> puntero de escritura
      # $s7 -> puntero de lectura
      # $t9 -> temporal para mover datos
      move $s7,$a1
      add $t0, $a0, $s0
      add $t6, $t6, $a0
      strcatBucle:
        bgeu $t0, $t6, strcatFin

        lb $t9, 2($s7)	#Leemos los bytes de la primera cadena
        sb $t9, 2($t0)  #Guardamos los bytes en la segunda cadena
        add $t0, $t0, 1
        add $s7, $s7, 1
      b strcatBucle

  #fin del metodo strcat
  strcatFin:
    move $v0, $a0

#Restauracion de parametros
  #Restauracion de variables
  lw $ra,   ($sp)
  lw $s0,  4($sp)
  lw $s6,  8($sp)
  lw $s7, 12($sp)
  

  #liberacion de la pila
  add $sp,$sp,16

#salida 
  jr $ra

                #---------------------------------------------------------------------------------#
                ##                                 -- strncat --                                 ##
strncat:

#Reserva de la pila (para reservar espacio se resta en el puntero de pila)
sub $sp,$sp,16

#Salvado de $ra
sw $ra,($sp)

#salvado de parametros
sw $a0, 4($sp)
sw $a1, 8($sp)
sw $a2, 12($sp)

#Cuerpo del programa

#if $a0 == 0 --> $v0 = 0
beqz $a0, strncatCaso1

#else if $a1 == 0 --> $v0 = $a0
beqz $a1, strncatFin

# Caso 2:
  # $s0 <- tamaño cadena destino
  # $s1 <- tamaño cadena origen
  # $t6 <- tamaño suma
  # $t5 <- contador
  # $s6 <- puntero a la cadena destino
  # $s7 <- puntero a la cadena origen
  move $s6, $a0
  move $s7, $a1
  move $s5, $a2
  
  jal strlen
  move $s0, $v0

  move $a0, $a1
  jal strlen
  move $s1, $v0
  
  #if(tamCadena <= nACopiar) --> strncpytamano
  bleu $s1,$s5,strncattamano
 
  #Sumamos al tamaño de la cadena destino los n caracteres
  add $t6, $s0, $a2
  b strnccatUne
  
  #Sumamos al tamaño de la cadena destino el de la cadena origen
  strncattamano:
  add $t6, $s0, $s1

  # Escribimos el nuevo tamaño
  strnccatUne:
  div $t0, $t6, 256
  sb $t0, ($s6)
  rem $t0, $t6, 256
  sb $t0, 1($s6)

  # Almacenamos la cadena origen despues de la destino
  # $t0 -> puntero de escritura
  # $t1 -> puntero de lectura
  # $t9 -> temporal para mover datos
  add $t0, $s6, 2
  add $t0, $t0, $s0
  add $t1, $s7, 2

  li $t5, 1

  strncatBucle:
    bgeu $t5, $t6, strncatCaso3

    lb $t9, ($t1)
    sb $t9, ($t0)
    add $t0, $t0, 1
    add $t1, $t1, 1
    add $t5, $t5, 1
  b strncatBucle

# Caso 1: $a0 == 0
strncatCaso1:  
  b strncatFin

# Caso 3: $a0 != 0 & $a1 != 0
strncatCaso3:
  # Restauramos los valores pasados por parámetros
  move $a0, $s6
  move $a1, $s7


#fin del metodo strncat
strncatFin:

move $v0, $a0

#Restauracion de parametros
lw $a0, 4($sp)
lw $a1, 8($sp)
lw $a2, 12($sp)

#restauracion de $ra
lw $ra,($sp)

#liberacion de la pila
add $sp,$sp,16

#salida 
jr $ra

                #--------------------------------------------------------------------------------#
                ##                                 -- strcmp --                                 ##
strcmp:

#Reserva de la pila (para reservar espacio se resta en el puntero de pila)
sub $sp,$sp,28

#Salvado de $ra
sw $ra,($sp)

#salvado de parametros
sw $a0, 4($sp)
sw $a1, 8($sp)
sw $s0, 12($sp)
sw $s1, 16($sp)
sw $s6, 20($sp)
sw $s7, 24($sp)


#Cuerpo del programa

#Obtenemos los tamaños de las cadenas los tamaños de las cadenas.
  # $s0 <- tamaño cadena destino
  # $s1 <- tamaño cadena origen
  # $s6 <- puntero a la cadena destino
  # $s7 <- puntero a la cadena origen
  move $s6, $a0
  move $s7, $a1
  
  jal strlen
  move $s0, $v0

  move $a0, $a1
  jal strlen
  move $s1, $v0
 
#Inicializamos contador para el bucle
 li $t9,2
#Comparamos los tamaños:
 #if(tamCadena1 >= tamCadena2 --> Caso1)
beq $s0,$s1,strcmpCaso3
bgeu $s0,$s1,strcmpCaso1


# Caso 2: La primera cadena es menor que la segunda.
li $t0,-1
add $t1,$s0,2
b strcmpComparacion

# Caso 3: Las dos cadenas son iguales
strcmpCaso3:
li $t0,0
add $t1,$s0,2
b strcmpComparacion

# Caso1: La primera cadena es mayor o igual a la segunda
strcmpCaso1:
li $t0,1
add $t1,$s1,2

#Comparamos las dos cadenas
strcmpComparacion:
  bgeu $t9,$t1,strcmpprefin
  
  add $t8,$s6,$t9
  lbu $t6,($t8)
  add $t8,$s7,$t9
  lbu $t7,($t8)
  
  #$t5 -> indica en que caso estamos:
  #$t5  a=ñ;b=ñ;a=Ñ;b=Ñ 
  #0-->  0   0   0   0 --> No hay eñes
  #1-->  0   0   0   1 --> La B tiene Ñ
  #2-->  0   0   1   0 --> la A tiene Ñ
  #3-->  0   1   0   0 --> la B tiene ñ
  #4-->  1   0   0   0 --> la A tiene ñ
  #5-->  0   1   1   0 --> la A tiene ñ y la B tiene Ñ --> salida 1
  #6-->  1   0   0   1 --> la A tiene Ñ y la B tiene ñ --> salida -1
  #7-->  1   1   0   0 --> la A y la B tienen ñ --> salida 0
  #8-->  0   0   1   1 --> la A y la B tienen Ñ --> salida 0
  #Hacemos el caso especial de la Ñ y la ñ
  
  
  li $t5,0
  li $t4, 209
  beq $t6, $t4, strcmpBes # B == Ñ && A == no comprobado
  li $t4, 241
  beq $t6, $t4, strcmpBes2 # B == ñ && A == no comprobado
  li $t4, 209
  beq $t7,$t4, strcmpMAM  # A == Ñ && B == ?
  li $t4, 241
  beq $t7,$t4, strcmpMAM  # A == ñ && B == ?
  b strcmpComparanormal

  strcmpBes:
  li $t4, 209
  beq $t7,$t4,strcmpLetraIgual  # A == Ñ && B == Ñ
  li $t4, 241
  li $t2,-1
  beq $t7,$t4,strcmpComaparaMayMin  # A == ñ && B == Ñ
  b strcmpMBM

  strcmpBes2:
  li $t4, 209
  li $t2,1
  beq $t7,$t4,strcmpComaparaMayMin  # A == Ñ && B == ñ
  li $t4, 241
  beq $t7,$t4,strcmpLetraIgual  # A == ñ && B == ñ
  
  b strcmpMBM

  #Comprobamos que cadena es mayor o menor para B = ñ
  strcmpMBM:
  li $t2,1
  li $t4, 79			#ponemos el valor de O
  blt $t7,$t4,strcmpfin	#La cadena origen es mayor
  li $t2,-1
  li $t4, 97			#ponemos el valor de a
  blt $t7,$t4,strcmpfin	#La cadena origen es menor
  li$t2,1
  li $t4, 111			#ponemos el valor de o
  blt $t7,$t4,strcmpfin	#La cadena origen es mayor
  li $t2,-1
  b strcmpfin		#La cadena origen es menor
  
   #Comprobamos que cadena es mayor o menor para A = ñ
  strcmpMAM:
  li $t2,-1
  li $t4, 79			#ponemos el valor de O
  blt $t6,$t4,strcmpfin	#La cadena destino es mayor
  li $t2,1
  li $t4, 97			#ponemos el valor de a
  blt $t6,$t4,strcmpfin	#La cadena destino es menor
  li$t2,-1
  li $t4, 111			#ponemos el valor de o
  blt $t6,$t4,strcmpfin	#La cadena destino es mayor
  li $t2,1
  b strcmpfin		#La cadena destino es menor

  strcmpComparanormal:
  sub $t2,$t6,$t7
  bnez $t2,strcmpComaparaMayMin
  
  strcmpLetraIgual:
  add $t9,$t9,1
b strcmpComparacion

# Si han salido distintas compara las mayusculas y minusculas
# $s0, valor a devolver por si los caracteres con touper son ==
# $s1, temporal que almacena el toupper del primer caracter
# $s6, caracter de la 1ª cadena
# $s7, caracter de la 2ª cadena
strcmpComaparaMayMin:
  move $s0, $t2
  move $s6, $t6
  move $s7, $t7

  # Hacemos toupper a las 2 y comparamos
  move $a0, $s6
  jal toupper
  move $s1, $v0
  move $a0, $s7
  jal toupper
  
  # Restauramos el valor que indica cual es la cadena mayor por si se produce el salto siguiente
  move $t2, $s0

  # Si las toupper son ==, es el mismo caracter
  beq $s1, $v0, strcmpfin

  # Si el 2º caracter en MAY es mayor que el 1º
  # Inicializamos a 1 $t2 a un numero positivo pos si se hace el salto
  li $t2, 1
  bgtu $s1, $v0, strcmpfin
  # si la 2ª no es mayor lo es la segunda, inicializamos $t2 a un negativo
  li $t2, -1
  b strcmpfin


#Las cadenas son iguales hasta el menor tamaño, por lo tanto la pequeña es menor
strcmpprefin:
move $t2,$t0

#Sacamos la salida por parametros
strcmpfin:
move $v0,$t2

#Restauracion de parametros
lw $a0, 4($sp)
lw $a1, 8($sp)
lw $s0, 12($sp)
lw $s1, 16($sp)
lw $s6, 20($sp)
lw $s7, 24($sp)

#restauracion de $ra
lw $ra,($sp)

#liberacion de la pila
add $sp,$sp,28

#salida 
jr $ra

                #---------------------------------------------------------------------------------#
                ##                                 -- strncmp --                                 ##
strncmp:

#Reserva de la pila (para reservar espacio se resta en el puntero de pila)
sub $sp,$sp,16

#Salvado de $ra
sw $ra,($sp)

#salvado de parametros
sw $a0, 4($sp)
sw $a1, 8($sp)
sw $a2, 12($sp)

#Cuerpo del programa
#Obtenemos los tamaños de las cadenas los tamaños de las cadenas.
  # $s0 <- tamaño cadena destino
  # $s1 <- tamaño cadena origen
  # $s6 <- puntero a la cadena destino
  # $s7 <- puntero a la cadena origen
  move $s6, $a0
  move $s7, $a1
  
  jal strlen
  move $s0, $v0

  move $a0, $a1
  jal strlen
  move $s1, $v0
 
#Inicializamos contador para el bucle
 li $t9,2
#Comparamos los tamaños:
  
 #if(tamCad1 < n)
 blt $s0,$a3,strncmpCom1V
 
 #if(tamCad2 < n)
 blt $s1,$a3,strncmpCaso1
 b strncmpCaso4

 strncmpCom1V:
 #if(tamCad2 < n)
 bgeu $s1,$a3,strncmpCaso2
  
 #if(tamCad1 = TamCad2)
 beq $s0,$s1,strncmpCaso3

 #if(tamCadena1 >= tamCadena2 --> Caso1)
 bgeu $s0,$s1,strncmpCaso1

# Caso 2 tamCadena1 menor tamCadena2 (-1)
strncmpCaso2:
li $t0,-1
add $t1,$s0,2
b strncmpComparacion

# Caso 3 tamCadena1 = tamCadena2 menor que n 
strncmpCaso3:
li $t0,0
add $t1,$s0,2
b strncmpComparacion

# Caso 4 tamCadena1 = tamCadena2 mayor o igual que n
strncmpCaso4:
li $t0,0
add $t1,$a3,2
b strncmpComparacion

# Caso1 tamCadena1 mayor tamCadena2 (1)
strncmpCaso1:
li $t0,1
add $t1,$s1,2

#Comparamos las dos cadenas
strncmpComparacion:
  bgeu $t9,$t1,strncmpprefin
  
  add $t8,$s6,$t9
  lbu $t6,($t8)
  add $t8,$s7,$t9
  lbu $t7,($t8)
  
  #$t5 -> indica en que caso estamos:
  #$t5  a=ñ;b=ñ;a=Ñ;b=Ñ 
  #0-->  0   0   0   0 --> No hay eñes
  #1-->  0   0   0   1 --> La B tiene Ñ
  #2-->  0   0   1   0 --> la A tiene Ñ
  #3-->  0   1   0   0 --> la B tiene ñ
  #4-->  1   0   0   0 --> la A tiene ñ
  #5-->  0   1   1   0 --> la A tiene ñ y la B tiene Ñ --> salida 1
  #6-->  1   0   0   1 --> la A tiene Ñ y la B tiene ñ --> salida -1
  #7-->  1   1   0   0 --> la A y la B tienen ñ --> salida 0
  #8-->  0   0   1   1 --> la A y la B tienen Ñ --> salida 0
  #Hacemos el caso especial de la Ñ y la ñ
  
  
  li $t5,0
  li $t4, 209
  beq $t6, $t4,strncmpBes # B == Ñ && A == no comprobado
  li $t4, 241
  beq $t6, $t4,strncmpBes2 # B == ñ && A == no comprobado
  li $t4, 209
  beq $t7,$t4,strncmpMAM  # A == Ñ && B == ?
  li $t4, 241
  beq $t7,$t4,strncmpMAM  # A == ñ && B == ?
  b strncmpComparanormal

  strncmpBes:
  li $t4, 209
  beq $t7,$t4,strncmpLetraIgual  # A == Ñ && B == Ñ
  li $t4, 241
  li $t2,-1
  beq $t7,$t4,strncmpComaparaMayMin  # A == ñ && B == Ñ
  b strncmpMBM

  strncmpBes2:
  li $t4, 209
  li $t2,1
  beq $t7,$t4,strncmpComaparaMayMin  # A == Ñ && B == ñ
  li $t4, 241
  beq $t7,$t4,strncmpLetraIgual  # A == ñ && B == ñ
  
  b strncmpMBM

  #Comprobamos que cadena es mayor o menor para B = ñ
  strncmpMBM:
  li $t2,-1
  li $t4, 79			#ponemos el valor de O
  blt $t7,$t4,strncmpfin	#La cadena origen es mayor
  li $t2,1
  li $t4, 97			#ponemos el valor de a
  blt $t7,$t4,strncmpfin	#La cadena origen es menor
  li$t2,-1
  li $t4, 111			#ponemos el valor de o
  blt $t7,$t4,strncmpfin	#La cadena origen es mayor
  li $t2,1
  b strncmpfin		#La cadena origen es menor
  
   #Comprobamos que cadena es mayor o menor para A = ñ
  strncmpMAM:
  li $t2,1
  li $t4, 79			#ponemos el valor de O
  blt $t6,$t4,strncmpfin	#La cadena destino es mayor
  li $t2,-1
  li $t4, 97			#ponemos el valor de a
  blt $t6,$t4,strncmpfin	#La cadena destino es menor
  li$t2,1
  li $t4, 111			#ponemos el valor de o
  blt $t6,$t4,strncmpfin	#La cadena destino es mayor
  li $t2,-1
  b strncmpfin		#La cadena destino es menor

  strncmpComparanormal:
  sub $t2,$t6,$t7
  bnez $t2,strncmpComaparaMayMin
  
  strncmpLetraIgual:
  add $t9,$t9,1
b strncmpComparacion

# Si han salido distintas compara las mayusculas y minusculas
# $s0, valor a devolver por si los caracteres con touper son ==
# $s1, temporal que almacena el toupper del primer caracter
# $s6, caracter de la 1ª cadena
# $s7, caracter de la 2ª cadena
strncmpComaparaMayMin:
  move $s0, $t2
  move $s6, $t6
  move $s7, $t7

  # Hacemos toupper a las 2 y comparamos
  move $a0, $s6
  jal toupper
  move $s1, $v0
  move $a0, $s7
  jal toupper
  
  # Restauramos el valor que indica cual es la cadena mayor por si se produce el salto siguiente
  move $t2, $s0

  # Si las toupper son ==, es el mismo caracter
  beq $s1, $v0, strncmpfin

  # Si el 2º caracter en MAY es mayor que el 1º
  # Inicializamos a -1 $t2 a un numero positivo pos si se hace el salto
  li $t2, -1
  bgtu $s1, $v0, strcmpfin
  # si la 2ª no es mayor lo es la segunda, inicializamos $t2 a un negativo
  li $t2, 1
  b strcmpfin


#Las cadenas son iguales hasta el menor tamaño, por lo tanto la pequeña es menor
strncmpprefin:
move $t2,$t0

#Sacamos la salida por parametros
strncmpfin:
move $v0,$t2

#Restauracion de parametros
lw $a0, 4($sp)
lw $a1, 8($sp)
lw $s0, 12($sp)
lw $s1, 16($sp)
lw $s6, 20($sp)
lw $s7, 24($sp)

#restauracion de $ra
lw $ra,($sp)

#liberacion de la pila
add $sp,$sp,28

#salida 
jr $ra

                #--------------------------------------------------------------------------------#
                ##                                 -- strchr --                                 ##
strchr:

#Reserva de la pila (para reservar espacio se resta en el puntero de pila)
sub $sp,$sp,4

#Salvado de $ra
sw $ra,($sp)

#salvado de parametros

#Cuerpo del programa

# $a0 <- puntero a la cadena de caracteres
# $a1 <- caracter buscado
# $t0 <- pos de memoria final de la cadena

# Hallamos el tamaño de la cadena
jal strlen
add $t0, $v0, $a0
add $t0, $t0, 2

# Inicializamos $v0 a 0
li $v0, 0

# $t1 : puntero a la pos en la cadena
add $t1, $a0, 2
# t2 : aux para almacenar el valor de la cadena con el que comparar

strchrBucle:
  bgeu $t1, $t0, strchrFin
  lb $t2, ($t1)
  add $t1, $t1, 1
bne $t2, $a1, strchrBucle

# Restamos 1 ya que hemos sumado 1 de más
sub $v0, $t1, 1

strchrFin:


#Restauracion de parametros

#restauracion de $ra
lw $ra,($sp)

#liberacion de la pila
add $sp,$sp,4

#salida 
jr $ra

                #---------------------------------------------------------------------------------#
                ##                                 -- strrchr --                                 ##
strrchr:

#Reserva de la pila (para reservar espacio se resta en el puntero de pila)
sub $sp,$sp,4

#Salvado de $ra
sw $ra,($sp)

#salvado de parametros

#Cuerpo del programa

# $a0 <- puntero a la cadena de caracteres
# $a1 <- caracter buscado
# $t0 <- pos de memoria inicial de la cadena
# $t1 <- puntero al final de la cadena (lo vamos moviendo)

# Hallamos el tamaño de la cadena y con eso el puntero al final de la cadena
jal strlen
add $t1, $v0, $a0
add $t1, $t1, 2

# Inicializamos $v0 a 0
li $v0, 0

# Obtenemos el puntero al inicio de la cadena
add $t0, $a0, 2
# t2 : aux para almacenar el valor de la cadena con el que comparar

strchrrBucle:
  bgeu $t0, $t1, strchrrFin
  lb $t2, ($t1)
  sub $t1, $t1, 1
bne $t2, $a1, strchrrBucle

# Sumamos 1 ya que hemos restado 1 de más
add $v0, $t1, 1

strchrrFin:


#Restauracion de parametros

#restauracion de $ra
lw $ra,($sp)

#liberacion de la pila
add $sp,$sp,4

#salida 
jr $ra

                #---------------------------------------------------------------------------------#
                ##                                 -- toupper --                                 ##
toupper:

#Cuerpo del programa

# Nos quedamos solo con la parte menos significativa
move $t0, $a0
rem $t0, $t0, 256

# Guardamos $t0 en $v0 por si no es letra
move $v0, $t0

# Comprobamos si es la ñ
li $t1, 241
beq $t0, $t1, toupperCasoLetra

# Comprobamos si es < a -> Fin
li $t1, 97
blt $t0, $t1, toupperFin

# Comprobamos si es > z -> Fin
li $t1, 122
bgt $t0, $t1, toupperFin

# Caso de que sea una letra
toupperCasoLetra:
  sub $v0, $t0, 32
  b toupperFin

# Final de la función
toupperFin:
jr $ra

                #---------------------------------------------------------------------------------#
                ##                                 -- tolower --                                 ##
tolower:


#Cuerpo del programa

# Nos quedamos solo con la parte menos significativa
move $t0, $a0
rem $t0, $t0, 256

# Guardamos $t0 en $v0 por si no es letra
move $v0, $t0

# Comprobamos si es la Ñ
li $t1, 209
beq $t0, $t1, tolowerCasoLetra

# Comprobamos si es < A -> Fin
li $t1, 65
blt $t0, $t1, tolowerFin

# Comprobamos si es > Z -> Fin
li $t1, 90
bgt $t0, $t1, tolowerFin

# Caso de que sea una letra
tolowerCasoLetra:
  add $v0, $t0, 32
  b tolowerFin

# Final de la función
tolowerFin:
jr $ra

                #--------------------------------------------------------------------------------#
                ##                                 -- strupr --                                 ##
strupr:

#Reserva de la pila (para reservar espacio se resta en el puntero de pila)
sub $sp,$sp,16

#Salvado de $ra
sw $ra,($sp)

#salvado de parametros
sw $s0, 4($sp)
sw $s1, 8($sp)
sw $s2, 12($sp)

#Cuerpo del programa

# $s0 puntero a la cadena
# $s1 posición fin de la cadena (tamaño de la cadena + posicion de memoria de la cadena + 2)
# $s2 contador (puntero a la cadena +2 al inicio)

move $s0, $a0

# Leemos el tamaño
jal strlen
add $s1, $v0, 2
add $s1, $s1, $s0

# Recorremos la cadena
add $s2, $s0, 2

struprBucle:
  lb $a0, ($s2)
  jal toupper
  sb $v0, ($s2)
  add $s2, $s2, 1
blt $s2, $s1, struprBucle

move $a0, $s0
move $v0, $s0

#Restauracion de parametros
lw $s0, 4($sp)
lw $s1, 8($sp)
lw $s2, 12($sp)

#restauracion de $ra
lw $ra,($sp)

#liberacion de la pila
add $sp,$sp,16

#salida 
jr $ra

                #--------------------------------------------------------------------------------#
                ##                                 -- strlwr --                                 ##
strlwr:

#Reserva de la pila (para reservar espacio se resta en el puntero de pila)
sub $sp,$sp,16

#Salvado de $ra
sw $ra,($sp)

#salvado de parametros
sw $s0, 4($sp)
sw $s1, 8($sp)
sw $s2, 12($sp)

#Cuerpo del programa

# $s0 puntero a la cadena
# $s1 posición fin de la cadena (tamaño de la cadena + posicion de memoria de la cadena + 2)
# $s2 contador (puntero a la cadena +2 al inicio)

move $s0, $a0

# Leemos el tamaño
jal strlen
add $s1, $v0, 2
add $s1, $s1, $s0

# Recorremos la cadena
add $s2, $s0, 2

strlwrBucle:
  lb $a0, ($s2)
  jal tolower
  sb $v0, ($s2)
  add $s2, $s2, 1
blt $s2, $s1, strlwrBucle

move $a0, $s0
move $v0, $s0

#Restauracion de parametros
lw $s0, 4($sp)
lw $s1, 8($sp)
lw $s2, 12($sp)

#restauracion de $ra
lw $ra,($sp)

#liberacion de la pila
add $sp,$sp,16

#salida 
jr $ra

                #------------------------------------------------------------------------------#
                ##                                 -- atol --                                 ##
atol:

#Reserva de la pila (para reservar espacio se resta en el puntero de pila)
sub $sp,$sp,8

#Salvado de $ra
sw $ra,($sp)

#salvado de parametros
sw $s0, 4($sp)

#Cuerpo del programa

# Obtenemos la longitud de la cadena
move $s0, $a0
jal strlen
move $a0, $s0

# $t0 puntero que va recorriendo la cadena
# $t1 posición final de la cadena
# $t2 auxiliar donde vamos leyendo el caracter
add $t0, $a0, 2
add $t1, $a0, $v0
add $t1, $t1, 2

# Recorremos la cadena hasta encontrar un caracter != ' '
# $t3 caracter ' ' (para comparar)
li $t3, 32
atolBucleEspacios:
  bgeu $t0, $t1, atolFinFallo  # Si llega al final si encontrar nada devuelve un error
  lb $t2, ($t0)
  add $t0, $t0, 1
beq $t2, $t0, atolBucleEspacios

# Limpia $v0 para almacenar el resultado
li $v0, 0

# Lee el signo
# $t3 caracter '+' (para comparar)
# $t4 caracter '-' (para comparar)
# $t6 almacena 1 si es negativo, 0 en caso contrario
li $t3, 43
li $t4, 45

li $t6, 0
beq $t2, $t4, atolAgregaMenos
# Caso de que tengamos +
beq $t2, $t3, atolCompruebaFormato

# Caso de que no tengamos signo
sub $t0, $t0, 1
b atolCompruebaFormato

# Agrega Menos
atolAgregaMenos:
  li $t6, 1
  


# Comprobamos que la longitud sea < 10 o si es =10 que el 1º número sea <= 2
# $t7 y $t8 auxiliares en esta parte
atolCompruebaFormato:
  sub $t7, $t1, $t0
  li $t8, 10
  # Si el tamaño es < 10 -> Salta a leer la cifra
  blt $t7, $t8, atolLeeCifra
  # si el tamaño es > 10 -> Salta a Error
  bgt $t7, $t8, atolFinFallo
  # Si no, si el valor del primer número es > 2 -> salta a Error
  lb $t7, ($t0)
  # Comprobamos que no esté entre 0 y 2, si esta saltamos a Fallo
  li $t8, 48   # 48 == '0'
  blt $t7, $t8, atolFinFallo
  li $t8, 50   # 50 == '2'
  bgt $t7, $t8, atolFinFallo


# Lee la cifra
  # $t3 valor para el '0'
  # $t4 valor para el '9'
atolLeeCifra:  
  li $t3, 48
  li $t4, 57
  atolBucleLeeCifra:
    bgeu $t0, $t1, atolCompruebaNegativo
    lb $t2, ($t0)

    # Comprobamos que este entre 0 y 9
    blt $t2, $t3, atolFinFallo
    bgt $t2, $t4, atolFinFallo

    # Restamos 48 para obtener el numero real
    sub $t2, $t2, 48

    # Obtemenos el valor por el que multiplicar el número y lo multiplicamos
    # $t5 nº de veces a multiplicar por 10 el número (pos fin cadena - pos actual - 1)
    sub $t5, $t1, $t0
    sub $t5, $t5, 1

    beqz $t5, atolDespuesMultiplicar # Salta multiplicar si es 0

    atolBucleMultiplicar:
      mul $t2, $t2, 10
      sub $t5, $t5, 1
    bgtz $t5, atolBucleMultiplicar

    atolDespuesMultiplicar:

    # Sumamos el numero al resultado utilizando $t7
    addu $t7, $v0, $t2

    # Comprobamos que el numero no desborda utilizando $t8
    subu $t8, $t7, $v0
    
    bne $t2, $t8, atolFinFallo

    # Si no desborda almacenamos el resultado en $v0
    move $v0, $t7
  
  add $t0, $t0, 1
  b atolBucleLeeCifra

# Comprueba si el numero es negativo para darle la vuelta
atolCompruebaNegativo:
  beqz $t6, atolFin
  # Caso negativo
  # Comprobamos si el numero es > 2147483648 , en ese caso damos un error
    # $t7 auxiliar
  li $t7, 2147483648
  bgtu $v0, $t7, atolFinFallo

  # Si el número es correcto
  # Comprobamos si el numero es 2147483648 , en ese caso lo almacenamos de manera distinta
  beq $v0, $t7, atolUltimoNegativo
  sub $v0, $0, $v0
  b atolFin

atolUltimoNegativo:
  li $v0, -2147483648
  b atolFin

atolFinFallo:
  li $v0, 0
  li $v1, -1

atolFin:

#Restauracion de parametros
lw $s0, 4($sp)

#restauracion de $ra
lw $ra,($sp)

#liberacion de la pila
add $sp,$sp,8

#salida 
jr $ra

                #------------------------------------------------------------------------------#
                ##                                 -- atof --                                 ##
atof:

#Reserva de la pila (para reservar espacio se resta en el puntero de pila)
sub $sp,$sp,16

#Salvado de $ra
sw $ra,($sp)

#salvado de parametros
sw $a0, 4($sp)
sw $a1, 8($sp)
sw $s0, 12($sp)

#Cuerpo del programa
# $s4 puntero a la cadena
# $s0 valor de la posción del .
# $s5 posición del final de la cadena


li $a1, 46
move $s4,$a0
jal strchr

move $s0, $v0
jal strlen
add $s5, $s4, $v0
add $s5, $s5, 2

# Le sumamos 2 al puntero a la cadena para saltar los bytes
add $s4, $s4, 2

# $s1 es 1 Real
# $s2 es 10 Real
# $s3 lo inicilizamos a 0 en real
# $f0 es el contador de mult o div Real
# $f1 es el numero en real
li $s1, 0x3f800000
li $s2, 0x41200000
li $s3, 0x00000000

# Comprobamos si $s0 es 0 (Punero nulo)
beqz $s0, atofNoPunto

b atofLeerDecimales

# Si no hay . igualamos la posición de este al final de la cadena
atofNoPunto:
move $s0, $s5

# Leemos los decimales
atofLeerDecimales:
  
  mtc1 $s1,$f0
  mtc1 $s2,$f1
  mtc1 $s3,$f2

  add $s6, $s0,1

  atofBucleDecimal:
   bgeu $s6, $s5, atofDespuesBucleDecimal
    
    # Dividimos en cada Iteración por 10
    div.s $f0,$f0,$f1
    mfc1 $a1,$f0
    
    #Metemos el caracter leido en $a0
    lb $a0,($s6)

    #intentamos pasar el numero a Real
    jal HallarNumeroReal

    #Comprobamos si ha habido errores
    beq $v1,-1,atofFinError
    
    #Sumamos el numero Real
    mtc1 $v0,$f3
    add.s $f2,$f2,$f3

    add $s6, $s6, 1
    b atofBucleDecimal
  atofDespuesBucleDecimal:

# Leemos la parte real
# $t1 puntero a la posición actual
atofLeerReales:

  sub $s6, $s0,1
  mtc1 $s1,$f0
  mtc1 $s2,$f1
 
  atofBucleReal:
    bltu $s6, $s4, atofFin
   
    #intentamos pasar el numero a Real
    mfc1 $a1,$f0

     #Metemos el caracter leido en $a0
    lb $a0,($s6)
    jal HallarNumeroReal

    #Comprobamos si ha habido errores
    beq $v1,-1,atofDespuesBucleReal

    #Sumamos el numero Real
    mtc1 $v0,$f3
    add.s $f2,$f2,$f3

    # Multiplicamos en cada Iteración por 10
    mul.s $f0,$f0,$f1

    sub $s6, $s6, 1
    b atofBucleReal
  atofDespuesBucleReal:
  lb $t0,($s6)
  sub $s6,$s6,1
 
  #cumprueba si el caracter es '+', '-' o ' '
  neg.s $f2,$f2
  beq $t0,45,atofCompEsp
  neg.s $f2,$f2
  beq $t0,43,atofCompEsp
  bne $t0,32,atofFinError
  
 
  atofCompEsp:
    bgeu $s6, $s4, atofFin

    lb $t0,($s6)
    bne $t0,32,atofFinError
    
    sub $s6,$s6,1
  b atofCompEsp
 

atofFinError:
  li $v0, 0
  li $v1, -1
  b atofRestaurar
  
atofFin:

  li $v1, 0
  mfc1 $v0,$f2
atofRestaurar:

#Restauracion de parametros
lw $a0, 4($sp)
lw $a1, 8($sp)
lw $s0, 12($sp)

#restauracion de $ra
lw $ra,($sp)

#liberacion de la pila
add $sp,$sp,16

#salida 
jr $ra
#----------------------------------------------------------------------------------------------------------------
HallarNumeroReal:
#$a0, el numero entero que queremos pasar a real
#$a1, el numero Real por el que queremos multiplicar el nuemero de $a0
#$v0, el numero averiguado
#$v1, indica si ha habido error al convertir



beq $a0,48,HNRCero
beq $a0,49,HNRUno
beq $a0,50,HNRDos
beq $a0,51,HNRTres
beq $a0,52,HNRCuatro
beq $a0,53,HNRCinco
beq $a0,54,HNRSeis
beq $a0,55,HNRSiete
beq $a0,56,HNROcho
beq $a0,57,HNRNueve
b HNRError

HNRCero:
li $t0, 0x00000000
b HNRFin

HNRUno:
li $t0, 0x3f800000
b HNRFin

HNRDos:
li $t0, 0x40000000
b HNRFin

HNRTres:
li $t0, 0x40400000
b HNRFin

HNRCuatro:
li $t0, 0x40800000
b HNRFin

HNRCinco:
li $t0, 0x40a00000
b HNRFin

HNRSeis:
li $t0, 0x40c00000
b HNRFin

HNRSiete:
li $t0, 0x40e00000
b HNRFin

HNROcho:
li $t0, 0x41000000
b HNRFin

HNRNueve:
li $t0, 0x41100000
b HNRFin

HNRError:
li $v1,-1
b HNRSalida

HNRFin:
mtc1 $t0,$f12
mtc1 $a1,$f13
mul.s $f12,$f12,$f13
mfc1 $v0,$f12
li $v1,0

HNRSalida:
#salida 
jr $ra

                #--------------------------------------------------------------------------------#
                ##                                 -- strstr --                                 ##
strstr:

#Reserva de la pila (para reservar espacio se resta en el puntero de pila)

sub $sp,$sp,16

#Salvado de $ra
sw $ra,($sp)

#salvado de parametros
sw $a0, 4($sp)
sw $s1, 8($sp)
sw $s2, 12($sp)

#Cuerpo del programa
# $s1 tamaño de la cadena + 2
# $s2 tamaño de la subcadena + 2
# $t6 puntero a la cadena
# $t7 puntero a la subcadena

#obtenemos el tamaño de la Cadena
jal strlen
add $s1, $v0, 2

#obtenemos el tamaño de la subcadena
move $s2, $a0
move $a0, $a1
jal strlen
move $a0,$s2
add $s2, $v0, 2

#inicializamos las ocurrencias a 0
li $t3,0

#if(tamaño Cadena < tamaño subcadena)--Fin
blt $s1,$s2, strstrFin

li $t0,2
#while( x < = tamaño de la cadena)
strstrBucle1:
bgt $t0,$s1,strstrFinBucle1
  add $t6,$a0,$t0
  lb $t9,($t6)
  lb $t8,2($a1)
  

  #if( Cadena[x] == subcadena[0])
  bne $t9,$t8,strstrElseIf1
    li $t1,3

    #while(y < tamaño de la subcadena)
    strstrBucle2:
    bge $t1,$s2,strstrFinBucle2
    
      sub $t6,$t1,2
      add $t6,$t0,$t6
      add $t6,$t6,$a0
      add $t7,$a1,$t1
      lb $t9,($t6)
      lb $t8,($t7)

      #if( Cadena[x+y] == Subcadena[y])
      bne $t9,$t8,strstrElseIf2
        add $t1,$t1,1
	b strstrBucle2

      strstrElseIf2:
        add $t0,$t0,1
	b strstrBucle1

    strstrFinBucle2:
    add $t3,$t3,1
    
    #falta guardar en la pila el puntero a la cadena)
    sub $sp,$sp,4
    add $t4,$a0,$t0
    sw $t4,($sp)

  #Continua tambien si viene desde strstrFinBucle2
  strstrElseIf1:
  add $t0,$t0,1
  b strstrBucle1

strstrFinBucle1:

strstrFin:
move $v0,$t3


#el puntero t4 apunta al comienzo de los resultados
mul $t4, $v0, 4
add $t4, $t4, $sp
# add $t4, $t4, 4 

#Restauracion de parametros
lw $a0, 4($t4)
lw $s1, 8($t4)
lw $s2, 12($t4)

#restauracion de $ra
lw $ra,($t4)

#Este puntero apunta a la posicion original de la pila
add $t3, $t4, 16

# Vamos a copiar de $t4 a $t3
strstrBuclePila:
bleu $t4, $sp, strstrRpila
  lw $t0,-4($t4)  
  sw $t0, -4($t3)
  sub $t3, $t3, 4
  sub $t4, $t4, 4

b strstrBuclePila

strstrRpila:
# Restauración de la pila

add $sp, $sp, 16

#salida 
jr $ra

            #--------------------------------------------------------------------------------#
            ##                                 -- printf --                                 ##
	    
printf:
#Reserva de la pila (para reservar espacio se resta en el puntero de pila)
sub $sp,$sp,32

#Salvado de $ra
sw $ra,($sp)

# Salvado de parametros
sw $a0, 4($sp)
sw $a1, 8($sp)
sw $a2, 12($sp)
sw $a3, 16($sp)
sw $s0, 20($sp)
sw $s1, 24($sp)
sw $s2, 28($sp)


#Cuerpo del programa
#Averiguamos el tamaño de la cadena:
jal strlen
move $s0, $v0

#Puntero de Caso de Parametro
add, $s6,$sp,32
li $s5,-3


# while(x < tamCad):
# $s1 es el contador x
# $s0 es el tamCad
# $t7 es el contador de caracteres metidos en la pila
li $s1,0
li $t7,0
printfWhile:

bge $s1,$s0,printfFinWhile
  
  #if(x+1 < tamCad) && cad[x]=='%':
  # $t1 es x+1
  # $t2 es '%'
  # $t3 es cad[x]
  add $t1,$s1,1
  li $t2,37
  add $t3,$a0,2
  add $t3,$t3,$s1
  lb $t3,($t3)
  bge $t1,$s0,printfElseMeteEnCadena
  bne $t3,$t2,printfElseMeteEnCadena
  
    #if(cad[x+1] == 'd' || cad[x+1] == 'f' || cad[x+1] == 's'):
    # $t4 es cad[x+1]
    # $t5 es d,f,s
    add $t4,$a0,3
    add $t4,$t4,$s1
    lb $t4,($t4)
    li $t5,100
    beq $t4,$t5,printfHayUnd
    li $t5,102
    beq $t4,$t5,printfHayUnf
    li $t5,115
    beq $t4,$t5,printfHayUns
  
  #inserta el caracter leido en la pila
  printfElseMeteEnCadena:
    sub $sp,$sp,1
    add $t7,$t7,1
    sb $t3,($sp)    
    
    #if(x != tamCad-1) aumentamos el contador
    # $t6 es tamCad-1
    sub $t6,$s0,1
    bne $s1,$t6,printfWhileContador

      #Llamamos a CeroDestruccion:
      move $s7,$a0
      move $a0,$t7
      
      jal CeroDestruccion

      #reseteamos el $a0
      move $a0,$s7

      #reseteamos los caracteres almacenados en pila
      li $t7,0
  b printfFinWhile
    
    #cad[x+1] == 'd'
    printfHayUnd:
      #Llamamos a CeroDestruccion:
      move $s7,$a0
      move $a0,$t7
      
      jal CeroDestruccion

      # $s5, es el Caso de parametro en el que nos encontramos:
      # $s5 --> -3 el parametro esta en $a1
      # $s5 --> -2 el parametro esta en $a2
      # $s5 --> -1 el parametro esta en $a3
      # $s5 --> >=0 el parametro esta en la pila
      li $t8,-3
      beq $s5,$t8,printfds5esMenos3
      li $t8,-2
      beq $s5,$t8,printfds5esMenos2
      li $t8,-1
      beq $s5,$t8,printfds5esMenos1
      bgez $s5,printfds5esMayEq0

      #if($s5 == -3)
      printfds5esMenos3:
      add $s5,$s5,1
      move $a0,$a1
      b printfImpEnt

      #if($s5 == -2)
      printfds5esMenos2:
      add $s5,$s5,1
      move $a0,$a2
      b printfImpEnt

      #if($s5 == -1)
      printfds5esMenos1:
      add $s5,$s5,1
      move $a0,$a3
      b printfImpEnt

      #if($s5 >= 0)
      printfds5esMayEq0:
      add $t8,$s6,$s5
      add $s5,$s5,4
      lw $a0,($t8)
      b printfImpEnt

      #Imprimimos el numero entero
      printfImpEnt:
      jal ImprimirEntero
    
      #reseteamos el $a0
      move $a0,$s7

      #reseteamos los caracteres almacenados en pila
      li $t7,0

    #Aumentamos el contador
    add $s1,$s1,1
    b printfWhileContador

 
    #cad[x+1] == 'f'
    printfHayUnf:
      #Llamamos a CeroDestruccion:
      move $s7,$a0
      move $a0,$t7
      
      jal CeroDestruccion

      # $s5, es el Caso de parametro en el que nos encontramos:
      # $s5 --> -3 el parametro esta en $a1
      # $s5 --> -2 el parametro esta en $a2
      # $s5 --> -1 el parametro esta en $a3
      # $s5 --> >=0 el parametro esta en la pila
      li $t8,-3
      beq $s5,$t8,printffs5esMenos3
      li $t8,-2
      beq $s5,$t8,printffs5esMenos2
      li $t8,-1
      beq $s5,$t8,printffs5esMenos1
      bgez $s5,printffs5esMayEq0

      #if($s5 == -3)
      printffs5esMenos3:
      add $s5,$s5,1
      move $a0,$a1
      b printfImpFloat

      #if($s5 == -2)
      printffs5esMenos2:
      add $s5,$s5,1
      move $a0,$a2
      b printfImpFloat

      #if($s5 == -1)
      printffs5esMenos1:
      add $s5,$s5,1
      move $a0,$a3
      b printfImpFloat

      #if($s5 >= 0)
      printffs5esMayEq0:
      add $t8,$s6,$s5
      add $s5,$s5,4
      lw $a0,($t8)
      b printfImpFloat

      #Imprimimos el numero float
       printfImpFloat:
      jal ImprimirFloat

      #reseteamos el $a0
      move $a0,$s7

      #reseteamos los caracteres almacenados en pila
      li $t7,0

    #Aumentamos el contador
    add $s1,$s1,1
    b printfWhileContador

    #cad[x+1] == 's'
    printfHayUns:
      #Llamamos a CeroDestruccion:
      move $s7,$a0
      move $a0,$t7
      
      jal CeroDestruccion

      # $s5, es el Caso de parametro en el que nos encontramos:
      # $s5 --> -3 el parametro esta en $a1
      # $s5 --> -2 el parametro esta en $a2
      # $s5 --> -1 el parametro esta en $a3
      # $s5 --> >=0 el parametro esta en la pila
      li $t8,-3
      beq $s5,$t8,printfss5esMenos3
      li $t8,-2
      beq $s5,$t8,printfss5esMenos2
      li $t8,-1
      beq $s5,$t8,printfss5esMenos1
      bgez $s5,printfss5esMayEq0

      #if($s5 == -3)
      printfss5esMenos3:
      add $s5,$s5,1
      move $a0,$a1
      b printfImpStr

      #if($s5 == -2)
      printfss5esMenos2:
      add $s5,$s5,1
      move $a0,$a2
      b printfImpStr

      #if($s5 == -1)
      printfss5esMenos1:
      add $s5,$s5,1
      move $a0,$a3
      b printfImpStr

      #if($s5 >= 0)
      printfss5esMayEq0:
      add $t8,$s6,$s5
      add $s5,$s5,4
      lw $a0,($t8)
      b printfImpStr

      #Imprimimos la Cadena
      printfImpStr:
      jal ImprimirString

      #reseteamos el $a0
      move $a0,$s7

      #reseteamos los caracteres almacenados en pila
      li $t7,0
    
    #Aumentamos el contador
    add $s1,$s1,1
    b printfWhileContador

 printfWhileContador:
 add $s1,$s1,1
 b printfWhile

printfFinWhile:

#Restauracion de parametros
lw $a0, 4($sp)
lw $a1, 8($sp) 
lw $a2, 12($sp)
lw $a3, 16($sp)
lw $s0, 20($sp)
lw $s1, 24($sp)
lw $s2, 28($sp)

#restauracion de $ra
lw $ra,($sp)

#liberacion de la pila
add $sp,$sp,32

#salida 
jr $ra

#--------------------------------------------------------------------------------------------
CeroDestruccion:
 
#Ponemos un cero al final de la cadena
add $t0,$a0,1
sub $sp,$sp,1
sb $zero,($sp)

#Damos la vuelta a la cadena para imprimirla en el orden correcto
# $t1 puntero al origen de la copia
# $t2 puntero al final de la copia
# $t3 auxilar origen
# $t4 auxiliar final

add $t1,$sp,$t0
move $t2,$sp
 
 #while($t1 != $t2)
CDwhile:
bgeu $t2,$t1,CDFinWhile
lb $t3,-1($t1)
lb $t4,($t2)
sb $t3,($t2)
sb $t4,-1($t1)

addu $t2,$t2,1
subu $t1,$t1,1

b CDwhile

CDFinWhile:
 
#imprimimos la cadena
move $a0,$sp
li $v0,4
syscall

#Borramos la pila
add $sp,$sp,$t0

#restauramos los parametros
sub $a0,$t0,1


#salida 
jr $ra

#--------------------------------------------------------------------------------------------
ImprimirEntero:

li $v0, 1
syscall

#salida 
jr $ra
#--------------------------------------------------------------------------------------------
ImprimirFloat:
#li $a1, 0x40e00000
mtc1 $a1, $f12
li $v0, 2

syscall

#salida 
jr $ra
#--------------------------------------------------------------------------------------------
ImprimirString:
#Reservamos la pila
sub $sp,$sp,16
#Salvado del ra
sw $ra,($sp)
#Salvado de parametros
sw $a0,4($sp)
sw $a1,8($sp)
sw $s0,12($sp)

jal strlen
add $s0,$v0,2
sub $sp,$sp,1
sb $zero,($sp)
sub $sp,$sp,$s0
add $s0,$s0,1
rem $t0,$s0,4
sub $t0,$zero,$t0
add $t0,$t0,4
sub $sp,$sp,$t0
add $s0,$s0,$t0


move $a1,$a0
move $a0,$sp
jal strcpy


add $a0,$sp,2
li $v0, 4
syscall


addu $sp,$sp,$s0

#Restauracion de parametros
lw $a0, 4($sp)
lw $a1, 8($sp)
lw $s0, 12($sp)

#restauracion de $ra
lw $ra,($sp)

#liberacion de la pila
add $sp,$sp,16

#salida 
jr $ra

