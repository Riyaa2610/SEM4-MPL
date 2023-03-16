section .data
str: db "enter data:"
len: equ $-str

str1: db "the numbers are:"
len1: equ $-str

section .bss
array: resq 85
count: resb 1

section .text

global _start:
_start:

;write instruction
mov rax,01
mov rdi,01
mov rsi,str
mov rdx,len
syscall

;read instruction
mov r8,array
mov byte[count],05h

L1:
mov rax,00
mov rdi,00
mov rsi,r8
mov rdx,17
syscall

add r8,17
dec byte[count]
jnz L1

mov rax,01
mov rdi,01
mov rsi,str1
mov rdx,len1
syscall

mov r8,array
mov byte[count],05h

L2:
mov rax,01
mov rdi,01
mov rsi,r8
mov rdx,17
syscall

add r8,17
dec byte[count]
jnz L2

;exit call
mov rax,60
mov rdi,00
syscall
