###########################################################
# This program will ask for two integers and then it
# adds and subtracts them.
# It demonstrates how to use arithmetic operations, and
# how to load and store values.
###########################################################
.text
.globl main
main: 
	li $v0,4 # system call to print MSG1
	la $a0, MSG1
	syscall
	li $v0,5 # system call to get integer1
	syscall
	la $t5, INPUT1
	sw $v0, 0($t5) # store integer in t5
	li $v0,4 # system call to print MSG2
	la $a0, MSG2
	syscall
	li $v0,5 # system call to get integer2
	syscall
	la $t6, INPUT2
	sw $v0, 0($t6) # store integer2 in $t6
	lw $t0, 0($t5) # load values in $t0 and $t1
	lw $t1, 0($t6)
	li $v0,4 # system call to print SUM
	la $a0, SUM
	syscall
	add $t3, $t0, $t1 # add $t0 and $t1
	li $v0,1 # system call to print result
	move $a0, $t3 # copy value to $a0
	syscall
	li $v0,4 # system call to print SUB
	la $a0, SUB
	syscall
	sub $t4, $t0, $t1 # subtract $t1 from $t0
	li $v0,1 # system call to print result
	move $a0, $t4 # copy value to $a0
	syscall
	li $v0,10 # system call 10; exit
	syscall
.data
MSG1: .asciiz "Enter the 1st number => This is a git test "
MSG2: .asciiz "Enter the 2nd number => "
SUM: .asciiz "Integer1 + Integer2 = "
SUB: .asciiz "Integer1 - Integer2 = "
# a word boundary alignment
	.align 2
# reserve a word space
INPUT1: .space 4
INPUT2: .space 4
