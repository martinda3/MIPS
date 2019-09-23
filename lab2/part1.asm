# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Author: Dajion Martin
# Assignment: Lab 1. Part 3
# Notes: Palindrome. (50 pts)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
	.data
MSG1: 	.asciiz "Enter a character string: "
PASS: 	.asciiz "The string is a palindrome.\n"
Fail: 	.asciiz "The string is not a palindrome.\n"
EROR: 	.asciiz "Error!\n"
NEWL: 	.asciiz " "
NEWD: 	.asciiz "\n"
CHCK:	.asciiz

	.align 2


SIZE1:	.word 100
COUNT:	.word 4
INDEX:	.word 0
TEMP:	.space 4

	.text
	.globl main

main:					# 
	li   $v0, 4			# Call: Print String
	la   $a0, MSG1		# load MSG1
	syscall				# Output
     
	la   $a0, CHCK		# String Buffer
	lw   $a1, SIZE1		# String Length
	li   $v0, 8			# Call: Read String
	syscall				# Input 
	
	li   $v0, 4			# Call: Print String
	la   $a0, CHCK		# load MSG1
	syscall				# Output
	sw   $a0, CHCK
	
LEN:
	la   $t0, CHCK		# load base
	lw   $t1, INDEX
	sll  $t4, $t1, 2	# mul index X 4
	add  $t2, $t0, $t4 	# add base and index
	#lw   $t3, 0($t2)	# load value at index

	
	li   $v0, 11		# Call: Print String
	lw   $a0, 0($t2)	# Print char
	syscall
	
	li   $v0, 4			# Call: Print String
	la   $a0, NEWL		# load MSG1
	syscall				# Output
	
	li   $v0, 1			# Call: Print String
	la   $a0, 0($t1)		# load MSG1
	syscall
	
	li   $v0, 4			# Call: Print String
	la   $a0, NEWD		# load MSG1
	syscall
	
	addi $t1, $t1, 1
	sw   $t1, INDEX
	lw   $t0, SIZE1
	bgt  $t3, $t0, VAL		# Jump if string is over
	j    LEN
	# else Count + 1
	 
VAL:
	lw   $a0, INDEX		# Counter
	li   $v0, 1			# Call: Print Integer
	syscall				# Output
	 
#FOR1:
#	lw   $t0, INDEX		# INDEX = position in array
#	lw   $t1, COUT1		# COUNT = Number of Values on array
#	addi $t2, $t0, -1	# Itterating Index
#	sll  $t2, $t2, 2	# Mulitpying Index by 4 = address of Index
#	sw   $t2, TEMP		# Storing address of index
#	la   $t3, ARRY1		# Base address of array
#	add  $t4, $t3, $t2	# Adding Base address and address of index
#	lw   $a0, 0($t4)	# Loading value at address of index
#	li   $v0, 1			# Call: Print Integer
#	syscall				# Output
#	li   $v0, 4			# Call: Print String
#	la   $a0, SPACE		# Formatting
#	syscall				# Output
#	addi $t0, $t0, 1	# Advance to next position in array
#	sw   $t0, INDEX		# Store new position
#	bge  $t1, $t0, FOR1	# Check for all values in array
#
#	li   $t0, 0			# Reset position
#	sw   $t0, INDEX		# Store new position
#	
#	li   $v0, 4			# Call: Print String
#	la   $a0, MSG2		# load MSG2
#	syscall				# Output
#
#REV1:
#	lw   $t1, COUT1
#	addi $t2, $t1, -1
#	sll  $t2, $t2, 2
#	sw   $t2, TEMP
#	la   $t3, ARRY1
#	add  $t4, $t3, $t2
#	lw   $a0, 0($t4)
#	li   $v0, 1
#	syscall
#	li   $v0, 4
#	la   $a0, SPACE
#	syscall
#	addi $t1, $t1, -1
#	sw   $t1, COUT1	
#	bgt  $t1, $t0, REV1
#	
#	li   $v0, 4		# Call: Print String
#	la   $a0, MSG3		# load MSG1
#	syscall			# Output
#    
#	li   $t0, 1
#	sw   $t0, INDEX
# 
#FOR2:
#	lw   $t0, INDEX
#	lw   $t1, COUT2
#	addi $t2, $t0, -1
#	sll  $t2, $t2, 2
#	sw   $t2, TEMP
#	la   $t3, ARRY2
#	add  $t4, $t3, $t2
#	lw   $a0, 0($t4)
#	li   $v0, 1
#	syscall
#	li   $v0, 4
#	la   $a0, SPACE
#	syscall
#	addi $t0, $t0, 1
#	sw   $t0, INDEX
#	bge  $t1, $t0, FOR2
#
#	li   $t0, 1
#	sw   $t0, INDEX
#
#	li   $v0, 4		# Call: Print String
#	la   $a0, MSG4		# load MSG1
#	syscall			# Output
#
#
#	li   $t0, 0
#	sw   $t0, INDEX
#
#REV2:
#	lw   $t1, COUT2
#	addi $t2, $t1, -1
#	sll  $t2, $t2, 2
#	sw   $t2, TEMP
#	la   $t3, ARRY2
#	add  $t4, $t3, $t2
#	lw   $a0, 0($t4)
#	li   $v0, 1
#	syscall
#	li   $v0, 4
#	la   $a0, SPACE
#	syscall
#	addi $t1, $t1, -1
#	sw   $t1, COUT2	
#	bne  $t1, $t0, REV2
#
#	li   $t0, 1
#	sw   $t0, INDEX
#
#	li   $v0, 4		# Call: Print String
#	la   $a0, MSG5		# load MSG1
#	syscall			# Output
#
#FOR3:
#	lw   $t0, INDEX
#	lw   $t1, COUT3
#	addi $t2, $t0, -1
#	sll  $t2, $t2, 2
#	sw   $t2, TEMP
#	la   $t3, ARRY3
#	add  $t4, $t3, $t2
#	lw   $a0, 0($t4)
#	li   $v0, 1
#	syscall
#	li   $v0, 4
#	la   $a0, SPACE
#	syscall
#	addi $t0, $t0, 1
#	sw   $t0, INDEX	
#	bge  $t1, $t0, FOR3
#
#	li   $t0, 0
#	sw   $t0, INDEX
#	
#	li   $v0, 4		# Call: Print String
#	la   $a0, MSG6		# load MSG1
#	syscall			# Output
#
#REV3:
#	lw   $t1, COUT3
#	addi $t2, $t1, -1
#	sll  $t2, $t2, 2
#	sw   $t2, TEMP
#	la   $t3, ARRY3
#	add  $t4, $t3, $t2
#	lw   $a0, 0($t4)
#	li   $v0, 1
#	syscall
#	li   $v0, 4
#	la   $a0, SPACE
#	syscall
#	addi $t1, $t1, -1
#	sw   $t1, COUT3	
#	bgt  $t1, $t0, REV3
#	
#	li   $v0, 4		# Call: Print String
#	la   $a0, MSG7		# load MSG1
#	syscall			# Output
END:	
	li   $v0, 10		# Call: Exit
	syscall			# Exit

