# Alden Quimby
# adq2101
# Problem 1, part c
# test1.s

    .file   "test1.c"
    .text
    .globl  main
    .type   main, @function
main:
.LFB0:
    .cfi_startproc
    movl    -32(%rsp), %eax
    addl    -28(%rsp), %eax
    addl    -24(%rsp), %eax
    addl    -20(%rsp), %eax
    addl    -16(%rsp), %eax
    addl    -12(%rsp), %eax
    ret
    .cfi_endproc
.LFE0:
    .size   main, .-main
    .ident  "GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
    .section    .note.GNU-stack,"",@progbits