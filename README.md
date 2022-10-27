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


<i>*code looks like shit but works fine 😆</i>

## Examples

<center>
<img width="1075" alt="Zrzut ekranu 2022-10-27 o 10 08 15" src="https://user-images.githubusercontent.com/61777542/198228000-73894187-e750-44ff-ab3e-af3b692e7f11.png">
</center>
