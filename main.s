.global _main
.align 4

_main:
  b _terminate

_terminate:
  mov X0, #0
  mov X16, #1
  svc 0
