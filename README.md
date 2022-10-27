# Simple calculator in assembly

- possibility to enter two-digit numbers
- entered numbers are displayed digit by digit
- numbers confirmed by pressing ENTER after entering and confirming the number, the LCD screen is cleared
- the use of a stack to store an operator and numbers
- displaying the result:
   - addition: BCD <0; 99>
   - subtraction: BCD <-99; 99>
   - multiplication: hex <0; FFFF>
   - division: a fraction (e.g. 17: 5 = 3 2/5) (always: <0, 99> optional: <0; 99> <1; 99>/<2; 99>)
