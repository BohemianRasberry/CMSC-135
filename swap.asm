; I was very bored and wanted to give this a go
; @David Agudo
; @Stefani Gutierrez

.model small
.stack 100h

.data 
    givetxt db 13, 10, "Input a text: ", "$"
    swap1 db 13, 10, "Swap one: ", "$"
    swap2 db 13, 10, "Swap two: ", "$"
    input1 db ?
    input2 db ?

.code
    main proc near

    ; Initializing data 
    mov ax, @data
    mov ds, ax

    ; Give prompt message
    lea dx, givetxt
    mov ah, 09h
    int 21h

    ; Take input one
    mov ah, 01h
    int 21h

    mov input1, al

    ; Give prompt messsage
    lea dx, givetxt
    mov ah, 09h
    int 21h

    ; Take input two
    mov ah, 01h
    int 21h

    mov input2, al
    int 21h
    
    ; Swap the characters
    mov cl, input1
    mov dl, input2
    mov input2, cl
    mov input1, dl
    int 21h
    

    ; Newline
    ; mov ah, 02h
    ; mov dl, 13
    ; int 21h

    ; mov ah, 02h
    ; mov dl, 10
    ; int 21h

    ; Text one
    lea dx, swap1
    mov ah, 09h
    int 21h

    mov ah, 02h
    mov dl, input1
    int 21h

    ; Text two
    lea dx, swap2
    mov ah, 09h
    int 21h

    mov ah, 02h
    mov dl, input2
    int 21h

    mov ax, 4c00h
    int 21h

    main endp

end main
