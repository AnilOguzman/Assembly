# while (array[i] < n)
#	i++;

.data
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
n: .word 4
i: .word 0

.text
main:
    la $s0, array
    lw $s1, n
    lw $s2, i
loop:
	sll $t0,$s2,2   
    add $s2,$t0,$s0
    lw $t1,0($s2)
	slt $t2,$t1,$s1
	bne $t2, 1,exit
	addi $s2, $s2,1
	j loop
exit:
	add $a0, $zero, $s5
    li $v0, 1 
    syscall
    li $v0, 10
    syscall