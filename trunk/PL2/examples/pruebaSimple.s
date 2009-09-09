#
# UC3M - PROCESADORES DEL LENGUAJE
# Codigo generado por los alumnos:
# Adrian Lopez Perez
# Daniel Conde Garcia
###################################

		.data
charPrintHelper:		.word 0
charPrintHelperz:		.word 0
fp2_var:		.float 6.3
fp3_var:		.float 4.3
fp1_var:		.float 3.5
y_var:		.word 10
prod_var:		.word 2
ar40_12_var:		.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
ar30_12_var:		.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
iret0_9_var:		.word 0
ar20_12_var:		.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
ar10_12_var:		.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
j0_13_var:		.word 0
j0_10_var:		.float 0.0
i0_13_var:		.word 0
i0_12_var:		.word 0
i0_10_var:		.word 1
i0_11_var:		.word 0
f0_6_var:		.word 0
far20_12_var:		.float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
far10_12_var:		.float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
c0_6_var:		.word 0
z0_7_var:		.word 0
z0_8_var:		.float 0.0
z0_6_var:		.word 0
y0_9_var:		.word 3
fret0_9_var:		.float 0.0
str6_str:		.asciiz "Invocacion vacia con retorno constante[float] f2f\n"
str5_str:		.asciiz "Invocacion vacia con retorno constante[int] f2\n"
str4_str:		.asciiz "Invocacion vacia f1\n"
str29_str:		.asciiz "Pruebas de precedencia con parentesis almacenano en entero [(1+2)*(3-4.0)]\n"
str28_str:		.asciiz "Pruebas de precedencia con parentesis almacenano en float [1*(2+3)/4]\n"
str3_str:		.asciiz "y="
str59_str:		.asciiz "Prueba de operaciones avanzdas [j = i++] se muestra i y luego j\n"
str27_str:		.asciiz "Pruebas de precedencia con parentesis almacenano en entero [((4+2)*3)/4]\n"
str2_str:		.asciiz "prod="
str58_str:		.asciiz "Prueba de operaciones avanzdas [j = --i] se muestra i y luego j\n"
str26_str:		.asciiz "Pruebas de precedencia sin parentesis almacenano en float [1-6*3/4.0]\n"
str1_str:		.asciiz "fp1(global)="
str57_str:		.asciiz "Prueba de operaciones avanzdas [j = ++i] se muestra i y luego j\n"
str25_str:		.asciiz "Pruebas de precedencia sin parentesis almacenano en entero [1+2*3-4.0]\n"
str0_str:		.asciiz "y(global)="
str56_str:		.asciiz "Prueba while [i = 0; i < 10]\n"
str24_str:		.asciiz "Pruebas de precedencia sin parentesis almacenano en float [1*2+3/4]\n"
str55_str:		.asciiz " 2 es menor que 1\n"
str23_str:		.asciiz "Pruebas de precedencia sin parentesis almacenano en entero [4+2*3/4]\n"
str54_str:		.asciiz " 2 no es menor que 1\n"
str22_str:		.asciiz "Asignaciones con operacion [/=]\n"
str53_str:		.asciiz "Prueba if [2<1]\n"
str21_str:		.asciiz "Asignaciones con operacion [*=]\n"
str52_str:		.asciiz " 1 es menor que 2\n"
str20_str:		.asciiz "Asignaciones con operacion [-=]\n"
str51_str:		.asciiz "Prueba if [1<2]\n"
str50_str:		.asciiz "Pruebas constantes float operaciones logicas [(1>=2)||(1<=2.4f)]\n"
str19_str:		.asciiz "Asignaciones con operacion [+=]\n"
str18_str:		.asciiz "Conversion de asignacion en retorno (conversion int -> float) f5\n"
str49_str:		.asciiz "Pruebas constantes float operaciones logicas [(1<=2.4f)&&(1>=2)]\n"
str17_str:		.asciiz "Conversion de asignacion en retorno (conversion float -> int) f5f\n"
str48_str:		.asciiz "Pruebas constantes int operaciones logicas [(1>2)||(2>1)]\n"
str16_str:		.asciiz "Invocacion con parametros variables (conversion float -> int) y retorno [int] f5\n"
str47_str:		.asciiz "Pruebas constantes int operaciones logicas [(1<2)&&(2>1)]\n"
str15_str:		.asciiz "Invocacion con parametros variables (conversion int -> float) y retorno [int] f5f\n"
str46_str:		.asciiz "Pruebas constantes float operaciones logicas [1.0>1.0]\n"
str14_str:		.asciiz "Invocacion con parametros variables y retorno [int] f5f\n"
str45_str:		.asciiz "Pruebas constantes float operaciones logicas [2.4<2.0]\n"
str13_str:		.asciiz "Invocacion con parametros variables y retorno [int] f5\n"
str44_str:		.asciiz "Pruebas constantes float operaciones logicas [1.1>=1.1]\n"
str12_str:		.asciiz "Invocacion con parametros constantes (conversion float -> int) y retorno [int] f5\n"
str43_str:		.asciiz "Pruebas constantes float operaciones logicas [1<=2.4]\n"
str11_str:		.asciiz "Invocacion con parametros constantes (conversion int -> float) y retorno [int] f5f\n"
str42_str:		.asciiz "Pruebas constantes int operaciones logicas [1>1]\n"
str10_str:		.asciiz "Invocacion con parametros constantes y retorno [int] f5\n"
str41_str:		.asciiz "Pruebas constantes int operaciones logicas [1<2]\n"
str40_str:		.asciiz "Pruebas constantes int operaciones logicas [1>=1]\n"
str39_str:		.asciiz "Pruebas constantes int operaciones logicas [1<=2]\n"
str38_str:		.asciiz "Pruebas constantes float operaciones logicas [1.0!=1.0]\n"
str37_str:		.asciiz "Pruebas constantes float operaciones logicas [2.4!=2.0]\n"
str36_str:		.asciiz "Pruebas constantes float operaciones logicas [1.1==1.1]\n"
str35_str:		.asciiz "Pruebas constantes float operaciones logicas [1==2.4]\n"
str66_str:		.asciiz "Saliendo...\n"
str34_str:		.asciiz "Pruebas constantes int operaciones logicas [1!=1]\n"
str65_str:		.asciiz "Pruebas Operaciones2\n"
str33_str:		.asciiz "Pruebas constantes int operaciones logicas [1!=2]\n"
str64_str:		.asciiz "# Pruebas Arrays\n"
str32_str:		.asciiz "Pruebas constantes int operaciones logicas [1==1]\n"
str63_str:		.asciiz "# Pruebas Sentencias Control\n"
str31_str:		.asciiz "Pruebas constantes int operaciones logicas [1==2]\n"
str62_str:		.asciiz "# Pruebas Operaciones\n"
str30_str:		.asciiz "Pruebas de precedencia con parentesis almacenano en float [(1-6)*3/4.0]\n"
str61_str:		.asciiz "# Pruebas funciones\n"
str60_str:		.asciiz "Prueba de operaciones avanzdas [j = i--] se muestra i y luego j\n"
str9_str:		.asciiz "Invocacion con parametros constantes[int, int, int] f4\n"
str8_str:		.asciiz "Invocacion vacia con retorno variable[float] f3f\n"
str7_str:		.asciiz "Invocacion vacia con retorno variable[int] f3\n"
ln_str:		.asciiz "\n"

		.text

		.globl main
