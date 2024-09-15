;nhap ki tu thuong -> ki tu hoa

.model small
.stack 100h
.data
    tb db 13,10, 'Chuyen sang ki tu hoa la: $'
    char db ?, '$'
.code
main proc
    mov ax, @data
    mov ds, ax
    ;nhap vao 1 ki tu thuong
    mov ah,1   ;su dung ngat 1 cua ngat int 21h de doc 1 ki tu luu vao al
    
    int 21h
    sub al, 20h    ;doi thanh ki tu hoa
    mov char, al ;gan gia tri vua nhap (luu o al) vao bien char
    
    ;in ra thong bao
    lea dx, tb
    mov ah,9
    int 21h
    
    lea dx, char
    mov ah, 9
    int 21h
    
    ;ket thuc ctrinh
    mov ah, 4ch
    int 21h
    
main endp 
end main

 
    
    