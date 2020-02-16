COMMENT !

csc 220
lab 7
Matthew Connelly
================

(Modification of lab 5)
Sum word array elements with loop directive,
print original array backwards from a new subroutine.
sumArray is now a subroutine as well.

reverseArray now uses stack to manage array items

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
mov esi, offset wordArray ; index of array
mov ecx, lengthof wordArray ; loop for number of items in array

call sumArray

; store sum in memory
mov sum, ax 
; display sum
call WriteInt

; call function
call DumpRegs

; print reversed original array (lab 3 modification)
; ==================================================

; set up loop
mov esi, offset wordArray ; address of wordArray
mov ecx, lengthof wordArray ; loop for number of items in array

call reverseArray

exit
main endp

; sum array subroutine
; ====================
; Before calling:
; mov esi, offset array
; mov ecx, lengthof array
;
; stores in ax

sumArray proc
mov eax, 0 ; init accumulator
L1:
	add ax, [esi] ; add to ax value at address [esi]
	add esi, type wordArray ; increment by array item bytesize

	loop L1

	ret
sumArray endp

; MODIFIED: now uses stack, only the offset of the array is needed,
; not the address of the end of the array

; print array in reverse subroutine
; =================================
; Before calling:
; mov esi, offset array
; mov ecx, lengthof array

reverseArray proc uses eax ebx edx
mov edx, ecx ; save loop counter for second use
L1:
	push [esi] ; store array item
	add esi, type wordArray ; increment word array address 

	loop L1

mov eax, 0
mov ecx, edx ; reset loop counter
L2:
	pop ebx ; retrieve stored array items
	mov ax, bx ; prepare for printing
	call WriteInt

	loop L2

	ret
reverseArray endp

end main