f1_ini:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
		la $a0, str0_str
		jal printf_str

		lw $a0, y_var
		jal printf_int

		la $a0, str1_str
		jal printf_str

		l.s $f12, fp1_var
		jal printf_float

f1_ret:
		lw $ra,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		jr $ra	# retorna al invocador

f2_ini:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
		li $v0, 42
f2_ret:
		lw $ra,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		jr $ra	# retorna al invocador

f2f_ini:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
		li.s $f0, 42.99
f2f_ret:
		lw $ra,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		jr $ra	# retorna al invocador

f3_ini:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
		lw $v0, y_var
f3_ret:
		lw $ra,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		jr $ra	# retorna al invocador

f3f_ini:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
		l.s $f0, fp2_var
f3f_ret:
		lw $ra,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		jr $ra	# retorna al invocador

f4_ini:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
		lw $a0, z0_6_var
		jal printf_int

		lw $a0, c0_6_var
		jal printf_int

		lw $a0, f0_6_var
		jal printf_int

f4_ret:
		lw $ra,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		jr $ra	# retorna al invocador

f5_ini:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
		lw $v0, z0_7_var
f5_ret:
		lw $ra,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		jr $ra	# retorna al invocador

f5f_ini:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
		l.s $f0, z0_8_var
f5f_ret:
		lw $ra,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		jr $ra	# retorna al invocador

