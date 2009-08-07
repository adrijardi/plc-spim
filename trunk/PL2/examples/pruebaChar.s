#
# UC3M - PROCESADORES DEL LENGUAJE
# Codigo generado por los alumnos:
# Adrian Lopez Perez
# Daniel Conde Garcia
###################################

		.data
charPrintHelper:		.asciiz "-"
a0_1_var:		.word 97
ln_str:		.asciiz "\n"

		.text

		.globl __start
 __start:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
		li $t0, 98
		sw $t0, a0_1_var


		lw $t0, a0_1_var
		sw $t0, charPrintHelper
		la $a0, charPrintHelper

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

