# for (i = 0; i < n; i++)
#	x += y;

.data
    x:  .word 1
    y:  .word 2
    n:  .word 5
    i:  .word 0
    
.text
    .globl main
main:
    lw $s0, i
    lw $s1, n
    lw $s2, x
    lw $s3, y
loop:
	slt $t0, $s0, $s1
	bne $t0, 1, exit
	add $s2, $s2, $s3
	addi $s0,$s0,1
	j loop
exit:
	add $a0, $zero, $s2
    li $v0, 1 
    syscall
    li $v0, 10
    syscall