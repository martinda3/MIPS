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

ARRY1:	.word 10, -1, -2, -3, -4, -5, -6, -7, -8, -9
ARRY2:	.word 10, -2, -4, -6, -8
ARRY3:	.word 17, 16, 15, 14, 13, 12, 11, 10, -9, -8, -7, -6, -5, -4, 33, 42, 71, 11

COUT1:	.word 10
COUT2:	.word 5
COUT3:	.word 17
INDEX:	.word 1
TEMP:	.space 4

	.text
	.globl main

main:				# Code for FOR 1-3 & REV 1-3 same 
	li   $v0, 4		# Call: Print String
	la   $a0, MSG1		# load MSG1
	syscall			# Output
     
FOR1:
	lw   $t0, INDEX		# INDEX = position in array
	lw   $t1, COUT1		# COUNT = Number of Values on array
	addi $t2, $t0, -1	# Itterating Index
	sll  $t2, $t2, 2	# Mulitpying Index by 4 = address of Index
	sw   $t2, TEMP		# Storing address of index
	la   $t3, ARRY1		# Base address of array
	add  $t4, $t3, $t2	# Adding Base address and address of index
	lw   $a0, 0($t4)	# Loading value at address of index
	li   $v0, 1		# Call: Print Integer
	syscall			# Output
	li   $v0, 4		# Call: Print String
	la   $a0, SPACE		# Formatting
	syscall			# Output
	addi $t0, $t0, 1	# Advance to next position in array
	sw   $t0, INDEX		# Store new position
	bge  $t1, $t0, FOR1	# Check for all values in array

	li   $t0, 0		# Reset position
	sw   $t0, INDEX		# Store new position
	
	li   $v0, 4		# Call: Print String
	la   $a0, MSG2		# load MSG2
	syscall			# Output

REV1:
	lw   $t1, COUT1
	addi $t2, $t1, -1
	sll  $t2, $t2, 2
	sw   $t2, TEMP
	la   $t3, ARRY1
	add  $t4, $t3, $t2
	lw   $a0, 0($t4)
	li   $v0, 1
	syscall
	li   $v0, 4
	la   $a0, SPACE
	syscall
	addi $t1, $t1, -1
	sw   $t1, COUT1	
	bgt  $t1, $t0, REV1
	
	li   $v0, 4		# Call: Print String
	la   $a0, MSG3		# load MSG1
	syscall			# Output
    
	li   $t0, 1
	sw   $t0, INDEX
 
FOR2:
	lw   $t0, INDEX
	lw   $t1, COUT2
	addi $t2, $t0, -1
	sll  $t2, $t2, 2
	sw   $t2, TEMP
	la   $t3, ARRY2
	add  $t4, $t3, $t2
	lw   $a0, 0($t4)
	li   $v0, 1
	syscall
	li   $v0, 4
	la   $a0, SPACE
	syscall
	addi $t0, $t0, 1
	sw   $t0, INDEX
	bge  $t1, $t0, FOR2

	li   $t0, 1
	sw   $t0, INDEX

	li   $v0, 4		# Call: Print String
	la   $a0, MSG4		# load MSG1
	syscall			# Output


	li   $t0, 0
	sw   $t0, INDEX

REV2:
	lw   $t1, COUT2
	addi $t2, $t1, -1
	sll  $t2, $t2, 2
	sw   $t2, TEMP
	la   $t3, ARRY2
	add  $t4, $t3, $t2
	lw   $a0, 0($t4)
	li   $v0, 1
	syscall
	li   $v0, 4
	la   $a0, SPACE
	syscall
	addi $t1, $t1, -1
	sw   $t1, COUT2	
	bne  $t1, $t0, REV2

	li   $t0, 1
	sw   $t0, INDEX

	li   $v0, 4		# Call: Print String
	la   $a0, MSG5		# load MSG1
	syscall			# Output

FOR3:
	lw   $t0, INDEX
	lw   $t1, COUT3
	addi $t2, $t0, -1
	sll  $t2, $t2, 2
	sw   $t2, TEMP
	la   $t3, ARRY3
	add  $t4, $t3, $t2
	lw   $a0, 0($t4)
	li   $v0, 1
	syscall
	li   $v0, 4
	la   $a0, SPACE
	syscall
	addi $t0, $t0, 1
	sw   $t0, INDEX	
	bge  $t1, $t0, FOR3

	li   $t0, 0
	sw   $t0, INDEX
	
	li   $v0, 4		# Call: Print String
	la   $a0, MSG6		# load MSG1
	syscall			# Output

REV3:
	lw   $t1, COUT3
	addi $t2, $t1, -1
	sll  $t2, $t2, 2
	sw   $t2, TEMP
	la   $t3, ARRY3
	add  $t4, $t3, $t2
	lw   $a0, 0($t4)
	li   $v0, 1
	syscall
	li   $v0, 4
	la   $a0, SPACE
	syscall
	addi $t1, $t1, -1
	sw   $t1, COUT3	
	bgt  $t1, $t0, REV3
	
	li   $v0, 4		# Call: Print String
	la   $a0, MSG7		# load MSG1
	syscall			# Output
END:	
	li   $v0, 10		# Call: Exit
	syscall			# Exit

