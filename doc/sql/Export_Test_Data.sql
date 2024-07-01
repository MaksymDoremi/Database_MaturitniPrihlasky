

USE [MaturitniDatabaze]
BEGIN TRANSACTION;
GO
SET IDENTITY_INSERT [dbo].[Adresa] ON 
GO
INSERT [dbo].[Adresa] ([ID], [Obec], [Ulice], [C_p], [C_o], [Mestska_cast], [PSC]) VALUES (1, N'Praha', N'Behounkova', 2305, 9, N'Praha 13-Stodulky', 15800)
GO
INSERT [dbo].[Adresa] ([ID], [Obec], [Ulice], [C_p], [C_o], [Mestska_cast], [PSC]) VALUES (2, N'Praha', N'Strelecka', 5, 922, N'Praha 2-Nové Mesto', 12000)
GO
INSERT [dbo].[Adresa] ([ID], [Obec], [Ulice], [C_p], [C_o], [Mestska_cast], [PSC]) VALUES (3, N'Brno', N'Ostravská', 100, 9, N'Brno-Sever', 23500)
GO
INSERT [dbo].[Adresa] ([ID], [Obec], [Ulice], [C_p], [C_o], [Mestska_cast], [PSC]) VALUES (4, N'Brno', N'Mestská', 23, 9, N'Brno-Sever', 23500)
GO
INSERT [dbo].[Adresa] ([ID], [Obec], [Ulice], [C_p], [C_o], [Mestska_cast], [PSC]) VALUES (5, N'Praha', N'Jecná', 517, 31, N'Praha 2-Nové Mesto', 12000)
GO
INSERT [dbo].[Adresa] ([ID], [Obec], [Ulice], [C_p], [C_o], [Mestska_cast], [PSC]) VALUES (6, N'Praha', N'Paríská', 123, 1, N'Praha 2-Nové Mesto', 12000)
GO
SET IDENTITY_INSERT [dbo].[Adresa] OFF
GO
SET IDENTITY_INSERT [dbo].[Skola] ON 
GO
INSERT [dbo].[Skola] ([ID], [Adresa_ID], [Nazev], [red_izo], [ICO]) VALUES (1, 5, N'Strední prumyslová škola elektrotechnická', 600004783, 61385301)
GO
INSERT [dbo].[Skola] ([ID], [Adresa_ID], [Nazev], [red_izo], [ICO]) VALUES (2, 5, N'Ta skola naproti', 54545435, 23232)
GO
INSERT [dbo].[Skola] ([ID], [Adresa_ID], [Nazev], [red_izo], [ICO]) VALUES (3, 6, N'Fiktivni skola', 767676, 98707)
GO
SET IDENTITY_INSERT [dbo].[Skola] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 
GO
INSERT [dbo].[Student] ([ID], [Adresa_ID], [Jmeno], [Prijmeni], [Datum_narozeni], [Rodne_cislo], [Email], [Datova_schranka], [Tel_cislo]) VALUES (2, 1, N'Novy jmeno', N'Novy prijmeni', CAST(N'2005-03-12' AS Date), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Student] ([ID], [Adresa_ID], [Jmeno], [Prijmeni], [Datum_narozeni], [Rodne_cislo], [Email], [Datova_schranka], [Tel_cislo]) VALUES (4, 2, N'Anglican', N'Skvely', CAST(N'2005-03-12' AS Date), N'234158/6389', N'anglie@gmail.com', NULL, N'+420 123 456 789')
GO
INSERT [dbo].[Student] ([ID], [Adresa_ID], [Jmeno], [Prijmeni], [Datum_narozeni], [Rodne_cislo], [Email], [Datova_schranka], [Tel_cislo]) VALUES (6, 4, N'Sekretarka ahoj', N'Novotna', CAST(N'2005-03-12' AS Date), N'123455/5555', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
INSERT [dbo].[StudentBackup] ([ID], [Adresa_ID], [Jmeno], [Prijmeni], [Datum_narozeni], [Rodne_cislo], [Email], [Datova_schranka], [Tel_cislo], [Zprava], [Datum_smazani]) VALUES (1, 1, N'Daniel', N'Modry', CAST(N'2005-03-12' AS Date), NULL, NULL, NULL, NULL, N'Smazal a zálohoval LAPTOP-DPDQF7CI\kinto', CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[StudentBackup] ([ID], [Adresa_ID], [Jmeno], [Prijmeni], [Datum_narozeni], [Rodne_cislo], [Email], [Datova_schranka], [Tel_cislo], [Zprava], [Datum_smazani]) VALUES (3, 2, N'Tomas', N'Dobry', CAST(N'2005-03-12' AS Date), NULL, NULL, NULL, N'987 654 321', N'Smazal a zálohoval LAPTOP-DPDQF7CI\kinto', CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[StudentBackup] ([ID], [Adresa_ID], [Jmeno], [Prijmeni], [Datum_narozeni], [Rodne_cislo], [Email], [Datova_schranka], [Tel_cislo], [Zprava], [Datum_smazani]) VALUES (5, 3, N'Martin', N'Belohradsky', CAST(N'2005-03-12' AS Date), N'123456/7890', NULL, NULL, NULL, N'Smazal a zálohoval sekretarka', CAST(N'2023-12-30' AS Date))
GO
SET IDENTITY_INSERT [dbo].[StudentAuditBackup] ON 
GO
INSERT [dbo].[StudentAuditBackup] ([ID], [Student_ID], [Adresa_ID], [Jmeno], [Prijmeni], [Datum_narozeni], [Rodne_cislo], [Email], [Datova_schranka], [Tel_cislo], [Zprava], [Datum_zmeny]) VALUES (1, 2, 1, N'Honza', N'Velky', CAST(N'2005-03-12' AS Date), NULL, NULL, NULL, NULL, N'Hodnoty pred zmenami LAPTOP-DPDQF7CI\kinto', CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[StudentAuditBackup] ([ID], [Student_ID], [Adresa_ID], [Jmeno], [Prijmeni], [Datum_narozeni], [Rodne_cislo], [Email], [Datova_schranka], [Tel_cislo], [Zprava], [Datum_zmeny]) VALUES (2, 6, 4, N'Zuzana', N'Novotna', CAST(N'2005-03-12' AS Date), N'123455/5555', NULL, NULL, NULL, N'Hodnoty pred zmenami sekretarka', CAST(N'2023-12-30' AS Date))
GO
SET IDENTITY_INSERT [dbo].[StudentAuditBackup] OFF
GO
SET IDENTITY_INSERT [dbo].[Doporuceni_skolskeho_poradenskeho_zarizeni] ON 
GO
INSERT [dbo].[Doporuceni_skolskeho_poradenskeho_zarizeni] ([ID], [Skola_ID], [Student_ID], [RED_IZO_SPZ], [Kategorie_PUP], [Datum], [Podpurne_opatreni_a_uzpusobeni]) VALUES (2, 2, 2, 5435, 2, CAST(N'2023-12-30' AS Date), N'ma zrakove postizeni')
GO
INSERT [dbo].[Doporuceni_skolskeho_poradenskeho_zarizeni] ([ID], [Skola_ID], [Student_ID], [RED_IZO_SPZ], [Kategorie_PUP], [Datum], [Podpurne_opatreni_a_uzpusobeni]) VALUES (4, 1, 4, 123456, 4, CAST(N'2023-12-30' AS Date), N'ma vsechno najednou')
GO
SET IDENTITY_INSERT [dbo].[Doporuceni_skolskeho_poradenskeho_zarizeni] OFF
GO
SET IDENTITY_INSERT [dbo].[Prihlaska_k_maturite] ON 
GO
INSERT [dbo].[Prihlaska_k_maturite] ([ID], [Skola_ID], [Student_ID], [Doporuceni_ID], [Forma_vzdelavani], [Obor], [Rok_ukonceni_ss], [Skolni_rok]) VALUES (2, 2, 2, 2, 2, 1, 2024, 20232024)
GO
INSERT [dbo].[Prihlaska_k_maturite] ([ID], [Skola_ID], [Student_ID], [Doporuceni_ID], [Forma_vzdelavani], [Obor], [Rok_ukonceni_ss], [Skolni_rok]) VALUES (4, 1, 4, 4, 4, 2, 2024, 20232024)
GO
INSERT [dbo].[Prihlaska_k_maturite] ([ID], [Skola_ID], [Student_ID], [Doporuceni_ID], [Forma_vzdelavani], [Obor], [Rok_ukonceni_ss], [Skolni_rok]) VALUES (6, 2, 6, NULL, 3, 1, 2024, 20232024)
GO
SET IDENTITY_INSERT [dbo].[Prihlaska_k_maturite] OFF
GO
SET IDENTITY_INSERT [dbo].[Maturitni_zkouska] ON 
GO
INSERT [dbo].[Maturitni_zkouska] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky]) VALUES (5, 2, 5, 1, 1)
GO
INSERT [dbo].[Maturitni_zkouska] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky]) VALUES (6, 2, 6, 1, 1)
GO
INSERT [dbo].[Maturitni_zkouska] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky]) VALUES (7, 2, 7, 1, 1)
GO
INSERT [dbo].[Maturitni_zkouska] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky]) VALUES (8, 2, 8, 2, 3)
GO
INSERT [dbo].[Maturitni_zkouska] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky]) VALUES (13, 4, 4, 2, 1)
GO
INSERT [dbo].[Maturitni_zkouska] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky]) VALUES (14, 4, 2, 2, 1)
GO
INSERT [dbo].[Maturitni_zkouska] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky]) VALUES (15, 4, 7, 1, 1)
GO
INSERT [dbo].[Maturitni_zkouska] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky]) VALUES (16, 4, 14, 1, 1)
GO
INSERT [dbo].[Maturitni_zkouska] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky]) VALUES (21, 6, 1, 1, 1)
GO
INSERT [dbo].[Maturitni_zkouska] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky]) VALUES (22, 6, 2, 1, 1)
GO
INSERT [dbo].[Maturitni_zkouska] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky]) VALUES (23, 6, 7, 1, 1)
GO
INSERT [dbo].[Maturitni_zkouska] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky]) VALUES (24, 6, 9, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Maturitni_zkouska] OFF
GO
INSERT [dbo].[Doporuceni_SPZBackup] ([ID], [Skola_ID], [Student_ID], [RED_IZO_SPZ], [Kategorie_PUP], [Datum], [Podpurne_opatreni_a_uzpusobeni], [Zprava], [Datum_smazani]) VALUES (1, 1, 1, 123456, 1, CAST(N'2023-12-30' AS Date), N'ma telesne postizeni', N'Smazal a zálohoval LAPTOP-DPDQF7CI\kinto', CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[Doporuceni_SPZBackup] ([ID], [Skola_ID], [Student_ID], [RED_IZO_SPZ], [Kategorie_PUP], [Datum], [Podpurne_opatreni_a_uzpusobeni], [Zprava], [Datum_smazani]) VALUES (3, 3, 3, 2222, 3, CAST(N'2023-12-30' AS Date), N'ma sluchove postizeni', N'Smazal a zálohoval LAPTOP-DPDQF7CI\kinto', CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[Maturitni_zkouskaBackup] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky], [Zprava], [Datum_smazani]) VALUES (1, 1, 1, 1, 1, N'Smazal a zálohoval LAPTOP-DPDQF7CI\kinto', CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[Maturitni_zkouskaBackup] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky], [Zprava], [Datum_smazani]) VALUES (2, 1, 2, 1, 1, N'Smazal a zálohoval LAPTOP-DPDQF7CI\kinto', CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[Maturitni_zkouskaBackup] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky], [Zprava], [Datum_smazani]) VALUES (3, 1, 3, 1, 1, N'Smazal a zálohoval LAPTOP-DPDQF7CI\kinto', CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[Maturitni_zkouskaBackup] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky], [Zprava], [Datum_smazani]) VALUES (4, 1, 4, 1, 1, N'Smazal a zálohoval LAPTOP-DPDQF7CI\kinto', CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[Maturitni_zkouskaBackup] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky], [Zprava], [Datum_smazani]) VALUES (9, 3, 9, 1, 2, N'Smazal a zálohoval LAPTOP-DPDQF7CI\kinto', CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[Maturitni_zkouskaBackup] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky], [Zprava], [Datum_smazani]) VALUES (10, 3, 10, 1, 2, N'Smazal a zálohoval LAPTOP-DPDQF7CI\kinto', CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[Maturitni_zkouskaBackup] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky], [Zprava], [Datum_smazani]) VALUES (11, 3, 11, 1, 2, N'Smazal a zálohoval LAPTOP-DPDQF7CI\kinto', CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[Maturitni_zkouskaBackup] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky], [Zprava], [Datum_smazani]) VALUES (12, 3, 12, 1, 2, N'Smazal a zálohoval LAPTOP-DPDQF7CI\kinto', CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[Maturitni_zkouskaBackup] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky], [Zprava], [Datum_smazani]) VALUES (17, 5, 8, 1, 1, N'Smazal a zálohoval sekretarka', CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[Maturitni_zkouskaBackup] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky], [Zprava], [Datum_smazani]) VALUES (18, 5, 11, 1, 1, N'Smazal a zálohoval sekretarka', CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[Maturitni_zkouskaBackup] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky], [Zprava], [Datum_smazani]) VALUES (19, 5, 13, 1, 1, N'Smazal a zálohoval sekretarka', CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[Maturitni_zkouskaBackup] ([ID], [Prihlaska_k_maturite_ID], [Predmet], [Typ_zkousky], [Termin_zkousky], [Zprava], [Datum_smazani]) VALUES (20, 5, 14, 1, 1, N'Smazal a zálohoval sekretarka', CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[PrihlaskaBackup] ([ID], [Skola_ID], [Student_ID], [Doporuceni_ID], [Forma_vzdelavani], [Obor], [Rok_ukonceni_ss], [Skolni_rok], [Zprava], [Datum_smazani]) VALUES (1, 1, 1, 1, 1, 1, 2024, 20232024, N'Smazal a zálohoval LAPTOP-DPDQF7CI\kinto', CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[PrihlaskaBackup] ([ID], [Skola_ID], [Student_ID], [Doporuceni_ID], [Forma_vzdelavani], [Obor], [Rok_ukonceni_ss], [Skolni_rok], [Zprava], [Datum_smazani]) VALUES (3, 3, 3, 3, 3, 2, 2024, 20232024, N'Smazal a zálohoval LAPTOP-DPDQF7CI\kinto', CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[PrihlaskaBackup] ([ID], [Skola_ID], [Student_ID], [Doporuceni_ID], [Forma_vzdelavani], [Obor], [Rok_ukonceni_ss], [Skolni_rok], [Zprava], [Datum_smazani]) VALUES (5, 1, 5, NULL, 5, 2, 2024, 20232024, N'Smazal a zálohoval sekretarka', CAST(N'2023-12-30' AS Date))
GO
COMMIT TRANSACTION: