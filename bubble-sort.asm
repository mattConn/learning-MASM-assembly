COMMENT !
  
csc 220
lab 6
Matthew Connelly
================

Sort an array in ascending order.
This program uses a bubble sort.

!

include Irvine32.inc

.data
arr word 1, 4, 2, 8, 5, 7, 10, 3, 9, 6

.code
main proc

; view original (unsorted) array
mov esi, offset arr
mov ecx, lengthof arr
mov ebx, type arr
call DumpMem

; prepare for loop
mov ecx, lengthof arr - 1
mov esi, offset arr

OUTER:

push ecx ; preserve ecx for outer loop
mov esi, offset arr ; set address of array
mov ecx, lengthof arr - 1 ; set inner loop counter

INNER:

; bubble sort

; store left value
movzx edi, word ptr [esi] 
mov edx, esi ; store addr. of left value for dereferencing after address increment

add esi, type arr ; increment addr. to next item in arr.
cmp di, word ptr [esi] ; compare next item to previous

jc NO_SWAP ; skip swap instruction if difference of left and right value is negative (already in ascending order)

; swapping instructions
xchg [esi], di ; exchange right value (in array) with left value (in register)
xchg [edx], di ; exchange left value (in array) with newly exchanged value in register (right value)


NO_SWAP:
loop INNER

pop ecx ; restore ecx to be decremented for outer loop

loop OUTER ; decrement outer loop counter and resume looping

; view sorted array
mov esi, offset arr
mov ecx, lengthof arr
mov ebx, type arr
call DumpMem

exit
main endp

end main
