option casemap:none             ; case sensitive
;_int64 v = a;
;if (b < v)
;v = b;
;if (c < v)
;v = c;
;return v;
}
.data ; start of a data section
public g ; export variable g
g DWORD 4 ; declare global variable g initialised to 4
.code ; start of a code section

public  min
min:	push rbx
		mov rax, rcx	; a
		mov rbx, rdx	; b
		mov r10, r8		; c
		cmp	rax, rbx	; if(a>b)
		jge	greater1	; jump
		mov rax, rbx
greater 1:
		cmp rax, rcx
		jge greater2	
		mov rax, rcx
greater2:
		pop rbx
		ret 0 
		