  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 4
                                      @ DO
    MOV  R0, #0                       @ {
START:
    SUB  R1 , R1 , #1                 @ N = N-1 
    MOV  R2 , #2                      @ DIVISOR = 2
    MOV  R3 , #1                      @ REMAINDER = 1
FINDPRIME:
    CMP  R1 , R2                      @ WHILE N>DIVISOR &
    BLE  COUNTPRIME 
    CMP  R3 , #0                      @ WHILE REMAINDER !=0
    BEQ  COUNTPRIME                   @ {
    UDIV R4 , R1 , R2                 @ QUOTIENT = N / DIVISOR
    MUL  R5 , R4 , R2                 @ TEMP = QUOTIENT*DIVISOR
    SUB  R3 , R1 , R5                 @ REMAINDER = N - TEMP
    ADD  R2 , R2 , #1                 @ DIVISOR = DIVISOR + 1
    B    FINDPRIME                    @ }
COUNTPRIME:
    CMP  R3 , #0                      @ IF REMAINDER !=0
    BEQ  END
    CMP  R1 , #1                      @ IF N<=2
    BLE  END
    ADD  R0 , #1                      @ PRIMECOUNT = PRIMECOUNT + 1
END:
                                      @ }
    CMP  R1 , #1                      @ WHILE N>1
    BGT  START
  
  @ End of program ... check your result

End_Main:
  BX    lr
