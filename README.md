# Simple calculator in assembly

- possibility to enter two-digit numbers
- entered numbers are displayed digit by digit
- numbers confirmed by pressing ENTER after entering and confirming the number, the LCD screen is cleared
- the use of a stack to store an operator and numbers
- displaying the result:
   - addition: <a href="https://en.wikipedia.org/wiki/Binary-coded_decimal">BCD</a> <0; 99>
      - LCD shows: BCD+BCD=BCD
   - subtraction: <a href="https://en.wikipedia.org/wiki/Binary-coded_decimal">BCD</a> <-99; 99>
      - LCD shows: BCD-BCD=BCD
   - multiplication: hex <0; FFFF>
       - LCD shows: BCD*BCD=HEX
   - division: a fraction (e.g. 17: 5 = 3 2/5) (always: <0, 99> optional: <0; 99> <1; 99>/<2; 99>)
        - LCD shows: BCD:BCD=BCD or BCD:BCD=BCD BCD/BCD


<i>*code looks like shit but works fine 😆</i>

## Examples (DSM-51 emulator)

<center>
<img width="1075" alt="Zrzut ekranu 2022-10-27 o 10 08 15" src="https://user-images.githubusercontent.com/61777542/198228000-73894187-e750-44ff-ab3e-af3b692e7f11.png">
   
<img width="1071" alt="Zrzut ekranu 2022-10-27 o 10 09 02" src="https://user-images.githubusercontent.com/61777542/198228190-dc10ff1d-0cd3-4a13-9ad6-b2ac2e5afaab.png">
   
<img width="1072" alt="Zrzut ekranu 2022-10-27 o 10 10 23" src="https://user-images.githubusercontent.com/61777542/198228465-d8f584e2-e8fc-4df8-a107-8579dc55395c.png">

<img width="1072" alt="Zrzut ekranu 2022-10-27 o 10 10 52" src="https://user-images.githubusercontent.com/61777542/198228548-1e40dace-7e10-4927-b2de-5373a9e24a3f.png">
   
<img width="1074" alt="Zrzut ekranu 2022-10-27 o 10 11 23" src="https://user-images.githubusercontent.com/61777542/198228639-2f91ee7f-ad3b-4ca5-ad6c-b956e4d835bc.png">
</center>
