# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Author: Dajion Martin
# Assignment: Lab 1. Part 3
# Notes: Palindrome. (50 pts)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
	.data
MSG1:	.asciiz "Enter a character string: "
PASS: .asciiz "\nThis is a Palidrone\n"
FAIL: .asciiz "\nThis is not a Palidrone\n"
EROR: .asciiz "\nError!\n"
NEWL: .asciiz " "
NEWD: .asciiz "\n"

	.align 4

CHCK:	.space 100 
LAST:	 .byte '\n'
COUNT: .word 1
INDEX: .word 0
TEMP:	 .space 4

	.text
	.globl main

main:	
	li   $v0, 4			# Call: Print String
	la   $a0, MSG1		# load MSG1
	syscall				# Output
     
	la   $a0, CHCK		# String Buffer
	li   $a1, 20		# String Length
	li   $v0, 8			# Call: Read String
	syscall				# Input 
LEN:
	la   $t0, CHCK		# Load address of input
	lw   $t1, INDEX		# Load Index
	add  $t2, $t0, $t1 	# Address of Index
    
	lb  $a0, 0($t2)		# Char at Index
	li   $v0, 11
	lb  $t4, LAST		# Load \n
	beq $a0, $t4, VAL		# Check for end of string
	
	addi $t1, $t1, 1		# Add to Index
	sw   $t1, INDEX		# Update Index
	j    LEN
	 
VAL:
	lw  $a0, INDEX
	li   $v0, 1
	sw   $t1, COUNT
	addi $t1, $t1, -1		# Add to Index
	andi $a0, $t1, 0X01
	li   $v0, 1
	sw   $zero, INDEX
	bgtz  $a0, EVEN
	beq  $a0, $zero, ODD
	j END
ODD:					
	lw  $a0, COUNT
	addi $a0, $a0, -1
	li   $v0, 1
	li  $t0, 2
	div $a0, $t0
	mflo $a0
	sw  $a0, TEMP	
	li   $v0, 1
	lw  $a0, COUNT
	addi $a0, $a0, -1
	sw   $a0, COUNT
	li   $v0, 1
	j   LOOK

EVEN:
	lw   $a0, COUNT
	li   $v0, 1
	#syscall
	li  $t0, 2
	div $a0, $t0
	mflo $a0
	sw   $a0, TEMP	
	li   $v0, 1
	lw  $t0, COUNT
	addi $t0, $t0, -1
	sw   $t0, COUNT
	lw   $a0, COUNT
	li   $v0, 1

LOOK: 
	la   $t0, CHCK 
	lw   $t5, TEMP
	lw   $t2, INDEX
	beqz $t5, YUP 
	
	add  $t4, $t0, $t2
	lb   $a1, 0($t4)
	lw   $t2, INDEX
	
	add  $t3, $t0, $t1
	lw   $t1, COUNT
	lb   $a0, 0($t3)

	addi $t1, $t1, -1
	addi $t2, $t2, 1
	addi $t5, $t5, -1
	sw   $t5, TEMP
	sw   $t1, COUNT
	sw   $t2, INDEX
	beq  $a0, $a1, LOOK
	bne  $a0, $a1, NOPE

NOPE:
	li   $v0, 4			# Call: Print String
	la   $a0, FAIL		# load MSG1
	syscall				# Output
	j   END
YUP:	
	li   $v0, 4			# Call: Print String
	la   $a0, PASS		# load MSG1
	syscall				# Output
	 
END:	
	li   $v0, 10		# Call: Exit
	syscall			# Exit

