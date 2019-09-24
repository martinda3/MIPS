# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Author: Dajion Martin
# Assignment: Lab 1. Part 3
# Notes: Bubble sort
# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
	.data
MSG1: 	.asciiz "10, 5 "
MSG2: 	.asciiz "\n"
MSG3: 	.asciiz "]"
SPACE:	.asciiz ", "
	
	.align 2

ARRY1:	.word 10, 5, 3, 1, 6, 8, 0, 2, 7, 4

COUT1:	.word 10
INDEX:	.word 0
TEMP:	.word 9

	.text
	.globl main
main:	
	li   $v0, 4		# Call: Print String
	la   $a0, MSG1		# load MSG1
	syscall			# Output
     
	la $t0, ARRY1
	la $s0, ARRY1
LOOP:
	lw $t1, INDEX
	li $t6, 8
	bgt $t1, $t6, RESET		
	sll  $t2, $t1, 2	# Mulitpying Index by 4 = address of Index
	add $t4, $t2, $t0
	lw   $a0, 0($t4)	# Loading value at address of index
	
	addi $t1, $t1, 1
	sll  $t3, $t1, 2	# Mulitpying Index by 4 = address of Index
	add $t5, $t3, $t0
	lw   $a1, 0($t5)	# Loading value at address of index
	sw  $t1, INDEX
	jal RUN
	

	bne $v0, $v1, UPDE
OKIS:	
	
	add $a0, $v0, $zero

	li   $v0, 1			# Call: Print String
	syscall				# Output
	add $a0, $v1, $zero
	li   $v0, 1			# Call: Print String
	j LOOP

UPDE:
	add $t1, $t2, $t0
	sw $a0, 0($t1)
	add $t1, $t3, $t0
	sw $a1, 0($t1)
	j OKIS	
			
RESET:
	li $t1, 0
	sw $t1, INDEX
	lw $t1, TEMP
	sw $s0, 0($t0)
	addi $t1, $t1, -1
	beqz $t1, END	
	sw $t1, TEMP
	li   $v0, 4		# Call: Print String
	la   $a0, MSG1		# load MSG1
	syscall			# Output
	j LOOP

END:
	syscall				# Output
	li   $v0, 10		# Call: Exit
	syscall			# Exit



RUN:
	bge $a0, $a1, ONE
	j TWO
ONE:	
	add $v0, $a1, $zero
	add $v1, $a0, $zero
	j CLEAN
TWO:
	add $v0, $zero, $zero
	add $v1, $zero, $zero
	j CLEAN
CLEAN:
	jr $ra

