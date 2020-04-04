main:
    addi $a0, $zero, 10 # n = 10
    jal fib          # call fib(10)
    j exit

fib:
    addi $sp, $sp, -4
    sw $ra, 0x0($sp)    # Save $ra register into stack

    #--------------------------------------#
       addi $sp,$sp,-4
       sw $a0,0($sp)
       
       addi $t1,$a0,-1   #n > 1 => n-1 > 0
       slt $t2,$zero,$t1 
       beq $t2,1,B1
       
       add $v0,$v0,$a0
       
       lw $ra,4($sp)
       addi $sp,$sp,8
       jr $ra
   B1:
       addi $a0,$a0,-1 
       jal fib
       
       lw $a0,0($sp)
       addi $sp,$sp,4
       
       addi $a0,$a0,-2 
       jal fib
    #--------------------------------------#

    lw $ra, 0x0($sp)    # Load $ra register from stack
    addi $sp, $sp, 4
    jr $ra

exit:

