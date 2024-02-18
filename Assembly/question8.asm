#n=5; x=110; y=10;
#for (i=0;i<n;i+=2) x-=y
#printf("%d",x)
.data
n:		.word 5
x:		.word 110
y:		.word 10
.text
	.globl main
main:
	lw $s1, n
	lw $s2, x
	lw $s3, y
	sub $t1, $t1, $t1 #t1=0 counter for the for loop
LOOP:
	beq $t1, $s1, EXIT #if (i==n) exit the for loop
	slt $t2, $t1, $s1
	beq $t2, $zero, EXIT
	sub $s2, $s2, $s3 #x=x-y
	addi $t1, $t1, 2 #t1+=2
	j LOOP
EXIT:
	add $a0, $zero, $s2
	li $v0, 1
	syscall
	li $v0, 10
	
	