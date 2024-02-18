##################################################
#              
# if (a[i] < a[i+1])
#      a[i] = a[i-1];
# printf("%d", a[i])
##################################################

.data
array:		.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
index:		.word 4

.text
	.globl main
main:
	la $s0, array
    lw $s1, index
    
	sll $s2,$s1,2
	add $s2,$s2,$s0
	lw $t0,0($s2)
	lw $t1,4($s2)
	slt $t2,$t0,$t1
	beq $t2,$zero,EXIT 
	lw $t3,-4($s2)
	sw $t3,0($s2)
	
EXIT:
	li $v0, 1           # syscall number 1 will print int in $a0
	move $a0,$t0
	syscall

	li $v0, 10         # Syscall number 10 is to terminate the program
	syscall            # exit now