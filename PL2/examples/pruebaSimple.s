#
# UC3M - PROCESADORES DEL LENGUAJE
# Codigo generado por los alumnos:
# Adrian Lopez Perez
# Daniel Conde Garcia
###################################

		.data
fp2_var:		.float 6.3
fp3_var:		.float 4.3
fp1_var:		.float 3.5
y_var:		.word 10
prod_var:		.word 2
j0_10_var:		.float 0.0
i0_10_var:		.word 1
fret0_9_var:		.float 0.0
iret0_9_var:		.word 0
f0_6_var:		.word 0
z0_7_var:		.word 0
z0_8_var:		.float 0.0
z0_6_var:		.word 0
y0_9_var:		.word 3
c0_6_var:		.word 0
str3_str:		.asciiz "y="
str2_str:		.asciiz "prod="
str1_str:		.asciiz "fp1(global)="
str0_str:		.asciiz "y(global)="
str29_str:		.asciiz "Pruebas de precedencia con parentesis almacenano en entero [(1+2)*(3-4.0)]\n"
str28_str:		.asciiz "Pruebas de precedencia con parentesis almacenano en float [1*(2+3)/4]\n"
str27_str:		.asciiz "Pruebas de precedencia con parentesis almacenano en entero [((4+2)*3)/4]\n"
str26_str:		.asciiz "Pruebas de precedencia sin parentesis almacenano en float [1-6*3/4.0]\n"
str25_str:		.asciiz "Pruebas de precedencia sin parentesis almacenano en entero [1+2*3-4.0]\n"
str24_str:		.asciiz "Pruebas de precedencia sin parentesis almacenano en float [1*2+3/4]\n"
str23_str:		.asciiz "Pruebas de precedencia sin parentesis almacenano en entero [4+2*3/4]\n"
str22_str:		.asciiz "Asignaciones con operacion [/=]\n"
str21_str:		.asciiz "Asignaciones con operacion [*=]\n"
str20_str:		.asciiz "Asignaciones con operacion [-=]\n"
str34_str:		.asciiz "Saliendo...\n"
str33_str:		.asciiz "Pruebas Sentencias Control\n"
str32_str:		.asciiz "Pruebas Operaciones\n"
str31_str:		.asciiz "Pruebas funciones\n"
str30_str:		.asciiz "Pruebas de precedencia con parentesis almacenano en float [(1-6)*3/4.0]\n"
str19_str:		.asciiz "Asignaciones con operacion [+=]\n"
str18_str:		.asciiz "Conversion de asignacion en retorno (conversion int -> float) f5\n"
str17_str:		.asciiz "Conversion de asignacion en retorno (conversion float -> int) f5f\n"
str16_str:		.asciiz "Invocacion con parametros variables (conversion float -> int) y retorno [int] f5\n"
str15_str:		.asciiz "Invocacion con parametros variables (conversion int -> float) y retorno [int] f5f\n"
str14_str:		.asciiz "Invocacion con parametros variables y retorno [int] f5f\n"
str13_str:		.asciiz "Invocacion con parametros variables y retorno [int] f5\n"
str9_str:		.asciiz "Invocacion con parametros constantes[int, int, int] f4\n"
str12_str:		.asciiz "Invocacion con parametros constantes (conversion float -> int) y retorno [int] f5\n"
str8_str:		.asciiz "Invocacion vacia con retorno variable[float] f3f\n"
str11_str:		.asciiz "Invocacion con parametros constantes (conversion int -> float) y retorno [int] f5f\n"
str7_str:		.asciiz "Invocacion vacia con retorno variable[int] f3\n"
str10_str:		.asciiz "Invocacion con parametros constantes y retorno [int] f5\n"
str6_str:		.asciiz "Invocacion vacia con retorno constante[float] f2f\n"
str5_str:		.asciiz "Invocacion vacia con retorno constante[int] f2\n"
str4_str:		.asciiz "Invocacion vacia f1\n"
ln_str:		.asciiz "\n"

		.text

		.globl __start
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

pruebaOperaciones_ret:
		lw $ra,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		jr $ra	# retorna al invocador

pruebaSentenciasControl_ini:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
pruebaSentenciasControl_ret:
		lw $ra,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		jr $ra	# retorna al invocador

 __start:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
		la $a0, str31_str
		jal printf_str

	## FUNCTION CALL ##
		jal pruebaFunciones_ini

		la $a0, str32_str
		jal printf_str

	## FUNCTION CALL ##
		jal pruebaOperaciones_ini

		la $a0, str33_str
		jal printf_str

	## FUNCTION CALL ##
		jal pruebaSentenciasControl_ini

		la $a0, str34_str
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

