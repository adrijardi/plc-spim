#
# UC3M - PROCESADORES DEL LENGUAJE
# Codigo generado por los alumnos:
# Adrian Lopez Perez
# Daniel Conde Garcia
###################################

		.data
fp2_var:		.float 6.3
fp1_var:		.float 3.5
y_var:		.word 10
prod_var:		.word 2
fret0_8_var:		.float 0.0
iret0_8_var:		.word 0
f0_6_var:		.word 0
z0_7_var:		.word 0
z0_6_var:		.word 0
y0_8_var:		.word 3
c0_6_var:		.word 0
str9_str:		.asciiz "Invocacion con parametros constantes[int, int, int] f4\n"
str8_str:		.asciiz "Invocacion vacia con retorno variable[float] f3f\n"
str7_str:		.asciiz "Invocacion vacia con retorno variable[int] f3\n"
str6_str:		.asciiz "Invocacion vacia con retorno constante[float] f2f\n"
str5_str:		.asciiz "Invocacion vacia con retorno constante[int] f2\n"
str4_str:		.asciiz "Invocacion vacia f1\n"
str11_str:		.asciiz "Saliendo...\n"
str3_str:		.asciiz "y="
str10_str:		.asciiz "Invocacion con parametros constantes y retorno [int] f5\n"
str2_str:		.asciiz "prod="
str1_str:		.asciiz "fp1(global)="
str0_str:		.asciiz "y(global)="
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

 __start:
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

		lw $a0, y0_8_var
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
		sw $t0, iret0_8_var

		lw $a0, iret0_8_var
		jal printf_int

		la $a0, str6_str
		jal printf_str

	## FUNCTION CALL ##
		jal f2f_ini

		s.s $f0, fret0_8_var

		l.s $f12, fret0_8_var
		jal printf_float

		la $a0, str7_str
		jal printf_str

	## FUNCTION CALL ##
		jal f3_ini

		move $t0, $v0
		sw $t0, iret0_8_var

		lw $a0, iret0_8_var
		jal printf_int

		la $a0, str8_str
		jal printf_str

	## FUNCTION CALL ##
		jal f3f_ini

		s.s $f0, fret0_8_var

		l.s $f12, fret0_8_var
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
		sw $t0, iret0_8_var

		lw $a0, iret0_8_var
		jal printf_int

		la $a0, str11_str
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

