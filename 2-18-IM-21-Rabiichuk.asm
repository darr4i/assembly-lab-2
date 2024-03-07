.386
option casemap :none
include \masm32\include\masm32rt.inc

.data?
    myMessageBoxWithData db 512 dup(?)
    bufferPositiveD db 256 dup(?)
    bufferPositiveE db 256 dup(?)
    bufferPositiveF db 256 dup(?)
    bufferNegativeD db 256 dup(?)
    bufferNegativeE db 256 dup(?)
    bufferNegativeF db 256 dup(?)

.data
 myMessageBoxWithDataTitle db "Lab 1 - Rabiichuk Daria", 0
 myMessageBoxWithDataPattern db 9, "My Birthday Data = 09.12.2004", 10, 10, 10,
   "My Positive Numbers", 9, 9, "My Negative Numbers", 10, 10,
   "A =  %d", 9, 9, 9, "-A =  %d", 10,
   "B =  %d", 9, 9, 9, "-B =  %d",  10,
   "C =  %d", 9, 9, "-C =  %d", 10,
   "D =  %s", 9, 9, "-D =  %s", 10,
   "E =  %s", 9, 9, "-E =  %s", 10,
   "F =  %s", 9, 9, "-F =  %s", 0

    myPositiveNumberA db 09
    myNegativeNumberA db -09
    
    myPositiveNumberA1 dw 09
    myNegativeNumberA1 dw -09 
    
    myPositiveNumberA2 dd 09
    myNegativeNumberA2 dd -09
    
    myPositiveNumberA3 dq 09
    myNegativeNumberA3 dq -09

    myPositiveNumberB dw 0912
    myNegativeNumberB dw -0912
    
    myPositiveNumberB1 dd 0912
    myNegativeNumberB1 dd -0912
    
    myPositiveNumberB2 dq 0912
    myNegativeNumberB2 dq -0912

    myPositiveNumberC dd 09122004
    myNegativeNumberC dd -09122004
    
    myPositiveNumberC1 dq 09122004
    myNegativeNumberC1 dq -09122004

    myPositiveNumberD dq 0.001
    myNegativeNumberD dq -0.001
    
    myPositiveNumberD1 dd 0.001
    myNegativeNumberD1 dd -0.001

    myPositiveNumberE dq 1.102
    myNegativeNumberE dq -1.102
    
    myPositiveNumberF dq 1023.219
    myNegativeNumberF dq -1023.219

    myPositiveNumberF1 dt 1023.219
    myNegativeNumberF1 dt -1023.219

.code
RabiichukLab2 :
    invoke FloatToStr2, myPositiveNumberD, addr bufferPositiveD
    invoke FloatToStr2, myNegativeNumberD, addr bufferNegativeD
    
    invoke FloatToStr2, myPositiveNumberE, addr bufferPositiveE
    invoke FloatToStr2, myNegativeNumberE, addr bufferNegativeE
    
    invoke FloatToStr2, myPositiveNumberF, addr bufferPositiveF
    invoke FloatToStr2, myNegativeNumberF, addr bufferNegativeF

    invoke wsprintf, addr myMessageBoxWithData, addr myMessageBoxWithDataPattern,
    myPositiveNumberA2, myNegativeNumberA2, 
    myPositiveNumberB1, myNegativeNumberB1, 
    myPositiveNumberC, myNegativeNumberC, 
    offset bufferPositiveD, offset bufferNegativeD, 
    offset bufferPositiveE, offset bufferNegativeE,
    offset bufferPositiveF, offset bufferNegativeF

    invoke MessageBox, 0, addr myMessageBoxWithData, addr myMessageBoxWithDataTitle, 0
    invoke ExitProcess, 0
    end RabiichukLab2