pruebaFunciones_ini:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
		li $t0, 5
		sw $t0, prod_var


		la $a0, str2_str
		jal printf_str

		lw $a0, prod_var
		jal printf_int

		la $a0, str3_str
		jal printf_str

		lw $a0, y0_9_var
		jal printf_int

		la $a0, str4_str
		jal printf_str

	## FUNCTION CALL ##
		jal f1_ini

		la $a0, str5_str
		jal printf_str

	## FUNCTION CALL ##
		jal f2_ini

		move $t0, $v0
		sw $t0, iret0_9_var


		lw $a0, iret0_9_var
		jal printf_int

		la $a0, str6_str
		jal printf_str

	## FUNCTION CALL ##
		jal f2f_ini

		mov.s $f0, $f0
		s.s $f0, fret0_9_var


		l.s $f12, fret0_9_var
		jal printf_float

		la $a0, str7_str
		jal printf_str

	## FUNCTION CALL ##
		jal f3_ini

		move $t0, $v0
		sw $t0, iret0_9_var


		lw $a0, iret0_9_var
		jal printf_int

		la $a0, str8_str
		jal printf_str

	## FUNCTION CALL ##
		jal f3f_ini

		mov.s $f0, $f0
		s.s $f0, fret0_9_var


		l.s $f12, fret0_9_var
		jal printf_float

		la $a0, str9_str
		jal printf_str

	## FUNCTION CALL ##
		li $t0 1
		sw $t0 z0_6_var
		li $t0 2
		sw $t0 c0_6_var
		li $t0 3
		sw $t0 f0_6_var
		jal f4_ini

		la $a0, str10_str
		jal printf_str

	## FUNCTION CALL ##
		li $t0 10
		sw $t0 z0_7_var
		jal f5_ini

		move $t0, $v0
		sw $t0, iret0_9_var


		lw $a0, iret0_9_var
		jal printf_int

		la $a0, str11_str
		jal printf_str

	## FUNCTION CALL ##
		li $t0 10
		mtc1 $t0, $f0
		cvt.s.w $f0, $f0
		s.s $f0, z0_8_var
		jal f5f_ini

		mov.s $f0, $f0
		s.s $f0, fret0_9_var


		l.s $f12, fret0_9_var
		jal printf_float

		la $a0, str12_str
		jal printf_str

	## FUNCTION CALL ##
		li.s $f4, 10.5
		cvt.w.s $f4, $f4
		mfc1 $t0, $f4
		sw $t0 z0_7_var
		jal f5_ini

		move $t0, $v0
		sw $t0, iret0_9_var


		lw $a0, iret0_9_var
		jal printf_int

		la $a0, str13_str
		jal printf_str

	## FUNCTION CALL ##
		lw $t0 prod_var
		sw $t0 z0_7_var
		jal f5_ini

		move $t0, $v0
		sw $t0, iret0_9_var


		lw $a0, iret0_9_var
		jal printf_int

		la $a0, str14_str
		jal printf_str

		l.s $f12, fp1_var
		jal printf_float

	## FUNCTION CALL ##
		l.s $f0, fp1_var
		s.s $f0, z0_8_var
		jal f5f_ini

		mov.s $f0, $f0
		s.s $f0, fret0_9_var


		l.s $f12, fret0_9_var
		jal printf_float

		la $a0, str15_str
		jal printf_str

	## FUNCTION CALL ##
		lw $t0 prod_var
		mtc1 $t0, $f0
		cvt.s.w $f0, $f0
		s.s $f0, z0_8_var
		jal f5f_ini

		mov.s $f0, $f0
		s.s $f0, fret0_9_var


		l.s $f12, fret0_9_var
		jal printf_float

		la $a0, str16_str
		jal printf_str

		l.s $f12, fp3_var
		jal printf_float

	## FUNCTION CALL ##
		l.s $f4, fp3_var
		cvt.w.s $f4, $f4
		mfc1 $t0, $f4
		sw $t0 z0_7_var
		jal f5_ini

		move $t0, $v0
		sw $t0, iret0_9_var


		lw $a0, iret0_9_var
		jal printf_int

		la $a0, str17_str
		jal printf_str

	## FUNCTION CALL ##
		lw $t0 prod_var
		mtc1 $t0, $f0
		cvt.s.w $f0, $f0
		s.s $f0, z0_8_var
		jal f5f_ini

		cvt.w.s $f0, $f0
		mfc1 $t0, $f0
		sw $t0, iret0_9_var


		lw $a0, iret0_9_var
		jal printf_int

		la $a0, str18_str
		jal printf_str

		l.s $f12, fp3_var
		jal printf_float

	## FUNCTION CALL ##
		l.s $f4, fp3_var
		cvt.w.s $f4, $f4
		mfc1 $t0, $f4
		sw $t0 z0_7_var
		jal f5_ini

		mtc1 $v0, $f0
		cvt.s.w $f0, $f0
		s.s $f0, fret0_9_var


		l.s $f12, fret0_9_var
		jal printf_float

pruebaFunciones_ret:
		lw $ra,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		jr $ra	# retorna al invocador

