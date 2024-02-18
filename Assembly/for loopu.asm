#for(i=0;i<n;i++) x+=y;
#printf("%d",x)

.data
n: .word 2 
x: .word 10
y: .word 20 

.text
.globl main

main:
	lw $s0,n
	lw $s1,x
	lw $s2,y
	sub $t0,$t0,$t0
	
LOOP:
	beq $t0,$s0,EXIT
	add $s1,$s1,$s2
	addi $t0,1
	j LOOP
EXIT:
	li $v0,1
	move $a0,$s1
	syscall
	li $v0,10
	syscall
	