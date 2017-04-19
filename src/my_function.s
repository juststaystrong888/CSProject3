
;This program accepts input from PORTC with 0-3 bits encoding a number from 0-15
;It writes the output of my piece-wise function to PORTB by the 0-3 bits encoding a number from 0 to 15. The input from PORTC is 15, if it less than 12, then program subtracts this number from 12 and output to PORTB the bits encoding a number from 0-15.
;Otherwise input is greater than 12 and program subtracts 6 from the input. It writes the output to PORTB using the lower 4 bits encoding a number from 0 to 15.
.equ SREG, 0x3f ; define SREG label
.equ DDRB, 0x04 ;specify Data Direction Register for PORTB
.equ PORTB, 0x05 ;define PORTB label
.equ DDRC, 0x07 ;Define Data Direction Register for PORTC
.equ PINC, 0x06 ;PINC label
.org 0 ;specify the start address

main:      ldi r16,0 ;set register r16 to zero
           out SREG,r16 ; copy contents of r16 to SREG
          ;configure PORTB for output
           ldi r16, 0x0F ;copies hexadecimal 0x0F to r16
           out DDRB,r16 ; writes r16 to DDRB, setting up bits 0 to 3 in output mode
           ;configure PORTC for input
           ldi r16, 0xF0;copies hexadecimal 0x0F to r16
           out DDRC, r16 ; writes r16 to DDRC, setting up bits 0 to 3 in output mode

           in r16,PINC ;reads from external pins of PORTC to r16
 
           cpi r16, 12; compare r16 with 12
           brlo lessthan ;branch if r16 less than 12
           ldi r17,6 ;set register r17 to 6
           sub r16,r17; r16=r16-17=r16-6
           out PORTB,r16 ; writes contents of r16 to PORTB

rjmp mainloop ;jump back to mainloop address

;if r16 less than 12 then

lessthan:  ldi r18,12        ;set register r18 to 12
           sub r18,r16       ;r18 to r18=r18-r16=12-r16
           out PORTB,r18     ;writes contents of r18 to PORTB


           
           

mainloop: rjmp mainloop ;jump back to mainloop address






