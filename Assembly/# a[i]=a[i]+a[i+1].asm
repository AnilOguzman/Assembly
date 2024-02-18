# a[i]=a[i]+a[i+1];

.data
a:		.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
i:		.word 3

.text 
	.globl main

main:
	la $s0,a
	lw $s1,i
	
	sll $t0,$s1,2
	add $s2,$s0,$t0
	lw $a0,0($s2)       # a[i]
	
	add $s1,$s1,1
	sll $t0,$s1,2
	add $s2,$s0,$t0
	lw $a1,0($s2)    $a[i+1]
	
	add $a0,$a0,$a1  # a[i]=a[i]+a[i+1]
	
	li $v0,1
	syscall
	li $v0,10
	syscall	
	