; chuong trinh dau tien
;in 2 chuoi           

.model small ;chon bo nho small
.stack 100 ;kich thuoc ngan xep 100 bytes

.data  ;cac dong duoi data la khai bao
    crlf db 13,10, '$'     ;xuong dong va ve dau dong bang goi va kbao ntn
    hello db 'Hello world!$'
    hung db 'chao hung$'
    ; kbao 2 bien laf 2 chuoi nhu tren
    
.code
main proc ;ham main
    ;khoi tao ds
    mov ax, @data ; khoi dau thanh ghi ds
    mov ds, ax ; tro thanh ghi ds ve dau doan data
    
    ; hien thi chuoi dung ham 9 cua int 21h
    mov ah, 9   ;goi ham 09h cua ngat 21 in 1 xau ki tu
    
    lea dx, hello ; in chuoi trong bien hello
    int 21h  ;ket qua: Hello world!
    
    lea dx, crlf ; in dau enter va lui vao dau dong
    int 21h
    
    lea dx, hung ;tuong tu in ra chuoi hung
    int 21h  ;ket qua: chao hung
    
    ;tro ve dos dung ham 4ch cua int 21h
    mov ah, 4ch           
    int 21h
main endp ;ket thuc ham main
end ;kthuc ctrinh
    
     
    