#line 1 "C:/Users/User/Desktop/New folder/MyProject.c"
void main() {
 TRISB = 0x01;
 TRISA = 0x00;
 CMCON = 0x07;
 OPTION_REG = 0x00;
 INTCON.GIE = 1;
 INTCON.PEIE = 1;
 INTCON.INTE = 1;
 while (1) {
 PORTB.RB2 = 0;
 PORTA.RA0 = 1;
 PORTA.RA1 = 0;
 delay_ms(100);
 PORTA.RA0 = 0;
 PORTA.RA1 = 1;
 delay_ms(100);
 INTCON.INTF = 0;
 }
}
void interrupt() {
 if (INTCON.INTF) {
 PORTB.RB1 = 1;
 PORTB.RB2 = 0;
 delay_ms(100);
 PORTB.RB1 = 0;
 PORTB.RB2 = 1;
 delay_ms(100);
 INTCON.INTF = 0;
 }
}
