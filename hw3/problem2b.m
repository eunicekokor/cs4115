# Alden Quimby
# adq2101
# Problem 2, part b

# Basic idea here is that with sparse cases
# the compiler will create a bunch of if/else statements.

# I *think* this is proper MIPS syntax. If not,
# it is a close-to-MIPS pseudo-code

# ASSUMPTION: $t1 is a, $t2 is x, $t3 is y, $t4 is z

problem_2b:
	bne $t1, 2, else1      # b != 2?
	li $t0, 42             # a = 42
	j done
else1:
	bne $t1, 20, else2     # b != 20?
	li $t0, 2              # a = 2
	j done
else2:
	bne $t1, 110, else3    # b != 110?
	li $t2, 5              # c = 5
	j done
else3:
	bne $t1, 893, else4    # b != 893?
	li $t1, 2              # b = 2
	li $t2, 3              # c = 5  
	j done
else4:
	li $t2, 32             # c = 32
done:
