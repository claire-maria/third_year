.686                                ; create 32 bit code
.model flat, C                      ; 32 bit memory model
 option casemap:none                ; case sensitive
.data								; start of a data section
public g							; export variable g
g DWORD 4							; declare global variable g initialised to 4
.code								; start of a code section

.code
public		min
min: push	ebp							; push frame pointer
	 mov    ebp, esp				    ; update ebp
	 mov	eax, [ebp + 8]				; load a
	 mov	ebx, [ebp + 12]				;load b
	 mov	ecx, [ebp + 16]				; load c
	 cmp	eax, ebx					; compare a and b
	 JG		Nin							; jump if greater
	 mov	eax, ebx					; a = b
Nin: 
	 cmp	eax, ecx					;cmp b&c
	 JG		Lin							; jump if greater
	 mov    eax, ecx					; a = c
Lin:
	 mov    esp, ebp				   ; restore esp
     pop    ebp						   ; restore ebp
     ret    0						   ; return, min = eax
end
