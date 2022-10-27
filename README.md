# Simple calculator in assembly

- możliwość wprowadzenia liczb dwucyfrowych
- wprowadzane liczby są wyświetlane cyfra po cyfrze
- liczby zatwierdzane przyciskiem ENTER po wprowadzeniu i zatwierdzeniu liczby ekran LCD jest czyszczony
- wykorzystanie stosu do przechowywania operatora i liczb
- wyświetlanie wyniku:
  - dodawania: BCD <0; 99>
  - odejmowania: BCD <-99; 99>
  - mnożenia: hex <0; FF>
  - dzielenia: ułamek (np. 17 : 5 = 3 2/5)
