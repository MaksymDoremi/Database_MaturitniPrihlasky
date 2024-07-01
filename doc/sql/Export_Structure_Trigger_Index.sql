use master

drop database if exists MaturitniDatabaze

go

create database MaturitniDatabaze

USE [MaturitniDatabaze]

BEGIN TRANSACTION;

GO
/****** Object:  Table [dbo].[Adresa]    Script Date: 30.12.2023 14:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adresa](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Obec] [varchar](64) NOT NULL,
	[Ulice] [varchar](64) NOT NULL,
	[C_p] [int] NOT NULL,
	[C_o] [int] NOT NULL,
	[Mestska_cast] [varchar](64) NOT NULL,
	[PSC] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doporuceni_skolskeho_poradenskeho_zarizeni]    Script Date: 30.12.2023 14:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doporuceni_skolskeho_poradenskeho_zarizeni](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Skola_ID] [int] NOT NULL,
	[Student_ID] [int] NOT NULL,
	[RED_IZO_SPZ] [int] NOT NULL,
	[Kategorie_PUP] [int] NOT NULL,
	[Datum] [date] NOT NULL,
	[Podpurne_opatreni_a_uzpusobeni] [varchar](600) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doporuceni_SPZBackup]    Script Date: 30.12.2023 14:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doporuceni_SPZBackup](
	[ID] [int] NOT NULL,
	[Skola_ID] [int] NOT NULL,
	[Student_ID] [int] NOT NULL,
	[RED_IZO_SPZ] [int] NOT NULL,
	[Kategorie_PUP] [int] NOT NULL,
	[Datum] [date] NOT NULL,
	[Podpurne_opatreni_a_uzpusobeni] [varchar](600) NOT NULL,
	[Zprava] [varchar](64) NOT NULL,
	[Datum_smazani] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maturitni_zkouska]    Script Date: 30.12.2023 14:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maturitni_zkouska](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Prihlaska_k_maturite_ID] [int] NOT NULL,
	[Predmet] [int] NOT NULL,
	[Typ_zkousky] [int] NOT NULL,
	[Termin_zkousky] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maturitni_zkouskaBackup]    Script Date: 30.12.2023 14:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maturitni_zkouskaBackup](
	[ID] [int] NOT NULL,
	[Prihlaska_k_maturite_ID] [int] NOT NULL,
	[Predmet] [int] NOT NULL,
	[Typ_zkousky] [int] NOT NULL,
	[Termin_zkousky] [int] NOT NULL,
	[Zprava] [varchar](64) NOT NULL,
	[Datum_smazani] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prihlaska_k_maturite]    Script Date: 30.12.2023 14:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prihlaska_k_maturite](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Skola_ID] [int] NOT NULL,
	[Student_ID] [int] NOT NULL,
	[Doporuceni_ID] [int] NULL,
	[Forma_vzdelavani] [int] NOT NULL,
	[Obor] [int] NOT NULL,
	[Rok_ukonceni_ss] [int] NOT NULL,
	[Skolni_rok] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrihlaskaBackup]    Script Date: 30.12.2023 14:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrihlaskaBackup](
	[ID] [int] NOT NULL,
	[Skola_ID] [int] NOT NULL,
	[Student_ID] [int] NOT NULL,
	[Doporuceni_ID] [int] NULL,
	[Forma_vzdelavani] [int] NOT NULL,
	[Obor] [int] NOT NULL,
	[Rok_ukonceni_ss] [int] NOT NULL,
	[Skolni_rok] [int] NOT NULL,
	[Zprava] [varchar](64) NOT NULL,
	[Datum_smazani] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skola]    Script Date: 30.12.2023 14:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skola](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adresa_ID] [int] NOT NULL,
	[Nazev] [varchar](100) NOT NULL,
	[red_izo] [int] NOT NULL,
	[ICO] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[red_izo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ICO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 30.12.2023 14:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adresa_ID] [int] NOT NULL,
	[Jmeno] [varchar](64) NOT NULL,
	[Prijmeni] [varchar](64) NOT NULL,
	[Datum_narozeni] [date] NOT NULL,
	[Rodne_cislo] [varchar](15) NULL,
	[Email] [varchar](100) NULL,
	[Datova_schranka] [varchar](64) NULL,
	[Tel_cislo] [varchar](16) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentAuditBackup]    Script Date: 30.12.2023 14:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAuditBackup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Student_ID] [int] NOT NULL,
	[Adresa_ID] [int] NOT NULL,
	[Jmeno] [varchar](64) NOT NULL,
	[Prijmeni] [varchar](64) NOT NULL,
	[Datum_narozeni] [date] NOT NULL,
	[Rodne_cislo] [varchar](15) NULL,
	[Email] [varchar](100) NULL,
	[Datova_schranka] [varchar](64) NULL,
	[Tel_cislo] [varchar](16) NULL,
	[Zprava] [varchar](64) NOT NULL,
	[Datum_zmeny] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentBackup]    Script Date: 30.12.2023 14:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentBackup](
	[ID] [int] NOT NULL,
	[Adresa_ID] [int] NOT NULL,
	[Jmeno] [varchar](64) NOT NULL,
	[Prijmeni] [varchar](64) NOT NULL,
	[Datum_narozeni] [date] NOT NULL,
	[Rodne_cislo] [varchar](15) NULL,
	[Email] [varchar](100) NULL,
	[Datova_schranka] [varchar](64) NULL,
	[Tel_cislo] [varchar](16) NULL,
	[Zprava] [varchar](64) NOT NULL,
	[Datum_smazani] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Dop_SPZ_Skola]    Script Date: 30.12.2023 14:18:14 ******/
