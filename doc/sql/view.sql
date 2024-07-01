use MaturitniDatabaze

begin transaction;
go

create or alter view Studenty_zkousky
as
SELECT
    s.Jmeno AS 'Jméno',
    s.Prijmeni AS 'Pøíjmení',
    s.Datum_narozeni AS 'Datum narození',
    sk.Nazev AS 'Název školy',
	CONCAT(a.Ulice,' ',a.C_p,'/',a.C_o) as 'Adresa',
	CONCAT(SUBSTRING(CAST(pkm.Skolni_rok AS VARCHAR(8)), 1, 4), '/', SUBSTRING(CAST(pkm.Skolni_rok AS VARCHAR(8)), 5, 4)) as 'Školní rok',
    CASE zk.Predmet
        WHEN 1 THEN 'Èeský jazyk a literatura'
        WHEN 2 THEN 'Anglický jazyk'
        WHEN 3 THEN 'Nìmecký jazyk'
        WHEN 4 THEN 'Francouzský jazyk'
        WHEN 5 THEN 'Španìlský jazyk'
        WHEN 6 THEN 'Ruský jazyk'
        WHEN 7 THEN 'Matematika'
        WHEN 8 THEN 'Matematika rozšiøující'
        WHEN 9 THEN 'Programové vybavení'
        WHEN 10 THEN 'Databázové systémy'
        WHEN 11 THEN 'Poèítaèové systémy a sítì'
        WHEN 12 THEN 'Webové aplikace'
        WHEN 13 THEN 'Aplikace v praxi'
        WHEN 14 THEN 'Odborná práce'
		ELSE CONCAT('Pøedmìt ',zk.Predmet, ' neexistuje')
    END AS 'Pøedmìt',
    CASE zk.Typ_zkousky
        WHEN 1 THEN 'Povinná zkouška'
        WHEN 2 THEN 'Nepovinná zkouška'
		ELSE CONCAT('Typ zkoušky ',zk.Typ_zkousky, ' neexistuje')
    END AS 'Typ zkoušky',
    CASE zk.Termin_zkousky
        WHEN 1 THEN 'Øádný termín'
        WHEN 2 THEN 'JNM'
        WHEN 3 THEN 'Náhradní nebo opravná zkouška'
		ELSE CONCAT('Termín zkoušky ',zk.Termin_zkousky, ' neexistuje')
    END AS 'Termín zkoušky'
FROM
    Student s
    JOIN Prihlaska_k_maturite pkm ON s.ID = pkm.Student_ID
    JOIN Skola sk ON pkm.Skola_ID = sk.ID
    JOIN Maturitni_zkouska zk ON pkm.ID = zk.Prihlaska_k_maturite_ID
	JOIN Adresa a on sk.Adresa_ID = a.ID;
go

go

create or alter view Doporuceni_studenty
as
SELECT
    s.Jmeno AS 'Jméno',
    s.Prijmeni AS 'Pøíjmení',
    s.Datum_narozeni AS 'Datum narození',
    sk.Nazev AS 'Název školy',
	CONCAT(a.Ulice,' ',a.C_p,'/',a.C_o) as 'Adresa',
	CONCAT(SUBSTRING(CAST(pkm.Skolni_rok AS VARCHAR(8)), 1, 4), '/', SUBSTRING(CAST(pkm.Skolni_rok AS VARCHAR(8)), 5, 4)) as 'Školní rok',
    spz.RED_IZO_SPZ,
	CASE spz.Kategorie_PUP
		WHEN 1 THEN 'TP'
		WHEN 2 THEN 'ZP' 
		WHEN 3 THEN 'SP'
		WHEN 4 THEN 'SPUO' 
		ELSE CONCAT('Kategorie PUP ',spz.Kategorie_PUP, ' neexistuje')
	END AS 'Kategorie PUP',
	spz.Datum,
	spz.Podpurne_opatreni_a_uzpusobeni as 'Informace'
FROM
    Student s
    JOIN Prihlaska_k_maturite pkm ON s.ID = pkm.Student_ID
    JOIN Skola sk ON pkm.Skola_ID = sk.ID
	JOIN Adresa a ON sk.Adresa_ID = a.ID
	JOIN Doporuceni_skolskeho_poradenskeho_zarizeni spz on pkm.Doporuceni_ID = spz.ID;
go


go

create or alter view Studenty_prihlasky
as
SELECT
    s.Jmeno AS 'Jméno',
    s.Prijmeni AS 'Pøíjmení',
    s.Datum_narozeni AS 'Datum narození',
    sk.Nazev AS 'Název školy',
	CONCAT(a.Ulice,' ',a.C_p,'/',a.C_o) as 'Adresa',
	CONCAT(SUBSTRING(CAST(pkm.Skolni_rok AS VARCHAR(8)), 1, 4), '/', SUBSTRING(CAST(pkm.Skolni_rok AS VARCHAR(8)), 5, 4)) as 'Školní rok',
    CASE pkm.Forma_vzdelavani
        WHEN 1 THEN 'Denní'
        WHEN 2 THEN 'Veèerní'
        WHEN 3 THEN 'Dálková'
        WHEN 4 THEN 'Distanèní'
        WHEN 5 THEN 'Kombinovaná'
		ELSE CONCAT('Forma vzdìlávání ',pkm.Forma_vzdelavani, ' neexistuje')
    END AS 'Forma vzdìlávání',
    CASE pkm.Obor
        WHEN 1 THEN 'Informaèní technologie 18-20-M/01'
        WHEN 2 THEN 'Elektrotechnika 26-41-M/01'
		ELSE CONCAT('Obor ',pkm.Obor, ' neexistuje')
    END AS 'Obor',
	pkm.Rok_ukonceni_ss as 'Rok úspešného ukonèení SŠ'
FROM
    Student s
    JOIN Prihlaska_k_maturite pkm ON s.ID = pkm.Student_ID
    JOIN Skola sk ON pkm.Skola_ID = sk.ID
	JOIN Adresa a ON sk.Adresa_ID = a.ID;
go

go

create or alter view Studenty_vypis
as
select 
s.Jmeno AS 'Jméno',
s.Prijmeni AS 'Pøíjmení',
s.Datum_narozeni AS 'Datum narození',
a.Obec,  
CONCAT(a.Ulice,' ',a.C_p,'/',a.C_o) as 'Ulice',a.Mestska_cast as 'Mìstská èást',a.PSC as 'PSÈ'
from Student s
join Adresa a
on s.Adresa_ID = a.ID;

go

go

create or alter view Skoly_vypis
as
select 
s.Nazev, 
s.red_izo, 
s.ICO as 'IÈO',
a.Obec,  
CONCAT(a.Ulice,' ',a.C_p,'/',a.C_o) as 'Ulice',a.Mestska_cast as 'Mìstská èást',a.PSC as 'PSÈ'
from Skola s
join Adresa a
on s.Adresa_ID = a.ID;

go
commit transaction;