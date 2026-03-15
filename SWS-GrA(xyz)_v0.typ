#set page(paper: "a4", margin: 2.5cm)
#set text(font: "Times New Roman", size: 11pt)
#set par(justify: true)

// --- FORMATOWANIE NAGŁÓWKÓW ---
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

// --- ZMIENNA DLA SZAREGO TŁA W TABELACH ---
#let bg-gray = rgb("e5e5e5")

// ==========================================
//                 METRYKA
// ==========================================

#table(
  columns: (1fr, 1fr, 1fr),
  align: left,
  stroke: 0.5pt + black,
  [
    *Numer zlecenia oraz nazwa i akronim projektu:* \
    _{nazwa projektu}_
  ],
  [
    *Zleceniodawca:* \
    _{ew. nazwa klienta zewnętrznego}_
  ],
  table.cell(rowspan: 2)[
    *Zleceniobiorca:* \
    #align(center)[
      #image("pjatk_logo.png", width: 60%) // PODMIEŃ NA SWOJE LOGO
    ]
  ],
  [
    *Zespół projektowy:* \
    _{członkowie zespołu projektowego}_
  ],
  [
    *Kierownik projektu:* \
    _{nazwisko, imię}_
  ],
  [
    *Nazwa dokumentu:* \
    _Specyfikacja Wymagań Systemowych_
  ],
  [
    *Odpowiedzialny za dokument:* \
    _{nazwisko, imię}_
  ],
  [
    *Opiekun projektu:* \
    _{uczelniany opiekun projektu}_
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
  [_{wersja}_], [_{opis, np. wstępna wersja}_], [_{np. całość}_], [_{nazwisko, imię}_], [_{data zmiany}_],
  [_{wersja}_], [_{np. poprawka wstępnego opisu}_], [_{np. punkty 3.3 i 4}_], [_{nazwisko, imię}_], [_{data zmiany}_]
)

#v(1.5em)

*Opis etapu:* Celem etapu jest udokumentowanie procesu i podjętych decyzji związanych ze zbieraniem, przetwarzaniem i analizowaniem wymagań.

#v(1em)

*Oczekiwane produkty:* Specyfikacja wymagań systemowych w postaci dokumentu o strukturze według poniższego szablonu i nazewnictwie zgodnym ze składnią SWS-GrA(XYZ)_v0 – gdzie _A_ to numer porządkowy grupy; _X, Y, Z_ to nazwiska poszczególnych członków, a _0 to numer wersji.

// ==========================================
//             TREŚĆ DOKUMENTU
// ==========================================

= Wprowadzenie – o dokumencie
== Cel dokumentu
_{Określenie celu, jakiemu ma służyć ten dokument; tutaj: zdefiniowanie wymagań na podstawie analizy otoczenia projektu / przedsięwzięcia oraz analizy potrzeb klienta}_

== Zakres dokumentu
_{Określenie, co zawiera dokument; tutaj: analiza otoczenia – klienci, kontekst biznesowy systemu, określenie interesariuszy, zdefiniowanie wymagań}_

== Dokumenty powiązane
_{Pełna lista opracowań poza zakresem dokumentu, lecz powiązanych merytorycznie z tym dokumentem; ujęte wersje poszczególnych dokumentów; także poprzednie wersje dokumentu SWS}_

== Odbiorcy
_{Określenie adresatów dokumentu np. zleceniodawca, zleceniobiorca, członkowie zespołu projektowego oraz (jeśli znane) wymienione z nazwiska osoby, do których dokument ma dotrzeć; aspekty prawne i licencyjne (kto posiada prawa autorskie do dokumentu / jaki akt prawny je reguluje?)}_

== Słownik pojęć
_{Wyjaśnienie używanych w dokumencie oznaczeń, pojęć i skrótów np. akronimy, nazwy skrótowe, itp; definicje są konieczne, aby wszyscy czytelnicy mogli zrozumieć treść dokumentu; ważne jest umieszczenie na tej liście pojęć o charakterze technicznym oraz pojęć dziedziny merytorycznej zastosowania aplikacji. Nie jest konieczne wyjaśnianie słów używanych powszechnie}_

= Projekt w kontekście
_{Opis systemu w docelowym środowisku jego zastosowania }_

== Kontekst biznesowy
_{Zalecane poparcie rysunkiem (np. ogólny diagram przypadków użycia) przedstawiający system w docelowym środowisku organizacyjnym i operacyjnym, zakres, integracje z innymi systemami, współdzielone bazy danych, konieczność wykorzystania szablonów, wzorców lub standardów wewnątrzorganizacyjnych; głównych interesariuszy i ilustrujący relacje między nimi}_

