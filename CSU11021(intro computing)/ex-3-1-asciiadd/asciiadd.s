  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Register R1 contains the ASCII code for a digit ‘0’ … ‘9’
  @ Register R2 contains the ASCII code for second digit ‘0’ … ‘9’
  @ Convert the ASCII codes to their corresponding integers and add them
  @   together.
  @ Convert the resulting integer back to its corresponding ASCII code and
  @   store the result in R0
  @ e.g. R1=‘3’ + R2=‘5’ should give R0=‘8’

  MOV R3, #0X30
  SUB R1, R1, R3
  SUB R2, R2, R3
  ADD R0, R1, R2
  ADD R0, R0, R3

  @ End of program ... check your result

End_Main:
  BX    lr
