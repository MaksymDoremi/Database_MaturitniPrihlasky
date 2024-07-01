use MaturitniDatabaze

begin transaction;
go

create or alter view Studenty_zkousky
as
SELECT
    s.Jmeno AS 'Jm�no',
    s.Prijmeni AS 'P��jmen�',
    s.Datum_narozeni AS 'Datum narozen�',
    sk.Nazev AS 'N�zev �koly',
	CONCAT(a.Ulice,' ',a.C_p,'/',a.C_o) as 'Adresa',
	CONCAT(SUBSTRING(CAST(pkm.Skolni_rok AS VARCHAR(8)), 1, 4), '/', SUBSTRING(CAST(pkm.Skolni_rok AS VARCHAR(8)), 5, 4)) as '�koln� rok',
    CASE zk.Predmet
        WHEN 1 THEN '�esk� jazyk a literatura'
        WHEN 2 THEN 'Anglick� jazyk'
        WHEN 3 THEN 'N�meck� jazyk'
        WHEN 4 THEN 'Francouzsk� jazyk'
        WHEN 5 THEN '�pan�lsk� jazyk'
        WHEN 6 THEN 'Rusk� jazyk'
        WHEN 7 THEN 'Matematika'
        WHEN 8 THEN 'Matematika roz�i�uj�c�'
        WHEN 9 THEN 'Programov� vybaven�'
        WHEN 10 THEN 'Datab�zov� syst�my'
        WHEN 11 THEN 'Po��ta�ov� syst�my a s�t�'
        WHEN 12 THEN 'Webov� aplikace'
        WHEN 13 THEN 'Aplikace v praxi'
        WHEN 14 THEN 'Odborn� pr�ce'
		ELSE CONCAT('P�edm�t ',zk.Predmet, ' neexistuje')
    END AS 'P�edm�t',
    CASE zk.Typ_zkousky
        WHEN 1 THEN 'Povinn� zkou�ka'
        WHEN 2 THEN 'Nepovinn� zkou�ka'
		ELSE CONCAT('Typ zkou�ky ',zk.Typ_zkousky, ' neexistuje')
    END AS 'Typ zkou�ky',
    CASE zk.Termin_zkousky
        WHEN 1 THEN '��dn� term�n'
        WHEN 2 THEN 'JNM'
        WHEN 3 THEN 'N�hradn� nebo opravn� zkou�ka'
		ELSE CONCAT('Term�n zkou�ky ',zk.Termin_zkousky, ' neexistuje')
    END AS 'Term�n zkou�ky'
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
    s.Jmeno AS 'Jm�no',
    s.Prijmeni AS 'P��jmen�',
    s.Datum_narozeni AS 'Datum narozen�',
    sk.Nazev AS 'N�zev �koly',
	CONCAT(a.Ulice,' ',a.C_p,'/',a.C_o) as 'Adresa',
	CONCAT(SUBSTRING(CAST(pkm.Skolni_rok AS VARCHAR(8)), 1, 4), '/', SUBSTRING(CAST(pkm.Skolni_rok AS VARCHAR(8)), 5, 4)) as '�koln� rok',
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
    s.Jmeno AS 'Jm�no',
    s.Prijmeni AS 'P��jmen�',
    s.Datum_narozeni AS 'Datum narozen�',
    sk.Nazev AS 'N�zev �koly',
	CONCAT(a.Ulice,' ',a.C_p,'/',a.C_o) as 'Adresa',
	CONCAT(SUBSTRING(CAST(pkm.Skolni_rok AS VARCHAR(8)), 1, 4), '/', SUBSTRING(CAST(pkm.Skolni_rok AS VARCHAR(8)), 5, 4)) as '�koln� rok',
    CASE pkm.Forma_vzdelavani
        WHEN 1 THEN 'Denn�'
        WHEN 2 THEN 'Ve�ern�'
        WHEN 3 THEN 'D�lkov�'
        WHEN 4 THEN 'Distan�n�'
        WHEN 5 THEN 'Kombinovan�'
		ELSE CONCAT('Forma vzd�l�v�n� ',pkm.Forma_vzdelavani, ' neexistuje')
    END AS 'Forma vzd�l�v�n�',
    CASE pkm.Obor
        WHEN 1 THEN 'Informa�n� technologie 18-20-M/01'
        WHEN 2 THEN 'Elektrotechnika 26-41-M/01'
		ELSE CONCAT('Obor ',pkm.Obor, ' neexistuje')
    END AS 'Obor',
	pkm.Rok_ukonceni_ss as 'Rok �spe�n�ho ukon�en� S�'
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
s.Jmeno AS 'Jm�no',
s.Prijmeni AS 'P��jmen�',
s.Datum_narozeni AS 'Datum narozen�',
a.Obec,  
CONCAT(a.Ulice,' ',a.C_p,'/',a.C_o) as 'Ulice',a.Mestska_cast as 'M�stsk� ��st',a.PSC as 'PS�'
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
s.ICO as 'I�O',
a.Obec,  
CONCAT(a.Ulice,' ',a.C_p,'/',a.C_o) as 'Ulice',a.Mestska_cast as 'M�stsk� ��st',a.PSC as 'PS�'
from Skola s
join Adresa a
on s.Adresa_ID = a.ID;

go
commit transaction;