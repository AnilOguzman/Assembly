# if (a[i] < a[i+1])
#	a[i] = a[i-1];

.data
a: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
i: .word 7
.text
main:
    la $s6, a
    lw $s5, i
    sll $s5, $s5, 2
    add $t2, $s6, $s5
    lw $t3, ($t2)
    addi $t4, $t2, 4
    lw $t5, ($t4)
    slt $t6, $t3, $t5
    beqz $t6, else
    sub $t7, $t2, 4
    lw $t8, ($t7)
    lw ($t2),$t8 
else:
    li $v0, 1
    lw $a0, ($t2)
    syscall
    li $v0, 10
    syscall
