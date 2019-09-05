# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Author: Dajion Martin
# Assignment: Lab 1. Part 3
# Notes: Array Reversal of any length. (50 pts)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
	.data
MSG1: 	.asciiz "Array1 Length 10: [ "
MSG2: 	.asciiz "]\nArray1 Reversed : [ "
MSG3: 	.asciiz "]\nArray2 Length 5 : [ "
MSG4: 	.asciiz "]\nArray2 Reversed : [ "
MSG5: 	.asciiz "]\nArray3 Length 17: [ "
MSG6: 	.asciiz "]\nArray3 Reversed : [ "
MSG7: 	.asciiz "]"
SPACE:	.asciiz ", "
	
	.align 2

ARRY1:	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
ARRY2:	.word 0, 2, 4, 6, 8
ARRY3:	.word 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0

COUT1:	.word 10
COUT2:	.word 5
COUT3:	.word 17
INDEX:	.word 1

	.text
	.globl main

main: 
	li   $v0, 4		# Call: Print String
	la   $a0, MSG1		# load MSG1
	syscall			# Output
     
FOR1:
	lw   $t0, INDEX		# Sum = 1
	lw   $t1, COUT1		# Load C into t0
	lw   $a0, INDEX
	li   $v0, 1
	syscall
	li   $v0, 4
	la   $a0, SPACE
	syscall
	addi $t0, $t0, 1	# INPUT + 1
	sw   $t0, INDEX		# Store new Sum
	bge  $t1, $t0, FOR1

	li   $t0, 0
	sw   $t0, INDEX
	
	li   $v0, 4		# Call: Print String
	la   $a0, MSG2		# load MSG1
	syscall			# Output

REV1:
	lw   $t1, COUT1		# Load C into t0
	lw   $a0, COUT1
	addi $t1, $t1, -1	# INPUT + 1
	sw   $t1, COUT1		# Store new Sum
	li   $v0, 1
	syscall
	li   $v0, 4
	la   $a0, SPACE
	syscall
	bgt  $t1, $t0, REV1
	
	li   $v0, 4		# Call: Print String
	la   $a0, MSG3		# load MSG1
	syscall			# Output
    
	li   $t0, 1
	sw   $t0, INDEX
 
FOR2:
	lw   $t0, INDEX		# Sum = 1
	lw   $t1, COUT2		# Load C into t0
	lw   $a0, INDEX
	li   $v0, 1
	syscall
	li   $v0, 4
	la   $a0, SPACE
	syscall
	addi $t0, $t0, 1	# INPUT + 1
	sw   $t0, INDEX		# Store new Sum
	bge  $t1, $t0, FOR2

	li   $t0, 1
	sw   $t0, INDEX

	li   $v0, 4		# Call: Print String
	la   $a0, MSG4		# load MSG1
	syscall			# Output


	li   $t0, 0
	sw   $t0, INDEX

REV2:
	lw   $t1, COUT2		# Load C into t0
	lw   $a0, COUT2
	addi $t1, $t1, -1	# INPUT + 1
	sw   $t1, COUT2		# Store new Sum
	li   $v0, 1
	syscall
	li   $v0, 4
	la   $a0, SPACE
	syscall
	bne  $t1, $t0, REV2


	li   $v0, 4		# Call: Print String
	la   $a0, MSG5		# load MSG1
	syscall			# Output

FOR3:
	lw   $t0, INDEX		# Sum = 1
	lw   $t1, COUT3		# Load C into t0
	lw   $a0, INDEX
	li   $v0, 1
	syscall
	li   $v0, 4
	la   $a0, SPACE
	syscall
	addi $t0, $t0, 1	# INPUT + 1
	sw   $t0, INDEX		# Store new Sum
	bge  $t1, $t0, FOR3

	li   $t0, 0
	sw   $t0, INDEX
	
	li   $v0, 4		# Call: Print String
	la   $a0, MSG6		# load MSG1
	syscall			# Output

REV3:
	lw   $t1, COUT3		# Load C into t0
	lw   $a0, COUT3
	addi $t1, $t1, -1	# INPUT + 1
	sw   $t1, COUT3		# Store new Sum
	li   $v0, 1
	syscall
	li   $v0, 4
	la   $a0, SPACE
	syscall
	bgt  $t1, $t0, REV3
	
	li   $v0, 4		# Call: Print String
	la   $a0, MSG7		# load MSG1
	syscall			# Output
END:	
	li   $v0, 10		# Call: Exit
	syscall			# Exit

