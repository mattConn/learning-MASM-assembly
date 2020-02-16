COMMENT !

csc 220
lab 3
Matthew Connelly
================

Sum word array elements with loop directive

!

include Irvine32.inc

.data
wordArray word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
sum word ?

.code
main proc

; display  array
mov esi, offset wordArray
mov ecx, lengthof wordArray
mov ebx, type wordArray
call DumpMem

; set up loop
; ===========
mov eax, 0 ; init accumulator
mov esi, offset wordArray ; index of array
mov ecx, lengthof wordArray ; loop for number of items in array

; sum array
L1:
	add ax, [esi] ; add to ax value at address [esi]
	add esi, type wordArray ; increment by array item bytesize
	loop L1

; store sum in memory
mov sum, ax

; display sum
call WriteInt

; call function
call DumpRegs

exit
main endp
end main
