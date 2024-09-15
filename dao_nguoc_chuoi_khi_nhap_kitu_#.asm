; in chuoi dao nguoc khi nhap vao ki tu #

;enter la 13. esc la 27
.model small
.stack 100h
.data
    str db 50 dup('$') ;khoi tao chuoi 50 bytes 
.code
main proc
    mov ax, @data
    mov ds, ax  ;khoi tao thanh ghi ds
    mov cx, 0 ; gan gia tri chi thanh ghi cx =0
   start:
    inc cx  ;increase tang cx len 1
    mov ah ,1  ; nhap 1 ki tu
    int 21h                                   
      
    cmp al, '#'  ;so sanh al voi ki tu # -> enter la 13  
    je end  ;jump equal: nhay den end neu =
    push ax ;them ptu vao ngan xep
    jmp start ;nhay k dkien  
    
   end:  
    mov ah, 2 ;in ki tu
    mov dl, 0 ;in dau cach
    int 21h
    
    dec cx ;decrease tru cx di 1
    pop dx ;lay ptu o dinh ngan xep dua vao dx
    mov ah, 2; in ki tu
    int 21h
    
    cmp cx,1 ;so sanh cx voi 1
    jne end; jump not equal: nhay den end neu ko = 
    
    ;ve dos
    mov ah, 4ch
    int 21h
main endp
end

   
    