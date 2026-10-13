
.model small
.stack 100h

.data
a equ '2'                   ; A represents the character '2'
                            ; EQU is a constant, so we can use A directly

b equ "Computer Science & Engineering $"
                            ; B represents this entire string
                            ; B is substituted with its text during assembly

c db 10, 13, b              ; C stores 10, 13, followed by B's text
                            ; We put B inside C to store the newline and text together
                            ; Now we can access both using the address of C

.code
main proc
    mov ax, @data           ; Get the address of the data segment
    mov ds, ax              ; Set DS to access data

    mov ah, 2               ; DOS function 2 displays one character
    mov dl, a               ; A is a constant, so put character '2' directly into DL
    int 21h                 ; Display '2'

    mov ah, 9               ; DOS function 9 displays a string
    lea dx, c               ; C is stored in memory, so load its address into DX
    int 21h                 ; Display C's contents until $

    ecit:
    mov ah, 4ch             ; DOS function 4CH terminates the program
    int 21h                 ; Return control to DOS

    main endp
end main
