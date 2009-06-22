#
# UC3M - PROCESADORES DEL LENGUAJE
# Codigo generado por los alumnos:
# Adrian Lopez Perez
# Daniel Conde Garcia
###################################

		.data
y_var:		.word 10
prod_var:		.word 2
f20_1_var:		.word 0
y0_1_var:		.word 3
str5_str:		.ascii "y(global)=\0"
str4_str:		.ascii "Saliendo...\n\0"
str3_str:		.ascii "Invoco a f2 con resultado: \0"
str2_str:		.ascii "Invoco a f1\n\0"
str1_str:		.ascii "y=\0"
str0_str:		.ascii "prod=\0"
ln_str:		.ascii "\n"

		.text

		.globl main
main:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
		li $t0, 5
		sw $t0, prod_var

		la $a0, str0_str
		jal printf_str

		lw $a0, prod_var
		jal printf_int

		la $a0, str1_str
		jal printf_str

		lw $a0, y0_1_var
		jal printf_int

		la $a0, str2_str
		jal printf_str

		jal f1_ini

		la $a0, str3_str
		jal printf_str

		jal f2_ini
		move $t0, $v0
		sw $t0, f20_1_var

		lw $a0, f20_1_var
		jal printf_int

		la $a0, str4_str
		jal printf_str

		li $v0, 0
		#--Fin de programa--#
		lw $ra,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		li $v0, 10
		syscall

f1_ini:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
		la $a0, str5_str
		jal printf_str

		lw $a0, y_var
		jal printf_int

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

printf_int:
		li $v0, 1
		syscall
		la $a0, ln_str
		li $v0, 4
		syscall
		jr $ra	# retorna al invocador

printf_float:
		mtc1 $a1, $f12
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

