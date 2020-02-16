COMMENT !

CSC 220
Lab 1
Matthew Connelly
======================

Rearrange array values
From "1 2 3" to "3 1 2"

!

include Irvine32.inc

.data
arr word 1, 2, 3

.code
main proc

; display original array
mov esi, offset arr
mov ecx, lengthof arr
mov ebx, type arr
call DumpMem

; swap array items, store in memory
; =================================

; swap first and last items
; -------------------------

	movzx eax, arr ; first
	movzx ebx, [arr + 4] ;last

	xchg ax, bx ;swap

	; store back in memory
	mov arr, ax
	mov [arr + 4], bx

; swap second and last items
; --------------------------
	mov ax, [arr + 2] ; first
	mov bx, [arr + 4] ;last

	xchg ax, bx ;swap

	; store back in memory
	mov [arr + 2], ax
	mov [arr + 4], bx

; ====================
; end swap array items

; function calls
call DumpRegs
call WriteInt

; display new array
mov esi, offset arr
mov ecx, lengthof arr
mov ebx, type arr
call DumpMem

exit

main endp
end main
