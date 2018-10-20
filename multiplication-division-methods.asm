COMMENT !

csc 220
lab 9
Matthew Connelly
================

Multiply 840 by 42 through bitshifting, then through MUL instruction.
Divide 840 by 42 using DIV instruction.

!

include Irvine32.inc

.data

.code
main proc

; ==================================
; multiplication through bitshifting
; ==================================
; zero out general purpose registers
mov eax, 0
mov ebx, 0
mov ecx, 0

; prepare registers
mov eax, 840
mov ebx, eax
mov ecx, eax

; multiply by 42
; 42 = 2^5 + 2^3 + 2^1
shl eax,5
shl ebx,3
shl ecx,1

; get sum
add eax, ebx
add eax, ecx

; print
call WriteInt
call Crlf

; ======================================
; multiplication through mul instruction
; ======================================
mov eax, 840
mov ebx, 42
mul ebx

call WriteInt
call Crlf

; ================================
; division through div instruction
; ================================
mov eax, 840
mov ebx, 42
div ebx 

call WriteInt
call Crlf


exit
main endp

end main
