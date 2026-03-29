#set page(paper: "a4", margin: 2.5cm)
#set text(font: "Times New Roman", size: 11pt)
#set par(justify: true)

#set heading(numbering: "1.1")

#show heading.where(level: 1): it => [
  #v(1.5em)
  #text(weight: "bold", size: 16pt)[
    #counter(heading).display() #it.body
  ]
  #v(0.5em)
]

#show heading.where(level: 2): it => [
  #v(1.2em)
  #text(weight: "bold", style: "italic", size: 14pt)[
    #counter(heading).display() #it.body
  ]
  #v(0.5em)
]

#show heading.where(level: 3): it => [
  #v(1em)
  #text(weight: "bold", size: 12pt)[
    #counter(heading).display() #it.body
  ]
  #v(0.5em)
]

#let bg-gray = rgb("e5e5e5")

// ==========================================
//             METRYKA
// ==========================================

#table(
  columns: (1fr, 1fr, 1fr),
  align: left,
  stroke: 0.5pt + black,
  [
    *Numer zlecenia oraz nazwa i akronim projektu:* \
    _Grafiko-Inator, GI_
  ],
  [
    *Zleceniodawca:* \
    _Spółka Zło Dundersztyca_
  ],
  table.cell(rowspan: 2)[
    *Zleceniobiorca:* \
    #align(center)[
      #image("pjatk_logo.png", width: 60%) 
    ]
  ],
  [
    *Zespół projektowy:* \
    _Ksawery Chabowski, Gerald Serafin_
  ],
  [
    *Kierownik projektu:* \
    _Ksawery Chabowski_
  ],
  [
    *Nazwa dokumentu:* \
    _Dokument Założeń Wstępnych (Dostosowany do SWS)_
  ],
  [
    *Odpowiedzialny za dokument:* \
    _Gerald Serafin_
  ],
  [
    *Opiekun projektu:* \
    _Grzegorz Cysewski_
  ]
)

#v(1em)

// ==========================================
//             HISTORIA DOKUMENTU
// ==========================================

#align(center)[*Historia dokumentu*]
#table(
  columns: (auto, 1fr, auto, auto, auto),
  align: (col, row) => if row == 0 { center } else { left },
  stroke: 0.5pt + black,
  [*Wersja*], [*Opis modyfikacji*], [*Rozdział / strona*], [*Autor modyfikacji*], [*Data*],
  [0.1], [Wersja wstępna], [Wszystko], [Chabowski, Ksawery], [29.03.2026]
)

#v(1.5em)

*Opis etapu:* Celem etapu jest udokumentowanie procesu i podjętych decyzji związanych ze zbieraniem, przetwarzaniem i analizowaniem wymagań.

#v(1em)

*Oczekiwane produkty:* Specyfikacja wymagań systemowych w postaci dokumentu o strukturze według poniższego szablonu.

// ==========================================
//             TREŚĆ DOKUMENTU
// ==========================================

= Wprowadzenie – o dokumencie
== Cel dokumentu
Zapewnienie ciągłości obsadzenia stanowisk biurowych celem monitoringu procesów w dynamicznie zarządzanej spółce. System ma za zadanie automatyczne tworzenie dostosowanego rozkładu pracy, uwzględniającego grafiki dostępności pracowników oraz wytyczne kodeksu pracy. Zastąpi to wielogodzinny i cykliczny proces ręcznej koordynacji.

== Zakres dokumentu
Dokument obejmuje specyfikację wymagań dla systemu "Grafiko-Inator", tworzonego na potrzeby Spółki Zło Dundersztyca. Zawiera opis integracji z zewnętrznymi systemami kadrowymi oraz API prawa pracy, a także specyfikację uprawnień użytkowników i wymagań niefunkcjonalnych.

= Projekt w kontekście