pruebaOperaciones_ini:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
		la $a0, str19_str
		jal printf_str

		lw $a0, i0_10_var
		jal printf_int

	## OPERATION PLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		lw $t0, i0_10_var
		move $t1, $t0
		add $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

	## OPERATION PLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 1.6
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		lw $t0, i0_10_var
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1
		add.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		cvt.w.s $f0, $f0
		mfc1 $t0, $f0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

	## OPERATION PLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		lw $t0, i0_10_var
		mtc1 $t0, $f2
		cvt.s.w $f2, $f2
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		l.s $f1, j0_10_var
		add.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		s.s $f0, j0_10_var


		l.s $f12, j0_10_var
		jal printf_float

	## OPERATION PLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li $t0, 1
		mtc1 $t0, $f2
		cvt.s.w $f2, $f2
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		l.s $f1, j0_10_var
		add.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		s.s $f0, j0_10_var


		l.s $f12, j0_10_var
		jal printf_float

	## OPERATION PLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 1.5
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		l.s $f1, j0_10_var
		add.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		s.s $f0, j0_10_var


		l.s $f12, j0_10_var
		jal printf_float

	## OPERATION PLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
	## OPERATION PLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 1.5
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		li $t0, 3
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1
		add.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		mov.s $f2, $f0
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		l.s $f1, j0_10_var
		add.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		s.s $f0, j0_10_var


		l.s $f12, j0_10_var
		jal printf_float

		la $a0, str20_str
		jal printf_str

		lw $a0, i0_10_var
		jal printf_int

	## OPERATION MINUS ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 4
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		lw $t0, i0_10_var
		move $t1, $t0
		sub $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

	## OPERATION MINUS ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 1.6
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		lw $t0, i0_10_var
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1
		sub.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		cvt.w.s $f0, $f0
		mfc1 $t0, $f0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

	## OPERATION MINUS ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		lw $t0, i0_10_var
		mtc1 $t0, $f2
		cvt.s.w $f2, $f2
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		l.s $f1, j0_10_var
		sub.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		s.s $f0, j0_10_var


		l.s $f12, j0_10_var
		jal printf_float

	## OPERATION MINUS ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li $t0, 1
		mtc1 $t0, $f2
		cvt.s.w $f2, $f2
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		l.s $f1, j0_10_var
		sub.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		s.s $f0, j0_10_var


		l.s $f12, j0_10_var
		jal printf_float

	## OPERATION MINUS ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 1.5
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		l.s $f1, j0_10_var
		sub.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		s.s $f0, j0_10_var


		l.s $f12, j0_10_var
		jal printf_float

	## OPERATION MINUS ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
	## OPERATION PLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 1.5
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		li $t0, 3
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1
		add.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		mov.s $f2, $f0
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		l.s $f1, j0_10_var
		sub.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		s.s $f0, j0_10_var


		l.s $f12, j0_10_var
		jal printf_float

		la $a0, str21_str
		jal printf_str

		lw $a0, i0_10_var
		jal printf_int

	## OPERATION MULT ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 4
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		lw $t0, i0_10_var
		move $t1, $t0
		mult $t1, $t2
		mflo $t0
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

	## OPERATION MULT ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 1.6
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		lw $t0, i0_10_var
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1
		mul.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		cvt.w.s $f0, $f0
		mfc1 $t0, $f0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

	## OPERATION MULT ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		lw $t0, i0_10_var
		mtc1 $t0, $f2
		cvt.s.w $f2, $f2
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		l.s $f1, j0_10_var
		mul.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		s.s $f0, j0_10_var


		l.s $f12, j0_10_var
		jal printf_float

	## OPERATION MULT ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li $t0, 1
		mtc1 $t0, $f2
		cvt.s.w $f2, $f2
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		l.s $f1, j0_10_var
		mul.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		s.s $f0, j0_10_var


		l.s $f12, j0_10_var
		jal printf_float

	## OPERATION MULT ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 1.5
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		l.s $f1, j0_10_var
		mul.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		s.s $f0, j0_10_var


		l.s $f12, j0_10_var
		jal printf_float

	## OPERATION MULT ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
	## OPERATION PLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 1.5
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		li $t0, 3
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1
		add.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		mov.s $f2, $f0
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		l.s $f1, j0_10_var
		mul.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		s.s $f0, j0_10_var


		l.s $f12, j0_10_var
		jal printf_float

		la $a0, str22_str
		jal printf_str

		lw $a0, i0_10_var
		jal printf_int

	## OPERATION DIV ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 4
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		lw $t0, i0_10_var
		move $t1, $t0
		div $t1, $t2
		mflo $t0
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

	## OPERATION DIV ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 1.6
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		lw $t0, i0_10_var
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1
		div.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		cvt.w.s $f0, $f0
		mfc1 $t0, $f0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

	## OPERATION DIV ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		lw $t0, i0_10_var
		mtc1 $t0, $f2
		cvt.s.w $f2, $f2
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		l.s $f1, j0_10_var
		div.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		s.s $f0, j0_10_var


		l.s $f12, j0_10_var
		jal printf_float

	## OPERATION DIV ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li $t0, 1
		mtc1 $t0, $f2
		cvt.s.w $f2, $f2
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		l.s $f1, j0_10_var
		div.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		s.s $f0, j0_10_var


		l.s $f12, j0_10_var
		jal printf_float

	## OPERATION DIV ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 1.5
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		l.s $f1, j0_10_var
		div.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		s.s $f0, j0_10_var


		l.s $f12, j0_10_var
		jal printf_float

	## OPERATION DIV ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
	## OPERATION PLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 1.5
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		li $t0, 3
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1
		add.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		mov.s $f2, $f0
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		l.s $f1, j0_10_var
		div.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		s.s $f0, j0_10_var


		l.s $f12, j0_10_var
		jal printf_float

		la $a0, str23_str
		jal printf_str

	## OPERATION PLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
	## OPERATION DIV ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 4
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
	## OPERATION MULT ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 3
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 2
		move $t1, $t0
		mult $t1, $t2
		mflo $t0
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		move $t1, $t0
		div $t1, $t2
		mflo $t0
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 4
		move $t1, $t0
		add $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str24_str
		jal printf_str

	## OPERATION PLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
	## OPERATION DIV ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 4
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 3
		move $t1, $t0
		div $t1, $t2
		mflo $t0
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
	## OPERATION MULT ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 2
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t1, $t0
		mult $t1, $t2
		mflo $t0
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		move $t1, $t0
		add $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		mtc1 $t0, $f0
		cvt.s.w $f0, $f0
		s.s $f0, j0_10_var


		l.s $f12, j0_10_var
		jal printf_float

		la $a0, str25_str
		jal printf_str

	## OPERATION MINUS ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 4.0
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
	## OPERATION PLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
	## OPERATION MULT ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 3
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 2
		move $t1, $t0
		mult $t1, $t2
		mflo $t0
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t1, $t0
		add $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1
		sub.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		cvt.w.s $f0, $f0
		mfc1 $t0, $f0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str26_str
		jal printf_str

	## OPERATION MINUS ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
	## OPERATION DIV ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 4.0
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
	## OPERATION MULT ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 3
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 6
		move $t1, $t0
		mult $t1, $t2
		mflo $t0
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1
		div.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		mov.s $f2, $f0
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		li $t0, 1
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1
		sub.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		mov.s $f0, $f0
		s.s $f0, j0_10_var


		l.s $f12, j0_10_var
		jal printf_float

		la $a0, str27_str
		jal printf_str

	## OPERATION DIV ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 4
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
	## OPERATION MULT ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 3
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
	## OPERATION PLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 2
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 4
		move $t1, $t0
		add $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		move $t1, $t0
		mult $t1, $t2
		mflo $t0
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		move $t1, $t0
		div $t1, $t2
		mflo $t0
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str28_str
		jal printf_str

	## OPERATION DIV ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 4
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
	## OPERATION MULT ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
	## OPERATION PLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 3
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 2
		move $t1, $t0
		add $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t1, $t0
		mult $t1, $t2
		mflo $t0
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		move $t1, $t0
		div $t1, $t2
		mflo $t0
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		mtc1 $t0, $f0
		cvt.s.w $f0, $f0
		s.s $f0, j0_10_var


		l.s $f12, j0_10_var
		jal printf_float

		la $a0, str29_str
		jal printf_str

	## OPERATION MULT ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
	## OPERATION MINUS ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 4.0
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		li $t0, 3
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1
		sub.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		mov.s $f2, $f0
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
	## OPERATION PLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 2
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t1, $t0
		add $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1
		mul.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		cvt.w.s $f0, $f0
		mfc1 $t0, $f0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str30_str
		jal printf_str

	## OPERATION DIV ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 4.0
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
	## OPERATION MULT ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 3
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
	## OPERATION MINUS ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 6
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t1, $t0
		sub $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		move $t1, $t0
		mult $t1, $t2
		mflo $t0
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1
		div.s $f0, $f1, $f2
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		mov.s $f0, $f0
		s.s $f0, j0_10_var


		l.s $f12, j0_10_var
		jal printf_float

		la $a0, str31_str
		jal printf_str

	## OPERATION EQEQ ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 2
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t1, $t0
		seq $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str32_str
		jal printf_str

	## OPERATION EQEQ ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t1, $t0
		seq $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str33_str
		jal printf_str

	## OPERATION NOTEQ ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 2
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t1, $t0
		sne $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str34_str
		jal printf_str

	## OPERATION NOTEQ ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t1, $t0
		sne $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str35_str
		jal printf_str

	## OPERATION EQEQ ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 2.4
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		li $t0, 1
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1
		li.s $f0, 1.0
		c.eq.s $f1, $f2
		bc1t J_ET_M_T_0
		li.s $f0, 0.0
	J_ET_M_T_0:
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		cvt.w.s $f0, $f0
		mfc1 $t0, $f0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str36_str
		jal printf_str

	## OPERATION EQEQ ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 1.1
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		li.s $f1, 1.1
		li.s $f0, 1.0
		c.eq.s $f1, $f2
		bc1t J_ET_M_T_1
		li.s $f0, 0.0
	J_ET_M_T_1:
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		cvt.w.s $f0, $f0
		mfc1 $t0, $f0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str37_str
		jal printf_str

	## OPERATION NOTEQ ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 2.0
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		li.s $f1, 2.4
		li.s $f0, 0.0
		c.eq.s $f1, $f2
		bc1t J_ET_M_T_2
		li.s $f0, 1.0
	J_ET_M_T_2:
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		cvt.w.s $f0, $f0
		mfc1 $t0, $f0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str38_str
		jal printf_str

	## OPERATION NOTEQ ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 1.0
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		li.s $f1, 1.0
		li.s $f0, 0.0
		c.eq.s $f1, $f2
		bc1t J_ET_M_T_3
		li.s $f0, 1.0
	J_ET_M_T_3:
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		cvt.w.s $f0, $f0
		mfc1 $t0, $f0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str39_str
		jal printf_str

	## OPERATION LDEQ ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 2
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t1, $t0
		sle $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str40_str
		jal printf_str

	## OPERATION GDEQ ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t1, $t0
		sge $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str41_str
		jal printf_str

	## OPERATION LD ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 2
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t1, $t0
		slt $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str42_str
		jal printf_str

	## OPERATION GD ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t1, $t0
		sgt $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str43_str
		jal printf_str

	## OPERATION LDEQ ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 2.4
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		li $t0, 1
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1
		li.s $f0, 1.0
		c.le.s $f1, $f2
		bc1t J_ET_M_T_4
		li.s $f0, 0.0
	J_ET_M_T_4:
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		cvt.w.s $f0, $f0
		mfc1 $t0, $f0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str44_str
		jal printf_str

	## OPERATION GDEQ ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 1.1
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		li.s $f1, 1.1
		li.s $f0, 0.0
		c.lt.s $f1, $f2
		bc1t J_ET_M_T_5
		li.s $f0, 1.0
	J_ET_M_T_5:
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		cvt.w.s $f0, $f0
		mfc1 $t0, $f0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str45_str
		jal printf_str

	## OPERATION LD ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 2.0
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		li.s $f1, 2.4
		li.s $f0, 1.0
		c.lt.s $f1, $f2
		bc1t J_ET_M_T_6
		li.s $f0, 0.0
	J_ET_M_T_6:
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		cvt.w.s $f0, $f0
		mfc1 $t0, $f0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str46_str
		jal printf_str

	## OPERATION GD ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 1.0
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		li.s $f1, 1.0
		li.s $f0, 0.0
		c.le.s $f1, $f2
		bc1t J_ET_M_T_7
		li.s $f0, 1.0
	J_ET_M_T_7:
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		cvt.w.s $f0, $f0
		mfc1 $t0, $f0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str47_str
		jal printf_str

	## OPERATION ANDAND ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
	## OPERATION GD ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 2
		move $t1, $t0
		sgt $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
	## OPERATION LD ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 2
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t1, $t0
		slt $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		move $t1, $t0
		li $t0, 0
		beqz $t1, J_ET_M_T_8
		beqz $t2, J_ET_M_T_8
		li $t0, 1
	J_ET_M_T_8:
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str48_str
		jal printf_str

	## OPERATION OROR ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
	## OPERATION GD ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 2
		move $t1, $t0
		sgt $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
	## OPERATION GD ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 2
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t1, $t0
		sgt $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		move $t1, $t0
		li $t0, 1
		bnez $t1, J_ET_M_T_9
		bnez $t2, J_ET_M_T_9
		li $t0, 0
	J_ET_M_T_9:
		sle $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str49_str
		jal printf_str

	## OPERATION ANDAND ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
	## OPERATION GDEQ ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 2
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t1, $t0
		sge $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		mtc1 $t0, $f2
		cvt.s.w $f2, $f2
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
	## OPERATION LDEQ ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 2.4
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		li $t0, 1
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1
		li.s $f0, 1.0
		c.le.s $f1, $f2
		bc1t J_ET_M_T_10
		li.s $f0, 0.0
	J_ET_M_T_10:
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		mov.s $f1, $f0
		li.s $f0, 0.0
		c.eq.s $f1, $f0
		bc1t J_ET_M_T_11
		c.eq.s $f2, $f0
		bc1t J_ET_M_T_11
		li.s $f0, 1.0
	J_ET_M_T_11:
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		cvt.w.s $f0, $f0
		mfc1 $t0, $f0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

		la $a0, str50_str
		jal printf_str

	## OPERATION OROR ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
	## OPERATION LDEQ ##
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f2,  ($sp) #Salvado de $ra
		li.s $f2, 2.4
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
		li $t0, 1
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1
		li.s $f0, 1.0
		c.le.s $f1, $f2
		bc1t J_ET_M_T_12
		li.s $f0, 0.0
	J_ET_M_T_12:
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		mov.s $f2, $f0
		sub $sp,$sp,4 #Reserva de la pila
		s.s $f1,  ($sp) #Salvado de $ra
	## OPERATION GDEQ ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 2
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t1, $t0
		sge $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1
		li.s $f0, 1.0
		li.s $f5, 0.0
		c.eq.s $f1, $f5
		bc1f J_ET_M_T_13
		c.eq.s $f2, $f5
		bc1f J_ET_M_T_13
		li.s $f0, 0.0
	J_ET_M_T_13:
		l.s $f1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		l.s $f2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		cvt.w.s $f0, $f0
		mfc1 $t0, $f0
		sw $t0, i0_10_var


		lw $a0, i0_10_var
		jal printf_int

