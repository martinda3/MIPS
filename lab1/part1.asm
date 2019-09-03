# # # # # # # # # # # # # ## # # # # # # # # #
# Author: Dajion Martin
# Assignment: Lab 1. Part 1
# Notes: Given a number N (N is a positive integer), 
#        compute the sum 1 to N. For example, if I 
#        input 5, the output should be 15. (30 pts) 
# # # # # # # # # # # # # ## # # # # # # ## #
.text
.globl main

main: 
	li $v0, 4	# print string
	la $a0, MSG1	# load address of MSG1
	syscall		# Simulate
      
	li $v0, 5	# Read Int
	syscall		# Sim
      
	la $t6, N	# load address of N
	sw $v0, 0($t6)	# N = $v0
	lw $a0, N
	beq $a0, 1, result
	li $a0, 1
	li $v0, 1	# print int
	syscall		# Sim 	
loop:	
	add $t0, $zero, 1
	add $t1, $zero, 1	
result:
	li $v0, 4	# print string
	la $a0, MSG2	# load address of MSG2
	syscall		# Simulate
	
		
	li $v0, 1	# print int
	lw $a0, N
	syscall		# Sim 	
	
	li $v0, 10
	syscall
     
.data
MSG1: .asciiz "Enter a value that will sum 1 to N: "
MSG2: .asciiz "The sum of 1 to N is "

# alignment
	.align 2

# variables
N: .space 4 
