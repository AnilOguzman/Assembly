##########################################
# The data segment -- data goes here
##########################################

.data
number1:	.word 300
number2:	.word 200

# Create some null terminated strings to use
message:	.asciiz "Hello world!\n"
plus:		.asciiz " + "
equal:		.asciiz " = "

##########################################
# The text segment -- instructions go here
##########################################
.text
	.globl main
main:
	##########################################
	# print the message 'Hello world!'
	##########################################
	li $v0, 4          # pseudoinstruction: syscall number 4 will print string whose address is in $a0
	la $a0, message    # pseudoinstruction: load address of the string
	syscall            # pseudoinstruction: actually print the string

	##########################################
	# Perform the following operation:
	# result = number1 + number2
	# and print the result as:
	# number1 + number2 = result
	##########################################
	lw $s0, number1
	lw $s1, number2

	# print number1
	li $v0, 1          # pseudoinstruction: syscall number 1 will print int in $a0
	move $a0, $s0      # pseudoinstruction: $s0 --> $a0
	syscall            # pseudoinstruction

	# print + sign
	li $v0, 4          # pseudoinstruction
	la $a0, plus       # pseudoinstruction
	syscall            # pseudoinstruction

	# print number2
	li $v0, 1          # pseudoinstruction
	move $a0, $s1      # pseudoinstruction: $s1 --> $a0
	syscall            # pseudoinstruction

	# print = sign
	li $v0, 4          # pseudoinstruction
	la $a0, equal      # pseudoinstruction
	syscall            # pseudoinstruction

	# print the result
	li $v0, 1          # pseudoinstruction
	add $a0, $s0, $s1
	syscall            # pseudoinstruction

	##########################################
	# exit
	##########################################
	li $v0, 10         # Syscall number 10 is to terminate the program
	syscall            # exit now
