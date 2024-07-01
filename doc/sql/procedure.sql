use MaturitniDatabaze

begin transaction;
go

create or alter procedure Pridat_studenta
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

go

create or alter procedure Pridat_skolu
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

go

go

create or alter procedure Pridat_Zkousku
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
							WHEN @Predmet = '�esk� jazyk a literatura' THEN 1
							WHEN @Predmet = 'Anglick� jazyk' THEN 2
							WHEN @Predmet = 'N�meck� jazyk' THEN 3
							WHEN @Predmet = 'Francouzsk� jazyk' THEN 4
							WHEN @Predmet = '�pan�lsk� jazyk' THEN 5
							WHEN @Predmet = 'Rusk� jazyk' THEN 6
							WHEN @Predmet = 'Matematika' THEN 7
							WHEN @Predmet = 'Matematika roz�i�uj�c�' THEN 8
							WHEN @Predmet = 'Programov� vybaven�' THEN 9
							WHEN @Predmet = 'Datab�zov� syst�my' THEN 10
							WHEN @Predmet = 'Po��ta�ov� syst�my a s�t�' THEN 11
							WHEN @Predmet = 'Webov� aplikace' THEN 12
							WHEN @Predmet = 'Aplikace v praxi' THEN 13
							WHEN @Predmet = 'Odborn� pr�ce' THEN 14
						END;

	SELECT @Typ_zkousky_ID = CASE 
								WHEN @Typ_zkousky = 'Povinn� zkou�ka' THEN 1
								WHEN @Typ_zkousky = 'Nepovinn� zkou�ka' THEN 2
							END;

	SELECT @Termin_zkousky_ID = CASE 
									WHEN @Termin_zkousky = '��dn� term�n' THEN 1
									WHEN @Termin_zkousky = 'JNM' THEN 2
									WHEN @Termin_zkousky = 'N�hradn� nebo opravn� zkou�ka' THEN 3
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

go
commit transaction;