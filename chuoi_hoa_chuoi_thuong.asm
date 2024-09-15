; nhap 1 chuoi thanh chuoi thuong va chuoi hoa
.model small
.stack 100h
.data

str db 256 dup('$')  ;khoi tao chuoi str
tb1 db 10, 13, 'Chuyen sang chuoi in thuong: $'
tb2 db 10,13, 'Chuyen sang chuoi in hoa: $'

.code
main proc
    mov ax, @data
    mov ds, ax  ;khoi tao thanh ghi ds
    
    ;nhap chuoi
    lea dx, str   ;tro den dia chi chuoi str
    mov ah, 10  ;nhap xau ngat 10
    int 21h
    
    ;chuoi thuong
    mov ah, 9
    lea dx, tb1 
    int 21h
    call inthuong   ;goi ham in thuong
    
    ;chuoi hoa
    mov ah, 9
    lea dx, tb2 
    int 21h
    call inhoa    ;goi ham in hoa
    
    mov ah,4ch
    int 21h
main endp

;cac ham

inthuong proc
    lea si, str +2
    lap1:  ;1 xau: kiem tra tung ki tu mot
        mov dl, [si]
        cmp dl ,'A' ;so sanh
        jl in1 ;nhay ve truoc
        cmp dl, 'Z' ;so sanh
        jg in1 ;nhay ve sau
        add dl, 32 ;chuyen ki tu hoa thanh thuong
    in1:
        mov ah, 2 ;in ki tu
        int 21h
        inc si    ;tang
        cmp [si] , '$'   ;so sanh
        jne lap1  ;nhay neu ko bang
    ret  ;return
inthuong endp

inhoa proc
    lea si, str +2
    lap2:
        mov dl, [si]
        cmp dl, 'a'
        jl in2
        cmp dl, 'z'
        jg in2
        sub dl, 32 ;chuyen ki tu hoa thanh ki tu thuong
    in2:
        mov ah, 2
        int 21h
        inc si
        cmp [si], '$'
        jne lap2
    ret
inhoa endp
end