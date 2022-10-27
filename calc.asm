	LJMP START
	ORG	100H
START:
	LCALL LCD_INIT
	
	MOV SP, #07H

	;pierwsza liczba
	LCALL WAIT_KEY
	PUSH ACC
	LCALL WRITE_HEX
	
	LCALL WAIT_KEY
	PUSH ACC
	LCALL WRITE_HEX
	
	LCALL WAIT_ENTER_NW
	LCALL LCD_CLR
	
	;druga liczba
	LCALL WAIT_KEY
	PUSH ACC
	LCALL WRITE_HEX
	
	LCALL WAIT_KEY
	PUSH ACC
	LCALL WRITE_HEX
	
	LCALL WAIT_ENTER_NW
	LCALL LCD_CLR

	;operacja matematyczna
	LCALL WAIT_KEY

	CJNE A, #10, ODE ;sprawdz czy dodawanie
	
	;jednosc liczba 2
	POP ACC 
	MOV R1, A
	
	;dziesiatka liczba 2
	POP ACC
	MOV R2, A
	
	;jednosc liczba 1
	POP ACC
	MOV R3, A

	;dziesiatka liczba 1
	POP ACC
	MOV R4, A
	
	MOV A, R4
	MOV B, #10
	MUL AB
	ADD A, R3
	MOV R4, A

	;wyswietlanie liczby w bcd
	MOV B,#10
	DIV AB
	SWAP A
	ORL A, B
	LCALL WRITE_HEX

	;znak +
	MOV A, #'+'
	LCALL WRITE_DATA
	
	MOV A, R2
	MOV B, #10
	MUL AB
	ADD A, R1
	MOV R2, A
	
	;wyswietlanie liczby w bcd
	MOV B,#10
	DIV AB
	SWAP A
	ORL A, B
	LCALL WRITE_HEX

	;znak =
	MOV A, #'='
	LCALL WRITE_DATA

	;dodawanie liczb
	MOV A, R2
	ADD A, R4

	;wyswietlanie liczb w bcd
	MOV B,#10
	DIV AB
	SWAP A
	ORL A, B
	LCALL WRITE_HEX
	LJMP KON
ODE:
	CJNE A, #11, MNO ;sprawdz czy odejmowanie

	;jednosc liczba 2
	POP ACC 
	MOV R1, A
	
	;dziesiatka liczba 2
	POP ACC
	MOV R2, A
	
	;jednosc liczba 1
	POP ACC
	MOV R3, A

	;dziesiatka liczba 1
	POP ACC
	MOV R4, A
	
	MOV A, R4
	MOV B, #10
	MUL AB
	ADD A, R3
	MOV R4, A

	;wyswietlanie liczby w bcd
	MOV B,#10
	DIV AB
	SWAP A
	ORL A, B
	LCALL WRITE_HEX

	;znak -
	MOV A, #'-'
	LCALL WRITE_DATA
	
	MOV A, R2
	MOV B, #10
	MUL AB
	ADD A, R1
	MOV R2, A
	
	;wyswietlanie liczby w bcd
	MOV B,#10
	DIV AB
	SWAP A
	ORL A, B
	LCALL WRITE_HEX

	;znak =
	MOV A, #'='
	LCALL WRITE_DATA

	;odejmowanie liczb
	CLR C
	MOV B, #0
	MOV A, R4
	SUBB A, R2
	MOV R5, A

	;wyswietlanie liczb w bcd
	JB ACC.7, MINUS

	MOV B,#10
	DIV AB
	SWAP A
	ORL A, B
	LCALL WRITE_HEX
	LJMP KON
MNO:
	CJNE A, #12, DZI ;sprawdz czy mnozenie

	;jednosc liczba 2
	POP ACC 
	MOV R1, A
	
	;dziesiatka liczba 2
	POP ACC
	MOV R2, A
	
	;jednosc liczba 1
	POP ACC
	MOV R3, A

	;dziesiatka liczba 1
	POP ACC
	MOV R4, A
	
	MOV A, R4
	MOV B, #10
	MUL AB
	ADD A, R3
	MOV R4, A

	;wyswietlanie liczby w bcd
	MOV B,#10
	DIV AB
	SWAP A
	ORL A, B
	LCALL WRITE_HEX

	;znak *
	MOV A, #'*'
	LCALL WRITE_DATA
	
	MOV A, R2
	MOV B, #10
	MUL AB
	ADD A, R1
	MOV R2, A
	
	;wyswietlanie liczby w bcd
	MOV B,#10
	DIV AB
	SWAP A
	ORL A, B
	LCALL WRITE_HEX

	;znak =
	MOV A, #'='
	LCALL WRITE_DATA

	;mnozenie liczb
	MOV A, R2
	MOV B, R4
	MUL AB
	MOV R5, B
	MOV R6, A

	;wyswietlanie liczby w hex
	MOV A, R5
	LCALL WRITE_HEX
	MOV A, R6
	LCALL WRITE_HEX
	LJMP KON
MINUS:
	;sprytna funkcja na minus przed liczba
	CLR C
	SUBB A, #1
	CPL A
	MOV R5, A
	MOV A, #'-'
	LCALL WRITE_DATA
	
	;wyswietlanie liczb w bcd
	MOV A, R5
	MOV B,#10
	DIV AB
	SWAP A
	ORL A, B

	LCALL WRITE_HEX
	LJMP $
	NOP
DZI:
	CJNE A, #13, STA ;sprawdz czy dzielenie

	;jednosc liczba 2
	POP ACC 
	MOV R1, A
	
	;dziesiatka liczba 2
	POP ACC
	MOV R2, A
	
	;jednosc liczba 1
	POP ACC
	MOV R3, A

	;dziesiatka liczba 1
	POP ACC
	MOV R4, A
	
	MOV A, R4
	MOV B, #10
	MUL AB
	ADD A, R3
	MOV R4, A

	;wyswietlanie liczby w bcd
	MOV B,#10
	DIV AB
	SWAP A
	ORL A, B
	LCALL WRITE_HEX

	;znak :
	MOV A, #':'
	LCALL WRITE_DATA
	
	MOV A, R2
	MOV B, #10
	MUL AB
	ADD A, R1
	MOV R2, A
	
	;wyswietlanie liczby w bcd
	MOV B,#10
	DIV AB
	SWAP A
	ORL A, B
	LCALL WRITE_HEX

	;znak =
	MOV A, #'='
	LCALL WRITE_DATA

	;dzielenie liczb
	MOV A, R4
	MOV B, R2
	DIV AB

	;zapisz z rejestru B
	MOV R5, B

	;wyswietlanie liczb w bcd
	MOV B,#10
	DIV AB
	SWAP A
	ORL A, B
	LCALL WRITE_HEX

	;sprawdzanie czy akumulator != 0 (JNZ)
	MOV A, R5
	JNZ MIANOWNIK

	LJMP KON
MIANOWNIK:
	;znak ' '
	MOV A, #' '
	LCALL WRITE_DATA

	;wyswietlanie reszty w bcd
	MOV A, R5
	MOV B,#10
	DIV AB
	SWAP A
	ORL A, B
	LCALL WRITE_HEX

	;znak /
	MOV A, #'/'
	LCALL WRITE_DATA

	;wypisz mianownik
	MOV A, R2
	MOV B,#10
	DIV AB
	SWAP A
	ORL A, B
	LCALL WRITE_HEX
KON:
	LCALL WAIT_KEY
	LJMP START
STA:
	LJMP START
STOP:
	LJMP STOP
	NOP