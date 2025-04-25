  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 8

  MOV R0, #0
  MOV R3, #0
  MOV R2, #0 @COUNT=0

FOR:
  CMP R4, #32
  BGE ENDFOR

  MOVS R1, R1, LSL #1
  BCS ENDIF
  ADD R0, R0, #1
  ADD R4, R4, #1
  B FOR
ENDIF:
  CMP R3, R0
  BLT DONTCHANGE
  MOV R0, R3
DONTCHANGE:
  ADD R4, R4, #1
  MOV R3, R0
  MOV R0, #0
  B FOR
ENDFOR:
  CMP R3, R0
  BLT END
  MOV R0, R3
END:

  @ End of program ... check your result

End_Main:
  BX    lr
