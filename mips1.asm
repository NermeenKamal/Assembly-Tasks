.data 
.text 
     addi $s0,$0,0
     addi $s1,$s1,1
     loop:slti $t0,$s0,3
     beq $t0,$s0,end
     addi $s0, $s0,1
     addi $s1,$s1,1
     j loop
     end:
