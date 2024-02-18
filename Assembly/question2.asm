##################################################
#              
# Write an assembly program to find 'num' in an
# array of integers. If found print the 'success'
# message else print the 'failed' message.
##################################################

.data
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
num:   .word 5
n:     .word 10
success_msg: .asciiz "Yeppi - I passed, my student number is in the passing list!\n"
fail_msg:    .asciiz "Oops - I failed, the number is not in the passing list!\n"

.text
		.globl main
main:
    lw $t0, n
	la $t1, array
	lw $t2, num
    
	add $t3,$zero,$zero
LOOP:
	beq $t3,$t0,FAIL
	lw $t4, 0($t1)
	beq $t2, $t4, CORRECT      #t2=t4 go to CORRECT
    addi $t1, $t1, 4
    addi $t3, $t3, 1
	j LOOP
CORRECT:
    li $v0, 4
    la $a0, success_msg
    syscall
    li $v0, 10
    syscall
FAIL:
    li $v0, 4
    la $a0, fail_msg
    syscall
    li $v0, 10
    syscall	
	