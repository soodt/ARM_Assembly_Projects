  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

@
@ Follow the instructions contained in the examination paper
@
@ Your program goes here
@

 MOV R4,R1            @copyaddr=addr
 MOV R5,R1            @copyaddr2=addr
 MOV R10,#0
TOP1:

 MOV R3,#0            @countofnum=0
 MOV R6,#0
 MOV R7,#1
 MOV R8,#1
 MOV R9,#10
TOP:

 LDRB R11, [R4]        @element=value[addr]
 CMP R11, #0           @if element!=0
 BEQ POWER
 CMP R11, 0x2B         @if element!='+'
 BEQ POWER
 CMP R11, 0x2A         @if element!='*'
 BEQ POWER
 CMP R11, 0x2D         @if element!='-'
 BEQ POWER
 ADD R3, R3, #1       @countofnum+=1
 ADD R4, R4, #1       @copyaddr+=1
 B TOP

POWER:

  CMP R3, R8
  BLE NUM
  MUL R7,R7,R9
  ADD R8,R8,#1
  B POWER
NUM:
  MOV R8, #0
NUM1:
  
  CMP R3, R8
  BLE END
  ADD R8,R8,#1
  LDRB R2, [R5]
  ADD R5,R5,#1
  SUB R2, R2, 0x30
  MUL R2, R2, R7
  ADD R6, R6, R2
  UDIV R7, R7, R9
  B NUM1
  
END:
CMP R11,#0
BEQ END1
MOV R10,R6
ADD R4,R4,#1
ADD R5,R5,#1
B TOP1
         
END1:

ADD R1,R1,#2
LDRB R12, [R1]
CMP R12, 0x2B         @if element!='+'
BEQ PLUS
CMP R12, 0x2A         @if element!='*'
BEQ MULTIPLY
CMP R12, 0x2D         @if element!='-'
BEQ MINUS
PLUS:
ADD R10,R10,R6
B END2
MULTIPLY:
MUL R10,R10,R6
B END2
MINUS:
SUB R10,R10,R6
END2:
MOV R0,R10

End_Main:
  BX    lr
