;tinh tong cac phan tu chia het cho 7

.model small
.stack 100h
.data
    mang db 7, 5,60,233,77,43      ; Mang cac so can tinh
    str db 'Tong: $'               ; Chuoi thong bao ket qua
.code
main proc
    mov ax, @data
    mov ds, ax                     ; Khoi tao data segment
    
    lea si, mang                   ; Di chuyen dia chi cua mang vao SI
    mov bx, 0                      ; Khoi tao tong bang 0
    mov dl, 7                      ; Gia tri DL bang 7 (dung de chia so)
    
    tong:
        mov al, [si]               ; Lay tung phan tu cua mang vao AL
        xor ah, ah                 ; Xoa AH de tao AX
        mov cx, ax                 ; Luu gia tri AX vao CX
        inc si                     ; Tang dia chi SI de lay phan tu tiep theo
        cmp si ,6                  ; Neu SI vuot qua 6 thi thoat vong lap
        je endtong
        
        div dl                     ; Chia gia tri trong AX cho DL (7)
        cmp ah, 0                  ; Kiem tra so du, neu != 0 thi tiep tuc
        jne tong
        
        add bx, cx                 ; Cong gia tri vao BX (tong)
        jmp tong                   ; Lap lai cho den khi het cac phan tu
        
    endtong:
        mov ax, bx                 ; Chuyen tong tu BX sang AX
        call printNumber           ; Goi ham in so
        
        mov ah, 4ch
        int 21h                    ; Ket thuc chuong trinh
main endp 

; Ham printNumber: In ra so nguyen (max: 2550)
printNumber proc
    push ax
    push bx
    push cx
    push dx

    cmp ax, 0
    jge not_negative               ; Neu so >= 0 thi khong in dau tru    

    neg ax                         ; Chuyen sang so duong
    ; In dau tru
    mov dl, '-'
    call printCharacter            ; Goi ham in ky tu


not_negative:
    mov bl, 10
    mov cx, 0
startsplit:
    div bl                         ; Chia AX cho 10 de lay chu so
    push ax                        ; Day gia tri AX vao stack
    inc cx                         ; Tang bien dem CX
    cmp al, 0
    jz exitsplit                   ; Neu AX = 0 thi thoat vong lap
    xor ah, ah
    jmp startsplit
exitsplit:
 
startprint:
    pop ax                         ; Lay tung chu so tu stack ra
    mov dl, ah                     ; Dua chu so vao DL
    call printsingledigit           ; Goi ham in chu so
    loop startprint                ; Lap lai den khi het cac chu so
    
    pop dx
    pop cx
    pop bx
    pop ax
    ret
printnumber endp

; Ham printsingledigit: In mot chu so
printsingledigit proc
    push ax
    add dl, '0'                    ; Chuyen chu so sang ma ASCII
    mov ah, 2
    int 21h                        ; Goi ngat 21h de in ky tu
    pop ax
    ret
printsingledigit endp

; Ham printstring: In mot chuoi ky tu
printstring proc
    push ax
    mov ah, 9
    int 21h                        ; Goi ngat 21h de in chuoi
    pop ax
    ret
printstring endp

; Ham printcharacter: In mot ky tu
printcharacter proc
    push ax
    mov ah, 2
    int 21h                        ; Goi ngat 21h de in ky tu
    pop ax
    ret
printcharacter endp

end main
