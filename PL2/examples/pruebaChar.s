#
# UC3M - PROCESADORES DEL LENGUAJE
# Codigo generado por los alumnos:
# Adrian Lopez Perez
# Daniel Conde Garcia
###################################

		.data
charPrintHelper:		.word 0
charPrintHelperz:		.word 0
b0_1_var:		.float 0.0, 0.0, 0.0, 0.0, 0.0
a0_1_var:		.float 0.0
ln_str:		.asciiz "\n"

		.text

		.globl main
 main:
		sub $sp,$sp,4 #Reserva de la pila
		sw $ra,  ($sp) #Salvado de $ra
	# ARRAYVAR DESP#
		la $t3 b0_1_var
		li $t5, 0
		li $t4, 3
		add $t5, $t4, $t5
		add $t5, $t5, $t5
		add $t5, $t5, $t5
		add $t1, $t5, $t3
	## OPERATION MULT ##
		sub $sp,$sp,4 #Reserva de la pila
		sw $t2,  ($sp) #Salvado de $ra
		li $t0, 3
		move $t2, $t0
		sub $sp,$sp,4 #Reserva de la pila
		sw $t1,  ($sp) #Salvado de $ra
		li $t0, 50
		move $t1, $t0
		mult $t1, $t2
		mflo $t0
		lw $t1,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		lw $t2,  ($sp) #Restauracion de $ra
		add $sp,$sp,4 #liberacion de la pila
		mtc1 $t0, $f0
		cvt.s.w $f0, $f0
		s.s $f0,  0($t1)


	# ARRAYVAR DESP#
		la $t3 b0_1_var
		li $t5, 0
		li $t4, 3
		add $t5, $t4, $t5
		add $t5, $t5, $t5
		add $t5, $t5, $t5
		add $t1, $t5, $t3
		l.s $f0, 0($t1)
		s.s $f0, a0_1_var


		l.s $f12, a0_1_var
		jal printf_float

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

