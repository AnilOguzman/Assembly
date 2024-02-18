# if (a[i] > 10)
#	i = i + 1;

.data
a:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
i:  .word 10
num:    .word 10

.text
.globl main

main:
    la $s6, a
    lw $s5, i
    lw $s1, num
	sll $t0,$s5,2   
    add $s2,$t0,$s6
    lw $t1,0($s2)
	beq $t1, $s1, exit
exit:
	addi $s5, $s5, 1
	add $a0, $zero, $s5
    li $v0, 1 
    syscall
    li $v0, 10
    syscall
	