== Interesariusze
_{Interesariusz to każdy podmiot, ożywiony bądź nie (osoba, system, urządzenie, regulacje prawne, społeczeństwo itp), który bierze udział w projekcie, ma wpływ na projekt lub na którego projekt może wpływać. Dla projektów, które powstają w oparciu o istniejącą infrastrukturę techniczną, należy pamiętać o włączeniu tej infrastruktury jako interesariusza nieożywionego, którego istnienie narzuca pewne rozwiązania i wymagania}_

#table(
  columns: (auto, 1fr),
  align: left,
  stroke: 0.5pt + black,
  fill: (col, row) => if row == 0 { bg-gray } else { none },
  table.cell(colspan: 2)[*KARTA INTERESARIUSZA*],
  [Identyfikator:], [_{jednoznaczny symbol np. UOB 01, UOB 02 ... dla interesariuszy ożywionych bezpośrednich, UNP 01... dla nieożywionych pośrednich itd.}_],
  [Nazwa:], [_{nazwa interesariusza}_],
  [Opis:], [_{opis interesariusza}_],
  [Typ interesariusza:], [_{ożywiony/nieożywiony, bezpośredni/pośredni}_],
  [Punkt widzenia:], [_{z jakiej perspektywy patrzy interesariusz np. technicznej, ekonomicznej, operatora systemu itp.}_],
  [Ograniczenia:], [_{ograniczenia interesariusza np. administrator nie powinien specyfikować wymagań finansowych}_],
  [Wymagania:], [_{tu tylko symbole wymagań wyspecyfikowanych w rozdziale 3}_]
)

== Klienci
_{Klienci wewnętrzni są to klienci, którzy występują w ramach naszej organizacji np. nasz szef, dział finansowy, konstruktorzy, instalatorzy itp. specyfikujemy ich charakterystykę i potrzeby w odniesieniu do naszego projektu. Klienci zewnętrzni - przedstawiciele zleceniodawcy, którzy mogą mieć bardzo różne potrzeby np. dyrektor i administrator sieci, za klientów zewnętrznych uważa się także podwykonawców i dostawców.}_

== Charakterystyka użytkowników
_{Użytkownicy, ich kategorie, uprawnienia dostępu do funkcji i danych w poszczególnych trybach pracy systemu; zakładana liczebność użytkowników poszczególnych kategorii}_

= Wymagania
_{Wymaganie jest to potrzeba klienta lub ograniczenie narzucone przez innego interesariusza, wyrażone jako cecha projektowanego rozwiązania. Wymagania dzielimy na ogólne (zarówno biznesowe jak i dziedzinowe); funkcjonalne, pozafunkcjonalne; na środowisko docelowe oraz dotyczące procesu wytwarzania - odpowiednio w punktach poniżej.}_

== Wymagania ogólne i dziedzinowe
_{Doprecyzowanie celów projektu / przedsięwzięcia zdefiniowanych na etapie zlecenia projektu / założeń wstępnych (KP, DZW). Wymagania ogólne / biznesowe / dziedzinowe pokazują system w kontekście i charakteryzują dziedzinę, w której będzie eksploatowany system, np. edukacja, finanse itp (mogą wymagać uwzględnienie specyficznych przepisów i zasad)}_

#table(
  columns: (22%, 1fr, 15%, 1.8fr), 
  align: left,
  stroke: 0.5pt + black,
  fill: (col, row) => if row == 0 or col == 0 or (row == 1 and col == 2) { bg-gray } else { none },
  table.cell(colspan: 4)[*KARTA WYMAGANIA*],
  [Identyfikator:], [_{jednoznaczny symbol \ np. WO1, WO2 .. }_], 
  [Priorytet:], [_{ważność wymagania, np. wg skali MoSCoW: \ *M* – must (musi być) \ *S* – should (powinno być) \ *C* – could (może być) \ *W* – won’t (nie będzie – nie będzie implementowane w danym wydaniu, ale może być rozpatrzone w przyszłości )}_],
  [Nazwa], table.cell(colspan: 3)[_{krótki opis}_],
  [Opis], table.cell(colspan: 3)[_{opis szczegółowy, należy dążyć do tego, żeby wszystkie znane na ten moment szczegóły wymagania zostały wydobyte i wyspecyfikowane}_],
  [Interesariusz], table.cell(colspan: 3)[_{nazwa interesariusza, który podał wymaganie}_],
  [Wymagania \ powiązane], table.cell(colspan: 3)[_{wymagania zależne i uszczegóławiające – odesłanie poprzez identyfikator}_]
)

== Wymagania funkcjonalne
_{Funkcje/usługi; wymagania funkcjonalne powinny odpowiadać na pytanie: co system ma robić? \ W tym podrozdziale powinny znaleźć się tabele przedstawione w podpunkcie 3.2.1 opracowane dla każdego zidentyfikowanego wymaganie funkcjonalnego.}_

=== Nazwa funkcji / usługi}

#table(
  columns: (22%, 1fr, 15%, 1.8fr), 
  align: left,
  stroke: 0.5pt + black,
  fill: (col, row) => if row == 0 or col == 0 or (row == 1 and col == 2) { bg-gray } else { none },
  table.cell(colspan: 4)[*KARTA WYMAGANIA*],
  [Identyfikator:], [_{jednoznaczny symbol \ np. F01, F02 ... lub WF01...}_], 
  [Priorytet:], [_{ważność wymagania, np. wg skali MoSCoW:_ \ *M* _– must (musi być)_ \ *S* _– should (powinno być)_ \ *C* _– could (może być)_ \ *W* _– won’t (nie będzie – nie będzie implementowane w danym wydaniu, ale może być rozpatrzone w przyszłości )}_],
  [Nazwa], table.cell(colspan: 3)[_{krótki opis}_],
  [Opis], table.cell(colspan: 3)[
    _{opis szczegółowy, należy dążyć do tego, żeby wszystkie znane na ten moment szczegóły wymagania zostały wydobyte i wyspecyfikowane }_ \
    Można zastosować opis jak w User Story
    - *Jako* _(konkretny użytkownik systemu)_
    - *chcę...* _(pożądana cecha lub problem, który trzeba rozwiązać)_
    - *bo wtedy/ponieważ...* _(korzyść płynąca z ukończenia story)_
  ],
  [Kryteria \ akceptacji], table.cell(colspan: 3)[_Warunki Satysfakcji (Szczegóły dodane na potrzeby testów akceptacyjnych)_],
  [Dane wejściowe], table.cell(colspan: 3)[_{uzupełniane w trakcie sprintu – dane wejściowe, związane z wymaganiem}_],
  [Warunki \ początkowe], table.cell(colspan: 3)[_{uzupełniane w trakcie sprintu – warunki, które muszą być prawdziwe przed wywołaniem operacji}_],
  [Warunki końcowe], table.cell(colspan: 3)[_{uzupełniane w trakcie sprintu – warunki, które muszą być prawdziwe po wywołaniu operacji}_],
  [Sytuacje \ wyjątkowe], table.cell(colspan: 3)[_{uzupełniane w trakcie sprintu – niepożądane sytuacje i sposoby ich obsługi}_],
  [Szczegóły \ implementacji], table.cell(colspan: 3)[_{uzupełniane w trakcie sprintu – opis sposobu realizacji}_],
  [Interesariusz], table.cell(colspan: 3)[_{nazwa interesariusza, który podał wymaganie}_],
  [Wymagania \ powiązane], table.cell(colspan: 3)[_{wymagania zależne i uszczegóławiające – odesłanie poprzez identyfikator}_]
)

=== Interfejs z otoczeniem
_{Punkty styku projektowanego systemu z innymi podsystemami/sieciami/operatorami np. dopasowanie do baz danych, formatów, usług oferowanych przez inne, współpracujące systemy bądź serwisy; wymagania dot. dopasowania interfejsów itp.}_

#table(
  columns: (22%, 1fr, 15%, 1.8fr), 
  align: left,
  stroke: 0.5pt + black,
  fill: (col, row) => if row == 0 or col == 0 or (row == 1 and col == 2) { bg-gray } else { none },
  table.cell(colspan: 4)[*KARTA WYMAGANIA*],
  [Identyfikator:], [_{jednoznaczny symbol \ np. I01, I02... lub WI01..}_], 
  [Priorytet:], [_{ważność wymagania, np. wg skali MoSCoW:_ \ *M* _– must_ \ *S* _– should_ \ *C* _– could_ \ *W* _– won’t}_],
  [Nazwa], table.cell(colspan: 3)[_{krótki opis}_],
  [Opis], table.cell(colspan: 3)[_{opis szczegółowy, należy dążyć do tego, żeby wszystkie znane na ten moment szczegóły wymagania zostały wydobyte i wyspecyfikowane}_],
  [Kryteria \ akceptacji], table.cell(colspan: 3)[_Warunki Satysfakcji (Szczegóły dodane na potrzeby testów akceptacyjnych)_],
  [Dane wejściowe], table.cell(colspan: 3)[_{uzupełniane w trakcie sprintu – dane wejściowe, związane z wymaganiem}_],
  [Warunki \ początkowe], table.cell(colspan: 3)[_{uzupełniane w trakcie sprintu – warunki...}_],
  [Warunki końcowe], table.cell(colspan: 3)[_{uzupełniane w trakcie sprintu – warunki...}_],
  [Sytuacje \ wyjątkowe], table.cell(colspan: 3)[_{uzupełniane w trakcie sprintu – niepożądane sytuacje i sposoby ich obsługi}_],
  [Szczegóły \ implementacji], table.cell(colspan: 3)[_{uzupełniane w trakcie sprintu – opis sposobu realizacji}_],
  [Interesariusz], table.cell(colspan: 3)[_{nazwa interesariusza, który podał wymaganie}_],
  [Wymagania \ powiązane], table.cell(colspan: 3)[_{wymagania zależne i uszczegóławiające – odesłanie poprzez identyfikator}_]
)

