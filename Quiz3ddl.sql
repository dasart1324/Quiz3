USE [quiz_3]
GO
/****** Object:  Table [dbo].[videojuegos]    Script Date: 10/19/2021 9:35:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[videojuegos](
	[nombre] [varchar](max) NULL,
	[plataforma] [varchar](max) NULL,
	[año] [varchar](max) NULL,
	[genero] [varchar](max) NULL,
	[editorial] [varchar](max) NULL,
	[ventas_NA] [float] NULL,
	[ventas_EU] [float] NULL,
	[ventas_JP] [float] NULL,
	[ventas_Otros] [float] NULL,
	[ventas_Globales] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[ventas_regiones]    Script Date: 10/19/2021 9:35:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  Create view [dbo].[ventas_regiones] AS
  select nombre, plataforma, año, genero, editorial, region, ventas
  from (Select nombre, plataforma, año, genero, editorial, ventas_NA as Norteamerica, ventas_EU as Europa, ventas_JP as Japon, ventas_Otros as Otros from videojuegos) v
  unpivot (ventas for region in (Norteamerica, Europa, Japon, Otros)) as unpvt;;
GO
