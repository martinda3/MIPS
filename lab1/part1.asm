# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Author: Dajion Martin
# Assignment: Lab 1. Part 1
# Notes: Given a number N (N is a positive integer),
#	 compute the sum 1 to N. For example, if I 
#	 input 5, the output should be 15. (30 pts)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
	.data
MSG1: 	.asciiz "Enter a value for N: "
MSG2: 	.asciiz "\nThe sum of 1 to "
MSG3: 	.asciiz " is "
	
	.align 2

INPUT:	.space 4
COUNT:	.word 1
SUM:	.word 1

	.text
	.globl main

main: 
	li   $v0, 4		# Call: Print String
	la   $a0, MSG1		# load MSG1
	syscall			# Output
      
	li   $v0, 5		# Call: Read Integer
	syscall			# Input
	sw   $v0, INPUT		# Store in Input
	
	lw   $a0, INPUT		# A0 = INPUT
	beq  $a0, 1, END	# if INPUT == 1 goto END
	li   $t1, 1		# SUM = 1
LOOP:	
	lw   $t0, COUNT		# T0 = COUNT
	addi $t0, $t0, 1	# COUNT += 1
	sw   $t0, COUNT		# Store new COUNT
	
	add  $t1, $t1, $t0	# Add T1 = SUM + COUNT
	sw   $t1, SUM		# Store new SUM
	
	lw   $a0, INPUT		# A0 = INPUT
	lw   $a1, COUNT		# A1 = COUNT
	beq  $a0, $a1, END	# if INPUT == COUNT 
	j LOOP			# else loop

END:
	li   $v0, 4		# Call: Print String
	la   $a0, MSG2		# Load MSG2
	syscall			# Output
	
	li   $v0, 1		# Call: Print Integer
	lw   $a0, INPUT		# A0 == INPUT
	syscall			# Output
	
	li   $v0, 4		# Call: Print String
	la   $a0, MSG3		# Load MSG3
	syscall			# Output
		
	li   $v0, 1		# Call: Print Integer
	lw   $a0, SUM		# A0 == Sum
	syscall			# Output
	
	li   $v0, 10		# Call: Exit
	syscall			# Exit

