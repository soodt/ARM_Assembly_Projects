  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Init_Test

  .section  .text
  .type     Init_Test, %function
Init_Test:
  @ Test with x=3, 4
  MOV   R1, #3
  MOV   R2, #0
  bx    lr

.end