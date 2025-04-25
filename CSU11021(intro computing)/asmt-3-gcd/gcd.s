  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 3
  
TOP:
 CMP R2,R3                
 BEQ END                @while (int1!=int2)
 BLT CON2               @{      
 CON1:                  @     while (int1>int2){
 SUB R2,R2,R3           @        int1=int1-int2
 MOV R0,R2              @        result=int1
 B TOP                  @        }

 CON2:                  @     while (int2>int1){    
 SUB R3,R3,R2           @        int2=int2-int1
 MOV R0,R3              @        result=int2
 B TOP                  @        }
        
 END:                   @}
 MOV R0,R2              @result=int1

 
  @ End of program ... check your result

End_Main:
  BX    lr
