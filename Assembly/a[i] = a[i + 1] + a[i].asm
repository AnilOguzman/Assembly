# a[i] = a[i + 1] + a[i]

.data
a:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
i:  .word 2
.text
    .globl main
main:
    la $s6, a
    lw $s5, i
	sll $t0,$s5,2   
    add $s2,$t0,$s6
    lw $t1,0($s2)
    lw $t3,4($s2)
	add $t4,$t1,$t3	
	add $a0, $zero, $t4

	li $v0,1 
	syscall
	li $v0, 10 
	syscall