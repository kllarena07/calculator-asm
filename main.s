.global _main
.align 4

_main:
    mov x0, #1                          ; stdout
    adrp x1, first_message@PAGE         ; address of first message
    add x1, x1, first_message@PAGEOFF
    mov x2, #23                         ; number of bytes of the first message
    mov x16, #4                         ; write to stdout
    svc 0                               ; syscall

    mov x0, #0                          ; stdin
    adrp x1, first_buffer@PAGE          ; calculate the offset
    add x1, x1, first_buffer@PAGEOFF    ; load address of buffer
    mov x2, #2                          ; max number of bytes to read
    mov x16, #3                         ; syscall number for read
    svc 0                               ; make syscall

    mov x0, #1                          ; stdout
    adrp x1, second_message@PAGE        ; address of second message
    add x1, x1, second_message@PAGEOFF
    mov x2, #23                         ; number of bytes of the first message
    mov x16, #4                         ; write to stdout
    svc 0                               ; syscall

    mov x0, #0                          ; stdin
    adrp x1, second_buffer@PAGE         ; calculate the offset
    add x1, x1, second_buffer@PAGEOFF   ; load address of buffer
    mov x2, #2                          ; max number of bytes to read
    mov x16, #3                         ; syscall number for read
    svc 0                               ; make syscall

    ;mov x0, #1                          ; stdout
    ;adrp x9, first_buffer@PAGE
    ;add x9, x9, first_buffer@PAGEOFF
    ;adrp x10, second_buffer@PAGE
    ;add x10, x10, second_buffer@PAGEOFF
    ;add x1, x9, x10
    ;mov x2, #100                        ; number of bytes
    ;mov x16, #4                         ; write to stdout
    ;svc 0                               ; syscall

    b _terminate

_terminate:
    mov x0, #0                          ; return 0
    mov x16, #1                         ; terminate
    svc 0                               ; syscall

.data
    first_message: .ascii "Enter a number (0-49):\n"
    second_message: .ascii "Enter a number (0-49):\n"
    first_buffer: .space 1
    second_buffer: .space 1