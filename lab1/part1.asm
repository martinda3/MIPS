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
	li $v0, 4
	la $a0, MSG1
	syscall
      
	li $v0, 4
	la $a0, MSG2
	syscall
      
	li $v0, 5
	syscall
      
	la $t6, N
	sw $v0, 0($t6)
	
	li $v0, 10
	syscall
     
.data
MSG1: .asciiz "The sum from 1 - N \n"
MSG2: .asciiz "Enter a value for N: "

# alignment
	.align 2

# variables
N: .space 4 