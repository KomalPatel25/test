USE [master]
GO
/****** Object:  Database [NU_Challenge]    Script Date: 7/8/2019 4:37:50 PM ******/
CREATE DATABASE [NU_Challenge]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NU_Challenge', FILENAME = N'D:\SQLData\Databases\NU_Challenge.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NU_Challenge_log', FILENAME = N'D:\SQLData\Databases\NU_Challenge.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NU_Challenge] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NU_Challenge].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NU_Challenge] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NU_Challenge] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NU_Challenge] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NU_Challenge] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NU_Challenge] SET ARITHABORT OFF 
GO
ALTER DATABASE [NU_Challenge] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NU_Challenge] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NU_Challenge] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NU_Challenge] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NU_Challenge] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NU_Challenge] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NU_Challenge] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NU_Challenge] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NU_Challenge] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NU_Challenge] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NU_Challenge] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NU_Challenge] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NU_Challenge] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NU_Challenge] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NU_Challenge] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NU_Challenge] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NU_Challenge] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NU_Challenge] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NU_Challenge] SET  MULTI_USER 
GO
ALTER DATABASE [NU_Challenge] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NU_Challenge] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NU_Challenge] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NU_Challenge] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NU_Challenge', N'ON'
GO
USE [NU_Challenge]
GO
/****** Object:  User [MARKETTRACK\rajendrap]    Script Date: 7/8/2019 4:37:50 PM ******/
CREATE USER [MARKETTRACK\rajendrap] FOR LOGIN [MARKETTRACK\rajendrap] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [MARKETTRACK\npatel]    Script Date: 7/8/2019 4:37:50 PM ******/
CREATE USER [MARKETTRACK\npatel] FOR LOGIN [MARKETTRACK\npatel] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [MARKETTRACK\meet.soni]    Script Date: 7/8/2019 4:37:50 PM ******/
CREATE USER [MARKETTRACK\meet.soni] FOR LOGIN [MARKETTRACK\meet.soni] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [MARKETTRACK\komalp]    Script Date: 7/8/2019 4:37:50 PM ******/
CREATE USER [MARKETTRACK\komalp] FOR LOGIN [MARKETTRACK\komalp] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [MARKETTRACK\jsavliya]    Script Date: 7/8/2019 4:37:50 PM ******/
CREATE USER [MARKETTRACK\jsavliya] FOR LOGIN [MARKETTRACK\jsavliya] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [MARKETTRACK\rajendrap]
GO
ALTER ROLE [db_owner] ADD MEMBER [MARKETTRACK\meet.soni]
GO
ALTER ROLE [db_owner] ADD MEMBER [MARKETTRACK\komalp]
GO
ALTER ROLE [db_owner] ADD MEMBER [MARKETTRACK\jsavliya]
GO
/****** Object:  Table [dbo].[Answer_Master]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer_Master](
	[AnswerID] [bigint] IDENTITY(1,1) NOT NULL,
	[QuestionID] [bigint] NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
	[CorrectFlag] [bit] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Answer_Master] PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language_Master]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language_Master](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[Language] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Language_Master] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question_Master]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_Master](
	[QuestionID] [bigint] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NULL,
	[QuestionType] [int] NULL,
	[QuestionLevel] [int] NULL,
	[DifficultyType] [int] NULL,
	[Score] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_Question_Master] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Master]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Master](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[MiddleName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Birthdate] [datetime] NULL,
	[Phone] [varchar](50) NULL,
	[Gender] [int] NULL,
	[Experience] [int] NULL,
	[LanguagesKnown] [nvarchar](max) NULL,
	[City] [nvarchar](500) NULL,
	[State] [nvarchar](500) NULL,
	[Country] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_User_Master] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Submission]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Submission](
	[SubmissionID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NULL,
	[QuestionID] [bigint] NULL,
	[AnswerID] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_User_Submission] PRIMARY KEY CLUSTERED 
(
	[SubmissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Answer_Master] ADD  CONSTRAINT [DF_Answer_Master_CorrectFlag]  DEFAULT ((0)) FOR [CorrectFlag]
GO
ALTER TABLE [dbo].[Answer_Master] ADD  CONSTRAINT [DF_Answer_Master_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
GO
ALTER TABLE [dbo].[Language_Master] ADD  CONSTRAINT [DF_Language_Master_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
GO
ALTER TABLE [dbo].[Question_Master] ADD  CONSTRAINT [DF_Question_Master_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
GO
ALTER TABLE [dbo].[User_Master] ADD  CONSTRAINT [DF_User_Master_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[User_Master] ADD  CONSTRAINT [DF_User_Master_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
GO
ALTER TABLE [dbo].[User_Submission] ADD  CONSTRAINT [DF_User_Submission_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
GO
/****** Object:  StoredProcedure [dbo].[usp_Answer_Master_Delete]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Answer_Master_Delete]
	@AnswerID bigint
AS
SET NOCOUNT ON

DELETE FROM Answer_Master
WHERE [AnswerID] = @AnswerID

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Answer_Master_InsertUpdate]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Answer_Master_InsertUpdate]

	@AnswerID bigint,
	@QuestionID bigint,
	@Answer nvarchar(max),
	@CorrectFlag bit,
	@DeleteFlag bit
AS
SET NOCOUNT ON
IF @AnswerID = 0 BEGIN
	INSERT INTO Answer_Master (
		[QuestionID],
		[Answer],
		[CorrectFlag],
		[DeleteFlag]
	)
	VALUES (
		@QuestionID,
		@Answer,
		@CorrectFlag,
		@DeleteFlag
	)
	SELECT SCOPE_IDENTITY() As InsertedID
END
ELSE BEGIN
	UPDATE Answer_Master SET 
		[QuestionID] = @QuestionID,
		[Answer] = @Answer,
		[CorrectFlag] = @CorrectFlag,
		[DeleteFlag] = @DeleteFlag
	WHERE [AnswerID] = @AnswerID

END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Answer_Master_SelectAll]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Answer_Master_SelectAll]
AS
SET NOCOUNT ON

SELECT [AnswerID], 
	[QuestionID], 
	[Answer], 
	[CorrectFlag], 
	[DeleteFlag]
FROM Answer_Master


SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Answer_Master_SelectOne]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Answer_Master_SelectOne]
	@AnswerID bigint
AS
SET NOCOUNT ON

SELECT [AnswerID], 
	[QuestionID], 
	[Answer], 
	[CorrectFlag], 
	[DeleteFlag]
FROM Answer_Master
WHERE [AnswerID] = @AnswerID


SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Language_Master_Delete]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Language_Master_Delete]
	@LanguageID int
AS
SET NOCOUNT ON

DELETE FROM Language_Master
WHERE [LanguageID] = @LanguageID

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Language_Master_InsertUpdate]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Language_Master_InsertUpdate]

	@LanguageID int,
	@Language varchar(100),
	@CreatedDate datetime,
	@DeleteFlag bit
AS
SET NOCOUNT ON
IF @LanguageID = 0 BEGIN
	INSERT INTO Language_Master (
		[Language],
		[CreatedDate],
		[DeleteFlag]
	)
	VALUES (
		@Language,
		@CreatedDate,
		@DeleteFlag
	)
	SELECT SCOPE_IDENTITY() As InsertedID
END
ELSE BEGIN
	UPDATE Language_Master SET 
		[Language] = @Language,
		[CreatedDate] = @CreatedDate,
		[DeleteFlag] = @DeleteFlag
	WHERE [LanguageID] = @LanguageID

END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Language_Master_SelectAll]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Language_Master_SelectAll]
AS
SET NOCOUNT ON

SELECT [LanguageID], 
	[Language], 
	[CreatedDate], 
	[DeleteFlag]
FROM Language_Master


SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Language_Master_SelectOne]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Language_Master_SelectOne]
	@LanguageID int
AS
SET NOCOUNT ON

SELECT [LanguageID], 
	[Language], 
	[CreatedDate], 
	[DeleteFlag]
FROM Language_Master
WHERE [LanguageID] = @LanguageID


SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Question_Master_Delete]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Question_Master_Delete]
	@QuestionID bigint
AS
SET NOCOUNT ON

DELETE FROM Question_Master
WHERE [QuestionID] = @QuestionID

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Question_Master_InsertUpdate]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Question_Master_InsertUpdate]

	@QuestionID bigint,
	@Question nvarchar(Max),
	@QuestionType int,
	@QuestionLevel int,
	@DifficultyType int,
	@Score int,
	@CreatedDate datetime,
	@DeleteFlag bit
AS
SET NOCOUNT ON
IF @QuestionID = 0 BEGIN
	INSERT INTO Question_Master (
		[Question],
		[QuestionType],
		[QuestionLevel],
		[DifficultyType],
		[Score],
		[CreatedDate],
		[DeleteFlag]
	)
	VALUES (
		@Question,
		@QuestionType,
		@QuestionLevel,
		@DifficultyType,
		@Score,
		@CreatedDate,
		@DeleteFlag
	)
	SELECT SCOPE_IDENTITY() As InsertedID
END
ELSE BEGIN
	UPDATE Question_Master SET 
		[Question] = @Question,
		[QuestionType] = @QuestionType,
		[QuestionLevel] = @QuestionLevel,
		[DifficultyType] = @DifficultyType,
		[Score] = @Score,
		[CreatedDate] = @CreatedDate,
		[DeleteFlag] = @DeleteFlag
	WHERE [QuestionID] = @QuestionID

END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Question_Master_SelectAll]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Question_Master_SelectAll]
AS
SET NOCOUNT ON

SELECT [QuestionID], 
	[Question], 
	[QuestionType], 
	[QuestionLevel], 
	[DifficultyType], 
	[Score], 
	[CreatedDate], 
	[DeleteFlag]
FROM Question_Master


SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Question_Master_SelectOne]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Question_Master_SelectOne]
	@QuestionID bigint
AS
SET NOCOUNT ON

SELECT [QuestionID], 
	[Question], 
	[QuestionType], 
	[QuestionLevel], 
	[DifficultyType], 
	[Score], 
	[CreatedDate], 
	[DeleteFlag]
FROM Question_Master
WHERE [QuestionID] = @QuestionID


SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Master_Delete]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_User_Master_Delete]
	@UserID bigint
AS
SET NOCOUNT ON

DELETE FROM User_Master
WHERE [UserID] = @UserID

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Master_InsertUpdate]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_User_Master_InsertUpdate]
	@UserID bigint,
	@FirstName nvarchar(100),
	@MiddleName nvarchar(100),
	@LastName nvarchar(100),
	@Email nvarchar(100),
	@Birthdate datetime,
	@Phone varchar(50),
	@Gender int,
	@Experience int,
	@LanguagesKnown nvarchar(max),
	@City nvarchar(500),
	@State nvarchar(500),
	@Country nvarchar(500),
	@CreatedDate datetime,
	@DeleteFlag bit
AS
SET NOCOUNT ON
IF @UserID = 0 BEGIN
	INSERT INTO User_Master (
		[FirstName],
		[MiddleName],
		[LastName],
		[Email],
		[Birthdate],
		[Phone],
		[Gender],
		[Experience],
		[LanguagesKnown],
		[City],
		[State],
		[Country],
		[CreatedDate],
		[DeleteFlag]
	)
	VALUES (
		@FirstName,
		@MiddleName,
		@LastName,
		@Email,
		@Birthdate,
		@Phone,
		@Gender,
		@Experience,
		@LanguagesKnown,
		@City,
		@State,
		@Country,
		@CreatedDate,
		@DeleteFlag
	)
	SELECT SCOPE_IDENTITY() As InsertedID
END
ELSE BEGIN
	UPDATE User_Master SET 
		[FirstName] = @FirstName,
		[MiddleName] = @MiddleName,
		[LastName] = @LastName,
		[Email] = @Email,
		[Birthdate] = @Birthdate,
		[Phone] = @Phone,
		[Gender] = @Gender,
		[Experience] = @Experience,
		[LanguagesKnown] = @LanguagesKnown,
		[City] = @City,
		[State] = @State,
		[Country] = @Country,
		[CreatedDate] = @CreatedDate,
		[DeleteFlag] = @DeleteFlag
	WHERE [UserID] = @UserID

END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Master_SelectAll]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_User_Master_SelectAll]
AS
SET NOCOUNT ON

SELECT [UserID], 
	[FirstName], 
	[MiddleName], 
	[LastName], 
	[Email], 
	[Birthdate], 
	[Phone], 
	[Gender], 
	[Experience], 
	[LanguagesKnown], 
	[City], 
	[State], 
	[Country], 
	[CreatedDate], 
	[DeleteFlag]
FROM User_Master
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Master_SelectOne]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_User_Master_SelectOne]
	@UserID bigint
AS
SET NOCOUNT ON

SELECT [UserID], 
	[FirstName], 
	[MiddleName], 
	[LastName], 
	[Email], 
	[Birthdate], 
	[Phone], 
	[Gender], 
	[Experience], 
	[LanguagesKnown], 
	[City], 
	[State], 
	[Country], 
	[CreatedDate], 
	[DeleteFlag]
FROM User_Master
WHERE [UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Submission_Delete]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_User_Submission_Delete]
	@SubmissionID bigint
AS
SET NOCOUNT ON

DELETE FROM User_Submission
WHERE [SubmissionID] = @SubmissionID

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Submission_InsertUpdate]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_User_Submission_InsertUpdate]

	@SubmissionID bigint,
	@UserID bigint,
	@QuestionID bigint,
	@AnswerID bigint,
	@CreatedDate datetime,
	@DeleteFlag bit
AS
SET NOCOUNT ON
IF @SubmissionID = 0 BEGIN
	INSERT INTO User_Submission (
		[UserID],
		[QuestionID],
		[AnswerID],
		[CreatedDate],
		[DeleteFlag]
	)
	VALUES (
		@UserID,
		@QuestionID,
		@AnswerID,
		@CreatedDate,
		@DeleteFlag
	)
	SELECT SCOPE_IDENTITY() As InsertedID
END
ELSE BEGIN
	UPDATE User_Submission SET 
		[UserID] = @UserID,
		[QuestionID] = @QuestionID,
		[AnswerID] = @AnswerID,
		[CreatedDate] = @CreatedDate,
		[DeleteFlag] = @DeleteFlag
	WHERE [SubmissionID] = @SubmissionID

END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Submission_SelectAll]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_User_Submission_SelectAll]
AS
SET NOCOUNT ON

SELECT [SubmissionID], 
	[UserID], 
	[QuestionID], 
	[AnswerID], 
	[CreatedDate], 
	[DeleteFlag]
FROM User_Submission


SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Submission_SelectOne]    Script Date: 7/8/2019 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_User_Submission_SelectOne]
	@SubmissionID bigint
AS
SET NOCOUNT ON

SELECT [SubmissionID], 
	[UserID], 
	[QuestionID], 
	[AnswerID], 
	[CreatedDate], 
	[DeleteFlag]
FROM User_Submission
WHERE [SubmissionID] = @SubmissionID


SET NOCOUNT OFF
GO
USE [master]
GO
ALTER DATABASE [NU_Challenge] SET  READ_WRITE 
GO
