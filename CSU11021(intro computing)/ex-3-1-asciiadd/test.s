  .syntax unified
  .cpu cortex-m4
  .thumb

  .global  Init_Test

  .section  .text

  .type     Init_Test, %function
Init_Test:
  MOV   R1, #'3'
  MOV   R2, #'5'
  bx    lr

.end