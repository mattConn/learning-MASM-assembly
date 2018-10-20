COMMENT !
  
CSC 220
Lab 2
Matthew Connelly
======================

Sum the expression below using registers

!

include Irvine32.inc

.data
; RVAL=(XVAL-YVAL) - (ZVAL +3+ XVAL) - 10 - ZVAL
; => XVAL-YVAL - ZVAL - 3 - XVAL - 10 - ZVAL
xval sword 5
yval sword 6
zval sword 7
rval sword ?

.code
main proc

; store values in registers
mov ax, xval
mov bx, yval
mov cx, zval

; perform arithmetic operations in groups
; =======================================

;(XVAL-YVAL)
mov rval, ax
sub rval, bx

;- ZVAL - 3
sub rval, cx
sub rval, 3

;- XVAL - 10
sub rval, ax
sub rval, 10

;-ZVAL
sub rval, cx
; end arithmetic operations
; =========================

; display rval
movsx eax, rval
call WriteInt

;call functions
call DumpRegs

mov esi, offset rval
mov ecx, lengthof rval
mov ebx, type rval
call DumpMem

exit
main endp
end main
