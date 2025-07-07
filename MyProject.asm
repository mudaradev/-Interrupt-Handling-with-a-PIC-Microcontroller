
_main:

;MyProject.c,1 :: 		void main() {
;MyProject.c,2 :: 		TRISB = 0x01;
	MOVLW      1
	MOVWF      TRISB+0
;MyProject.c,3 :: 		TRISA = 0x00;
	CLRF       TRISA+0
;MyProject.c,4 :: 		CMCON = 0x07;
	MOVLW      7
	MOVWF      CMCON+0
;MyProject.c,5 :: 		OPTION_REG = 0x00;
	CLRF       OPTION_REG+0
;MyProject.c,6 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;MyProject.c,7 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;MyProject.c,8 :: 		INTCON.INTE = 1;
	BSF        INTCON+0, 4
;MyProject.c,9 :: 		while (1) {
L_main0:
;MyProject.c,10 :: 		PORTB.RB2 = 0;
	BCF        PORTB+0, 2
;MyProject.c,11 :: 		PORTA.RA0 = 1;
	BSF        PORTA+0, 0
;MyProject.c,12 :: 		PORTA.RA1 = 0;
	BCF        PORTA+0, 1
;MyProject.c,13 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;MyProject.c,14 :: 		PORTA.RA0 = 0;
	BCF        PORTA+0, 0
;MyProject.c,15 :: 		PORTA.RA1 = 1;
	BSF        PORTA+0, 1
;MyProject.c,16 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;MyProject.c,17 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;MyProject.c,18 :: 		}
	GOTO       L_main0
;MyProject.c,19 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,20 :: 		void interrupt() {
;MyProject.c,21 :: 		if (INTCON.INTF) {
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt4
;MyProject.c,22 :: 		PORTB.RB1 = 1;
	BSF        PORTB+0, 1
;MyProject.c,23 :: 		PORTB.RB2 = 0;
	BCF        PORTB+0, 2
;MyProject.c,24 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_interrupt5:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt5
	DECFSZ     R12+0, 1
	GOTO       L_interrupt5
	DECFSZ     R11+0, 1
	GOTO       L_interrupt5
	NOP
;MyProject.c,25 :: 		PORTB.RB1 = 0;
	BCF        PORTB+0, 1
;MyProject.c,26 :: 		PORTB.RB2 = 1;
	BSF        PORTB+0, 2
;MyProject.c,27 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_interrupt6:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt6
	DECFSZ     R12+0, 1
	GOTO       L_interrupt6
	DECFSZ     R11+0, 1
	GOTO       L_interrupt6
	NOP
;MyProject.c,28 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;MyProject.c,29 :: 		}
L_interrupt4:
;MyProject.c,30 :: 		}
L_end_interrupt:
L__interrupt9:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
