
.model small
.stack 100h
.data
a db "Enter 1st number $"          ; Message asking for the first input
b db 10, 13, "Enter second number $" ; 10 = Line Feed, 13 = Carriage Return
c db 10, 13, "Largest Number: $"  ; Message to display the largest number

.code
main proc
    mov ax, @data                 ; Load the address of the data segment into AX
    mov ds, ax                    ; Initialize DS so we can access our variables

    mov ah, 9                     ; DOS function 09H: display a string
    lea dx, a                     ; Load the address of message A into DX
    int 21h                       ; Display "Enter 1st number"

    mov ah, 1                     ; DOS function 01H: read one character
    int 21h                       ; Input character is returned in AL
    mov bl, al                    ; Store the first character in BL

    mov ah, 9                     ; DOS function 09H: display a string
    lea dx, b                     ; Load the address of message B into DX
    int 21h                       ; Display "Enter second number"

    mov ah, 1                     ; DOS function 01H: read one character
    int 21h                       ; Input character is returned in AL
    mov bh, al                    ; Store the second character in BH

    mov ah, 9                     ; DOS function 09H: display a string
    lea dx, c                     ; Load the address of message C into DX
    int 21h                       ; Display "Largest Number:"

    mov ah, 2                     ; DOS function 02H: display one character from DL

    cmp bl, bh                    ; Compare BL with BH by internally calculating BL - BH
                                  ; CMP does NOT save the subtraction result
                                  ; It updates the CPU flags based on the result
                                  ;
                                  ; Example: BL = '7', BH = '3'
                                  ; ASCII: 37H - 33H = 04H
                                  ; ZF = 0 because result is not zero
                                  ; SF = 0 because result is positive
                                  ; OF = 0 because no signed overflow occurred

    jg l1                         ; JG = Jump if Greater (signed comparison)
                                  ; Checks: ZF = 0 AND SF = OF
                                  ; If both conditions are true, jump to L1
                                  ; For '7' > '3': ZF=0, SF=0, OF=0
                                  ; So ZF=0 and SF=OF (0=0): JUMP to L1
                                  ;
                                  ; If BL = '3' and BH = '7':
                                  ; Result is negative, so SF=1, OF=0, ZF=0
                                  ; SF is not equal to OF, so JG does NOT jump

    jmp l2                        ; Unconditional jump to L2 if JG did not jump
                                  ; This happens when BL is less than or equal to BH

l1:
    mov dl, bl                    ; Copy the first character into DL
    int 21h                       ; Display the character stored in DL

l2:
    mov dl, bh                    ; Copy the second character into DL
    int 21h                       ; Display the character stored in DL

exit:
    mov ah, 4ch                   ; DOS function 4CH: terminate the program
    int 21                       ; Return control to DOS

    main endp
end main
