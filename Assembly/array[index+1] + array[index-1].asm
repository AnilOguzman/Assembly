.data
array:   .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
index:   .word 3

.text
.globl main
main:
    la $s0, array       # load address of array into $s0
    lw $s1, index       # load value stored at index into $s1

    sll $t0, $s1, 2     # $t0 = index * 4
    add $s2, $s0, $t0   # $s2 = &array[index]
    lw $t1, 4($s2)      # $t1 = array[index+1]
    lw $t2, -4($s2)     # $t2 = array[index-1]
    add $a0, $t1, $t2   # $a0 = array[index+1] + array[index-1]
    sw $a0, 0($s2)      # array[index] = array[index+1] + array[index-1]

    li $v0, 10          # Syscall number 10 is to terminate the program
    syscall             # exit now
