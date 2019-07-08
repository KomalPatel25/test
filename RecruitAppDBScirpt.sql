USE [RecruitApp]
GO
/****** Object:  Table [dbo].[User_Submission]    Script Date: 07/01/2019 21:16:08 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Master]    Script Date: 07/01/2019 21:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Question_Master]    Script Date: 07/01/2019 21:16:08 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language_Master]    Script Date: 07/01/2019 21:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Language_Master](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[Language] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Language_Master] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Answer_Master]    Script Date: 07/01/2019 21:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer_Master](
	[AnswerID] [bigint] IDENTITY(1,1) NOT NULL,
	[QuestionID] [bigint] NULL,
	[Answer] [nvarchar](max) NULL,
	[CorrectFlag] [bit] NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Answer_Master] PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Submission_SelectOne]    Script Date: 07/01/2019 21:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_User_Submission_SelectOne]	@SubmissionID bigintASSET NOCOUNT ONSELECT [SubmissionID], 	[UserID], 	[QuestionID], 	[AnswerID], 	[CreatedDate], 	[DeleteFlag]FROM User_SubmissionWHERE [SubmissionID] = @SubmissionIDSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Submission_SelectAll]    Script Date: 07/01/2019 21:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_User_Submission_SelectAll]ASSET NOCOUNT ONSELECT [SubmissionID], 	[UserID], 	[QuestionID], 	[AnswerID], 	[CreatedDate], 	[DeleteFlag]FROM User_SubmissionSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Submission_InsertUpdate]    Script Date: 07/01/2019 21:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_User_Submission_InsertUpdate]	@SubmissionID bigint,	@UserID bigint,	@QuestionID bigint,	@AnswerID bigint,	@CreatedDate datetime,	@DeleteFlag bitASSET NOCOUNT ONIF @SubmissionID = 0 BEGIN	INSERT INTO User_Submission (		[UserID],		[QuestionID],		[AnswerID],		[CreatedDate],		[DeleteFlag]	)	VALUES (		@UserID,		@QuestionID,		@AnswerID,		@CreatedDate,		@DeleteFlag	)	SELECT SCOPE_IDENTITY() As InsertedIDENDELSE BEGIN	UPDATE User_Submission SET 		[UserID] = @UserID,		[QuestionID] = @QuestionID,		[AnswerID] = @AnswerID,		[CreatedDate] = @CreatedDate,		[DeleteFlag] = @DeleteFlag	WHERE [SubmissionID] = @SubmissionIDENDSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Submission_Delete]    Script Date: 07/01/2019 21:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_User_Submission_Delete]	@SubmissionID bigintASSET NOCOUNT ONDELETE FROM User_SubmissionWHERE [SubmissionID] = @SubmissionIDSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Master_SelectOne]    Script Date: 07/01/2019 21:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_User_Master_SelectOne]	@UserID bigintASSET NOCOUNT ONSELECT [UserID], 	[FirstName], 	[MiddleName], 	[LastName], 	[Email], 	[Birthdate], 	[Phone], 	[Gender], 	[Experience], 	[LanguagesKnown], 	[City], 	[State], 	[Country], 	[CreatedDate], 	[DeleteFlag]FROM User_MasterWHERE [UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Master_SelectAll]    Script Date: 07/01/2019 21:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_User_Master_SelectAll]ASSET NOCOUNT ONSELECT [UserID], 	[FirstName], 	[MiddleName], 	[LastName], 	[Email], 	[Birthdate], 	[Phone], 	[Gender], 	[Experience], 	[LanguagesKnown], 	[City], 	[State], 	[Country], 	[CreatedDate], 	[DeleteFlag]FROM User_Master
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Master_InsertUpdate]    Script Date: 07/01/2019 21:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_User_Master_InsertUpdate]	@UserID bigint,	@FirstName nvarchar(100),	@MiddleName nvarchar(100),	@LastName nvarchar(100),	@Email nvarchar(100),	@Birthdate datetime,	@Phone varchar(50),	@Gender int,	@Experience int,	@LanguagesKnown nvarchar(max),	@City nvarchar(500),	@State nvarchar(500),	@Country nvarchar(500),	@CreatedDate datetime,	@DeleteFlag bitASSET NOCOUNT ONIF @UserID = 0 BEGIN	INSERT INTO User_Master (		[FirstName],		[MiddleName],		[LastName],		[Email],		[Birthdate],		[Phone],		[Gender],		[Experience],		[LanguagesKnown],		[City],		[State],		[Country],		[CreatedDate],		[DeleteFlag]	)	VALUES (		@FirstName,		@MiddleName,		@LastName,		@Email,		@Birthdate,		@Phone,		@Gender,		@Experience,		@LanguagesKnown,		@City,		@State,		@Country,		@CreatedDate,		@DeleteFlag	)	SELECT SCOPE_IDENTITY() As InsertedIDENDELSE BEGIN	UPDATE User_Master SET 		[FirstName] = @FirstName,		[MiddleName] = @MiddleName,		[LastName] = @LastName,		[Email] = @Email,		[Birthdate] = @Birthdate,		[Phone] = @Phone,		[Gender] = @Gender,		[Experience] = @Experience,		[LanguagesKnown] = @LanguagesKnown,		[City] = @City,		[State] = @State,		[Country] = @Country,		[CreatedDate] = @CreatedDate,		[DeleteFlag] = @DeleteFlag	WHERE [UserID] = @UserIDENDSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Master_Delete]    Script Date: 07/01/2019 21:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_User_Master_Delete]	@UserID bigintASSET NOCOUNT ONDELETE FROM User_MasterWHERE [UserID] = @UserIDSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Question_Master_SelectOne]    Script Date: 07/01/2019 21:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Question_Master_SelectOne]	@QuestionID bigintASSET NOCOUNT ONSELECT [QuestionID], 	[Question], 	[QuestionType], 	[QuestionLevel], 	[DifficultyType], 	[Score], 	[CreatedDate], 	[DeleteFlag]FROM Question_MasterWHERE [QuestionID] = @QuestionIDSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Question_Master_SelectAll]    Script Date: 07/01/2019 21:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Question_Master_SelectAll]ASSET NOCOUNT ONSELECT [QuestionID], 	[Question], 	[QuestionType], 	[QuestionLevel], 	[DifficultyType], 	[Score], 	[CreatedDate], 	[DeleteFlag]FROM Question_MasterSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Question_Master_InsertUpdate]    Script Date: 07/01/2019 21:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Question_Master_InsertUpdate]	@QuestionID bigint,	@Question nvarchar(Max),	@QuestionType int,	@QuestionLevel int,	@DifficultyType int,	@Score int,	@CreatedDate datetime,	@DeleteFlag bitASSET NOCOUNT ONIF @QuestionID = 0 BEGIN	INSERT INTO Question_Master (		[Question],		[QuestionType],		[QuestionLevel],		[DifficultyType],		[Score],		[CreatedDate],		[DeleteFlag]	)	VALUES (		@Question,		@QuestionType,		@QuestionLevel,		@DifficultyType,		@Score,		@CreatedDate,		@DeleteFlag	)	SELECT SCOPE_IDENTITY() As InsertedIDENDELSE BEGIN	UPDATE Question_Master SET 		[Question] = @Question,		[QuestionType] = @QuestionType,		[QuestionLevel] = @QuestionLevel,		[DifficultyType] = @DifficultyType,		[Score] = @Score,		[CreatedDate] = @CreatedDate,		[DeleteFlag] = @DeleteFlag	WHERE [QuestionID] = @QuestionIDENDSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Question_Master_Delete]    Script Date: 07/01/2019 21:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Question_Master_Delete]	@QuestionID bigintASSET NOCOUNT ONDELETE FROM Question_MasterWHERE [QuestionID] = @QuestionIDSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Language_Master_SelectOne]    Script Date: 07/01/2019 21:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Language_Master_SelectOne]	@LanguageID intASSET NOCOUNT ONSELECT [LanguageID], 	[Language], 	[CreatedDate], 	[DeleteFlag]FROM Language_MasterWHERE [LanguageID] = @LanguageIDSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Language_Master_SelectAll]    Script Date: 07/01/2019 21:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Language_Master_SelectAll]ASSET NOCOUNT ONSELECT [LanguageID], 	[Language], 	[CreatedDate], 	[DeleteFlag]FROM Language_MasterSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Language_Master_InsertUpdate]    Script Date: 07/01/2019 21:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Language_Master_InsertUpdate]	@LanguageID int,	@Language varchar(100),	@CreatedDate datetime,	@DeleteFlag bitASSET NOCOUNT ONIF @LanguageID = 0 BEGIN	INSERT INTO Language_Master (		[Language],		[CreatedDate],		[DeleteFlag]	)	VALUES (		@Language,		@CreatedDate,		@DeleteFlag	)	SELECT SCOPE_IDENTITY() As InsertedIDENDELSE BEGIN	UPDATE Language_Master SET 		[Language] = @Language,		[CreatedDate] = @CreatedDate,		[DeleteFlag] = @DeleteFlag	WHERE [LanguageID] = @LanguageIDENDSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Language_Master_Delete]    Script Date: 07/01/2019 21:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Language_Master_Delete]	@LanguageID intASSET NOCOUNT ONDELETE FROM Language_MasterWHERE [LanguageID] = @LanguageIDSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Answer_Master_SelectOne]    Script Date: 07/01/2019 21:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Answer_Master_SelectOne]	@AnswerID bigintASSET NOCOUNT ONSELECT [AnswerID], 	[QuestionID], 	[Answer], 	[CorrectFlag], 	[DeleteFlag]FROM Answer_MasterWHERE [AnswerID] = @AnswerIDSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Answer_Master_SelectAll]    Script Date: 07/01/2019 21:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Answer_Master_SelectAll]ASSET NOCOUNT ONSELECT [AnswerID], 	[QuestionID], 	[Answer], 	[CorrectFlag], 	[DeleteFlag]FROM Answer_MasterSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Answer_Master_InsertUpdate]    Script Date: 07/01/2019 21:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Answer_Master_InsertUpdate]	@AnswerID bigint,	@QuestionID bigint,	@Answer nvarchar(max),	@CorrectFlag bit,	@DeleteFlag bitASSET NOCOUNT ONIF @AnswerID = 0 BEGIN	INSERT INTO Answer_Master (		[QuestionID],		[Answer],		[CorrectFlag],		[DeleteFlag]	)	VALUES (		@QuestionID,		@Answer,		@CorrectFlag,		@DeleteFlag	)	SELECT SCOPE_IDENTITY() As InsertedIDENDELSE BEGIN	UPDATE Answer_Master SET 		[QuestionID] = @QuestionID,		[Answer] = @Answer,		[CorrectFlag] = @CorrectFlag,		[DeleteFlag] = @DeleteFlag	WHERE [AnswerID] = @AnswerIDENDSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Answer_Master_Delete]    Script Date: 07/01/2019 21:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Answer_Master_Delete]	@AnswerID bigintASSET NOCOUNT ONDELETE FROM Answer_MasterWHERE [AnswerID] = @AnswerIDSET NOCOUNT OFF
GO
/****** Object:  Default [DF_Answer_Master_DeleteFlag]    Script Date: 07/01/2019 21:16:08 ******/
ALTER TABLE [dbo].[Answer_Master] ADD  CONSTRAINT [DF_Answer_Master_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
GO
/****** Object:  Default [DF_Language_Master_DeleteFlag]    Script Date: 07/01/2019 21:16:08 ******/
ALTER TABLE [dbo].[Language_Master] ADD  CONSTRAINT [DF_Language_Master_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
GO
/****** Object:  Default [DF_Question_Master_DeleteFlag]    Script Date: 07/01/2019 21:16:08 ******/
ALTER TABLE [dbo].[Question_Master] ADD  CONSTRAINT [DF_Question_Master_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
GO
/****** Object:  Default [DF_User_Master_CreatedDate]    Script Date: 07/01/2019 21:16:08 ******/
ALTER TABLE [dbo].[User_Master] ADD  CONSTRAINT [DF_User_Master_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_User_Master_DeleteFlag]    Script Date: 07/01/2019 21:16:08 ******/
ALTER TABLE [dbo].[User_Master] ADD  CONSTRAINT [DF_User_Master_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
GO
/****** Object:  Default [DF_User_Submission_DeleteFlag]    Script Date: 07/01/2019 21:16:08 ******/
ALTER TABLE [dbo].[User_Submission] ADD  CONSTRAINT [DF_User_Submission_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
GO
