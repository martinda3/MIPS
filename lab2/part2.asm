	.data
MSG1:	.asciiz "Enter a num to find fac"
MSG2: .asciiz "\nAsnwer is "

	.align 4

NUMBR: .space 4
INDEX: .word 0
TEMP:	 .space 4

	.text
	.globl main

main:	
	li   $v0, 4			# Call: Print String
	la   $a0, MSG1		# load MSG1
	syscall				# Output
     
	li   $v0, 5			# Call: Read String
	syscall				# Input 
	add $a0, $zero, $v0
	li   $a1, 0
	jal RUN
	add $zero, $zero, $zero
	
	add  $a0, $zero, $v0
	li   $v0, 1			# Call: Print String
	syscall				# Output
	li   $v0, 10		# Call: Exit
	syscall			# Exit


RUN:
	li   $t3, 1
LEN:
	beqz $a0, CLEAN
	add  $t2, $zero, $a0 
	mul  $t3, $t3, $t2
	addi $a0, $a0, -1		# Add to Index
	addi $a1, $a1, 1		# Add to Index
	add  $v0, $zero, $t3
	j    LEN	 
CLEAN:
	add  $v0, $zero, $t3
	jr $ra


