	TITLE Assignment One (Abhijeet_Chopra_Assign1.asm)
	
	; Name: Abhijeet Chopra
	; CWID: 50180612
	; Date: 20 Oct,16
	; Task: Assignment #1
	
	; Program Description: 
	; define A, B, C as 16-bit integers (i.e. WORDS)
	; initialize A=10, B=30, C=20
	; calculate A = max { A, B, C}  
	; this should work for all A, B, C, not only for the initial values 
	; display A 
	
	INCLUDE Irvine32.inc
	INCLUDE Macros.inc
	
	.DATA
	
	A1 WORD 10 				; defining and initializing A1
	B1 WORD 30 				; defining and initializing B1
	C1 WORD 20 				; defining and initializing C1	
	
	.CODE
	main PROC
	
	mov  EAX, 0 			; moving 0 to EAX to clear it 
	
	; printing A1, B1, C1
	;------------------------
	mWrite "A = " 			; writes string, uses Macros.inc
	mov  AX, A1 			; moving AX to A1 
    call WriteInt 			; displaying A
	mWriteLn " " 			; next line
	
	mWrite "B = " 			; writes string, uses Macros.inc
	mov  AX, B1 			; moving AX to A1 
    call WriteInt 			; displaying A
	mWriteLn " " 			; next line
	
	mWrite "C = " 			; writes string, uses Macros.inc
	mov  AX, C1 			; moving AX to A1 
    call WriteInt 			; displaying A
	mWriteLn " " 			; next line
	
	; comparing A and B
	;------------------------
	mov AX, B1 				; moving B1 to AX
	cmp A1,AX 				; if (A > B)
	ja LAB					; jump to L1
	
	jmp LBA 				; else jump to L2
	
	; L1 : A1 > B1
	;------------------------
	LAB:
		
	mov AX, C1 				; moving C1 to AX
	cmp A1,AX 				; if (A > C)
	ja LABC 				; jump to L3 
	
	jmp LCAB 				; else jump to L4
	
	; L2 : B1 > A1
	;------------------------
	LBA:
	
	mov AX, C1 				; moving C1 to AX
	cmp B1,AX 				; if (B > C)
	ja LBAC					; jump to L5
	
	jmp LCBA 				; else jump to L6
	
	; L3 : A is MAX
	;------------------------
	LABC:
	
	mov  AX, A1 			; moving A1 to AX
	jmp LEND 				; else jump to LEND
	
	; L4 : C is MAX
	;------------------------
	LCAB:
	
	mov  AX, C1 			; moving C1 to AX
	jmp LEND 				; else jump to LEND
	
	; L5 : B is MAX
	;------------------------
	LBAC:
	
	mov  AX, B1 			; moving B1 to AX
	jmp LEND 				; else jump to LEND

	; L6 : C is MAX
	;------------------------
	LCBA:

	mov  AX, C1 			; moving C1 to AX
	jmp LEND 				; else jump to LEND
	
	; END
	;------------------------
	LEND:
	
	mWriteLn " " 			; writes string followed by end of line, uses Macros.inc
	mWrite "MAX = " 		; writes string, uses Macros.inc
	mov  A1, AX 			; moving AX to A1 
    call WriteInt 			; displaying A
	mWriteLn " " 			; writes string followed by end of line, uses Macros.inc
	
	exit
	main ENDP
	END main