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
      
	sw   $v0, INPUT		# N = Input
	lw   $a0, INPUT		# a0 = N
	beq  $a0, 1, END	# if N == 1 goto result
	li   $t1, 1		# Sum = 1
LOOP:	
	lw   $t0, COUNT		# Load C into t0
	addi $t0, $t0, 1	# C = C + 1
	sw   $t0, COUNT		# Store new C
	
	add  $t1, $t1, $t0	# Add C to Sum
	sw   $t1, SUM		# Store new Sum
	
	lw   $a0, INPUT		# Load N into a0
	lw   $a1, COUNT		# Load C into a1
	beq  $a0, $a1, END	# Branch if N == C 
	j LOOP			# else loop

END:
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

