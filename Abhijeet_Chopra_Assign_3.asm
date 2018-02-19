	TITLE Assignment Three (Assign3.asm)
	
	; Name: Abhijeet Chopra
	; CWID: 50180612
	; Date: 17 Nov,16
	; Due : 11:59pm, Wednesday, 30 Nov
	
	; Program Description: 
	; 
	; Step1: Write an assembly procedure which computes the following:
	; int f(n)  /* n is a positive integer */
	; if (n<=3) return 1;
	; /* else */
	; return 3*f(n-1)+2*f(n-2)+f(n-3);
	; 
	; Step 2: After completing Step 1, write an assembly program that computes and displays in a separate line the following:
	; i 	f(i)
	; for all integers i, from i=1 to 15.
	; The initial part of the output will look as the following:
	; 
	; 1		1
	; 2		1
	; 3		1
	; 4		6
	; 5		21
	; 6		76
	; 7		276
	;   . . .
	; 

	
	INCLUDE Irvine32.inc
	INCLUDE Macros.inc
	
	.DATA
	
	.CODE
		main PROC		
			call Clrscr			; clears console
			;call Crlf			; writes end of line sequence to standard output
			
			mWriteLn "---------------------"
			mWriteLn "Name: Abhijeet Chopra"
			mWriteLn "CWID: 50180612"
			mWriteLn "Desc: Assignment #3"
			mWriteLn "Date: 17 Nov,16"
			mWriteLn "---------------------"
			mWriteLn " "
			
			call ClearRegs
			
			mov eax,6
			
			;call DumpRegs		; for testing
			;call DumpRegsInt
			
			call abhi
			
			;call DumpRegsInt	; for testing
			;call DumpRegs
			
			call PrintResult
			
			exit
		main ENDP
		
		
		;------------------------
		abhi PROC USES eax ecx edx
		;
		; Description	: Recursive procedure receives n in EAX and calculates and returns f(n) in EBX
		; Receives		: EAX
		; Returns		: EBX
		; Requires		: 
			
			;mWriteLn "Procedure abhi called!"
			;mov edx,0
			
			.IF eax <= 3
				;mWriteLn "IF"
				; return 1
				mov ebx,1
				;call DumpRegsInt
			.ELSE
				;mWriteLn "ELSE"
				; return 3*f(n-1)+2*f(n-2)+f(n-3)
				
				; 3*f(n-1)
				sub eax,1		; eax = n-1
				call abhi		; ebx = f(n-1)
				
				push eax
				mov eax,3
				mul ebx			; ebx = 3*f(n-1)
				mov ebx,eax
				pop eax
				
				push ebx		; stack = 3*f(n-1)
				
				; 2*f(n-2)
				sub eax,1		; eax = n-2
				call abhi		; ebx = f(n-2)
				
				push eax
				mov eax,2
				mul ebx			; ebx = 2*f(n-2)
				mov ebx,eax
				pop eax
				
				push ebx		; stack = 2*f(n-2)
				
				; f(n-3)
				sub eax,1		; eax = n-3
				call abhi		; ebx = f(n-3)
				
				pop edx			; edx = 2*f(n-2)
				add ebx,edx		; ebx = 2*f(n-2)+f(n-3)
				pop edx			; edx = 3*f(n-3)
				add ebx,edx		; ebx = 3*f(n-1)+2*f(n-2)+f(n-3)
				
				;call DumpRegsInt
			.ENDIF
			
			ret
		abhi ENDP
		
		;------------------------
		DumpRegsInt PROC
		;
		; Description	: Prints integer value of registers on console
		; Receives		: EAX,EBX,ECX,EDX,ESI,EDI
		; Returns		: nothing
		; Requires		: 
		
			push eax
			call crlf
			
			mWrite "  EAX = "
			call WriteInt
			call crlf
			
			mWrite "  EBX = "
			mov eax,ebx
			call WriteInt
			call crlf
			
			mWrite "  ECX = "
			mov eax,ecx
			call WriteInt
			call crlf
			
			mWrite "  EDX = "
			mov eax,edx
			call WriteInt
			call crlf
			
			mWrite "  ESI = "
			mov eax,esi
			call WriteInt
			call crlf
			
			mWrite "  EDI = "
			mov eax,edi
			call WriteInt
			call crlf
			
			call crlf
			pop eax
		ret
		DumpRegsInt ENDP
		
		
		;------------------------
		ClearRegs PROC
		;
		; Description	: Clears all registers 
		; Receives		: nothing
		; Returns		: nothing
		; Requires		: EAX,EBX,ECX,EDX,ESI,EDI

			mov eax,0
			mov ebx,0
			mov ecx,0
			mov edx,0
			mov esi,0
			mov edi,0
		
		ret
		ClearRegs ENDP
		
		;------------------------
		PrintResult PROC uses EAX EBX ECX EDX ESI EDI
		;
		; Description	: Prints n and f(n) from n = 1 to 15
		; Receives		: 
		; Returns		: 
		; Requires		: abhi

			call ClearRegs
			
			mWriteLn "n  f(n)"
			mWriteLn "------------"
			
			L1:
				inc ecx			; incrementing ECX
				cmp ecx,15		; compare ECX with 15
				jg L2			; jump to L2 if ECX > 15
				
				mov eax,ecx		; EAX = ECX
				call WriteDec	; print EAX = ECX = n
				
				call abhi		; call procedure abhi and evaluate f(ECX)
				
				mWrite "  "
				
				mov eax,ebx		; EAX = EBX
				call WriteDec	; print EAX = EBX = f(ECX) = f(n)
				
				call crlf
				jmp L1			; unconditional jump to L1
			L2:
			
		ret
		PrintResult ENDP
		
	END main