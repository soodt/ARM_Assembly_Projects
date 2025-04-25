  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

  @ Write a program to compute total=a+b+c+d
  MOV   R0, R1          @ total=a
  ADD   R0, R0, R2      @ total=total+b
  ADD   R0, R0, R4      @ total=total+d

  @ End of program ... check your result

  

End_Main:
  BX    LR

  .end