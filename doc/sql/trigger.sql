use MaturitniDatabaze

go

begin transaction;
create table StudentBackup(
	ID int primary key , 
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
    ),
	Zprava varchar(64) not null,
	Datum_smazani date not null
)

create table StudentAuditBackup(
	ID int primary key identity(1,1),
	Student_ID int not null, 
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
    ),
	Zprava varchar(64) not null,
	Datum_zmeny date not null
)

create table PrihlaskaBackup(
	ID int primary key, 
	Skola_ID int not null,
	Student_ID int not null,
	Doporuceni_ID int,
	Forma_vzdelavani int not null,  
	Obor int not null, 
	Rok_ukonceni_ss int not null check(Rok_ukonceni_ss >= 2000),
	Skolni_rok int not null,
	Zprava varchar(64) not null,
	Datum_smazani date not null
)

create table Maturitni_zkouskaBackup(
	ID int primary key, 
	Prihlaska_k_maturite_ID int not null, 
	Predmet int not null, 
	Typ_zkousky int not null, 
	Termin_zkousky int not null,
	Zprava varchar(64) not null,
	Datum_smazani date not null
)

create table Doporuceni_SPZBackup(
	ID int primary key,
	Skola_ID int not null,
	Student_ID int not null,
	RED_IZO_SPZ int not null, 
	Kategorie_PUP int not null, 
	Datum date not null,
	Podpurne_opatreni_a_uzpusobeni varchar(600) not null,
	Zprava varchar(64) not null,
	Datum_smazani date not null
)
commit transaction;


begin transaction;
go

create or alter trigger BackUpStudent 
on Student 
instead of delete
as
begin try
	begin transaction;
		declare @ID int
		select @ID = d.ID from deleted d

		begin
			if (not exists(select * from Student where ID = @ID))
				begin;
					print('Student s zadanym ID neexistuje')
				end;
			else
				begin;
					print(concat('Deleting STUDENT ID=',@ID))
					
					--delete from Maturitni_zkouska where Prihlaska_k_maturite_ID = (select pkm.ID from Prihlaska_k_maturite pkm where Student_ID = @ID)
					delete from Prihlaska_k_maturite where Student_ID = @ID
					delete from Doporuceni_skolskeho_poradenskeho_zarizeni where Student_ID = @ID

					delete from Student where ID = @ID

					insert into StudentBackup(ID, Adresa_ID, Jmeno, Prijmeni, Datum_narozeni, Rodne_cislo, Email, Datova_schranka, Tel_cislo, Zprava, Datum_smazani)
					select d.ID, d.Adresa_id, d.Jmeno, d.Prijmeni, d.Datum_narozeni, d.Rodne_cislo, d.Email, d.Datova_schranka, d.Tel_cislo, Concat('Smazal a zálohoval ',SUSER_NAME()), GETDATE() 
					from deleted d;
					

					print(concat('Student s ID=',@ID,' byl smazan'))
				end;
		end;		
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

