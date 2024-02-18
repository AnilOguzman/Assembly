.data
a: .word 10, 19, 8, 17, 6, 15, 4, 13, 2, 11
n: .word 10
i: .word 0
msg: .asciiz "%d, "

.text
main:
  la $t0, n      # load address of n into $t0
  lw $t1, ($t0)  # load n into $t1
  la $t2, i      # load address of i into $t2
  lw $t3, ($t2)  # load i into $t3

  loop1:
    addi $t4, $t3, 1     # $t4 = i+1
    blt $t4, $t1, else1   # if i+1 < n, jump to else1
    j done1               # otherwise, jump to done1
    else1:
      la $t5, a           # load address of a into $t5
      sll $t6, $t3, 2     # $t6 = i * 4 (since each element is 4 bytes)
      add $t7, $t5, $t6   # $t7 = address of a[i]
      lw $t8, ($t7)       # load a[i] into $t8
      add $t9, $t5, $t4   # $t9 = address of a[i+1]
      lw $t10, ($t9)      # load a[i+1] into $t10
      ble $t10, $t8, else2  # if a[i+1] <= a[i], jump to else2
      j end_if2             # otherwise, jump to end_if2
      else2:
        sub $t8, $t8, $t10  # a[i] = a[i] - a[i+1]
        sw $t8, ($t7)       # store the updated value of a[i]
        end_if2:
          addi $t3, $t3, 1  # i = i + 1
          j loop1           # jump to loop1
  done1:

  la $t2, i      # load address of i into $t2
  lw $t3, ($t2)  # load i into $t3
  li $v0, 4      # set $v0 to 4 (syscall code for print string)
  la $a0, msg    # load address of msg into $a0
  loop2:
    la $t5, a           # load address of a into $t5
    sll $t6, $t3, 2     # $t6 = i * 4 (since each element is 4 bytes)
    add $t7, $t5, $t6   # $t7 = address of a[i]
    lw $a1, ($t7)       # load a[i] into $a1
    move $a0, $a1       # move the value of a[i] into $a0 for printing
    syscall             # print a[i]
    addi $t3, $t3, 1
    blt $t3, $t1, loop2  # if i < n, jump to loop2
   