CREATE NONCLUSTERED INDEX [IX_Dop_SPZ_Skola] ON [dbo].[Doporuceni_skolskeho_poradenskeho_zarizeni]
(
	[Skola_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Dop_SPZ_Student]    Script Date: 30.12.2023 14:18:14 ******/
CREATE NONCLUSTERED INDEX [IX_Dop_SPZ_Student] ON [dbo].[Doporuceni_skolskeho_poradenskeho_zarizeni]
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Maturitni_Zkouska_Prihlaska]    Script Date: 30.12.2023 14:18:14 ******/
CREATE NONCLUSTERED INDEX [IX_Maturitni_Zkouska_Prihlaska] ON [dbo].[Maturitni_zkouska]
(
	[Prihlaska_k_maturite_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Prihlaska_Skola]    Script Date: 30.12.2023 14:18:14 ******/
CREATE NONCLUSTERED INDEX [IX_Prihlaska_Skola] ON [dbo].[Prihlaska_k_maturite]
(
	[Skola_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Prihlaska_Student]    Script Date: 30.12.2023 14:18:14 ******/
CREATE NONCLUSTERED INDEX [IX_Prihlaska_Student] ON [dbo].[Prihlaska_k_maturite]
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Skola_Adresa]    Script Date: 30.12.2023 14:18:14 ******/
CREATE NONCLUSTERED INDEX [IX_Skola_Adresa] ON [dbo].[Skola]
(
	[Adresa_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_Adresa]    Script Date: 30.12.2023 14:18:14 ******/
CREATE NONCLUSTERED INDEX [IX_Student_Adresa] ON [dbo].[Student]
(
	[Adresa_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Student_Datova_schranka_notnull]    Script Date: 30.12.2023 14:18:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Student_Datova_schranka_notnull] ON [dbo].[Student]
(
	[Datova_schranka] ASC
)
WHERE ([Datova_schranka] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Student_Email_notnull]    Script Date: 30.12.2023 14:18:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Student_Email_notnull] ON [dbo].[Student]
(
	[Email] ASC
)
WHERE ([Email] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Student_Rodne_cislo_notnull]    Script Date: 30.12.2023 14:18:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Student_Rodne_cislo_notnull] ON [dbo].[Student]
(
	[Rodne_cislo] ASC
)
WHERE ([Rodne_cislo] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Student_Tel_cislo_notnull]    Script Date: 30.12.2023 14:18:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Student_Tel_cislo_notnull] ON [dbo].[Student]
(
	[Tel_cislo] ASC
)
WHERE ([Tel_cislo] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Doporuceni_skolskeho_poradenskeho_zarizeni]  WITH CHECK ADD FOREIGN KEY([Skola_ID])
REFERENCES [dbo].[Skola] ([ID])
GO
ALTER TABLE [dbo].[Doporuceni_skolskeho_poradenskeho_zarizeni]  WITH CHECK ADD FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Maturitni_zkouska]  WITH CHECK ADD FOREIGN KEY([Prihlaska_k_maturite_ID])
REFERENCES [dbo].[Prihlaska_k_maturite] ([ID])
GO
ALTER TABLE [dbo].[Prihlaska_k_maturite]  WITH CHECK ADD FOREIGN KEY([Doporuceni_ID])
REFERENCES [dbo].[Doporuceni_skolskeho_poradenskeho_zarizeni] ([ID])
GO
ALTER TABLE [dbo].[Prihlaska_k_maturite]  WITH CHECK ADD FOREIGN KEY([Skola_ID])
REFERENCES [dbo].[Skola] ([ID])
GO
ALTER TABLE [dbo].[Prihlaska_k_maturite]  WITH CHECK ADD FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Skola]  WITH CHECK ADD FOREIGN KEY([Adresa_ID])
REFERENCES [dbo].[Adresa] ([ID])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([Adresa_ID])
REFERENCES [dbo].[Adresa] ([ID])
GO
ALTER TABLE [dbo].[StudentAuditBackup]  WITH CHECK ADD FOREIGN KEY([Adresa_ID])
REFERENCES [dbo].[Adresa] ([ID])
GO
ALTER TABLE [dbo].[StudentBackup]  WITH CHECK ADD FOREIGN KEY([Adresa_ID])
REFERENCES [dbo].[Adresa] ([ID])
GO
ALTER TABLE [dbo].[Adresa]  WITH CHECK ADD CHECK  (([C_o]>=(0)))
GO
ALTER TABLE [dbo].[Adresa]  WITH CHECK ADD CHECK  (([C_p]>=(0)))
GO
ALTER TABLE [dbo].[Adresa]  WITH CHECK ADD CHECK  ((len([Mestska_cast])>(2)))
GO
ALTER TABLE [dbo].[Adresa]  WITH CHECK ADD CHECK  ((len([Obec])>(2)))
GO
ALTER TABLE [dbo].[Adresa]  WITH CHECK ADD CHECK  (([PSC]>=(0)))
GO
ALTER TABLE [dbo].[Adresa]  WITH CHECK ADD CHECK  ((len([Ulice])>(2)))
GO
ALTER TABLE [dbo].[Prihlaska_k_maturite]  WITH CHECK ADD CHECK  (([Rok_ukonceni_ss]>=(2000)))
GO
ALTER TABLE [dbo].[PrihlaskaBackup]  WITH CHECK ADD CHECK  (([Rok_ukonceni_ss]>=(2000)))
GO
ALTER TABLE [dbo].[Skola]  WITH CHECK ADD CHECK  ((len([Nazev])>(10)))
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD CHECK  ((len([Datova_schranka])>(3)))
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD CHECK  (([Email] like '%@%.%'))
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD CHECK  ((len([Jmeno])>=(2)))
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD CHECK  ((len([Prijmeni])>=(2)))
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD CHECK  (([Rodne_cislo] like '[0-9][0-9][0-9][0-9][0-9][0-9]/[0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD CHECK  (([Tel_cislo] like '+420[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR [Tel_cislo] like '+420 [0-9][0-9][0-9] [0-9][0-9][0-9] [0-9][0-9][0-9]' OR [Tel_cislo] like '[0-9][0-9][0-9] [0-9][0-9][0-9] [0-9][0-9][0-9]' OR [Tel_cislo] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[StudentAuditBackup]  WITH CHECK ADD CHECK  ((len([Datova_schranka])>(3)))
GO
ALTER TABLE [dbo].[StudentAuditBackup]  WITH CHECK ADD CHECK  (([Email] like '%@%.%'))
GO
ALTER TABLE [dbo].[StudentAuditBackup]  WITH CHECK ADD CHECK  ((len([Jmeno])>=(2)))
GO
ALTER TABLE [dbo].[StudentAuditBackup]  WITH CHECK ADD CHECK  ((len([Prijmeni])>=(2)))
GO
ALTER TABLE [dbo].[StudentAuditBackup]  WITH CHECK ADD CHECK  (([Rodne_cislo] like '[0-9][0-9][0-9][0-9][0-9][0-9]/[0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[StudentAuditBackup]  WITH CHECK ADD CHECK  (([Tel_cislo] like '+420[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR [Tel_cislo] like '+420 [0-9][0-9][0-9] [0-9][0-9][0-9] [0-9][0-9][0-9]' OR [Tel_cislo] like '[0-9][0-9][0-9] [0-9][0-9][0-9] [0-9][0-9][0-9]' OR [Tel_cislo] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[StudentBackup]  WITH CHECK ADD CHECK  ((len([Datova_schranka])>(3)))
GO
ALTER TABLE [dbo].[StudentBackup]  WITH CHECK ADD CHECK  (([Email] like '%@%.%'))
GO
ALTER TABLE [dbo].[StudentBackup]  WITH CHECK ADD CHECK  ((len([Jmeno])>=(2)))
GO
ALTER TABLE [dbo].[StudentBackup]  WITH CHECK ADD CHECK  ((len([Prijmeni])>=(2)))
GO
ALTER TABLE [dbo].[StudentBackup]  WITH CHECK ADD CHECK  (([Rodne_cislo] like '[0-9][0-9][0-9][0-9][0-9][0-9]/[0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[StudentBackup]  WITH CHECK ADD CHECK  (([Tel_cislo] like '+420[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR [Tel_cislo] like '+420 [0-9][0-9][0-9] [0-9][0-9][0-9] [0-9][0-9][0-9]' OR [Tel_cislo] like '[0-9][0-9][0-9] [0-9][0-9][0-9] [0-9][0-9][0-9]' OR [Tel_cislo] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
/****** Object:  Trigger [dbo].[Backup_DoporuceniSPZ]    Script Date: 30.12.2023 14:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   trigger [dbo].[Backup_DoporuceniSPZ] 
on [dbo].[Doporuceni_skolskeho_poradenskeho_zarizeni] 
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
GO
ALTER TABLE [dbo].[Doporuceni_skolskeho_poradenskeho_zarizeni] ENABLE TRIGGER [Backup_DoporuceniSPZ]
GO
/****** Object:  Trigger [dbo].[BackUpZkouska]    Script Date: 30.12.2023 14:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   trigger [dbo].[BackUpZkouska]
on [dbo].[Maturitni_zkouska]
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
GO
ALTER TABLE [dbo].[Maturitni_zkouska] ENABLE TRIGGER [BackUpZkouska]
GO
/****** Object:  Trigger [dbo].[BackUpPrihlaska]    Script Date: 30.12.2023 14:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   trigger [dbo].[BackUpPrihlaska]
on [dbo].[Prihlaska_k_maturite]
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
GO
ALTER TABLE [dbo].[Prihlaska_k_maturite] ENABLE TRIGGER [BackUpPrihlaska]
GO
/****** Object:  Trigger [dbo].[AuditBackupStudent]    Script Date: 30.12.2023 14:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   trigger [dbo].[AuditBackupStudent]
on [dbo].[Student]
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
					select d.ID, d.Adresa_id, d.Jmeno, d.Prijmeni, d.Datum_narozeni, d.Rodne_cislo, d.Email, d.Datova_schranka, d.Tel_cislo, Concat('Hodnoty před změnami ',SUSER_NAME()), GETDATE() 
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


					print(concat('Student s ID=',@ID,' byl zálohovan a změněn'))
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

GO
ALTER TABLE [dbo].[Student] ENABLE TRIGGER [AuditBackupStudent]
GO
/****** Object:  Trigger [dbo].[BackUpStudent]    Script Date: 30.12.2023 14:18:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   trigger [dbo].[BackUpStudent] 
on [dbo].[Student] 
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
GO
ALTER TABLE [dbo].[Student] ENABLE TRIGGER [BackUpStudent]
GO

COMMIT TRANSACTION;