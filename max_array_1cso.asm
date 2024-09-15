;gia tri lon nhat trong mang cac so co 1 chu so
.model small
.stack 100h
.data
list db 1,2,3,9,5,9,7,8,0
.code
main proc
    ;khoi tao thanh ghi ds va es
    mov ax, @data
    mov ds, ax
    mov cx, 9
   lea si, list     ;dua gia tri dau tien cua chuoi vao si
    mov bl, [si]    ;dua dia chi si vao bl
    inc si          ;tang gia tri si them 1
   
   start:
    lodsb ;Load String Byte: nap 1 byte tu bo nho vào thanh ghi AL
    cmp bl, al ;so sanh al va bl
    jge bypass   ;nhay den bypass
    mov bl, al   ;neu al > bl thi gan bl = al
    bypass:
    loop start   ;lap
    
    ;in max
    add bl, '0'   ;ep kieu so ve kieu ki tu
    mov dl, bl   ;dua gia tri max vao dl
    mov ah ,2 ;in ra mh
    int 21h
    
    mov ah,4ch  ;kthuc ctr
    int 21h
main endp
end main