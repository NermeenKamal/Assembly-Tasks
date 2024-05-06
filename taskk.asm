#Nermeen Kamal 42110428

# Assuming NUM1 is stored in $s3 and the factorial result stored in $s1

slti $t0, $s3, 0      # Set $t0 to 1 if $s3 is less than 0, else set to 0
bne $t0, $zero, exit  # If $s3 <= 0, exit the loop

addi $t1, $s3, 0      # Copy $s3 to $t1 (loop counter)
addi $s1, $zero, 1    # Initialize $s1 (result) to 1

loop:
    beq $t1, $zero, exit   # If loop counter ($t1) is 0, exit the loop

    mul $s1, $s1, $t1      # Multiply $s1 by the loop counter
    addi $t1, $t1, -1       # Decrement the loop counter
    j loop

exit:
    li $v0, 10          
    syscall

    li $v0, 1            # print integer
    move $a0, $s1        # load $s1 into $a0
    syscall