== Klienci
Głównym klientem zewnętrznym (zleceniodawcą) jest Spółka Zło Dundersztyca. System adresowany jest do firm wymagających zapewnienia monitoringu poprawności działania aplikacji lub systemów w trybie 24/7. 

== Charakterystyka użytkowników
W systemie zdefiniowano następujące role i uprawnienia (dziedziczone kaskadowo):
- *Administrator (1-5 użytkowników):* Edycja grafiku placówki, wgląd do dostępności, automatyczne generowanie grafików, edycja listy użytkowników, generowanie raportów godzin.
- *Moderator (0-10 użytkowników):* Generowanie raportów czasu pracy użytkownika, edycja czasu pracy, wgląd do grafiku placówki.
- *Użytkownik (0-100 użytkowników):* Ustawianie własnej dostępności, wgląd we własny grafik, rozpoczynanie/zakończenie pracy i przerw, obsługa tablicy zamian zmian oraz odbieranie powiadomień.

= Wymagania

== Wymagania ogólne i dziedzinowe

#table(
  columns: (22%, 1fr, 15%, 1.8fr), 
  align: left,
  stroke: 0.5pt + black,
  fill: (col, row) => if row == 0 or col == 0 or (row == 1 and col == 2) { bg-gray } else { none },
  table.cell(colspan: 4)[*KARTA WYMAGANIA*],
  [Identyfikator:], [WO1], 
  [Priorytet:], [*M*],
  [Nazwa], table.cell(colspan: 3)[Miękkie ostrzeżenia prawa pracy],
  [Opis], table.cell(colspan: 3)[System musi ostrzegać o naruszeniach prawa pracy (np. brak 11-godzinnej przerwy między zmianami), ale nie może kategorycznie blokować zapisów, pozostawiając ostateczną decyzję Administratorowi.],
  [Interesariusz], table.cell(colspan: 3)[Spółka Zło Dundersztyca],
  [Wymagania \ powiązane], table.cell(colspan: 3)[WI02, WN03]
)

== Wymagania funkcjonalne

=== Generowanie grafiku pracy

#table(
  columns: (22%, 1fr, 15%, 1.8fr), 
  align: left,
  stroke: 0.5pt + black,
  fill: (col, row) => if row == 0 or col == 0 or (row == 1 and col == 2) { bg-gray } else { none },
  table.cell(colspan: 4)[*KARTA WYMAGANIA*],
  [Identyfikator:], [WF01], 
  [Priorytet:], [*M*],
  [Nazwa], table.cell(colspan: 3)[Automatyczne układanie grafiku],
  [Opis], table.cell(colspan: 3)[
    Jako Administrator chcę wywołać automatyczne ustawianie grafiku na dany okres, opartego o grafiki dostępności pracowników.
  ],
  [Kryteria \ akceptacji], table.cell(colspan: 3)[Algorytm obsługujący do 100 użytkowników powinien zwracać wynik w czasie nie dłuższym niż 2 minuty.],
  [Dane wejściowe], table.cell(colspan: 3)[Grafiki dostępności użytkowników.],
  [Warunki \ początkowe], table.cell(colspan: 3)[Użytkownicy mają uzupełnioną dostępność.],
  [Warunki końcowe], table.cell(colspan: 3)[Wygenerowany harmonogram dla placówki.],
  [Sytuacje \ wyjątkowe], table.cell(colspan: 3)[Niewystarczająca liczba osób do pokrycia zmian.],
  [Szczegóły \ implementacji], table.cell(colspan: 3)[Wykorzystanie zoptymalizowanego algorytmu planowania.],
  [Interesariusz], table.cell(colspan: 3)[Administrator],
  [Wymagania \ powiązane], table.cell(colspan: 3)[WO1]
)

=== Interfejs z otoczeniem

#table(
  columns: (22%, 1fr, 15%, 1.8fr), 
  align: left,
  stroke: 0.5pt + black,
  fill: (col, row) => if row == 0 or col == 0 or (row == 1 and col == 2) { bg-gray } else { none },
  table.cell(colspan: 4)[*KARTA WYMAGANIA*],
  [Identyfikator:], [WI01], 
  [Priorytet:], [*M*],
  [Nazwa], table.cell(colspan: 3)[Integracja z systemem zarządzania pracownikami],
  [Opis], table.cell(colspan: 3)[Integracja z programem do zarządzania pracownikami celem pobrania listy pracowników i ich typów umowy. Oparta na webhooku informującym o dodaniu pracownika oraz przez API do zaciągania listy.],
  [Kryteria \ akceptacji], table.cell(colspan: 3)[Bezpieczna komunikacja z zewnętrznymi API (HR) za pomocą szyfrowanych połączeń (HTTPS/TLS) oraz bezpiecznego przechowywania kluczy.],
  [Dane wejściowe], table.cell(colspan: 3)[Dane uwierzytelniające API.],
  [Warunki \ początkowe], table.cell(colspan: 3)[Działające i dostępne API zewnętrzne HR.],
  [Warunki końcowe], table.cell(colspan: 3)[Zsynchronizowana lista użytkowników w lokalnej bazie.],
  [Sytuacje \ wyjątkowe], table.cell(colspan: 3)[Błąd sieci, rate-limits zewnętrznego API.],
  [Szczegóły \ implementacji], table.cell(colspan: 3)[Użycie HTTPS/TLS.],
  [Interesariusz], table.cell(colspan: 3)[Administrator],
  [Wymagania \ powiązane], table.cell(colspan: 3)[WN02]
)

== Wymagania pozafunkcjonalne

#table(
  columns: (22%, 1fr, 15%, 1.8fr), 
  align: left,
  stroke: 0.5pt + black,
  fill: (col, row) => if row == 0 or col == 0 or (row == 1 and col == 2) { bg-gray } else { none },
  table.cell(colspan: 4)[*KARTA WYMAGANIA*],
  [Identyfikator:], [WN01], 
  [Priorytet:], [*M*],
  [Nazwa], table.cell(colspan: 3)[Niezawodność i Dostępność],
  [Opis], table.cell(colspan: 3)[Z racji obsługi firm wymagających pracy 24/7, docelowa dostępność systemu (SLA) powinna wynosić 99.9%. Ewentualne przerwy serwisowe muszą odbywać się w godzinach najmniejszego obciążenia.],
  [Kryteria \ akceptacji], table.cell(colspan: 3)[Raport z monitoringu uptime wskazujący 99.9% dostępności w miesiącu.],
  [Interesariusz], table.cell(colspan: 3)[Spółka Zło Dundersztyca],
  [Wymagania \ powiązane], table.cell(colspan: 3)[-]
)

== Wymagania na środowisko docelowe

#table(
  columns: (22%, 1fr, 15%, 1.8fr), 
  align: left,
  stroke: 0.5pt + black,
  fill: (col, row) => if row == 0 or col == 0 or (row == 1 and col == 2) { bg-gray } else { none },
  table.cell(colspan: 4)[*KARTA WYMAGANIA*],
  [Identyfikator:], [WŚ01], 
  [Priorytet:], [*S*],
  [Nazwa], table.cell(colspan: 3)[Responsywność i zgodność mobilna],
  [Opis], table.cell(colspan: 3)[Interfejs użytkownika musi być w pełni responsywny (RWD) lub przystosowany jako aplikacja PWA, aby pracownicy mogli łatwo zarządzać swoimi zmianami i odbierać powiadomienia na urządzeniach mobilnych.],
  [Kryteria \ akceptacji], table.cell(colspan: 3)[Poprawne wyświetlanie i działanie kluczowych funkcji na systemach iOS i Android.],
  [Interesariusz], table.cell(colspan: 3)[Użytkownik],
  [Wymagania \ powiązane], table.cell(colspan: 3)[-]
)