== Wymagania pozafunkcjonalne
_{Wymagania pozafunkcjonalne odpowiadają na pytanie: jak system ma działać? Obejmują one wymagania jakościowe: niezawodność, wiarygodność, wydajność, kategorie ergonomiczne: łatwość użycia, intuicyjność, modyfikowalność, adaptowalność itp. Wymagania te powinny być wyrażone w mierzalnej formie. Przykładowo, zamiast: „Wysoka dostępność systemu", powinno być: „System powinien być dostępny 7 dni w tygodniu, 24 godziny na dobę". zamiast: „System ma być łatwy w użyciu", powinno być: „System musi umożliwiać sprawne wprowadzanie dużych ilości masowych danych" albo: „System ma być intuicyjny do użycia przez niedoświadczonego użytkownika. Powinien być zaopatrzony w instrukcję, pliki pomocy i objaśnienia pozycji menu i klawiszy funkcyjnych."}_

#table(
  columns: (22%, 1fr, 15%, 1.8fr), 
  align: left,
  stroke: 0.5pt + black,
  fill: (col, row) => if row == 0 or col == 0 or (row == 1 and col == 2) { bg-gray } else { none },
  table.cell(colspan: 4)[*KARTA WYMAGANIA*],
  [Identyfikator:], [_{jednoznaczny symbol \ np. NF01, NF02... lub WN01...}_], 
  [Priorytet:], [_{ważność wymagania, np. wg skali MoSCoW:_ \ *M* _– must_ \ *S* _– should_ \ *C* _– could_ \ *W* _– won’t}_],
  [Nazwa], table.cell(colspan: 3)[_{krótki opis}_],
  [Opis], table.cell(colspan: 3)[_{opis szczegółowy, należy dążyć do tego, żeby wszystkie znane na ten moment szczegóły wymagania zostały wydobyte i wyspecyfikowane}_],
  [Kryteria \ akceptacji], table.cell(colspan: 3)[_Warunki Satysfakcji (Szczegóły dodane na potrzeby testów akceptacyjnych)_],
  [Interesariusz], table.cell(colspan: 3)[_{nazwa interesariusza, który podał wymaganie}_],
  [Wymagania \ powiązane], table.cell(colspan: 3)[_{wymagania zależne i uszczegóławiające – odesłanie poprzez identyfikator}_]
)

== Wymagania na środowisko docelowe
_{W jakim środowisku będzie pracować system - o ile jest istotne, np. system operacyjny, rodzaje i wersje przeglądarek internetowych, itp. Może się zdarzyć, że na tym etapie użytkownicy i inni interesariusze nie wyspecyfikują środowiska docelowego.}_

#table(
  columns: (22%, 1fr, 15%, 1.8fr), 
  align: left,
  stroke: 0.5pt + black,
  fill: (col, row) => if row == 0 or col == 0 or (row == 1 and col == 2) { bg-gray } else { none },
  table.cell(colspan: 4)[*KARTA WYMAGANIA*],
  [Identyfikator:], [_{jednoznaczny symbol \ np. ŚD01, ŚD02... lub WŚ01}_], 
  [Priorytet:], [_{ważność wymagania, np. wg skali MoSCoW:_ \ *M* _– must_ \ *S* _– should_ \ *C* _– could_ \ *W* _– won’t}_],
  [Nazwa], table.cell(colspan: 3)[_{krótki opis}_],
  [Opis], table.cell(colspan: 3)[_{opis szczegółowy, należy dążyć do tego, żeby wszystkie znane na ten moment szczegóły wymagania zostały wydobyte i wyspecyfikowane}_],
  [Kryteria \ akceptacji], table.cell(colspan: 3)[_Warunki Satysfakcji (Szczegóły dodane na potrzeby testów akceptacyjnych)_],
  [Interesariusz], table.cell(colspan: 3)[_{nazwa interesariusza, który podał wymaganie}_],
  [Wymagania \ powiązane], table.cell(colspan: 3)[_{wymagania zależne i uszczegóławiające – odesłanie poprzez identyfikator}_]
)

= Odwołania do literatury
_{Lista przywoływanych pozycji literaturowych, ponumerowanych lub z przydzielonymi identyfikatorami; w treści właściwej dokumentu posługujemy się wyłącznie numerami/ identyfikatorami do wskazania źródła treści. Usunąć jeśli nie dotyczy.}_

= Załączniki