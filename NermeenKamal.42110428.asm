.data
array:  .word -2, 5, -7, 0, 3   # Array of 5 integers

.text
    addi $t0, $zero, 0    # $t0 stores count of negative numbers
    la $t1, array         # base address of the array -> $t1
    addi $t2, $zero, 5    # the size of the array -> loop counter

    loop:
        lw $s0, 0($t1)   # first element of the array -> $s0

        # Check if the current element is negative
        slt $t3, $s0, $zero  # $t3 = 1 if $s0 < 0 or $s0 = 0 
        beq $t3, $zero, next_iteration  # If $t3 is zero, jump to next_iteration

        addi $t0, $t0, 1    # If negative, increment the count

    next_iteration:
        addi $t1, $t1, 4   # Move to the next element in the array
        addi $t2, $t2, -1  # Decrement the loop counter
        j loop             # Jump to the beginning of the loop

    # Display the count of negative numbers
    add $a0, $zero, $t0  # Load $t0 into $a0
    li $v0, 1            # for print integer
    syscall

    # End program
    li $v0, 10           # for exit
    syscall
