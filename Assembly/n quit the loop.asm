# while (a[i] < n) / *a[i] == n quit the loop * /
#  i++;
# printf("%d", i)
.data
array:     .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
index:     .word 3
n:         .word 7
.text
     .globl main
main:
    la $s0, array # BASE of the array
    lw $s1, index # index of the array
    lw $s2, n     # loading n
LOOP:
    sll $t0, $s1, 2 # OFFSET= i * 4
    add $t1, $s0, $t0 # BASE + OFFSET
    lw $t2, 0($t1) # a[i] 
    beq $t2, $s2, OUT
	addi $s1,$s1,1 # i+=1 
	j LOOP
OUT:
	addi $a0, $s1, 0
    li $v0, 1 
    syscall
    li $v0, 10
    syscall