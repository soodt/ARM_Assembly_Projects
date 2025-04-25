  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Write an ARM Assembly Language program to evaluate
  @   ax^2 + bx + c for given values of a, b, c and x

  MUL R0, R1, R1  @TOT=X*X,HERE X=3
  MUL R0, R0, R2  @TOT=TOT*A,HERE A=4

  MUL R3, R3, R1  @2ND TERM=B*X,HERE B=3

  ADD R0, R0, R3  @ADDING 2ND TEREM TO RUNNING TOTAL

  ADD R0, R0, R4  @ADDING 3RD TERM TO RUNNING TOT, HERE R4=7

  @ End of program ... check your result

End_Main:
  BX    lr
