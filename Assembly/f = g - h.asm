# f = g - h

.data
f:	.word 0
g:	.word 1
h:	.word 2
.text
.globl main
main:
lw $s2, f
lw $s3, g
lw $s4, h
sub $s2, $s3, $s4
sw $s2, f($zero)
lw $a0, f($zero)

li $v0, 1
syscall
li $v0, 10
syscall