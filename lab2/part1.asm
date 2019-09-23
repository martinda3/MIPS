# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Author: Dajion Martin
# Assignment: Lab 1. Part 3
# Notes: Palindrome. (50 pts)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
	.data
MSG1: 	.asciiz "Enter a character string: "
PASS: 	.asciiz "\nThe string is a palindrome.\n"
FAIL: 	.asciiz "\nThe string is not a palindrome.\n"
EROR: 	.asciiz "\nError!\n"
NEWL: 	.asciiz " "
NEWD: 	.asciiz "\n"
CHCK:	.asciiz " "

	.align 4

LAST:	.byte '\n'
SIZE1:	.word 100
COUNT:	.word 4
INDEX:	.word 0
TEMP:	.space 4

	.text
	.globl main

main:			
	li   $v0, 4			# Call: Print String
	la   $a0, MSG1		# load MSG1
	syscall				# Output
     
	la   $a0, CHCK		# String Buffer
	lw   $a1, SIZE1		# String Length
	li   $v0, 8			# Call: Read String
	syscall				# Input 
	
LEN:
	la   $t0, CHCK		# Load address of input
	lb   $t1, INDEX		# Load Index
	add  $t2, $t0, $t1 	# Address of Index
## Remove	
	li   $v0, 11		# Call: Print Char
	lb   $a0, 0($t2)	# Char at Index
	syscall		

    li   $v0, 4			# Call: Print String
	la   $a0, NEWL		# Print a " "
	syscall			
	
	li   $v0, 1			# Call: Print Integer
	la   $a0, 0($t1)	# Address in Index
	syscall
	
	li   $v0, 4			# Call: Print String
	la   $a0, NEWD		# Show new line
	syscall
## Remove
    
	lb  $a0, 0($t2)	# Char at Index
	lb  $t4, LAST		# Load \n
    beq $a0, $t4, VAL	# Check for end of string
	
	addi $t1, $t1, 1	# Add to Index
	sw   $t1, INDEX		# Update Index
	
	j    LEN
	 
VAL:
	addi $t1, $t1, -1	# Add to Index
    sw   $t1, COUNT
	sw   $t1, TEMP
	li   $t1, 0
	sw   $t1, INDEX
	lw   $a0, COUNT		# Counter
	li   $v0, 1			# Call: Print Integer
	syscall				# Output

LOOK:
	lw   $t1, COUNT
	lw   $t2, INDEX
	add  $t3, $t0, $t1
	add  $t4, $t0, $t2
	
#	lb   $a0, 0($t4) 
#	li   $v0, 11		# Call: Print Char
#	syscall		
#	lb   $a0, 0($t3)
#	li   $v0, 11		# Call: Print Char
#	syscall		

	lb   $a1, 0($t3)
	beq  $a0, $a1, STEP1
	# add and dec
	bne  $a0, $a1, NOPE
STEP1:



NOPE:
	li   $v0, 4			# Call: Print String
	la   $a0, FAIL		# load MSG1
	syscall				# Output
	
	 
END:	
	li   $v0, 10		# Call: Exit
	syscall			# Exit

