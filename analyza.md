# Analýza databázového projektu

**Střední průmyslová škola elektrotechnická, Praha 2, Ječná 30**
**Školní rok 2023/2024**
---
Jméno a příjimeni: Maksym Kintor  
Třída: C4b
---

## Úvod
Téma: Školství/vzdělání  
Typ: Dokument  
Moje volba: Maturitní přihláška  

Dokumenty pužité jako zdroj:  
- `doc/documents/Maturitni_prihlaska.pdf`
- `doc/documents/Uzpusobeni_podminek_formular.pdf`

## Struktura složek
<pre>
|___README.md 
|___README.pdf
|___analyza.md (tento soubor)
|___analyza.pdf
|___doc/
    |___config/
        |___dictionary.txt
        |___Users.txt
    |___documents/
        |___Maturitni_prihlaska.pdf
        |___Uzpusobeni_podminek_formular.pdf
        |___Full_Backup.bak
    |___img/
        |___diagram.png
    |___sql/
        |___Export_Structure_Trigger_Index.sql
        |___Export_Test_Data.sql
        |___Export_Users.sql
        |___Export_View_Procedure.sql
        |___procedure.sql
        |___script.sql
        |___testdata.sql
        |___trigger.sql
        |___view.sql

</pre>
## Řešení 
> **Požadavek**:  
> Zákazník (fiktivní Cermat) chce databázi pro evidenci studentů, škol a konaných maturitních zkoušek. Poskytnul mi dokumenty, co a jak chce evidovat, tedy samotnou přihlášku k maturitě a formulář Doporučení ŠPZ. Zákazník nemá předem vytvořenou databázi, totiž zakládá systém a chce poprvé vyjít na trh práce. Detaily jsme s ním ujasnili, volba DBS je na mě, chtějí to mít zatím lokálně. Veškeré vývojářské činnosti jsou na moji starosti a já musím poskytnout spolehlivou databázi.
> **Software & Hardware**  
> - Database managment system: MSSQL  
> - Hardware: Local PC  