pruebaOperaciones_ret:
		lw $ra,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		jr $ra	# retorna al invocador

pruebaSentenciasControl_ini:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
		la $a0, str51_str
		jal printf_str

	## OPERATION LD ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 2
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t1, $t0
		slt $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		beqz $t0, J_ET_M_T_14_fin
		la $a0, str52_str
		jal printf_str

	J_ET_M_T_14_fin:
		la $a0, str53_str
		jal printf_str

	## OPERATION LD ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 2
		move $t1, $t0
		slt $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		beqz $t0, J_ET_M_T_15_else
		la $a0, str55_str
		jal printf_str

		b J_ET_M_T_15_fin
	J_ET_M_T_15_else:
		la $a0, str54_str
		jal printf_str

	J_ET_M_T_15_fin:
		la $a0, str56_str
		jal printf_str

		li $t0, 0
		sw $t0, i0_11_var


	J_ET_M_T_16_while:
	## OPERATION LD ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 10
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		lw $t0, i0_11_var
		move $t1, $t0
		slt $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		beqz $t0, J_ET_M_T_16_fin
		lw $a0, i0_11_var
		jal printf_int

	## OPERATION PLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		lw $t0, i0_11_var
		move $t1, $t0
		add $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		sw $t0, i0_11_var


		b J_ET_M_T_16_while
	J_ET_M_T_16_fin:
pruebaSentenciasControl_ret:
		lw $ra,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		jr $ra	# retorna al invocador

pruebasArrays_ini:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
	# ARRAYVAR DESP#
		la $t3 ar10_12_var
		li $t5, 0
		li $t4, 1
		add $t5, $t4, $t5
		add $t5, $t5, $t5
		add $t5, $t5, $t5
		add $t1, $t5, $t3
		li $t0, 5
		sw $t0,  0($t1)


	# ARRAYVAR DESP#
		la $t3 ar20_12_var
		li $t5, 0
		li $t4, 3
		add $t5, $t4, $t5
		li $t4, 4
		add $t5, $t4, $t5
		add $t5, $t5, $t5
		add $t5, $t5, $t5
		add $t1, $t5, $t3
		li $t0, 15
		sw $t0,  0($t1)


	# ARRAYVAR DESP#
		la $t3 ar30_12_var
		li $t5, 0
		li $t4, 2
		add $t5, $t4, $t5
		li $t4, 15
		add $t5, $t4, $t5
		li $t4, 20
		add $t5, $t4, $t5
		add $t5, $t5, $t5
		add $t5, $t5, $t5
		add $t1, $t5, $t3
		li $t0, 25
		sw $t0,  0($t1)


	# ARRAYVAR DESP#
		la $t3 ar10_12_var
		li $t5, 0
		li $t4, 1
		add $t5, $t4, $t5
		add $t5, $t5, $t5
		add $t5, $t5, $t5
		add $t1, $t5, $t3
		lw $t0, 0($t1)
		move $t0, $t0
		sw $t0, i0_12_var


		lw $a0, i0_12_var
		jal printf_int

	# ARRAYVAR DESP#
		la $t3 ar20_12_var
		li $t5, 0
		li $t4, 3
		add $t5, $t4, $t5
		li $t4, 4
		add $t5, $t4, $t5
		add $t5, $t5, $t5
		add $t5, $t5, $t5
		add $t1, $t5, $t3
		lw $t0, 0($t1)
		move $t0, $t0
		sw $t0, i0_12_var


		lw $a0, i0_12_var
		jal printf_int

	# ARRAYVAR DESP#
		la $t3 ar30_12_var
		li $t5, 0
		li $t4, 2
		add $t5, $t4, $t5
		li $t4, 15
		add $t5, $t4, $t5
		li $t4, 20
		add $t5, $t4, $t5
		add $t5, $t5, $t5
		add $t5, $t5, $t5
		add $t1, $t5, $t3
		lw $t0, 0($t1)
		move $t0, $t0
		sw $t0, i0_12_var


		lw $a0, i0_12_var
		jal printf_int

