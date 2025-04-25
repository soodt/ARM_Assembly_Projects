  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Write a program to compute x^3−4x^2+3x+8 where x is a value in R1

  @ *** your program goes here ***

MUL R0, R1, R1    @ tot=x*x
MUL R0, R0, R1    @ tot=tot*x

MOV R2, R1
MUL R2, R2, R1    @temp=temp*x    
MOV R3, #4        @temp2=4,cuz cant MUL directly with number in next line
MUL R2, R3        @temp=temp*temp2

SUB R0, R0, R2    @first term-second term

MOV R4, #3        @temp3=3,cuz cant MUL directly with number in next line
MUL R4, R4, R1    @temp3=temp3 * x

ADD R0, R0, R4    @adding third term

ADD R0, R0, #8    @adding fourth term


  @ End of program ... check your result

End_Main:
  BX    lr