> **Database design**  
> #### Zajištění správnosti, odstranění duplicity dat, omezení nekonzistence dat a vysokou efektivitu práce databaze:  
> - Vytvoření procedur, triggerů
> - Normalizace, integrita  
> #### Zvýšení rychlosti:  
> - viz [Zajištění správnosti, odstranění duplicity dat, omezení nekonzistence dat a vysokou efektivitu práce databaze](#zajištění-správnosti-odstranění-duplicity-dat-omezení-nekonzistence-dat-a-vysokou-efektivitu-práce-databaze)
> - Indexy  
> #### Přehledná práce při dotazování:  
> - Views

## Definice problémů
- Potřeba vyvinout kompletní databázový systém(pro účely fiktivního Cermat) pro evidenci maturitních přihlášek a předmětu odpovídající k ním, studentů a škol ČR. 
- Vyvinout pohodlné na použití funkce, tedy přidání nového studenta a nové školy.
- Vytvořit několik uživatelských účtu pro zaměstnance firmy, aby každý měl odpovídající prává podle pozice v podniku.
- Zajistit bezpečné mazání záznámů, tedy zálohovat data do duplicitních tabulek. V případě chybného mazání dá se data napravit. 

## Definice cíle
- Mít přehled nad všemi školami, studentami, přihláškami, přílohami a maturitními zkouškami v srozumitelném formátu. Vytvořit příslušné views.
- Vytvořit funkční procedury, kterými se dá snadno přidávat studenty a školy.
- Podle požadavku firmy vytvořit databázové účty manažera, sekretařky, admin, security admina a datatbázového vývojáře. Zdokumentovat jejich plnomoce a přihlašovací údaje.
- Vytvořit backup tabulky, budou to kompletní kopie pracovnícha a navíc budou mít atributy Zpráva, kde bude informace co se probeldo a kým, Datum kdy se to provedlo, jedná se o mazání dat či jejich úpravu.
- Vytvořit triggery, které příslušným způsobem budou reagovat na mazání dat, tedy budou je zálohovat do backup tabulek, ze kterých v případě chybného mazání aktuální data se daji vrátit. 
- Vytvořit indexy, které pomůžou rychlejí vyhledávat data. Chceme to z důvodu views, které pracují na základě joinu a FK, takže indexy budou vytvořeny na každém FK.

## Definice entit
- ERP diagram viz `doc/img/diagram.png`

> **Student**  
> - ID **int primary key**
> - Adresa_ID **int foreing key references Adresa(ID)**
> - Jmeno **varchar**
> - Prijmeni **varchar**
> - Datum_narozeni **date**
> - Rodne_cislo **varchar**
> - Email **varchar**
> - Datova_schranka **varchar**
> - Tel_cislo **varchar**

> **Adresa**
> - ID **int primary key**
> - Obec **varchar**
> - Ulice **varchar**
> - C_p **int**
> - C_o **int**
> - Mestska_cast **varchar**
> - PSC **int**

> **Skola**
> - ID **ini primary key**
> - Adresa_ID **int foreign key references Adresa(ID)**
> - Nazev **varchar**
> - red_izo **int**
> - ICO **int**

> **Prihlaska_k_maturite**
> - ID **int**
> - Skola_ID **int foreign key references Skola(ID)**
> - Student_ID **int foreign key references Student(ID)**
> - Doporuceni_ID **int foreing key references Doporuceni_skolskeho_poradenskeho_zarizeni(ID)**
> - Forma_vzdelavani <u>pozn. uloženo jako INT, bude proveden Case</u>
> - Obor <u>pozn. uloženo jako INT, bude proveden Case</u>
> - Rok_ukonceni_ss **int**
> - Skolni_rok **int**

> **Doporuceni_skolskeho_poradenskeho_zarizeni**
> - ID **int primary key** 
> - Skola_ID **int foreign key references Skola(ID)**
> - Student_ID **int foreign key references Student(ID)**
> - RED_IZO_SPZ <u>pozn. je to INT, může být jako foreign key, ale pro účely tohoto zadání to není relevantní</u>
> - Kategorie_PUP <u>pozn. uloženo jako INT, bude proveden Case</u>
> - Datum **date**
> - Podpurne_opatreni_a_uzpusobeni **varchar**

> **Maturitni_zkouska**
> - ID **int primary ke**y
> - Prihlaska_k_maturite_ID **int foreign key references Prihlaska_k_maturite(ID)**
> - Predmet <u>pozn. uloženo jako INT, bude proveden Case</u>
> - Typ_zkousky <u>pozn. uloženo jako INT, bude proveden Case</u>
> - Termin_zkousky <u>pozn. uloženo jako INT, bude proveden Case</u>

> **Zálohovací tabulky**
> - StudentBackup - bude sloužit pro zálohování vymazávání studentů
> - StudentAuditBackup - bude sloužit pro zálohy změn studentů
> - PrihlaskaBackup - bude sloužit pro zálohování vymazávání přihlášek
> - Maturitni_zkouskaBackup - bude sloužit pro zálohování vymazávání maturitních zkoušek
> - DopoDoporuceni_SPZBackupruceni - bude sloužit pro zálohování vymazávání doporučení ŠPZ

## Analýza vstupu a výstupu
### Vstupy
- Školy ČR
- Studenty a jejich osobní údaje
- Maturitní příhlášky
- Maturitní zkoušky
- Doporučení ŠPZ
### Výstupy
- Přehled škol a jejich adres
- Přehled studentů a jejich adres
- Přehled studentů a jejich přihlášek
- Přehled studentů a jejich maturitních zkoušek
- Zálohování při mazání dat

## Seznam funkčních požadavků
- Možnost vkládat studenty s jejich adresou pomocí procedury
- Možnost vkládat školy s jejich adresou pomocí procedury
- Zajistit zálohování při mazání dat, koírování do záložních tabulek
- Udržovat log auditu, kdo a kdy změnil data v tabulce Studentu, tedy vytvořit novou entitu na log auditu
- Vytvořit pohodlné a přehledné views
- Mít několik účtu podle pracovních pozic ve firmě

## Shrnutí
- Databáze bude sloužit jako evidence maturitních přihlášek a zkoušek z pohledu Cermatu. 
- K databázi budou zřízeny přístupy podle roli ve firmě a tedy: **manažer**, **sekretařka**, **admin**, **security admin** a **datatbázový vývojář**.
- Budou implementovany všechny potřebné entity. **Škola**, **Student**, **Adresa**, **Přhláška k maturitě**, **Maturitní zkouška** a **Doporučení ŠPZ**, zároveň i zálohovací tabulky, což budou stejné, jen slouží k případnému restoru dat. 
- Není to velká databáze, některá řešení a implementace entit jsou zkrácená kvůli účelů zadání. A přesně:  
    * Entita Doporuceni_skolskeho_poradenskeho_zarizeni obsahuje **RED_IZO_SPZ**, což je ID Školského poradenského zařízení a v životě odkazuje na další entitu (foreign key), nicméně pro účely zadání a jeho jednoduchosti, implementace nové entity není relevantní.
    * Atributy **Forma_vzdelavani**, **Obor**, **Kategorie_PUP**, **Predmet**, **Typ_zkousky**, **Termin_zkousky** jsou definovány jako <u>INTEGER</u>, co se následně přeloží pomocí CASE. Mohlo to být jako foreign key, což by znamenalo založení ještě 6 tabulek, ale podle účelu tohoto zadání není efektivní a zbytečně by komplikovalo práci. Dokonce i view byly by velmi náročné, co zpomalí výkon DBS. Takže nejefektivnější postup je ukládat to jako číslo a v dokumentaci bude uveden dictionary všech hodnot. 