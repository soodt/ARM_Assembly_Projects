  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

  @ Write your program between here ...

  LDR R2, =12
  LDR R1, =0x20000040
  MOV R3,R2,LSL #2
  ADD R3, R3 ,R1
  LDR R0, [R3]

End_Main:
  BX    LR

  .end
