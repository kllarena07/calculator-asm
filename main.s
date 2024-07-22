.global _main
.align 4

_main:
  mov X0, #1
  adr X1, firstmessage
  mov X2, #24
  mov X16, #4
  svc 0

  b _terminate

_terminate:
  mov X0, #0
  mov X16, #1
  svc 0

firstmessage: .ascii "Enter the first number:\n"
