# Alden Quimby
# adq2101
# Problem 2, part a

# Basic idea here is that with dense cases
# the compiler will create a jump table instead
# of a bunch of if/else statements.

# I *think* this is proper MIPS syntax. If not,
# it is a close-to-MIPS pseudo-code

# ASSUMPTION: $t1 is a, $t2 is x, $t3 is y, $t4 is z

problem_2a:
       la $t0, case1            # create the jump table
       sw $t0, 4($s1)           # note that cases 2 and 5
       la $t0, default          # go to default
       sw $t0, 8($s1) 
       la $t0, case3  
       sw $t0, 12($s1)
       la $t0, case4  
       sw $t0, 16($s1)
       la $t0, default
       sw $t0, 20($s1)
       la $t0, case6  
       sw $t0, 24($s1)
       la $t0, case7  
       sw $t0, 28($s1)
switch:
       blt $t0, 1, default      # default if a < 1
       bgt $t0, 7, default      # default if a > 7
       mul $t0, $t1, 4          # t0 = 4*a
       addi $t0, $s1, $t0       # t0 = $s1 + 4*a
       lw $t0, 0($t0)           # t0 = address of case
       j $t0                    # go to case
case1:
       li $t4, 3                # z = 3
       j done
case3:
       li $t2, 1                # x = 1
       j done
case4:
       li $t2, 7                # x = 7
       j done
case6:
       li $t2, 5                # x = 5
       li $t3, 5                # y = 5
       j done
case7:
       li $t2, 4                # x = 4
       li $t3, 4                # y = 4
       j done
default:
       li $t4, 4                # z = 4
done:
