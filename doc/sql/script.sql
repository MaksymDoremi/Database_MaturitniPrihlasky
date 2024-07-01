use master

go

drop database if exists MaturitniDatabaze

go

create database MaturitniDatabaze

go

use MaturitniDatabaze

go

begin transaction;
create table Adresa
(
	ID int primary key identity(1,1),
	Obec varchar(64) not null check(len(Obec) > 2),
	Ulice varchar(64) not null check(len(Ulice) > 2),
	C_p int not null check(C_p >= 0),
	C_o int not null check(C_o >= 0),
	Mestska_cast varchar(64) not null check(len(Mestska_cast) > 2),
	PSC int not null check(PSC >= 0)
)

go

create table Skola 
(
	ID int primary key identity(1,1), 
    Adresa_ID int foreign key references Adresa(ID) not null, 
    Nazev varchar(100) not null check(len(Nazev) > 10), 
    red_izo int not null unique, 
    ICO int not null unique
)

go

create table Student 
(
	ID int primary key identity(1,1), 
	Adresa_ID int foreign key references Adresa(ID) not null, 
	Jmeno varchar(64) not null check(len(Jmeno) >= 2), 
	Prijmeni varchar(64) not null check(len(Prijmeni) >= 2), 
	Datum_narozeni date not null, 
	Rodne_cislo varchar(15) CHECK(Rodne_cislo LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]/[0-9][0-9][0-9][0-9]'), 
	Email varchar(100) check(Email like '%@%.%'), 
	Datova_schranka varchar(64) check(len(Datova_schranka) > 3), 
	Tel_cislo varchar(16) CHECK(
        Tel_cislo LIKE '+420[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR
        Tel_cislo LIKE '+420 [0-9][0-9][0-9] [0-9][0-9][0-9] [0-9][0-9][0-9]' OR
        Tel_cislo LIKE '[0-9][0-9][0-9] [0-9][0-9][0-9] [0-9][0-9][0-9]' OR
        Tel_cislo LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
    ) 
)

go

create table Doporuceni_skolskeho_poradenskeho_zarizeni
(
	ID int primary key identity(1,1),
	Skola_ID int foreign key references Skola(ID) not null,
	Student_ID int foreign key references Student(ID) not null,
	RED_IZO_SPZ int not null, 
	Kategorie_PUP int not null, 
	Datum date not null,
	Podpurne_opatreni_a_uzpusobeni varchar(600) not null
)

go

create table Prihlaska_k_maturite 
(
	ID int primary key identity(1,1), 
	Skola_ID int foreign key references Skola(ID) not null,
	Student_ID int foreign key references Student(ID) not null,
	Doporuceni_ID int foreign key references Doporuceni_skolskeho_poradenskeho_zarizeni(ID),
	Forma_vzdelavani int not null,  
	Obor int not null, 
	Rok_ukonceni_ss int not null check(Rok_ukonceni_ss >= 2000),
	Skolni_rok int not null 
)

go

create table Maturitni_zkouska 
(
	ID int primary key identity(1,1), 
	Prihlaska_k_maturite_ID int foreign key references Prihlaska_k_maturite(ID) not null, 
	Predmet int not null, 
	Typ_zkousky int not null, 
	Termin_zkousky int not null 
)

CREATE UNIQUE INDEX IX_Student_Rodne_cislo_notnull
    ON Student(Rodne_cislo) WHERE Rodne_cislo IS NOT NULL;

CREATE UNIQUE INDEX IX_Student_Email_notnull
    ON Student(Email) WHERE Email IS NOT NULL;

CREATE UNIQUE INDEX IX_Student_Datova_schranka_notnull
    ON Student(Datova_schranka) WHERE Datova_schranka IS NOT NULL;

CREATE UNIQUE INDEX IX_Student_Tel_cislo_notnull
    ON Student(Tel_cislo) WHERE Tel_cislo IS NOT NULL;

CREATE INDEX IX_Student_Adresa
	ON Student(Adresa_ID);

CREATE INDEX IX_Skola_Adresa
	ON Skola(Adresa_ID);

CREATE INDEX IX_Dop_SPZ_Student
	ON Doporuceni_skolskeho_poradenskeho_zarizeni(Student_ID);

CREATE INDEX IX_Dop_SPZ_Skola
	ON Doporuceni_skolskeho_poradenskeho_zarizeni(Skola_ID);

CREATE INDEX IX_Maturitni_Zkouska_Prihlaska
	ON Maturitni_zkouska(Prihlaska_k_maturite_ID);

CREATE INDEX IX_Prihlaska_Skola
	ON Prihlaska_k_maturite(Skola_ID);

CREATE INDEX IX_Prihlaska_Student
	ON Prihlaska_k_maturite(Student_ID);

commit transaction;