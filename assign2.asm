section .data
str1: db "Enter a string:",0xA
len1: equ $-str1
str2: db "The length of string is:",0xA
len2 equ $-str2

section .bss
sent: resb 100
ans: resb 1

section .text
global _start
_start:

mov rax,01
mov rdi,01
mov rsi,str1
mov rdx,len1
syscall

mov rax,00
mov rdi,00
mov rsi,sent
mov rdx,200
syscall

dec rax
mov r8,ans
mov cx,16
up:
rol rax,4
mov bl,al
and bl,0Fh
cmp bl,09h
jbe l1
add bl,07H

l1:
add bl,30H
mov byte[r8],bl
inc r8
dec cx
jnz up

mov rax,01
mov rdi,01
mov rsi,ans
mov rdx,16
syscall

mov rax,60
mov rdi,00
syscall
