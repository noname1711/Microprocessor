; nhap 1 ki tu va xuat ra tren man hinh

.model small
.stack 
.data
    text1 db "Nhap 1 ki tu: $"  
    text2 db 13,10, "Ky tu da nhap: $"
    output db ? ;khoi tao bien kytu khong co gia tri ban dau
.code  
main proc
    mov ax, @data ;khoi dau thanh ghi ds
    mov ds, ax  ;tro thanh ghi ds ve dau doan data
    
    ;in ra man hinh text1
    lea dx, text1 ;dat con tro toi dia chi text1
    mov ah,9 ;su dung ham ngat 9 cua ngat int 21h
    int 21h
    
    ;nhap 1 ki tu tu ban phim 
    mov ah, 1 ;su dung ham ngat 1 cua ngat int 21h
    int 21h
    mov output, al  ;gan gia tri vua nhap (duoc luu o al) vao bien kytu
    
    ;in ta man hinh text2
    lea dx, text2
    mov ah, 9
    int 21h
    
    ;hien thi ki tu da nhap
    mov ah, 2   ;su dung ham ngat 2 cua ngat int 21h
    mov dl , output ;hien thi ra man hinh kytu da luu o dl
    int 21h
    
    ;ve dos
    mov ah, 4ch
    int 21h
main endp
end
    
    
    
   
    