COMMENT !

csc 220
lab 5
Matthew Connelly
================

(Modification of lab 4)
Sum word array elements with loop directive,
print original array backwards from a new subroutine.
sumArray is now a subroutine as well.

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
mov esi, offset wordArray + (sizeof wordArray-type wordArray) ; address of last item of wordArray
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

; print array in reverse subroutine
; =================================
; Before calling:
; mov esi, offset array
; mov ecx, lengthof array

reverseArray proc uses ax
L1:
	mov ax, [esi] ; prepare WriteInt
	call WriteInt ; call

	sub esi, type wordArray ; decrement wordArray end address

	loop L1

	ret
reverseArray endp

end main
