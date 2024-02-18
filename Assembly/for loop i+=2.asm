#for(i=0;i<n;i+=2) x-=y;
#printf("%d",x)

.data
n: .word 5 
x: .word 110
y: .word 10 

.text
.globl main

main:
	lw $s0,n
	lw $s1,x
	lw $s2,y
	sub $t0,$t0,$t0
	
LOOP:
	beq $t0,$s0,EXIT
	add $t1,$zero,$s0
	addi $t1,1
	beq $t1,$t0,EXIT
	sub $s1,$s1,$s2
	addi $t0,2
	j LOOP
EXIT:
	li $v0,1
	move $a0,$s1
	syscall
	li $v0,10
	syscall
	