.global _main
.align 4

_main:
  mov X0, #1              // stdout
  adr X1, firstmessage    // address of first message
  mov X2, #24             // number of bytes of the first message
  mov X16, #4             // write to stdout
  svc 0                   // syscall

  b _terminate

_terminate:
  mov X0, #0              // return 0
  mov X16, #1             // terminate
  svc 0                   // syscall

firstmessage: .ascii "Enter the first number:\n"
