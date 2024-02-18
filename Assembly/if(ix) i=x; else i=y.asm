# if(i<x) i=x; else i=y;

.data
i:		.word 9
x:		.word 8
y:		.word 20

.text 
	.globl main

main:
	lw $s0,i
	lw $s1,x
	lw $s2,y

	slt $t1,$s0,$s1
	beq $t1,$zero,AA
	add $s0,$zero,$s1
	j EXIT
AA:
	add $s0,$zero,$s2
EXIT:
	li $v0,1
	move $a0,$s0
	syscall
	li $v0,10
	syscall