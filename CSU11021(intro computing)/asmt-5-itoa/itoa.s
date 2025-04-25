  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 5

  @
  @ TIP: To view memory when debugging your program you can ...
  @
  @   Add the watch expression to see individual characters: (char[64])strA
  @
  @   OR
  @
  @   Add the watch expression to see the string: (char*)&strA
  @
  @   OR
  @
  @   Open a 'Memory View' specifying the address &strA and length at
  @   least 11. You can open a Memory View with ctrl-shift-p type
  @   'View Memory' (cmd-shift-p on a Mac).
  @
  MOV R10,#10           @constant a=10
  MOV R9,R1
  MOV R11,#-1
  MOV R6,#10000
  MUL R6,R6,R6
  MUL R6,R6,R10
  SIGN:
  CMP R1,#0            
  BEQ ANYTHING          @if number =0,branch start
  BGT POSITIVE          @if number<0, 
  MOV R8,#'-'           @sign=-
  STR R8,[R0]           @r0=sign
  ADD R0,R0,#1
  MUL R1,R1,R11
  B START
  POSITIVE:
  MOV R8,#'+'           @sign=+
  STR R8, [R0]          @r0=
  ADD R0,R0,#1
  START:
  MOV R2,#10            @divisor=10
  UP:
  CMP R2,R1             @while divisor(10)<number
  BGT SOMETHING
  CMP R2,R6
  BEQ WHATEVER
  MUL R2, R2,R10        @ divisor=divisor*10
  B UP
  SOMETHING:
  UDIV R2,R2,R10        @divisor=divisor/10(done because in the while loop it multiplies one more than needed)
  WHATEVER:
  CMP R2,#1             @while number>1
  BLT NOTANYTHING
  UDIV R3, R1,R2        @quotient=number/divisor           
  MUL R4, R3,R2         @temp=quotient*divisor
  SUB R5 , R1,R4        @remainder=number-temp
  MOV R1,R5             @number=remiander       """"on basis of that techniqure to get the most significant digit
  ADD R3,R3,#0X30
  STR R3,[R0]           @store number in r0
  ADD R0,R0,#1
  B SOMETHING
  ANYTHING:
  MOV R7,#0            @constant b=0
  ADD R7,R7,#0X30
  STR R7, [R0]          @store 0 in r0 """"either in end of the number or if the number is 0
  ADD R0,R0,#1
  NOTANYTHING:
  MOV R7,#0 
  STR R7, [R0] 
  

  @ End of program ... check your result

 @problems-0s at the end of a number not counting
End_Main:
  BX    lr