create or alter trigger Backup_DoporuceniSPZ 
on Doporuceni_skolskeho_poradenskeho_zarizeni 
instead of delete
as
begin try
	begin transaction;
		declare @ID int
		select @ID = d.ID from deleted d

		begin
			if (not exists(select * from Doporuceni_skolskeho_poradenskeho_zarizeni where ID = @ID))
				begin;
					print('Doporuceni_skolskeho_poradenskeho_zarizeni s zadanym ID neexistuje')
				end;
			else
				begin;
					print(concat('Deleting DoporuceniSPZ ID=',@ID))
					update Prihlaska_k_maturite
					set Doporuceni_ID = null
					where Doporuceni_ID = @ID;

					delete from Doporuceni_skolskeho_poradenskeho_zarizeni where ID = @ID

					insert into Doporuceni_SPZBackup(ID, Skola_ID, Student_ID,RED_IZO_SPZ, Kategorie_PUP, Datum, Podpurne_opatreni_a_uzpusobeni , Zprava, Datum_smazani)
					select d.ID, d.Skola_ID, d.Student_ID,d.RED_IZO_SPZ, d.Kategorie_PUP, d.Datum, d.Podpurne_opatreni_a_uzpusobeni, Concat('Smazal a zálohoval ',SUSER_NAME()), GETDATE() 
					from deleted d;
					

					print(concat('Doporuceni_skolskeho_poradenskeho_zarizeni s ID=',@ID,' byl smazan'))
				end;
		end;		
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
create or alter trigger BackUpPrihlaska
on Prihlaska_k_maturite
instead of delete
as
begin try
	begin transaction;
		declare @ID int
		select @ID = d.ID from deleted d

		begin
			if (not exists(select * from Prihlaska_k_maturite where ID = @ID))
				begin;
					print('Prihlaska k maturite s zadanym ID neexistuje')
				end;
			else
				begin;
					print(Concat('Deleting PRIHLASKA ID=', @ID))
				
					delete from Maturitni_zkouska where Prihlaska_k_maturite_ID = @ID	
					delete from Prihlaska_k_maturite where ID = @ID

					insert into PrihlaskaBackup(ID, Skola_ID, Student_ID,Doporuceni_ID, Forma_vzdelavani, Obor, Rok_ukonceni_ss, Skolni_rok, Zprava, Datum_smazani)
					select d.ID, d.Skola_ID, d.Student_ID, d.Doporuceni_ID, d.Forma_vzdelavani, d.Obor, d.Rok_ukonceni_ss, d.Skolni_rok, Concat('Smazal a zálohoval ',SUSER_NAME()), GETDATE() 
					from deleted d;
	
					print(concat('Prihlaska k maturite s ID=',@ID,' byla smazana'))
				end;
		end;		
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
create or alter trigger BackUpZkouska
on Maturitni_zkouska
after delete
as
begin try
	begin transaction;
		declare @ID int
		declare @Prihlaska_k_maturite_ID int 
		declare @Predmet int  
		declare @Typ_zkousky int  
		declare @Termin_zkousky int
		select @ID = d.ID, @Prihlaska_k_maturite_ID=d.Prihlaska_k_maturite_ID,
		@Predmet=d.Predmet, @Typ_zkousky=d.Typ_zkousky, @Termin_zkousky=d.Termin_zkousky from deleted d
		PRINT(CONCAT('zkouska ID=', @ID, ', Prihlaska_k_maturite_ID=', @Prihlaska_k_maturite_ID, ', Predmet=', @Predmet, ', Typ_zkousky=', @Typ_zkousky, ', Termin_zkousky=', @Termin_zkousky));
		begin
			--if not exists (select 1 from Maturitni_zkouska where ID = @ID)
				--begin
					--print('Maturitni zkouska s zadanym ID neexistuje')
				--end
			--else
				--begin
					print(Concat('Deleting ZKOUSKA ID=', @ID))
					--delete from Maturitni_zkouska where ID = @ID

					insert into Maturitni_zkouskaBackup(ID, Prihlaska_k_maturite_ID, Predmet,Typ_zkousky, Termin_zkousky, Zprava, Datum_smazani)
					select d.ID, d.Prihlaska_k_maturite_ID, d.Predmet, d.Typ_zkousky, d.Termin_zkousky, Concat('Smazal a zálohoval ',SUSER_NAME()), GETDATE() 
					from deleted d;
	
					print(concat('Maturitni zkouska s ID=',@ID,' byla smazana'))
				--end
		end		
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

create or alter trigger AuditBackupStudent
on Student
instead of update
as
begin try
	begin transaction;
		declare @ID int
		select @ID = i.ID from inserted i

		begin
			if (not exists(select * from Student where ID = @ID))
				begin;
					print('Student s zadaným ID neexistuje')
				end;
			else
				begin;
					insert into StudentAuditBackup(Student_ID, Adresa_ID, Jmeno, Prijmeni, Datum_narozeni, Rodne_cislo, Email, Datova_schranka, Tel_cislo, Zprava, Datum_zmeny)
					select d.ID, d.Adresa_id, d.Jmeno, d.Prijmeni, d.Datum_narozeni, d.Rodne_cislo, d.Email, d.Datova_schranka, d.Tel_cislo, Concat('Hodnoty pøed zmìnami ',SUSER_NAME()), GETDATE() 
					from deleted d;
	
					UPDATE Student
					set 
						Adresa_ID = i.Adresa_ID,
						Jmeno = i.Jmeno,
						Prijmeni = i.Prijmeni,
						Datum_narozeni = i.Datum_narozeni,
						Rodne_cislo = i.Rodne_cislo,
						Email = i.Email,
						Datova_schranka = i.Datova_schranka,
						Tel_cislo = i.Tel_cislo
					from inserted i
					where Student.ID = i.ID;


					print(concat('Student s ID=',@ID,' byl zálohovan a zmìnìn'))
				end;
		end;		
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