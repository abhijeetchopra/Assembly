	TITLE Assignment Two (Assign2.asm)
	
	; Name: Abhijeet Chopra
	; CWID: 50180612
	; Date: 4 Nov,16
	; Due : 11:59pm, Tuesday, 15 Nov
	
	; Program Description: 
	; define arrayW of 20 words (integers)
	; using loop find MIN
	; at end of loop store MIN in AX
	
	INCLUDE Irvine32.inc
	INCLUDE Macros.inc
	
	.DATA
	; declaring and initializing array of type WORD (2 bytes / item)
	arrayW WORD 3, 2, 5, 7, 2, 9, 11, 32, 19, 18, 17, 15, 5, 2, 3, 1, 21, 27, 29, 20
	
	LEN WORD 0 					; stores array length
	IND WORD 1 					; stores array index 
	MIN WORD 0 					; stores the largest number
	
	.CODE
	main PROC
	
	mWriteLn "---------------------"
	mWriteLn "Name: Abhijeet Chopra"
	mWriteLn "CWID: 50180612"
	mWriteLn "Desc: Assignment #2"
	mWriteLn "Date: 4 Nov,16"
	mWriteLn "---------------------"
	mWriteLn " "
	
	mov EAX, 0 					; EAX = 0 (clearing EAX)
	mov LEN,LENGTHOF arrayW 	; LEN = length of arrayW
	mov ESI,OFFSET arrayW 		; ESI = address of first item of arrayW
	mov AX,[ESI] 				; AX = first item of arrayW
	mov MIN,AX 					; MIN = AX
	mov AX,0 					; AX = 0 (clearing AX)
	
	mWriteLn "Displaying Array: "
	mWriteLn " "
	mWrite "  "
	
	; print arrayW, find MIN
	;------------------------
	L1: 						; loop L1 prints arrayW and finds MIN
	cmp IND,LENGTHOF arrayW		; compare if IND > no. of items in arrayW
	jg L3 						; exit loop if IND > length of arrayW
	mov AX,[ESI] 				; dereference ESI
	call WriteInt				; print value of AX
	mWrite "," 					; print a comma to separate items
	cmp AX,MIN 					; compare if AX < MIN 
	jl L2 						; jump to L2 to update MIN
	inc ESI 					; increment ESI twice because...
	inc ESI 					; WORD array so = 2 bytes / item
	inc IND 					; increment the loop counter
	jmp L1 						; loop the loop
	
	; update MIN
	;------------------------
	L2: 						; loop to update new MIN
	mov MIN,AX 					; MIN = AX
	jmp L1 						; return to loop L1
	
	; exit
	;------------------------
	L3: 						; exit from loop L1 
		
	mWriteLn " " 				; next line
	mWriteLn " " 				; next line
	mWriteLn "Displaying AX register: "
	mWriteLn " "
	mWrite "  MIN = "
	mov EAX,0 					; EAX = 0
	mov AX,MIN 					; AX = MIN
	call WriteInt 				; print AX
	
	mWriteLn " "
	mWriteLn " "
	
	mWriteLn "Displaying all registers: (Note: all values below in hexadecimal)"
	
	call DumpRegs
	
	exit
	main ENDP
	END main