  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Init_Test

  .section  .text

  .type     Init_Test, %function
Init_Test:
  @ Initialise registers for your program here
  @ e.g.
  LDR   R7, =20

  bx    lr

.end
