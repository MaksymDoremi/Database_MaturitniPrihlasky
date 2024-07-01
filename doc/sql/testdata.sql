use MaturitniDatabaze


begin transaction;
go


execute Pridat_studenta 'Daniel', 'Modry', '2005-03-12', null, null, null, null, 'Praha', 'Bìhounkova', 2305, 9, 'Praha 13-Stodùlky', '15800';
execute Pridat_studenta 'Honza', 'Velky', '2005-03-12', null, null, null, null, 'Praha', 'Bìhounkova', 2305, 9, 'Praha 13-Stodùlky', '15800';
execute Pridat_studenta 'Tomas', 'Dobry', '2005-03-12', null, null, null, '987 654 321', 'Praha', 'Strelecka', 5, 922, 'Praha 2-Nové Mìsto', '12000';
execute Pridat_studenta 'Anglican', 'Skvely', '2005-03-12', '234158/6389', 'anglie@gmail.com', null, '+420 123 456 789', 'Praha', 'Strelecka', 5, 922, 'Praha 2-Nové Mìsto', '12000';
execute Pridat_studenta 'Martin', 'Belohradsky', '2005-03-12', '123456/7890', null, null, null, 'Brno', 'Ostravská', 100, 9, 'Brno-Sever', '23500';
execute Pridat_studenta 'Zuzana', 'Novotna', '2005-03-12', '123455/5555', null, null, null, 'Brno', 'Mìstská', 23, 9, 'Brno-Sever', '23500';

EXEC Pridat_skolu 
	@Nazev = 'Støední prùmyslová škola elektrotechnická',
	@red_izo = 600004783,
    @ICO = 61385301,
    @Obec = 'Praha',
    @Ulice = 'Jeèná',
    @C_p = 517,
    @C_o = 31,
    @Mestska_cast = 'Praha 2-Nové Mìsto',
    @PSC = 12000;

EXEC Pridat_skolu 
	@Nazev = 'Ta skola naproti',
	@red_izo = 54545435,
    @ICO = 23232,
    @Obec = 'Praha',
    @Ulice = 'Jeèná',
    @C_p = 517,
    @C_o = 31,
    @Mestska_cast = 'Praha 2-Nové Mìsto',
    @PSC = 12000;

EXEC Pridat_skolu 
	@Nazev = 'Fiktivni skola',
	@red_izo = 767676,
    @ICO = 98707,
    @Obec = 'Praha',
    @Ulice = 'Paøíská',
    @C_p = 123,
    @C_o = 1,
    @Mestska_cast = 'Praha 2-Nové Mìsto',
    @PSC = 12000;


insert into Doporuceni_skolskeho_poradenskeho_zarizeni(Skola_ID, Student_ID, RED_IZO_SPZ, Kategorie_PUP, Datum, Podpurne_opatreni_a_uzpusobeni)
values(1,1,123456,1,GETDATE(),'ma telesne postizeni');

insert into Doporuceni_skolskeho_poradenskeho_zarizeni(Skola_ID, Student_ID, RED_IZO_SPZ, Kategorie_PUP, Datum, Podpurne_opatreni_a_uzpusobeni)
values(2,2,5435,2,GETDATE(),'ma zrakove postizeni');

insert into Doporuceni_skolskeho_poradenskeho_zarizeni(Skola_ID, Student_ID, RED_IZO_SPZ, Kategorie_PUP, Datum, Podpurne_opatreni_a_uzpusobeni)
values(3,3,2222,3,GETDATE(),'ma sluchove postizeni');

insert into Doporuceni_skolskeho_poradenskeho_zarizeni(Skola_ID, Student_ID, RED_IZO_SPZ, Kategorie_PUP, Datum, Podpurne_opatreni_a_uzpusobeni)
values(1,4,123456,4,GETDATE(),'ma vsechno najednou');

insert into Prihlaska_k_maturite(Skola_ID, Student_ID,Doporuceni_ID, Forma_vzdelavani, Obor, Rok_ukonceni_ss, Skolni_rok)
values(1,1,1,1,1,2024,20232024);

insert into Prihlaska_k_maturite(Skola_ID, Student_ID,Doporuceni_ID, Forma_vzdelavani, Obor, Rok_ukonceni_ss, Skolni_rok)
values(2,2,2,2,1,2024,20232024);

insert into Prihlaska_k_maturite(Skola_ID, Student_ID,Doporuceni_ID, Forma_vzdelavani, Obor, Rok_ukonceni_ss, Skolni_rok)
values(3,3,3,3,2,2024,20232024);

insert into Prihlaska_k_maturite(Skola_ID, Student_ID,Doporuceni_ID, Forma_vzdelavani, Obor, Rok_ukonceni_ss, Skolni_rok)
values(1,4,4,4,2,2024,20232024);

insert into Prihlaska_k_maturite(Skola_ID, Student_ID,Doporuceni_ID, Forma_vzdelavani, Obor, Rok_ukonceni_ss, Skolni_rok)
values(1,5,null,5,2,2024,20232024);

insert into Prihlaska_k_maturite(Skola_ID, Student_ID,Doporuceni_ID, Forma_vzdelavani, Obor, Rok_ukonceni_ss, Skolni_rok)
values(2,6,null,3,1,2024,20232024);

insert into Maturitni_zkouska(Prihlaska_k_maturite_ID, Predmet, Typ_zkousky, Termin_zkousky)
values(1,1,1,1),
(1,2,1,1),
(1,3,1,1),
(1,4,1,1);

insert into Maturitni_zkouska(Prihlaska_k_maturite_ID, Predmet, Typ_zkousky, Termin_zkousky)
values(2,5,1,1),
(2,6,1,1),
(2,7,1,1),
(2,8,2,3);

insert into Maturitni_zkouska(Prihlaska_k_maturite_ID, Predmet, Typ_zkousky, Termin_zkousky)
values(3,9,1,2),
(3,10,1,2),
(3,11,1,2),
(3,12,1,2);

insert into Maturitni_zkouska(Prihlaska_k_maturite_ID, Predmet, Typ_zkousky, Termin_zkousky)
values(4,4,2,1),
(4,2,2,1),
(4,7,1,1),
(4,14,1,1);

insert into Maturitni_zkouska(Prihlaska_k_maturite_ID, Predmet, Typ_zkousky, Termin_zkousky)
values(5,8,1,1),
(5,11,1,1),
(5,13,1,1),
(5,14,1,1);

insert into Maturitni_zkouska(Prihlaska_k_maturite_ID, Predmet, Typ_zkousky, Termin_zkousky)
values(6,1,1,1),
(6,2,1,1),
(6,7,1,1),
(6,9,1,1);

commit transaction;
/*
select * from Skola;
select * from StudentBackUp;
select * from StudentAuditBackup;
select * from PrihlaskaBackup;
select * from Maturitni_zkouskaBackup;
select * from Doporuceni_SPZBackup;
select * from Student;
select * from Adresa;
select * from Prihlaska_k_maturite;
select * from Maturitni_zkouska;
select * from Doporuceni_skolskeho_poradenskeho_zarizeni;
select * from Studenty_prihlasky;
select * from Studenty_zkousky where [Jméno] = 'Anglican';
select * from Doporuceni_studenty;
select * from Studenty_vypis;
select * from Skoly_vypis;

delete from Student
where ID = 3;

update Student
set Jmeno='Novy jmeno',
Prijmeni='Novy prijmeni'
where ID = 2;

delete from Doporuceni_skolskeho_poradenskeho_zarizeni
where ID = 3;

select * from Maturitni_zkouska;
select * from Maturitni_zkouskaBackup;
select * from Doporuceni_SPZBackup;
select * from PrihlaskaBackup;
select * from StudentBackUp;
*/