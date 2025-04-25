  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

  @ 
  @ If x is a value in R1, translate the following pseudocode
  @   into ARM Assembly Langauge
  @
  @ if (x >= 5) {
  @   x = 0;
  @ }
  @
     CMP R1,#5
     BLT END
     MOV R1,#0
     END:


  @ 
  @ If y is a value in R2, translate the following pseudocode
  @   into ARM Assembly Langauge
  @
  @ if (y != 0) {
  @   y = y * 2;
  @ }
  @ else {
  @   y = 1;
  @ }
  @
    CMP R2,#0
    BEQ ELSE 
    MOV R6,#2
    MUL R2,R2,R6
    B END1
    ELSE:
    MOV R2,#1
    END1:
  @ 
  @ If z is a value in R3, translate the following pseudocode
  @   into ARM Assembly Langauge
  @
  @ if (z >= 13 && z <= 23) {
  @   z = z - 12;
  @ else if (z == 0) {
  @   z = 12;
  @ }
  @
   CMP R3,#13
   BLT PART2
   CMP R3,#23
   BGT PART2
   MOV R6,#12
   SUB R3,R3,R6
   B END2
   PART2:
   CMP R3,#0
   BNE END2
   MOV R3,#12
   END2:

  @ 
  @ If a and b are values in R4 and R5, translate the following
  @   pseudocode into ARM Assembly Langauge
  @
  @ while (a >= 5) {
  @   b = b + (2 * a);
  @   a = a - 5;
  @ }
  @
    CMP R4,#5
    BLT END5
    MOV R6,#2
    MOV R8,#5
    MUL R7,R4,R6
    ADD R5,R5,R7
    SUB R4,R4,R8
    END5:
    
End_Main:
  BX    lr

.end