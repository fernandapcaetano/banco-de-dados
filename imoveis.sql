USE [IMOVEIS]
GO
/****** Object:  Table [dbo].[Bairro]    Script Date: 09/11/2023 10:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bairro](
	[cd_Bairro] [int] NOT NULL,
	[cd_Cidade] [int] NOT NULL,
	[sg_Estado] [char](2) NOT NULL,
	[nm_Bairro] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[cd_Bairro] ASC,
	[cd_Cidade] ASC,
	[sg_Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cidade]    Script Date: 09/11/2023 10:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cidade](
	[cd_Cidade] [int] NOT NULL,
	[sg_Estado] [char](2) NOT NULL,
	[nm_Cidade] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[cd_Cidade] ASC,
	[sg_Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comprador]    Script Date: 09/11/2023 10:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comprador](
	[cd_Comprador] [int] NOT NULL,
	[nm_Comprador] [varchar](20) NOT NULL,
	[ds_Endereco] [varchar](20) NULL,
	[cd_CPF] [char](11) NULL,
	[nm_Cidade] [varchar](20) NULL,
	[nm_Bairro] [varchar](20) NULL,
	[sg_Estado] [varchar](20) NULL,
	[cd_Telefone] [varchar](20) NULL,
	[ds_Email] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[cd_Comprador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 09/11/2023 10:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[sg_Estado] [char](2) NOT NULL,
	[nm_Estado] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[sg_Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faixa_Imovel]    Script Date: 09/11/2023 10:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faixa_Imovel](
	[cd_Faixa] [int] NOT NULL,
	[nm_Faixa] [varchar](30) NULL,
	[vl_Maximo] [money] NULL,
	[vl_Minimo] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[cd_Faixa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Imovel]    Script Date: 09/11/2023 10:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imovel](
	[cd_Imovel] [int] NOT NULL,
	[cd_Vendedor] [int] NULL,
	[cd_Bairro] [int] NULL,
	[cd_Cidade] [int] NULL,
	[sg_Estado] [char](2) NULL,
	[ds_Endereco] [varchar](40) NULL,
	[qt_AreaUtil] [decimal](10, 2) NULL,
	[qt_AreaTotal] [decimal](10, 2) NULL,
	[ds_Imovel] [varchar](300) NULL,
	[vl_Imovel] [money] NULL,
	[qt_Ofertas] [int] NULL,
	[ic_Vendido] [char](1) NULL,
	[dt_Lancto] [datetime] NULL,
	[qt_ImovelIndicado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cd_Imovel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oferta]    Script Date: 09/11/2023 10:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oferta](
	[cd_Comprador] [int] NOT NULL,
	[cd_Imovel] [int] NOT NULL,
	[vl_Oferta] [money] NOT NULL,
	[dt_Oferta] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cd_Comprador] ASC,
	[cd_Imovel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 09/11/2023 10:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[cd_Vendedor] [int] NOT NULL,
	[nm_Vendedor] [varchar](40) NULL,
	[ds_Endereco] [varchar](40) NULL,
	[cd_CPF] [char](11) NULL,
	[nm_Cidade] [varchar](20) NULL,
	[nm_Bairro] [varchar](20) NULL,
	[sg_Estado] [char](2) NULL,
	[cd_Telefone] [varchar](20) NULL,
	[ds_Email] [varchar](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[cd_Vendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bairro]  WITH CHECK ADD FOREIGN KEY([cd_Cidade], [sg_Estado])
REFERENCES [dbo].[Cidade] ([cd_Cidade], [sg_Estado])
GO
ALTER TABLE [dbo].[Cidade]  WITH CHECK ADD FOREIGN KEY([sg_Estado])
REFERENCES [dbo].[Estado] ([sg_Estado])
GO
ALTER TABLE [dbo].[Imovel]  WITH CHECK ADD FOREIGN KEY([cd_Bairro], [cd_Cidade], [sg_Estado])
REFERENCES [dbo].[Bairro] ([cd_Bairro], [cd_Cidade], [sg_Estado])
GO
ALTER TABLE [dbo].[Imovel]  WITH CHECK ADD FOREIGN KEY([cd_Vendedor])
REFERENCES [dbo].[Vendedor] ([cd_Vendedor])
GO
ALTER TABLE [dbo].[Oferta]  WITH CHECK ADD FOREIGN KEY([cd_Comprador])
REFERENCES [dbo].[Comprador] ([cd_Comprador])
GO
ALTER TABLE [dbo].[Oferta]  WITH CHECK ADD FOREIGN KEY([cd_Imovel])
REFERENCES [dbo].[Imovel] ([cd_Imovel])
GO
