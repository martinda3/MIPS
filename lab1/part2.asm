# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Author: Dajion Martin
# Assignment: Lab 1. Part 2
# Notes: Implement Part 1 w/o using loops. (20 pts)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
	.data
MSG1: 	.asciiz "Enter a value for N: "
MSG2: 	.asciiz "\nThe sum of 1 to "
MSG3: 	.asciiz " is "
	
	.align 2

INPUT:	.space 4
SUM:	.word 1

	.text
	.globl main

main: 
	li   $v0, 4		# Call: Print String
	la   $a0, MSG1		# load MSG1
	syscall			# Output
      
	li   $v0, 5		# Call: Read Integer
	syscall			# Input
	sw   $v0, INPUT		# Input
	
	## (INPUT(INPUT + 1))/ 2 ##

	lw   $t1, INPUT		# Sum = 1
	lw   $t0, INPUT		# Load C into t0
	addi $t0, $t0, 1	# INPUT + 1
	mult $t0, $t1		# Lo = N*(N+1)
	mflo $t0		# T0 = N*(N+1)
	li   $t1, 2		# T1 = 2
	div  $t0, $t1		# Lo = T0/2
	mflo $t0		# T0 = T0/2
	sw   $t0, SUM		# Store new Sum
	
	li   $v0, 4		# Call: Print String
	la   $a0, MSG2		# Load MSG2
	syscall			# Output
	
	li   $v0, 1		# Call: Print Integer
	lw   $a0, INPUT		# A0 == N
	syscall			# Output
	
	li   $v0, 4		# Call: Print String
	la   $a0, MSG3		# Load MSG3
	syscall			# Output
		
	li   $v0, 1		# Call: Print Integer
	lw   $a0, SUM		# A0 == Sum
	syscall			# Output
	
	li   $v0, 10		# Call: Exit
	syscall			# Exit

