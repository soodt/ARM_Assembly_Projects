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
AVERAGE:

 LDR R3, [R2]        @ sizeOfSequence = value[addrSequence]
 ADD R2, R2, #4      @ addrSequence += 4 
 MOV R7, R2          @ copyAddrSequence = addrSequence
 MOV R12, R2         @ copyAddrSequence2 = addrSequence
 MOV R4, #0          @ count = 0
 MOV R5, #0          @ sum = 0
 MOV R6, #0          @ numInSequence = 0
 MOV R0, #0          @ Average = 0

While:

 CMP R4, R3          @ while sizeOfSequence>count
 BGE EndWhile        @{
 ADD R4, R4, #1      @  count += 1
 LDR R6, [R2]        @  numInSequence = value[addrSequence]
 ADDS R5, R5, R6     @  sum = sum + numInSequence
 ADD R2, R2, #4      @  addrSequence += 4
 B While             @}
 
EndWhile:
 
 MOV R4, #-1         @ constant = -1
 SDIV R0, R5, R3     @ Average = sum / sizeOfSequence
 CMP R0, #0          @ if (average<0)
 BGE Positive        @{
 MUL R0, R0, R4      @  Average = Average * constant
Positive:            @}
   
 MOV R2, R7         @ addrSequence = copyAddrSequence
 MOV R9, #0         @ countOfNum = 0
 MOV R10, #0        @ countOfMode = 0
 MOV R5, #0         @ count = 0
 MOV R11, #0        @ mode = 0
 MOV R6, #0         @ numInSequence = 0

MODE:
 
 CMP R10, R9        @ if (countOfMode<countOfNum)
 BGE CONTINUE       @ {
 MOV R10, R9        @  countOfMode = countOfNum 
 MOV R11, R6        @  mode = numInSequence 
CONTINUE:           @ }
 
 CMP R5, R3         @ while sizeOfSequence>count
 BGE EndMode        @{
 ADD R5, R5, #1     @  count+=1
 MOV R4, #0         @  count2=0
 LDR R6, [R2]       @  numInSequence = value[addrSequence]
 ADD R2, R2, #4     @  addrSequence += 4
 MOV R7, R12        @  copyAddrSequence = copyAddrSequence2
 MOV R9, #0         @  countOfNum = 0  
WhileSeq:
 CMP R4, R3         @  while sizeOfSequence>count2
 BGE MODE           @  {
 ADD R4, R4, #1     @    count2+=1
 LDR R8, [R7]       @    numInSequence2 = value[copyAddrSequence]
 ADD R7, R7, #4     @    copyAddrSequence += 4
 CMP R8, R6         @    if (numInSequence == numInSequence2)
 BNE WhileSeq       @    {
 ADD R9, R9, #1     @       countOfNum+=1 }
 B WhileSeq         @   }  
 
EndMode:            @}
  MOV R1, R11       @  finalMode = mode

End_Main:
  BX    lr
