;nhap 1 chuoi va in ra chuoi dao nguoc

.model small
.stack 100
.data
    str db 50 dup('$')  ;str gom 50 bytes chua 50 gtri kdau
    tb db 10, 13,'Chuoi sau khi dao nguoc: $'
.code
main proc
    mov ax, @data
    mov ds, ax ;khoi tao thanh ghi ds
    
    ;nhap vao xau ki tu
    lea dx, str
    mov ah, 10   ;0ah
    int 21h
    
    ;in ra chuoi thg bao
    lea dx, tb
    mov ah,9
    int 21h
    
    ; vd: 123456789 -> len =9
    mov cl,[str+1]   ;chuyen chieu dai chuoi vua nhap vao cl
    lea si, [str +2]  ;dua si tro vao ptu t2 cua mang la ki tu dau tien duoc nhap
    lap1: ;day cac ki tu vao ngan xep
        push [si] ;dua ptu ma si dang tro den dau ngan xep
        inc si ;tang gia tri si len 1
        loop lap1
        
    mov cl, [str +1]  ;chuyen chieu dai chuoi vua nhap vao cl
    lap2: ;lay du lieu tu ngan xep
        pop dx ;lay gtri tren dinh ngan xep dua vao dx
        mov ah, 2 ;in ra ki tu vua lay
        int 21h
        loop lap2
        
    ;tro ve dos dung ham 4 ch cua int 21h
    mov ah, 4ch
    int 21h
main endp
end main
        
    
    
    
