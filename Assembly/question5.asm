# if (i < x) i = x;
# else i = y;

.data
    x: .word 1
    y: .word 2
    i: .word 3

.text
main:
    lw $t0, x
    lw $t1, i
    slt $t2, $t0, $t1
    beqz $t2, else
    sw $t0, i
    j exit
else:
    lw $t0, y
    sw $t0, i
exit:
    li $v0, 1
    lw $a0, i
    syscall
    li $v0, 10
    syscall