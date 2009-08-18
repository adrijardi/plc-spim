#
# UC3M - PROCESADORES DEL LENGUAJE
# Codigo generado por los alumnos:
# Adrian Lopez Perez
# Daniel Conde Garcia
###################################

		.data
charPrintHelper:		.word 0
charPrintHelperz:		.word 0
f_var:		.word 0
c_var:		.word 0, 0, 0, 0, 0
ln_str:		.asciiz "\n"

		.text

		.globl __start
 __start:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
		li $t0, 98
		sw $t0, f_var


	# ARRAYVAR DESP#
		la $t3 c_var
		li $t5, 0
		li $t4, 0
		add $t5, $t4, $t5
		add $t5, $t5, $t5
		add $t5, $t5, $t5
		add $t1, $t5, $t3
		li $t0, 97
		sw $t0,  0($t1)


	# ARRAYVAR DESP#
		la $t3 c_var
		li $t5, 0
		li $t4, 1
		add $t5, $t4, $t5
		add $t5, $t5, $t5
		add $t5, $t5, $t5
		add $t1, $t5, $t3
		li $t0, 98
		sw $t0,  0($t1)


		sw $t0, f_var


		lw $t0, f_var
		sw $t0, charPrintHelper
		la $a0, charPrintHelper

		jal printf_str

		sw $t0, f_var


		lw $t0, f_var
		sw $t0, charPrintHelper
		la $a0, charPrintHelper

		jal printf_str

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

