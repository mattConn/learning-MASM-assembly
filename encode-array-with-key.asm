COMMENT !

csc 220
lab 8
Matthew Connelly
================

Using key 10101111, encode all elements of a byte sized array.

!

include Irvine32.inc

.data
message byte "Assembly programming is tough but rewarding.",0
key byte 10101111b

.code
main proc

mov al, key

call printMsg ; display original string

call encryptMsg ; encrypt string
call printMsg ; display encrypted string

call encryptMsg ; decrypt string
call printMsg ; display decrypted string

exit
main endp

; ===========================
; message printing subroutine
; ===========================
printMsg proc uses edx

	mov edx, offset message
	call WriteString

	call Crlf

	ret

printMsg endp

; =============================
; message encryption subroutine
; =============================
encryptMsg proc uses ecx esi eax

	; set up encryption loop
	mov ecx, lengthof message
	mov esi, offset message

	L1:

	xor [esi], al
	add esi, type message

	loop L1

	ret

encryptMsg endp

end main
