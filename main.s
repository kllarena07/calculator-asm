.global _main
.align 4

_main:
  mov x0, #1                    ; stdout
  adr x1, firstmessage          ; address of first message
  mov x2, #24                   ; number of bytes of the first message
  mov x16, #4                   ; write to stdout
  svc 0                         ; syscall

  mov x0, #0                    ; stdin
  adrp x1, buffer@PAGE
  add x1, x1, buffer@PAGEOFF    ; load address of buffer
  mov x2, #100                  ; max number of bytes to read
  mov x16, #3                   ; syscall number for read
  svc 0                         ; make syscall

  mov x0, #1
  adr x1, buffer
  mov x2, #100
  mov x16, #4
  svc 0

  b _terminate

_terminate:
  mov x0, #0                    ; return 0
  mov x16, #1                   ; terminate
  svc 0                         ; syscall

firstmessage: .ascii "Enter the first number:\n"
.data
buffer: .space 100