  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Write a program to compute 4x^2+3x

  @ *** your program goes here ***
MUL R0, R1, R1   @TOT=TOT*X
MOV R2, #4       @TEMP=4,CUZ CANT USE MUL WITH NUMBERS
MUL R0, R0, R2   @TOT=TOT*4

MOV R3, #3       @TEMP2=3,CUZ CANT USE MUL WITH NUMBERS
MUL R4, R3, R1   @2ND TERM=3*X
ADD R0, R4      @ADD FIRST AND SECOND TERM
  @ End of program ... check your result

End_Main:
  BX    lr
