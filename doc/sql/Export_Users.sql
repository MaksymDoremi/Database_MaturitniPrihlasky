use master
BEGIN TRANSACTION;

create login administrator with password='123';
create login developer with password='123';
create login manazer with password='123';
create login securityAdministrator with password='123';
create login sekretarka with password='123';

USE [MaturitniDatabaze]
GO
/****** Object:  User [administrator]    Script Date: 30.12.2023 14:22:59 ******/
CREATE USER [administrator] FOR LOGIN [administrator] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [developer]    Script Date: 30.12.2023 14:22:59 ******/
CREATE USER [developer] FOR LOGIN [developer] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [manazer]    Script Date: 30.12.2023 14:22:59 ******/
CREATE USER [manazer] FOR LOGIN [manazer] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [securityAdministrator]    Script Date: 30.12.2023 14:22:59 ******/
CREATE USER [securityAdministrator] FOR LOGIN [securityAdministrator] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sekretarka]    Script Date: 30.12.2023 14:22:59 ******/
CREATE USER [sekretarka] FOR LOGIN [sekretarka] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [administrator]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [developer]
GO
ALTER ROLE [db_datareader] ADD MEMBER [manazer]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [securityAdministrator]
GO
ALTER ROLE [db_datareader] ADD MEMBER [sekretarka]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [sekretarka]
GO
COMMIT TRANSACTION;