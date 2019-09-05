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
      
	sw $v0, N	# N = $v0
	lw $a0, N
	beq $a0, 1, result
	li $t1, 1
loop:	
	lw $t0, C	# Counter itterate
	addi $t0, $t0, 1
	sw $t0, C
	
	add $t1, $t1, $t0
	sw $t1, A
	
	lw $a0, C
	li $v0, 1
	add $a0, $a0, $zero
	syscall
	
	lw $a0, N
	lw $a1, C
	addi $a0, $a0, -1
	blt $a0, $a1, result
	j loop

result:
	li $v0, 4	# print string
	la $a0, MSG2	# load address of MSG2
	syscall		# Simulate
	
	li $v0, 1	# print int
	lw $a0, N	# load address of N
	syscall		# Simulate
	
	li $v0, 4	# print string
	la $a0, MSG3	# load address of MSG3
	syscall		# Simulate
		
	li $v0, 1	# print int
	lw $a0, A	# put answer to a0
	syscall		# Sim 	
	
	li $v0, 10
	syscall
     
.data
MSG1: .asciiz "Enter a value for N: "
MSG2: .asciiz "\nThe sum of 1 to "
MSG3: .asciiz " is "

# alignment
	.align 2

# variables
N: .space 4
C: .word 1
A: .word 1

