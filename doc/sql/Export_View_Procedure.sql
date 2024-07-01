USE [MaturitniDatabaze]

BEGIN TRANSACTION;

GO
/****** Object:  View [dbo].[Doporuceni_studenty]    Script Date: 30.12.2023 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   view [dbo].[Doporuceni_studenty]
as
SELECT
    s.Jmeno AS 'Jméno',
    s.Prijmeni AS 'Příjmení',
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
GO
/****** Object:  View [dbo].[Skoly_vypis]    Script Date: 30.12.2023 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   view [dbo].[Skoly_vypis]
as
select 
s.Nazev, 
s.red_izo, 
s.ICO as 'IČO',
a.Obec,  
CONCAT(a.Ulice,' ',a.C_p,'/',a.C_o) as 'Ulice',a.Mestska_cast as 'Městská část',a.PSC as 'PSČ'
from Skola s
join Adresa a
on s.Adresa_ID = a.ID;

GO
/****** Object:  View [dbo].[Studenty_prihlasky]    Script Date: 30.12.2023 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   view [dbo].[Studenty_prihlasky]
as
SELECT
    s.Jmeno AS 'Jméno',
    s.Prijmeni AS 'Příjmení',
    s.Datum_narozeni AS 'Datum narození',
    sk.Nazev AS 'Název školy',
	CONCAT(a.Ulice,' ',a.C_p,'/',a.C_o) as 'Adresa',
	CONCAT(SUBSTRING(CAST(pkm.Skolni_rok AS VARCHAR(8)), 1, 4), '/', SUBSTRING(CAST(pkm.Skolni_rok AS VARCHAR(8)), 5, 4)) as 'Školní rok',
    CASE pkm.Forma_vzdelavani
        WHEN 1 THEN 'Denní'
        WHEN 2 THEN 'Večerní'
        WHEN 3 THEN 'Dálková'
        WHEN 4 THEN 'Distanční'
        WHEN 5 THEN 'Kombinovaná'
		ELSE CONCAT('Forma vzdělávání ',pkm.Forma_vzdelavani, ' neexistuje')
    END AS 'Forma vzdělávání',
    CASE pkm.Obor
        WHEN 1 THEN 'Informační technologie 18-20-M/01'
        WHEN 2 THEN 'Elektrotechnika 26-41-M/01'
		ELSE CONCAT('Obor ',pkm.Obor, ' neexistuje')
    END AS 'Obor',
	pkm.Rok_ukonceni_ss as 'Rok úspešného ukončení SŠ'
FROM
    Student s
    JOIN Prihlaska_k_maturite pkm ON s.ID = pkm.Student_ID
    JOIN Skola sk ON pkm.Skola_ID = sk.ID
	JOIN Adresa a ON sk.Adresa_ID = a.ID;
GO
/****** Object:  View [dbo].[Studenty_vypis]    Script Date: 30.12.2023 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   view [dbo].[Studenty_vypis]
as
select 
s.Jmeno AS 'Jméno',
s.Prijmeni AS 'Příjmení',
s.Datum_narozeni AS 'Datum narození',
a.Obec,  
CONCAT(a.Ulice,' ',a.C_p,'/',a.C_o) as 'Ulice',a.Mestska_cast as 'Městská část',a.PSC as 'PSČ'
from Student s
join Adresa a
on s.Adresa_ID = a.ID;

GO
/****** Object:  View [dbo].[Studenty_zkousky]    Script Date: 30.12.2023 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   view [dbo].[Studenty_zkousky]
as
SELECT
    s.Jmeno AS 'Jméno',
    s.Prijmeni AS 'Příjmení',
    s.Datum_narozeni AS 'Datum narození',
    sk.Nazev AS 'Název školy',
	CONCAT(a.Ulice,' ',a.C_p,'/',a.C_o) as 'Adresa',
	CONCAT(SUBSTRING(CAST(pkm.Skolni_rok AS VARCHAR(8)), 1, 4), '/', SUBSTRING(CAST(pkm.Skolni_rok AS VARCHAR(8)), 5, 4)) as 'Školní rok',
    CASE zk.Predmet
        WHEN 1 THEN 'Český jazyk a literatura'
        WHEN 2 THEN 'Anglický jazyk'
        WHEN 3 THEN 'Německý jazyk'
        WHEN 4 THEN 'Francouzský jazyk'
        WHEN 5 THEN 'Španělský jazyk'
        WHEN 6 THEN 'Ruský jazyk'
        WHEN 7 THEN 'Matematika'
        WHEN 8 THEN 'Matematika rozšiřující'
        WHEN 9 THEN 'Programové vybavení'
        WHEN 10 THEN 'Databázové systémy'
        WHEN 11 THEN 'Počítačové systémy a sítě'
        WHEN 12 THEN 'Webové aplikace'
        WHEN 13 THEN 'Aplikace v praxi'
        WHEN 14 THEN 'Odborná práce'
		ELSE CONCAT('Předmět ',zk.Predmet, ' neexistuje')
    END AS 'Předmět',
    CASE zk.Typ_zkousky
        WHEN 1 THEN 'Povinná zkouška'
        WHEN 2 THEN 'Nepovinná zkouška'
		ELSE CONCAT('Typ zkoušky ',zk.Typ_zkousky, ' neexistuje')
    END AS 'Typ zkoušky',
    CASE zk.Termin_zkousky
        WHEN 1 THEN 'Řádný termín'
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
GO
/****** Object:  StoredProcedure [dbo].[Pridat_skolu]    Script Date: 30.12.2023 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[Pridat_skolu]
	(@Nazev varchar(100),
	@red_izo int,
	@ICO int,
	@Obec varchar(64),
	@Ulice varchar(64),
	@C_p int,
	@C_o int,
	@Mestska_cast varchar(64),
	@PSC int)
as
begin try
	begin transaction;
		declare @Adresa_id int;

		select @Adresa_id = (select a.ID 
		from Adresa a
		where a.Obec = @Obec 
		and a.Ulice = @Ulice
		and a.C_p = @C_p 
		and a.C_o = @C_o
		and a.Mestska_cast = @Mestska_cast 
		and a.PSC = @PSC)

		if @Adresa_id is null
		begin
			insert into Adresa(Obec, Ulice, C_p, C_o, Mestska_cast, PSC)
			values(@Obec ,@Ulice ,@C_p,@C_o ,@Mestska_cast ,@PSC);
			SET @Adresa_id = SCOPE_IDENTITY();
		end

		insert into Skola(Adresa_ID, Nazev, red_izo, ICO)
		values(@Adresa_id, @Nazev, @red_izo, @ICO);

	commit transaction;
end try
begin catch
	IF @@TRANCOUNT > 0
		ROLLBACK

	DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT;
	SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY();
	RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
end catch;

GO
/****** Object:  StoredProcedure [dbo].[Pridat_studenta]    Script Date: 30.12.2023 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[Pridat_studenta]
	(@Student_jmeno varchar(64), 
	@Student_prijmeni varchar(64), 
	@Datum_narozeni date, 
	@Rodne_cislo varchar(15) = null,
	@Email varchar(100) = null,
	@Datova_schranka varchar(64) = null,
	@Tel_cislo varchar(16) = null,
	@Obec varchar(64),
	@Ulice varchar(64),
	@C_p int,
	@C_o int,
	@Mestska_cast varchar(64),
	@PSC int)
as
begin try
	begin transaction;
		declare @Adresa_id int;

		select @Adresa_id = (select a.ID 
		from Adresa a
		where a.Obec = @Obec 
		and a.Ulice = @Ulice
		and a.C_p = @C_p 
		and a.C_o = @C_o
		and a.Mestska_cast = @Mestska_cast 
		and a.PSC = @PSC)

		if @Adresa_id is null
		begin
			insert into Adresa(Obec, Ulice, C_p, C_o, Mestska_cast, PSC)
			values(@Obec ,@Ulice ,@C_p,@C_o ,@Mestska_cast ,@PSC);
			SET @Adresa_id = SCOPE_IDENTITY();
		end

		insert into Student(Adresa_ID, Jmeno, Prijmeni, Datum_narozeni, Rodne_cislo, Email, Datova_schranka, Tel_cislo)
		values(@Adresa_id, @Student_jmeno, @Student_prijmeni, @Datum_narozeni, @Rodne_cislo, @Email, @Datova_schranka, @Tel_cislo);

	commit transaction;
end try
begin catch
	IF @@TRANCOUNT > 0
		ROLLBACK

	DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT;
	SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY();
	RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
end catch;

GO
/****** Object:  StoredProcedure [dbo].[Pridat_Zkousku]    Script Date: 06.01.2024 19:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[Pridat_Zkousku]
	(@Prihlaska_k_maturite_ID int,
	@Predmet varchar(64),
	@Typ_zkousky varchar(64),
	@Termin_zkousky varchar(64)
	)
as
begin try
	begin transaction;
		
	DECLARE @Predmet_ID INT, @Typ_zkousky_ID INT, @Termin_zkousky_ID INT;

	SELECT @Predmet_ID = CASE 
							WHEN @Predmet = 'Český jazyk a literatura' THEN 1
							WHEN @Predmet = 'Anglický jazyk' THEN 2
							WHEN @Predmet = 'Německý jazyk' THEN 3
							WHEN @Predmet = 'Francouzský jazyk' THEN 4
							WHEN @Predmet = 'Španělský jazyk' THEN 5
							WHEN @Predmet = 'Ruský jazyk' THEN 6
							WHEN @Predmet = 'Matematika' THEN 7
							WHEN @Predmet = 'Matematika rozšiřující' THEN 8
							WHEN @Predmet = 'Programové vybavení' THEN 9
							WHEN @Predmet = 'Databázové systémy' THEN 10
							WHEN @Predmet = 'Počítačové systémy a sítě' THEN 11
							WHEN @Predmet = 'Webové aplikace' THEN 12
							WHEN @Predmet = 'Aplikace v praxi' THEN 13
							WHEN @Predmet = 'Odborná práce' THEN 14
						END;

	SELECT @Typ_zkousky_ID = CASE 
								WHEN @Typ_zkousky = 'Povinná zkouška' THEN 1
								WHEN @Typ_zkousky = 'Nepovinná zkouška' THEN 2
							END;

	SELECT @Termin_zkousky_ID = CASE 
									WHEN @Termin_zkousky = 'Řádný termín' THEN 1
									WHEN @Termin_zkousky = 'JNM' THEN 2
									WHEN @Termin_zkousky = 'Náhradní nebo opravná zkouška' THEN 3
								END;

	-- Insert into Maturitni_zkouska table
	INSERT INTO Maturitni_zkouska (Prihlaska_k_maturite_ID, Predmet, Typ_zkousky, Termin_zkousky)
	VALUES (@Prihlaska_k_maturite_ID, @Predmet_ID, @Typ_zkousky_ID, @Termin_zkousky_ID);


	commit transaction;
end try
begin catch
	IF @@TRANCOUNT > 0
		ROLLBACK

	DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT;
	SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY();
	RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
end catch;

GO

COMMIT TRANSACTION;