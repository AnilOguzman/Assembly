.data
array:		.word 10, 19, 8, 17, 6, 15, 4, 13, 2, 11
n:		.word 10
i:		.word 0
v:		.asciiz ","

.text
.globl main

main:
    la $s0, array
    lw $s1, n
	lw $s2, i
	addi $t0, $s1, -1
	
LOOP:
	beq $s2, $t0, EXIT
	slt $t1, $s2, $t0
	beq $t1, $zero, EXIT
	sll $t2, $s2, 2
	add $s3, $s0, $t2
	lw $s4, 0($s3)
	lw $s5, 4($s3)
	slt $t3, $s5, $s4
	addi $a0, $s4, 0
	beq $t3, $zero, XXX
	sub $a0, $s4, $s5
	
	XXX:
    li $v0, 1  
    syscall
	li $v0, 11       
	li $a0, 44       
	syscall          
	addi $s2, $s2, 1
	j LOOP	

EXIT:
	lw, $s6, 36($s0)
	addi $a0, $s6,0
	li $v0, 1
	syscall
	li $v0, 10
	syscall