pruebasArrays_ret:
		lw $ra,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		jr $ra	# retorna al invocador

pruebaOperaciones2_ini:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
		li $t0, 0
		sw $t0, i0_13_var


		li $t0, 0
		sw $t0, j0_13_var


		la $a0, str57_str
		jal printf_str

	## OPERATION PLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		lw $t0, i0_13_var
		move $t1, $t0
		add $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		sw $t0, i0_13_var
		lw $t0, i0_13_var
		sw $t0, j0_13_var


		lw $a0, i0_13_var
		jal printf_int

		lw $a0, j0_13_var
		jal printf_int

		la $a0, str58_str
		jal printf_str

	## OPERATION MINUS ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		lw $t0, i0_13_var
		move $t1, $t0
		sub $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		sw $t0, i0_13_var
		lw $t0, i0_13_var
		sw $t0, j0_13_var


		lw $a0, i0_13_var
		jal printf_int

		lw $a0, j0_13_var
		jal printf_int

		la $a0, str59_str
		jal printf_str

	## OPERATION PLUSPLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		lw $t0, i0_13_var
		move $t1, $t0
		add $t3, $t1, $t2
		sw $t3, i0_13_var
		move $t0, $t1
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		sw $t0, j0_13_var


		lw $a0, i0_13_var
		jal printf_int

		lw $a0, j0_13_var
		jal printf_int

		la $a0, str60_str
		jal printf_str

	## OPERATION MINUSMINUS ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		lw $t0, i0_13_var
		move $t1, $t0
		sub $t3, $t1, $t2
		sw $t3, i0_13_var
		move $t0, $t1
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		sw $t0, j0_13_var


		lw $a0, i0_13_var
		jal printf_int

		lw $a0, j0_13_var
		jal printf_int

	## OPERATION PLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
	## OPERATION PLUSPLUS ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 1
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		lw $t0, i0_13_var
		move $t1, $t0
		add $t3, $t1, $t2
		sw $t3, i0_13_var
		move $t0, $t1
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 2
		move $t1, $t0
		add $t0, $t1, $t2
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		move $t0, $t0
		sw $t0, j0_13_var


		lw $a0, i0_13_var
		jal printf_int

		lw $a0, j0_13_var
		jal printf_int

pruebaOperaciones2_ret:
		lw $ra,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		jr $ra	# retorna al invocador

 main:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
		la $a0, str61_str
		jal printf_str

	## FUNCTION CALL ##
		jal pruebaFunciones_ini

		la $a0, str62_str
		jal printf_str

	## FUNCTION CALL ##
		jal pruebaOperaciones_ini

		la $a0, str63_str
		jal printf_str

	## FUNCTION CALL ##
		jal pruebaSentenciasControl_ini

		la $a0, str64_str
		jal printf_str

	## FUNCTION CALL ##
		jal pruebasArrays_ini

		la $a0, str65_str
		jal printf_str

	## FUNCTION CALL ##
		jal pruebaOperaciones2_ini

		la $a0, str66_str
		jal printf_str

		li $v0, 0
		#--Fin de programa--#
		lw $ra,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		li $v0, 10
		syscall

printf_int:
		li $v0, 1
		syscall
		la $a0, ln_str
		li $v0, 4
		syscall
		jr $ra	# retorna al invocador

printf_float:
		li $v0, 2
		syscall
		la $a0, ln_str
		li $v0, 4
		syscall
		jr $ra	# retorna al invocador

printf_str:
		li $v0, 4
		syscall
		jr $ra	# retorna al invocador

