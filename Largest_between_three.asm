
.model small
.stack 100h
.data
a db "Enter 1st number $"          ; Message asking for the first input
b db 10, 13, "Enter second number $" ; 10 = Line Feed, 13 = Carriage Return
d db 10, 13, "Enter thired number $" ; Message asking for the third input
c db 10, 13, "Largest Number: $"   ; Message to display the largest number

.code
main proc
    mov ax, @data                 ; Load the address of the data segment into AX
    mov ds, ax                    ; Initialize DS to access variables and messages

    mov ah, 9                     ; DOS function 09H: display a string
    lea dx, a                     ; Load the address of message A into DX
    int 21h                       ; Display "Enter 1st number"

    mov ah, 1                     ; DOS function 01H: read one character
    int 21h                       ; Input character is returned in AL
    mov bl, al                    ; Store the first input in BL

    mov ah, 9                     ; DOS function 09H: display a string
    lea dx, b                     ; Load the address of message B into DX
    int 21h                       ; Display "Enter second number"

    mov ah, 1                     ; DOS function 01H: read one character
    int 21h                       ; Input character is returned in AL
    mov bh, al                    ; Store the second input in BH

    mov ah, 9                     ; DOS function 09H: display a string
    lea dx, d                     ; Load the address of message D into DX
    int 21h                       ; Display "Enter third number"

    mov ah, 1                     ; DOS function 01H: read one character
    int 21h                       ; Input character is returned in AL
    mov cl, al                    ; Store the third input in CL

    mov ah, 9                     ; DOS function 09H: display a string
    lea dx, c                     ; Load the address of message C into DX
    int 21h                       ; Display "Largest Number:"

    mov ah, 2                     ; DOS function 02H: display character in DL

    cmp bl, bh                    ; Compare first input (BL) with second (BH)
                                  ; Internally calculates BL - BH without saving result
                                  ; Updates flags: ZF, SF, OF, and others
                                  ; ZF = 1 if both inputs are equal
                                  ; JGE checks SF = OF (signed comparison)
                                  ; If BL >= BH, jump to L1
                                  ; Otherwise, continue to L2

    jge l1                        ; If first input >= second input, go to L1

    l2:                           ; Reached when BL < BH
    cmp bh,cl                     ; Compare second input (BH) with third (CL)
                                  ; Internally calculates BH - CL
                                  ; Updates the CPU flags again
                                  ; JGE checks SF = OF
                                  ; If BH >= CL, jump to L3
                                  ; Otherwise, CL is greater than BH

    jge l3                        ; If second input >= third input, jump to L3

    mov dl, cl                    ; CL is greater than both BL and BH
    int 21h                       ; Display the third input
    jmp exit                      ; Skip the remaining comparisons and finish

    l3:                           ; Reached when BH >= CL and BL < BH
    mov dl, bh                    ; The second input is the largest
    int 21h                       ; Display the second input
    jmp exit:                     ; Intended to jump to EXIT
                                  ; Note: this line has a colon after EXIT

    l1:                           ; Reached when BL >= BH
    cmp bl,cl                     ; Compare first input (BL) with third (CL)
                                  ; Internally calculates BL - CL
                                  ; Updates the flags based on this comparison
                                  ; JGE checks SF = OF
                                  ; If BL >= CL, jump to L4
                                  ; Otherwise, CL is greater than BL

    jge l4                        ; If first input >= third input, jump to L4

    mov dl, cl                    ; CL is greater than both BL and BH
    int 21h                       ; Display the third input
    jmp exit                      ; Skip L4 and finish

    l4:                           ; Reached when BL >= CL and BL >= BH
    mov dl,bl                     ; The first input is the largest
    int 21h                       ; Display the first input

exit:
    mov ah, 4ch                   ; DOS function 4CH: terminate the program
    int 21h                       ; Return control to DOS

    main endp
end main
