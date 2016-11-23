;************************************************************
extern printf;												*
extern scanf;												*
;************************************************************

;************************************************************
section .text;												*
;-----------------------------------------------------------*
global main;												*
main:;														*
	call _pobierz;											*
	call _parzyste;											*
	jmp _exit;												*
;************************************************************

;************************************************************
_parzyste:;													*
	mov eax, [ilosc];										*
	cmp eax, 0;												*
	jg ._parzyste_pisz;										*
	jmp ._parzyste_koniec;									*
;-----------------------------------------------------------*
._parzyste_pisz:;											*
	mov eax, [ilosc];										*
	dec eax;												*
	mov [ilosc], eax;										*
;															*
	xor rax, rax;											*
	mov rax, [liczba];										*
	call _wypisz;											*
;															*
	mov eax, [liczba];										*
	add eax, 2;												*
	mov [liczba], eax;										*
;															*
	jmp _parzyste;											*
._parzyste_koniec:;											*
	ret;													*
;************************************************************

;************************************************************
_pobierz:;													*
	xor rax, rax;											*
	mov rsi, ilosc;											*
	mov rdi, format_in;										*
	call scanf;												*
	ret;													*
;************************************************************

;************************************************************
; rax - liczba do wypisania(wartość)			 			*
;-----------------------------------------------------------*	
_wypisz:;													*
	mov rsi, rax;											*
	mov rdi, format_out;									*
	xor rax, rax;											*
	call printf;											*
	ret;													*
;************************************************************

;************************************************************
_exit:;														*
	mov rax, 1;												*
	mov rbx, 0;												*
	int 80h;												*
;************************************************************

;************************************************************
section .data;												*
;-----------------------------------------------------------*
	liczba:	dd 0;											*
	ilosc:	dd	0;											*
	format_out:	db	'%d',10,0;								*
	format_in:	db	'%d',0;									*
;************************************************************

