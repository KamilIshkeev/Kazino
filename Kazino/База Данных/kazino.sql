USE [Kazino1337]
GO
/****** Object:  Table [dbo].[bank_kazino]    Script Date: 24.09.2024 9:24:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bank_kazino](
	[id_bank] [int] IDENTITY(1,1) NOT NULL,
	[credits] [int] NULL,
	[chips] [int] NULL,
 CONSTRAINT [PK_bank_kazino] PRIMARY KEY CLUSTERED 
(
	[id_bank] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[game]    Script Date: 24.09.2024 9:24:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[game](
	[id_game] [int] IDENTITY(1,1) NOT NULL,
	[name_game] [nvarchar](50) NULL,
	[max_bet] [int] NULL,
	[min_bet] [int] NULL,
 CONSTRAINT [PK_game] PRIMARY KEY CLUSTERED 
(
	[id_game] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ind_history]    Script Date: 24.09.2024 9:24:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ind_history](
	[id_history] [int] IDENTITY(1,1) NOT NULL,
	[id_game] [int] NULL,
	[bet_credits] [int] NULL,
	[profit] [int] NULL,
	[date_game] [date] NULL,
	[id_user] [int] NULL,
 CONSTRAINT [PK_ind_history] PRIMARY KEY CLUSTERED 
(
	[id_history] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rep_game]    Script Date: 24.09.2024 9:24:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rep_game](
	[id_rep] [int] IDENTITY(1,1) NOT NULL,
	[id_history] [int] NULL,
	[bet_credits] [int] NULL,
 CONSTRAINT [PK_rep_game] PRIMARY KEY CLUSTERED 
(
	[id_rep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trade_chips]    Script Date: 24.09.2024 9:24:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trade_chips](
	[id_trade] [int] IDENTITY(1,1) NOT NULL,
	[id_bank] [int] NULL,
	[id_user] [int] NULL,
	[credits] [int] NULL,
	[chips] [int] NULL,
 CONSTRAINT [PK_trade_chips] PRIMARY KEY CLUSTERED 
(
	[id_trade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactions]    Script Date: 24.09.2024 9:24:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactions](
	[id_transact] [int] IDENTITY(1,1) NOT NULL,
	[id_history] [int] NULL,
	[transact_sum] [int] NULL,
	[id_bank] [int] NULL,
 CONSTRAINT [PK_transactions] PRIMARY KEY CLUSTERED 
(
	[id_transact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 24.09.2024 9:24:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[login_user] [nvarchar](50) NULL,
	[password] [int] NULL,
	[credits] [int] NULL,
	[data_regist] [date] NULL,
	[chips] [int] NULL,
	[id_status] [bit] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bank_kazino] ON 

INSERT [dbo].[bank_kazino] ([id_bank], [credits], [chips]) VALUES (1, 150000000, 3500000)
SET IDENTITY_INSERT [dbo].[bank_kazino] OFF
GO
SET IDENTITY_INSERT [dbo].[game] ON 

INSERT [dbo].[game] ([id_game], [name_game], [max_bet], [min_bet]) VALUES (1, N'Kosti', NULL, NULL)
INSERT [dbo].[game] ([id_game], [name_game], [max_bet], [min_bet]) VALUES (2, N'Ruletka', NULL, NULL)
SET IDENTITY_INSERT [dbo].[game] OFF
GO
SET IDENTITY_INSERT [dbo].[ind_history] ON 

INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1034, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1035, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1036, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1037, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1038, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1039, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1040, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1041, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1042, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1043, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1044, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1045, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1046, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1047, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1048, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1049, NULL, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1050, 2, 1000, -1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1051, 2, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1052, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1053, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1054, 2, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1055, 2, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1056, 2, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1057, 2, 15719211, 15719211, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1058, 2, 157192114, 157192114, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1059, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1060, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1061, 2, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1062, 2, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1063, 2, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1064, 2, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1065, 2, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1066, 2, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1067, 2, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1068, 2, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1069, 2, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1070, 2, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1071, 2, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1072, 2, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1073, 2, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1074, 2, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1075, 2, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1076, 2, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1077, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[ind_history] ([id_history], [id_game], [bet_credits], [profit], [date_game], [id_user]) VALUES (1078, 1, 1000, 1000, CAST(N'2024-09-17' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[ind_history] OFF
GO
SET IDENTITY_INSERT [dbo].[transactions] ON 

INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (6, 1046, 150000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (7, NULL, 1000, NULL)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (8, NULL, 1000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (9, NULL, 1000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (10, NULL, 1000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (11, NULL, 1000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (12, NULL, 1500, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (13, NULL, 1400, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (14, NULL, 5000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (15, NULL, 1000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (16, NULL, 1000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (17, NULL, 1000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (18, NULL, 1000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (19, NULL, 1000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (20, NULL, 1000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (21, NULL, 1000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (22, NULL, 1000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (23, NULL, 1000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (24, NULL, 1000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (25, NULL, 1000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (26, NULL, 1000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (27, NULL, 1000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (28, NULL, 1000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (29, NULL, 1000, 1)
INSERT [dbo].[transactions] ([id_transact], [id_history], [transact_sum], [id_bank]) VALUES (30, NULL, 5500, 1)
SET IDENTITY_INSERT [dbo].[transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id_user], [login_user], [password], [credits], [data_regist], [chips], [id_status]) VALUES (0, N'Rasimqa', 123456, NULL, NULL, NULL, 1)
INSERT [dbo].[user] ([id_user], [login_user], [password], [credits], [data_regist], [chips], [id_status]) VALUES (1, N'Kamil', 1234355, 45646, NULL, NULL, 1)
INSERT [dbo].[user] ([id_user], [login_user], [password], [credits], [data_regist], [chips], [id_status]) VALUES (2, N'Oleg', 12243, 335435, NULL, NULL, 1)
INSERT [dbo].[user] ([id_user], [login_user], [password], [credits], [data_regist], [chips], [id_status]) VALUES (5, N'Igor', 146542, 4555, NULL, NULL, 0)
INSERT [dbo].[user] ([id_user], [login_user], [password], [credits], [data_regist], [chips], [id_status]) VALUES (6, N'Kamil1', 1234, 13333, NULL, NULL, 0)
INSERT [dbo].[user] ([id_user], [login_user], [password], [credits], [data_regist], [chips], [id_status]) VALUES (11, N'Dimon', 4444, 1313, NULL, NULL, 0)
INSERT [dbo].[user] ([id_user], [login_user], [password], [credits], [data_regist], [chips], [id_status]) VALUES (18, N'Noi', 333, 1457355, NULL, NULL, 1)
INSERT [dbo].[user] ([id_user], [login_user], [password], [credits], [data_regist], [chips], [id_status]) VALUES (20, N'Valera', 888, 1333, NULL, NULL, 0)
INSERT [dbo].[user] ([id_user], [login_user], [password], [credits], [data_regist], [chips], [id_status]) VALUES (23, N'Lera', 222, 444, NULL, NULL, 0)
INSERT [dbo].[user] ([id_user], [login_user], [password], [credits], [data_regist], [chips], [id_status]) VALUES (26, N'Poison', 153553, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id_user], [login_user], [password], [credits], [data_regist], [chips], [id_status]) VALUES (27, N'Logiun', 3334, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[user] OFF
GO
ALTER TABLE [dbo].[ind_history]  WITH CHECK ADD  CONSTRAINT [FK_ind_history_game] FOREIGN KEY([id_game])
REFERENCES [dbo].[game] ([id_game])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ind_history] CHECK CONSTRAINT [FK_ind_history_game]
GO
ALTER TABLE [dbo].[ind_history]  WITH CHECK ADD  CONSTRAINT [FK_ind_history_user] FOREIGN KEY([id_user])
REFERENCES [dbo].[user] ([id_user])
ON UPDATE SET NULL
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ind_history] CHECK CONSTRAINT [FK_ind_history_user]
GO
ALTER TABLE [dbo].[rep_game]  WITH CHECK ADD  CONSTRAINT [FK_rep_game_ind_history] FOREIGN KEY([id_history])
REFERENCES [dbo].[ind_history] ([id_history])
GO
ALTER TABLE [dbo].[rep_game] CHECK CONSTRAINT [FK_rep_game_ind_history]
GO
ALTER TABLE [dbo].[trade_chips]  WITH CHECK ADD  CONSTRAINT [FK_trade_chips_bank_kazino] FOREIGN KEY([id_bank])
REFERENCES [dbo].[bank_kazino] ([id_bank])
ON UPDATE SET NULL
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[trade_chips] CHECK CONSTRAINT [FK_trade_chips_bank_kazino]
GO
ALTER TABLE [dbo].[trade_chips]  WITH CHECK ADD  CONSTRAINT [FK_trade_chips_user] FOREIGN KEY([id_user])
REFERENCES [dbo].[user] ([id_user])
ON UPDATE SET NULL
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[trade_chips] CHECK CONSTRAINT [FK_trade_chips_user]
GO
ALTER TABLE [dbo].[transactions]  WITH CHECK ADD  CONSTRAINT [FK_transactions_bank_kazino] FOREIGN KEY([id_bank])
REFERENCES [dbo].[bank_kazino] ([id_bank])
ON UPDATE SET NULL
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[transactions] CHECK CONSTRAINT [FK_transactions_bank_kazino]
GO
ALTER TABLE [dbo].[transactions]  WITH CHECK ADD  CONSTRAINT [FK_transactions_ind_history] FOREIGN KEY([id_history])
REFERENCES [dbo].[ind_history] ([id_history])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[transactions] CHECK CONSTRAINT [FK_transactions_ind_history]
GO
