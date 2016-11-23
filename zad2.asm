;************************************************************
extern printf;												*
;************************************************************

;************************************************************
section .text;												*
;-----------------------------------------------------------*
global main;												*
main:;														*
_loop:;														*
	call _pobierz_znak;										*
	call _licz;												*
;															*	
	mov al, [znak];											*
	cmp al, '.'; zdanie kończy się kropką!!!				*
	je _koniec;												*
;															*
	jmp _loop;												*
;************************************************************

;************************************************************	
_licz:;														*
	mov al, [znak];											*
	cmp al, 'a';											*
	jne _licz_koniec;										*
	mov eax, [ilosc];										*
	inc eax;												*
	mov [ilosc], eax;										*
	jmp _licz_koniec;										*
;-----------------------------------------------------------*
_licz_koniec:;												*
	ret;													*
;************************************************************

;************************************************************
_pobierz_znak:;												*
	mov rax, 3;												*
	mov rbx, 1;												*
	mov rcx, znak;											*
	mov rdx, 1;												*
	int 80h;												*
	ret;													*
;************************************************************

;************************************************************	
_koniec:;													*
	xor rax, rax;											*
	mov eax, [ilosc];										*
	call _wypisz;											*
	jmp _exit;												*
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
	znak:	db 0;											*
	ilosc:	dd	0;											*
	format_out:	db	'Ilość liczb: %d',10,0;					*
;************************************************************

