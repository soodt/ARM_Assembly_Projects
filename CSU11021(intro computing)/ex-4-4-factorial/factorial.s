  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Write a program to compute n! when n is a value in R1
  MOV R0,R1
  CMP R0,#0
  BNE TOP
  MOV R0,#1
  B END
  TOP:
  CMP R1,#2
  BLT END
  SUB R1,#1
  MUL R0,R0,R1
  B TOP
  
  END:


  @ End of program ... check your result

End_Main:
  BX    lr
