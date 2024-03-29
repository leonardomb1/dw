USE [bi_rip_rawZone_bck]
GO
/****** Object:  Table [dbo].[Arquivos Nao Processados]    Script Date: 24/01/2024 14:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arquivos Nao Processados](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int] NOT NULL,
	[Data do Email] [varchar](250) NULL,
	[Origem do Email] [varchar](250) NULL,
	[Data do processamento] [varchar](250) NULL,
	[Status] [varchar](250) NULL,
	[Mensagem de Erro] [varchar](250) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_ArqNaoProcessadoRPA] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Arquivos Processados]    Script Date: 24/01/2024 14:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arquivos Processados](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int] NOT NULL,
	[Data do Email] [varchar](250) NULL,
	[Origem do Email] [varchar](250) NULL,
	[Data do processamento] [varchar](250) NULL,
	[Arquivo PDF] [varchar](250) NULL,
	[CPF] [varchar](250) NULL,
	[Funcionario] [varchar](250) NULL,
	[Status] [varchar](250) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_ArqProcessadoRPA] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CBA010]    Script Date: 24/01/2024 14:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CBA010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[CBA_FILIAL] [varchar](2) NOT NULL,
	[CBA_CODINV] [varchar](9) NOT NULL,
	[CBA_ANALIS] [varchar](1) NOT NULL,
	[CBA_DATA] [varchar](8) NOT NULL,
	[CBA_CONTS] [float] NOT NULL,
	[CBA_LOCAL] [varchar](2) NOT NULL,
	[CBA_TIPINV] [varchar](1) NOT NULL,
	[CBA_LOCALI] [varchar](15) NOT NULL,
	[CBA_PROD] [varchar](15) NOT NULL,
	[CBA_CONTR] [float] NOT NULL,
	[CBA_STATUS] [varchar](1) NOT NULL,
	[CBA_AUTREC] [varchar](1) NOT NULL,
	[CBA_CLASSA] [varchar](1) NOT NULL,
	[CBA_CLASSB] [varchar](1) NOT NULL,
	[CBA_CLASSC] [varchar](1) NOT NULL,
	[D_E_L_E_T_] [varchar](1) NOT NULL,
	[R_E_C_N_O_] [int] NOT NULL,
	[R_E_C_D_E_L_] [int] NOT NULL,
	[CBA_INVGUI] [varchar](1) NOT NULL,
	[CBA_RECINV] [varchar](1) NOT NULL,
	[CBA_DISPOS] [varchar](1) NOT NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT2010]    Script Date: 24/01/2024 14:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT2010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[CT2_FILIAL] [varchar](2) NULL,
	[CT2_DATA] [varchar](8) NULL,
	[CT2_LOTE] [varchar](6) NULL,
	[CT2_SBLOTE] [varchar](3) NULL,
	[CT2_DOC] [varchar](6) NULL,
	[CT2_LINHA] [varchar](3) NULL,
	[CT2_MOEDLC] [varchar](2) NULL,
	[CT2_DC] [varchar](1) NULL,
	[CT2_DEBITO] [varchar](20) NULL,
	[CT2_CREDIT] [varchar](20) NULL,
	[CT2_DCD] [varchar](1) NULL,
	[CT2_DCC] [varchar](1) NULL,
	[CT2_VALOR] [float] NULL,
	[CT2_MOEDAS] [varchar](5) NULL,
	[CT2_HP] [varchar](3) NULL,
	[CT2_HIST] [varchar](100) NULL,
	[CT2_CCD] [varchar](9) NULL,
	[CT2_CCC] [varchar](9) NULL,
	[CT2_ITEMD] [varchar](9) NULL,
	[CT2_ITEMC] [varchar](9) NULL,
	[CT2_CLVLDB] [varchar](9) NULL,
	[CT2_CLVLCR] [varchar](9) NULL,
	[CT2_ATIVDE] [varchar](40) NULL,
	[CT2_ATIVCR] [varchar](40) NULL,
	[CT2_EMPORI] [varchar](2) NULL,
	[CT2_FILORI] [varchar](2) NULL,
	[CT2_INTERC] [varchar](1) NULL,
	[CT2_IDENTC] [varchar](50) NULL,
	[CT2_TPSALD] [varchar](1) NULL,
	[CT2_SEQUEN] [varchar](10) NULL,
	[CT2_MANUAL] [varchar](1) NULL,
	[CT2_ORIGEM] [varchar](100) NULL,
	[CT2_ROTINA] [varchar](10) NULL,
	[CT2_AGLUT] [varchar](1) NULL,
	[CT2_LP] [varchar](3) NULL,
	[CT2_SEQHIS] [varchar](3) NULL,
	[CT2_SEQLAN] [varchar](3) NULL,
	[CT2_DTVENC] [varchar](8) NULL,
	[CT2_SLBASE] [varchar](1) NULL,
	[CT2_DTLP] [varchar](8) NULL,
	[CT2_DATATX] [varchar](8) NULL,
	[CT2_TAXA] [float] NULL,
	[CT2_VLR01] [float] NULL,
	[CT2_VLR02] [float] NULL,
	[CT2_VLR03] [float] NULL,
	[CT2_VLR04] [float] NULL,
	[CT2_VLR05] [float] NULL,
	[CT2_CRCONV] [varchar](1) NULL,
	[CT2_CRITER] [varchar](4) NULL,
	[CT2_KEY] [varchar](200) NULL,
	[CT2_SEGOFI] [varchar](10) NULL,
	[CT2_DTCV3] [varchar](8) NULL,
	[CT2_SEQIDX] [varchar](5) NULL,
	[CT2_CONFST] [varchar](1) NULL,
	[CT2_OBSCNF] [varchar](40) NULL,
	[CT2_USRCNF] [varchar](15) NULL,
	[CT2_DTCONF] [varchar](8) NULL,
	[CT2_HRCONF] [varchar](10) NULL,
	[CT2_MLTSLD] [varchar](20) NULL,
	[CT2_CTLSLD] [varchar](1) NULL,
	[CT2_CODPAR] [varchar](6) NULL,
	[CT2_NODIA] [varchar](10) NULL,
	[CT2_DIACTB] [varchar](2) NULL,
	[CT2_MOEFDB] [varchar](2) NULL,
	[CT2_MOEFCR] [varchar](2) NULL,
	[CT2_USERGI] [varchar](17) NULL,
	[CT2_USERGA] [varchar](17) NULL,
	[CT2_AT01DB] [varchar](20) NULL,
	[CT2_AT01CR] [varchar](20) NULL,
	[CT2_AT02DB] [varchar](20) NULL,
	[CT2_AT02CR] [varchar](20) NULL,
	[CT2_AT03DB] [varchar](20) NULL,
	[CT2_AT03CR] [varchar](20) NULL,
	[CT2_AT04DB] [varchar](20) NULL,
	[CT2_AT04CR] [varchar](20) NULL,
	[CT2_LANCSU] [varchar](3) NULL,
	[CT2_GRPDIA] [varchar](3) NULL,
	[CT2_LANC] [varchar](15) NULL,
	[CT2_CODCLI] [varchar](6) NULL,
	[CT2_CODFOR] [varchar](6) NULL,
	[CT2_CTRLSD] [varchar](1) NULL,
	[CT2_EC05DB] [varchar](16) NULL,
	[CT2_EC05CR] [varchar](16) NULL,
	[CT2_EC06DB] [varchar](16) NULL,
	[CT2_EC06CR] [varchar](16) NULL,
	[CT2_EC07DB] [varchar](16) NULL,
	[CT2_EC07CR] [varchar](16) NULL,
	[CT2_EC08DB] [varchar](16) NULL,
	[CT2_EC08CR] [varchar](16) NULL,
	[CT2_EC09DB] [varchar](16) NULL,
	[CT2_EC09CR] [varchar](16) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_CT2010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTT010]    Script Date: 24/01/2024 14:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTT010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[CTT_FILIAL] [varchar](2) NULL,
	[CTT_CUSTO] [varchar](9) NULL,
	[CTT_CLASSE] [varchar](1) NULL,
	[CTT_NORMAL] [varchar](1) NULL,
	[CTT_DESC01] [varchar](40) NULL,
	[CTT_DESC02] [varchar](40) NULL,
	[CTT_DESC03] [varchar](40) NULL,
	[CTT_DESC04] [varchar](40) NULL,
	[CTT_DESC05] [varchar](40) NULL,
	[CTT_BLOQ] [varchar](1) NULL,
	[CTT_DTBLIN] [varchar](8) NULL,
	[CTT_DTBLFI] [varchar](8) NULL,
	[CTT_DTEXIS] [varchar](8) NULL,
	[CTT_DTEXSF] [varchar](8) NULL,
	[CTT_CCLP] [varchar](9) NULL,
	[CTT_CCPON] [varchar](9) NULL,
	[CTT_BOOK] [varchar](20) NULL,
	[CTT_TIPO00] [varchar](2) NULL,
	[CTT_CCSUP] [varchar](9) NULL,
	[CTT_TIPO01] [varchar](2) NULL,
	[CTT_RES] [varchar](10) NULL,
	[CTT_CRGNV1] [varchar](12) NULL,
	[CTT_RGNV2] [varchar](12) NULL,
	[CTT_RGNV3] [varchar](12) NULL,
	[CTT_STATUS] [varchar](1) NULL,
	[CTT_FILMAT] [varchar](2) NULL,
	[CTT_MAT] [varchar](6) NULL,
	[CTT_LOCAL] [varchar](2) NULL,
	[CTT_ITOBRG] [varchar](1) NULL,
	[CTT_CLOBRG] [varchar](1) NULL,
	[CTT_ACITEM] [varchar](1) NULL,
	[CTT_ACCLVL] [varchar](1) NULL,
	[CTT_CCVM] [varchar](9) NULL,
	[CTT_CCRED] [varchar](9) NULL,
	[CTT_OPERAC] [varchar](3) NULL,
	[CTT_CSINCO] [varchar](1) NULL,
	[CTT_ACAT01] [varchar](1) NULL,
	[CTT_ACAT02] [varchar](1) NULL,
	[CTT_ACAT03] [varchar](1) NULL,
	[CTT_ACAT04] [varchar](1) NULL,
	[CTT_ACATIV] [varchar](1) NULL,
	[CTT_INTRES] [varchar](1) NULL,
	[CTT_TPO01] [varchar](2) NULL,
	[CTT_TPO02] [varchar](2) NULL,
	[CTT_TPO03] [varchar](2) NULL,
	[CTT_TPO04] [varchar](2) NULL,
	[CTT_RESERV] [varchar](1) NULL,
	[CTT_AT01OB] [varchar](1) NULL,
	[CTT_AT02OB] [varchar](1) NULL,
	[CTT_AT03OB] [varchar](1) NULL,
	[CTT_AT04OB] [varchar](1) NULL,
	[CTT_ATOBRG] [varchar](1) NULL,
	[CTT_RHEXP] [varchar](6) NULL,
	[CTT_ZZMEDB] [varchar](16) NULL,
	[CTT_TPLOT] [varchar](2) NULL,
	[CTT_ZZMECR] [varchar](16) NULL,
	[CTT_NOME] [varchar](40) NULL,
	[CTT_TIPO] [varchar](1) NULL,
	[CTT_ZZMODB] [varchar](16) NULL,
	[CTT_CEI] [varchar](14) NULL,
	[CTT_TIPO2] [varchar](1) NULL,
	[CTT_ZZMOCR] [varchar](16) NULL,
	[CTT_CEI2] [varchar](14) NULL,
	[CTT_ENDER] [varchar](40) NULL,
	[CTT_ZZLODB] [varchar](16) NULL,
	[CTT_BAIRRO] [varchar](20) NULL,
	[CTT_CEP] [varchar](8) NULL,
	[CTT_ZZLOCR] [varchar](16) NULL,
	[CTT_ESTADO] [varchar](2) NULL,
	[CTT_CODMUN] [varchar](7) NULL,
	[CTT_ZZATDB] [varchar](16) NULL,
	[CTT_MUNIC] [varchar](20) NULL,
	[CTT_FPAS] [varchar](3) NULL,
	[CTT_ZZATCR] [varchar](16) NULL,
	[CTT_CODTER] [varchar](4) NULL,
	[CTT_PEREMP] [float] NULL,
	[CTT_ZZLEDB] [varchar](16) NULL,
	[CTT_PERFPA] [float] NULL,
	[CTT_PERCAC] [float] NULL,
	[CTT_ZZLECR] [varchar](16) NULL,
	[CTT_PERRAT] [float] NULL,
	[CTT_FAP] [float] NULL,
	[CTT_ZZFEST] [varchar](4) NULL,
	[CTT_OCORRE] [varchar](2) NULL,
	[CTT_VALFAT] [float] NULL,
	[CTT_ZZARM] [varchar](2) NULL,
	[CTT_RETIDO] [float] NULL,
	[CTT_RECFAT] [varchar](1) NULL,
	[CTT_ICTPAT] [varchar](1) NULL,
	[CTT_CNAE] [varchar](9) NULL,
	[CTT_TPINCT] [varchar](1) NULL,
	[CTT_ZSCEAL] [varchar](8) NULL,
	[CTT_NRINCT] [varchar](14) NULL,
	[CTT_ZZOLD] [varchar](22) NULL,
	[CTT_TPINPR] [varchar](1) NULL,
	[CTT_NRINPR] [varchar](14) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[CTT_ZSEGVA] [varchar](40) NULL,
	[CTT_ZPRINC] [varchar](20) NULL,
	[CTT_ZLOCOB] [varchar](200) NULL,
	[CTT_ZCNPJ] [varchar](14) NULL,
	[CTT_ZIE] [varchar](20) NULL,
	[CTT_ZENDOB] [varchar](200) NULL,
	[CTT_ZMUNOB] [varchar](200) NULL,
	[CTT_UFOBRA] [varchar](2) NULL,
	[CTT_ZIMOBR] [varchar](20) NULL,
	[CTT_ZBAIOB] [varchar](50) NULL,
	[CTT_ZCEPOB] [varchar](8) NULL,
	[CTT_EMAIL] [varchar](60) NULL,
	[CTT_CESCRI] [varchar](5) NULL,
	[CTT_CPART] [varchar](6) NULL,
	[CTT_USERGI] [varchar](17) NULL,
	[CTT_USERGA] [varchar](17) NULL,
	[CTT_ZZFLUI] [varchar](10) NULL,
	[CTT_ZFLBLQ] [varchar](10) NULL,
	[CTT_MSEXP] [varchar](8) NULL,
	[CTT_ZZRBME] [varchar](1) NULL,
	[CTT_ZZLOCL] [varchar](15) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_CTT010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CV0010]    Script Date: 24/01/2024 14:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CV0010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[CV0_FILIAL] [varchar](2) NULL,
	[CV0_PLANO] [varchar](2) NULL,
	[CV0_ITEM] [varchar](6) NULL,
	[CV0_CODIGO] [varchar](16) NULL,
	[CV0_DESC] [varchar](30) NULL,
	[CV0_CLASSE] [varchar](1) NULL,
	[CV0_NORMAL] [varchar](1) NULL,
	[CV0_ENTSUP] [varchar](16) NULL,
	[CV0_BLOQUE] [varchar](1) NULL,
	[CV0_DTIBLQ] [varchar](8) NULL,
	[CV0_DTFBLQ] [varchar](8) NULL,
	[CV0_DTIEXI] [varchar](8) NULL,
	[CV0_DTFEXI] [varchar](8) NULL,
	[CV0_CFGLIV] [varchar](3) NULL,
	[CV0_LUCPER] [varchar](15) NULL,
	[CV0_PONTE] [varchar](15) NULL,
	[CV0_ECVM] [varchar](16) NULL,
	[CV0_ECRED] [varchar](6) NULL,
	[CV0_ZGERFL] [varchar](2) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Erros]    Script Date: 24/01/2024 14:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Erros](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int] NOT NULL,
	[Arquivos do Email] [varchar](7000) NULL,
	[Data do Erro] [varchar](250) NULL,
	[Mensagem do Erro] [varchar](7000) NULL,
	[Data do Email] [varchar](250) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_ErrosRPA] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gestao de Bots]    Script Date: 24/01/2024 14:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gestao de Bots](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int] NOT NULL,
	[Data do Email] [varchar](250) NULL,
	[Arquivos do Email] [varchar](max) NULL,
	[Pasta de destino do email] [varchar](250) NULL,
	[Data de Processamento] [varchar](250) NULL,
	[Mover para processados] [varchar](250) NULL,
	[Remetente do Email] [varchar](250) NULL,
	[Assunto do Email] [varchar](250) NULL,
	[Ocupação] [varchar](250) NULL,
	[Fluig] [varchar](250) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_GestaoBotsRPA] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogRPA]    Script Date: 24/01/2024 14:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogRPA](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int] NOT NULL,
	[Nome Pasta (Clinica)] [varchar](250) NULL,
	[Nome Pasta (Funcionario)] [varchar](250) NULL,
	[Status (Nome da Tarefa Executada)] [varchar](250) NULL,
	[Mensagem (Detalhe da excecao)] [varchar](250) NULL,
	[Data/Hora] [varchar](250) NULL,
	[Codigo FLUIG] [varchar](250) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_LogRPA] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nao Processados]    Script Date: 24/01/2024 14:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nao Processados](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int] NOT NULL,
	[Data do Email] [varchar](250) NULL,
	[Origem do Email] [varchar](250) NULL,
	[Data do Processamento] [varchar](250) NULL,
	[Status] [varchar](250) NULL,
	[Mensagem de Erro] [varchar](250) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_NProcessadosRPA] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NNR010]    Script Date: 24/01/2024 14:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NNR010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[NNR_FILIAL] [varchar](2) NULL,
	[NNR_CODIGO] [varchar](2) NULL,
	[NNR_DESCRI] [varchar](100) NULL,
	[NNR_CODCLI] [varchar](6) NULL,
	[NNR_LOJCLI] [varchar](2) NULL,
	[NNR_TIPO] [varchar](1) NULL,
	[NNR_CTRAB] [varchar](6) NULL,
	[NNR_INTP] [varchar](1) NULL,
	[NNR_MRP] [varchar](1) NULL,
	[NNR_ARMALT] [varchar](1) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[NNR_ANP45] [varchar](1) NULL,
	[NNR_VDADMS] [varchar](1) NULL,
	[NNR_AMZUNI] [varchar](1) NULL,
	[NNR_ZZCC] [varchar](9) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_NNR010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NNS010]    Script Date: 24/01/2024 14:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NNS010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[NNS_FILIAL] [varchar](2) NULL,
	[NNS_COD] [varchar](10) NULL,
	[NNS_DATA] [varchar](8) NULL,
	[NNS_SOLICT] [varchar](20) NULL,
	[NNS_STATUS] [varchar](1) NULL,
	[NNS_JUSTIF] [varbinary](max) NULL,
	[NNS_CLASS] [varchar](1) NULL,
	[NNS_ESPECI] [varchar](5) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[NNS_ZZFLUI] [float] NULL,
	[NNS_ZZEMER] [varchar](1) NULL,
	[NNS_ZDTDIG] [varchar](8) NULL,
	[NNS_ZZCC] [varchar](9) NULL,
	[NNS_ZMENPA] [varchar](3) NULL,
	[NNS_ZTRANS] [varchar](6) NULL,
	[NNS_ZPESOL] [float] NULL,
	[NNS_ZPBRUT] [float] NULL,
	[NNS_ZVOLUM] [float] NULL,
	[NNS_ZESPEC] [varchar](10) NULL,
	[NNS_ZMENNO] [varbinary](max) NULL,
	[NNS_ZDATPR] [varchar](8) NULL,
	[NNS_ZZVEIC] [varchar](8) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_NNS010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NNT010]    Script Date: 24/01/2024 14:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NNT010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[NNT_FILIAL] [varchar](2) NULL,
	[NNT_COD] [varchar](10) NULL,
	[NNT_FILORI] [varchar](2) NULL,
	[NNT_PROD] [varchar](15) NULL,
	[NNT_UM] [varchar](2) NULL,
	[NNT_LOCAL] [varchar](2) NULL,
	[NNT_LOCALI] [varchar](15) NULL,
	[NNT_NSERIE] [varchar](20) NULL,
	[NNT_LOTECT] [varchar](21) NULL,
	[NNT_NUMLOT] [varchar](6) NULL,
	[NNT_DTVALI] [varchar](8) NULL,
	[NNT_POTENC] [float] NULL,
	[NNT_QUANT] [float] NULL,
	[NNT_QTSEG] [float] NULL,
	[NNT_FILDES] [varchar](2) NULL,
	[NNT_PRODD] [varchar](15) NULL,
	[NNT_UMD] [varchar](2) NULL,
	[NNT_LOCLD] [varchar](2) NULL,
	[NNT_LOCDES] [varchar](15) NULL,
	[NNT_LOTED] [varchar](21) NULL,
	[NNT_DTVALD] [varchar](8) NULL,
	[NNT_TS] [varchar](3) NULL,
	[NNT_TE] [varchar](3) NULL,
	[NNT_DOC] [varchar](9) NULL,
	[NNT_SERIE] [varchar](3) NULL,
	[NNT_OBS] [varchar](40) NULL,
	[NNT_SDOC] [varchar](3) NULL,
	[NNT_ZPRCVE] [float] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_NNT010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Processados]    Script Date: 24/01/2024 14:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Processados](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int] NOT NULL,
	[Data do Email] [varchar](250) NULL,
	[Origem do Email] [varchar](250) NULL,
	[Data do Processamento] [varchar](250) NULL,
	[Arquivo PDF] [varchar](250) NULL,
	[CPF] [varchar](250) NULL,
	[Funcionario] [varchar](250) NULL,
	[Status] [varchar](250) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_ProcessadosRPA] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SA2010]    Script Date: 24/01/2024 14:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SA2010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[A2_FILIAL] [varchar](2) NULL,
	[A2_COD] [varchar](6) NULL,
	[A2_LOJA] [varchar](2) NULL,
	[A2_NOME] [varchar](40) NULL,
	[A2_NREDUZ] [varchar](20) NULL,
	[A2_END] [varchar](80) NULL,
	[A2_NR_END] [varchar](6) NULL,
	[A2_BAIRRO] [varchar](20) NULL,
	[A2_EST] [varchar](2) NULL,
	[A2_CONTPRE] [varchar](1) NULL,
	[A2_ESTADO] [varchar](20) NULL,
	[A2_COD_MUN] [varchar](5) NULL,
	[A2_IBGE] [varchar](11) NULL,
	[A2_MUN] [varchar](60) NULL,
	[A2_CEP] [varchar](8) NULL,
	[A2_TIPO] [varchar](1) NULL,
	[A2_CX_POST] [varchar](5) NULL,
	[A2_PFISICA] [varchar](18) NULL,
	[A2_CGC] [varchar](14) NULL,
	[A2_DDI] [varchar](6) NULL,
	[A2_DDD] [varchar](3) NULL,
	[A2_TEL] [varchar](50) NULL,
	[A2_FAX] [varchar](15) NULL,
	[A2_INSCR] [varchar](18) NULL,
	[A2_INSCRM] [varchar](18) NULL,
	[A2_CONTATO] [varchar](15) NULL,
	[A2_BANCO] [varchar](3) NULL,
	[A2_AGENCIA] [varchar](5) NULL,
	[A2_NUMCON] [varchar](12) NULL,
	[A2_SWIFT] [varchar](30) NULL,
	[A2_NATUREZ] [varchar](10) NULL,
	[A2_TRANSP] [varchar](6) NULL,
	[A2_PRIOR] [varchar](1) NULL,
	[A2_RISCO] [varchar](3) NULL,
	[A2_COND] [varchar](3) NULL,
	[A2_LC] [varchar](14) NULL,
	[A2_MATR] [float] NULL,
	[A2_MCOMPRA] [float] NULL,
	[A2_METR] [float] NULL,
	[A2_MSALDO] [float] NULL,
	[A2_NROCOM] [float] NULL,
	[A2_PRICOM] [varchar](8) NULL,
	[A2_ULTCOM] [varchar](8) NULL,
	[A2_SALDUP] [float] NULL,
	[A2_DESVIO] [float] NULL,
	[A2_SALDUPM] [float] NULL,
	[A2_CONTA] [varchar](20) NULL,
	[A2_TIPORUR] [varchar](1) NULL,
	[A2_RECISS] [varchar](1) NULL,
	[A2_PAIS] [varchar](3) NULL,
	[A2_DEPTO] [varchar](30) NULL,
	[A2_ID_FBFN] [varchar](7) NULL,
	[A2_STATUS] [varchar](1) NULL,
	[A2_GRUPO] [varchar](3) NULL,
	[A2_ATIVIDA] [varchar](7) NULL,
	[A2_ORIG_1] [varchar](3) NULL,
	[A2_ORIG_2] [varchar](3) NULL,
	[A2_ORIG_3] [varchar](3) NULL,
	[A2_VINCULA] [varchar](1) NULL,
	[A2_REPRES] [varchar](52) NULL,
	[A2_REPCONT] [varchar](50) NULL,
	[A2_REPRTEL] [varchar](50) NULL,
	[A2_REPRFAX] [varchar](30) NULL,
	[A2_REPR_EM] [varchar](30) NULL,
	[A2_REPR_EN] [varchar](52) NULL,
	[A2_REPBAIR] [varchar](30) NULL,
	[A2_REPRMUN] [varchar](30) NULL,
	[A2_REPREST] [varchar](2) NULL,
	[A2_REPRCEP] [varchar](8) NULL,
	[A2_REPPAIS] [varchar](3) NULL,
	[A2_ID_REPR] [varchar](1) NULL,
	[A2_REPR_BA] [varchar](3) NULL,
	[A2_REPR_AG] [varchar](5) NULL,
	[A2_REPR_CO] [varchar](12) NULL,
	[A2_REPRCGC] [varchar](14) NULL,
	[A2_RET_PAI] [varchar](1) NULL,
	[A2_COMI_SO] [varchar](1) NULL,
	[A2_EMAIL] [varchar](60) NULL,
	[A2_HPAGE] [varchar](30) NULL,
	[A2_CODMUN] [varchar](5) NULL,
	[A2_CONTCOM] [varchar](15) NULL,
	[A2_FATAVA] [float] NULL,
	[A2_FABRICA] [varchar](1) NULL,
	[A2_DTAVA] [varchar](8) NULL,
	[A2_DTVAL] [varchar](8) NULL,
	[A2_OK] [varchar](2) NULL,
	[A2_RECINSS] [varchar](1) NULL,
	[A2_TELEX] [varchar](10) NULL,
	[A2_CODPAIS] [varchar](5) NULL,
	[A2_TPISSRS] [varchar](2) NULL,
	[A2_CODLOC] [varchar](8) NULL,
	[A2_TPESSOA] [varchar](2) NULL,
	[A2_MNOTA] [float] NULL,
	[A2_RECCIDE] [varchar](1) NULL,
	[A2_GRPTRIB] [varchar](3) NULL,
	[A2_UNFEDRP] [varchar](30) NULL,
	[A2_CONTAB] [varchar](15) NULL,
	[A2_CLIQF] [varchar](15) NULL,
	[A2_PLGRUPO] [varchar](3) NULL,
	[A2_CODBLO] [varchar](3) NULL,
	[A2_PAISORI] [varchar](20) NULL,
	[A2_ROYALTY] [varchar](1) NULL,
	[A2_TXTRIBU] [float] NULL,
	[A2_B2B] [varchar](1) NULL,
	[A2_PLCRRES] [varchar](1) NULL,
	[A2_PLFIL] [varchar](1) NULL,
	[A2_SIGLCR] [varchar](7) NULL,
	[A2_CONREG] [varchar](10) NULL,
	[A2_DATBLO] [varchar](8) NULL,
	[A2_PLPEDES] [float] NULL,
	[A2_CBO] [varchar](7) NULL,
	[A2_CNAE] [varchar](9) NULL,
	[A2_CIVIL] [varchar](1) NULL,
	[A2_ROYMIN] [float] NULL,
	[A2_SATIV1] [varchar](6) NULL,
	[A2_PAGAMEN] [varchar](1) NULL,
	[A2_ENDCOMP] [varchar](21) NULL,
	[A2_MSBLQL] [varchar](1) NULL,
	[A2_GRPDEP] [varchar](5) NULL,
	[A2_SUBCOD] [varchar](1) NULL,
	[A2_TIPAWB] [varchar](1) NULL,
	[A2_RECSEST] [varchar](1) NULL,
	[A2_FILDEB] [varchar](2) NULL,
	[A2_RECPIS] [varchar](1) NULL,
	[A2_RECCOFI] [varchar](1) NULL,
	[A2_RECCSLL] [varchar](1) NULL,
	[A2_ABICS] [varchar](4) NULL,
	[A2_CODFAV] [varchar](6) NULL,
	[A2_LOJFAV] [varchar](2) NULL,
	[A2_NUMDEP] [float] NULL,
	[A2_CALCIRF] [varchar](1) NULL,
	[A2_VINCULO] [varchar](2) NULL,
	[A2_DTINIV] [varchar](8) NULL,
	[A2_DTFIMV] [varchar](8) NULL,
	[A2_CODADM] [varchar](3) NULL,
	[A2_RETISI] [varchar](1) NULL,
	[A2_ISICM] [varchar](1) NULL,
	[A2_INDRUR] [varchar](1) NULL,
	[A2_UFFIC] [varchar](2) NULL,
	[A2_ISSRSLC] [varchar](1) NULL,
	[A2_TPREG] [varchar](1) NULL,
	[A2_SUBCON] [varchar](1) NULL,
	[A2_CCICMS] [varchar](1) NULL,
	[A2_RFASEMT] [varchar](1) NULL,
	[A2_RIMAMT] [varchar](1) NULL,
	[A2_CTARE] [varchar](1) NULL,
	[A2_SITESBH] [varchar](1) NULL,
	[A2_INCULT] [varchar](1) NULL,
	[A2_TPLOGR] [varchar](3) NULL,
	[A2_CPOMSP] [varchar](1) NULL,
	[A2_IDHIST] [varchar](20) NULL,
	[A2_NUMRA] [varchar](6) NULL,
	[A2_CPFIRP] [varchar](11) NULL,
	[A2_PRSTSER] [varchar](1) NULL,
	[A2_TPRNTRC] [varchar](1) NULL,
	[A2_EQPTAC] [varchar](1) NULL,
	[A2_STRNTRC] [varchar](1) NULL,
	[A2_INSCMU] [varchar](1) NULL,
	[A2_SIMPNAC] [varchar](1) NULL,
	[A2_CODINSS] [varchar](11) NULL,
	[A2_MJURIDI] [varchar](1) NULL,
	[A2_RECFET] [varchar](1) NULL,
	[A2_RFABOV] [varchar](1) NULL,
	[A2_RFACS] [varchar](1) NULL,
	[A2_NEMPR] [varchar](150) NULL,
	[A2_TPCON] [varchar](2) NULL,
	[A2_REGESIM] [varchar](1) NULL,
	[A2_PAISEX] [varchar](3) NULL,
	[A2_NIFEX] [varchar](30) NULL,
	[A2_CALCINP] [varchar](1) NULL,
	[A2_RFUNDES] [varchar](1) NULL,
	[A2_CONTRIB] [varchar](1) NULL,
	[A2_DTNASC] [varchar](8) NULL,
	[A2_OCORREN] [varchar](2) NULL,
	[A2_CATEG] [varchar](2) NULL,
	[A2_CODNIT] [varchar](11) NULL,
	[A2_CODFI] [varchar](3) NULL,
	[A2_DTCONV] [varchar](8) NULL,
	[A2_FORMPAG] [varchar](2) NULL,
	[A2_TPJ] [varchar](1) NULL,
	[A2_RESPTRI] [varchar](2) NULL,
	[A2_TPCONTA] [varchar](1) NULL,
	[A2_IMPIP] [varchar](1) NULL,
	[A2_TIPCTA] [varchar](1) NULL,
	[A2_FOMEZER] [varchar](1) NULL,
	[A2_COMPLEM] [varchar](50) NULL,
	[A2_FRETISS] [varchar](1) NULL,
	[A2_LOGEX] [varchar](60) NULL,
	[A2_NUMEX] [varchar](6) NULL,
	[A2_COMPLR] [varchar](25) NULL,
	[A2_BAIEX] [varchar](20) NULL,
	[A2_BREEX] [varchar](3) NULL,
	[A2_TPREX] [varchar](3) NULL,
	[A2_TRBEX] [varchar](2) NULL,
	[A2_ESTEX] [varchar](40) NULL,
	[A2_TELRE] [varchar](15) NULL,
	[A2_FILTRF] [varchar](2) NULL,
	[A2_CGCEX] [varchar](14) NULL,
	[A2_DTINIR] [varchar](8) NULL,
	[A2_DTFIMR] [varchar](8) NULL,
	[A2_CIDEX] [varchar](40) NULL,
	[A2_POSEX] [varchar](10) NULL,
	[A2_MINIRF] [varchar](1) NULL,
	[A2_MUNSC] [varchar](5) NULL,
	[A2_CODSIAF] [varchar](4) NULL,
	[A2_RNTRC] [varchar](14) NULL,
	[A2_DTRNTRC] [varchar](8) NULL,
	[A2_ENDNOT] [varchar](1) NULL,
	[A2_LOCQUIT] [varchar](1) NULL,
	[A2_INCLTMG] [varchar](1) NULL,
	[A2_IRPROG] [varchar](1) NULL,
	[A2_TRIBFAV] [varchar](1) NULL,
	[A2_PAGGFE] [varchar](1) NULL,
	[A2_APOLICE] [varchar](20) NULL,
	[A2_FORNEMA] [varchar](1) NULL,
	[A2_DVAGE] [varchar](1) NULL,
	[A2_DVCTA] [varchar](2) NULL,
	[A2_MSBLQD] [varchar](8) NULL,
	[A2_CONFFIS] [varchar](1) NULL,
	[A2_INOVAUT] [varchar](1) NULL,
	[A2_NOMRESP] [varchar](45) NULL,
	[A2_MINPUB] [varchar](1) NULL,
	[A2_REGPB] [varchar](1) NULL,
	[A2_MOTNIF] [varchar](1) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[A2_EC05DB] [varchar](16) NULL,
	[A2_EC05CR] [varchar](16) NULL,
	[A2_EC06DB] [varchar](16) NULL,
	[A2_EC06CR] [varchar](16) NULL,
	[A2_EC07DB] [varchar](16) NULL,
	[A2_EC07CR] [varchar](16) NULL,
	[A2_EC08DB] [varchar](16) NULL,
	[A2_EC08CR] [varchar](16) NULL,
	[A2_EC09DB] [varchar](16) NULL,
	[A2_EC09CR] [varchar](16) NULL,
	[A2_DIGCTA] [varchar](1) NULL,
	[A2_ZZOLD] [varchar](8) NULL,
	[A2_DESPORT] [varchar](1) NULL,
	[A2_CARGO] [varchar](40) NULL,
	[A2_DEDBSPC] [varchar](1) NULL,
	[A2_RECFMD] [varchar](1) NULL,
	[A2_ZZCTPG] [varchar](1) NULL,
	[A2_RIPFAVR] [varchar](40) NULL,
	[A2_RCICFAV] [varchar](14) NULL,
	[A2_NOVAGIA] [varchar](5) NULL,
	[A2_TPENT] [varchar](1) NULL,
	[A2_ZZTPFOR] [varchar](2) NULL,
	[A2_CLIENTE] [varchar](6) NULL,
	[A2_DRPEXP] [varchar](8) NULL,
	[A2_CPRB] [varchar](1) NULL,
	[A2_LOJCLI] [varchar](2) NULL,
	[A2_USERLGI] [varchar](17) NULL,
	[A2_USERLGA] [varchar](17) NULL,
	[A2_ZIDFLIN] [varchar](10) NULL,
	[A2_ZIDFLAL] [varchar](10) NULL,
	[A2_ZZPART] [varchar](1) NULL,
	[A2_GROSSIR] [varchar](1) NULL,
	[A2_INDCP] [varchar](1) NULL,
	[A2_CPFRUR] [varchar](11) NULL,
	[A2_MSEXP] [varchar](8) NULL,
	[A2_ZZTP] [varchar](1) NULL,
	[A2_ZINTSRM] [varchar](1) NULL,
	[A2_CATEFD] [varchar](3) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SA2010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SB1010]    Script Date: 24/01/2024 14:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SB1010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[B1_FILIAL] [varchar](2) NULL,
	[B1_COD] [varchar](15) NULL,
	[B1_DESC] [varchar](100) NULL,
	[B1_TIPO] [varchar](2) NULL,
	[B1_CODITE] [varchar](27) NULL,
	[B1_UM] [varchar](2) NULL,
	[B1_LOCPAD] [varchar](2) NULL,
	[B1_GRUPO] [varchar](4) NULL,
	[B1_PICM] [float] NULL,
	[B1_IPI] [float] NULL,
	[B1_POSIPI] [varchar](10) NULL,
	[B1_ESPECIE] [varchar](2) NULL,
	[B1_EX_NCM] [varchar](3) NULL,
	[B1_EX_NBM] [varchar](3) NULL,
	[B1_ALIQISS] [float] NULL,
	[B1_CODISS] [varchar](9) NULL,
	[B1_TE] [varchar](3) NULL,
	[B1_TS] [varchar](3) NULL,
	[B1_PICMRET] [float] NULL,
	[B1_PICMENT] [float] NULL,
	[B1_IMPZFRC] [varchar](1) NULL,
	[B1_BITMAP] [varchar](20) NULL,
	[B1_SEGUM] [varchar](2) NULL,
	[B1_CONV] [float] NULL,
	[B1_TIPCONV] [varchar](1) NULL,
	[B1_ALTER] [varchar](15) NULL,
	[B1_QE] [float] NULL,
	[B1_PRV1] [float] NULL,
	[B1_EMIN] [float] NULL,
	[B1_CUSTD] [float] NULL,
	[B1_UCALSTD] [varchar](8) NULL,
	[B1_UPRC] [float] NULL,
	[B1_MCUSTD] [varchar](1) NULL,
	[B1_UCOM] [varchar](8) NULL,
	[B1_PESO] [float] NULL,
	[B1_ESTSEG] [float] NULL,
	[B1_ESTFOR] [varchar](3) NULL,
	[B1_FORPRZ] [varchar](3) NULL,
	[B1_PE] [float] NULL,
	[B1_TIPE] [varchar](1) NULL,
	[B1_LE] [float] NULL,
	[B1_LM] [float] NULL,
	[B1_CONTA] [varchar](20) NULL,
	[B1_TOLER] [float] NULL,
	[B1_CC] [varchar](9) NULL,
	[B1_ITEMCC] [varchar](9) NULL,
	[B1_FAMILIA] [varchar](1) NULL,
	[B1_PROC] [varchar](6) NULL,
	[B1_QB] [float] NULL,
	[B1_LOJPROC] [varchar](2) NULL,
	[B1_APROPRI] [varchar](1) NULL,
	[B1_TIPODEC] [varchar](1) NULL,
	[B1_ORIGEM] [varchar](1) NULL,
	[B1_CLASFIS] [varchar](2) NULL,
	[B1_FANTASM] [varchar](1) NULL,
	[B1_RASTRO] [varchar](1) NULL,
	[B1_UREV] [varchar](8) NULL,
	[B1_DATREF] [varchar](8) NULL,
	[B1_FORAEST] [varchar](1) NULL,
	[B1_COMIS] [float] NULL,
	[B1_MONO] [varchar](1) NULL,
	[B1_PERINV] [float] NULL,
	[B1_DTREFP1] [varchar](8) NULL,
	[B1_GRTRIB] [varchar](6) NULL,
	[B1_MRP] [varchar](1) NULL,
	[B1_NOTAMIN] [float] NULL,
	[B1_PRVALID] [float] NULL,
	[B1_NUMCOP] [float] NULL,
	[B1_CONINI] [varchar](8) NULL,
	[B1_CONTSOC] [varchar](1) NULL,
	[B1_IRRF] [varchar](1) NULL,
	[B1_CODBAR] [varchar](15) NULL,
	[B1_GRADE] [varchar](1) NULL,
	[B1_FORMLOT] [varchar](3) NULL,
	[B1_FPCOD] [varchar](10) NULL,
	[B1_LOCALIZ] [varchar](1) NULL,
	[B1_OPERPAD] [varchar](2) NULL,
	[B1_DESC_P] [varchar](6) NULL,
	[B1_CONTRAT] [varchar](1) NULL,
	[B1_DESC_I] [varchar](6) NULL,
	[B1_DESC_GI] [varchar](6) NULL,
	[B1_VLREFUS] [float] NULL,
	[B1_IMPORT] [varchar](1) NULL,
	[B1_OPC] [varchar](80) NULL,
	[B1_ANUENTE] [varchar](1) NULL,
	[B1_CODOBS] [varchar](6) NULL,
	[B1_SITPROD] [varchar](2) NULL,
	[B1_FABRIC] [varchar](20) NULL,
	[B1_MODELO] [varchar](15) NULL,
	[B1_SETOR] [varchar](2) NULL,
	[B1_BALANCA] [varchar](1) NULL,
	[B1_TECLA] [varchar](3) NULL,
	[B1_PRODPAI] [varchar](15) NULL,
	[B1_TIPOCQ] [varchar](1) NULL,
	[B1_SOLICIT] [varchar](1) NULL,
	[B1_BASE3] [varchar](14) NULL,
	[B1_DESBSE3] [varchar](60) NULL,
	[B1_AGREGCU] [varchar](1) NULL,
	[B1_GRUPCOM] [varchar](6) NULL,
	[B1_QUADPRO] [varchar](1) NULL,
	[B1_DESPIMP] [varchar](1) NULL,
	[B1_NUMCQPR] [float] NULL,
	[B1_CONTCQP] [float] NULL,
	[B1_REVATU] [varchar](3) NULL,
	[B1_CODEMB] [varchar](30) NULL,
	[B1_INSS] [varchar](1) NULL,
	[B1_ESPECIF] [varchar](80) NULL,
	[B1_MAT_PRI] [varchar](20) NULL,
	[B1_REDINSS] [float] NULL,
	[B1_NALNCCA] [varchar](7) NULL,
	[B1_ALADI] [varchar](3) NULL,
	[B1_NALSH] [varchar](8) NULL,
	[B1_REDIRRF] [float] NULL,
	[B1_TAB_IPI] [varchar](2) NULL,
	[B1_GRUDES] [varchar](3) NULL,
	[B1_REDPIS] [float] NULL,
	[B1_REDCOF] [float] NULL,
	[B1_DATASUB] [varchar](8) NULL,
	[B1_PCSLL] [float] NULL,
	[B1_PCOFINS] [float] NULL,
	[B1_PPIS] [float] NULL,
	[B1_MTBF] [float] NULL,
	[B1_MTTR] [float] NULL,
	[B1_FLAGSUG] [varchar](1) NULL,
	[B1_CLASSVE] [varchar](1) NULL,
	[B1_MIDIA] [varchar](1) NULL,
	[B1_QTMIDIA] [float] NULL,
	[B1_VLR_IPI] [float] NULL,
	[B1_ENVOBR] [varchar](1) NULL,
	[B1_SERIE] [varchar](20) NULL,
	[B1_FAIXAS] [float] NULL,
	[B1_NROPAG] [float] NULL,
	[B1_ISBN] [varchar](10) NULL,
	[B1_TITORIG] [varchar](50) NULL,
	[B1_LINGUA] [varchar](20) NULL,
	[B1_EDICAO] [varchar](3) NULL,
	[B1_OBSISBN] [varchar](40) NULL,
	[B1_CLVL] [varchar](9) NULL,
	[B1_ATIVO] [varchar](1) NULL,
	[B1_EMAX] [float] NULL,
	[B1_PESBRU] [float] NULL,
	[B1_TIPCAR] [varchar](6) NULL,
	[B1_FRACPER] [float] NULL,
	[B1_INT_ICM] [float] NULL,
	[B1_VLR_ICM] [float] NULL,
	[B1_VLRSELO] [float] NULL,
	[B1_CODNOR] [varchar](3) NULL,
	[B1_CORPRI] [varchar](6) NULL,
	[B1_CORSEC] [varchar](6) NULL,
	[B1_NICONE] [varchar](15) NULL,
	[B1_ATRIB1] [varchar](6) NULL,
	[B1_ATRIB2] [varchar](6) NULL,
	[B1_ATRIB3] [varchar](6) NULL,
	[B1_REGSEQ] [varchar](6) NULL,
	[B1_CPOTENC] [varchar](1) NULL,
	[B1_POTENCI] [float] NULL,
	[B1_QTDACUM] [float] NULL,
	[B1_QTDINIC] [float] NULL,
	[B1_REQUIS] [varchar](1) NULL,
	[B1_SELO] [varchar](1) NULL,
	[B1_LOTVEN] [float] NULL,
	[B1_OK] [varchar](4) NULL,
	[B1_USAFEFO] [varchar](1) NULL,
	[B1_IAT] [varchar](1) NULL,
	[B1_IPPT] [varchar](1) NULL,
	[B1_CNATREC] [varchar](3) NULL,
	[B1_TNATREC] [varchar](4) NULL,
	[B1_AFASEMT] [float] NULL,
	[B1_AIMAMT] [float] NULL,
	[B1_AFUNDES] [float] NULL,
	[B1_DCRE] [varchar](10) NULL,
	[B1_DCR] [varchar](9) NULL,
	[B1_DCRII] [float] NULL,
	[B1_COEFDCR] [float] NULL,
	[B1_DCI] [varchar](1) NULL,
	[B1_DIFCNAE] [varchar](11) NULL,
	[B1_GRPNATR] [varchar](2) NULL,
	[B1_DTFIMNT] [varchar](8) NULL,
	[B1_TPPROD] [varchar](2) NULL,
	[B1_FECP] [float] NULL,
	[B1_MARKUP] [float] NULL,
	[B1_DTCORTE] [varchar](8) NULL,
	[B1_TPREG] [varchar](1) NULL,
	[B1_VEREAN] [varchar](2) NULL,
	[B1_VIGENC] [varchar](8) NULL,
	[B1_CHASSI] [varchar](25) NULL,
	[B1_AFABOV] [float] NULL,
	[B1_INTEG] [varchar](1) NULL,
	[B1_USERLGI] [varchar](17) NULL,
	[B1_USERLGA] [varchar](17) NULL,
	[B1_HREXPO] [varchar](8) NULL,
	[B1_CRICMS] [varchar](1) NULL,
	[B1_CEST] [varchar](9) NULL,
	[B1_GRPCST] [varchar](3) NULL,
	[B1_MOPC] [varbinary](max) NULL,
	[B1_REFBAS] [varchar](1) NULL,
	[B1_TIPOBN] [varchar](2) NULL,
	[B1_ESCRIPI] [varchar](1) NULL,
	[B1_UMOEC] [float] NULL,
	[B1_UVLRC] [float] NULL,
	[B1_PIS] [varchar](1) NULL,
	[B1_GCCUSTO] [varchar](8) NULL,
	[B1_CCCUSTO] [varchar](9) NULL,
	[B1_VLR_PIS] [float] NULL,
	[B1_CLASSE] [varchar](6) NULL,
	[B1_PARCEI] [varchar](6) NULL,
	[B1_GDODIF] [varchar](1) NULL,
	[B1_TALLA] [varchar](6) NULL,
	[B1_VALEPRE] [varchar](1) NULL,
	[B1_FUSTF] [varchar](1) NULL,
	[B1_CODQAD] [varchar](20) NULL,
	[B1_PMACNUT] [float] NULL,
	[B1_PMICNUT] [float] NULL,
	[B1_MSBLQL] [varchar](1) NULL,
	[B1_CODPROC] [varchar](100) NULL,
	[B1_QBP] [float] NULL,
	[B1_PRODSBP] [varchar](1) NULL,
	[B1_VLCIF] [float] NULL,
	[B1_LOTESBP] [float] NULL,
	[B1_AFACS] [float] NULL,
	[B1_ALFECRN] [float] NULL,
	[B1_ALFECST] [float] NULL,
	[B1_CFEM] [varchar](1) NULL,
	[B1_CFEMA] [float] NULL,
	[B1_CFEMS] [varchar](1) NULL,
	[B1_CRDPRES] [float] NULL,
	[B1_CRICMST] [varchar](1) NULL,
	[B1_FECPBA] [float] NULL,
	[B1_IDHIST] [varchar](20) NULL,
	[B1_AJUDIF] [varchar](1) NULL,
	[B1_ALFECOP] [float] NULL,
	[B1_FECOP] [varchar](1) NULL,
	[B1_MEPLES] [varchar](1) NULL,
	[B1_MSEXP] [varchar](8) NULL,
	[B1_PAFMD5] [varchar](32) NULL,
	[B1_REGESIM] [varchar](1) NULL,
	[B1_RSATIVO] [varchar](1) NULL,
	[B1_SITTRIB] [varchar](1) NULL,
	[B1_TFETHAB] [varchar](1) NULL,
	[B1_TPDP] [varchar](1) NULL,
	[B1_ALFUMAC] [float] NULL,
	[B1_PRN944I] [varchar](1) NULL,
	[B1_CODLAN] [varchar](6) NULL,
	[B1_CARGAE] [varchar](1) NULL,
	[B1_TRIBMUN] [varchar](20) NULL,
	[B1_GARANT] [varchar](1) NULL,
	[B1_PERGART] [float] NULL,
	[B1_ADMIN] [varchar](10) NULL,
	[B1_PR43080] [float] NULL,
	[B1_PRINCMG] [float] NULL,
	[B1_RPRODEP] [varchar](1) NULL,
	[B1_PORCPRL] [varchar](2) NULL,
	[B1_IMPNCM] [float] NULL,
	[B1_AFETHAB] [float] NULL,
	[B1_RICM65] [varchar](1) NULL,
	[B1_GRPTI] [varchar](4) NULL,
	[B1_PRDORI] [varchar](15) NULL,
	[B1_DESBSE2] [varchar](60) NULL,
	[B1_BASE2] [varchar](14) NULL,
	[B1_FRETISS] [varchar](1) NULL,
	[B1_CRDEST] [float] NULL,
	[B1_REGRISS] [varchar](2) NULL,
	[B1_IVAAJU] [varchar](1) NULL,
	[B1_BASE] [varchar](14) NULL,
	[B1_TIPVEC] [varchar](6) NULL,
	[B1_COLOR] [varchar](10) NULL,
	[B1_VLR_COF] [float] NULL,
	[B1_PRFDSUL] [float] NULL,
	[B1_COFINS] [varchar](1) NULL,
	[B1_CSLL] [varchar](1) NULL,
	[B1_RETOPER] [varchar](1) NULL,
	[B1_CNAE] [varchar](9) NULL,
	[B1_SELOEN] [varchar](6) NULL,
	[B1_CODANT] [varchar](15) NULL,
	[B1_PRODREC] [varchar](1) NULL,
	[B1_FETHAB] [varchar](1) NULL,
	[B1_ESTRORI] [varchar](15) NULL,
	[B1_CALCFET] [varchar](1) NULL,
	[B1_PAUTFET] [float] NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[B1_EC05DB] [varchar](16) NULL,
	[B1_EC05CR] [varchar](16) NULL,
	[B1_EC06DB] [varchar](16) NULL,
	[B1_EC06CR] [varchar](16) NULL,
	[B1_EC07DB] [varchar](16) NULL,
	[B1_EC07CR] [varchar](16) NULL,
	[B1_EC08DB] [varchar](16) NULL,
	[B1_EC08CR] [varchar](16) NULL,
	[B1_EC09DB] [varchar](16) NULL,
	[B1_EC09CR] [varchar](16) NULL,
	[B1_TERUM] [varchar](2) NULL,
	[B1_AFAMAD] [float] NULL,
	[B1_ZZDEVOB] [varchar](1) NULL,
	[B1_ZSCEALT] [varchar](8) NULL,
	[B1_ZZFAMRP] [varchar](6) NULL,
	[B1_ZZOLD] [varchar](20) NULL,
	[B1_ZCONTA2] [varchar](20) NULL,
	[B1_CODGTIN] [varchar](15) NULL,
	[B1_QTDSER] [varchar](1) NULL,
	[B1_ZFABRIC] [varchar](4) NULL,
	[B1_ZREFFAB] [varchar](30) NULL,
	[B1_ZPAI] [varchar](15) NULL,
	[B1_ZCODCH] [varchar](30) NULL,
	[B1_ZLOGCH] [varbinary](max) NULL,
	[B1_TESCUMU] [varchar](200) NULL,
	[B1_ZATIVCU] [varchar](200) NULL,
	[B1_ZTENCUM] [varchar](200) NULL,
	[B1_ZATVNCU] [varchar](200) NULL,
	[B1_ZDSCCHL] [varbinary](max) NULL,
	[B1_ZNATCON] [varchar](9) NULL,
	[B1_ZZNATAP] [varchar](9) NULL,
	[B1_ZCTOREX] [varchar](2) NULL,
	[B1_ZZDTENT] [varchar](17) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SB1010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SB2010]    Script Date: 24/01/2024 14:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SB2010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[B2_FILIAL] [varchar](2) NULL,
	[B2_COD] [varchar](15) NULL,
	[B2_LOCAL] [varchar](2) NULL,
	[B2_QFIM] [float] NULL,
	[B2_QATU] [float] NULL,
	[B2_VFIM1] [float] NULL,
	[B2_VATU1] [float] NULL,
	[B2_CM1] [float] NULL,
	[B2_VFIM2] [float] NULL,
	[B2_VATU2] [float] NULL,
	[B2_CM2] [float] NULL,
	[B2_VFIM3] [float] NULL,
	[B2_VATU3] [float] NULL,
	[B2_CM3] [float] NULL,
	[B2_VFIM4] [float] NULL,
	[B2_VATU4] [float] NULL,
	[B2_CM4] [float] NULL,
	[B2_VFIM5] [float] NULL,
	[B2_VATU5] [float] NULL,
	[B2_CM5] [float] NULL,
	[B2_QEMP] [float] NULL,
	[B2_QEMPN] [float] NULL,
	[B2_QTSEGUM] [float] NULL,
	[B2_USAI] [varchar](8) NULL,
	[B2_RESERVA] [float] NULL,
	[B2_QPEDVEN] [float] NULL,
	[B2_LOCALIZ] [varchar](15) NULL,
	[B2_NAOCLAS] [float] NULL,
	[B2_SALPEDI] [float] NULL,
	[B2_DINVENT] [varchar](8) NULL,
	[B2_DINVFIM] [varchar](8) NULL,
	[B2_QTNP] [float] NULL,
	[B2_QNPT] [float] NULL,
	[B2_QTER] [float] NULL,
	[B2_QFIM2] [float] NULL,
	[B2_QACLASS] [float] NULL,
	[B2_DTINV] [varchar](8) NULL,
	[B2_CMFF1] [float] NULL,
	[B2_CMFF2] [float] NULL,
	[B2_CMFF3] [float] NULL,
	[B2_CMFF4] [float] NULL,
	[B2_CMFF5] [float] NULL,
	[B2_VFIMFF1] [float] NULL,
	[B2_VFIMFF2] [float] NULL,
	[B2_VFIMFF3] [float] NULL,
	[B2_VFIMFF4] [float] NULL,
	[B2_VFIMFF5] [float] NULL,
	[B2_QEMPSA] [float] NULL,
	[B2_QEMPPRE] [float] NULL,
	[B2_SALPPRE] [float] NULL,
	[B2_QEMP2] [float] NULL,
	[B2_QEMPN2] [float] NULL,
	[B2_RESERV2] [float] NULL,
	[B2_QPEDVE2] [float] NULL,
	[B2_QEPRE2] [float] NULL,
	[B2_QFIMFF] [float] NULL,
	[B2_SALPED2] [float] NULL,
	[B2_QEMPPRJ] [float] NULL,
	[B2_QEMPPR2] [float] NULL,
	[B2_STATUS] [varchar](1) NULL,
	[B2_CMFIM1] [float] NULL,
	[B2_CMFIM2] [float] NULL,
	[B2_CMFIM3] [float] NULL,
	[B2_CMFIM4] [float] NULL,
	[B2_CMFIM5] [float] NULL,
	[B2_TIPO] [varchar](1) NULL,
	[B2_CMRP1] [float] NULL,
	[B2_VFRP1] [float] NULL,
	[B2_CMRP2] [float] NULL,
	[B2_VFRP2] [float] NULL,
	[B2_CMRP3] [float] NULL,
	[B2_VFRP3] [float] NULL,
	[B2_CMRP4] [float] NULL,
	[B2_VFRP4] [float] NULL,
	[B2_CMRP5] [float] NULL,
	[B2_VFRP5] [float] NULL,
	[B2_QULT] [float] NULL,
	[B2_DULT] [varchar](8) NULL,
	[B2_BLOQUEI] [varchar](1) NULL,
	[B2_MSEXP] [varchar](8) NULL,
	[B2_ECSALDO] [float] NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[B2_XDTINI] [varchar](8) NULL,
	[B2_XDTFIN] [varchar](8) NULL,
	[B2_HMOV] [varchar](8) NULL,
	[B2_HULT] [varchar](8) NULL,
	[B2_DMOV] [varchar](8) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SB2010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SB5010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SB5010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[B5_FILIAL] [varchar](2) NULL,
	[B5_COD] [varchar](15) NULL,
	[B5_PRV2] [float] NULL,
	[B5_PRV3] [float] NULL,
	[B5_PRV4] [float] NULL,
	[B5_PRV5] [float] NULL,
	[B5_PRV6] [float] NULL,
	[B5_ECDESCR] [varbinary](max) NULL,
	[B5_PRV7] [float] NULL,
	[B5_ECENQUA] [varchar](20) NULL,
	[B5_CEME] [varchar](254) NULL,
	[B5_ECPESOE] [float] NULL,
	[B5_CODCLI] [varchar](15) NULL,
	[B5_ECALTEM] [float] NULL,
	[B5_CERT] [varchar](1) NULL,
	[B5_COMPR] [float] NULL,
	[B5_DES] [varchar](15) NULL,
	[B5_EMB1] [varchar](10) NULL,
	[B5_EMB2] [varchar](10) NULL,
	[B5_ESPESS] [float] NULL,
	[B5_ESTMAT] [varchar](1) NULL,
	[B5_LARG] [float] NULL,
	[B5_QE1] [float] NULL,
	[B5_QE2] [float] NULL,
	[B5_CONVDIP] [float] NULL,
	[B5_UMDIPI] [varchar](2) NULL,
	[B5_DTREFP2] [varchar](8) NULL,
	[B5_CARPER] [varchar](1) NULL,
	[B5_DTREFP3] [varchar](8) NULL,
	[B5_IDADEM] [float] NULL,
	[B5_DTREFP4] [varchar](8) NULL,
	[B5_DTREFP5] [varchar](8) NULL,
	[B5_DTREFP6] [varchar](8) NULL,
	[B5_DTREFP7] [varchar](8) NULL,
	[B5_COMPRLC] [float] NULL,
	[B5_LARGLC] [float] NULL,
	[B5_ALTURLC] [float] NULL,
	[B5_FATARMA] [float] NULL,
	[B5_EMPMAX] [float] NULL,
	[B5_ROTACAO] [varchar](1) NULL,
	[B5_CODCAI] [varchar](6) NULL,
	[B5_LOCALIZ] [varchar](15) NULL,
	[B5_AM4PORC] [float] NULL,
	[B5_ZF4PORC] [float] NULL,
	[B5_CODZON] [varchar](6) NULL,
	[B5_UMIND] [varchar](1) NULL,
	[B5_SERVENT] [varchar](3) NULL,
	[B5_SERVINT] [varchar](3) NULL,
	[B5_SERVSAI] [varchar](3) NULL,
	[B5_LVLEMB] [float] NULL,
	[B5_LPSEMB] [float] NULL,
	[B5_INTDI] [varchar](1) NULL,
	[B5_PERCUB] [float] NULL,
	[B5_IMPGRUP] [varchar](1) NULL,
	[B5_BENDL] [varchar](1) NULL,
	[B5_PINSUMO] [varchar](1) NULL,
	[B5_PORTMS] [varchar](1) NULL,
	[B5_REGMAPA] [varchar](10) NULL,
	[B5_EMBAGRO] [varchar](3) NULL,
	[B5_INDPETR] [varchar](1) NULL,
	[B5_PRODDNF] [float] NULL,
	[B5_NPULMAO] [varchar](1) NULL,
	[B5_INSUMO] [float] NULL,
	[B5_VOLRECI] [float] NULL,
	[B5_CODISRF] [float] NULL,
	[B5_USOITE] [varchar](1) NULL,
	[B5_LOCALI2] [varchar](15) NULL,
	[B5_CONCENT] [float] NULL,
	[B5_DENSID] [float] NULL,
	[B5_FTIN] [float] NULL,
	[B5_FTIF] [float] NULL,
	[B5_PROPOR1] [float] NULL,
	[B5_PROPOR2] [float] NULL,
	[B5_CRDEST1] [float] NULL,
	[B5_CRDEST2] [float] NULL,
	[B5_SERVEMB] [varchar](3) NULL,
	[B5_CALORIA] [float] NULL,
	[B5_PESO] [float] NULL,
	[B5_TOTGOR] [float] NULL,
	[B5_TOTGORS] [float] NULL,
	[B5_TOTGORT] [float] NULL,
	[B5_COR] [varchar](15) NULL,
	[B5_ALTURA] [float] NULL,
	[B5_MODELO] [varchar](30) NULL,
	[B5_ESPECIE] [varchar](5) NULL,
	[B5_QUALIDA] [varchar](5) NULL,
	[B5_ONU] [varchar](4) NULL,
	[B5_ITEM] [varchar](2) NULL,
	[B5_CODTP] [varchar](3) NULL,
	[B5_CMPEXTR] [varchar](1) NULL,
	[B5_EAN141] [float] NULL,
	[B5_EAN142] [float] NULL,
	[B5_EAN143] [float] NULL,
	[B5_EAN144] [float] NULL,
	[B5_EAN145] [float] NULL,
	[B5_EAN146] [float] NULL,
	[B5_EAN147] [float] NULL,
	[B5_EAN148] [float] NULL,
	[B5_TIPUNIT] [varchar](1) NULL,
	[B5_QTDVAR] [varchar](1) NULL,
	[B5_IMPETI] [varchar](1) NULL,
	[B5_VLDOPER] [varchar](1) NULL,
	[B5_VLDREQ] [varchar](1) NULL,
	[B5_DTINV] [varchar](8) NULL,
	[B5_NSERIE] [varchar](1) NULL,
	[B5_QEI] [float] NULL,
	[B5_QEL] [float] NULL,
	[B5_CDDMDBA] [varchar](5) NULL,
	[B5_SITDIEF] [varchar](2) NULL,
	[B5_DESCNFE] [varbinary](max) NULL,
	[B5_TABINC] [varchar](2) NULL,
	[B5_CODGRU] [varchar](2) NULL,
	[B5_MARCA] [varchar](60) NULL,
	[B5_DIASHL] [float] NULL,
	[B5_DIASHF] [float] NULL,
	[B5_REVPROD] [varchar](1) NULL,
	[B5_CODTRAM] [varchar](4) NULL,
	[B5_TPSERV] [varchar](1) NULL,
	[B5_WMSEMB] [varchar](1) NULL,
	[B5_NATBEN] [varchar](2) NULL,
	[B5_SEMENTE] [varchar](1) NULL,
	[B5_CULTRA] [varchar](10) NULL,
	[B5_DTDECRE] [varchar](8) NULL,
	[B5_CTVAR] [varchar](10) NULL,
	[B5_CATEG] [varchar](2) NULL,
	[B5_PENE] [varchar](4) NULL,
	[B5_COMPEND] [varchar](1) NULL,
	[B5_FUNCEP] [varchar](1) NULL,
	[B5_TPESOC] [varchar](2) NULL,
	[B5_MARGPRE] [float] NULL,
	[B5_VLRCID] [float] NULL,
	[B5_CODSERC] [varchar](9) NULL,
	[B5_ISEN] [varchar](1) NULL,
	[B5_VERIND] [varchar](1) NULL,
	[B5_IDHIST] [varchar](20) NULL,
	[B5_PROJDES] [varchar](1) NULL,
	[B5_NRECAGR] [varchar](15) NULL,
	[B5_INGATV] [varchar](40) NULL,
	[B5_FORCAO] [varchar](70) NULL,
	[B5_CLASSE] [varchar](70) NULL,
	[B5_CONCEN] [varchar](25) NULL,
	[B5_DESCSER] [varbinary](max) NULL,
	[B5_CODATIV] [varchar](8) NULL,
	[B5_FORMMRP] [varchar](1) NULL,
	[B5_PRZCQ] [float] NULL,
	[B5_ENDSAI] [varchar](15) NULL,
	[B5_FCIPRV] [float] NULL,
	[B5_REDALIQ] [varchar](1) NULL,
	[B5_AMMULTO] [float] NULL,
	[B5_AMMULTS] [float] NULL,
	[B5_ZFMULTO] [float] NULL,
	[B5_ZFMULTS] [float] NULL,
	[B5_NBS] [varchar](9) NULL,
	[B5_ECEAN1] [varchar](20) NULL,
	[B5_ECSUBT] [varchar](100) NULL,
	[B5_ISIDUNI] [varchar](1) NULL,
	[B5_CDFATD] [varchar](5) NULL,
	[B5_ECSEQ] [varchar](15) NULL,
	[B5_NUMBEAL] [varchar](5) NULL,
	[B5_DTDECAL] [varchar](8) NULL,
	[B5_NATALBE] [varchar](2) NULL,
	[B5_ECLARGE] [float] NULL,
	[B5_ECINDIC] [varbinary](max) NULL,
	[B5_NUMBEN] [varchar](5) NULL,
	[B5_ANOBEN] [varchar](4) NULL,
	[B5_BLQINVA] [varchar](1) NULL,
	[B5_BLQINVD] [float] NULL,
	[B5_MONTA] [varchar](1) NULL,
	[B5_FPRZCQ] [varchar](3) NULL,
	[B5_VERSAO] [varchar](3) NULL,
	[B5_GRPIVA] [varchar](3) NULL,
	[B5_DIASES] [float] NULL,
	[B5_AGLUMRP] [varchar](1) NULL,
	[B5_PROTCON] [varchar](30) NULL,
	[B5_ALTTRIB] [varchar](1) NULL,
	[B5_CODGNRE] [float] NULL,
	[B5_PROTOTI] [varchar](1) NULL,
	[B5_ECSEQ2] [varchar](15) NULL,
	[B5_INSPAT] [varchar](1) NULL,
	[B5_CTRWMS] [varchar](1) NULL,
	[B5_ENVMKT] [varchar](1) NULL,
	[B5_ECCUBAG] [float] NULL,
	[B5_ECAPRES] [varbinary](max) NULL,
	[B5_ECBENFI] [varbinary](max) NULL,
	[B5_ECDTEX2] [varchar](8) NULL,
	[B5_ECIMGFI] [varchar](90) NULL,
	[B5_ECPCHAV] [varchar](254) NULL,
	[B5_ECDTLAN] [varchar](8) NULL,
	[B5_CTDACON] [varchar](9) NULL,
	[B5_TPISERV] [varchar](1) NULL,
	[B5_ENDENT] [varchar](15) NULL,
	[B5_ENDREQ] [varchar](15) NULL,
	[B5_ENDDEV] [varchar](15) NULL,
	[B5_FORSER] [varchar](3) NULL,
	[B5_CATMAT] [varchar](20) NULL,
	[B5_TIPO] [varchar](1) NULL,
	[B5_DEC7174] [varchar](1) NULL,
	[B5_ECDTEX] [varchar](8) NULL,
	[B5_CLAUBA] [varchar](3) NULL,
	[B5_TRATAM] [varchar](6) NULL,
	[B5_UMPRC] [varchar](2) NULL,
	[B5_LEADTR] [float] NULL,
	[B5_ECCARAC] [varbinary](max) NULL,
	[B5_ECFLAG] [varchar](1) NULL,
	[B5_ECTITU] [varchar](100) NULL,
	[B5_ECPROFU] [float] NULL,
	[B5_TPAPUR] [varchar](1) NULL,
	[B5_CODFAM] [varchar](6) NULL,
	[B5_MARPEC] [varchar](6) NULL,
	[B5_CODLIN] [varchar](6) NULL,
	[B5_ECCOMP] [float] NULL,
	[B5_ECLARGU] [float] NULL,
	[B5_SERVDEV] [varchar](3) NULL,
	[B5_SERVREQ] [varchar](3) NULL,
	[B5_GSLE] [varchar](1) NULL,
	[B5_GSMC] [varchar](1) NULL,
	[B5_GSMI] [varchar](1) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[B5_INSSPAT] [varchar](1) NULL,
	[B5_VLZERO] [varchar](1) NULL,
	[B5_ECDESF] [varchar](1) NULL,
	[B5_INDCPRB] [varchar](1) NULL,
	[B5_ARREQTD] [varchar](1) NULL,
	[B5_SERVTDV] [varchar](3) NULL,
	[B5_SERSCD] [varchar](3) NULL,
	[B5_ENDSCD] [varchar](15) NULL,
	[B5_SERECD] [varchar](3) NULL,
	[B5_ENDECD] [varchar](15) NULL,
	[B5_ISDSHIP] [varchar](1) NULL,
	[B5_PERIOT] [float] NULL,
	[B5_2CODBAR] [varchar](15) NULL,
	[B5_TPCOMMO] [varchar](1) NULL,
	[B5_TAKEUP] [varchar](1) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SB5010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SBE010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SBE010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[BE_FILIAL] [varchar](2) NULL,
	[BE_LOCAL] [varchar](2) NULL,
	[BE_LOCALIZ] [varchar](15) NULL,
	[BE_DESCRIC] [varchar](30) NULL,
	[BE_CAPACID] [float] NULL,
	[BE_PRIOR] [varchar](3) NULL,
	[BE_ALTURLC] [float] NULL,
	[BE_LARGLC] [float] NULL,
	[BE_COMPRLC] [float] NULL,
	[BE_PERDA] [float] NULL,
	[BE_CODZON] [varchar](6) NULL,
	[BE_STATUS] [varchar](1) NULL,
	[BE_ESTFIS] [varchar](6) NULL,
	[BE_CODCFG] [varchar](6) NULL,
	[BE_CODPRO] [varchar](15) NULL,
	[BE_HORA] [varchar](5) NULL,
	[BE_OK] [varchar](2) NULL,
	[BE_EXCECAO] [varchar](3) NULL,
	[BE_DATGER] [varchar](8) NULL,
	[BE_HORGER] [varchar](4) NULL,
	[BE_VALNV1] [float] NULL,
	[BE_VALNV2] [float] NULL,
	[BE_VALNV3] [float] NULL,
	[BE_VALNV4] [float] NULL,
	[BE_VALNV5] [float] NULL,
	[BE_VALNV6] [float] NULL,
	[BE_DTINV] [varchar](8) NULL,
	[BE_IDETIQ] [varchar](10) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[BE_NRUNIT] [float] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SBE010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SBF010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SBF010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[BF_FILIAL] [varchar](2) NULL,
	[BF_PRODUTO] [varchar](15) NULL,
	[BF_LOCAL] [varchar](2) NULL,
	[BF_PRIOR] [varchar](3) NULL,
	[BF_LOCALIZ] [varchar](15) NULL,
	[BF_NUMSERI] [varchar](20) NULL,
	[BF_LOTECTL] [varchar](21) NULL,
	[BF_NUMLOTE] [varchar](6) NULL,
	[BF_QUANT] [float] NULL,
	[BF_EMPENHO] [float] NULL,
	[BF_QEMPPRE] [float] NULL,
	[BF_QTSEGUM] [float] NULL,
	[BF_EMPEN2] [float] NULL,
	[BF_QEPRE2] [float] NULL,
	[BF_DATAVEN] [varchar](8) NULL,
	[BF_ESTFIS] [varchar](6) NULL,
	[BF_DINVENT] [varchar](8) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SBF010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SBM010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SBM010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[BM_FILIAL] [varchar](2) NULL,
	[BM_GRUPO] [varchar](4) NULL,
	[BM_DESC] [varchar](100) NULL,
	[BM_PICPAD] [varchar](30) NULL,
	[BM_PROORI] [varchar](1) NULL,
	[BM_CODMAR] [varchar](3) NULL,
	[BM_STATUS] [varchar](1) NULL,
	[BM_GRUREL] [varchar](40) NULL,
	[BM_TIPGRU] [varchar](2) NULL,
	[BM_MARKUP] [float] NULL,
	[BM_PRECO] [varchar](3) NULL,
	[BM_MARGPRE] [float] NULL,
	[BM_LENREL] [float] NULL,
	[BM_TIPMOV] [varchar](1) NULL,
	[BM_CODGRT] [varchar](2) NULL,
	[BM_CLASGRU] [varchar](1) NULL,
	[BM_FORMUL] [varchar](6) NULL,
	[BM_DTUMOV] [varchar](8) NULL,
	[BM_HRUMOV] [varchar](5) NULL,
	[BM_CONC] [varchar](1) NULL,
	[BM_CORP] [varchar](1) NULL,
	[BM_EVENTO] [varchar](1) NULL,
	[BM_LAZER] [varchar](1) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[BM_ZZCOMPL] [varbinary](max) NULL,
	[BM_ZZFAMRP] [varchar](3) NULL,
	[BM_ZCONTA1] [varchar](20) NULL,
	[BM_ZCONTA2] [varchar](20) NULL,
	[BM_TESCUMU] [varchar](200) NULL,
	[BM_ZTENCUM] [varchar](200) NULL,
	[BM_ZATIVCU] [varchar](200) NULL,
	[BM_ZATVNCU] [varchar](200) NULL,
	[BM_TPSEGP] [varchar](1) NULL,
	[BM_ZGRPCH] [varchar](30) NULL,
	[BM_ZTIPOB1] [varchar](2) NULL,
	[BM_MSEXP] [varchar](8) NULL,
	[BM_MSBLQL] [varchar](1) NULL,
	[BM_ZCTOREX] [varchar](2) NULL,
	[BM_ZZDTENT] [varchar](17) NULL,
	[BM_ZNATCON] [varchar](9) NULL,
	[BM_ZZNATAP] [varchar](9) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SBM010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SC0010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SC0010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[C0_FILIAL] [varchar](2) NULL,
	[C0_NUM] [varchar](6) NULL,
	[C0_TIPO] [varchar](2) NULL,
	[C0_DOCRES] [varchar](9) NULL,
	[C0_SOLICIT] [varchar](20) NULL,
	[C0_FILRES] [varchar](2) NULL,
	[C0_PRODUTO] [varchar](15) NULL,
	[C0_LOCAL] [varchar](2) NULL,
	[C0_QUANT] [float] NULL,
	[C0_VALIDA] [varchar](8) NULL,
	[C0_EMISSAO] [varchar](8) NULL,
	[C0_NUMLOTE] [varchar](6) NULL,
	[C0_LOTECTL] [varchar](21) NULL,
	[C0_LOCALIZ] [varchar](15) NULL,
	[C0_NUMSERI] [varchar](20) NULL,
	[C0_QTDORIG] [float] NULL,
	[C0_QTDPED] [float] NULL,
	[C0_OBS] [varchar](80) NULL,
	[C0_QTDELIM] [float] NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[C0_ORIGEM] [varchar](15) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SC0010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SC1010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SC1010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[C1_FILIAL] [varchar](2) NULL,
	[C1_NUM] [varchar](6) NULL,
	[C1_ITEM] [varchar](4) NULL,
	[C1_PRODUTO] [varchar](15) NULL,
	[C1_UM] [varchar](2) NULL,
	[C1_DESCRI] [varchar](100) NULL,
	[C1_QUANT] [float] NULL,
	[C1_PRECO] [float] NULL,
	[C1_TOTAL] [float] NULL,
	[C1_SEGUM] [varchar](2) NULL,
	[C1_QTSEGUM] [float] NULL,
	[C1_DATPRF] [varchar](8) NULL,
	[C1_OBS] [varchar](200) NULL,
	[C1_OP] [varchar](14) NULL,
	[C1_LOCAL] [varchar](2) NULL,
	[C1_CC] [varchar](9) NULL,
	[C1_CONTA] [varchar](20) NULL,
	[C1_ITEMCTA] [varchar](9) NULL,
	[C1_EMISSAO] [varchar](8) NULL,
	[C1_COTACAO] [varchar](6) NULL,
	[C1_FORNECE] [varchar](6) NULL,
	[C1_LOJA] [varchar](2) NULL,
	[C1_PEDIDO] [varchar](6) NULL,
	[C1_ITEMPED] [varchar](4) NULL,
	[C1_SOLICIT] [varchar](25) NULL,
	[C1_IDENT] [varchar](4) NULL,
	[C1_QUJE] [float] NULL,
	[C1_TX] [varchar](2) NULL,
	[C1_OK] [varchar](2) NULL,
	[C1_OS] [varchar](6) NULL,
	[C1_IMPORT] [varchar](1) NULL,
	[C1_UNIDREQ] [varchar](5) NULL,
	[C1_CODCOMP] [varchar](3) NULL,
	[C1_CLASS] [varchar](1) NULL,
	[C1_FABR] [varchar](6) NULL,
	[C1_FABRLOJ] [varchar](2) NULL,
	[C1_NUM_SI] [varchar](6) NULL,
	[C1_TPOP] [varchar](1) NULL,
	[C1_QUJE2] [float] NULL,
	[C1_GRUPCOM] [varchar](6) NULL,
	[C1_USER] [varchar](6) NULL,
	[C1_ORIGEM] [varchar](8) NULL,
	[C1_CLVL] [varchar](9) NULL,
	[C1_PROJETO] [varchar](1) NULL,
	[C1_FILENT] [varchar](2) NULL,
	[C1_SEQMRP] [varchar](6) NULL,
	[C1_VUNIT] [float] NULL,
	[C1_CONDPAG] [varchar](3) NULL,
	[C1_CODORCA] [varchar](8) NULL,
	[C1_RESIDUO] [varchar](1) NULL,
	[C1_QTDORIG] [float] NULL,
	[C1_TIPOEMP] [varchar](1) NULL,
	[C1_ESPEMP] [varchar](1) NULL,
	[C1_APROV] [varchar](1) NULL,
	[C1_TIPO] [float] NULL,
	[C1_MOEDA] [float] NULL,
	[C1_GERACTR] [varchar](1) NULL,
	[C1_LOJFABR] [varchar](2) NULL,
	[C1_NOMAPRO] [varchar](25) NULL,
	[C1_SIGLA] [varchar](2) NULL,
	[C1_FABRICA] [varchar](6) NULL,
	[C1_FLAGGCT] [varchar](1) NULL,
	[C1_QTDREEM] [float] NULL,
	[C1_PROGRAM] [varchar](10) NULL,
	[C1_ITEMGRD] [varchar](3) NULL,
	[C1_GRADE] [varchar](1) NULL,
	[C1_TPSC] [varchar](1) NULL,
	[C1_MODAL] [varchar](2) NULL,
	[C1_TPMOD] [varchar](2) NULL,
	[C1_CODED] [varchar](15) NULL,
	[C1_NUMPR] [varchar](15) NULL,
	[C1_ORCAM] [varchar](6) NULL,
	[C1_ESTOQUE] [varchar](1) NULL,
	[C1_REVISAO] [varchar](3) NULL,
	[C1_RATEIO] [varchar](1) NULL,
	[C1_ACCPROC] [varchar](1) NULL,
	[C1_ACCNUM] [varchar](50) NULL,
	[C1_ACCITEM] [varchar](50) NULL,
	[C1_IDAPS] [varchar](80) NULL,
	[C1_COMPRAC] [varchar](1) NULL,
	[C1_FISCORI] [varchar](2) NULL,
	[C1_ITSCORI] [varchar](4) NULL,
	[C1_SCORI] [varchar](6) NULL,
	[C1_USRCODE] [varchar](6) NULL,
	[C1_PRDREF] [varchar](15) NULL,
	[C1_TIPCOM] [varchar](3) NULL,
	[C1_PEDRES] [varchar](6) NULL,
	[C1_NRBPIMS] [varchar](10) NULL,
	[C1_EC05DB] [varchar](16) NULL,
	[C1_EC05CR] [varchar](16) NULL,
	[C1_EC06DB] [varchar](16) NULL,
	[C1_EC06CR] [varchar](16) NULL,
	[C1_EC07DB] [varchar](16) NULL,
	[C1_EC07CR] [varchar](16) NULL,
	[C1_EC08DB] [varchar](16) NULL,
	[C1_EC08CR] [varchar](16) NULL,
	[C1_EC09DB] [varchar](16) NULL,
	[C1_EC09CR] [varchar](16) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[C1_ZNSCFLU] [float] NULL,
	[C1_ZZEMERG] [varchar](1) NULL,
	[C1_ZZUSO] [varchar](1) NULL,
	[C1_ZZDTDIG] [varchar](8) NULL,
	[C1_ZNATURE] [varchar](10) NULL,
	[C1_ZSUBFLU] [float] NULL,
	[C1_ZZLOCSO] [varchar](1) NULL,
	[C1_USERLGI] [varchar](17) NULL,
	[C1_USERLGA] [varchar](17) NULL,
	[C1_ZCODZE1] [varchar](20) NULL,
	[C1_ZITEZE1] [varchar](4) NULL,
	[C1_ZZTPSOL] [varchar](1) NULL,
	[C1_ZNOS] [varchar](20) NULL,
	[C1_MSEXP] [varchar](8) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SC1010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SC5010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SC5010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[C5_FILIAL] [varchar](2) NULL,
	[C5_NUM] [varchar](6) NULL,
	[C5_TIPO] [varchar](1) NULL,
	[C5_CLIENTE] [varchar](6) NULL,
	[C5_LOJACLI] [varchar](2) NULL,
	[C5_CLIENT] [varchar](6) NULL,
	[C5_LOJAENT] [varchar](2) NULL,
	[C5_TRANSP] [varchar](6) NULL,
	[C5_TIPOCLI] [varchar](1) NULL,
	[C5_MSBLQL] [varchar](1) NULL,
	[C5_CONDPAG] [varchar](3) NULL,
	[C5_TABELA] [varchar](3) NULL,
	[C5_VEND1] [varchar](6) NULL,
	[C5_COMIS1] [float] NULL,
	[C5_VEND2] [varchar](6) NULL,
	[C5_COMIS2] [float] NULL,
	[C5_VEND3] [varchar](6) NULL,
	[C5_COMIS3] [float] NULL,
	[C5_VEND4] [varchar](6) NULL,
	[C5_COMIS4] [float] NULL,
	[C5_VEND5] [varchar](6) NULL,
	[C5_COMIS5] [float] NULL,
	[C5_DESC1] [float] NULL,
	[C5_DESC2] [float] NULL,
	[C5_DESC3] [float] NULL,
	[C5_DESC4] [float] NULL,
	[C5_BANCO] [varchar](3) NULL,
	[C5_DESCFI] [float] NULL,
	[C5_EMISSAO] [varchar](8) NULL,
	[C5_COTACAO] [varchar](6) NULL,
	[C5_PARC1] [float] NULL,
	[C5_DATA1] [varchar](8) NULL,
	[C5_PARC2] [float] NULL,
	[C5_DATA2] [varchar](8) NULL,
	[C5_PARC3] [float] NULL,
	[C5_DATA3] [varchar](8) NULL,
	[C5_PARC4] [float] NULL,
	[C5_DATA4] [varchar](8) NULL,
	[C5_TPFRETE] [varchar](1) NULL,
	[C5_FRETE] [float] NULL,
	[C5_SEGURO] [float] NULL,
	[C5_DESPESA] [float] NULL,
	[C5_FRETAUT] [float] NULL,
	[C5_REAJUST] [varchar](3) NULL,
	[C5_MOEDA] [float] NULL,
	[C5_PESOL] [float] NULL,
	[C5_PBRUTO] [float] NULL,
	[C5_REIMP] [float] NULL,
	[C5_REDESP] [varchar](6) NULL,
	[C5_VOLUME1] [float] NULL,
	[C5_VOLUME2] [float] NULL,
	[C5_VOLUME3] [float] NULL,
	[C5_VOLUME4] [float] NULL,
	[C5_ESPECI1] [varchar](10) NULL,
	[C5_ESPECI2] [varchar](10) NULL,
	[C5_ESPECI3] [varchar](10) NULL,
	[C5_ESPECI4] [varchar](10) NULL,
	[C5_ACRSFIN] [float] NULL,
	[C5_MENNOTA] [varchar](100) NULL,
	[C5_MENPAD] [varchar](3) NULL,
	[C5_INCISS] [varchar](1) NULL,
	[C5_LIBEROK] [varchar](1) NULL,
	[C5_OK] [varchar](2) NULL,
	[C5_NOTA] [varchar](9) NULL,
	[C5_SERIE] [varchar](3) NULL,
	[C5_KITREP] [varchar](6) NULL,
	[C5_OS] [varchar](6) NULL,
	[C5_TIPLIB] [varchar](1) NULL,
	[C5_DESCONT] [float] NULL,
	[C5_PEDEXP] [varchar](20) NULL,
	[C5_TXMOEDA] [float] NULL,
	[C5_TPCARGA] [varchar](1) NULL,
	[C5_DTLANC] [varchar](8) NULL,
	[C5_PDESCAB] [float] NULL,
	[C5_BLQ] [varchar](1) NULL,
	[C5_FORNISS] [varchar](6) NULL,
	[C5_CONTRA] [varchar](10) NULL,
	[C5_VLR_FRT] [float] NULL,
	[C5_MDCONTR] [varchar](15) NULL,
	[C5_GERAWMS] [varchar](1) NULL,
	[C5_MDNUMED] [varchar](6) NULL,
	[C5_MDPLANI] [varchar](6) NULL,
	[C5_SOLFRE] [varchar](2) NULL,
	[C5_FECENT] [varchar](8) NULL,
	[C5_SOLOPC] [varchar](1) NULL,
	[C5_SUGENT] [varchar](8) NULL,
	[C5_CODED] [varchar](15) NULL,
	[C5_NUMPR] [varchar](15) NULL,
	[C5_RECFAUT] [varchar](1) NULL,
	[C5_RECISS] [varchar](1) NULL,
	[C5_ORCRES] [varchar](6) NULL,
	[C5_ESTPRES] [varchar](2) NULL,
	[C5_OBRA] [varchar](10) NULL,
	[C5_MUNPRES] [varchar](7) NULL,
	[C5_ORIGEM] [varchar](15) NULL,
	[C5_VEICULO] [varchar](8) NULL,
	[C5_NUMENT] [varchar](9) NULL,
	[C5_NATUREZ] [varchar](10) NULL,
	[C5_TPCOMPL] [varchar](1) NULL,
	[C5_TABTRF] [varchar](3) NULL,
	[C5_DESCMUN] [varchar](30) NULL,
	[C5_PREPEMB] [varchar](1) NULL,
	[C5_DTTXREF] [varchar](8) NULL,
	[C5_TXREF] [float] NULL,
	[C5_MOEDTIT] [float] NULL,
	[C5_NFSUBST] [varchar](9) NULL,
	[C5_CNO] [varchar](6) NULL,
	[C5_FILGCT] [varchar](2) NULL,
	[C5_INDPRES] [varchar](1) NULL,
	[C5_ARTOBRA] [varchar](15) NULL,
	[C5_TIPOBRA] [varchar](1) NULL,
	[C5_IMINT] [varchar](18) NULL,
	[C5_CGCINT] [varchar](14) NULL,
	[C5_CLIINT] [varchar](40) NULL,
	[C5_PEDECOM] [varchar](50) NULL,
	[C5_RASTR] [varchar](20) NULL,
	[C5_STATUS] [varchar](2) NULL,
	[C5_SDOC] [varchar](3) NULL,
	[C5_SDOCSUB] [varchar](3) NULL,
	[C5_ECSEDEX] [varchar](13) NULL,
	[C5_SERSUBS] [varchar](3) NULL,
	[C5_ECPRESN] [varchar](1) NULL,
	[C5_VOLTAPS] [varchar](1) NULL,
	[C5_ECVINCU] [varchar](6) NULL,
	[C5_NTEMPEN] [varchar](22) NULL,
	[C5_REMCTR] [varchar](15) NULL,
	[C5_CODEMB] [varchar](4) NULL,
	[C5_REMREV] [varchar](3) NULL,
	[C5_PLACA2] [varchar](7) NULL,
	[C5_MODANP] [varchar](2) NULL,
	[C5_CODVGLP] [varchar](6) NULL,
	[C5_CODMOT] [varchar](11) NULL,
	[C5_SLENVT] [varchar](1) NULL,
	[C5_RET20G] [varchar](1) NULL,
	[C5_PLACA1] [varchar](7) NULL,
	[C5_ZZOBS] [varbinary](max) NULL,
	[C5_IDFLUIG] [float] NULL,
	[C5_ZZOBSFL] [varbinary](max) NULL,
	[C5_ZZPFATU] [varchar](1) NULL,
	[C5_ZZCC] [varchar](9) NULL,
	[C5_ZDTRESI] [varchar](8) NULL,
	[C5_ZQTDRES] [float] NULL,
	[C5_ZCTBRES] [varchar](1) NULL,
	[C5_ZCTBAPV] [varchar](1) NULL,
	[C5_TRCNUM] [varchar](15) NULL,
	[C5_CODSAF] [varchar](15) NULL,
	[C5_CLIRET] [varchar](6) NULL,
	[C5_LOJARET] [varchar](2) NULL,
	[C5_USERLGI] [varchar](17) NULL,
	[C5_USERLGA] [varchar](17) NULL,
	[C5_ZZCCORI] [varchar](9) NULL,
	[C5_FRTCFOP] [varchar](5) NULL,
	[C5_CMUNOR] [varchar](5) NULL,
	[C5_UFDEST] [varchar](2) NULL,
	[C5_CMUNDE] [varchar](5) NULL,
	[C5_UFORIG] [varchar](2) NULL,
	[C5_CLIREM] [varchar](6) NULL,
	[C5_LOJAREM] [varchar](2) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SC5010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SC6010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SC6010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[C6_FILIAL] [varchar](2) NULL,
	[C6_ITEM] [varchar](2) NULL,
	[C6_PRODUTO] [varchar](15) NULL,
	[C6_UM] [varchar](2) NULL,
	[C6_QTDVEN] [float] NULL,
	[C6_PRCVEN] [float] NULL,
	[C6_VALOR] [float] NULL,
	[C6_QTDLIB] [float] NULL,
	[C6_QTDLIB2] [float] NULL,
	[C6_SEGUM] [varchar](2) NULL,
	[C6_TES] [varchar](3) NULL,
	[C6_UNSVEN] [float] NULL,
	[C6_LOCAL] [varchar](2) NULL,
	[C6_CF] [varchar](5) NULL,
	[C6_QTDENT] [float] NULL,
	[C6_QTDENT2] [float] NULL,
	[C6_CLI] [varchar](6) NULL,
	[C6_DESCONT] [float] NULL,
	[C6_VALDESC] [float] NULL,
	[C6_ENTREG] [varchar](8) NULL,
	[C6_LA] [varchar](8) NULL,
	[C6_LOJA] [varchar](2) NULL,
	[C6_NOTA] [varchar](9) NULL,
	[C6_SERIE] [varchar](3) NULL,
	[C6_DATFAT] [varchar](8) NULL,
	[C6_NUM] [varchar](6) NULL,
	[C6_COMIS1] [float] NULL,
	[C6_COMIS2] [float] NULL,
	[C6_COMIS3] [float] NULL,
	[C6_COMIS4] [float] NULL,
	[C6_COMIS5] [float] NULL,
	[C6_PEDCLI] [varchar](9) NULL,
	[C6_DESCRI] [varchar](100) NULL,
	[C6_PRUNIT] [float] NULL,
	[C6_BLOQUEI] [varchar](2) NULL,
	[C6_RESERVA] [varchar](6) NULL,
	[C6_OP] [varchar](2) NULL,
	[C6_OK] [varchar](2) NULL,
	[C6_NFORI] [varchar](9) NULL,
	[C6_SERIORI] [varchar](3) NULL,
	[C6_ITEMORI] [varchar](4) NULL,
	[C6_IPIDEV] [float] NULL,
	[C6_IDENTB6] [varchar](6) NULL,
	[C6_BLQ] [varchar](2) NULL,
	[C6_PICMRET] [float] NULL,
	[C6_CODISS] [varchar](9) NULL,
	[C6_GRADE] [varchar](1) NULL,
	[C6_ITEMGRD] [varchar](3) NULL,
	[C6_LOTECTL] [varchar](21) NULL,
	[C6_NUMLOTE] [varchar](6) NULL,
	[C6_DTVALID] [varchar](8) NULL,
	[C6_NUMORC] [varchar](8) NULL,
	[C6_CHASSI] [varchar](25) NULL,
	[C6_OPC] [varchar](80) NULL,
	[C6_LOCALIZ] [varchar](15) NULL,
	[C6_NUMSERI] [varchar](20) NULL,
	[C6_NUMOP] [varchar](6) NULL,
	[C6_ITEMOP] [varchar](2) NULL,
	[C6_CLASFIS] [varchar](3) NULL,
	[C6_QTDRESE] [float] NULL,
	[C6_CONTRAT] [varchar](6) NULL,
	[C6_NUMOS] [varchar](14) NULL,
	[C6_NUMOSFA] [varchar](14) NULL,
	[C6_CODFAB] [varchar](6) NULL,
	[C6_LOJAFA] [varchar](2) NULL,
	[C6_ITEMCON] [varchar](2) NULL,
	[C6_TPOP] [varchar](1) NULL,
	[C6_REVISAO] [varchar](3) NULL,
	[C6_SERVIC] [varchar](3) NULL,
	[C6_ENDPAD] [varchar](15) NULL,
	[C6_TPESTR] [varchar](6) NULL,
	[C6_CONTRT] [varchar](15) NULL,
	[C6_TPCONTR] [varchar](1) NULL,
	[C6_ITCONTR] [varchar](2) NULL,
	[C6_GEROUPV] [varchar](1) NULL,
	[C6_PROJPMS] [varchar](10) NULL,
	[C6_EDTPMS] [varchar](12) NULL,
	[C6_TASKPMS] [varchar](12) NULL,
	[C6_TRT] [varchar](3) NULL,
	[C6_QTDEMP] [float] NULL,
	[C6_QTDEMP2] [float] NULL,
	[C6_PROJET] [varchar](6) NULL,
	[C6_ITPROJ] [varchar](2) NULL,
	[C6_POTENCI] [float] NULL,
	[C6_LICITA] [varchar](6) NULL,
	[C6_REGWMS] [varchar](1) NULL,
	[C6_MOPC] [varbinary](max) NULL,
	[C6_NUMCP] [varchar](9) NULL,
	[C6_NUMSC] [varchar](6) NULL,
	[C6_ITEMSC] [varchar](4) NULL,
	[C6_SUGENTR] [varchar](8) NULL,
	[C6_ITEMED] [varchar](3) NULL,
	[C6_ABSCINS] [float] NULL,
	[C6_ABATISS] [float] NULL,
	[C6_VLIMPOR] [float] NULL,
	[C6_ABATMAT] [float] NULL,
	[C6_FUNRURA] [float] NULL,
	[C6_FETAB] [float] NULL,
	[C6_CODROM] [varchar](6) NULL,
	[C6_PROGRAM] [varchar](10) NULL,
	[C6_TURNO] [varchar](1) NULL,
	[C6_DTFIMNT] [varchar](8) NULL,
	[C6_FCICOD] [varchar](36) NULL,
	[C6_FORDED] [varchar](6) NULL,
	[C6_LOJDED] [varchar](2) NULL,
	[C6_CODLAN] [varchar](6) NULL,
	[C6_BASVEIC] [float] NULL,
	[C6_ABATINS] [float] NULL,
	[C6_HORENT] [varchar](4) NULL,
	[C6_TNATREC] [varchar](4) NULL,
	[C6_ITEMGAR] [varchar](2) NULL,
	[C6_ORCGAR] [varchar](6) NULL,
	[C6_ITEMPC] [varchar](6) NULL,
	[C6_NUMPCOM] [varchar](15) NULL,
	[C6_GCPIT] [varchar](6) NULL,
	[C6_GCPLT] [varchar](8) NULL,
	[C6_CC] [varchar](9) NULL,
	[C6_CONTA] [varchar](20) NULL,
	[C6_ITEMCTA] [varchar](9) NULL,
	[C6_CLVL] [varchar](9) NULL,
	[C6_ALMTERC] [varchar](2) NULL,
	[C6_CCUSTO] [varchar](9) NULL,
	[C6_SOLCOM] [varchar](6) NULL,
	[C6_VDMOST] [varchar](1) NULL,
	[C6_VDOBS] [varbinary](max) NULL,
	[C6_PEDCOM] [varchar](6) NULL,
	[C6_ITPC] [varchar](4) NULL,
	[C6_FILPED] [varchar](2) NULL,
	[C6_PVCOMOP] [varchar](1) NULL,
	[C6_PMSID] [varchar](10) NULL,
	[C6_SERDED] [varchar](3) NULL,
	[C6_NFDED] [varchar](9) NULL,
	[C6_VLDED] [float] NULL,
	[C6_VLNFD] [float] NULL,
	[C6_PCDED] [float] NULL,
	[C6_TPDEDUZ] [varchar](1) NULL,
	[C6_MOTDED] [varchar](1) NULL,
	[C6_RATEIO] [varchar](1) NULL,
	[C6_REVPROD] [varchar](3) NULL,
	[C6_PEDVINC] [varchar](6) NULL,
	[C6_CNATREC] [varchar](3) NULL,
	[C6_GRPNATR] [varchar](2) NULL,
	[C6_PRODFIN] [varchar](15) NULL,
	[C6_CODLPRE] [varchar](6) NULL,
	[C6_D1ITEM] [varchar](4) NULL,
	[C6_ITLPRE] [varchar](3) NULL,
	[C6_D1DOC] [varchar](15) NULL,
	[C6_CODINF] [varchar](6) NULL,
	[C6_D1SERIE] [varchar](3) NULL,
	[C6_CSTPIS] [varchar](2) NULL,
	[C6_IPITRF] [float] NULL,
	[C6_SDOC] [varchar](3) NULL,
	[C6_SDOCDED] [varchar](3) NULL,
	[C6_SDOCSD1] [varchar](3) NULL,
	[C6_SDOCORI] [varchar](3) NULL,
	[C6_NRSEQCQ] [varchar](6) NULL,
	[C6_TPPROD] [varchar](1) NULL,
	[C6_ZZMEDB] [varchar](16) NULL,
	[C6_ZZMECR] [varchar](16) NULL,
	[C6_ZZMODB] [varchar](16) NULL,
	[C6_ZZMOCR] [varchar](16) NULL,
	[C6_ZZLODB] [varchar](16) NULL,
	[C6_ZZLOCR] [varchar](16) NULL,
	[C6_ZZATDB] [varchar](16) NULL,
	[C6_ZZATCR] [varchar](16) NULL,
	[C6_ZZLEDB] [varchar](16) NULL,
	[C6_ZZLECR] [varchar](16) NULL,
	[C6_HORCPL] [varchar](8) NULL,
	[C6_DATCPL] [varchar](8) NULL,
	[C6_INTROT] [varchar](1) NULL,
	[C6_DATAEMB] [varchar](8) NULL,
	[C6_PENE] [varchar](4) NULL,
	[C6_CATEG] [varchar](2) NULL,
	[C6_CTVAR] [varchar](10) NULL,
	[C6_CULTRA] [varchar](10) NULL,
	[C6_ZDTRESI] [varchar](8) NULL,
	[C6_ZQTDRES] [float] NULL,
	[C6_ZQTDAPR] [float] NULL,
	[C6_ZQTNAPR] [float] NULL,
	[C6_ZQTSALD] [float] NULL,
	[C6_ZCTBRES] [varchar](1) NULL,
	[C6_TPREPAS] [varchar](6) NULL,
	[C6_USERLGI] [varchar](17) NULL,
	[C6_USERLGA] [varchar](17) NULL,
	[C6_OPER] [varchar](2) NULL,
	[C6_ZPDEINS] [float] NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SC6010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SC7010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SC7010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[C7_FILIAL] [varchar](2) NULL,
	[C7_TIPO] [float] NULL,
	[C7_ITEM] [varchar](4) NULL,
	[C7_PRODUTO] [varchar](15) NULL,
	[C7_UM] [varchar](2) NULL,
	[C7_SEGUM] [varchar](2) NULL,
	[C7_QUANT] [float] NULL,
	[C7_CODTAB] [varchar](3) NULL,
	[C7_PRECO] [float] NULL,
	[C7_TOTAL] [float] NULL,
	[C7_QTSEGUM] [float] NULL,
	[C7_IPI] [float] NULL,
	[C7_NUMSC] [varchar](6) NULL,
	[C7_ITEMSC] [varchar](4) NULL,
	[C7_DINICOM] [varchar](8) NULL,
	[C7_DINITRA] [varchar](8) NULL,
	[C7_DINICQ] [varchar](8) NULL,
	[C7_DATPRF] [varchar](8) NULL,
	[C7_LOCAL] [varchar](2) NULL,
	[C7_OBS] [varchar](200) NULL,
	[C7_FORNECE] [varchar](6) NULL,
	[C7_CC] [varchar](9) NULL,
	[C7_CONTA] [varchar](20) NULL,
	[C7_ITEMCTA] [varchar](9) NULL,
	[C7_LOJA] [varchar](2) NULL,
	[C7_COND] [varchar](3) NULL,
	[C7_CONTATO] [varchar](15) NULL,
	[C7_FILENT] [varchar](2) NULL,
	[C7_DESC1] [float] NULL,
	[C7_DESC2] [float] NULL,
	[C7_DESC3] [float] NULL,
	[C7_EMISSAO] [varchar](8) NULL,
	[C7_NUM] [varchar](6) NULL,
	[C7_QUJE] [float] NULL,
	[C7_REAJUST] [varchar](3) NULL,
	[C7_FRETE] [float] NULL,
	[C7_EMITIDO] [varchar](1) NULL,
	[C7_DESCRI] [varchar](100) NULL,
	[C7_TPFRETE] [varchar](1) NULL,
	[C7_QTDREEM] [float] NULL,
	[C7_CODLIB] [varchar](10) NULL,
	[C7_RESIDUO] [varchar](1) NULL,
	[C7_NUMCOT] [varchar](6) NULL,
	[C7_MSG] [varchar](3) NULL,
	[C7_TX] [varchar](2) NULL,
	[C7_CONTROL] [varchar](1) NULL,
	[C7_IPIBRUT] [varchar](1) NULL,
	[C7_ENCER] [varchar](1) NULL,
	[C7_OP] [varchar](14) NULL,
	[C7_VLDESC] [float] NULL,
	[C7_SEQUEN] [varchar](4) NULL,
	[C7_NUMIMP] [varchar](20) NULL,
	[C7_ORIGEM] [varchar](8) NULL,
	[C7_QTDACLA] [float] NULL,
	[C7_VALEMB] [float] NULL,
	[C7_FLUXO] [varchar](1) NULL,
	[C7_TPOP] [varchar](1) NULL,
	[C7_APROV] [varchar](6) NULL,
	[C7_CONAPRO] [varchar](1) NULL,
	[C7_GRUPCOM] [varchar](6) NULL,
	[C7_USER] [varchar](6) NULL,
	[C7_STATME] [varchar](1) NULL,
	[C7_OK] [varchar](2) NULL,
	[C7_RESREM] [varchar](1) NULL,
	[C7_QTDSOL] [float] NULL,
	[C7_VALIPI] [float] NULL,
	[C7_VALICM] [float] NULL,
	[C7_TES] [varchar](3) NULL,
	[C7_DESC] [float] NULL,
	[C7_PICM] [float] NULL,
	[C7_BASEICM] [float] NULL,
	[C7_BASEIPI] [float] NULL,
	[C7_SEGURO] [float] NULL,
	[C7_DESPESA] [float] NULL,
	[C7_VALFRE] [float] NULL,
	[C7_MOEDA] [float] NULL,
	[C7_TXMOEDA] [float] NULL,
	[C7_PENDEN] [varchar](1) NULL,
	[C7_CLVL] [varchar](9) NULL,
	[C7_BASEIR] [float] NULL,
	[C7_ALIQIR] [float] NULL,
	[C7_VALIR] [float] NULL,
	[C7_ICMCOMP] [float] NULL,
	[C7_ICMSRET] [float] NULL,
	[C7_BASIMP5] [float] NULL,
	[C7_BASIMP6] [float] NULL,
	[C7_ESTOQUE] [varchar](1) NULL,
	[C7_SOLICIT] [varchar](30) NULL,
	[C7_VALSOL] [float] NULL,
	[C7_VALIMP5] [float] NULL,
	[C7_VALIMP6] [float] NULL,
	[C7_SEQMRP] [varchar](6) NULL,
	[C7_CODORCA] [varchar](8) NULL,
	[C7_DTLANC] [varchar](8) NULL,
	[C7_CODCRED] [varchar](6) NULL,
	[C7_TIPOEMP] [varchar](1) NULL,
	[C7_ESPEMP] [varchar](1) NULL,
	[C7_CONTRA] [varchar](15) NULL,
	[C7_CONTREV] [varchar](3) NULL,
	[C7_PLANILH] [varchar](6) NULL,
	[C7_MEDICAO] [varchar](6) NULL,
	[C7_ITEMED] [varchar](10) NULL,
	[C7_FREPPCC] [varchar](2) NULL,
	[C7_POLREPR] [varchar](1) NULL,
	[C7_PERREPR] [float] NULL,
	[C7_DT_IMP] [varchar](8) NULL,
	[C7_AGENTE] [varchar](3) NULL,
	[C7_GRADE] [varchar](1) NULL,
	[C7_ITEMGRD] [varchar](3) NULL,
	[C7_FORWARD] [varchar](3) NULL,
	[C7_TIPO_EM] [varchar](3) NULL,
	[C7_ORIGIMP] [varchar](3) NULL,
	[C7_DEST] [varchar](3) NULL,
	[C7_COMPRA] [varchar](3) NULL,
	[C7_PESO_B] [float] NULL,
	[C7_INCOTER] [varchar](3) NULL,
	[C7_IMPORT] [varchar](3) NULL,
	[C7_CONSIG] [varchar](3) NULL,
	[C7_CONF_PE] [varchar](8) NULL,
	[C7_DESP] [varchar](3) NULL,
	[C7_EXPORTA] [varchar](6) NULL,
	[C7_LOJAEXP] [varchar](2) NULL,
	[C7_CONTAIN] [varchar](1) NULL,
	[C7_MT3] [float] NULL,
	[C7_CONTA20] [float] NULL,
	[C7_CONTA40] [float] NULL,
	[C7_CON40HC] [float] NULL,
	[C7_ARMAZEM] [varchar](7) NULL,
	[C7_FABRICA] [varchar](6) NULL,
	[C7_LOJFABR] [varchar](2) NULL,
	[C7_DT_EMB] [varchar](8) NULL,
	[C7_TEC] [varchar](10) NULL,
	[C7_EX_NCM] [varchar](3) NULL,
	[C7_EX_NBM] [varchar](3) NULL,
	[C7_BASESOL] [float] NULL,
	[C7_DIACTB] [varchar](2) NULL,
	[C7_NODIA] [varchar](10) NULL,
	[C7_PO_EIC] [varchar](20) NULL,
	[C7_CODED] [varchar](15) NULL,
	[C7_NUMPR] [varchar](15) NULL,
	[C7_OBSM] [varbinary](max) NULL,
	[C7_TIPCOM] [varchar](3) NULL,
	[C7_FILEDT] [varchar](2) NULL,
	[C7_NUMSA] [varchar](6) NULL,
	[C7_REVISAO] [varchar](3) NULL,
	[C7_ACCPROC] [varchar](1) NULL,
	[C7_BASECSL] [float] NULL,
	[C7_ALIQINS] [float] NULL,
	[C7_VALINS] [float] NULL,
	[C7_ALQCSL] [float] NULL,
	[C7_ALIQISS] [float] NULL,
	[C7_VALISS] [float] NULL,
	[C7_TPCOLAB] [varchar](3) NULL,
	[C7_IDTSS] [varchar](15) NULL,
	[C7_CODNE] [varchar](12) NULL,
	[C7_ITEMNE] [varchar](3) NULL,
	[C7_GCPIT] [varchar](6) NULL,
	[C7_GCPLT] [varchar](8) NULL,
	[C7_FILCEN] [varchar](2) NULL,
	[C7_RATEIO] [varchar](1) NULL,
	[C7_ACCNUM] [varchar](50) NULL,
	[C7_ACCITEM] [varchar](50) NULL,
	[C7_BASEINS] [float] NULL,
	[C7_VALCSL] [float] NULL,
	[C7_LOTPLS] [varchar](10) NULL,
	[C7_CODRDA] [varchar](6) NULL,
	[C7_BASEISS] [float] NULL,
	[C7_FISCORI] [varchar](2) NULL,
	[C7_PLOPELT] [varchar](4) NULL,
	[C7_OBRIGA] [varbinary](max) NULL,
	[C7_DIREITO] [varbinary](max) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[C7_EC05DB] [varchar](16) NULL,
	[C7_EC05CR] [varchar](16) NULL,
	[C7_EC06DB] [varchar](16) NULL,
	[C7_EC06CR] [varchar](16) NULL,
	[C7_EC07DB] [varchar](16) NULL,
	[C7_EC07CR] [varchar](16) NULL,
	[C7_EC08DB] [varchar](16) NULL,
	[C7_EC08CR] [varchar](16) NULL,
	[C7_EC09DB] [varchar](16) NULL,
	[C7_EC09CR] [varchar](16) NULL,
	[C7_ZZUSO] [varchar](1) NULL,
	[C7_ZZFLUIG] [varchar](20) NULL,
	[C7_ZZORIPC] [varchar](20) NULL,
	[C7_ZNATURE] [varchar](10) NULL,
	[C7_USERLGI] [varchar](17) NULL,
	[C7_USERLGA] [varchar](17) NULL,
	[C7_DEDUCAO] [float] NULL,
	[C7_QUJERET] [float] NULL,
	[C7_TRANSP] [varchar](6) NULL,
	[C7_QUJEFAT] [float] NULL,
	[C7_RETENCA] [float] NULL,
	[C7_QUJEDED] [float] NULL,
	[C7_FRETCON] [float] NULL,
	[C7_FATDIRE] [float] NULL,
	[C7_TRANSLJ] [varchar](2) NULL,
	[C7_IDTRIB] [varchar](36) NULL,
	[C7_MSEXP] [varchar](8) NULL,
	[C7_MSIMP] [varchar](8) NULL,
	[C7_ZTPUSO] [varchar](1) NULL,
	[C7_ZMARCA] [varchar](15) NULL,
	[C7_ZCODMAR] [varchar](15) NULL,
	[C7_ZZTIPO] [varchar](3) NULL,
	[C7_ZZTPORG] [varchar](3) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SC7010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SCP010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCP010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[CP_FILIAL] [varchar](2) NULL,
	[CP_NUM] [varchar](6) NULL,
	[CP_ITEM] [varchar](2) NULL,
	[CP_PRODUTO] [varchar](15) NULL,
	[CP_UM] [varchar](2) NULL,
	[CP_QUANT] [float] NULL,
	[CP_SEGUM] [varchar](2) NULL,
	[CP_QTSEGUM] [float] NULL,
	[CP_DATPRF] [varchar](8) NULL,
	[CP_LOCAL] [varchar](2) NULL,
	[CP_OBS] [varchar](254) NULL,
	[CP_OP] [varchar](14) NULL,
	[CP_CC] [varchar](9) NULL,
	[CP_CONTA] [varchar](20) NULL,
	[CP_EMISSAO] [varchar](8) NULL,
	[CP_DESCRI] [varchar](100) NULL,
	[CP_CODSOLI] [varchar](6) NULL,
	[CP_SOLICIT] [varchar](25) NULL,
	[CP_QUJE] [float] NULL,
	[CP_OK] [varchar](2) NULL,
	[CP_PREREQU] [varchar](1) NULL,
	[CP_STATUS] [varchar](1) NULL,
	[CP_NUMOS] [varchar](8) NULL,
	[CP_SEQRC] [varchar](2) NULL,
	[CP_ITEMCTA] [varchar](9) NULL,
	[CP_CLVL] [varchar](9) NULL,
	[CP_PROJETO] [varchar](1) NULL,
	[CP_USER] [varchar](6) NULL,
	[CP_NUMSC] [varchar](6) NULL,
	[CP_ITSC] [varchar](4) NULL,
	[CP_STATSA] [varchar](1) NULL,
	[CP_SALBLQ] [float] NULL,
	[CP_MEDIDA] [varchar](6) NULL,
	[CP_SULCMI] [float] NULL,
	[CP_SULCMA] [float] NULL,
	[CP_TIPMOD] [varchar](10) NULL,
	[CP_LOTE] [varchar](6) NULL,
	[CP_RATEIO] [varchar](1) NULL,
	[CP_CONSEST] [varchar](1) NULL,
	[CP_NRBPIMS] [varchar](10) NULL,
	[CP_VUNIT] [float] NULL,
	[CP_EC05DB] [varchar](16) NULL,
	[CP_EC05CR] [varchar](16) NULL,
	[CP_EC06DB] [varchar](16) NULL,
	[CP_EC06CR] [varchar](16) NULL,
	[CP_EC07DB] [varchar](16) NULL,
	[CP_EC07CR] [varchar](16) NULL,
	[CP_EC08DB] [varchar](16) NULL,
	[CP_EC08CR] [varchar](16) NULL,
	[CP_EC09DB] [varchar](16) NULL,
	[CP_EC09CR] [varchar](16) NULL,
	[CP_ZZFLUIG] [float] NULL,
	[CP_ZZEMERG] [varchar](1) NULL,
	[CP_ZZUSO] [varchar](1) NULL,
	[CP_ZZDTDIG] [varchar](8) NULL,
	[CP_ZSUBFLU] [float] NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SD1010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD1010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[D1_FILIAL] [varchar](2) NULL,
	[D1_ITEM] [varchar](4) NULL,
	[D1_COD] [varchar](15) NULL,
	[D1_UM] [varchar](2) NULL,
	[D1_SEGUM] [varchar](2) NULL,
	[D1_QUANT] [float] NULL,
	[D1_VUNIT] [float] NULL,
	[D1_TOTAL] [float] NULL,
	[D1_VALIPI] [float] NULL,
	[D1_VLSLXML] [float] NULL,
	[D1_VALICM] [float] NULL,
	[D1_TES] [varchar](3) NULL,
	[D1_CF] [varchar](5) NULL,
	[D1_DESC] [float] NULL,
	[D1_IPI] [float] NULL,
	[D1_PICM] [float] NULL,
	[D1_PESO] [float] NULL,
	[D1_CONTA] [varchar](20) NULL,
	[D1_ITEMCTA] [varchar](9) NULL,
	[D1_CC] [varchar](9) NULL,
	[D1_OP] [varchar](14) NULL,
	[D1_PEDIDO] [varchar](6) NULL,
	[D1_ITEMPC] [varchar](4) NULL,
	[D1_FORNECE] [varchar](6) NULL,
	[D1_LOJA] [varchar](2) NULL,
	[D1_LOCAL] [varchar](2) NULL,
	[D1_DOC] [varchar](9) NULL,
	[D1_EMISSAO] [varchar](8) NULL,
	[D1_DTDIGIT] [varchar](8) NULL,
	[D1_GRUPO] [varchar](4) NULL,
	[D1_TIPO] [varchar](1) NULL,
	[D1_SERIE] [varchar](3) NULL,
	[D1_CUSTO2] [float] NULL,
	[D1_CUSTO3] [float] NULL,
	[D1_CUSTO4] [float] NULL,
	[D1_CUSTO5] [float] NULL,
	[D1_TP] [varchar](2) NULL,
	[D1_QTSEGUM] [float] NULL,
	[D1_NUMSEQ] [varchar](6) NULL,
	[D1_DATACUS] [varchar](8) NULL,
	[D1_NFORI] [varchar](9) NULL,
	[D1_SERIORI] [varchar](3) NULL,
	[D1_ITEMORI] [varchar](4) NULL,
	[D1_QTDEDEV] [float] NULL,
	[D1_VALDEV] [float] NULL,
	[D1_ORIGLAN] [varchar](2) NULL,
	[D1_ICMSRET] [float] NULL,
	[D1_BRICMS] [float] NULL,
	[D1_NUMCQ] [varchar](6) NULL,
	[D1_DATORI] [varchar](8) NULL,
	[D1_BASEICM] [float] NULL,
	[D1_VALDESC] [float] NULL,
	[D1_IDENTB6] [varchar](6) NULL,
	[D1_LOTEFOR] [varchar](18) NULL,
	[D1_SKIPLOT] [varchar](1) NULL,
	[D1_BASEIPI] [float] NULL,
	[D1_SEQCALC] [varchar](14) NULL,
	[D1_LOTECTL] [varchar](21) NULL,
	[D1_NUMLOTE] [varchar](6) NULL,
	[D1_DTVALID] [varchar](8) NULL,
	[D1_PLACA] [varchar](7) NULL,
	[D1_CHASSI] [varchar](25) NULL,
	[D1_ANOFAB] [varchar](2) NULL,
	[D1_MODFAB] [varchar](2) NULL,
	[D1_MODELO] [varchar](15) NULL,
	[D1_COMBUST] [varchar](10) NULL,
	[D1_COR] [varchar](3) NULL,
	[D1_EQUIPS] [varchar](3) NULL,
	[D1_FORMUL] [varchar](1) NULL,
	[D1_II] [float] NULL,
	[D1_TEC] [varchar](16) NULL,
	[D1_CONHEC] [varchar](20) NULL,
	[D1_NUMPV] [varchar](6) NULL,
	[D1_ITEMPV] [varchar](2) NULL,
	[D1_CUSFF1] [float] NULL,
	[D1_CUSFF2] [float] NULL,
	[D1_CUSFF3] [float] NULL,
	[D1_CUSFF4] [float] NULL,
	[D1_CUSFF5] [float] NULL,
	[D1_CODCIAP] [varchar](6) NULL,
	[D1_CLASFIS] [varchar](3) NULL,
	[D1_BASIMP1] [float] NULL,
	[D1_REMITO] [varchar](9) NULL,
	[D1_SERIREM] [varchar](3) NULL,
	[D1_CUSTO] [float] NULL,
	[D1_BASIMP3] [float] NULL,
	[D1_BASIMP4] [float] NULL,
	[D1_BASIMP5] [float] NULL,
	[D1_BASIMP6] [float] NULL,
	[D1_VALIMP1] [float] NULL,
	[D1_VALIMP2] [float] NULL,
	[D1_VALIMP3] [float] NULL,
	[D1_VALIMP4] [float] NULL,
	[D1_VALIMP5] [float] NULL,
	[D1_VALIMP6] [float] NULL,
	[D1_CBASEAF] [varchar](14) NULL,
	[D1_ICMSCOM] [float] NULL,
	[D1_CIF] [float] NULL,
	[D1_ITEMREM] [varchar](4) NULL,
	[D1_BASIMP2] [float] NULL,
	[D1_PROJ] [varchar](10) NULL,
	[D1_TIPO_NF] [varchar](1) NULL,
	[D1_ALQIMP1] [float] NULL,
	[D1_ALQIMP2] [float] NULL,
	[D1_ALQIMP3] [float] NULL,
	[D1_ALQIMP4] [float] NULL,
	[D1_ALQIMP5] [float] NULL,
	[D1_ALQIMP6] [float] NULL,
	[D1_QTDPEDI] [float] NULL,
	[D1_VALFRE] [float] NULL,
	[D1_ALIIMA] [float] NULL,
	[D1_RATEIO] [varchar](1) NULL,
	[D1_SEGURO] [float] NULL,
	[D1_DESPESA] [float] NULL,
	[D1_BASEIRR] [float] NULL,
	[D1_ALIQIRR] [float] NULL,
	[D1_VALIRR] [float] NULL,
	[D1_BASEISS] [float] NULL,
	[D1_ALIQISS] [float] NULL,
	[D1_VALISS] [float] NULL,
	[D1_BASEINS] [float] NULL,
	[D1_ALIQINS] [float] NULL,
	[D1_VALINS] [float] NULL,
	[D1_CUSORI] [float] NULL,
	[D1_LOCPAD] [varchar](6) NULL,
	[D1_CLVL] [varchar](9) NULL,
	[D1_ORDEM] [varchar](6) NULL,
	[D1_CODFIS] [varchar](15) NULL,
	[D1_CNO] [varchar](14) NULL,
	[D1_ORDDIA] [varchar](4) NULL,
	[D1_NRECAGR] [varchar](5) NULL,
	[D1_VALFASE] [float] NULL,
	[D1_FILEDT] [varchar](2) NULL,
	[D1_ALIFASE] [float] NULL,
	[D1_ALIFUND] [float] NULL,
	[D1_BASFASE] [float] NULL,
	[D1_BASFUND] [float] NULL,
	[D1_BASIMA] [float] NULL,
	[D1_BASEDES] [float] NULL,
	[D1_PDDES] [float] NULL,
	[D1_PERCINP] [float] NULL,
	[D1_VFCPDIF] [float] NULL,
	[D1_SERVIC] [varchar](3) NULL,
	[D1_STSERV] [varchar](1) NULL,
	[D1_ENDER] [varchar](15) NULL,
	[D1_TPESTR] [varchar](6) NULL,
	[D1_REGWMS] [varchar](1) NULL,
	[D1_ITPCCEN] [varchar](4) NULL,
	[D1_PCCENTR] [varchar](6) NULL,
	[D1_QTPCCEN] [float] NULL,
	[D1_PDORI] [float] NULL,
	[D1_VALINP] [float] NULL,
	[D1_ALIQCMP] [float] NULL,
	[D1_VALFUND] [float] NULL,
	[D1_VRDICMS] [float] NULL,
	[D1_TIPODOC] [varchar](2) NULL,
	[D1_POTENCI] [float] NULL,
	[D1_TRT] [varchar](3) NULL,
	[D1_TESACLA] [varchar](3) NULL,
	[D1_NUMDESP] [varchar](16) NULL,
	[D1_ORIGEM] [varchar](3) NULL,
	[D1_GRADE] [varchar](1) NULL,
	[D1_ITEMGRD] [varchar](3) NULL,
	[D1_DESCICM] [float] NULL,
	[D1_VALIMA] [float] NULL,
	[D1_ESTCRED] [float] NULL,
	[D1_CFPS] [varchar](6) NULL,
	[D1_ALIQCF3] [float] NULL,
	[D1_BASEPS3] [float] NULL,
	[D1_ALIQPS3] [float] NULL,
	[D1_VALPS3] [float] NULL,
	[D1_BASECF3] [float] NULL,
	[D1_VALCF3] [float] NULL,
	[D1_CRDZFM] [float] NULL,
	[D1_CONBAR] [varchar](1) NULL,
	[D1_NFVINC] [varchar](9) NULL,
	[D1_VALCOF] [float] NULL,
	[D1_MARGEM] [float] NULL,
	[D1_VALACRS] [float] NULL,
	[D1_ICMSDIF] [float] NULL,
	[D1_BASECOF] [float] NULL,
	[D1_BASECSL] [float] NULL,
	[D1_BASEPIS] [float] NULL,
	[D1_VALANTI] [float] NULL,
	[D1_SLDDEP] [float] NULL,
	[D1_ITMVINC] [varchar](4) NULL,
	[D1_PRUNDA] [float] NULL,
	[D1_BASEFMP] [float] NULL,
	[D1_VALFMP] [float] NULL,
	[D1_ABATISS] [float] NULL,
	[D1_VLCIDE] [float] NULL,
	[D1_BASECID] [float] NULL,
	[D1_ALQCIDE] [float] NULL,
	[D1_VALCPM] [float] NULL,
	[D1_BASECPM] [float] NULL,
	[D1_ALQCPM] [float] NULL,
	[D1_CODNE] [varchar](12) NULL,
	[D1_ITEMNE] [varchar](3) NULL,
	[D1_EXPSOP] [varchar](8) NULL,
	[D1_MSEXP] [varchar](8) NULL,
	[D1_HREXPO] [varchar](8) NULL,
	[D1_IDCFC] [varchar](20) NULL,
	[D1_ABATMAT] [float] NULL,
	[D1_VALCMAJ] [float] NULL,
	[D1_CRPRSIM] [float] NULL,
	[D1_IDSB1] [varchar](20) NULL,
	[D1_IDSB5] [varchar](20) NULL,
	[D1_IDSBZ] [varchar](20) NULL,
	[D1_CONIMP] [float] NULL,
	[D1_VALINA] [float] NULL,
	[D1_VLSENAR] [float] NULL,
	[D1_REVISAO] [varchar](3) NULL,
	[D1_ABATINS] [float] NULL,
	[D1_ALIQINA] [float] NULL,
	[D1_BASEINA] [float] NULL,
	[D1_VALPMAJ] [float] NULL,
	[D1_DTFIMNT] [varchar](8) NULL,
	[D1_TNATREC] [varchar](4) NULL,
	[D1_CNATREC] [varchar](3) NULL,
	[D1_GRUPONC] [varchar](2) NULL,
	[D1_DFABRIC] [varchar](8) NULL,
	[D1_ALIQSOL] [float] NULL,
	[D1_CODNOR] [varchar](6) NULL,
	[D1_QTDCONF] [float] NULL,
	[D1_VALFAB] [float] NULL,
	[D1_BASEFAB] [float] NULL,
	[D1_ALIQFAB] [float] NULL,
	[D1_BASEFAC] [float] NULL,
	[D1_ALIQFAC] [float] NULL,
	[D1_VALFAC] [float] NULL,
	[D1_BASEFET] [float] NULL,
	[D1_ALIQFET] [float] NULL,
	[D1_VALFET] [float] NULL,
	[D1_AVLINSS] [float] NULL,
	[D1_FTRICMS] [float] NULL,
	[D1_GRPCST] [varchar](3) NULL,
	[D1_TRIBMUN] [varchar](20) NULL,
	[D1_CODISS] [varchar](9) NULL,
	[D1_SERVINC] [varchar](3) NULL,
	[D1_ALFCCMP] [float] NULL,
	[D1_BASEINP] [float] NULL,
	[D1_CSOSN] [varchar](3) NULL,
	[D1_DIFAL] [float] NULL,
	[D1_ALSENAR] [float] NULL,
	[D1_BSSENAR] [float] NULL,
	[D1_ALIQSES] [float] NULL,
	[D1_GARANTI] [varchar](1) NULL,
	[D1_VALPIS] [float] NULL,
	[D1_ALQCOF] [float] NULL,
	[D1_ALQCSL] [float] NULL,
	[D1_ALQPIS] [float] NULL,
	[D1_CUSRP1] [float] NULL,
	[D1_CUSRP2] [float] NULL,
	[D1_TRANSIT] [varchar](1) NULL,
	[D1_CUSRP3] [float] NULL,
	[D1_CUSRP4] [float] NULL,
	[D1_CUSRP5] [float] NULL,
	[D1_VALCSL] [float] NULL,
	[D1_BASESES] [float] NULL,
	[D1_VALSES] [float] NULL,
	[D1_RGESPST] [varchar](1) NULL,
	[D1_CRPRESC] [float] NULL,
	[D1_CODLAN] [varchar](6) NULL,
	[D1_OPERADO] [varchar](3) NULL,
	[D1_ALIQFUN] [float] NULL,
	[D1_VALFUN] [float] NULL,
	[D1_BASEFUN] [float] NULL,
	[D1_CRPREPR] [float] NULL,
	[D1_VLINCMG] [float] NULL,
	[D1_PRINCMG] [float] NULL,
	[D1_CODBAIX] [varchar](6) NULL,
	[D1_VALFDS] [float] NULL,
	[D1_PRFDSUL] [float] NULL,
	[D1_UFERMS] [float] NULL,
	[D1_OKISS] [varchar](2) NULL,
	[D1_IDSF4] [varchar](20) NULL,
	[D1_IDSF7] [varchar](20) NULL,
	[D1_FILORI] [varchar](2) NULL,
	[D1_ALMTERC] [varchar](2) NULL,
	[D1_FCICOD] [varchar](36) NULL,
	[D1_ALIQII] [float] NULL,
	[D1_BASNDES] [float] NULL,
	[D1_ICMNDES] [float] NULL,
	[D1_SDOCVNC] [varchar](3) NULL,
	[D1_SDOCREM] [varchar](3) NULL,
	[D1_SDOC] [varchar](3) NULL,
	[D1_SDOCORI] [varchar](3) NULL,
	[D1_ALQFMP] [float] NULL,
	[D1_NUMPED] [varchar](15) NULL,
	[D1_SLDEXP] [float] NULL,
	[D1_EC05DB] [varchar](16) NULL,
	[D1_EC05CR] [varchar](16) NULL,
	[D1_EC06DB] [varchar](16) NULL,
	[D1_EC06CR] [varchar](16) NULL,
	[D1_EC07DB] [varchar](16) NULL,
	[D1_EC07CR] [varchar](16) NULL,
	[D1_EC08DB] [varchar](16) NULL,
	[D1_EC08CR] [varchar](16) NULL,
	[D1_EC09DB] [varchar](16) NULL,
	[D1_EC09CR] [varchar](16) NULL,
	[D1_TESDES] [varchar](3) NULL,
	[D1_BASECPB] [float] NULL,
	[D1_CODDIS] [varchar](6) NULL,
	[D1_ABATTRA] [float] NULL,
	[D1_ALIQCPB] [float] NULL,
	[D1_VRETSUB] [float] NULL,
	[D1_ABATALM] [float] NULL,
	[D1_BASFEEF] [float] NULL,
	[D1_TPREPAS] [varchar](6) NULL,
	[D1_VALCPB] [float] NULL,
	[D1_VALFEEF] [float] NULL,
	[D1_IDDCF] [varchar](6) NULL,
	[D1_ALQFEEF] [float] NULL,
	[D1_BASEPRO] [float] NULL,
	[D1_ALIQPRO] [float] NULL,
	[D1_VALPRO] [float] NULL,
	[D1_ZZUSO] [varchar](1) NULL,
	[D1_ZZNATUR] [varchar](9) NULL,
	[D1_VOPDIF] [float] NULL,
	[D1_ALFCPST] [float] NULL,
	[D1_VFECPST] [float] NULL,
	[D1_BFCPANT] [float] NULL,
	[D1_DESCZFP] [float] NULL,
	[D1_VFCPANT] [float] NULL,
	[D1_BASEFMD] [float] NULL,
	[D1_VALFMD] [float] NULL,
	[D1_ALQNDES] [float] NULL,
	[D1_DESCZFR] [float] NULL,
	[D1_ALQFMD] [float] NULL,
	[D1_DESCZFC] [float] NULL,
	[D1_AFCPANT] [float] NULL,
	[D1_ALQFECP] [float] NULL,
	[D1_VALFECP] [float] NULL,
	[D1_ZDESCPR] [varchar](100) NULL,
	[D1_ZZUSER] [varchar](20) NULL,
	[D1_ZCNAE] [varchar](30) NULL,
	[D1_ZREGIME] [varchar](1) NULL,
	[D1_CODROM] [varchar](10) NULL,
	[D1_NFPNUM] [varchar](9) NULL,
	[D1_CTROG] [varchar](6) NULL,
	[D1_CODSAF] [varchar](15) NULL,
	[D1_NFPSER] [varchar](3) NULL,
	[D1_ITEROM] [varchar](2) NULL,
	[D1_BASFECP] [float] NULL,
	[D1_BSFCCMP] [float] NULL,
	[D1_FCPAUX] [float] NULL,
	[D1_BSFCPST] [float] NULL,
	[D1_USERLGI] [varchar](17) NULL,
	[D1_USERLGA] [varchar](17) NULL,
	[D1_ZZITAUX] [varchar](4) NULL,
	[D1_ZZTES] [varchar](3) NULL,
	[D1_DEDUCAO] [float] NULL,
	[D1_FATDIRE] [float] NULL,
	[D1_RETENCA] [float] NULL,
	[D1_IDTRIB] [varchar](36) NULL,
	[D1_CTAREC] [varchar](20) NULL,
	[D1_ZTPUSO] [varchar](1) NULL,
	[D1_ZPREDIC] [float] NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [bigint] NULL,
	[R_E_C_D_E_L_] [bigint] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SD1010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SD2010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD2010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[D2_FILIAL] [varchar](2) NULL,
	[D2_ITEM] [varchar](2) NULL,
	[D2_COD] [varchar](15) NULL,
	[D2_SEGUM] [varchar](2) NULL,
	[D2_UM] [varchar](2) NULL,
	[D2_QUANT] [float] NULL,
	[D2_PRCVEN] [float] NULL,
	[D2_TOTAL] [float] NULL,
	[D2_VALIPI] [float] NULL,
	[D2_VALICM] [float] NULL,
	[D2_TES] [varchar](3) NULL,
	[D2_CF] [varchar](5) NULL,
	[D2_DESC] [float] NULL,
	[D2_IPI] [float] NULL,
	[D2_PICM] [float] NULL,
	[D2_VALCSL] [float] NULL,
	[D2_CONTA] [varchar](20) NULL,
	[D2_PESO] [float] NULL,
	[D2_OP] [varchar](14) NULL,
	[D2_PEDIDO] [varchar](6) NULL,
	[D2_ITEMPV] [varchar](2) NULL,
	[D2_CLIENTE] [varchar](6) NULL,
	[D2_LOJA] [varchar](2) NULL,
	[D2_LOCAL] [varchar](2) NULL,
	[D2_DOC] [varchar](9) NULL,
	[D2_SERIE] [varchar](3) NULL,
	[D2_GRUPO] [varchar](4) NULL,
	[D2_TP] [varchar](2) NULL,
	[D2_EMISSAO] [varchar](8) NULL,
	[D2_CUSTO1] [float] NULL,
	[D2_CUSTO2] [float] NULL,
	[D2_CUSTO3] [float] NULL,
	[D2_CUSTO4] [float] NULL,
	[D2_CUSTO5] [float] NULL,
	[D2_PRUNIT] [float] NULL,
	[D2_QTSEGUM] [float] NULL,
	[D2_NUMSEQ] [varchar](6) NULL,
	[D2_EST] [varchar](2) NULL,
	[D2_DESCON] [float] NULL,
	[D2_TIPO] [varchar](1) NULL,
	[D2_NFORI] [varchar](9) NULL,
	[D2_SERIORI] [varchar](3) NULL,
	[D2_QTDEDEV] [float] NULL,
	[D2_VALDEV] [float] NULL,
	[D2_ORIGLAN] [varchar](2) NULL,
	[D2_BRICMS] [float] NULL,
	[D2_BASEORI] [float] NULL,
	[D2_BASEICM] [float] NULL,
	[D2_VALACRS] [float] NULL,
	[D2_IDENTB6] [varchar](6) NULL,
	[D2_CODISS] [varchar](9) NULL,
	[D2_GRADE] [varchar](1) NULL,
	[D2_SEQCALC] [varchar](14) NULL,
	[D2_ICMSRET] [float] NULL,
	[D2_COMIS1] [float] NULL,
	[D2_COMIS2] [float] NULL,
	[D2_COMIS3] [float] NULL,
	[D2_COMIS4] [float] NULL,
	[D2_COMIS5] [float] NULL,
	[D2_LOTECTL] [varchar](21) NULL,
	[D2_NUMLOTE] [varchar](6) NULL,
	[D2_DTVALID] [varchar](8) NULL,
	[D2_DESCZFR] [float] NULL,
	[D2_PDV] [varchar](10) NULL,
	[D2_NUMSERI] [varchar](20) NULL,
	[D2_DTLCTCT] [varchar](8) NULL,
	[D2_CUSFF1] [float] NULL,
	[D2_CUSFF2] [float] NULL,
	[D2_CUSFF3] [float] NULL,
	[D2_CUSFF4] [float] NULL,
	[D2_CUSFF5] [float] NULL,
	[D2_CLASFIS] [varchar](3) NULL,
	[D2_BASIMP1] [float] NULL,
	[D2_REMITO] [varchar](9) NULL,
	[D2_SERIREM] [varchar](3) NULL,
	[D2_BASIMP3] [float] NULL,
	[D2_BASIMP2] [float] NULL,
	[D2_ITEMREM] [varchar](2) NULL,
	[D2_BASIMP4] [float] NULL,
	[D2_BASIMP5] [float] NULL,
	[D2_BASIMP6] [float] NULL,
	[D2_VALIMP1] [float] NULL,
	[D2_VALIMP2] [float] NULL,
	[D2_VALIMP3] [float] NULL,
	[D2_VALIMP4] [float] NULL,
	[D2_VALIMP5] [float] NULL,
	[D2_VALIMP6] [float] NULL,
	[D2_ITEMORI] [varchar](4) NULL,
	[D2_CODFAB] [varchar](6) NULL,
	[D2_LOJAFA] [varchar](2) NULL,
	[D2_ALQIMP1] [float] NULL,
	[D2_SERMAN] [varchar](3) NULL,
	[D2_ALQIMP2] [float] NULL,
	[D2_ALQIMP3] [float] NULL,
	[D2_ALQIMP4] [float] NULL,
	[D2_ALQIMP5] [float] NULL,
	[D2_ALQIMP6] [float] NULL,
	[D2_ESPECIE] [varchar](5) NULL,
	[D2_CCUSTO] [varchar](9) NULL,
	[D2_ITEMCC] [varchar](9) NULL,
	[D2_LOCALIZ] [varchar](15) NULL,
	[D2_ENVCNAB] [varchar](8) NULL,
	[D2_ALIQINS] [float] NULL,
	[D2_ABSCINS] [float] NULL,
	[D2_VLIMPOR] [float] NULL,
	[D2_VCAT156] [float] NULL,
	[D2_DFABRIC] [varchar](8) NULL,
	[D2_PREEMB] [varchar](20) NULL,
	[D2_ALIQISS] [float] NULL,
	[D2_BASEIPI] [float] NULL,
	[D2_BASEISS] [float] NULL,
	[D2_VALISS] [float] NULL,
	[D2_SEGURO] [float] NULL,
	[D2_VALFRE] [float] NULL,
	[D2_TPDCENV] [varchar](1) NULL,
	[D2_DESPESA] [float] NULL,
	[D2_OK] [varchar](2) NULL,
	[D2_CLVL] [varchar](9) NULL,
	[D2_BASEINS] [float] NULL,
	[D2_ICMFRET] [float] NULL,
	[D2_SERVIC] [varchar](3) NULL,
	[D2_STSERV] [varchar](1) NULL,
	[D2_VALINS] [float] NULL,
	[D2_PROJPMS] [varchar](10) NULL,
	[D2_EDTPMS] [varchar](12) NULL,
	[D2_TASKPMS] [varchar](12) NULL,
	[D2_LICITA] [varchar](6) NULL,
	[D2_VARPRUN] [float] NULL,
	[D2_FORMUL] [varchar](1) NULL,
	[D2_TIPODOC] [varchar](2) NULL,
	[D2_VAC] [float] NULL,
	[D2_TIPOREM] [varchar](1) NULL,
	[D2_QTDEFAT] [float] NULL,
	[D2_QTDAFAT] [float] NULL,
	[D2_SEQUEN] [varchar](2) NULL,
	[D2_POTENCI] [float] NULL,
	[D2_TPESTR] [varchar](6) NULL,
	[D2_VALBRUT] [float] NULL,
	[D2_REGWMS] [varchar](1) NULL,
	[D2_DTDIGIT] [varchar](8) NULL,
	[D2_NUMCP] [varchar](9) NULL,
	[D2_CUSRP1] [float] NULL,
	[D2_CUSRP2] [float] NULL,
	[D2_CUSRP3] [float] NULL,
	[D2_CUSRP4] [float] NULL,
	[D2_CUSRP5] [float] NULL,
	[D2_SITTRIB] [varchar](5) NULL,
	[D2_NFCUP] [varchar](9) NULL,
	[D2_ALQIRRF] [float] NULL,
	[D2_VALFDS] [float] NULL,
	[D2_PRFDSUL] [float] NULL,
	[D2_UFERMS] [float] NULL,
	[D2_BASEIRR] [float] NULL,
	[D2_CODROM] [varchar](6) NULL,
	[D2_ESTCRED] [float] NULL,
	[D2_BASETST] [float] NULL,
	[D2_ALIQTST] [float] NULL,
	[D2_VALTST] [float] NULL,
	[D2_BASEPS3] [float] NULL,
	[D2_ALIQPS3] [float] NULL,
	[D2_CFPS] [varchar](6) NULL,
	[D2_DESCICM] [float] NULL,
	[D2_TRT] [varchar](3) NULL,
	[D2_PRUNDA] [float] NULL,
	[D2_VALPS3] [float] NULL,
	[D2_BASECF3] [float] NULL,
	[D2_ALIQCF3] [float] NULL,
	[D2_VALCF3] [float] NULL,
	[D2_IDSB1] [varchar](20) NULL,
	[D2_IDSB5] [varchar](20) NULL,
	[D2_IDSBZ] [varchar](20) NULL,
	[D2_IDSF4] [varchar](20) NULL,
	[D2_IDSF7] [varchar](20) NULL,
	[D2_09CAT17] [float] NULL,
	[D2_16CAT17] [float] NULL,
	[D2_ABATINS] [float] NULL,
	[D2_ALIQFET] [float] NULL,
	[D2_ALIQSOL] [float] NULL,
	[D2_BASEFAB] [float] NULL,
	[D2_BASEFAC] [float] NULL,
	[D2_BASEFET] [float] NULL,
	[D2_CRPRESC] [float] NULL,
	[D2_OKISS] [varchar](10) NULL,
	[D2_VALFAC] [float] NULL,
	[D2_VALFET] [float] NULL,
	[D2_TOTIMP] [float] NULL,
	[D2_BASEPIS] [float] NULL,
	[D2_VALCOF] [float] NULL,
	[D2_BASECSL] [float] NULL,
	[D2_ALIQFAB] [float] NULL,
	[D2_ALIQFAC] [float] NULL,
	[D2_VALFAB] [float] NULL,
	[D2_VALIRRF] [float] NULL,
	[D2_BASECOF] [float] NULL,
	[D2_FCICOD] [varchar](36) NULL,
	[D2_ORDSEP] [varchar](6) NULL,
	[D2_DESCZFC] [float] NULL,
	[D2_DESCZFP] [float] NULL,
	[D2_ESTOQUE] [varchar](1) NULL,
	[D2_ALIQINA] [float] NULL,
	[D2_VALINA] [float] NULL,
	[D2_BASEINA] [float] NULL,
	[D2_ABATISS] [float] NULL,
	[D2_ABATMAT] [float] NULL,
	[D2_TNATREC] [varchar](4) NULL,
	[D2_CNATREC] [varchar](3) NULL,
	[D2_GRUPONC] [varchar](2) NULL,
	[D2_DTFIMNT] [varchar](8) NULL,
	[D2_TOTEST] [float] NULL,
	[D2_TOTFED] [float] NULL,
	[D2_TOTMUN] [float] NULL,
	[D2_VALFMP] [float] NULL,
	[D2_VALFMD] [float] NULL,
	[D2_IDCFC] [varchar](20) NULL,
	[D2_GRPCST] [varchar](3) NULL,
	[D2_ALQFMD] [float] NULL,
	[D2_ALQFMP] [float] NULL,
	[D2_BASEFMD] [float] NULL,
	[D2_BASEFMP] [float] NULL,
	[D2_MSEXP] [varchar](8) NULL,
	[D2_HREXPO] [varchar](8) NULL,
	[D2_VALCPB] [float] NULL,
	[D2_ALIQCPB] [float] NULL,
	[D2_FTRICMS] [float] NULL,
	[D2_VRDICMS] [float] NULL,
	[D2_INDICE] [float] NULL,
	[D2_CODLAN] [varchar](6) NULL,
	[D2_CODLPRE] [varchar](6) NULL,
	[D2_ITLPRE] [varchar](3) NULL,
	[D2_CBASEAF] [varchar](14) NULL,
	[D2_BASEFUN] [float] NULL,
	[D2_ALIQFUN] [float] NULL,
	[D2_VALFUN] [float] NULL,
	[D2_RATEIO] [varchar](1) NULL,
	[D2_VLSENAR] [float] NULL,
	[D2_ALSENAR] [float] NULL,
	[D2_BSSENAR] [float] NULL,
	[D2_VLINCMG] [float] NULL,
	[D2_PRINCMG] [float] NULL,
	[D2_ALQCOF] [float] NULL,
	[D2_VALPIS] [float] NULL,
	[D2_ALQCSL] [float] NULL,
	[D2_ALQPIS] [float] NULL,
	[D2_ITEMGAR] [varchar](2) NULL,
	[D2_ORCGAR] [varchar](6) NULL,
	[D2_ALMTERC] [varchar](2) NULL,
	[D2_PRODFIN] [varchar](15) NULL,
	[D2_MARGEM] [float] NULL,
	[D2_VREINT] [float] NULL,
	[D2_BSREIN] [float] NULL,
	[D2_REVISAO] [varchar](3) NULL,
	[D2_SDOC] [varchar](3) NULL,
	[D2_SDOCREM] [varchar](3) NULL,
	[D2_SDOCMAN] [varchar](3) NULL,
	[D2_SDOCORI] [varchar](3) NULL,
	[D2_ALIFUND] [float] NULL,
	[D2_ALIIMA] [float] NULL,
	[D2_ALIFASE] [float] NULL,
	[D2_BASFASE] [float] NULL,
	[D2_BASFUND] [float] NULL,
	[D2_BASIMA] [float] NULL,
	[D2_VALFASE] [float] NULL,
	[D2_VALFUND] [float] NULL,
	[D2_VALIMA] [float] NULL,
	[D2_CSOSN] [varchar](3) NULL,
	[D2_BASECPB] [float] NULL,
	[D2_NRECAGR] [varchar](5) NULL,
	[D2_BASEDES] [float] NULL,
	[D2_ALIQCMP] [float] NULL,
	[D2_DIFAL] [float] NULL,
	[D2_ICMSCOM] [float] NULL,
	[D2_PDDES] [float] NULL,
	[D2_PDORI] [float] NULL,
	[D2_VFCPDIF] [float] NULL,
	[D2_ALFCCMP] [float] NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[D2_EC05DB] [varchar](16) NULL,
	[D2_EC05CR] [varchar](16) NULL,
	[D2_EC06DB] [varchar](16) NULL,
	[D2_EC06CR] [varchar](16) NULL,
	[D2_EC07DB] [varchar](16) NULL,
	[D2_EC07CR] [varchar](16) NULL,
	[D2_EC08DB] [varchar](16) NULL,
	[D2_EC08CR] [varchar](16) NULL,
	[D2_EC09DB] [varchar](16) NULL,
	[D2_EC09CR] [varchar](16) NULL,
	[D2_ALQFEEF] [float] NULL,
	[D2_VALFEEF] [float] NULL,
	[D2_BASFEEF] [float] NULL,
	[D2_VALPRO] [float] NULL,
	[D2_BASEPRO] [float] NULL,
	[D2_ALIQPRO] [float] NULL,
	[D2_ZZNATUR] [varchar](9) NULL,
	[D2_VALFECP] [float] NULL,
	[D2_ALQFECP] [float] NULL,
	[D2_ALFCPST] [float] NULL,
	[D2_VOPDIF] [float] NULL,
	[D2_ICMSDIF] [float] NULL,
	[D2_VFECPST] [float] NULL,
	[D2_ZCONTRA] [varchar](20) NULL,
	[D2_ZREVISA] [varchar](3) NULL,
	[D2_ZMEDICA] [varchar](6) NULL,
	[D2_TPREPAS] [varchar](6) NULL,
	[D2_BSFCCMP] [float] NULL,
	[D2_FCPAUX] [float] NULL,
	[D2_BASFECP] [float] NULL,
	[D2_BSFCPST] [float] NULL,
	[D2_USERLGI] [varchar](17) NULL,
	[D2_USERLGA] [varchar](17) NULL,
	[D2_ALQCPM] [float] NULL,
	[D2_BASECPM] [float] NULL,
	[D2_VALCPM] [float] NULL,
	[D2_CTAREC] [varchar](20) NULL,
	[D2_DECQTD] [float] NULL,
	[D2_IDTRIB] [varchar](36) NULL,
	[D2_PAFMD5] [varchar](32) NULL,
	[D2_DECVLU] [float] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SD2010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SD3010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD3010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[D3_FILIAL] [varchar](2) NOT NULL,
	[D3_TM] [varchar](3) NOT NULL,
	[D3_COD] [varchar](15) NOT NULL,
	[D3_UM] [varchar](2) NOT NULL,
	[D3_QUANT] [float] NOT NULL,
	[D3_CF] [varchar](3) NOT NULL,
	[D3_CONTA] [varchar](20) NOT NULL,
	[D3_OP] [varchar](14) NOT NULL,
	[D3_LOCAL] [varchar](2) NOT NULL,
	[D3_DOC] [varchar](9) NOT NULL,
	[D3_EMISSAO] [varchar](8) NOT NULL,
	[D3_GRUPO] [varchar](4) NOT NULL,
	[D3_CUSTO1] [float] NOT NULL,
	[D3_CUSTO2] [float] NOT NULL,
	[D3_CUSTO3] [float] NOT NULL,
	[D3_CUSTO4] [float] NOT NULL,
	[D3_CUSTO5] [float] NOT NULL,
	[D3_CC] [varchar](9) NOT NULL,
	[D3_PARCTOT] [varchar](1) NOT NULL,
	[D3_ESTORNO] [varchar](1) NOT NULL,
	[D3_NUMSEQ] [varchar](6) NOT NULL,
	[D3_SEGUM] [varchar](2) NOT NULL,
	[D3_QTSEGUM] [float] NOT NULL,
	[D3_TIPO] [varchar](2) NOT NULL,
	[D3_NIVEL] [varchar](3) NOT NULL,
	[D3_USUARIO] [varchar](25) NOT NULL,
	[D3_REGWMS] [varchar](1) NOT NULL,
	[D3_PERDA] [float] NOT NULL,
	[D3_DTLANC] [varchar](8) NOT NULL,
	[D3_TRT] [varchar](3) NOT NULL,
	[D3_CHAVE] [varchar](2) NOT NULL,
	[D3_IDENT] [varchar](6) NOT NULL,
	[D3_SEQCALC] [varchar](14) NOT NULL,
	[D3_RATEIO] [float] NOT NULL,
	[D3_LOTECTL] [varchar](21) NOT NULL,
	[D3_NUMLOTE] [varchar](6) NOT NULL,
	[D3_DTVALID] [varchar](8) NOT NULL,
	[D3_LOCALIZ] [varchar](15) NOT NULL,
	[D3_NUMSERI] [varchar](20) NOT NULL,
	[D3_CUSFF1] [float] NOT NULL,
	[D3_CUSFF2] [float] NOT NULL,
	[D3_CUSFF3] [float] NOT NULL,
	[D3_CUSFF4] [float] NOT NULL,
	[D3_CUSFF5] [float] NOT NULL,
	[D3_ITEM] [varchar](2) NOT NULL,
	[D3_OK] [varchar](2) NOT NULL,
	[D3_ITEMCTA] [varchar](9) NOT NULL,
	[D3_CLVL] [varchar](9) NOT NULL,
	[D3_PROJPMS] [varchar](10) NOT NULL,
	[D3_TASKPMS] [varchar](12) NOT NULL,
	[D3_ORDEM] [varchar](6) NOT NULL,
	[D3_SERVIC] [varchar](3) NOT NULL,
	[D3_STSERV] [varchar](1) NOT NULL,
	[D3_OSTEC] [varchar](8) NOT NULL,
	[D3_POTENCI] [float] NOT NULL,
	[D3_TPESTR] [varchar](6) NOT NULL,
	[D3_REGATEN] [varchar](10) NOT NULL,
	[D3_DOCSWN] [varchar](15) NOT NULL,
	[D3_ITEMSWN] [varchar](4) NOT NULL,
	[D3_ITEMGRD] [varchar](3) NOT NULL,
	[D3_STATUS] [varchar](2) NOT NULL,
	[D3_CUSRP1] [float] NOT NULL,
	[D3_CUSRP2] [float] NOT NULL,
	[D3_CUSRP3] [float] NOT NULL,
	[D3_CUSRP4] [float] NOT NULL,
	[D3_CUSRP5] [float] NOT NULL,
	[D3_CMRP] [float] NOT NULL,
	[D3_MOEDRP] [varchar](1) NOT NULL,
	[D3_REVISAO] [varchar](3) NOT NULL,
	[D3_HAWB] [varchar](20) NOT NULL,
	[D3_EMPOP] [varchar](1) NOT NULL,
	[D3_CMFIXO] [float] NOT NULL,
	[D3_PMACNUT] [float] NOT NULL,
	[D3_PMICNUT] [float] NOT NULL,
	[D3_MOEDA] [varchar](1) NOT NULL,
	[D3_DIACTB] [varchar](2) NOT NULL,
	[D3_GARANTI] [varchar](1) NOT NULL,
	[D3_NODIA] [varchar](10) NOT NULL,
	[D3_NRBPIMS] [varchar](10) NOT NULL,
	[D3_QTGANHO] [float] NOT NULL,
	[D3_QTMAIOR] [float] NOT NULL,
	[D3_NUMSA] [varchar](6) NOT NULL,
	[D3_PERIMP] [float] NOT NULL,
	[D3_VLRVI] [float] NOT NULL,
	[D3_CHAVEF1] [varchar](52) NOT NULL,
	[D3_NRABATE] [varchar](8) NOT NULL,
	[D3_CODLAN] [varchar](6) NOT NULL,
	[D3_OKISS] [varchar](2) NOT NULL,
	[D3_ITEMSA] [varchar](2) NOT NULL,
	[D3_VLRPD] [float] NOT NULL,
	[D3_TEATF] [varchar](3) NOT NULL,
	[D3_CODSAF] [varchar](15) NOT NULL,
	[D3_EC05DB] [varchar](16) NOT NULL,
	[D3_EC05CR] [varchar](16) NOT NULL,
	[D3_EC06DB] [varchar](16) NOT NULL,
	[D3_EC06CR] [varchar](16) NOT NULL,
	[D3_EC07DB] [varchar](16) NOT NULL,
	[D3_EC07CR] [varchar](16) NOT NULL,
	[D3_EC08DB] [varchar](16) NOT NULL,
	[D3_EC08CR] [varchar](16) NOT NULL,
	[D3_EC09DB] [varchar](16) NOT NULL,
	[D3_EC09CR] [varchar](16) NOT NULL,
	[D_E_L_E_T_] [varchar](1) NOT NULL,
	[R_E_C_N_O_] [int] NOT NULL,
	[D3_TANQUE] [varchar](6) NOT NULL,
	[D3_MASSA] [float] NOT NULL,
	[D3_TEMPAMO] [float] NOT NULL,
	[D3_TEMPTAQ] [float] NOT NULL,
	[D3_DENSAMB] [float] NOT NULL,
	[D3_QTDAMB] [float] NOT NULL,
	[D3_FATCORR] [float] NOT NULL,
	[D3_TPMOVAJ] [varchar](2) NOT NULL,
	[D3_CODFOR] [varchar](6) NOT NULL,
	[D3_LOJAFOR] [varchar](2) NOT NULL,
	[D3_NFORP] [varchar](6) NOT NULL,
	[D3_OBS] [varchar](20) NOT NULL,
	[D3_CHAVEF2] [varchar](52) NOT NULL,
	[D3_IDDCF] [varchar](6) NOT NULL,
	[D3_OBSERVA] [varchar](30) NOT NULL,
	[D3_FORNDOC] [varchar](6) NOT NULL,
	[D3_LOJADOC] [varchar](2) NOT NULL,
	[D3_PERBLK] [varchar](6) NOT NULL,
	[D3_FATHER] [varchar](1) NOT NULL,
	[D3_USERLGI] [varchar](17) NOT NULL,
	[D3_ZESTMAT] [varchar](1) NOT NULL,
	[D3_ZCRDOBR] [float] NOT NULL,
	[D3_ZCRDORG] [varchar](9) NOT NULL,
	[D3_ZZCHVNF] [varchar](44) NOT NULL,
	[D3_MSUIDT] [uniqueidentifier] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SD3010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SE4010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SE4010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[E4_FILIAL] [varchar](2) NULL,
	[E4_CODIGO] [varchar](3) NULL,
	[E4_TIPO] [varchar](1) NULL,
	[E4_COND] [varchar](40) NULL,
	[E4_DESCRI] [varchar](15) NULL,
	[E4_IPI] [varchar](1) NULL,
	[E4_DDD] [varchar](1) NULL,
	[E4_DESCFIN] [float] NULL,
	[E4_DIADESC] [float] NULL,
	[E4_MSBLQL] [varchar](1) NULL,
	[E4_FORMA] [varchar](6) NULL,
	[E4_ACRSFIN] [float] NULL,
	[E4_SOLID] [varchar](1) NULL,
	[E4_ACRES] [varchar](1) NULL,
	[E4_PERCOM] [float] NULL,
	[E4_SUPER] [float] NULL,
	[E4_INFER] [float] NULL,
	[E4_FATOR] [float] NULL,
	[E4_PLANO] [varchar](3) NULL,
	[E4_JURCART] [varchar](1) NULL,
	[E4_CTRADT] [varchar](1) NULL,
	[E4_AGRACRS] [varchar](1) NULL,
	[E4_LIMACRS] [float] NULL,
	[E4_CCORREN] [varchar](1) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[E4_MSEXP] [varchar](8) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SE4010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SF1010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SF1010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[F1_FILIAL] [varchar](2) NULL,
	[F1_DOC] [varchar](9) NULL,
	[F1_SERIE] [varchar](3) NULL,
	[F1_FORNECE] [varchar](6) NULL,
	[F1_LOJA] [varchar](2) NULL,
	[F1_COND] [varchar](3) NULL,
	[F1_DUPL] [varchar](9) NULL,
	[F1_EMISSAO] [varchar](8) NULL,
	[F1_EST] [varchar](2) NULL,
	[F1_FRETE] [float] NULL,
	[F1_DESPESA] [float] NULL,
	[F1_BASEICM] [float] NULL,
	[F1_VALICM] [float] NULL,
	[F1_BASEIPI] [float] NULL,
	[F1_VALIPI] [float] NULL,
	[F1_VALMERC] [float] NULL,
	[F1_VALBRUT] [float] NULL,
	[F1_TIPO] [varchar](1) NULL,
	[F1_DESCONT] [float] NULL,
	[F1_DTDIGIT] [varchar](8) NULL,
	[F1_NUMTRIB] [varchar](9) NULL,
	[F1_CPROVA] [varchar](14) NULL,
	[F1_BRICMS] [float] NULL,
	[F1_ICMSRET] [float] NULL,
	[F1_BASEFD] [float] NULL,
	[F1_DTLANC] [varchar](8) NULL,
	[F1_OK] [varchar](2) NULL,
	[F1_ORIGLAN] [varchar](2) NULL,
	[F1_TX] [varchar](1) NULL,
	[F1_CONTSOC] [float] NULL,
	[F1_IRRF] [float] NULL,
	[F1_FORMUL] [varchar](1) NULL,
	[F1_NFORIG] [varchar](9) NULL,
	[F1_SERORIG] [varchar](3) NULL,
	[F1_ESPECIE] [varchar](5) NULL,
	[F1_IMPORT] [varchar](1) NULL,
	[F1_II] [float] NULL,
	[F1_REMITO] [varchar](9) NULL,
	[F1_BASIMP2] [float] NULL,
	[F1_BASIMP3] [float] NULL,
	[F1_BASIMP4] [float] NULL,
	[F1_BASIMP5] [float] NULL,
	[F1_BASIMP6] [float] NULL,
	[F1_VALIMP1] [float] NULL,
	[F1_VALIMP2] [float] NULL,
	[F1_VALIMP3] [float] NULL,
	[F1_VALIMP4] [float] NULL,
	[F1_VALIMP5] [float] NULL,
	[F1_VALIMP6] [float] NULL,
	[F1_ORDPAGO] [varchar](6) NULL,
	[F1_HORA] [varchar](8) NULL,
	[F1_INSS] [float] NULL,
	[F1_ISS] [float] NULL,
	[F1_BASIMP1] [float] NULL,
	[F1_HAWB] [varchar](20) NULL,
	[F1_TIPO_NF] [varchar](1) NULL,
	[F1_IPI] [float] NULL,
	[F1_ICMS] [float] NULL,
	[F1_PESOL] [float] NULL,
	[F1_FOB_R] [float] NULL,
	[F1_SEGURO] [float] NULL,
	[F1_CIF] [float] NULL,
	[F1_MOEDA] [float] NULL,
	[F1_PREFIXO] [varchar](3) NULL,
	[F1_STATUS] [varchar](1) NULL,
	[F1_VALEMB] [float] NULL,
	[F1_RECBMTO] [varchar](8) NULL,
	[F1_APROV] [varchar](6) NULL,
	[F1_CTR_NFC] [varchar](12) NULL,
	[F1_TXMOEDA] [float] NULL,
	[F1_PEDVEND] [varchar](6) NULL,
	[F1_TIPODOC] [varchar](2) NULL,
	[F1_TIPOREM] [varchar](1) NULL,
	[F1_GNR] [varchar](6) NULL,
	[F1_ORIGEM] [varchar](8) NULL,
	[F1_PLACA] [varchar](8) NULL,
	[F1_VALPIS] [float] NULL,
	[F1_VALCOFI] [float] NULL,
	[F1_VALCSLL] [float] NULL,
	[F1_BASEPS3] [float] NULL,
	[F1_VALPS3] [float] NULL,
	[F1_BASECF3] [float] NULL,
	[F1_VALCF3] [float] NULL,
	[F1_NFELETR] [varchar](20) NULL,
	[F1_EMINFE] [varchar](8) NULL,
	[F1_HORNFE] [varchar](8) NULL,
	[F1_CODNFE] [varchar](50) NULL,
	[F1_CREDNFE] [float] NULL,
	[F1_VNAGREG] [float] NULL,
	[F1_NUMRPS] [varchar](12) NULL,
	[F1_VALIRF] [float] NULL,
	[F1_NUMMOV] [varchar](2) NULL,
	[F1_CHVNFE] [varchar](44) NULL,
	[F1_RECISS] [varchar](1) NULL,
	[F1_FILORIG] [varchar](2) NULL,
	[F1_NODIA] [varchar](10) NULL,
	[F1_ESTCRED] [float] NULL,
	[F1_DIACTB] [varchar](2) NULL,
	[F1_NUMRA] [varchar](6) NULL,
	[F1_BASEINS] [float] NULL,
	[F1_VALFDS] [float] NULL,
	[F1_TRANSP] [varchar](6) NULL,
	[F1_PLIQUI] [float] NULL,
	[F1_PBRUTO] [float] NULL,
	[F1_ESPECI1] [varchar](10) NULL,
	[F1_VOLUME1] [float] NULL,
	[F1_ESPECI2] [varchar](10) NULL,
	[F1_VOLUME2] [float] NULL,
	[F1_ESPECI3] [varchar](10) NULL,
	[F1_VOLUME3] [float] NULL,
	[F1_ESPECI4] [varchar](10) NULL,
	[F1_VOLUME4] [float] NULL,
	[F1_MOTIVO] [varchar](14) NULL,
	[F1_VALIMA] [float] NULL,
	[F1_VALFUND] [float] NULL,
	[F1_CLIDEST] [varchar](6) NULL,
	[F1_LOJDEST] [varchar](2) NULL,
	[F1_VALFASE] [float] NULL,
	[F1_ESTPRES] [varchar](2) NULL,
	[F1_MODAL] [varchar](2) NULL,
	[F1_NUMAIDF] [varchar](7) NULL,
	[F1_ANOAIDF] [varchar](4) NULL,
	[F1_VALINA] [float] NULL,
	[F1_BASEINA] [float] NULL,
	[F1_RECOPI] [varchar](1) NULL,
	[F1_FORRET] [varchar](6) NULL,
	[F1_LOJARET] [varchar](2) NULL,
	[F1_MENNOTA] [varchar](60) NULL,
	[F1_VALFET] [float] NULL,
	[F1_VALFAB] [float] NULL,
	[F1_VALFAC] [float] NULL,
	[F1_FIMP] [varchar](1) NULL,
	[F1_CLIORI] [varchar](6) NULL,
	[F1_LOJAORI] [varchar](2) NULL,
	[F1_FORENT] [varchar](6) NULL,
	[F1_LOJAENT] [varchar](2) NULL,
	[F1_TPCOMPL] [varchar](1) NULL,
	[F1_VALPEDG] [float] NULL,
	[F1_SIMPNAC] [varchar](1) NULL,
	[F1_VLSENAR] [float] NULL,
	[F1_BASEFMP] [float] NULL,
	[F1_VALFMP] [float] NULL,
	[F1_VLCIDE] [float] NULL,
	[F1_BASECID] [float] NULL,
	[F1_BASECPM] [float] NULL,
	[F1_VLCPM] [float] NULL,
	[F1_MOTRET] [varchar](6) NULL,
	[F1_IDSA1] [varchar](20) NULL,
	[F1_IDSA2] [varchar](20) NULL,
	[F1_IDSED] [varchar](20) NULL,
	[F1_MSIDENT] [varchar](10) NULL,
	[F1_BASCOFI] [float] NULL,
	[F1_BASPIS] [float] NULL,
	[F1_TPCTE] [varchar](1) NULL,
	[F1_MENPAD] [varchar](3) NULL,
	[F1_QTDCONF] [float] NULL,
	[F1_STATCON] [varchar](1) NULL,
	[F1_DOCFOL] [varchar](9) NULL,
	[F1_VERBAFO] [varchar](9) NULL,
	[F1_BASEFUN] [float] NULL,
	[F1_TPFRETE] [varchar](1) NULL,
	[F1_BASCSLL] [float] NULL,
	[F1_CODRGS] [varchar](1) NULL,
	[F1_DAUTNFE] [varchar](8) NULL,
	[F1_EVENFLG] [varchar](1) NULL,
	[F1_FLAGRGS] [varchar](4) NULL,
	[F1_HAUTNFE] [varchar](5) NULL,
	[F1_IDCCE] [varchar](54) NULL,
	[F1_IDRGS] [varchar](54) NULL,
	[F1_INCISS] [varchar](5) NULL,
	[F1_VEICUL1] [varchar](8) NULL,
	[F1_VEICUL2] [varchar](8) NULL,
	[F1_VEICUL3] [varchar](8) NULL,
	[F1_SDOC] [varchar](3) NULL,
	[F1_SDOCORI] [varchar](3) NULL,
	[F1_SDOCMAN] [varchar](3) NULL,
	[F1_HISTRET] [varbinary](max) NULL,
	[F1_IDRECOP] [varchar](6) NULL,
	[F1_DTCPISS] [varchar](8) NULL,
	[F1_SERMDF] [varchar](3) NULL,
	[F1_NUMMDF] [varchar](9) NULL,
	[F1_VERBAIS] [varchar](9) NULL,
	[F1_DOCISEN] [varchar](9) NULL,
	[F1_DEVMERC] [varchar](1) NULL,
	[F1_BOMDES] [varchar](4) NULL,
	[F1_ZZFLUIG] [float] NULL,
	[F1_VALFMD] [float] NULL,
	[F1_ESTDES] [varchar](2) NULL,
	[F1_ZLOCPAP] [varchar](50) NULL,
	[F1_ZLOCPGT] [varchar](2) NULL,
	[F1_ZOBS] [varbinary](max) NULL,
	[F1_CODROM] [varchar](10) NULL,
	[F1_BFCPANT] [float] NULL,
	[F1_VFCPANT] [float] NULL,
	[F1_BASFECP] [float] NULL,
	[F1_BSFCPST] [float] NULL,
	[F1_BSFCCMP] [float] NULL,
	[F1_USERLGI] [varchar](17) NULL,
	[F1_USERLGA] [varchar](17) NULL,
	[F1_MUORITR] [varchar](5) NULL,
	[F1_MUDESTR] [varchar](5) NULL,
	[F1_UFDESTR] [varchar](2) NULL,
	[F1_UFORITR] [varchar](2) NULL,
	[F1_SUBSERI] [varchar](3) NULL,
	[F1_IDNF] [varchar](36) NULL,
	[F1_ZRECWMS] [varchar](1) NULL,
	[F1_ZZSTATU] [varchar](1) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SF1010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SF2010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SF2010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[F2_DOC] [varchar](9) NULL,
	[F2_SERIE] [varchar](3) NULL,
	[F2_CLIENTE] [varchar](6) NULL,
	[F2_LOJA] [varchar](2) NULL,
	[F2_COND] [varchar](3) NULL,
	[F2_DUPL] [varchar](9) NULL,
	[F2_EMISSAO] [varchar](8) NULL,
	[F2_EST] [varchar](2) NULL,
	[F2_FRETE] [float] NULL,
	[F2_SEGURO] [float] NULL,
	[F2_ICMFRET] [float] NULL,
	[F2_TIPOCLI] [varchar](1) NULL,
	[F2_VALBRUT] [float] NULL,
	[F2_VALICM] [float] NULL,
	[F2_BASEICM] [float] NULL,
	[F2_VALIPI] [float] NULL,
	[F2_BASEIPI] [float] NULL,
	[F2_VALMERC] [float] NULL,
	[F2_NFORI] [varchar](9) NULL,
	[F2_DESCONT] [float] NULL,
	[F2_SERIORI] [varchar](3) NULL,
	[F2_TIPO] [varchar](1) NULL,
	[F2_ESPECI1] [varchar](10) NULL,
	[F2_ESPECI2] [varchar](10) NULL,
	[F2_ESPECI3] [varchar](10) NULL,
	[F2_ESPECI4] [varchar](10) NULL,
	[F2_VOLUME1] [float] NULL,
	[F2_VOLUME2] [float] NULL,
	[F2_VOLUME3] [float] NULL,
	[F2_VOLUME4] [float] NULL,
	[F2_ICMSRET] [float] NULL,
	[F2_PLIQUI] [float] NULL,
	[F2_PBRUTO] [float] NULL,
	[F2_TRANSP] [varchar](6) NULL,
	[F2_REDESP] [varchar](6) NULL,
	[F2_VEND1] [varchar](6) NULL,
	[F2_VEND2] [varchar](6) NULL,
	[F2_VEND3] [varchar](6) NULL,
	[F2_VEND4] [varchar](6) NULL,
	[F2_VEND5] [varchar](6) NULL,
	[F2_OK] [varchar](4) NULL,
	[F2_FIMP] [varchar](1) NULL,
	[F2_DTLANC] [varchar](8) NULL,
	[F2_DTREAJ] [varchar](8) NULL,
	[F2_REAJUST] [varchar](3) NULL,
	[F2_DTBASE0] [varchar](8) NULL,
	[F2_FATORB0] [float] NULL,
	[F2_DTBASE1] [varchar](8) NULL,
	[F2_FATORB1] [float] NULL,
	[F2_VARIAC] [float] NULL,
	[F2_FILIAL] [varchar](2) NULL,
	[F2_BASEISS] [float] NULL,
	[F2_VALISS] [float] NULL,
	[F2_VALFAT] [float] NULL,
	[F2_CONTSOC] [float] NULL,
	[F2_BRICMS] [float] NULL,
	[F2_FRETAUT] [float] NULL,
	[F2_ICMAUTO] [float] NULL,
	[F2_DESPESA] [float] NULL,
	[F2_NEXTSER] [varchar](3) NULL,
	[F2_NEXTDOC] [varchar](9) NULL,
	[F2_ESPECIE] [varchar](5) NULL,
	[F2_PDV] [varchar](10) NULL,
	[F2_MAPA] [varchar](10) NULL,
	[F2_ECF] [varchar](1) NULL,
	[F2_PREFIXO] [varchar](3) NULL,
	[F2_BASIMP1] [float] NULL,
	[F2_BASIMP2] [float] NULL,
	[F2_BASIMP3] [float] NULL,
	[F2_BASIMP4] [float] NULL,
	[F2_BASIMP5] [float] NULL,
	[F2_BASIMP6] [float] NULL,
	[F2_VALIMP1] [float] NULL,
	[F2_VALIMP2] [float] NULL,
	[F2_VALIMP3] [float] NULL,
	[F2_VALIMP4] [float] NULL,
	[F2_VALIMP5] [float] NULL,
	[F2_VALIMP6] [float] NULL,
	[F2_ORDPAGO] [varchar](6) NULL,
	[F2_NFCUPOM] [varchar](12) NULL,
	[F2_VALINSS] [float] NULL,
	[F2_HORA] [varchar](5) NULL,
	[F2_MOEDA] [float] NULL,
	[F2_REGIAO] [varchar](3) NULL,
	[F2_VALCSLL] [float] NULL,
	[F2_VALCOFI] [float] NULL,
	[F2_VALPIS] [float] NULL,
	[F2_LOTE] [varchar](1) NULL,
	[F2_TXMOEDA] [float] NULL,
	[F2_CLEOK] [varchar](4) NULL,
	[F2_CHVCLE] [varchar](14) NULL,
	[F2_IDCLE] [varchar](12) NULL,
	[F2_VALIRRF] [float] NULL,
	[F2_RECFAUT] [varchar](1) NULL,
	[F2_CARGA] [varchar](6) NULL,
	[F2_SEQCAR] [varchar](2) NULL,
	[F2_BASEINS] [float] NULL,
	[F2_PEDPEND] [varchar](6) NULL,
	[F2_DESCCAB] [float] NULL,
	[F2_DTENTR] [varchar](8) NULL,
	[F2_FORMUL] [varchar](1) NULL,
	[F2_TIPODOC] [varchar](2) NULL,
	[F2_NFEACRS] [varchar](9) NULL,
	[F2_TIPOREM] [varchar](1) NULL,
	[F2_SEQENT] [varchar](6) NULL,
	[F2_ICMSDIF] [float] NULL,
	[F2_VALACRS] [float] NULL,
	[F2_RECISS] [varchar](1) NULL,
	[F2_EMINFE] [varchar](8) NULL,
	[F2_BASEPS3] [float] NULL,
	[F2_VALPS3] [float] NULL,
	[F2_BASECF3] [float] NULL,
	[F2_VALCF3] [float] NULL,
	[F2_FILDEST] [varchar](2) NULL,
	[F2_TIPORET] [varchar](1) NULL,
	[F2_FLAGDEV] [varchar](1) NULL,
	[F2_CGCCLI] [varchar](16) NULL,
	[F2_VALTST] [float] NULL,
	[F2_BASEIRR] [float] NULL,
	[F2_ESTCRED] [float] NULL,
	[F2_NODIA] [varchar](10) NULL,
	[F2_DIACTB] [varchar](2) NULL,
	[F2_HAWB] [varchar](20) NULL,
	[F2_VEICUL2] [varchar](8) NULL,
	[F2_VEICUL1] [varchar](8) NULL,
	[F2_ORDSEP] [varchar](6) NULL,
	[F2_BASPIS] [float] NULL,
	[F2_RECOPI] [varchar](1) NULL,
	[F2_NUMORC] [varchar](6) NULL,
	[F2_TPFRETE] [varchar](1) NULL,
	[F2_CREDNFE] [float] NULL,
	[F2_FORMDES] [varchar](1) NULL,
	[F2_CHVNFE] [varchar](44) NULL,
	[F2_IDSA1] [varchar](20) NULL,
	[F2_IDSA2] [varchar](20) NULL,
	[F2_IDSED] [varchar](20) NULL,
	[F2_STATUS] [varchar](3) NULL,
	[F2_CODNFE] [varchar](50) NULL,
	[F2_BSREIN] [float] NULL,
	[F2_NFELETR] [varchar](20) NULL,
	[F2_VALFAC] [float] NULL,
	[F2_VALFET] [float] NULL,
	[F2_VALINA] [float] NULL,
	[F2_HORNFE] [varchar](8) NULL,
	[F2_BASEINA] [float] NULL,
	[F2_TIPIMP] [varchar](1) NULL,
	[F2_TPCOMPL] [varchar](1) NULL,
	[F2_MENNOTA] [varchar](60) NULL,
	[F2_BASEFMP] [float] NULL,
	[F2_IDRECOP] [varchar](6) NULL,
	[F2_TOTEST] [float] NULL,
	[F2_TOTFED] [float] NULL,
	[F2_TOTMUN] [float] NULL,
	[F2_VALFMD] [float] NULL,
	[F2_VALFMP] [float] NULL,
	[F2_LTRAN] [varchar](41) NULL,
	[F2_TOTIMP] [float] NULL,
	[F2_CODRGS] [varchar](1) NULL,
	[F2_DAUTNFE] [varchar](8) NULL,
	[F2_EVENFLG] [varchar](1) NULL,
	[F2_FLAGRGS] [varchar](4) NULL,
	[F2_HAUTNFE] [varchar](5) NULL,
	[F2_IDCCE] [varchar](54) NULL,
	[F2_IDRGS] [varchar](54) NULL,
	[F2_CNO] [varchar](6) NULL,
	[F2_VALFAB] [float] NULL,
	[F2_NFSUBST] [varchar](9) NULL,
	[F2_NUMMDF] [varchar](9) NULL,
	[F2_VREINT] [float] NULL,
	[F2_FORDES] [varchar](6) NULL,
	[F2_LOJADES] [varchar](2) NULL,
	[F2_DESCZFR] [float] NULL,
	[F2_DTTXREF] [varchar](8) NULL,
	[F2_TXREF] [float] NULL,
	[F2_VLSENAR] [float] NULL,
	[F2_BASEFUN] [float] NULL,
	[F2_NTFECP] [varchar](12) NULL,
	[F2_REFTAXA] [float] NULL,
	[F2_REFMOED] [float] NULL,
	[F2_NFICMST] [varchar](12) NULL,
	[F2_VEICUL3] [varchar](8) NULL,
	[F2_BASETST] [float] NULL,
	[F2_VALFDS] [float] NULL,
	[F2_CLIENT] [varchar](6) NULL,
	[F2_LOJENT] [varchar](2) NULL,
	[F2_PREFORI] [varchar](3) NULL,
	[F2_BASCOFI] [float] NULL,
	[F2_BASCSLL] [float] NULL,
	[F2_DTDIGIT] [varchar](8) NULL,
	[F2_VLR_FRT] [float] NULL,
	[F2_VALFUND] [float] NULL,
	[F2_VALIMA] [float] NULL,
	[F2_VALFASE] [float] NULL,
	[F2_SDOCSUB] [varchar](3) NULL,
	[F2_SDOCMAN] [varchar](3) NULL,
	[F2_SDOCORI] [varchar](3) NULL,
	[F2_SDOCMDF] [varchar](3) NULL,
	[F2_SDOCNXT] [varchar](3) NULL,
	[F2_SDOC] [varchar](3) NULL,
	[F2_SERMDF] [varchar](3) NULL,
	[F2_GNRDIF] [varchar](12) NULL,
	[F2_GNRFECP] [varchar](12) NULL,
	[F2_SERSUBS] [varchar](3) NULL,
	[F2_SERSAT] [varchar](9) NULL,
	[F2_DTESERV] [varchar](8) NULL,
	[F2_ZLOCPAP] [varchar](20) NULL,
	[F2_ZMENNOT] [varbinary](max) NULL,
	[F2_BSFCCMP] [float] NULL,
	[F2_LOJARET] [varchar](2) NULL,
	[F2_BASFECP] [float] NULL,
	[F2_BSFCPST] [float] NULL,
	[F2_CLIRET] [varchar](6) NULL,
	[F2_USERLGI] [varchar](17) NULL,
	[F2_USERLGA] [varchar](17) NULL,
	[F2_BASECPM] [float] NULL,
	[F2_VLCPM] [float] NULL,
	[F2_MUNPRES] [varchar](7) NULL,
	[F2_ESTPRES] [varchar](2) NULL,
	[F2_FRTCFOP] [varchar](5) NULL,
	[F2_CMUNDE] [varchar](5) NULL,
	[F2_PAFMD5] [varchar](32) NULL,
	[F2_CMUNOR] [varchar](5) NULL,
	[F2_IDNF] [varchar](36) NULL,
	[F2_UFDEST] [varchar](2) NULL,
	[F2_UFORIG] [varchar](2) NULL,
	[F2_CLIREM] [varchar](6) NULL,
	[F2_LOJAREM] [varchar](2) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SF2010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SF4010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SF4010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[F4_FILIAL] [varchar](2) NULL,
	[F4_CODIGO] [varchar](3) NULL,
	[F4_TIPO] [varchar](1) NULL,
	[F4_ICM] [varchar](1) NULL,
	[F4_IPI] [varchar](1) NULL,
	[F4_CREDICM] [varchar](1) NULL,
	[F4_CREDIPI] [varchar](1) NULL,
	[F4_DUPLIC] [varchar](1) NULL,
	[F4_ESTOQUE] [varchar](1) NULL,
	[F4_CF] [varchar](5) NULL,
	[F4_CFEXT] [varchar](3) NULL,
	[F4_TEXTO] [varchar](20) NULL,
	[F4_BASEICM] [float] NULL,
	[F4_BASEIPI] [float] NULL,
	[F4_PODER3] [varchar](1) NULL,
	[F4_LFICM] [varchar](1) NULL,
	[F4_LFIPI] [varchar](1) NULL,
	[F4_DESTACA] [varchar](1) NULL,
	[F4_INCIDE] [varchar](1) NULL,
	[F4_COMPL] [varchar](1) NULL,
	[F4_IPIFRET] [varchar](1) NULL,
	[F4_ISS] [varchar](1) NULL,
	[F4_LFISS] [varchar](1) NULL,
	[F4_NRLIVRO] [varchar](1) NULL,
	[F4_UPRC] [varchar](1) NULL,
	[F4_CONSUMO] [varchar](1) NULL,
	[F4_FORMULA] [varchar](3) NULL,
	[F4_AGREG] [varchar](1) NULL,
	[F4_INCSOL] [varchar](1) NULL,
	[F4_CIAP] [varchar](1) NULL,
	[F4_DESPIPI] [varchar](1) NULL,
	[F4_LIVRO] [varchar](64) NULL,
	[F4_ATUTEC] [varchar](1) NULL,
	[F4_ATUATF] [varchar](1) NULL,
	[F4_TPIPI] [varchar](1) NULL,
	[F4_STDESC] [varchar](1) NULL,
	[F4_BSICMST] [float] NULL,
	[F4_CREDST] [varchar](1) NULL,
	[F4_BASEISS] [float] NULL,
	[F4_DESPICM] [varchar](1) NULL,
	[F4_SITTRIB] [varchar](2) NULL,
	[F4_PISCOF] [varchar](1) NULL,
	[F4_PISCRED] [varchar](1) NULL,
	[F4_TESDV] [varchar](3) NULL,
	[F4_BASEPIS] [float] NULL,
	[F4_BASECOF] [float] NULL,
	[F4_IPILICM] [varchar](1) NULL,
	[F4_MOVPRJ] [varchar](1) NULL,
	[F4_ICMSDIF] [varchar](1) NULL,
	[F4_TESP3] [varchar](3) NULL,
	[F4_QTDZERO] [varchar](1) NULL,
	[F4_SLDNPT] [varchar](1) NULL,
	[F4_DEVZERO] [varchar](1) NULL,
	[F4_TIPOPER] [varchar](1) NULL,
	[F4_MSBLQL] [varchar](1) NULL,
	[F4_TRFICM] [varchar](1) NULL,
	[F4_TESENV] [varchar](3) NULL,
	[F4_OBSICM] [varchar](1) NULL,
	[F4_OBSSOL] [varchar](1) NULL,
	[F4_PICMDIF] [float] NULL,
	[F4_SELO] [varchar](1) NULL,
	[F4_ISSST] [varchar](1) NULL,
	[F4_FINALID] [varchar](254) NULL,
	[F4_PISFISC] [varchar](1) NULL,
	[F4_CONTSOC] [varchar](1) NULL,
	[F4_COP] [varchar](4) NULL,
	[F4_INDNTFR] [varchar](1) NULL,
	[F4_CODBCC] [varchar](2) NULL,
	[F4_CPPRODE] [float] NULL,
	[F4_AJUSTE] [varchar](1) NULL,
	[F4_TPPRODE] [varchar](1) NULL,
	[F4_CPRECTR] [varchar](1) NULL,
	[F4_IPIANT] [varchar](1) NULL,
	[F4_TPCPRES] [varchar](1) NULL,
	[F4_DESPCOF] [varchar](1) NULL,
	[F4_DSPRDIC] [varchar](1) NULL,
	[F4_REGDSTA] [varchar](1) NULL,
	[F4_OPEMOV] [varchar](2) NULL,
	[F4_TPREG] [varchar](1) NULL,
	[F4_AFRMM] [varchar](1) NULL,
	[F4_BENSATF] [varchar](1) NULL,
	[F4_ICMSST] [varchar](1) NULL,
	[F4_FRETAUT] [varchar](1) NULL,
	[F4_MKPCMP] [varchar](1) NULL,
	[F4_AGRRETC] [varchar](1) NULL,
	[F4_CRDEST] [varchar](1) NULL,
	[F4_RETISS] [varchar](1) NULL,
	[F4_CRPRST] [float] NULL,
	[F4_CTIPI] [varchar](2) NULL,
	[F4_TRANFIL] [varchar](1) NULL,
	[F4_CRPRELE] [float] NULL,
	[F4_BCRDCOF] [float] NULL,
	[F4_AGRCOF] [varchar](1) NULL,
	[F4_LFICMST] [varchar](1) NULL,
	[F4_PISBRUT] [varchar](1) NULL,
	[F4_COFDSZF] [varchar](1) NULL,
	[F4_BCRDPIS] [float] NULL,
	[F4_COFBRUT] [varchar](1) NULL,
	[F4_DESPPIS] [varchar](1) NULL,
	[F4_AGRPIS] [varchar](1) NULL,
	[F4_PISDSZF] [varchar](1) NULL,
	[F4_CRDPRES] [float] NULL,
	[F4_IPIPC] [varchar](1) NULL,
	[F4_ALICRST] [float] NULL,
	[F4_TRIBPRD] [varchar](2) NULL,
	[F4_IPIPECR] [float] NULL,
	[F4_TXAPIPI] [varchar](3) NULL,
	[F4_TESE3] [varchar](3) NULL,
	[F4_CFPS] [varchar](6) NULL,
	[F4_IPIOBS] [varchar](1) NULL,
	[F4_VARATAC] [varchar](1) NULL,
	[F4_IVAUTIL] [float] NULL,
	[F4_CFACS] [varchar](1) NULL,
	[F4_CFABOV] [varchar](1) NULL,
	[F4_CPRESPR] [float] NULL,
	[F4_VDASOFT] [varchar](1) NULL,
	[F4_VENPRES] [varchar](1) NULL,
	[F4_MOVFIS] [varchar](1) NULL,
	[F4_AGRDRED] [varchar](1) NULL,
	[F4_APLIIVA] [varchar](1) NULL,
	[F4_APLREDP] [varchar](1) NULL,
	[F4_OPERSUC] [varchar](1) NULL,
	[F4_TEMDOCS] [varchar](1) NULL,
	[F4_ESTCRED] [float] NULL,
	[F4_ATACVAR] [varchar](1) NULL,
	[F4_CRICMST] [varchar](1) NULL,
	[F4_CODOBSE] [varchar](6) NULL,
	[F4_BSRURAL] [varchar](1) NULL,
	[F4_CREDACU] [varchar](1) NULL,
	[F4_BENDUB] [varchar](1) NULL,
	[F4_CRPRSIM] [float] NULL,
	[F4_REDANT] [float] NULL,
	[F4_DESCOND] [varchar](1) NULL,
	[F4_NATOPER] [varchar](10) NULL,
	[F4_RECDAC] [varchar](1) NULL,
	[F4_ISEFEMT] [varchar](1) NULL,
	[F4_TABGIAC] [varchar](3) NULL,
	[F4_CTBHISS] [varchar](9) NULL,
	[F4_CSBHISS] [varchar](5) NULL,
	[F4_TNATREC] [varchar](4) NULL,
	[F4_CNATREC] [varchar](3) NULL,
	[F4_GRPNATR] [varchar](2) NULL,
	[F4_DTFIMNT] [varchar](8) NULL,
	[F4_CREDPRE] [float] NULL,
	[F4_CONSIND] [varchar](1) NULL,
	[F4_ANTICMS] [varchar](1) NULL,
	[F4_NUMDUB] [varchar](12) NULL,
	[F4_CODDET] [varchar](4) NULL,
	[F4_ISEFECP] [varchar](1) NULL,
	[F4_PARTICM] [varchar](1) NULL,
	[F4_COMPONE] [varchar](1) NULL,
	[F4_PSCFST] [varchar](1) NULL,
	[F4_APLIRED] [varchar](1) NULL,
	[F4_ICMSTMT] [varchar](1) NULL,
	[F4_PERCATM] [float] NULL,
	[F4_CRDACUM] [varchar](1) NULL,
	[F4_PERCMED] [float] NULL,
	[F4_BSICMRE] [varchar](1) NULL,
	[F4_STLIQ] [varchar](1) NULL,
	[F4_CV139] [varchar](1) NULL,
	[F4_RFETALG] [varchar](1) NULL,
	[F4_FTATUSC] [varchar](1) NULL,
	[F4_MALQPIS] [float] NULL,
	[F4_TIPODUB] [varchar](1) NULL,
	[F4_OPERGAR] [varchar](1) NULL,
	[F4_DESTRUI] [varchar](1) NULL,
	[F4_DEVPARC] [varchar](1) NULL,
	[F4_IMPIND] [varchar](1) NULL,
	[F4_DICMFUN] [varchar](1) NULL,
	[F4_IDHIST] [varchar](20) NULL,
	[F4_BSRDICM] [varchar](1) NULL,
	[F4_MALQCOF] [float] NULL,
	[F4_NORESP] [varchar](1) NULL,
	[F4_CIAPTRB] [varchar](1) NULL,
	[F4_CFAMAD] [varchar](1) NULL,
	[F4_COFMIN] [varchar](1) NULL,
	[F4_CROUTSP] [float] NULL,
	[F4_RDBSICM] [varchar](1) NULL,
	[F4_IPIVFCF] [varchar](1) NULL,
	[F4_TRAFILI] [varchar](1) NULL,
	[F4_TREGDMA] [varchar](2) NULL,
	[F4_IPIMIN] [varchar](1) NULL,
	[F4_PISMIN] [varchar](1) NULL,
	[F4_TPOP] [varchar](2) NULL,
	[F4_APSCFST] [varchar](1) NULL,
	[F4_CRDTRAN] [float] NULL,
	[F4_CSOSN] [varchar](3) NULL,
	[F4_NATOPNF] [varchar](3) NULL,
	[F4_OUTPERC] [float] NULL,
	[F4_CSTCF1] [varchar](2) NULL,
	[F4_CSTPF1] [varchar](2) NULL,
	[F4_EFDF100] [varchar](1) NULL,
	[F4_DUPLIPI] [varchar](1) NULL,
	[F4_REGESP] [varchar](2) NULL,
	[F4_AGRPEDG] [varchar](1) NULL,
	[F4_INDVF] [varchar](1) NULL,
	[F4_MKPSOL] [varchar](1) NULL,
	[F4_CROUTGO] [float] NULL,
	[F4_REFATAN] [varchar](1) NULL,
	[F4_DBSTCSL] [varchar](1) NULL,
	[F4_DBSTIRR] [varchar](1) NULL,
	[F4_INTBSIC] [varchar](1) NULL,
	[F4_CRICMS] [varchar](1) NULL,
	[F4_CRPREPR] [float] NULL,
	[F4_SOMAIPI] [varchar](1) NULL,
	[F4_ISEFEMG] [varchar](1) NULL,
	[F4_MTRTBH] [varchar](2) NULL,
	[F4_TPRSPL] [varchar](1) NULL,
	[F4_MSGLT] [varchar](1) NULL,
	[F4_CRPREPE] [float] NULL,
	[F4_DUPLIST] [varchar](1) NULL,
	[F4_BCPCST] [varchar](1) NULL,
	[F4_CODLEG] [varchar](4) NULL,
	[F4_CRPRERO] [float] NULL,
	[F4_TABGIAI] [varchar](3) NULL,
	[F4_TABGIAO] [varchar](3) NULL,
	[F4_ISEFERN] [varchar](1) NULL,
	[F4_STCONF] [varchar](1) NULL,
	[F4_PCREDAC] [float] NULL,
	[F4_TRANSIT] [varchar](1) NULL,
	[F4_PR35701] [float] NULL,
	[F4_RGESPCI] [varchar](1) NULL,
	[F4_VLAGREG] [varchar](1) NULL,
	[F4_PAUTICM] [varchar](1) NULL,
	[F4_COMPRED] [varchar](1) NULL,
	[F4_REDBCCE] [float] NULL,
	[F4_CODPAG] [varchar](2) NULL,
	[F4_PAGCOM] [varchar](1) NULL,
	[F4_CODLAN] [varchar](6) NULL,
	[F4_FRETISS] [varchar](1) NULL,
	[F4_CSTISS] [varchar](2) NULL,
	[F4_TIPOTES] [varchar](1) NULL,
	[F4_BONIF] [varchar](1) NULL,
	[F4_ALSENAR] [float] NULL,
	[F4_PRZESP] [varchar](1) NULL,
	[F4_RGESPST] [varchar](1) NULL,
	[F4_CLFDSUL] [varchar](1) NULL,
	[F4_GRPCST] [varchar](3) NULL,
	[F4_IPMMG] [varchar](60) NULL,
	[F4_IPMSP] [varchar](60) NULL,
	[F4_MOTICMS] [varchar](2) NULL,
	[F4_CALCCPB] [varchar](1) NULL,
	[F4_DIFAL] [varchar](1) NULL,
	[F4_ESCRDPR] [varchar](1) NULL,
	[F4_INOVAUT] [varchar](1) NULL,
	[F4_DESCISS] [varchar](1) NULL,
	[F4_ENQLEG] [varchar](2) NULL,
	[F4_CUSENTR] [varchar](1) NULL,
	[F4_AGREGCP] [varchar](1) NULL,
	[F4_RESSARC] [varchar](1) NULL,
	[F4_VLRZERO] [varchar](1) NULL,
	[F4_INDDET] [varchar](1) NULL,
	[F4_CALCFET] [varchar](1) NULL,
	[F4_TRANCQ] [varchar](1) NULL,
	[F4_TRFICST] [varchar](1) NULL,
	[F4_CSTPIS] [varchar](2) NULL,
	[F4_CSTCOF] [varchar](2) NULL,
	[F4_ART274] [varchar](1) NULL,
	[F4_AGRISS] [varchar](1) NULL,
	[F4_CRLEIT] [varchar](1) NULL,
	[F4_CFASE] [varchar](1) NULL,
	[F4_CFUNDES] [varchar](1) NULL,
	[F4_CIMAMT] [varchar](1) NULL,
	[F4_FTRICMS] [float] NULL,
	[F4_BASCMP] [float] NULL,
	[F4_CRPRESP] [float] NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[F4_OPANRE] [varchar](7) NULL,
	[F4_COPSIMP] [varchar](7) NULL,
	[F4_FORINFC] [varchar](3) NULL,
	[F4_ALQFEEF] [float] NULL,
	[F4_ALIQPRO] [float] NULL,
	[F4_CODINFC] [varchar](6) NULL,
	[F4_CONTERC] [varchar](1) NULL,
	[F4_DEDDIF] [varchar](1) NULL,
	[F4_FCALCPR] [varchar](1) NULL,
	[F4_STREDU] [varchar](1) NULL,
	[F4_COLVDIF] [varchar](1) NULL,
	[F4_DIFALPC] [varchar](1) NULL,
	[F4_INDISEN] [varchar](1) NULL,
	[F4_ZZBLK] [varchar](1) NULL,
	[F4_ZZNFSPC] [varchar](1) NULL,
	[F4_INFITEM] [varchar](8) NULL,
	[F4_CRDICMA] [varchar](1) NULL,
	[F4_EFUTUR] [varchar](1) NULL,
	[F4_FEEF] [varchar](1) NULL,
	[F4_CSENAR] [varchar](1) NULL,
	[F4_CINSS] [varchar](1) NULL,
	[F4_APLREPC] [varchar](1) NULL,
	[F4_BICMCMP] [varchar](1) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SF4010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SRA010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SRA010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[RA_FILIAL] [varchar](2) NULL,
	[RA_MAT] [varchar](6) NULL,
	[RA_NOME] [varchar](30) NULL,
	[RA_CC] [varchar](9) NULL,
	[RA_ADMISSA] [varchar](8) NULL,
	[RA_CARGO] [varchar](5) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
	[RA_BITMAP] [varchar](20) NULL,
	[RA_NOMECMP] [varchar](70) NULL,
	[RA_MAE] [varchar](40) NULL,
	[RA_PAI] [varchar](40) NULL,
	[RA_SEXO] [varchar](1) NULL,
	[RA_NSOCIAL] [varchar](70) NULL,
	[RA_HOJORVA] [varchar](1) NULL,
	[RA_RACACOR] [varchar](1) NULL,
	[RA_NASC] [varchar](8) NULL,
	[RA_ALTNASC] [varchar](1) NULL,
	[RA_ESTCIVI] [varchar](1) NULL,
	[RA_CPAISOR] [varchar](5) NULL,
	[RA_NACIONA] [varchar](2) NULL,
	[RA_NACIONC] [varchar](5) NULL,
	[RA_BRNASEX] [varchar](1) NULL,
	[RA_NATURAL] [varchar](2) NULL,
	[RA_CODMUNN] [varchar](5) NULL,
	[RA_MUNNASC] [varchar](30) NULL,
	[RA_APELIDO] [varchar](15) NULL,
	[RA_GRINRAI] [varchar](2) NULL,
	[RA_EMAIL] [varchar](50) NULL,
	[RA_EMAIL2] [varchar](60) NULL,
	[RA_RECMAIL] [varchar](1) NULL,
	[RA_TPMAIL] [varchar](1) NULL,
	[RA_DEFIFIS] [varchar](1) NULL,
	[RA_BRPDH] [varchar](1) NULL,
	[RA_TPDEFFI] [varchar](1) NULL,
	[RA_PORTDEF] [varchar](6) NULL,
	[RA_OBSDEFI] [image] NULL,
	[RA_CLVL] [varchar](9) NULL,
	[RA_ITEM] [varchar](9) NULL,
	[RA_ALTADM] [varchar](1) NULL,
	[RA_DEPIR] [varchar](2) NULL,
	[RA_TIPOADM] [varchar](2) NULL,
	[RA_DEPSF] [varchar](2) NULL,
	[RA_DEMISSA] [varchar](8) NULL,
	[RA_OPCAO] [varchar](8) NULL,
	[RA_ALTOPC] [varchar](1) NULL,
	[RA_BCDPFGT] [varchar](8) NULL,
	[RA_CTDPFGT] [varchar](12) NULL,
	[RA_CHAPA] [varchar](5) NULL,
	[RA_PERFGTS] [float] NULL,
	[RA_LOCBNF] [varchar](4) NULL,
	[RA_TNOTRAB] [varchar](3) NULL,
	[RA_BCDEPSA] [varchar](8) NULL,
	[RA_TPCTSAL] [varchar](1) NULL,
	[RA_CTDEPSA] [varchar](12) NULL,
	[RA_TPPREVI] [varchar](1) NULL,
	[RA_SITFOLH] [varchar](1) NULL,
	[RA_PROCES] [varchar](5) NULL,
	[RA_HRSMES] [float] NULL,
	[RA_HRSEMAN] [float] NULL,
	[RA_CATFUNC] [varchar](1) NULL,
	[RA_HRSDIA] [float] NULL,
	[RA_CODFUNC] [varchar](5) NULL,
	[RA_SALARIO] [float] NULL,
	[RA_ANTEAUM] [float] NULL,
	[RA_PGCTSIN] [varchar](1) NULL,
	[RA_ADCPERI] [varchar](1) NULL,
	[RA_CESTAB] [varchar](1) NULL,
	[RA_TPCONTR] [varchar](1) NULL,
	[RA_DTFIMCT] [varchar](8) NULL,
	[RA_VALEREF] [varchar](3) NULL,
	[RA_VALEALI] [varchar](3) NULL,
	[RA_HOPARC] [varchar](1) NULL,
	[RA_SEGUROV] [varchar](2) NULL,
	[RA_CLAURES] [varchar](1) NULL,
	[RA_PERCADT] [float] NULL,
	[RA_PENSALI] [float] NULL,
	[RA_SINDICA] [varchar](2) NULL,
	[RA_CBO] [varchar](5) NULL,
	[RA_ALTCBO] [varchar](1) NULL,
	[RA_TIPOPGT] [varchar](1) NULL,
	[RA_VIEMRAI] [varchar](2) NULL,
	[RA_CATEG] [varchar](2) NULL,
	[RA_CATEFD] [varchar](3) NULL,
	[RA_PERICUL] [float] NULL,
	[RA_VCTOEXP] [varchar](8) NULL,
	[RA_INSMIN] [float] NULL,
	[RA_VCTEXP2] [varchar](8) NULL,
	[RA_INSMED] [float] NULL,
	[RA_EXAMEDI] [varchar](8) NULL,
	[RA_DTVTEST] [varchar](8) NULL,
	[RA_ADCINS] [varchar](1) NULL,
	[RA_AFASFGT] [varchar](2) NULL,
	[RA_ASSIST] [varchar](1) NULL,
	[RA_CONFED] [varchar](1) NULL,
	[RA_MENSIND] [varchar](1) NULL,
	[RA_RESCRAI] [varchar](2) NULL,
	[RA_MESESAN] [float] NULL,
	[RA_FTINSAL] [float] NULL,
	[RA_MESTRAB] [varchar](2) NULL,
	[RA_CLASSEC] [varchar](2) NULL,
	[RA_OCORREN] [varchar](2) NULL,
	[RA_PERCSAT] [float] NULL,
	[RA_CODTIT] [varchar](2) NULL,
	[RA_POSTO] [varchar](9) NULL,
	[RA_DEPTO] [varchar](9) NULL,
	[RA_ALTNOME] [varchar](1) NULL,
	[RA_CODRET] [varchar](4) NULL,
	[RA_FECREI] [varchar](8) NULL,
	[RA_CRACHA] [varchar](10) NULL,
	[RA_DEMIANT] [varchar](8) NULL,
	[RA_REGRA] [varchar](2) NULL,
	[RA_MOLEST] [varchar](8) NULL,
	[RA_COMPSAB] [varchar](1) NULL,
	[RA_EAPOSEN] [varchar](1) NULL,
	[RA_NJUD14] [varchar](20) NULL,
	[RA_TPREINT] [varchar](1) NULL,
	[RA_SEQTURN] [varchar](2) NULL,
	[RA_NRPROC] [varchar](20) NULL,
	[RA_SENHA] [varchar](6) NULL,
	[RA_NRLEIAN] [varchar](14) NULL,
	[RA_DTEFRET] [varchar](8) NULL,
	[RA_DTEFRTN] [varchar](8) NULL,
	[RA_CIC] [varchar](11) NULL,
	[RA_NIVEL] [varchar](2) NULL,
	[RA_PIS] [varchar](12) NULL,
	[RA_TPRCBT] [varchar](1) NULL,
	[RA_ALTPIS] [varchar](1) NULL,
	[RA_TCFMSG] [varchar](6) NULL,
	[RA_RG] [varchar](15) NULL,
	[RA_INSSSC] [varchar](1) NULL,
	[RA_DTRGEXP] [varchar](8) NULL,
	[RA_RGUF] [varchar](2) NULL,
	[RA_RGORG] [varchar](3) NULL,
	[RA_RGEXP] [varchar](6) NULL,
	[RA_DISTSN] [varchar](1) NULL,
	[RA_ORGEMRG] [varchar](5) NULL,
	[RA_COMPLRG] [varchar](20) NULL,
	[RA_NUMCP] [varchar](7) NULL,
	[RA_BHFOL] [varchar](1) NULL,
	[RA_SERCP] [varchar](5) NULL,
	[RA_UFCP] [varchar](2) NULL,
	[RA_ACUMBH] [varchar](1) NULL,
	[RA_OKTRANS] [varchar](2) NULL,
	[RA_DTCPEXP] [varchar](8) NULL,
	[RA_ALTCP] [varchar](1) NULL,
	[RA_TABELA] [varchar](3) NULL,
	[RA_TABNIVE] [varchar](2) NULL,
	[RA_HABILIT] [varchar](11) NULL,
	[RA_TABFAIX] [varchar](2) NULL,
	[RA_CNHORG] [varchar](20) NULL,
	[RA_DTEMCNH] [varchar](8) NULL,
	[RA_DTVCCNH] [varchar](8) NULL,
	[RA_RECPFNC] [varchar](1) NULL,
	[RA_CATCNH] [varchar](1) NULL,
	[RA_UFCNH] [varchar](2) NULL,
	[RA_TIPENDE] [varchar](1) NULL,
	[RA_RESERVI] [varchar](12) NULL,
	[RA_TITULOE] [varchar](12) NULL,
	[RA_RESEXT] [varchar](1) NULL,
	[RA_PAISEXT] [varchar](5) NULL,
	[RA_ZONASEC] [varchar](8) NULL,
	[RA_SECAO] [varchar](4) NULL,
	[RA_LOGRTP] [varchar](4) NULL,
	[RA_REGISTR] [varchar](6) NULL,
	[RA_FICHA] [varchar](8) NULL,
	[RA_LOGRDSC] [varchar](80) NULL,
	[RA_SERVENT] [varchar](6) NULL,
	[RA_CODACER] [varchar](2) NULL,
	[RA_LOGRNUM] [varchar](10) NULL,
	[RA_REGCIVI] [varchar](2) NULL,
	[RA_ENDEREC] [varchar](30) NULL,
	[RA_TPLIVRO] [varchar](1) NULL,
	[RA_CLASEST] [varchar](2) NULL,
	[RA_NUMENDE] [varchar](6) NULL,
	[RA_MSBLQL] [varchar](1) NULL,
	[RA_TIPCERT] [varchar](1) NULL,
	[RA_COMPLEM] [varchar](15) NULL,
	[RA_EMICERT] [varchar](8) NULL,
	[RA_BAIRRO] [varchar](15) NULL,
	[RA_MATCERT] [varchar](32) NULL,
	[RA_ESTADO] [varchar](2) NULL,
	[RA_LIVCERT] [varchar](8) NULL,
	[RA_CODMUN] [varchar](5) NULL,
	[RA_FOLCERT] [varchar](4) NULL,
	[RA_CARCERT] [varchar](30) NULL,
	[RA_MUNICIP] [varchar](20) NULL,
	[RA_UFCERT] [varchar](2) NULL,
	[RA_CEP] [varchar](8) NULL,
	[RA_CPOSTAL] [varchar](9) NULL,
	[RA_CDMUCER] [varchar](5) NULL,
	[RA_CEPCXPO] [varchar](8) NULL,
	[RA_NUMEPAS] [varchar](15) NULL,
	[RA_ALTEND] [varchar](1) NULL,
	[RA_EMISPAS] [varchar](15) NULL,
	[RA_DDDFONE] [varchar](2) NULL,
	[RA_TIPAMED] [varchar](1) NULL,
	[RA_UFPAS] [varchar](2) NULL,
	[RA_ASMEDIC] [varchar](2) NULL,
	[RA_TELEFON] [varchar](20) NULL,
	[RA_DDDCELU] [varchar](2) NULL,
	[RA_DEMIPAS] [varchar](8) NULL,
	[RA_DPASSME] [varchar](2) NULL,
	[RA_DVALPAS] [varchar](8) NULL,
	[RA_NUMCELU] [varchar](10) NULL,
	[RA_TPASODO] [varchar](1) NULL,
	[RA_ASODONT] [varchar](2) NULL,
	[RA_CHIDENT] [varchar](25) NULL,
	[RA_CODPAIS] [varchar](5) NULL,
	[RA_NUMRIC] [varchar](12) NULL,
	[RA_EMISRIC] [varchar](10) NULL,
	[RA_UFRIC] [varchar](2) NULL,
	[RA_CDMURIC] [varchar](5) NULL,
	[RA_NUMINSC] [varchar](11) NULL,
	[RA_SERVICO] [varchar](60) NULL,
	[RA_DEXPRIC] [varchar](8) NULL,
	[RA_CODIGO] [varchar](14) NULL,
	[RA_OCEMIS] [varchar](20) NULL,
	[RA_OCDTEXP] [varchar](8) NULL,
	[RA_OCDTVAL] [varchar](8) NULL,
	[RA_CODUNIC] [varchar](30) NULL,
	[RA_PRCFCH] [varchar](5) NULL,
	[RA_PERFCH] [varchar](6) NULL,
	[RA_ROTFCH] [varchar](3) NULL,
	[RA_NUPFCH] [varchar](2) NULL,
	[RA_RNE] [varchar](14) NULL,
	[RA_RNEORG] [varchar](20) NULL,
	[RA_RNEDEXP] [varchar](8) NULL,
	[RA_DATCHEG] [varchar](8) NULL,
	[RA_ANOCHEG] [varchar](2) NULL,
	[RA_NUMNATU] [varchar](10) NULL,
	[RA_DATNATU] [varchar](8) NULL,
	[RA_CASADBR] [varchar](1) NULL,
	[RA_FILHOBR] [varchar](1) NULL,
	[RA_INSSAUT] [varchar](1) NULL,
	[RA_REGIME] [varchar](1) NULL,
	[RA_FWIDM] [varchar](34) NULL,
	[RA_INSMAX] [float] NULL,
	[RA_ADCCONF] [float] NULL,
	[RA_ADCTRF] [float] NULL,
	[RA_PLSAUDE] [varchar](1) NULL,
	[RA_RHEXP] [varchar](6) NULL,
	[RA_ADTPOSE] [varchar](6) NULL,
	[RA_TPJORNA] [varchar](1) NULL,
	[RA_FITIPEN] [varchar](2) NULL,
	[RA_MATIPEN] [varchar](6) NULL,
	[RA_TIPOPEN] [varchar](1) NULL,
	[RA_APOSENT] [varchar](8) NULL,
	[RA_SUBCARR] [float] NULL,
	[RA_DTNOMEA] [varchar](8) NULL,
	[RA_DEFETIV] [varchar](8) NULL,
	[RA_CODCON] [varchar](4) NULL,
	[RA_ADICEDI] [varchar](1) NULL,
	[RA_JORNRED] [float] NULL,
	[RA_TPSBCOM] [varchar](1) NULL,
	[RA_DTHREST] [varchar](8) NULL,
	[RA_TPCUEST] [varchar](1) NULL,
	[RA_ANOSEME] [float] NULL,
	[RA_PERESTU] [varchar](1) NULL,
	[RA_DTCAGED] [varchar](8) NULL,
	[RA_CTRLEMA] [float] NULL,
	[RA_MATMIG] [varchar](20) NULL,
	[RA_AUTMEI] [varchar](1) NULL,
	[RA_ZMAT01] [varchar](12) NULL,
	[RA_ZMAT02] [varchar](12) NULL,
	[RA_ZSCEALT] [varchar](8) NULL,
	[RA_USRADM] [varchar](6) NULL,
	[RA_CONFID] [varchar](1) NULL,
	[RA_HABILMT] [varchar](1) NULL,
	[RA_CTPCD] [varchar](1) NULL,
	[RA_ZPAREN] [varchar](1) NULL,
	[RA_ZGRAU] [varchar](1) NULL,
	[RA_ZFORM] [varchar](100) NULL,
	[RA_ZEXSDX] [varchar](1) NULL,
	[RA_ZEVSDX1] [float] NULL,
	[RA_ZEVSDX2] [float] NULL,
	[RA_ZALOSDX] [varchar](1) NULL,
	[RA_ZEALSDX] [varchar](1) NULL,
	[RA_ZVALSDX] [float] NULL,
	[RA_ZTPCAL] [varchar](1) NULL,
	[RA_ZSEGVD] [varchar](1) NULL,
	[RA_DESEPS] [varchar](254) NULL,
	[RA_DTINCON] [varchar](8) NULL,
	[RA_USERLGI] [varchar](17) NULL,
	[RA_USERLGA] [varchar](17) NULL,
	[RA_PLAPRE] [varchar](14) NULL,
	[RA_TIPCTA] [varchar](1) NULL,
	[RA_KEYLOC] [varchar](4) NULL,
	[RA_BLOQADM] [varchar](1) NULL,
	[RA_ZZVAGA] [varchar](6) NULL,
	[RA_ZZIDFLU] [float] NULL,
	[RA_TIPOCON] [varchar](1) NULL,
	[RA_ZDIRIMG] [varchar](1) NULL,
	[RA_ZZGED] [varchar](20) NULL,
	[RA_ZZRVAL] [varchar](1) NULL,
	[RA_ZZPP] [varchar](1) NULL,
	[RA_DESCEP] [varchar](1) NULL,
	[RA_TIPOVIA] [varchar](1) NULL,
	[RA_ZZPONTO] [varchar](2) NULL,
	[RA_DTENTRA] [varchar](8) NULL,
	[RA_TIPINF] [varchar](1) NULL,
	[RA_DTREC] [varchar](8) NULL,
	[S_T_A_M_P_] [datetime] NULL,
	[I_N_S_D_T_] [datetime] NULL,
	[RA_TSTCNB] [varchar](1) NULL,
	[RA_ZZGRPV] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SRA010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SRB010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SRB010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[RB_FILIAL] [varchar](2) NULL,
	[RB_MAT] [varchar](6) NULL,
	[RB_COD] [varchar](2) NULL,
	[RB_NOME] [varchar](70) NULL,
	[RB_TPDEP] [varchar](2) NULL,
	[RB_DTNASC] [varchar](8) NULL,
	[RB_SEXO] [varchar](1) NULL,
	[RB_GRAUPAR] [varchar](1) NULL,
	[RB_TIPIR] [varchar](1) NULL,
	[RB_TIPSF] [varchar](1) NULL,
	[RB_LOCNASC] [varchar](12) NULL,
	[RB_CARTORI] [varchar](12) NULL,
	[RB_NREGCAR] [varchar](6) NULL,
	[RB_NUMLIVR] [varchar](5) NULL,
	[RB_NUMFOLH] [varchar](7) NULL,
	[RB_DTENTRA] [varchar](8) NULL,
	[RB_DTBAIXA] [varchar](8) NULL,
	[RB_CIC] [varchar](11) NULL,
	[RB_TPDEPAM] [varchar](1) NULL,
	[RB_TIPAMED] [varchar](1) NULL,
	[RB_CODAMED] [varchar](2) NULL,
	[RB_VBDESAM] [varchar](3) NULL,
	[RB_DTINIAM] [varchar](8) NULL,
	[RB_DTFIMAM] [varchar](8) NULL,
	[RB_TPDPODO] [varchar](1) NULL,
	[RB_TPASODO] [varchar](1) NULL,
	[RB_ASODONT] [varchar](2) NULL,
	[RB_VBDESAO] [varchar](3) NULL,
	[RB_DTINIAO] [varchar](8) NULL,
	[RB_DTFIMAO] [varchar](8) NULL,
	[RB_AUXCRE] [varchar](1) NULL,
	[RB_VLRCRE] [float] NULL,
	[RB_PLSAUDE] [varchar](1) NULL,
	[RB_NUMAT] [varchar](37) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[RB_INCT] [varchar](1) NULL,
	[RB_USERLGI] [varchar](17) NULL,
	[RB_USERLGA] [varchar](17) NULL,
	[RB_ZZID] [varchar](15) NULL,
	[RB_ZZNMAE] [varchar](40) NULL,
	[RB_ZDTCAS] [varchar](8) NULL,
	[RB_ZZESTAC] [varchar](1) NULL,
	[RB_DTINIAC] [varchar](8) NULL,
	[RB_DESCDEP] [varchar](100) NULL,
	[RB_DTINIVI] [varchar](8) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SRB010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SRJ010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SRJ010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[RJ_FILIAL] [varchar](2) NULL,
	[RJ_FUNCAO] [varchar](5) NULL,
	[RJ_MAOBRA] [varchar](1) NULL,
	[RJ_DESC] [varchar](20) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SRJ010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STOU_COMPETENCIA]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STOU_COMPETENCIA](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](max) NULL,
	[dtinicio] [varchar](max) NULL,
	[dtfim] [varchar](max) NULL,
	[mes] [varchar](max) NULL,
	[ano] [varchar](max) NULL,
	[mes_desc] [varchar](max) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STOU_JSON_DATA_ponto_espelho]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STOU_JSON_DATA_ponto_espelho](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](max) NULL,
	[pessoa] [varchar](max) NULL,
	[matricula] [varchar](max) NULL,
	[cpf] [varchar](max) NULL,
	[pis] [varchar](max) NULL,
	[cod_cargo] [varchar](max) NULL,
	[cargo] [varchar](max) NULL,
	[situ_original] [varchar](max) NULL,
	[h_normais] [varchar](max) NULL,
	[h_noturna] [varchar](max) NULL,
	[extra_normal] [varchar](max) NULL,
	[extrap100] [varchar](max) NULL,
	[marcacao1] [varchar](max) NULL,
	[marcacao2] [varchar](max) NULL,
	[hrini_intervalo] [varchar](max) NULL,
	[hrfim_intervalo] [varchar](max) NULL,
	[total_calculado] [varchar](max) NULL,
	[dt] [varchar](max) NULL,
	[data] [varchar](max) NULL,
	[cod_empresa] [varchar](max) NULL,
	[empresa] [varchar](max) NULL,
	[depto_conta] [varchar](max) NULL,
	[departamento] [varchar](max) NULL,
	[cod_centro_custo] [varchar](max) NULL,
	[centro_custo] [varchar](max) NULL,
	[obs] [varchar](max) NULL,
	[desconto] [varchar](max) NULL,
	[h_extra] [varchar](max) NULL,
	[h_extra_feriado] [varchar](max) NULL,
	[abona_dsr_descontar] [varchar](max) NULL,
	[justificativa] [varchar](max) NULL,
	[operacao_justificativa] [varchar](max) NULL,
	[gerar_extra] [varchar](max) NULL,
	[justificativa_qtd_aprovacao] [varchar](max) NULL,
	[gerar_noturna] [varchar](max) NULL,
	[justificativa_banco_horas] [varchar](max) NULL,
	[extra_sab] [varchar](max) NULL,
	[extra_dom] [varchar](max) NULL,
	[extra_semana] [varchar](max) NULL,
	[extra_folga] [varchar](max) NULL,
	[h_horas_sumula60] [varchar](max) NULL,
	[extra_noturna_sab] [varchar](max) NULL,
	[extra_feriado] [varchar](max) NULL,
	[extra_facultativo] [varchar](max) NULL,
	[extra_noturna_feriado] [varchar](max) NULL,
	[extra_noturna_dom] [varchar](max) NULL,
	[extra_noturna_semana] [varchar](max) NULL,
	[extra_noturna_folga] [varchar](max) NULL,
	[horas_abonada] [varchar](max) NULL,
	[sem_extra_feriado] [varchar](max) NULL,
	[h_extra_noturna] [varchar](max) NULL,
	[he_noturno_final_ad_noturno] [varchar](max) NULL,
	[horario] [varchar](max) NULL,
	[cod_horario] [varchar](max) NULL,
	[tolerancia_hora_extra] [varchar](max) NULL,
	[tolerancia_atraso] [varchar](max) NULL,
	[tolerancia_saida] [varchar](max) NULL,
	[tolerancia_refeicao] [varchar](max) NULL,
	[inicio_adicional_noturno] [varchar](max) NULL,
	[fim_adicional_noturno] [varchar](max) NULL,
	[ad_noturno_reduzir_jornada] [varchar](max) NULL,
	[carga_horaria] [varchar](max) NULL,
	[extra_autorizada] [varchar](max) NULL,
	[extra_excessiva] [varchar](max) NULL,
	[hora_extra_autorizada] [varchar](max) NULL,
	[extrap50] [varchar](max) NULL,
	[extrap55] [varchar](max) NULL,
	[extrap60] [varchar](max) NULL,
	[extrap65] [varchar](max) NULL,
	[extrap70] [varchar](max) NULL,
	[extrap75] [varchar](max) NULL,
	[extrap80] [varchar](max) NULL,
	[extrap85] [varchar](max) NULL,
	[extrap90] [varchar](max) NULL,
	[extrap95] [varchar](max) NULL,
	[extrap110] [varchar](max) NULL,
	[extrap120] [varchar](max) NULL,
	[extrap130] [varchar](max) NULL,
	[extrap150] [varchar](max) NULL,
	[extrap200] [varchar](max) NULL,
	[extrap125] [varchar](max) NULL,
	[t_h_he_menos_intervalo_a_menor] [varchar](max) NULL,
	[t_h_extra_dia_ponte] [varchar](max) NULL,
	[t_h_extra_facultativo] [varchar](max) NULL,
	[t_h_extra_extrafolga] [varchar](max) NULL,
	[t_h_sobreaviso_menos_trabalhado] [varchar](max) NULL,
	[t_h_extra_menos_intervalo_a_menor] [varchar](max) NULL,
	[jornadas] [varchar](max) NULL,
	[h_jornada] [varchar](max) NULL,
	[h_extra_semana] [varchar](max) NULL,
	[h_extra_sab] [varchar](max) NULL,
	[h_extra_dom] [varchar](max) NULL,
	[h_extra_facultativo] [varchar](max) NULL,
	[h_extra_dia_ponte] [varchar](max) NULL,
	[h_extra_noturna_semana] [varchar](max) NULL,
	[h_extra_noturna_sab] [varchar](max) NULL,
	[h_extra_noturna_dom] [varchar](max) NULL,
	[h_extra_noturna_facultativo] [varchar](max) NULL,
	[h_extra_noturna_dia_ponte] [varchar](max) NULL,
	[h_extra_noturna_feriado] [varchar](max) NULL,
	[h_extra_noturna_folga] [varchar](max) NULL,
	[h_extra_noturna_sem_reducao] [varchar](max) NULL,
	[t_h_extrap100] [varchar](max) NULL,
	[t_h_extra_normal] [varchar](max) NULL,
	[t_h_extrapnoturna_100] [varchar](max) NULL,
	[t_h_h_noturno_menos_sumula60] [varchar](max) NULL,
	[marcacao3] [varchar](max) NULL,
	[marcacao4] [varchar](max) NULL,
	[marcacao5] [varchar](max) NULL,
	[marcacao6] [varchar](max) NULL,
	[marcacao7] [varchar](max) NULL,
	[marcacao8] [varchar](max) NULL,
	[marcacao9] [varchar](max) NULL,
	[marcacao10] [varchar](max) NULL,
	[marcacao11] [varchar](max) NULL,
	[marcacao12] [varchar](max) NULL,
	[marcacao1_alterada] [varchar](max) NULL,
	[marcacao2_alterada] [varchar](max) NULL,
	[marcacao3_alterada] [varchar](max) NULL,
	[marcacao4_alterada] [varchar](max) NULL,
	[marcacao5_alterada] [varchar](max) NULL,
	[marcacao6_alterada] [varchar](max) NULL,
	[marcacao7_alterada] [varchar](max) NULL,
	[marcacao8_alterada] [varchar](max) NULL,
	[marcacao9_alterada] [varchar](max) NULL,
	[marcacao10_alterada] [varchar](max) NULL,
	[marcacao11_alterada] [varchar](max) NULL,
	[marcacao12_alterada] [varchar](max) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
	[page] [int] NULL,
	[depto_cc] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STOU_TEMP_DATA]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STOU_TEMP_DATA](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](max) NULL,
	[pessoa] [varchar](max) NULL,
	[matricula] [varchar](max) NULL,
	[cpf] [varchar](max) NULL,
	[pis] [varchar](max) NULL,
	[cod_cargo] [varchar](max) NULL,
	[cargo] [varchar](max) NULL,
	[situ_original] [varchar](max) NULL,
	[h_normais] [varchar](max) NULL,
	[h_noturna] [varchar](max) NULL,
	[extra_normal] [varchar](max) NULL,
	[extrap100] [varchar](max) NULL,
	[marcacao1] [varchar](max) NULL,
	[marcacao2] [varchar](max) NULL,
	[hrini_intervalo] [varchar](max) NULL,
	[hrfim_intervalo] [varchar](max) NULL,
	[total_calculado] [varchar](max) NULL,
	[dt] [varchar](max) NULL,
	[data] [varchar](max) NULL,
	[cod_empresa] [varchar](max) NULL,
	[empresa] [varchar](max) NULL,
	[depto_conta] [varchar](max) NULL,
	[departamento] [varchar](max) NULL,
	[cod_centro_custo] [varchar](max) NULL,
	[centro_custo] [varchar](max) NULL,
	[obs] [varchar](max) NULL,
	[desconto] [varchar](max) NULL,
	[h_extra] [varchar](max) NULL,
	[h_extra_feriado] [varchar](max) NULL,
	[abona_dsr_descontar] [varchar](max) NULL,
	[justificativa] [varchar](max) NULL,
	[operacao_justificativa] [varchar](max) NULL,
	[gerar_extra] [varchar](max) NULL,
	[justificativa_qtd_aprovacao] [varchar](max) NULL,
	[gerar_noturna] [varchar](max) NULL,
	[justificativa_banco_horas] [varchar](max) NULL,
	[extra_sab] [varchar](max) NULL,
	[extra_dom] [varchar](max) NULL,
	[extra_semana] [varchar](max) NULL,
	[extra_folga] [varchar](max) NULL,
	[h_horas_sumula60] [varchar](max) NULL,
	[extra_noturna_sab] [varchar](max) NULL,
	[extra_feriado] [varchar](max) NULL,
	[extra_facultativo] [varchar](max) NULL,
	[extra_noturna_feriado] [varchar](max) NULL,
	[extra_noturna_dom] [varchar](max) NULL,
	[extra_noturna_semana] [varchar](max) NULL,
	[extra_noturna_folga] [varchar](max) NULL,
	[horas_abonada] [varchar](max) NULL,
	[sem_extra_feriado] [varchar](max) NULL,
	[h_extra_noturna] [varchar](max) NULL,
	[he_noturno_final_ad_noturno] [varchar](max) NULL,
	[horario] [varchar](max) NULL,
	[cod_horario] [varchar](max) NULL,
	[tolerancia_hora_extra] [varchar](max) NULL,
	[tolerancia_atraso] [varchar](max) NULL,
	[tolerancia_saida] [varchar](max) NULL,
	[tolerancia_refeicao] [varchar](max) NULL,
	[inicio_adicional_noturno] [varchar](max) NULL,
	[fim_adicional_noturno] [varchar](max) NULL,
	[ad_noturno_reduzir_jornada] [varchar](max) NULL,
	[carga_horaria] [varchar](max) NULL,
	[extra_autorizada] [varchar](max) NULL,
	[extra_excessiva] [varchar](max) NULL,
	[hora_extra_autorizada] [varchar](max) NULL,
	[extrap50] [varchar](max) NULL,
	[extrap55] [varchar](max) NULL,
	[extrap60] [varchar](max) NULL,
	[extrap65] [varchar](max) NULL,
	[extrap70] [varchar](max) NULL,
	[extrap75] [varchar](max) NULL,
	[extrap80] [varchar](max) NULL,
	[extrap85] [varchar](max) NULL,
	[extrap90] [varchar](max) NULL,
	[extrap95] [varchar](max) NULL,
	[extrap110] [varchar](max) NULL,
	[extrap120] [varchar](max) NULL,
	[extrap130] [varchar](max) NULL,
	[extrap150] [varchar](max) NULL,
	[extrap200] [varchar](max) NULL,
	[extrap125] [varchar](max) NULL,
	[t_h_he_menos_intervalo_a_menor] [varchar](max) NULL,
	[t_h_extra_dia_ponte] [varchar](max) NULL,
	[t_h_extra_facultativo] [varchar](max) NULL,
	[t_h_extra_extrafolga] [varchar](max) NULL,
	[t_h_sobreaviso_menos_trabalhado] [varchar](max) NULL,
	[t_h_extra_menos_intervalo_a_menor] [varchar](max) NULL,
	[jornadas] [varchar](max) NULL,
	[h_jornada] [varchar](max) NULL,
	[h_extra_semana] [varchar](max) NULL,
	[h_extra_sab] [varchar](max) NULL,
	[h_extra_dom] [varchar](max) NULL,
	[h_extra_facultativo] [varchar](max) NULL,
	[h_extra_dia_ponte] [varchar](max) NULL,
	[h_extra_noturna_semana] [varchar](max) NULL,
	[h_extra_noturna_sab] [varchar](max) NULL,
	[h_extra_noturna_dom] [varchar](max) NULL,
	[h_extra_noturna_facultativo] [varchar](max) NULL,
	[h_extra_noturna_dia_ponte] [varchar](max) NULL,
	[h_extra_noturna_feriado] [varchar](max) NULL,
	[h_extra_noturna_folga] [varchar](max) NULL,
	[h_extra_noturna_sem_reducao] [varchar](max) NULL,
	[t_h_extrap100] [varchar](max) NULL,
	[t_h_extra_normal] [varchar](max) NULL,
	[t_h_extrapnoturna_100] [varchar](max) NULL,
	[t_h_h_noturno_menos_sumula60] [varchar](max) NULL,
	[marcacao3] [varchar](max) NULL,
	[marcacao4] [varchar](max) NULL,
	[marcacao5] [varchar](max) NULL,
	[marcacao6] [varchar](max) NULL,
	[marcacao7] [varchar](max) NULL,
	[marcacao8] [varchar](max) NULL,
	[marcacao9] [varchar](max) NULL,
	[marcacao10] [varchar](max) NULL,
	[marcacao11] [varchar](max) NULL,
	[marcacao12] [varchar](max) NULL,
	[marcacao1_alterada] [varchar](max) NULL,
	[marcacao2_alterada] [varchar](max) NULL,
	[marcacao3_alterada] [varchar](max) NULL,
	[marcacao4_alterada] [varchar](max) NULL,
	[marcacao5_alterada] [varchar](max) NULL,
	[marcacao6_alterada] [varchar](max) NULL,
	[marcacao7_alterada] [varchar](max) NULL,
	[marcacao8_alterada] [varchar](max) NULL,
	[marcacao9_alterada] [varchar](max) NULL,
	[marcacao10_alterada] [varchar](max) NULL,
	[marcacao11_alterada] [varchar](max) NULL,
	[marcacao12_alterada] [varchar](max) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
	[page] [int] NULL,
	[depto_cc] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SX5010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SX5010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[X5_FILIAL] [varchar](2) NULL,
	[X5_TABELA] [varchar](2) NULL,
	[X5_CHAVE] [varchar](6) NULL,
	[X5_DESCRI] [varchar](55) NULL,
	[X5_DESCSPA] [varchar](55) NULL,
	[X5_DESCENG] [varchar](55) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [bigint] NULL,
	[R_E_C_D_E_L_] [bigint] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SX5010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SY1010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SY1010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[Y1_FILIAL] [varchar](2) NULL,
	[Y1_COD] [varchar](3) NULL,
	[Y1_NOME] [varchar](40) NULL,
	[Y1_USER] [varchar](6) NULL,
	[Y1_TEL] [varchar](30) NULL,
	[Y1_FAX] [varchar](30) NULL,
	[Y1_EMAIL] [varchar](40) NULL,
	[Y1_GRAPROV] [varchar](6) NULL,
	[Y1_PEDIDO] [varchar](1) NULL,
	[Y1_GRUPCOM] [varchar](6) NULL,
	[Y1_GRAPRCP] [varchar](6) NULL,
	[Y1_ACCID] [varchar](22) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[Y1_MSBLQL] [varchar](1) NULL,
	[Y1_MSEXP] [varchar](8) NULL,
	[Y1_USERLGA] [varchar](17) NULL,
	[Y1_USERLGI] [varchar](17) NULL,
	[Y1_ZINTSRM] [varchar](1) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SY1010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYS_COMPANY]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYS_COMPANY](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[M0_CODIGO] [varchar](2) NULL,
	[M0_CODFIL] [varchar](12) NULL,
	[M0_FILIAL] [varchar](41) NULL,
	[M0_NOME] [varchar](40) NULL,
	[M0_NOMECOM] [varchar](60) NULL,
	[M0_TEL] [varchar](14) NULL,
	[M0_FAX] [varchar](14) NULL,
	[M0_EQUIP] [varchar](1) NULL,
	[M0_TPINSC] [float] NULL,
	[M0_CGC] [varchar](14) NULL,
	[M0_CEI] [varchar](14) NULL,
	[M0_INSC] [varchar](14) NULL,
	[M0_INSCM] [varchar](25) NULL,
	[M0_ENDENT] [varchar](60) NULL,
	[M0_COMPENT] [varchar](25) NULL,
	[M0_BAIRENT] [varchar](35) NULL,
	[M0_CIDENT] [varchar](60) NULL,
	[M0_ESTENT] [varchar](2) NULL,
	[M0_CEPENT] [varchar](8) NULL,
	[M0_CODMUN] [varchar](7) NULL,
	[M0_ENDCOB] [varchar](60) NULL,
	[M0_COMPCOB] [varchar](25) NULL,
	[M0_BAIRCOB] [varchar](35) NULL,
	[M0_CIDCOB] [varchar](60) NULL,
	[M0_ESTCOB] [varchar](2) NULL,
	[M0_CEPCOB] [varchar](8) NULL,
	[M0_PRODRUR] [varchar](1) NULL,
	[M0_FPAS] [varchar](4) NULL,
	[M0_NATJUR] [varchar](4) NULL,
	[M0_DTBASE] [varchar](2) NULL,
	[M0_CNAE] [varchar](7) NULL,
	[M0_ACTRAB] [varchar](8) NULL,
	[M0_NUMPROP] [float] NULL,
	[M0_MODEND] [varchar](1) NULL,
	[M0_MODINSC] [varchar](1) NULL,
	[M0_CAUSA] [varchar](1) NULL,
	[M0_INSCANT] [varchar](14) NULL,
	[M0_TPESTAB] [varchar](2) NULL,
	[M0_TEL_IMP] [varchar](22) NULL,
	[M0_FAX_IMP] [varchar](22) NULL,
	[M0_IMP_CON] [varchar](1) NULL,
	[M0_TEL_PO] [varchar](22) NULL,
	[M0_FAX_PO] [varchar](22) NULL,
	[M0_CODZOSE] [varchar](12) NULL,
	[M0_DESZOSE] [varchar](30) NULL,
	[M0_COD_ATV] [varchar](5) NULL,
	[M0_INS_SUF] [varchar](12) NULL,
	[M0_NIRE] [varchar](25) NULL,
	[M0_DTRE] [varchar](8) NULL,
	[M0_DSCCNA] [varchar](60) NULL,
	[M0_ASSPAT1] [varchar](3) NULL,
	[M0_ASSPAT2] [varchar](3) NULL,
	[M0_ASSPAT3] [varchar](3) NULL,
	[M0_RNTRC] [varchar](8) NULL,
	[M0_DTRNTRC] [varchar](8) NULL,
	[M0_SEQUENC] [varchar](10) NULL,
	[M0_DOCSEQ] [float] NULL,
	[M0_EMERGEN] [varchar](8) NULL,
	[M0_LIBMOD] [varchar](97) NULL,
	[M0_DTAUTOR] [varchar](8) NULL,
	[M0_EMPB2B] [varchar](30) NULL,
	[M0_CAIXA] [varchar](5) NULL,
	[M0_LICENSA] [varchar](64) NULL,
	[M0_CORPKEY] [varchar](16) NULL,
	[M0_CHKSUM] [float] NULL,
	[M0_DTVLD] [varchar](8) NULL,
	[M0_PSW] [varchar](8) NULL,
	[M0_CTPSW] [varchar](8) NULL,
	[M0_INTCTRL] [varchar](18) NULL,
	[M0_PSWSTRT] [varchar](31) NULL,
	[M0_CNES] [varchar](7) NULL,
	[M0_SIZEFIL] [float] NULL,
	[M0_LEIAUTE] [varchar](12) NULL,
	[M0_PICTURE] [varchar](255) NULL,
	[M0_STATUS] [varchar](1) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [bigint] NULL,
	[R_E_C_D_E_L_] [bigint] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_SYSCOMPANY] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T83010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T83010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[T83_FILIAL] [varchar](2) NULL,
	[T83_ID] [varchar](36) NULL,
	[T83_CODIGO] [varchar](2) NULL,
	[T83_CODSEC] [varchar](4) NULL,
	[T83_DESCRI] [varchar](80) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_T83010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_ACC_USER]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ACC_USER](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ID_USER] [int] NULL,
	[ID_USR_PROFILE] [int] NULL,
	[TX_USR_PASS] [varchar](300) NULL,
	[NR_USR_EMPLOYEE] [varchar](100) NULL,
	[TX_USR_NAME] [varchar](150) NULL,
	[TX_USR_ITIN] [varchar](255) NULL,
	[TX_USR_EMAIL] [varchar](255) NULL,
	[DT_USR_UPDATED] [datetime] NULL,
	[ID_USR_UPDATED_BY] [int] NULL,
	[ID_USR_STATUS] [int] NULL,
	[ID_USR_USER_OT] [int] NULL,
	[TX_USR_LOGIN] [varchar](100) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_TB_ACC_USER] UNIQUE NONCLUSTERED 
(
	[ID_USER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_DSH_DISTRIBUTION]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_DSH_DISTRIBUTION](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[id_messageIdTaskID] [varchar](30) NOT NULL,
	[DISTRIBUTION_MESSAGE_ID] [int] NULL,
	[DISTRIBUTION_MESSAGE_REF] [varchar](50) NULL,
	[DISTRIBUTION_MESSAGE_STATUS] [int] NULL,
	[DISTRIBUTION_DATA_REF] [varchar](50) NULL,
	[DISTRIBUTION_TASK_ID] [int] NULL,
	[DISTRIBUTION_TASK_STATUS] [int] NULL,
	[DISTRIBUTION_TASK_BUSINESS_UNIT_CODE] [varchar](50) NULL,
	[DISTRIBUTION_TASK_BUSINESS_UNIT_NAME] [nchar](250) NULL,
	[DISTRIBUTION_TASK_EMPLOYEE_NUMBER] [varchar](50) NULL,
	[DISTRIBUTION_TASK_EMPLOYEE_NAME] [nchar](250) NULL,
	[DISTRIBUTION_TASK_SENT_ERP_STATUS] [int] NULL,
	[DISTRIBUTION_TASK_RECEIVED_ERP_STATUS] [int] NULL,
	[MESSAGE] [varchar](max) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_requisicoesArmazem2]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_requisicoesArmazem2](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial] [varchar](2) NULL,
	[nr_requisicao] [varchar](6) NULL,
	[nr_item] [varchar](2) NULL,
	[cd_produto] [varchar](15) NULL,
	[ds_unidadeMedida] [varchar](2) NULL,
	[qt_requisicao] [float] NULL,
	[ds_segundaUnidadeMedida] [varchar](2) NULL,
	[qt_segundaRequisicao] [float] NULL,
	[dt_necessidade] [varchar](8) NULL,
	[cd_armazem] [varchar](2) NULL,
	[ds_observacao] [varchar](254) NULL,
	[cd_ordemProducao] [varchar](14) NULL,
	[cd_centroCusto] [varchar](9) NULL,
	[cd_contaContabil] [varchar](20) NULL,
	[dt_emissao] [varchar](8) NULL,
	[ds_requisicao] [varchar](100) NULL,
	[cd_solicitacao] [varchar](6) NULL,
	[cd_solicitante] [varchar](25) NULL,
	[qt_atendida] [float] NULL,
	[fl_saMarcada] [varchar](2) NULL,
	[fl_preRequisicao] [varchar](1) NULL,
	[st_requisicao] [varchar](1) NULL,
	[nr_os] [varchar](8) NULL,
	[cd_SequenciaRepairCenter] [varchar](2) NULL,
	[nr_itemContabil] [varchar](9) NULL,
	[cd_classeValor] [varchar](9) NULL,
	[fl_utilizaGerencProjeto] [varchar](1) NULL,
	[cd_usuario] [varchar](6) NULL,
	[nr_solicitacaoCompra] [varchar](6) NULL,
	[cd_itemSolicitacaoCompra] [varchar](4) NULL,
	[st_solicitacaoArmazem] [varchar](1) NULL,
	[vl_saldoBloqueio] [float] NULL,
	[cd_medidaPneu] [varchar](6) NULL,
	[vl_sulcoMinimoDesejado] [float] NULL,
	[vl_sulcoMaximoDesejado] [float] NULL,
	[cd_tipoModelo] [varchar](10) NULL,
	[nr_loteTransferencia] [varchar](6) NULL,
	[cd_rateio] [varchar](1) NULL,
	[fl_consomeEstoque] [varchar](1) NULL,
	[nr_boletim] [varchar](10) NULL,
	[vl_unitario] [float] NULL,
	[cd_EC05DB] [varchar](16) NULL,
	[cd_EC05CR] [varchar](16) NULL,
	[cd_EC06DB] [varchar](16) NULL,
	[cd_EC06CR] [varchar](16) NULL,
	[cd_EC07DB] [varchar](16) NULL,
	[cd_EC07CR] [varchar](16) NULL,
	[cd_EC08DB] [varchar](16) NULL,
	[cd_EC08CR] [varchar](16) NULL,
	[cd_EC09DB] [varchar](16) NULL,
	[cd_EC09CR] [varchar](16) NULL,
	[nr_fluig] [float] NULL,
	[fl_emergencia] [varchar](1) NULL,
	[tp_usoRip] [varchar](1) NULL,
	[dt_digitacao] [varchar](8) NULL,
	[cd_subFluig] [float] NULL,
	[cd_recno_SCP] [int] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_REG_BUSINESS_UNIT]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_REG_BUSINESS_UNIT](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ID_BUSINESS_UNIT] [int] NULL,
	[TX_BUU_CODE] [varchar](20) NULL,
	[TX_BUU_NAME] [varchar](150) NULL,
	[TX_BUU_CONTACT] [varchar](50) NULL,
	[TX_BUU_EMAIL] [varchar](50) NULL,
	[TX_BUU_TELPHONE] [varchar](20) NULL,
	[TX_BUU_CELPHONE] [varchar](20) NULL,
	[TX_BUU_ADDRESS] [varchar](255) NULL,
	[NR_BUU_NUMBER] [int] NULL,
	[TX_BUU_ADDRESS_2] [varchar](255) NULL,
	[TX_BUU_DISTRICT] [varchar](150) NULL,
	[ID_BUU_CITY] [int] NULL,
	[ID_BUU_STATE] [int] NULL,
	[ID_BUU_COUNTRY] [int] NULL,
	[TX_BUU_EIN] [varchar](255) NULL,
	[TX_BUU_ZIPCODE] [varchar](20) NULL,
	[TX_BUU_STATE_ID] [varchar](25) NULL,
	[DT_BUU_UPDATED] [datetime] NULL,
	[ID_BUU_UPDATED_BY] [int] NULL,
	[ID_BUU_STATUS] [int] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_TB_REG_BUSINESS_UNIT] UNIQUE NONCLUSTERED 
(
	[ID_BUSINESS_UNIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_REG_EMPLOYEE]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_REG_EMPLOYEE](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ID_EMPLOYEE] [int] NOT NULL,
	[NR_EMP_NUMBER] [varchar](100) NULL,
	[TX_EMP_NAME] [varchar](50) NOT NULL,
	[DT_EMP_UPDATED] [datetime] NOT NULL,
	[ID_EMP_UPDATED_BY] [int] NOT NULL,
	[ID_EMP_STATUS] [int] NOT NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_TB_REG_EMPLOYEE] UNIQUE NONCLUSTERED 
(
	[ID_EMPLOYEE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_REG_PRODUCT]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_REG_PRODUCT](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ID_PRODUCT] [int] NOT NULL,
	[TX_PRO_CODE] [varchar](200) NOT NULL,
	[ID_PRO_PRODUCT_CATEGORY] [int] NOT NULL,
	[TX_PRO_DESCRIPTION] [varchar](260) NOT NULL,
	[ID_PRO_UNIT_MEASUREMENT] [int] NOT NULL,
	[ID_PRO_TYPE] [int] NOT NULL,
	[DT_PRO_UPDATED] [datetime] NOT NULL,
	[ID_PRO_UPDATED_BY] [int] NOT NULL,
	[ID_PRO_STATUS] [int] NOT NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_TB_REG_PRODUCT] UNIQUE NONCLUSTERED 
(
	[ID_PRODUCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_REG_WAREHOUSE]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_REG_WAREHOUSE](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ID_WAREHOUSE] [int] NULL,
	[TX_WAR_CODE] [varchar](10) NULL,
	[TX_WAR_NAME] [varchar](150) NULL,
	[DT_WAR_UPDATED] [datetime] NULL,
	[ID_WAR_UPDATED_BY] [int] NULL,
	[ID_WAR_STATUS] [int] NULL,
	[ID_WAR_BUSINESS_UNIT] [int] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_TB_REG_WAREHOUSE] UNIQUE NONCLUSTERED 
(
	[ID_WAREHOUSE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_REG_WAREHOUSE_ADDRESS]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_REG_WAREHOUSE_ADDRESS](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ID_WAREHOUSE_ADDRESS] [int] NOT NULL,
	[ID_WHA_WAREHOUSE] [int] NOT NULL,
	[TX_WHA_ADDRESS] [varchar](200) NOT NULL,
	[DT_WHA_UPDATED] [datetime] NOT NULL,
	[ID_WHA_UPDATED_BY] [int] NOT NULL,
	[ID_WHA_STATUS] [int] NOT NULL,
	[TX_WHA_ADDRESS_FULL] [varchar](100) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_TB_REG_WAREHOUSE_ADDRESS] UNIQUE NONCLUSTERED 
(
	[ID_WAREHOUSE_ADDRESS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_TSK_DISTRIBUTION]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_TSK_DISTRIBUTION](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ID_DISTRIBUTION] [int] NOT NULL,
	[ID_DIS_OT_IN] [int] NOT NULL,
	[ID_DIS_BUSINESS_UNIT] [int] NOT NULL,
	[ID_DIS_EMPLOYEE] [int] NOT NULL,
	[ID_DIS_OWNER] [int] NOT NULL,
	[DT_DIS_REFERENCE_DATE] [datetime] NOT NULL,
	[DT_DIS_UPDATED] [datetime] NOT NULL,
	[ID_DIS_UPDATED_BY] [int] NOT NULL,
	[ID_DIS_STATUS] [int] NOT NULL,
	[TX_OUTSOURCING_NAME] [varchar](100) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_TB_TSK_DISTRIBUTION] UNIQUE NONCLUSTERED 
(
	[ID_DISTRIBUTION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_TSK_DISTRIBUTION_ITEM]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_TSK_DISTRIBUTION_ITEM](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ID_DISTRIBUTION_ITEM] [int] NOT NULL,
	[ID_DIT_DISTRIBUTION] [int] NOT NULL,
	[ID_DIT_PRODUCT] [int] NOT NULL,
	[ID_DIT_WAREHOUSE] [int] NOT NULL,
	[ID_DIT_WAREHOUSE_ADDRESS] [int] NOT NULL,
	[VL_DIT_QUANTITY] [decimal](18, 0) NOT NULL,
	[DT_DIT_UPDATED] [datetime] NOT NULL,
	[ID_DIT_UPDATED_BY] [int] NOT NULL,
	[ID_DIT_STATUS] [int] NOT NULL,
	[NR_DIT_CAP_NUMBER] [varchar](100) NULL,
	[NR_DIT_ASSET] [varchar](100) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_TB_TSK_DISTRIBUTION_ITEM] UNIQUE NONCLUSTERED 
(
	[ID_DISTRIBUTION_ITEM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_TSK_DISTRIBUTION_ITEM_STATUS]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_TSK_DISTRIBUTION_ITEM_STATUS](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ID_DISTRIBUTION_ITEM_STATUS] [int] NULL,
	[TX_DIS_DESCRIPTION] [varchar](100) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_TB_TSK_DISTRIBUTION_ITEM_STATUS] UNIQUE NONCLUSTERED 
(
	[ID_DISTRIBUTION_ITEM_STATUS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TM0010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TM0010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[TM0_FILIAL] [varchar](2) NOT NULL,
	[TM0_NUMFIC] [varchar](9) NOT NULL,
	[TM0_CANDID] [varchar](6) NOT NULL,
	[TM0_FILFUN] [varchar](2) NOT NULL,
	[TM0_MAT] [varchar](6) NOT NULL,
	[TM0_NUMDEP] [varchar](2) NOT NULL,
	[TM0_NOMFIC] [varchar](40) NOT NULL,
	[TM0_DTIMPL] [varchar](8) NOT NULL,
	[TM0_DOADOR] [varchar](1) NOT NULL,
	[TM0_DTDOAC] [varchar](8) NOT NULL,
	[TM0_SANGUE] [varchar](1) NOT NULL,
	[TM0_FATORH] [varchar](1) NOT NULL,
	[TM0_FICANT] [varchar](12) NOT NULL,
	[TM0_DTNASC] [varchar](8) NOT NULL,
	[TM0_SEXO] [varchar](1) NOT NULL,
	[TM0_PESO] [float] NOT NULL,
	[TM0_ALTURA] [float] NOT NULL,
	[TM0_MASSA] [varchar](20) NOT NULL,
	[TM0_ALTOLH] [float] NOT NULL,
	[TM0_LMAMIL] [float] NOT NULL,
	[TM0_ALTPUB] [float] NOT NULL,
	[TM0_ALTJOE] [float] NOT NULL,
	[TM0_ALTCOT] [float] NOT NULL,
	[TM0_TAMBRA] [float] NOT NULL,
	[TM0_TAMANT] [float] NOT NULL,
	[TM0_TAMMAO] [float] NOT NULL,
	[TM0_COMPPE] [float] NOT NULL,
	[TM0_NUMCAL] [float] NOT NULL,
	[TM0_TIPFIS] [varchar](20) NOT NULL,
	[TM0_FUMA] [varchar](1) NOT NULL,
	[TM0_QTCIG] [float] NOT NULL,
	[TM0_QTTEMP] [float] NOT NULL,
	[TM0_RG] [varchar](15) NOT NULL,
	[TM0_LOCFIC] [varchar](30) NOT NULL,
	[TM0_DESCRI] [image] NULL,
	[TM0_CODFUN] [varchar](5) NOT NULL,
	[TM0_CC] [varchar](9) NOT NULL,
	[TM0_DEPTO] [varchar](9) NOT NULL,
	[TM0_COROLH] [varchar](1) NOT NULL,
	[TM0_CORCAB] [varchar](1) NOT NULL,
	[TM0_CORPEL] [varchar](1) NOT NULL,
	[TM0_SERCP] [varchar](5) NOT NULL,
	[TM0_UFCP] [varchar](2) NOT NULL,
	[TM0_CLIENT] [varchar](6) NOT NULL,
	[TM0_LOJA] [varchar](2) NOT NULL,
	[TM0_ESTCIV] [varchar](1) NOT NULL,
	[TM0_CPF] [varchar](11) NOT NULL,
	[TM0_BITMAP] [varchar](8) NOT NULL,
	[TM0_CODCID] [varchar](8) NOT NULL,
	[TM0_TIPDEF] [varchar](1) NOT NULL,
	[TM0_INDBIO] [varchar](1) NOT NULL,
	[TM0_NUMCP] [varchar](7) NOT NULL,
	[D_E_L_E_T_] [varchar](1) NOT NULL,
	[R_E_C_N_O_] [int] NOT NULL,
	[R_E_C_D_E_L_] [int] NOT NULL,
	[TM0_CTPCD] [varchar](1) NOT NULL,
	[TM0_ZZDTPR] [varchar](8) NOT NULL,
	[TM0_REGBIO] [varbinary](1) NULL,
	[TM0_NOMSOC] [varchar](40) NOT NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_TM0010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNY010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNY010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[TNY_FILIAL] [varchar](2) NULL,
	[TNY_NUMFIC] [varchar](9) NULL,
	[TNY_DTINIC] [varchar](8) NULL,
	[TNY_HRINIC] [varchar](5) NULL,
	[TNY_DTFIM] [varchar](8) NULL,
	[TNY_HRFIM] [varchar](5) NULL,
	[TNY_GRPCID] [varchar](3) NULL,
	[TNY_CID] [varchar](8) NULL,
	[TNY_EMITEN] [varchar](12) NULL,
	[TNY_TIPAFA] [varchar](1) NULL,
	[TNY_CODAFA] [varchar](3) NULL,
	[TNY_TIPATE] [varchar](1) NULL,
	[TNY_OBSERV] [varchar](80) NULL,
	[TNY_NATEST] [varchar](10) NULL,
	[TNY_DTCONS] [varchar](8) NULL,
	[TNY_HRCONS] [varchar](5) NULL,
	[TNY_ENDERE] [varchar](30) NULL,
	[TNY_CODESP] [varchar](2) NULL,
	[TNY_CODABO] [varchar](3) NULL,
	[TNY_QTDIAS] [float] NULL,
	[TNY_DTSAID] [varchar](8) NULL,
	[TNY_DTALTA] [varchar](8) NULL,
	[TNY_DTSAI2] [varchar](8) NULL,
	[TNY_DTALT2] [varchar](8) NULL,
	[TNY_DTSAI3] [varchar](8) NULL,
	[TNY_DTALT3] [varchar](8) NULL,
	[TNY_INDMED] [varchar](1) NULL,
	[TNY_OCORRE] [varchar](1) NULL,
	[TNY_ACIDEN] [varchar](6) NULL,
	[TNY_AFRAIS] [varchar](2) NULL,
	[TNY_QTDTRA] [varchar](4) NULL,
	[TNY_ATEANT] [varchar](10) NULL,
	[TNY_USERGI] [varchar](17) NULL,
	[TNY_TPEFD] [varchar](2) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[TNY_ZFLUIG] [varchar](30) NULL,
	[TNY_COMUOK] [varchar](2) NULL,
	[TNY_ZHOJE] [varchar](8) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_TNY010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZE1010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZE1010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ZE1_FILIAL] [varchar](2) NULL,
	[ZE1_FILORI] [varchar](2) NULL,
	[ZE1_CC] [varchar](9) NULL,
	[ZE1_FILDES] [varchar](2) NULL,
	[ZE1_CODIGO] [varchar](20) NULL,
	[ZE1_ITEM] [varchar](4) NULL,
	[ZE1_FLUIG] [varchar](20) NULL,
	[ZE1_EMISSA] [varchar](8) NULL,
	[ZE1_PRODUT] [varchar](20) NULL,
	[ZE1_QUANT] [float] NULL,
	[ZE1_ATENDI] [varchar](1) NULL,
	[ZE1_EMERGE] [varchar](1) NULL,
	[ZE1_NECESS] [varchar](8) NULL,
	[ZE1_QUJE] [float] NULL,
	[ZE1_LOCAL] [varchar](2) NULL,
	[ZE1_QDTZE2] [float] NULL,
	[ZE1_QDTSC1] [float] NULL,
	[ZE1_OBSZE2] [varbinary](max) NULL,
	[ZE1_OBSSC1] [varbinary](max) NULL,
	[ZE1_STATUS] [varchar](1) NULL,
	[ZE1_SOLICI] [varchar](40) NULL,
	[ZE1_NOMESO] [varchar](50) NULL,
	[ZE1_MARK] [varchar](3) NULL,
	[ZE1_DTATU] [varchar](8) NULL,
	[ZE1_HRATU] [varchar](5) NULL,
	[ZE1_LOCALD] [varchar](2) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[ZE1_TPSOL] [varchar](1) NULL,
	[ZE1_COMPL] [varchar](200) NULL,
	[ZE1_NOS] [varchar](20) NULL,
	[ZE1_TPUSO] [varchar](1) NULL,
	[ZE1_STSWMS] [varchar](1) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
	[ZE1_STSRM] [varchar](3) NULL,
	[ZE1_SC1QTD] [float] NULL,
	[ZE1_SC7QTD] [float] NULL,
	[ZE1_SD1QCO] [float] NULL,
	[ZE1_ZE3QTD] [float] NULL,
	[ZE1_ZE3QSE] [float] NULL,
	[ZE1_NNTQTD] [float] NULL,
	[ZE1_SD2QTD] [float] NULL,
	[ZE1_SD1QPE] [float] NULL,
	[ZE1_SD1QTR] [float] NULL,
	[ZE1_SC6QTD] [float] NULL,
	[ZE1_SD3QTD] [float] NULL,
	[ZE1_DTINT] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_ZE1010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZE3010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZE3010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ZE3_FILIAL] [varchar](2) NULL,
	[ZE3_ITEM] [varchar](4) NULL,
	[ZE3_CODRQ] [varchar](20) NULL,
	[ZE3_ITEMRQ] [varchar](4) NULL,
	[ZE3_PRODUT] [varchar](20) NULL,
	[ZE3_QUANT] [float] NULL,
	[ZE3_QDESEP] [float] NULL,
	[ZE3_ORIGEM] [varchar](20) NULL,
	[ZE3_DESTIN] [varchar](20) NULL,
	[ZE3_DTSEPA] [varchar](8) NULL,
	[ZE3_USERSE] [varchar](20) NULL,
	[ZE3_OBS] [varbinary](max) NULL,
	[ZE3_LOCAL] [varchar](2) NULL,
	[ZE3_STATUS] [varchar](2) NULL,
	[ZE3_USER] [varchar](20) NULL,
	[ZE3_NUMST] [varchar](10) NULL,
	[ZE3_EMPEDI] [float] NULL,
	[ZE3_EMREQU] [float] NULL,
	[ZE3_EMTRAN] [float] NULL,
	[ZE3_IDPEDI] [varchar](25) NULL,
	[ZE3_IDSOLT] [varchar](25) NULL,
	[ZE3_IDREQU] [varchar](25) NULL,
	[ZE3_DTATEN] [varchar](8) NULL,
	[ZE3_HORAAT] [varchar](8) NULL,
	[ZE3_USUATE] [varchar](10) NULL,
	[ZE3_IDTRAN] [varchar](30) NULL,
	[ZE3_CC] [varchar](9) NULL,
	[ZE3_EMISSA] [varchar](8) NULL,
	[ZE3_LOCALD] [varchar](2) NULL,
	[ZE3_CTLREN] [varchar](1) NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [int] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_ZE3010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZNI010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZNI010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ZNI_FILIAL] [varchar](2) NOT NULL,
	[ZNI_CODMNT] [varchar](9) NOT NULL,
	[ZNI_EMISSA] [varchar](8) NOT NULL,
	[ZNI_CODVOL] [varchar](15) NOT NULL,
	[ZNI_NUMREQ] [varchar](6) NOT NULL,
	[ZNI_CC] [varchar](9) NOT NULL,
	[ZNI_ORDEXP] [varchar](9) NOT NULL,
	[ZNI_FILDES] [varchar](2) NOT NULL,
	[ZNI_STATUS] [varchar](1) NOT NULL,
	[ZNI_LOCVOL] [varchar](15) NOT NULL,
	[D_E_L_E_T_] [varchar](1) NOT NULL,
	[R_E_C_N_O_] [int] NULL,
	[R_E_C_D_E_L_] [bigint] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_ZNI010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZNJ010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZNJ010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ZNJ_FILIAL] [varchar](2) NOT NULL,
	[ZNJ_CODMNT] [varchar](9) NOT NULL,
	[ZNJ_ITEM] [varchar](4) NOT NULL,
	[ZNJ_CODPRO] [varchar](15) NOT NULL,
	[ZNJ_QTORIG] [float] NOT NULL,
	[D_E_L_E_T_] [varchar](1) NOT NULL,
	[R_E_C_N_O_] [int] NOT NULL,
	[R_E_C_D_E_L_] [int] NOT NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_ZNJ010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZNL010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZNL010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ZNL_FILIAL] [varchar](2) NOT NULL,
	[ZNL_CODMNT] [varchar](9) NOT NULL,
	[ZNL_ITEM] [varchar](4) NOT NULL,
	[ZNL_CODPRO] [varchar](15) NOT NULL,
	[ZNL_LOCAL] [varchar](2) NOT NULL,
	[ZNL_ENDERE] [varchar](15) NOT NULL,
	[ZNL_QTSEPA] [float] NOT NULL,
	[ZNL_RESERV] [varchar](6) NOT NULL,
	[D_E_L_E_T_] [varchar](1) NOT NULL,
	[R_E_C_N_O_] [int] NOT NULL,
	[R_E_C_D_E_L_] [bigint] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_ZNL010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZNM010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZNM010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ZNM_FILIAL] [varchar](2) NOT NULL,
	[ZNM_ORDEXP] [varchar](9) NOT NULL,
	[ZNM_EMISSA] [varchar](8) NOT NULL,
	[ZNM_CCUSTO] [varchar](9) NOT NULL,
	[ZNM_FILDES] [varchar](2) NOT NULL,
	[ZNM_TIPDOC] [varchar](2) NOT NULL,
	[ZNM_USRGER] [varchar](25) NOT NULL,
	[ZNM_NUMDOC] [varchar](10) NOT NULL,
	[D_E_L_E_T_] [varchar](1) NOT NULL,
	[R_E_C_N_O_] [int] NOT NULL,
	[R_E_C_D_E_L_] [bigint] NOT NULL,
	[ZNM_PEDREM] [varchar](6) NULL,
	[ZNM_TRANSP] [varchar](6) NOT NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_ZNM010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZNQ010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZNQ010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ZNQ_FILIAL] [varchar](2) NOT NULL,
	[ZNQ_CODMNT] [varchar](9) NOT NULL,
	[ZNQ_ITEM] [varchar](4) NOT NULL,
	[ZNQ_CODPRO] [varchar](15) NOT NULL,
	[ZNQ_LOCAL] [varchar](2) NOT NULL,
	[ZNQ_ENDERE] [varchar](15) NOT NULL,
	[ZNQ_TAROFT] [varchar](15) NOT NULL,
	[ZNQ_REQSEP] [varchar](20) NOT NULL,
	[ZNQ_ITREQ] [varchar](4) NOT NULL,
	[ZNQ_QTSEPA] [float] NOT NULL,
	[D_E_L_E_T_] [varchar](1) NOT NULL,
	[R_E_C_N_O_] [int] NOT NULL,
	[R_E_C_D_E_L_] [int] NOT NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [chaveUnica_ZNQ010] UNIQUE NONCLUSTERED 
(
	[R_E_C_N_O_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZX5010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZX5010](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[D_E_L_E_T_] [varchar](1) NULL,
	[R_E_C_N_O_] [bigint] NULL,
	[ZX5_TABELA] [varchar](2) NULL,
	[ZX5_CHAVE] [varchar](6) NULL,
	[ZX5_CONTEU] [varchar](50) NULL,
	[R_E_C_D_E_L_] [bigint] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Arquivos Nao Processados] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[Arquivos Nao Processados] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[Arquivos Processados] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[Arquivos Processados] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[CT2010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[CT2010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[CTT010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[CTT010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[CV0010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[CV0010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[Erros] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[Erros] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[Gestao de Bots] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[Gestao de Bots] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[LogRPA] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[LogRPA] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[Nao Processados] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[Nao Processados] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[NNR010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[NNR010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[NNS010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[NNS010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[NNT010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[NNT010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[Processados] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[Processados] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SA2010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SA2010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SB1010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SB1010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SB2010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SB2010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SB5010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SB5010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SBE010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SBE010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SBF010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SBF010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SBM010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SBM010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SC0010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SC0010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SC1010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SC1010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SC5010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SC5010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SC6010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SC7010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SC7010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SCP010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SCP010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SD1010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SD1010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SD2010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SD2010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SD3010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SD3010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SE4010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SE4010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SF1010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SF1010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SF2010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SF2010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SF4010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SF4010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SRA010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SRA010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SRB010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SRB010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SRJ010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SRJ010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[STOU_COMPETENCIA] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[STOU_COMPETENCIA] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[STOU_JSON_DATA_ponto_espelho] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[STOU_JSON_DATA_ponto_espelho] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[STOU_TEMP_DATA] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[STOU_TEMP_DATA] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SX5010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SX5010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SY1010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SY1010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[SYS_COMPANY] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[SYS_COMPANY] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[T83010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[T83010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[TB_ACC_USER] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[TB_ACC_USER] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[TB_DSH_DISTRIBUTION] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[TB_DSH_DISTRIBUTION] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[tb_fat_requisicoesArmazem2] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[tb_fat_requisicoesArmazem2] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[TB_REG_BUSINESS_UNIT] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[TB_REG_BUSINESS_UNIT] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[TB_REG_EMPLOYEE] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[TB_REG_EMPLOYEE] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[TB_REG_PRODUCT] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[TB_REG_PRODUCT] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[TB_REG_WAREHOUSE] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[TB_REG_WAREHOUSE] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[TB_REG_WAREHOUSE_ADDRESS] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[TB_REG_WAREHOUSE_ADDRESS] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[TB_TSK_DISTRIBUTION] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[TB_TSK_DISTRIBUTION] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[TB_TSK_DISTRIBUTION_ITEM] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[TB_TSK_DISTRIBUTION_ITEM] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[TB_TSK_DISTRIBUTION_ITEM_STATUS] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[TB_TSK_DISTRIBUTION_ITEM_STATUS] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[TM0010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[TM0010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[TNY010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[TNY010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[ZE1010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[ZE1010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[ZE3010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[ZE3010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[ZNI010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[ZNI010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[ZNJ010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[ZNJ010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[ZNL010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[ZNL010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[ZNM010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[ZNM010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[ZNQ010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[ZNQ010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[ZX5010] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[ZX5010] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
/****** Object:  StoredProcedure [dbo].[sp_alimentaTabelaStou_api]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

CREATE proc [dbo].[sp_alimentaTabelaStou_api]

as

declare @linhas int;
merge STOU_JSON_DATA_ponto_espelho as destino

using (

SELECT 
      [codigo]
      ,[pessoa]
      ,[matricula]
      ,[cpf]
      ,[pis]
      ,[cod_cargo]
      ,[cargo]
      ,[situ_original]
      ,[h_normais]
      ,[h_noturna]
      ,[extra_normal]
      ,[extrap100]
      ,[marcacao1]
      ,[marcacao2]
      ,[hrini_intervalo]
      ,[hrfim_intervalo]
      ,[total_calculado]
      ,[dt]
      ,[data]
      ,[cod_empresa]
      ,[empresa]
      ,[depto_conta]
      ,[departamento]
      ,[cod_centro_custo]
      ,[centro_custo]
      ,[obs]
      ,[desconto]
      ,[h_extra]
      ,[h_extra_feriado]
      ,[abona_dsr_descontar]
      ,[justificativa]
      ,[operacao_justificativa]
      ,[gerar_extra]
      ,[justificativa_qtd_aprovacao]
      ,[gerar_noturna]
      ,[justificativa_banco_horas]
      ,[extra_sab]
      ,[extra_dom]
      ,[extra_semana]
      ,[extra_folga]
      ,[h_horas_sumula60]
      ,[extra_noturna_sab]
      ,[extra_feriado]
      ,[extra_facultativo]
      ,[extra_noturna_feriado]
      ,[extra_noturna_dom]
      ,[extra_noturna_semana]
      ,[extra_noturna_folga]
      ,[horas_abonada]
      ,[sem_extra_feriado]
      ,[h_extra_noturna]
      ,[he_noturno_final_ad_noturno]
      ,[horario]
      ,[cod_horario]
      ,[tolerancia_hora_extra]
      ,[tolerancia_atraso]
      ,[tolerancia_saida]
      ,[tolerancia_refeicao]
      ,[inicio_adicional_noturno]
      ,[fim_adicional_noturno]
      ,[ad_noturno_reduzir_jornada]
      ,[carga_horaria]
      ,[extra_autorizada]
      ,[extra_excessiva]
      ,[hora_extra_autorizada]
      ,[extrap50]
      ,[extrap55]
      ,[extrap60]
      ,[extrap65]
      ,[extrap70]
      ,[extrap75]
      ,[extrap80]
      ,[extrap85]
      ,[extrap90]
      ,[extrap95]
      ,[extrap110]
      ,[extrap120]
      ,[extrap130]
      ,[extrap150]
      ,[extrap200]
      ,[extrap125]
      ,[t_h_he_menos_intervalo_a_menor]
      ,[t_h_extra_dia_ponte]
      ,[t_h_extra_facultativo]
      ,[t_h_extra_extrafolga]
      ,[t_h_sobreaviso_menos_trabalhado]
      ,[t_h_extra_menos_intervalo_a_menor]
      ,[jornadas]
      ,[h_jornada]
      ,[h_extra_semana]
      ,[h_extra_sab]
      ,[h_extra_dom]
      ,[h_extra_facultativo]
      ,[h_extra_dia_ponte]
      ,[h_extra_noturna_semana]
      ,[h_extra_noturna_sab]
      ,[h_extra_noturna_dom]
      ,[h_extra_noturna_facultativo]
      ,[h_extra_noturna_dia_ponte]
      ,[h_extra_noturna_feriado]
      ,[h_extra_noturna_folga]
      ,[h_extra_noturna_sem_reducao]
      ,[t_h_extrap100]
      ,[t_h_extra_normal]
      ,[t_h_extrapnoturna_100]
      ,[t_h_h_noturno_menos_sumula60]
      ,[marcacao3]
      ,[marcacao4]
      ,[marcacao5]
      ,[marcacao6]
      ,[marcacao7]
      ,[marcacao8]
      ,[marcacao9]
      ,[marcacao10]
      ,[marcacao11]
      ,[marcacao12]
      ,[marcacao1_alterada]
      ,[marcacao2_alterada]
      ,[marcacao3_alterada]
      ,[marcacao4_alterada]
      ,[marcacao5_alterada]
      ,[marcacao6_alterada]
      ,[marcacao7_alterada]
      ,[marcacao8_alterada]
      ,[marcacao9_alterada]
      ,[marcacao10_alterada]
      ,[marcacao11_alterada]
      ,[marcacao12_alterada]
      ,[dt_criacao]
      ,[dt_alteracao]
	  ,[page]
	  ,[depto_cc]
  FROM [dbo].[STOU_TEMP_DATA]



) origem on  
(		
	origem.codigo	= destino.codigo
)

WHEN MATCHED THEN
	UPDATE SET
	destino.[codigo]											= origem.[codigo]
	,destino.[pessoa]											= origem.[pessoa]
	,destino.[matricula]										= origem.[matricula]
	,destino.[cpf]												= origem.[cpf]
	,destino.[pis]												= origem.[pis]
	,destino.[cod_cargo]										= origem.[cod_cargo]
	,destino.[cargo]											= origem.[cargo]
	,destino.[situ_original]									= origem.[situ_original]
	,destino.[h_normais]										= origem.[h_normais]
	,destino.[h_noturna]										= origem.[h_noturna]
	,destino.[extra_normal]										= origem.[extra_normal]
	,destino.[extrap100]										= origem.[extrap100]
	,destino.[marcacao1]										= origem.[marcacao1]
	,destino.[marcacao2]										= origem.[marcacao2]
	,destino.[hrini_intervalo]									= origem.[hrini_intervalo]
	,destino.[hrfim_intervalo]									= origem.[hrfim_intervalo]
	,destino.[total_calculado]									= origem.[total_calculado]
	,destino.[dt]												= origem.[dt]
	,destino.[data]												= origem.[data]
	,destino.[cod_empresa]										= origem.[cod_empresa]
	,destino.[empresa]											= origem.[empresa]
	,destino.[depto_conta]										= origem.[depto_conta]
	,destino.[departamento]										= origem.[departamento]
	,destino.[cod_centro_custo]									= origem.[cod_centro_custo]
	,destino.[centro_custo]										= origem.[centro_custo]
	,destino.[obs]												= origem.[obs]
	,destino.[desconto]											= origem.[desconto]
	,destino.[h_extra]											= origem.[h_extra]
	,destino.[h_extra_feriado]									= origem.[h_extra_feriado]
	,destino.[abona_dsr_descontar]								= origem.[abona_dsr_descontar]
	,destino.[justificativa]									= origem.[justificativa]
	,destino.[operacao_justificativa]							= origem.[operacao_justificativa]
	,destino.[gerar_extra]										= origem.[gerar_extra]
	,destino.[justificativa_qtd_aprovacao]						= origem.[justificativa_qtd_aprovacao]
	,destino.[gerar_noturna]									= origem.[gerar_noturna]
	,destino.[justificativa_banco_horas]						= origem.[justificativa_banco_horas]
	,destino.[extra_sab]										= origem.[extra_sab]
	,destino.[extra_dom]										= origem.[extra_dom]
	,destino.[extra_semana]										= origem.[extra_semana]
	,destino.[extra_folga]										= origem.[extra_folga]
	,destino.[h_horas_sumula60]									= origem.[h_horas_sumula60]
	,destino.[extra_noturna_sab]								= origem.[extra_noturna_sab]
	,destino.[extra_feriado]									= origem.[extra_feriado]
	,destino.[extra_facultativo]								= origem.[extra_facultativo]
	,destino.[extra_noturna_feriado]							= origem.[extra_noturna_feriado]
	,destino.[extra_noturna_dom]								= origem.[extra_noturna_dom]
	,destino.[extra_noturna_semana]								= origem.[extra_noturna_semana]
	,destino.[extra_noturna_folga]								= origem.[extra_noturna_folga]
	,destino.[horas_abonada]									= origem.[horas_abonada]
	,destino.[sem_extra_feriado]								= origem.[sem_extra_feriado]
	,destino.[h_extra_noturna]									= origem.[h_extra_noturna]
	,destino.[he_noturno_final_ad_noturno]						= origem.[he_noturno_final_ad_noturno]
	,destino.[horario]											= origem.[horario]
	,destino.[cod_horario]										= origem.[cod_horario]
	,destino.[tolerancia_hora_extra]							= origem.[tolerancia_hora_extra]
	,destino.[tolerancia_atraso]								= origem.[tolerancia_atraso]
	,destino.[tolerancia_saida]									= origem.[tolerancia_saida]
	,destino.[tolerancia_refeicao]								= origem.[tolerancia_refeicao]
	,destino.[inicio_adicional_noturno]							= origem.[inicio_adicional_noturno]
	,destino.[fim_adicional_noturno]							= origem.[fim_adicional_noturno]
	,destino.[ad_noturno_reduzir_jornada]						= origem.[ad_noturno_reduzir_jornada]
	,destino.[carga_horaria]									= origem.[carga_horaria]
	,destino.[extra_autorizada]									= origem.[extra_autorizada]
	,destino.[extra_excessiva]									= origem.[extra_excessiva]
	,destino.[hora_extra_autorizada]							= origem.[hora_extra_autorizada]
	,destino.[extrap50]											= origem.[extrap50]
	,destino.[extrap55]											= origem.[extrap55]
	,destino.[extrap60]											= origem.[extrap60]
	,destino.[extrap65]											= origem.[extrap65]
	,destino.[extrap70]											= origem.[extrap70]
	,destino.[extrap75]											= origem.[extrap75]
	,destino.[extrap80]											= origem.[extrap80]
	,destino.[extrap85]											= origem.[extrap85]
	,destino.[extrap90]											= origem.[extrap90]
	,destino.[extrap95]											= origem.[extrap95]
	,destino.[extrap110]										= origem.[extrap110]
	,destino.[extrap120]										= origem.[extrap120]
	,destino.[extrap130]										= origem.[extrap130]
	,destino.[extrap150]										= origem.[extrap150]
	,destino.[extrap200]										= origem.[extrap200]
	,destino.[extrap125]										= origem.[extrap125]
	,destino.[t_h_he_menos_intervalo_a_menor]					= origem.[t_h_he_menos_intervalo_a_menor]
	,destino.[t_h_extra_dia_ponte]								= origem.[t_h_extra_dia_ponte]
	,destino.[t_h_extra_facultativo]							= origem.[t_h_extra_facultativo]
	,destino.[t_h_extra_extrafolga]								= origem.[t_h_extra_extrafolga]
	,destino.[t_h_sobreaviso_menos_trabalhado]					= origem.[t_h_sobreaviso_menos_trabalhado]
	,destino.[t_h_extra_menos_intervalo_a_menor]				= origem.[t_h_extra_menos_intervalo_a_menor]
	,destino.[jornadas]											= origem.[jornadas]
	,destino.[h_jornada]										= origem.[h_jornada]
	,destino.[h_extra_semana]									= origem.[h_extra_semana]
	,destino.[h_extra_sab]										= origem.[h_extra_sab]
	,destino.[h_extra_dom]										= origem.[h_extra_dom]
	,destino.[h_extra_facultativo]								= origem.[h_extra_facultativo]
	,destino.[h_extra_dia_ponte]								= origem.[h_extra_dia_ponte]
	,destino.[h_extra_noturna_semana]							= origem.[h_extra_noturna_semana]
	,destino.[h_extra_noturna_sab]								= origem.[h_extra_noturna_sab]
	,destino.[h_extra_noturna_dom]								= origem.[h_extra_noturna_dom]
	,destino.[h_extra_noturna_facultativo]						= origem.[h_extra_noturna_facultativo]
	,destino.[h_extra_noturna_dia_ponte]						= origem.[h_extra_noturna_dia_ponte]
	,destino.[h_extra_noturna_feriado]							= origem.[h_extra_noturna_feriado]
	,destino.[h_extra_noturna_folga]							= origem.[h_extra_noturna_folga]
	,destino.[h_extra_noturna_sem_reducao]						= origem.[h_extra_noturna_sem_reducao]
	,destino.[t_h_extrap100]									= origem.[t_h_extrap100]
	,destino.[t_h_extra_normal]									= origem.[t_h_extra_normal]
	,destino.[t_h_extrapnoturna_100]							= origem.[t_h_extrapnoturna_100]
	,destino.[t_h_h_noturno_menos_sumula60]						= origem.[t_h_h_noturno_menos_sumula60]
	,destino.[marcacao3]										= origem.[marcacao3]
	,destino.[marcacao4]										= origem.[marcacao4]
	,destino.[marcacao5]										= origem.[marcacao5]
	,destino.[marcacao6]										= origem.[marcacao6]
	,destino.[marcacao7]										= origem.[marcacao7]
	,destino.[marcacao8]										= origem.[marcacao8]
	,destino.[marcacao9]										= origem.[marcacao9]
	,destino.[marcacao10]										= origem.[marcacao10]
	,destino.[marcacao11]										= origem.[marcacao11]
	,destino.[marcacao12]										= origem.[marcacao12]
	,destino.[marcacao1_alterada]								= origem.[marcacao1_alterada]
	,destino.[marcacao2_alterada]								= origem.[marcacao2_alterada]
	,destino.[marcacao3_alterada]								= origem.[marcacao3_alterada]
	,destino.[marcacao4_alterada]								= origem.[marcacao4_alterada]
	,destino.[marcacao5_alterada]								= origem.[marcacao5_alterada]
	,destino.[marcacao6_alterada]								= origem.[marcacao6_alterada]
	,destino.[marcacao7_alterada]								= origem.[marcacao7_alterada]
	,destino.[marcacao8_alterada]								= origem.[marcacao8_alterada]
	,destino.[marcacao9_alterada]								= origem.[marcacao9_alterada]
	,destino.[marcacao10_alterada]								= origem.[marcacao10_alterada]
	,destino.[marcacao11_alterada]								= origem.[marcacao11_alterada]
	,destino.[marcacao12_alterada]								= origem.[marcacao12_alterada]
	,destino.dt_alteracao										 = getdate()
	,destino.[page]												= origem.[page]
	,destino.[depto_cc]											= origem.[depto_cc]
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		origem.[codigo]
		,origem.[pessoa]
		,origem.[matricula]
		,origem.[cpf]
		,origem.[pis]
		,origem.[cod_cargo]
		,origem.[cargo]
		,origem.[situ_original]
		,origem.[h_normais]
		,origem.[h_noturna]
		,origem.[extra_normal]
		,origem.[extrap100]
		,origem.[marcacao1]
		,origem.[marcacao2]
		,origem.[hrini_intervalo]
		,origem.[hrfim_intervalo]
		,origem.[total_calculado]
		,origem.[dt]
		,origem.[data]
		,origem.[cod_empresa]
		,origem.[empresa]
		,origem.[depto_conta]
		,origem.[departamento]
		,origem.[cod_centro_custo]
		,origem.[centro_custo]
		,origem.[obs]
		,origem.[desconto]
		,origem.[h_extra]
		,origem.[h_extra_feriado]
		,origem.[abona_dsr_descontar]
		,origem.[justificativa]
		,origem.[operacao_justificativa]
		,origem.[gerar_extra]
		,origem.[justificativa_qtd_aprovacao]
		,origem.[gerar_noturna]
		,origem.[justificativa_banco_horas]
		,origem.[extra_sab]
		,origem.[extra_dom]
		,origem.[extra_semana]
		,origem.[extra_folga]
		,origem.[h_horas_sumula60]
		,origem.[extra_noturna_sab]
		,origem.[extra_feriado]
		,origem.[extra_facultativo]
		,origem.[extra_noturna_feriado]
		,origem.[extra_noturna_dom]
		,origem.[extra_noturna_semana]
		,origem.[extra_noturna_folga]
		,origem.[horas_abonada]
		,origem.[sem_extra_feriado]
		,origem.[h_extra_noturna]
		,origem.[he_noturno_final_ad_noturno]
		,origem.[horario]
		,origem.[cod_horario]
		,origem.[tolerancia_hora_extra]
		,origem.[tolerancia_atraso]
		,origem.[tolerancia_saida]
		,origem.[tolerancia_refeicao]
		,origem.[inicio_adicional_noturno]
		,origem.[fim_adicional_noturno]
		,origem.[ad_noturno_reduzir_jornada]
		,origem.[carga_horaria]
		,origem.[extra_autorizada]
		,origem.[extra_excessiva]
		,origem.[hora_extra_autorizada]
		,origem.[extrap50]
		,origem.[extrap55]
		,origem.[extrap60]
		,origem.[extrap65]
		,origem.[extrap70]
		,origem.[extrap75]
		,origem.[extrap80]
		,origem.[extrap85]
		,origem.[extrap90]
		,origem.[extrap95]
		,origem.[extrap110]
		,origem.[extrap120]
		,origem.[extrap130]
		,origem.[extrap150]
		,origem.[extrap200]
		,origem.[extrap125]
		,origem.[t_h_he_menos_intervalo_a_menor]
		,origem.[t_h_extra_dia_ponte]
		,origem.[t_h_extra_facultativo]
		,origem.[t_h_extra_extrafolga]
		,origem.[t_h_sobreaviso_menos_trabalhado]
		,origem.[t_h_extra_menos_intervalo_a_menor]
		,origem.[jornadas]
		,origem.[h_jornada]
		,origem.[h_extra_semana]
		,origem.[h_extra_sab]
		,origem.[h_extra_dom]
		,origem.[h_extra_facultativo]
		,origem.[h_extra_dia_ponte]
		,origem.[h_extra_noturna_semana]
		,origem.[h_extra_noturna_sab]
		,origem.[h_extra_noturna_dom]
		,origem.[h_extra_noturna_facultativo]
		,origem.[h_extra_noturna_dia_ponte]
		,origem.[h_extra_noturna_feriado]
		,origem.[h_extra_noturna_folga]
		,origem.[h_extra_noturna_sem_reducao]
		,origem.[t_h_extrap100]
		,origem.[t_h_extra_normal]
		,origem.[t_h_extrapnoturna_100]
		,origem.[t_h_h_noturno_menos_sumula60]
		,origem.[marcacao3]
		,origem.[marcacao4]
		,origem.[marcacao5]
		,origem.[marcacao6]
		,origem.[marcacao7]
		,origem.[marcacao8]
		,origem.[marcacao9]
		,origem.[marcacao10]
		,origem.[marcacao11]
		,origem.[marcacao12]
		,origem.[marcacao1_alterada]
		,origem.[marcacao2_alterada]
		,origem.[marcacao3_alterada]
		,origem.[marcacao4_alterada]
		,origem.[marcacao5_alterada]
		,origem.[marcacao6_alterada]
		,origem.[marcacao7_alterada]
		,origem.[marcacao8_alterada]
		,origem.[marcacao9_alterada]
		,origem.[marcacao10_alterada]
		,origem.[marcacao11_alterada]
		,origem.[marcacao12_alterada]
		,origem.dt_criacao
		,origem.dt_alteracao
		,origem.[page]
		,origem.[depto_cc]
		);

set @linhas = @@ROWCOUNT;

return @linhas
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroArqNProcessadosRPA]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_alteraRegistroArqNProcessadosRPA]

@sk_destino int
,@ID int
,@Data_do_Email varchar(250)
,@Origem_do_Email varchar(250)
,@Data_do_processamento varchar(250)
,@Status varchar(250)
,@Mensagem_de_Erro varchar(250)

as

UPDATE [dbo].[Arquivos Nao Processados]
   SET 
		ID = @ID 
	,[Data do Email] = @Data_do_Email
	,[Origem do Email] = @Origem_do_Email 
    ,[Data do processamento] = @Data_do_processamento 
	,[Status] = @Status 
	,[Mensagem de Erro] = @Mensagem_de_Erro
	,[dt_alteracao] = getdate()
 WHERE sk_destino = @sk_destino



GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroArqProcessadosRPA]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[sp_alteraRegistroArqProcessadosRPA]

@sk_destino int
,@ID int
,@Data_do_Email varchar(250)
,@Origem_do_Email varchar(250)
,@Data_do_processamento varchar(250)
,@Arquivo_PDF varchar(250)
,@CPF varchar(250)
,@Funcionario varchar(250)
,@Status varchar(250)

as


UPDATE [dbo].[Arquivos Processados]
   SET 
		ID = @ID 
	,[Data do Email] = @Data_do_Email
	,[Origem do Email] = @Origem_do_Email 
    ,[Data do processamento] = @Data_do_processamento 
	,[Arquivo PDF]	= @Arquivo_PDF 
	,[CPF]	= @CPF 
	,[Funcionario] =	@Funcionario
	,[Status] = @Status 
	,[dt_alteracao] = getdate()
 WHERE sk_destino = @sk_destino




GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroCBA010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_alteraRegistroCBA010]
@sk_destino int
,@CBA_FILIAL	varchar(2)
,@CBA_CODINV	varchar(9)
,@CBA_ANALIS	varchar(1)
,@CBA_DATA	varchar(8)
,@CBA_CONTS	float	
,@CBA_LOCAL	varchar(2)
,@CBA_TIPINV	varchar(1)
,@CBA_LOCALI	varchar(15)
,@CBA_PROD	varchar(15)
,@CBA_CONTR	float
,@CBA_STATUS	varchar(1)
,@CBA_AUTREC	varchar(1)
,@CBA_CLASSA	varchar(1)
,@CBA_CLASSB	varchar(1)
,@CBA_CLASSC	varchar(1)
,@D_E_L_E_T_	varchar(1)	
,@R_E_C_D_E_L_	int
,@CBA_INVGUI	varchar(1)
,@CBA_RECINV	varchar(1)
,@CBA_DISPOS	varchar(1)

as

UPDATE [dbo].[CBA010]
   SET
   
		CBA_FILIAL	= @CBA_FILIAL	
		,CBA_CODINV	= @CBA_CODINV	
		,CBA_ANALIS	= @CBA_ANALIS	
		,CBA_DATA	= @CBA_DATA			
		,CBA_CONTS	= @CBA_CONTS			
		,CBA_LOCAL	= @CBA_LOCAL			
		,CBA_TIPINV	= @CBA_TIPINV	
		,CBA_LOCALI	= @CBA_LOCALI	
		,CBA_PROD	= @CBA_PROD			
		,CBA_CONTR	= @CBA_CONTR			
		,CBA_STATUS	= @CBA_STATUS	
		,CBA_AUTREC	= @CBA_AUTREC	
		,CBA_CLASSA	= @CBA_CLASSA	
		,CBA_CLASSB	= @CBA_CLASSB	
		,CBA_CLASSC	= @CBA_CLASSC	
		,D_E_L_E_T_	= @D_E_L_E_T_		
		,R_E_C_D_E_L_= @R_E_C_D_E_L_		
		,CBA_INVGUI	= @CBA_INVGUI	
		,CBA_RECINV	= @CBA_RECINV	
		,CBA_DISPOS	= @CBA_DISPOS	
		,dt_alteracao = getdate()
    
 WHERE sk_destino = @sk_destino


GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroCT2010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_alteraRegistroCT2010]

	   @sk_destino	 int
	  ,@CT2_FILIAL	 VARCHAR       (2)
      ,@CT2_DATA	 VARCHAR   (8) 
      ,@CT2_LOTE	 VARCHAR   (6)
      ,@CT2_SBLOTE	 VARCHAR   (3)
      ,@CT2_DOC		 VARCHAR    (6)
      ,@CT2_LINHA	 VARCHAR   (3) 
      ,@CT2_MOEDLC	 VARCHAR   (2)
      ,@CT2_DC		 VARCHAR   (1)
      ,@CT2_DEBITO	 VARCHAR    (20)
      ,@CT2_CREDIT	 VARCHAR    (20)
      ,@CT2_DCD		 VARCHAR    (1) 
      ,@CT2_DCC		 VARCHAR    (1) 
      ,@CT2_VALOR	 FLOAT 	   
      ,@CT2_MOEDAS	 VARCHAR    (5) 
      ,@CT2_HP		 VARCHAR    (3) 
      ,@CT2_HIST	 VARCHAR    (100)
      ,@CT2_CCD		 VARCHAR    (9) 
      ,@CT2_CCC		 VARCHAR    (9) 
      ,@CT2_ITEMD	 VARCHAR    (9) 
      ,@CT2_ITEMC	 VARCHAR    (9) 
      ,@CT2_CLVLDB	 VARCHAR    (9) 
      ,@CT2_CLVLCR	 VARCHAR    (9) 
      ,@CT2_ATIVDE	 VARCHAR    (40)
      ,@CT2_ATIVCR	 VARCHAR    (40)
      ,@CT2_EMPORI	 VARCHAR    (2) 
      ,@CT2_FILORI	 VARCHAR    (2) 
      ,@CT2_INTERC	 VARCHAR    (1) 
      ,@CT2_IDENTC	 VARCHAR    (50)
      ,@CT2_TPSALD	 VARCHAR    (1) 
      ,@CT2_SEQUEN	 VARCHAR    (10)
      ,@CT2_MANUAL	 VARCHAR    (1) 
      ,@CT2_ORIGEM	 VARCHAR    (100)
      ,@CT2_ROTINA	 VARCHAR    (10)
      ,@CT2_AGLUT	 VARCHAR    (1) 
      ,@CT2_LP		 VARCHAR    (3) 
      ,@CT2_SEQHIS	 VARCHAR    (3) 
      ,@CT2_SEQLAN	 VARCHAR    (3) 
      ,@CT2_DTVENC	 VARCHAR    (8) 
      ,@CT2_SLBASE	 VARCHAR    (1) 
      ,@CT2_DTLP	 VARCHAR    (8) 
      ,@CT2_DATATX	 VARCHAR    (8) 
      ,@CT2_TAXA	 FLOAT
      ,@CT2_VLR01	 FLOAT	   
      ,@CT2_VLR02	 FLOAT	   
      ,@CT2_VLR03	 FLOAT	   
      ,@CT2_VLR04	 FLOAT	   
      ,@CT2_VLR05	 FLOAT	   
      ,@CT2_CRCONV	 VARCHAR    (1) 
      ,@CT2_CRITER	 VARCHAR    (4) 
      ,@CT2_KEY		 VARCHAR    (200)
      ,@CT2_SEGOFI	 VARCHAR    (10)
      ,@CT2_DTCV3	 VARCHAR    (8) 
      ,@CT2_SEQIDX	 VARCHAR    (5) 
      ,@CT2_CONFST	 VARCHAR    (1) 
      ,@CT2_OBSCNF	 VARCHAR    (40)
      ,@CT2_USRCNF	 VARCHAR    (15)
      ,@CT2_DTCONF	 VARCHAR    (8) 
      ,@CT2_HRCONF	 VARCHAR    (10)
      ,@CT2_MLTSLD	 VARCHAR    (20)
      ,@CT2_CTLSLD	 VARCHAR    (1) 
      ,@CT2_CODPAR	 VARCHAR    (6) 
      ,@CT2_NODIA	 VARCHAR    (10)
      ,@CT2_DIACTB	 VARCHAR    (2) 
      ,@CT2_MOEFDB	 VARCHAR    (2) 
      ,@CT2_MOEFCR	 VARCHAR    (2) 
      ,@CT2_USERGI	 VARCHAR    (17)
      ,@CT2_USERGA	 VARCHAR    (17)
      ,@CT2_AT01DB	 VARCHAR    (20)
      ,@CT2_AT01CR	 VARCHAR    (20)
      ,@CT2_AT02DB	 VARCHAR    (20)
      ,@CT2_AT02CR	 VARCHAR    (20)
      ,@CT2_AT03DB	 VARCHAR    (20)
      ,@CT2_AT03CR	 VARCHAR    (20)
      ,@CT2_AT04DB	 VARCHAR    (20)
      ,@CT2_AT04CR	 VARCHAR    (20)
      ,@CT2_LANCSU	 VARCHAR    (3) 
      ,@CT2_GRPDIA	 VARCHAR    (3) 
      ,@CT2_LANC	 VARCHAR    (15)
      ,@CT2_CODCLI	 VARCHAR    (6) 
      ,@CT2_CODFOR	 VARCHAR    (6) 
      ,@CT2_CTRLSD	 VARCHAR    (1) 
      ,@CT2_EC05DB	 VARCHAR    (16)
      ,@CT2_EC05CR	 VARCHAR    (16)
      ,@CT2_EC06DB	 VARCHAR    (16)
      ,@CT2_EC06CR	 VARCHAR    (16)
      ,@CT2_EC07DB	 VARCHAR    (16)
      ,@CT2_EC07CR	 VARCHAR    (16)
      ,@CT2_EC08DB	 VARCHAR    (16)
      ,@CT2_EC08CR	 VARCHAR    (16)
      ,@CT2_EC09DB	 VARCHAR    (16)
      ,@CT2_EC09CR	 VARCHAR    (16)
      ,@D_E_L_E_T_	 VARCHAR    (1) 
      ,@R_E_C_N_O_	 int	   
      ,@R_E_C_D_E_L_ int	   


as



UPDATE [dbo].[CT2010]
   SET 

       [CT2_FILIAL]		= 	@CT2_FILIAL
      ,[CT2_DATA]		= 	@CT2_DATA	
      ,[CT2_LOTE]		= 	@CT2_LOTE	
      ,[CT2_SBLOTE]		= 	@CT2_SBLOTE
      ,[CT2_DOC]		= 	@CT2_DOC		
      ,[CT2_LINHA]		= 	@CT2_LINHA
      ,[CT2_MOEDLC]		= 	@CT2_MOEDLC
      ,[CT2_DC]			= 	@CT2_DC		
      ,[CT2_DEBITO]		= 	@CT2_DEBITO
      ,[CT2_CREDIT]		= 	@CT2_CREDIT
      ,[CT2_DCD]		= 	@CT2_DCD		
      ,[CT2_DCC]		= 	@CT2_DCC		
      ,[CT2_VALOR]		= 	@CT2_VALOR
      ,[CT2_MOEDAS]		= 	@CT2_MOEDAS
      ,[CT2_HP]			= 	@CT2_HP		
      ,[CT2_HIST]		= 	@CT2_HIST	
      ,[CT2_CCD]		= 	@CT2_CCD		
      ,[CT2_CCC]		= 	@CT2_CCC		
      ,[CT2_ITEMD]		= 	@CT2_ITEMD
      ,[CT2_ITEMC]		= 	@CT2_ITEMC
      ,[CT2_CLVLDB]		= 	@CT2_CLVLDB
      ,[CT2_CLVLCR]		= 	@CT2_CLVLCR
      ,[CT2_ATIVDE]		= 	@CT2_ATIVDE
      ,[CT2_ATIVCR]		= 	@CT2_ATIVCR
      ,[CT2_EMPORI]		= 	@CT2_EMPORI
      ,[CT2_FILORI]		= 	@CT2_FILORI
      ,[CT2_INTERC]		= 	@CT2_INTERC
      ,[CT2_IDENTC]		= 	@CT2_IDENTC
      ,[CT2_TPSALD]		= 	@CT2_TPSALD
      ,[CT2_SEQUEN]		= 	@CT2_SEQUEN
      ,[CT2_MANUAL]		= 	@CT2_MANUAL
      ,[CT2_ORIGEM]		= 	@CT2_ORIGEM
      ,[CT2_ROTINA]		= 	@CT2_ROTINA
      ,[CT2_AGLUT]		= 	@CT2_AGLUT
      ,[CT2_LP]			= 	@CT2_LP		
      ,[CT2_SEQHIS]		= 	@CT2_SEQHIS
      ,[CT2_SEQLAN]		= 	@CT2_SEQLAN
      ,[CT2_DTVENC]		= 	@CT2_DTVENC
      ,[CT2_SLBASE]		= 	@CT2_SLBASE
      ,[CT2_DTLP]		= 	@CT2_DTLP	
      ,[CT2_DATATX]		= 	@CT2_DATATX
      ,[CT2_TAXA]		= 	@CT2_TAXA	
      ,[CT2_VLR01]		= 	@CT2_VLR01
      ,[CT2_VLR02]		= 	@CT2_VLR02
      ,[CT2_VLR03]		= 	@CT2_VLR03
      ,[CT2_VLR04]		= 	@CT2_VLR04
      ,[CT2_VLR05]		= 	@CT2_VLR05
      ,[CT2_CRCONV]		= 	@CT2_CRCONV
      ,[CT2_CRITER]		= 	@CT2_CRITER
      ,[CT2_KEY]		= 	@CT2_KEY		
      ,[CT2_SEGOFI]		= 	@CT2_SEGOFI
      ,[CT2_DTCV3]		= 	@CT2_DTCV3
      ,[CT2_SEQIDX]		= 	@CT2_SEQIDX
      ,[CT2_CONFST]		= 	@CT2_CONFST
      ,[CT2_OBSCNF]		= 	@CT2_OBSCNF
      ,[CT2_USRCNF]		= 	@CT2_USRCNF
      ,[CT2_DTCONF]		= 	@CT2_DTCONF
      ,[CT2_HRCONF]		= 	@CT2_HRCONF
      ,[CT2_MLTSLD]		= 	@CT2_MLTSLD
      ,[CT2_CTLSLD]		= 	@CT2_CTLSLD
      ,[CT2_CODPAR]		= 	@CT2_CODPAR
      ,[CT2_NODIA]		= 	@CT2_NODIA
      ,[CT2_DIACTB]		= 	@CT2_DIACTB
      ,[CT2_MOEFDB]		= 	@CT2_MOEFDB
      ,[CT2_MOEFCR]		= 	@CT2_MOEFCR
      ,[CT2_USERGI]		= 	@CT2_USERGI
      ,[CT2_USERGA]		= 	@CT2_USERGA
      ,[CT2_AT01DB]		= 	@CT2_AT01DB
      ,[CT2_AT01CR]		= 	@CT2_AT01CR
      ,[CT2_AT02DB]		= 	@CT2_AT02DB
      ,[CT2_AT02CR]		= 	@CT2_AT02CR
      ,[CT2_AT03DB]		= 	@CT2_AT03DB
      ,[CT2_AT03CR]		= 	@CT2_AT03CR
      ,[CT2_AT04DB]		= 	@CT2_AT04DB
      ,[CT2_AT04CR]		= 	@CT2_AT04CR
      ,[CT2_LANCSU]		= 	@CT2_LANCSU
      ,[CT2_GRPDIA]		= 	@CT2_GRPDIA
      ,[CT2_LANC]		= 	@CT2_LANC	
      ,[CT2_CODCLI]		= 	@CT2_CODCLI
      ,[CT2_CODFOR]		= 	@CT2_CODFOR
      ,[CT2_CTRLSD]		= 	@CT2_CTRLSD
      ,[CT2_EC05DB]		= 	@CT2_EC05DB
      ,[CT2_EC05CR]		= 	@CT2_EC05CR
      ,[CT2_EC06DB]		= 	@CT2_EC06DB
      ,[CT2_EC06CR]		= 	@CT2_EC06CR
      ,[CT2_EC07DB]		= 	@CT2_EC07DB
      ,[CT2_EC07CR]		=	@CT2_EC07CR
      ,[CT2_EC08DB]		= 	@CT2_EC08DB
      ,[CT2_EC08CR]		= 	@CT2_EC08CR
      ,[CT2_EC09DB]		= 	@CT2_EC09DB
      ,[CT2_EC09CR]		= 	@CT2_EC09CR
      ,[D_E_L_E_T_]		= 	@D_E_L_E_T_
      ,[R_E_C_N_O_]		= 	@R_E_C_N_O_
      ,[R_E_C_D_E_L_]	= 	@R_E_C_D_E_L_
      ,[dt_alteracao]	= 	getdate()
     
 WHERE sk_destino = @sk_destino

GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroCTT010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_alteraRegistroCTT010]
@sk_destino int
,@CTT_CLASSE varchar(1)
,@CTT_NORMAL varchar(1)
,@CTT_DESC01 varchar(40)
,@CTT_DESC02 varchar(40)
,@CTT_DESC03 varchar(40)
,@CTT_DESC04 varchar(40)
,@CTT_DESC05 varchar(40)
,@CTT_BLOQ varchar(1)
,@CTT_DTBLIN varchar(8)
,@CTT_DTBLFI varchar(8)
,@CTT_DTEXIS varchar(8)
,@CTT_DTEXSF varchar(8)
,@CTT_CCLP varchar(9)
,@CTT_CCPON varchar(9)
,@CTT_BOOK varchar(20)
,@CTT_TIPO00 varchar(2)
,@CTT_CCSUP varchar(9)
,@CTT_TIPO01 varchar(2)
,@CTT_RES varchar(10)
,@CTT_CRGNV1 varchar(12)
,@CTT_RGNV2 varchar(12)
,@CTT_RGNV3 varchar(12)
,@CTT_STATUS varchar(1)
,@CTT_FILMAT varchar(2)
,@CTT_MAT varchar(6)
,@CTT_LOCAL varchar(2)
,@CTT_ITOBRG varchar(1)
,@CTT_CLOBRG varchar(1)
,@CTT_ACITEM varchar(1)
,@CTT_ACCLVL varchar(1)
,@CTT_CCVM varchar(9)
,@CTT_CCRED varchar(9)
,@CTT_OPERAC varchar(3)
,@CTT_CSINCO varchar(1)
,@CTT_ACAT01 varchar(1)
,@CTT_ACAT02 varchar(1)
,@CTT_ACAT03 varchar(1)
,@CTT_ACAT04 varchar(1)
,@CTT_ACATIV varchar(1)
,@CTT_INTRES varchar(1)
,@CTT_TPO01 varchar(2)
,@CTT_TPO02 varchar(2)
,@CTT_TPO03 varchar(2)
,@CTT_TPO04 varchar(2)
,@CTT_RESERV varchar(1)
,@CTT_AT01OB varchar(1)
,@CTT_AT02OB varchar(1)
,@CTT_AT03OB varchar(1)
,@CTT_AT04OB varchar(1)
,@CTT_ATOBRG varchar(1)
,@CTT_RHEXP varchar(6)
,@CTT_ZZMEDB varchar(16)
,@CTT_TPLOT varchar(2)
,@CTT_ZZMECR varchar(16)
,@CTT_NOME varchar(40)
,@CTT_TIPO varchar(1)
,@CTT_ZZMODB varchar(16)
,@CTT_CEI varchar(14)
,@CTT_TIPO2 varchar(1)
,@CTT_ZZMOCR varchar(16)
,@CTT_CEI2 varchar(14)
,@CTT_ENDER varchar(40)
,@CTT_ZZLODB varchar(16)
,@CTT_BAIRRO varchar(20)
,@CTT_CEP varchar(8)
,@CTT_ZZLOCR varchar(16)
,@CTT_ESTADO varchar(2)
,@CTT_CODMUN varchar(7)
,@CTT_ZZATDB varchar(16)
,@CTT_MUNIC varchar(20)
,@CTT_FPAS varchar(3)
,@CTT_ZZATCR varchar(16)
,@CTT_CODTER varchar(4)
,@CTT_PEREMP float
,@CTT_ZZLEDB varchar(16)
,@CTT_PERFPA float
,@CTT_PERCAC float
,@CTT_ZZLECR varchar(16)
,@CTT_PERRAT float
,@CTT_FAP float
,@CTT_ZZFEST varchar(4)
,@CTT_OCORRE varchar(2)
,@CTT_VALFAT float
,@CTT_ZZARM varchar(2)
,@CTT_RETIDO float
,@CTT_RECFAT varchar(1)
,@CTT_ICTPAT varchar(1)
,@CTT_CNAE varchar(9)
,@CTT_TPINCT varchar(1)
,@CTT_ZSCEAL varchar(8)
,@CTT_NRINCT varchar(14)
,@CTT_ZZOLD varchar(22)
,@CTT_TPINPR varchar(1)
,@CTT_NRINPR varchar(14)
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@CTT_ZSEGVA varchar(40)
,@CTT_ZPRINC varchar(20)
,@CTT_ZLOCOB varchar(200)
,@CTT_ZCNPJ varchar(14)
,@CTT_ZIE varchar(20)
,@CTT_ZENDOB varchar(200)
,@CTT_ZMUNOB varchar(200)
,@CTT_UFOBRA varchar(2)
,@CTT_ZIMOBR varchar(20)
,@CTT_ZBAIOB varchar(50)
,@CTT_ZCEPOB varchar(8)
,@CTT_EMAIL varchar(60)
,@CTT_CESCRI varchar(5)
,@CTT_CPART varchar(6)
,@CTT_USERGI varchar(17)
,@CTT_USERGA varchar(17)
,@CTT_ZZFLUI varchar(10)
,@CTT_ZFLBLQ varchar(10)
,@CTT_MSEXP varchar(8)
,@CTT_ZZRBME varchar(1)
,@CTT_ZZLOCL varchar(15)
,@CTT_FILIAL varchar(2)
,@CTT_CUSTO varchar(9)
,@R_E_C_D_E_L_ int 

as



UPDATE [dbo].[CTT010]
   SET 
      [CTT_CLASSE]		= @CTT_CLASSE		
      ,[CTT_NORMAL]		= @CTT_NORMAL		
      ,[CTT_DESC01]		= @CTT_DESC01		
      ,[CTT_DESC02]		= @CTT_DESC02		
      ,[CTT_DESC03]		= @CTT_DESC03		
      ,[CTT_DESC04]		= @CTT_DESC04		
      ,[CTT_DESC05]		= @CTT_DESC05		
      ,[CTT_BLOQ]		= @CTT_BLOQ		
      ,[CTT_DTBLIN]		= @CTT_DTBLIN		
      ,[CTT_DTBLFI]		= @CTT_DTBLFI		
      ,[CTT_DTEXIS]		= @CTT_DTEXIS		
      ,[CTT_DTEXSF]		= @CTT_DTEXSF		
      ,[CTT_CCLP]		= @CTT_CCLP		
      ,[CTT_CCPON]		= @CTT_CCPON		
      ,[CTT_CRGNV1]		= @CTT_CRGNV1		
      ,[CTT_STATUS]		= @CTT_STATUS		
      ,[CTT_FILMAT]		= @CTT_FILMAT		
      ,[CTT_MAT]		= @CTT_MAT		
      ,[CTT_LOCAL]		= @CTT_LOCAL		
      ,[CTT_ITOBRG]		= @CTT_ITOBRG		
      ,[CTT_CLOBRG]		= @CTT_CLOBRG		
      ,[CTT_ACITEM]		= @CTT_ACITEM		
      ,[CTT_ACCLVL]		= @CTT_ACCLVL		
      ,[CTT_CCVM]		= @CTT_CCVM		
      ,[CTT_CCRED]		= @CTT_CCRED		
      ,[CTT_OPERAC]		= @CTT_OPERAC		
      ,[CTT_CSINCO]		= @CTT_CSINCO		
      ,[CTT_ACAT01]		= @CTT_ACAT01		
      ,[CTT_ACAT02]		= @CTT_ACAT02		
      ,[CTT_ACAT03]		= @CTT_ACAT03		
      ,[CTT_ACAT04]		= @CTT_ACAT04		
      ,[CTT_ACATIV]		= @CTT_ACATIV		
      ,[CTT_INTRES]		= @CTT_INTRES		
      ,[CTT_TPO01]		= @CTT_TPO01		
      ,[CTT_TPO02]		= @CTT_TPO02		
      ,[CTT_TPO03]		= @CTT_TPO03		
      ,[CTT_TPO04]		= @CTT_TPO04		
      ,[CTT_RESERV]		= @CTT_RESERV		
      ,[CTT_AT01OB]		= @CTT_AT01OB		
      ,[CTT_AT02OB]		= @CTT_AT02OB		
      ,[CTT_AT03OB]		= @CTT_AT03OB		
      ,[CTT_AT04OB]		= @CTT_AT04OB		
      ,[CTT_ATOBRG]		= @CTT_ATOBRG		
      ,[CTT_RHEXP]		= @CTT_RHEXP		
      ,[CTT_ZZMEDB]		= @CTT_ZZMEDB		
      ,[CTT_TPLOT]		= @CTT_TPLOT		
      ,[CTT_ZZMECR]		= @CTT_ZZMECR		
      ,[CTT_NOME]		= @CTT_NOME		
      ,[CTT_TIPO]		= @CTT_TIPO		
      ,[CTT_ZZMODB]		= @CTT_ZZMODB		
      ,[CTT_CEI]		= @CTT_CEI		
      ,[CTT_TIPO2]		= @CTT_TIPO2		
      ,[CTT_ZZMOCR]		= @CTT_ZZMOCR		
      ,[CTT_CEI2]		= @CTT_CEI2		
      ,[CTT_ENDER]		= @CTT_ENDER		
      ,[CTT_ZZLODB]		= @CTT_ZZLODB		
      ,[CTT_BAIRRO]		= @CTT_BAIRRO		
      ,[CTT_CEP]		= @CTT_CEP		
      ,[CTT_ZZLOCR]		= @CTT_ZZLOCR		
      ,[CTT_ESTADO]		= @CTT_ESTADO		
      ,[CTT_CODMUN]		= @CTT_CODMUN		
      ,[CTT_ZZATDB]		= @CTT_ZZATDB		
      ,[CTT_MUNIC]		= @CTT_MUNIC		
      ,[CTT_FPAS]		= @CTT_FPAS		
      ,[CTT_ZZATCR]		= @CTT_ZZATCR		
      ,[CTT_CODTER]		= @CTT_CODTER		
      ,[CTT_PEREMP]		= @CTT_PEREMP		
      ,[CTT_ZZLEDB]		= @CTT_ZZLEDB		
      ,[CTT_PERFPA]		= @CTT_PERFPA		
      ,[CTT_PERCAC]		= @CTT_PERCAC		
      ,[CTT_ZZLECR]		= @CTT_ZZLECR		
      ,[CTT_PERRAT]		= @CTT_PERRAT		
      ,[CTT_FAP]		= @CTT_FAP		
      ,[CTT_ZZFEST]		= @CTT_ZZFEST		
      ,[CTT_OCORRE]		= @CTT_OCORRE		
      ,[CTT_VALFAT]		= @CTT_VALFAT		
      ,[CTT_ZZARM]		= @CTT_ZZARM		
      ,[CTT_RETIDO]		= @CTT_RETIDO		
      ,[CTT_RECFAT]		= @CTT_RECFAT		
      ,[CTT_ICTPAT]		= @CTT_ICTPAT		
      ,[CTT_CNAE]		= @CTT_CNAE		
      ,[CTT_TPINCT]		= @CTT_TPINCT		
      ,[CTT_ZSCEAL]		= @CTT_ZSCEAL		
      ,[CTT_NRINCT]		= @CTT_NRINCT		
      ,[CTT_ZZOLD]		= @CTT_ZZOLD		
      ,[CTT_TPINPR]		= @CTT_TPINPR		
      ,[CTT_NRINPR]		= @CTT_NRINPR		
      ,[D_E_L_E_T_]		= @D_E_L_E_T_		
      --,[R_E_C_N_O_]		= @R_E_C_N_O_		
      ,[CTT_ZSEGVA]		= @CTT_ZSEGVA		
      ,[CTT_ZPRINC]		= @CTT_ZPRINC		
      ,[CTT_ZLOCOB]		= @CTT_ZLOCOB		
      ,[CTT_ZCNPJ]		= @CTT_ZCNPJ		
      ,[CTT_ZIE]		= @CTT_ZIE		
      ,[CTT_ZENDOB]		= @CTT_ZENDOB		
      ,[CTT_ZMUNOB]		= @CTT_ZMUNOB		
      ,[CTT_UFOBRA]		= @CTT_UFOBRA		
      ,[CTT_ZIMOBR]		= @CTT_ZIMOBR		
      ,[CTT_ZBAIOB]		= @CTT_ZBAIOB		
      ,[CTT_ZCEPOB]		= @CTT_ZCEPOB		
      ,[CTT_EMAIL]		= @CTT_EMAIL		
      ,[CTT_CESCRI]		= @CTT_CESCRI		
      ,[CTT_CPART]		= @CTT_CPART		
      ,[CTT_USERGI]		= @CTT_USERGI		
      ,[CTT_USERGA]		= @CTT_USERGA		
      ,[CTT_ZZFLUI]		= @CTT_ZZFLUI		
      ,[CTT_ZFLBLQ]		= @CTT_ZFLBLQ		
      ,[CTT_MSEXP]		= @CTT_MSEXP		
      ,[CTT_ZZRBME]		= @CTT_ZZRBME		
      ,[CTT_ZZLOCL]		= @CTT_ZZLOCL		
      ,[CTT_BOOK]		= @CTT_BOOK	
      ,[CTT_TIPO00]		= @CTT_TIPO00	
      ,[CTT_CCSUP]		= @CTT_CCSUP	
      ,[CTT_TIPO01]		= @CTT_TIPO01	
      ,[CTT_RES]		= @CTT_RES	
      ,[CTT_RGNV2]		= @CTT_RGNV2	
      ,[CTT_RGNV3]		= @CTT_RGNV3	
      ,[dt_alteracao]	= getdate()
	  ,CTT_FILIAL       = @CTT_FILIAL
	  ,CTT_CUSTO		= @CTT_CUSTO
	  ,R_E_C_D_E_L_		= @R_E_C_D_E_L_
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroCV0010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[sp_alteraRegistroCV0010]
  @sk_destino int
 ,@CV0_FILIAL varchar(2)
 ,@CV0_PLANO varchar(2)
 ,@CV0_ITEM varchar(6)
 ,@CV0_CODIGO varchar(16)
 ,@CV0_DESC varchar(30)
 ,@CV0_CLASSE varchar(1)
 ,@CV0_NORMAL varchar(1)
 ,@CV0_ENTSUP varchar(15)
 ,@CV0_BLOQUE varchar(1)
 ,@CV0_DTIBLQ varchar(8)
 ,@CV0_DTFBLQ varchar(8)
 ,@CV0_DTIEXI varchar(8)
 ,@CV0_DTFEXI varchar(8)
 ,@CV0_CFGLIV varchar(3)
 ,@CV0_LUCPER varchar(15)
 ,@CV0_PONTE varchar(15)
 ,@CV0_ECVM varchar(6)
 ,@CV0_ECRED varchar(6)
 ,@CV0_ZGERFL varchar(2)
 ,@D_E_L_E_T_ varchar(1)
 ,@R_E_C_N_O_ int

output
as

UPDATE [dbo].[CV0010]
   SET 
		  CV0_FILIAL		= @CV0_FILIAL
         ,CV0_PLANO			= @CV0_PLANO
         ,CV0_ITEM			= @CV0_ITEM
         ,CV0_CODIGO		= @CV0_CODIGO
         ,CV0_DESC			= @CV0_DESC
         ,CV0_CLASSE		= @CV0_CLASSE
         ,CV0_NORMAL		= @CV0_NORMAL
         ,CV0_ENTSUP		= @CV0_ENTSUP
         ,CV0_BLOQUE		= @CV0_BLOQUE
         ,CV0_DTIBLQ		= @CV0_DTIBLQ
         ,CV0_DTFBLQ		= @CV0_DTFBLQ
         ,CV0_DTIEXI		= @CV0_DTIEXI
         ,CV0_DTFEXI		= @CV0_DTFEXI
         ,CV0_CFGLIV		= @CV0_CFGLIV
         ,CV0_LUCPER		= @CV0_LUCPER
         ,CV0_PONTE			= @CV0_PONTE
         ,CV0_ECVM			= @CV0_ECVM
         ,CV0_ECRED			= @CV0_ECRED
         ,CV0_ZGERFL		= @CV0_ZGERFL
         ,D_E_L_E_T_		= @D_E_L_E_T_
         ,dt_alteracao		= getdate()
WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroErrosRPA]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_alteraRegistroErrosRPA]

@sk_destino int
,@ID int
,@Arquivos_do_Email varchar (7000)
,@Data_do_Erro varchar(250)
,@Mensagem_de_Erro varchar(7000)
,@Data_do_Email varchar(250)


as

UPDATE [dbo].[Erros]
   SET 
		ID = @ID 
	,[Arquivos do Email] = @Arquivos_do_Email
	,[Data do Erro] = @Data_do_Erro 
    ,[Mensagem do Erro] = @Mensagem_de_Erro 
	,[Data do Email] = @Data_do_Email 
	,[dt_alteracao] = getdate()
 WHERE sk_destino = @sk_destino


GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroGestaoBotsRPA]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




  

CREATE proc [dbo].[sp_alteraRegistroGestaoBotsRPA]

@sk_destino int
,@ID int
,@Data_do_Email varchar(250)
,@Arquivos_do_Email varchar(max)
,@Pasta_de_destino_do_email varchar(250)
,@Data_do_processamento varchar(250)
,@Mover_para_processados varchar(250)
,@Remetente_do_Email varchar(250)
,@Assunto_do_Email varchar(250)
,@Ocupação varchar(250)
,@Fluig varchar(250)

as


UPDATE [dbo].[Gestao de Bots]
   SET 
		ID = @ID 
	,[Data do Email] = @Data_do_Email
	,[Arquivos do Email] = @Arquivos_do_Email 
	,[Pasta de destino do email] = @Pasta_de_destino_do_email
    ,[Data de Processamento] = @Data_do_processamento 
	,[Mover para processados] = @Mover_para_processados 
	,[Remetente do Email] = @Remetente_do_Email 
	,[Assunto do Email] = @Assunto_do_Email 
	,[Ocupação] = @Ocupação 
	,[Fluig] = @Fluig 
	,[dt_alteracao] = getdate()
 WHERE sk_destino = @sk_destino




GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroLogRPA]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_alteraRegistroLogRPA]

@sk_destino int
,@ID int
,@Clinica varchar(250)
,@Funcionario varchar(250)
,@Tarefa_Executada varchar(250)
,@Mensagem varchar(250)
,@Data_Hora varchar(250)
,@Codigo_Fluig varchar(250)


as	


UPDATE [dbo].[LogRPA]
   SET 
		ID = @ID 
	,[Nome Pasta (Clinica)] = @Clinica 
	,[Nome Pasta (Funcionario)] = @Funcionario 
    ,[Status (Nome da Tarefa Executada)] = @Tarefa_Executada 
	,[Mensagem (Detalhe da excecao)] = @Mensagem 
	,[Data/Hora] = @Data_Hora
	,[Codigo FLUIG] = @Codigo_Fluig
	,[dt_alteracao] = getdate()
 WHERE sk_destino = @sk_destino

GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroNNR010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_alteraRegistroNNR010]
@sk_destino int
,@NNR_FILIAL varchar(2)
,@NNR_CODIGO varchar(2)
,@NNR_DESCRI varchar(100)
,@NNR_CODCLI varchar(6)
,@NNR_LOJCLI varchar(2)
,@NNR_TIPO varchar(1)
,@NNR_CTRAB varchar(6)
,@NNR_INTP varchar(1)
,@NNR_MRP varchar(1)
,@NNR_ARMALT varchar(1)
,@D_E_L_E_T_ varchar(1)
,@R_E_C_D_E_L_ int
,@NNR_ANP45 varchar(1)
,@NNR_VDADMS varchar(1)
,@NNR_AMZUNI varchar(1)
,@NNR_ZZCC varchar(9)

as

UPDATE [dbo].[NNR010]
   SET [NNR_FILIAL]		= @NNR_FILIAL		 
      ,[NNR_CODIGO]		= @NNR_CODIGO		
      ,[NNR_DESCRI]		= @NNR_DESCRI		
      ,[NNR_CODCLI]		= @NNR_CODCLI		
      ,[NNR_LOJCLI]		= @NNR_LOJCLI		
      ,[NNR_TIPO]		= @NNR_TIPO		
      ,[NNR_CTRAB]		= @NNR_CTRAB		
      ,[NNR_INTP]		= @NNR_INTP		
      ,[NNR_MRP]		= @NNR_MRP		
      ,[NNR_ARMALT]		= @NNR_ARMALT		
      ,[D_E_L_E_T_]		= @D_E_L_E_T_		
      ,[R_E_C_D_E_L_]	= @R_E_C_D_E_L_	
      ,[NNR_ANP45]		= @NNR_ANP45		
      ,[NNR_VDADMS]		= @NNR_VDADMS		
      ,[NNR_AMZUNI]		= @NNR_AMZUNI		
      ,[NNR_ZZCC]		= @NNR_ZZCC		
      ,[dt_alteracao]	= getdate()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroNNS010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[sp_alteraRegistroNNS010]
@sk_destino int
,@NNS_FILIAL  varchar(2)
,@NNS_COD varchar(10)
,@NNS_DATA varchar(8)
,@NNS_SOLICT varchar(20)
,@NNS_STATUS varchar(1)
,@NNS_JUSTIF varbinary(max)
,@NNS_CLASS  varchar(1)
,@NNS_ESPECI varchar(5)
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@R_E_C_D_E_L_ int
,@NNS_ZZFLUI float
,@NNS_ZZEMER varchar(1)
,@NNS_ZDTDIG varchar(8)
,@NNS_ZZCC varchar(9)
,@NNS_ZMENPA varchar(3)
,@NNS_ZTRANS varchar(6)
,@NNS_ZPESOL float
,@NNS_ZPBRUT float
,@NNS_ZVOLUM float
,@NNS_ZESPEC varchar(10)
,@NNS_ZMENNO varbinary(max)
,@NNS_ZDATPR varchar(8)
,@NNS_ZZVEIC varchar(8)
output
as

UPDATE [dbo].[NNS010]
   SET NNS_FILIAL =  @NNS_FILIAL
      ,NNS_COD =  @NNS_COD
      ,NNS_DATA = @NNS_DATA
      ,NNS_SOLICT = @NNS_SOLICT 
      ,NNS_STATUS = @NNS_STATUS
      ,NNS_JUSTIF = @NNS_JUSTIF
      ,NNS_CLASS = @NNS_CLASS 
      ,NNS_ESPECI = @NNS_ESPECI
      ,D_E_L_E_T_ = @D_E_L_E_T_
      --,R_E_C_N_O_ = @R_E_C_N_O_
      ,R_E_C_D_E_L_ = @R_E_C_D_E_L_
      ,NNS_ZZFLUI = @NNS_ZZFLUI
      ,NNS_ZZEMER = @NNS_ZZEMER 
      ,NNS_ZDTDIG = @NNS_ZDTDIG 
      ,NNS_ZZCC = @NNS_ZZCC 
      ,NNS_ZMENPA = @NNS_ZMENPA
      ,NNS_ZTRANS = @NNS_ZTRANS
      ,NNS_ZPESOL = @NNS_ZPESOL
      ,NNS_ZPBRUT = @NNS_ZPBRUT
      ,NNS_ZVOLUM = @NNS_ZVOLUM
      ,NNS_ZESPEC = @NNS_ZESPEC
      ,NNS_ZMENNO = @NNS_ZMENNO
      ,NNS_ZDATPR = @NNS_ZDATPR
      ,NNS_ZZVEIC = @NNS_ZZVEIC
      ,dt_alteracao = getdate()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroNNT010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[sp_alteraRegistroNNT010]
@sk_destino int 
,@NNT_FILIAL varchar(2)
,@NNT_COD varchar(10)
,@NNT_FILORI varchar(2)
,@NNT_PROD varchar(15)
,@NNT_UM varchar(2)
,@NNT_LOCAL varchar(2)
,@NNT_LOCALI varchar(15)
,@NNT_NSERIE varchar(20)
,@NNT_LOTECT varchar(21)
,@NNT_NUMLOT varchar(6)
,@NNT_DTVALI varchar(8)
,@NNT_POTENC float
,@NNT_QUANT float
,@NNT_QTSEG float
,@NNT_FILDES varchar(2)
,@NNT_PRODD varchar(15)
,@NNT_UMD varchar(2)
,@NNT_LOCLD varchar(2)
,@NNT_LOCDES varchar(15)
,@NNT_LOTED varchar(21)
,@NNT_DTVALD varchar(8)
,@NNT_TS varchar(3)
,@NNT_TE varchar(3)
,@NNT_DOC varchar(9)
,@NNT_SERIE varchar(3)
,@NNT_OBS varchar(40)
,@NNT_SDOC varchar(3)
,@NNT_ZPRCVE float
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@R_E_C_D_E_L_ int

as

-- -- NNT_FILIAL, NNT_COD, NNT_FILORI, NNT_PROD, NNT_LOCAL, NNT_LOCALI, NNT_NSERIE, NNT_LOTECT, NNT_NUMLOT, NNT_FILDES, NNT_PRODD, NNT_LOCLD, NNT_LOCDES, NNT_LOTED, R_E_C_D_E_L_


UPDATE [dbo].[NNT010]
   SET [NNT_FILIAL] = @NNT_FILIAL
      ,[NNT_COD] = @NNT_COD
      ,[NNT_FILORI] = @NNT_FILORI
      ,[NNT_PROD] = @NNT_PROD
      ,[NNT_UM] = @NNT_UM
      ,[NNT_LOCAL] = @NNT_LOCAL
      ,[NNT_LOCALI] = @NNT_LOCALI
      ,[NNT_NSERIE] = @NNT_NSERIE
      ,[NNT_LOTECT] = @NNT_LOTECT
      ,[NNT_NUMLOT] = @NNT_NUMLOT
      ,[NNT_DTVALI] = @NNT_DTVALI
      ,[NNT_POTENC] = @NNT_POTENC
      ,[NNT_QUANT] =  @NNT_QUANT
      ,[NNT_QTSEG] =  @NNT_QTSEG
      ,[NNT_FILDES] = @NNT_FILDES
      ,[NNT_PRODD] = @NNT_PRODD
      ,[NNT_UMD] = @NNT_UMD
      ,[NNT_LOCLD] = @NNT_LOCLD
      ,[NNT_LOCDES] = @NNT_LOCDES
      ,[NNT_LOTED] = @NNT_LOTED
      ,[NNT_DTVALD] = @NNT_DTVALD
      ,[NNT_TS] = @NNT_TS
      ,[NNT_TE] = @NNT_TE
      ,[NNT_DOC] = @NNT_DOC
      ,[NNT_SERIE] = @NNT_SERIE
      ,[NNT_OBS] = @NNT_OBS
      ,[NNT_SDOC] = @NNT_SDOC
      ,[NNT_ZPRCVE] = @NNT_ZPRCVE
      ,[D_E_L_E_T_] = @D_E_L_E_T_
      --,[R_E_C_N_O_] = @R_E_C_N_O_
      ,[R_E_C_D_E_L_] = @R_E_C_D_E_L_
      ,[dt_alteracao] = getdate()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroNProcessadosRPA]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_alteraRegistroNProcessadosRPA]

@sk_destino int
,@ID int
,@Data_do_Email varchar(250)
,@Origem_do_Email varchar(250)
,@Data_do_processamento varchar(250)
,@Status varchar(250)
,@Mensagem_de_Erro varchar(250)

as


UPDATE [dbo].[Nao Processados]
   SET 
		ID = @ID 
	,[Data do Email] = @Data_do_Email
	,[Origem do Email] = @Origem_do_Email 
    ,[Data do processamento] = @Data_do_processamento 
	,[Status] = @Status 
	,[Mensagem de Erro] = @Mensagem_de_Erro
	,[dt_alteracao] = getdate()
 WHERE sk_destino = @sk_destino


GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroProcessadosRPA]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_alteraRegistroProcessadosRPA]

@sk_destino int
,@ID int
,@Data_do_Email varchar(250)
,@Origem_do_Email varchar(250)
,@Data_do_processamento varchar(250)
,@Arquivo_PDF varchar(250)
,@CPF varchar(250)
,@Funcionario varchar(250)
,@Status varchar(250)

as


UPDATE [dbo].[Processados]
   SET 
		ID = @ID 
	,[Data do Email] = @Data_do_Email
	,[Origem do Email] = @Origem_do_Email 
    ,[Data do processamento] = @Data_do_processamento 
	,[Arquivo PDF]	= @Arquivo_PDF 
	,[CPF]	= @CPF 
	,[Funcionario] =	@Funcionario
	,[Status] = @Status 
	,[dt_alteracao] = getdate()
 WHERE sk_destino = @sk_destino



GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSA2010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[sp_alteraRegistroSA2010]
@sk_destino int
,@A2_NOME varchar(40)
,@A2_NREDUZ varchar(20)
,@A2_END varchar(80)
,@A2_NR_END varchar(6)
,@A2_BAIRRO varchar(20)
,@A2_EST varchar(2)
,@A2_CONTPRE varchar(1)
,@A2_ESTADO varchar(20)
,@A2_COD_MUN varchar(5)
,@A2_IBGE varchar(11)
,@A2_MUN varchar(60)
,@A2_CEP varchar(8)
,@A2_TIPO varchar(1)
,@A2_CX_POST varchar(5)
,@A2_PFISICA varchar(18)
,@A2_CGC varchar(14)
,@A2_DDI varchar(6)
,@A2_DDD varchar(3)
,@A2_TEL varchar(50)
,@A2_FAX varchar(15)
,@A2_INSCR varchar(18)
,@A2_INSCRM varchar(18)
,@A2_CONTATO varchar(15)
,@A2_BANCO varchar(3)
,@A2_AGENCIA varchar(5)
,@A2_NUMCON varchar(12)
,@A2_SWIFT varchar(30)
,@A2_NATUREZ varchar(10)
,@A2_TRANSP varchar(6)
,@A2_PRIOR varchar(1)
,@A2_RISCO varchar(3)
,@A2_COND varchar(3)
,@A2_LC varchar(14)
,@A2_MATR float
,@A2_MCOMPRA float
,@A2_METR float
,@A2_MSALDO float
,@A2_NROCOM float
,@A2_PRICOM varchar(8)
,@A2_ULTCOM varchar(8)
,@A2_SALDUP float
,@A2_DESVIO float
,@A2_SALDUPM float
,@A2_CONTA varchar(20)
,@A2_TIPORUR varchar(1)
,@A2_RECISS varchar(1)
,@A2_PAIS varchar(3)
,@A2_DEPTO varchar(30)
,@A2_ID_FBFN varchar(7)
,@A2_STATUS varchar(1)
,@A2_GRUPO varchar(3)
,@A2_ATIVIDA varchar(7)
,@A2_ORIG_1 varchar(3)
,@A2_ORIG_2 varchar(3)
,@A2_ORIG_3 varchar(3)
,@A2_VINCULA varchar(1)
,@A2_REPRES varchar(52)
,@A2_REPCONT varchar(50)
,@A2_REPRTEL varchar(50)
,@A2_REPRFAX varchar(30)
,@A2_REPR_EM varchar(30)
,@A2_REPR_EN varchar(52)
,@A2_REPBAIR varchar(30)
,@A2_REPRMUN varchar(30)
,@A2_REPREST varchar(2)
,@A2_REPRCEP varchar(8)
,@A2_REPPAIS varchar(3)
,@A2_ID_REPR varchar(1)
,@A2_REPR_BA varchar(3)
,@A2_REPR_AG varchar(5)
,@A2_REPR_CO varchar(12)
,@A2_REPRCGC varchar(14)
,@A2_RET_PAI varchar(1)
,@A2_COMI_SO varchar(1)
,@A2_EMAIL varchar(60)
,@A2_HPAGE varchar(30)
,@A2_CODMUN varchar(5)
,@A2_CONTCOM varchar(15)
,@A2_FATAVA float
,@A2_FABRICA varchar(1)
,@A2_DTAVA varchar(8)
,@A2_DTVAL varchar(8)
,@A2_OK varchar(2)
,@A2_RECINSS varchar(1)
,@A2_TELEX varchar(10)
,@A2_CODPAIS varchar(5)
,@A2_TPISSRS varchar(2)
,@A2_CODLOC varchar(8)
,@A2_TPESSOA varchar(2)
,@A2_MNOTA float
,@A2_RECCIDE varchar(1)
,@A2_GRPTRIB varchar(3)
,@A2_UNFEDRP varchar(30)
,@A2_CONTAB varchar(15)
,@A2_CLIQF varchar(15)
,@A2_PLGRUPO varchar(3)
,@A2_CODBLO varchar(3)
,@A2_PAISORI varchar(20)
,@A2_ROYALTY varchar(1)
,@A2_TXTRIBU float
,@A2_B2B varchar(1)
,@A2_PLCRRES varchar(1)
,@A2_PLFIL varchar(1)
,@A2_SIGLCR varchar(7)
,@A2_CONREG varchar(10)
,@A2_DATBLO varchar(8)
,@A2_PLPEDES float
,@A2_CBO varchar(7)
,@A2_CNAE varchar(9)
,@A2_CIVIL varchar(1)
,@A2_ROYMIN float
,@A2_SATIV1 varchar(6)
,@A2_PAGAMEN varchar(1)
,@A2_ENDCOMP varchar(21)
,@A2_MSBLQL varchar(1)
,@A2_GRPDEP varchar(5)
,@A2_SUBCOD varchar(1)
,@A2_TIPAWB varchar(1)
,@A2_RECSEST varchar(1)
,@A2_FILDEB varchar(2)
,@A2_RECPIS varchar(1)
,@A2_RECCOFI varchar(1)
,@A2_RECCSLL varchar(1)
,@A2_ABICS varchar(4)
,@A2_CODFAV varchar(6)
,@A2_LOJFAV varchar(2)
,@A2_NUMDEP float
,@A2_CALCIRF varchar(1)
,@A2_VINCULO varchar(2)
,@A2_DTINIV varchar(8)
,@A2_DTFIMV varchar(8)
,@A2_CODADM varchar(3)
,@A2_RETISI varchar(1)
,@A2_ISICM varchar(1)
,@A2_INDRUR varchar(1)
,@A2_UFFIC varchar(2)
,@A2_ISSRSLC varchar(1)
,@A2_TPREG varchar(1)
,@A2_SUBCON varchar(1)
,@A2_CCICMS varchar(1)
,@A2_RFASEMT varchar(1)
,@A2_RIMAMT varchar(1)
,@A2_CTARE varchar(1)
,@A2_SITESBH varchar(1)
,@A2_INCULT varchar(1)
,@A2_TPLOGR varchar(3)
,@A2_CPOMSP varchar(1)
,@A2_IDHIST varchar(20)
,@A2_NUMRA varchar(6)
,@A2_CPFIRP varchar(11)
,@A2_PRSTSER varchar(1)
,@A2_TPRNTRC varchar(1)
,@A2_EQPTAC varchar(1)
,@A2_STRNTRC varchar(1)
,@A2_INSCMU varchar(1)
,@A2_SIMPNAC varchar(1)
,@A2_CODINSS varchar(11)
,@A2_MJURIDI varchar(1)
,@A2_RECFET varchar(1)
,@A2_RFABOV varchar(1)
,@A2_RFACS varchar(1)
,@A2_NEMPR varchar(150)
,@A2_TPCON varchar(2)
,@A2_REGESIM varchar(1)
,@A2_PAISEX varchar(3)
,@A2_NIFEX varchar(30)
,@A2_CALCINP varchar(1)
,@A2_RFUNDES varchar(1)
,@A2_CONTRIB varchar(1)
,@A2_DTNASC varchar(8)
,@A2_OCORREN varchar(2)
,@A2_CATEG varchar(2)
,@A2_CODNIT varchar(11)
,@A2_CODFI varchar(3)
,@A2_DTCONV varchar(8)
,@A2_FORMPAG varchar(2)
,@A2_TPJ varchar(1)
,@A2_RESPTRI varchar(2)
,@A2_TPCONTA varchar(1)
,@A2_IMPIP varchar(1)
,@A2_TIPCTA varchar(1)
,@A2_FOMEZER varchar(1)
,@A2_COMPLEM varchar(50)
,@A2_FRETISS varchar(1)
,@A2_LOGEX varchar(60)
,@A2_NUMEX varchar(6)
,@A2_COMPLR varchar(25)
,@A2_BAIEX varchar(20)
,@A2_BREEX varchar(3)
,@A2_TPREX varchar(3)
,@A2_TRBEX varchar(2)
,@A2_ESTEX varchar(40)
,@A2_TELRE varchar(15)
,@A2_FILTRF varchar(2)
,@A2_CGCEX varchar(14)
,@A2_DTINIR varchar(8)
,@A2_DTFIMR varchar(8)
,@A2_CIDEX varchar(40)
,@A2_POSEX varchar(10)
,@A2_MINIRF varchar(1)
,@A2_MUNSC varchar(5)
,@A2_CODSIAF varchar(4)
,@A2_RNTRC varchar(14)
,@A2_DTRNTRC varchar(8)
,@A2_ENDNOT varchar(1)
,@A2_LOCQUIT varchar(1)
,@A2_INCLTMG varchar(1)
,@A2_IRPROG varchar(1)
,@A2_TRIBFAV varchar(1)
,@A2_PAGGFE varchar(1)
,@A2_APOLICE varchar(20)
,@A2_FORNEMA varchar(1)
,@A2_DVAGE varchar(1)
,@A2_DVCTA varchar(2)
,@A2_MSBLQD varchar(8)
,@A2_CONFFIS varchar(1)
,@A2_INOVAUT varchar(1)
,@A2_NOMRESP varchar(45)
,@A2_MINPUB varchar(1)
,@A2_REGPB varchar(1)
,@A2_MOTNIF varchar(1)
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@A2_EC05DB varchar(16)
,@A2_EC05CR varchar(16)
,@A2_EC06DB varchar(16)
,@A2_EC06CR varchar(16)
,@A2_EC07DB varchar(16)
,@A2_EC07CR varchar(16)
,@A2_EC08DB varchar(16)
,@A2_EC08CR varchar(16)
,@A2_EC09DB varchar(16)
,@A2_EC09CR varchar(16)
,@A2_DIGCTA varchar(1)
,@A2_ZZOLD varchar(8)
,@A2_DESPORT varchar(1)
,@A2_CARGO varchar(40)
,@A2_DEDBSPC varchar(1)
,@A2_RECFMD varchar(1)
,@A2_ZZCTPG varchar(1)
,@A2_RIPFAVR varchar(40)
,@A2_RCICFAV varchar(14)
,@A2_NOVAGIA varchar(5)
,@A2_TPENT varchar(1)
,@A2_ZZTPFOR varchar(2)
,@A2_CLIENTE varchar(6)
,@A2_DRPEXP varchar(8)
,@A2_CPRB varchar(1)
,@A2_LOJCLI varchar(2)
,@A2_USERLGI varchar(17)
,@A2_USERLGA varchar(17)
,@A2_ZIDFLIN varchar(10)
,@A2_ZIDFLAL varchar(10)
,@A2_ZZPART varchar(1)
,@A2_GROSSIR varchar(1)
,@A2_INDCP varchar(1)
,@A2_CPFRUR varchar(11)
,@A2_MSEXP varchar(8)
,@A2_ZZTP varchar(1)
,@A2_ZINTSRM varchar(1)
,@A2_CATEFD varchar(3)
,@A2_FILIAL varchar(2)
,@A2_COD varchar(6)
,@A2_LOJA varchar(2)
,@R_E_C_D_E_L_ int
as

UPDATE [dbo].[SA2010]
   SET 
       [A2_NOME]		= @A2_NOME		
      ,[A2_NREDUZ]		= @A2_NREDUZ		
      ,[A2_END]			= @A2_END			
      ,[A2_NR_END]		= @A2_NR_END		
      ,[A2_BAIRRO]		= @A2_BAIRRO		
      ,[A2_EST]			= @A2_EST			
      ,[A2_CONTPRE]		= @A2_CONTPRE		
      ,[A2_ESTADO]		= @A2_ESTADO		
      ,[A2_COD_MUN]		= @A2_COD_MUN		
      ,[A2_IBGE]		= @A2_IBGE		
      ,[A2_MUN]			= @A2_MUN			
      ,[A2_CEP]			= @A2_CEP			
      ,[A2_TIPO]		= @A2_TIPO		
      ,[A2_CX_POST]		= @A2_CX_POST		
      ,[A2_PFISICA]		= @A2_PFISICA		
      ,[A2_CGC]			= @A2_CGC			
      ,[A2_DDI]			= @A2_DDI			
      ,[A2_DDD]			= @A2_DDD			
      ,[A2_TEL]			= @A2_TEL			
      ,[A2_FAX]			= @A2_FAX			
      ,[A2_INSCR]		= @A2_INSCR		
      ,[A2_INSCRM]		= @A2_INSCRM		
      ,[A2_CONTATO]		= @A2_CONTATO		
      ,[A2_BANCO]		= @A2_BANCO		
      ,[A2_AGENCIA]		= @A2_AGENCIA		
      ,[A2_NUMCON]		= @A2_NUMCON		
      ,[A2_SWIFT]		= @A2_SWIFT		
      ,[A2_NATUREZ]		= @A2_NATUREZ		
      ,[A2_TRANSP]		= @A2_TRANSP		
      ,[A2_PRIOR]		= @A2_PRIOR		
      ,[A2_RISCO]		= @A2_RISCO		
      ,[A2_COND]		= @A2_COND		
      ,[A2_LC]			= @A2_LC			
      ,[A2_MATR]		= @A2_MATR		
      ,[A2_MCOMPRA]		= @A2_MCOMPRA		
      ,[A2_METR]		= @A2_METR		
      ,[A2_MSALDO]		= @A2_MSALDO		
      ,[A2_NROCOM]		= @A2_NROCOM		
      ,[A2_PRICOM]		= @A2_PRICOM		
      ,[A2_ULTCOM]		= @A2_ULTCOM		
      ,[A2_SALDUP]		= @A2_SALDUP		
      ,[A2_DESVIO]		= @A2_DESVIO		
      ,[A2_SALDUPM]		= @A2_SALDUPM		
      ,[A2_CONTA]		= @A2_CONTA		
      ,[A2_TIPORUR]		= @A2_TIPORUR		
      ,[A2_RECISS]		= @A2_RECISS		
      ,[A2_PAIS]		= @A2_PAIS		
      ,[A2_DEPTO]		= @A2_DEPTO		
      ,[A2_ID_FBFN]		= @A2_ID_FBFN		
      ,[A2_STATUS]		= @A2_STATUS		
      ,[A2_GRUPO]		= @A2_GRUPO		
      ,[A2_ATIVIDA]		= @A2_ATIVIDA		
      ,[A2_ORIG_1]		= @A2_ORIG_1		
      ,[A2_ORIG_2]		= @A2_ORIG_2		
      ,[A2_ORIG_3]		= @A2_ORIG_3		
      ,[A2_VINCULA]		= @A2_VINCULA		
      ,[A2_REPRES]		= @A2_REPRES		
      ,[A2_REPCONT]		= @A2_REPCONT		
      ,[A2_REPRTEL]		= @A2_REPRTEL		
      ,[A2_REPRFAX]		= @A2_REPRFAX		
      ,[A2_REPR_EM]		= @A2_REPR_EM		
      ,[A2_REPR_EN]		= @A2_REPR_EN		
      ,[A2_REPBAIR]		= @A2_REPBAIR		
      ,[A2_REPRMUN]		= @A2_REPRMUN		
      ,[A2_REPREST]		= @A2_REPREST		
      ,[A2_REPRCEP]		= @A2_REPRCEP		
      ,[A2_REPPAIS]		= @A2_REPPAIS		
      ,[A2_ID_REPR]		= @A2_ID_REPR		
      ,[A2_REPR_BA]		= @A2_REPR_BA		
      ,[A2_REPR_AG]		= @A2_REPR_AG		
      ,[A2_REPR_CO]		= @A2_REPR_CO		
      ,[A2_REPRCGC]		= @A2_REPRCGC		
      ,[A2_RET_PAI]		= @A2_RET_PAI		
      ,[A2_COMI_SO]		= @A2_COMI_SO		
      ,[A2_EMAIL]		= @A2_EMAIL		
      ,[A2_HPAGE]		= @A2_HPAGE		
      ,[A2_CODMUN]		= @A2_CODMUN		
      ,[A2_CONTCOM]		= @A2_CONTCOM		
      ,[A2_FATAVA]		= @A2_FATAVA		
      ,[A2_FABRICA]		= @A2_FABRICA		
      ,[A2_DTAVA]		= @A2_DTAVA		
      ,[A2_DTVAL]		= @A2_DTVAL		
      ,[A2_OK]			= @A2_OK			
      ,[A2_RECINSS]		= @A2_RECINSS		
      ,[A2_TELEX]		= @A2_TELEX		
      ,[A2_CODPAIS]		= @A2_CODPAIS		
      ,[A2_TPISSRS]		= @A2_TPISSRS		
      ,[A2_CODLOC]		= @A2_CODLOC		
      ,[A2_TPESSOA]		= @A2_TPESSOA		
      ,[A2_MNOTA]		= @A2_MNOTA		
      ,[A2_RECCIDE]		= @A2_RECCIDE		
      ,[A2_GRPTRIB]		= @A2_GRPTRIB		
      ,[A2_UNFEDRP]		= @A2_UNFEDRP		
      ,[A2_CONTAB]		= @A2_CONTAB		
      ,[A2_CLIQF]		= @A2_CLIQF		
      ,[A2_PLGRUPO]		= @A2_PLGRUPO		
      ,[A2_CODBLO]		= @A2_CODBLO		
      ,[A2_PAISORI]		= @A2_PAISORI		
      ,[A2_ROYALTY]		= @A2_ROYALTY		
      ,[A2_TXTRIBU]		= @A2_TXTRIBU		
      ,[A2_B2B]			= @A2_B2B			
      ,[A2_PLCRRES]		= @A2_PLCRRES		
      ,[A2_PLFIL]		= @A2_PLFIL		
      ,[A2_SIGLCR]		= @A2_SIGLCR		
      ,[A2_CONREG]		= @A2_CONREG		
      ,[A2_DATBLO]		= @A2_DATBLO		
      ,[A2_PLPEDES]		= @A2_PLPEDES		
      ,[A2_CBO]			= @A2_CBO			
      ,[A2_CNAE]		= @A2_CNAE		
      ,[A2_CIVIL]		= @A2_CIVIL		
      ,[A2_ROYMIN]		= @A2_ROYMIN		
      ,[A2_SATIV1]		= @A2_SATIV1		
      ,[A2_PAGAMEN]		= @A2_PAGAMEN		
      ,[A2_ENDCOMP]		= @A2_ENDCOMP		
      ,[A2_MSBLQL]		= @A2_MSBLQL		
      ,[A2_GRPDEP]		= @A2_GRPDEP		
      ,[A2_SUBCOD]		= @A2_SUBCOD		
      ,[A2_TIPAWB]		= @A2_TIPAWB		
      ,[A2_RECSEST]		= @A2_RECSEST		
      ,[A2_FILDEB]		= @A2_FILDEB		
      ,[A2_RECPIS]		= @A2_RECPIS		
      ,[A2_RECCOFI]		= @A2_RECCOFI		
      ,[A2_RECCSLL]		= @A2_RECCSLL		
      ,[A2_ABICS]		= @A2_ABICS		
      ,[A2_CODFAV]		= @A2_CODFAV		
      ,[A2_LOJFAV]		= @A2_LOJFAV		
      ,[A2_NUMDEP]		= @A2_NUMDEP		
      ,[A2_CALCIRF]		= @A2_CALCIRF		
      ,[A2_VINCULO]		= @A2_VINCULO		
      ,[A2_DTINIV]		= @A2_DTINIV		
      ,[A2_DTFIMV]		= @A2_DTFIMV		
      ,[A2_CODADM]		= @A2_CODADM		
      ,[A2_RETISI]		= @A2_RETISI		
      ,[A2_ISICM]		= @A2_ISICM		
      ,[A2_INDRUR]		= @A2_INDRUR		
      ,[A2_UFFIC]		= @A2_UFFIC		
      ,[A2_ISSRSLC]		= @A2_ISSRSLC		
      ,[A2_TPREG]		= @A2_TPREG		
      ,[A2_SUBCON]		= @A2_SUBCON		
      ,[A2_CCICMS]		= @A2_CCICMS		
      ,[A2_RFASEMT]		= @A2_RFASEMT		
      ,[A2_RIMAMT]		= @A2_RIMAMT		
      ,[A2_CTARE]		= @A2_CTARE		
      ,[A2_SITESBH]		= @A2_SITESBH		
      ,[A2_INCULT]		= @A2_INCULT		
      ,[A2_TPLOGR]		= @A2_TPLOGR		
      ,[A2_CPOMSP]		= @A2_CPOMSP		
      ,[A2_IDHIST]		= @A2_IDHIST		
      ,[A2_NUMRA]		= @A2_NUMRA		
      ,[A2_CPFIRP]		= @A2_CPFIRP		
      ,[A2_PRSTSER]		= @A2_PRSTSER		
      ,[A2_TPRNTRC]		= @A2_TPRNTRC		
      ,[A2_EQPTAC]		= @A2_EQPTAC		
      ,[A2_STRNTRC]		= @A2_STRNTRC		
      ,[A2_INSCMU]		= @A2_INSCMU		
      ,[A2_SIMPNAC]		= @A2_SIMPNAC		
      ,[A2_CODINSS]		= @A2_CODINSS		
      ,[A2_MJURIDI]		= @A2_MJURIDI		
      ,[A2_RECFET]		= @A2_RECFET		
      ,[A2_RFABOV]		= @A2_RFABOV		
      ,[A2_RFACS]		= @A2_RFACS		
      ,[A2_NEMPR]		= @A2_NEMPR		
      ,[A2_TPCON]		= @A2_TPCON		
      ,[A2_REGESIM]		= @A2_REGESIM		
      ,[A2_PAISEX]		= @A2_PAISEX		
      ,[A2_NIFEX]		= @A2_NIFEX		
      ,[A2_CALCINP]		= @A2_CALCINP		
      ,[A2_RFUNDES]		= @A2_RFUNDES		
      ,[A2_CONTRIB]		= @A2_CONTRIB		
      ,[A2_DTNASC]		= @A2_DTNASC		
      ,[A2_OCORREN]		= @A2_OCORREN		
      ,[A2_CATEG]		= @A2_CATEG		
      ,[A2_CODNIT]		= @A2_CODNIT		
      ,[A2_CODFI]		= @A2_CODFI		
      ,[A2_DTCONV]		= @A2_DTCONV		
      ,[A2_FORMPAG]		= @A2_FORMPAG		
      ,[A2_TPJ]			= @A2_TPJ			
      ,[A2_RESPTRI]		= @A2_RESPTRI		
      ,[A2_TPCONTA]		= @A2_TPCONTA		
      ,[A2_IMPIP]		= @A2_IMPIP		
      ,[A2_TIPCTA]		= @A2_TIPCTA		
      ,[A2_FOMEZER]		= @A2_FOMEZER		
      ,[A2_COMPLEM]		= @A2_COMPLEM		
      ,[A2_FRETISS]		= @A2_FRETISS		
      ,[A2_LOGEX]		= @A2_LOGEX		
      ,[A2_NUMEX]		= @A2_NUMEX		
      ,[A2_COMPLR]		= @A2_COMPLR		
      ,[A2_BAIEX]		= @A2_BAIEX		
      ,[A2_BREEX]		= @A2_BREEX		
      ,[A2_TPREX]		= @A2_TPREX		
      ,[A2_TRBEX]		= @A2_TRBEX		
      ,[A2_ESTEX]		= @A2_ESTEX		
      ,[A2_TELRE]		= @A2_TELRE		
      ,[A2_FILTRF]		= @A2_FILTRF		
      ,[A2_CGCEX]		= @A2_CGCEX		
      ,[A2_DTINIR]		= @A2_DTINIR		
      ,[A2_DTFIMR]		= @A2_DTFIMR		
      ,[A2_CIDEX]		= @A2_CIDEX		
      ,[A2_POSEX]		= @A2_POSEX		
      ,[A2_MINIRF]		= @A2_MINIRF		
      ,[A2_MUNSC]		= @A2_MUNSC		
      ,[A2_CODSIAF]		= @A2_CODSIAF		
      ,[A2_RNTRC]		= @A2_RNTRC		
      ,[A2_DTRNTRC]		= @A2_DTRNTRC		
      ,[A2_ENDNOT]		= @A2_ENDNOT		
      ,[A2_LOCQUIT]		= @A2_LOCQUIT		
      ,[A2_INCLTMG]		= @A2_INCLTMG		
      ,[A2_IRPROG]		= @A2_IRPROG		
      ,[A2_TRIBFAV]		= @A2_TRIBFAV		
      ,[A2_PAGGFE]		= @A2_PAGGFE		
      ,[A2_APOLICE]		= @A2_APOLICE		
      ,[A2_FORNEMA]		= @A2_FORNEMA		
      ,[A2_DVAGE]		= @A2_DVAGE		
      ,[A2_DVCTA]		= @A2_DVCTA		
      ,[A2_MSBLQD]		= @A2_MSBLQD		
      ,[A2_CONFFIS]		= @A2_CONFFIS		
      ,[A2_INOVAUT]		= @A2_INOVAUT		
      ,[A2_NOMRESP]		= @A2_NOMRESP		
      ,[A2_MINPUB]		= @A2_MINPUB		
      ,[A2_REGPB]		= @A2_REGPB		
      ,[A2_MOTNIF]		= @A2_MOTNIF		
      ,[D_E_L_E_T_]		= @D_E_L_E_T_		
      --,[R_E_C_N_O_]		= @R_E_C_N_O_		
      ,[A2_EC05DB]		= @A2_EC05DB		
      ,[A2_EC05CR]		= @A2_EC05CR		
      ,[A2_EC06DB]		= @A2_EC06DB		
      ,[A2_EC06CR]		= @A2_EC06CR		
      ,[A2_EC07DB]		= @A2_EC07DB		
      ,[A2_EC07CR]		= @A2_EC07CR		
      ,[A2_EC08DB]		= @A2_EC08DB		
      ,[A2_EC08CR]		= @A2_EC08CR		
      ,[A2_EC09DB]		= @A2_EC09DB		
      ,[A2_EC09CR]		= @A2_EC09CR		
      ,[A2_DIGCTA]		= @A2_DIGCTA		
      ,[A2_ZZOLD]		= @A2_ZZOLD		
      ,[A2_DESPORT]		= @A2_DESPORT		
      ,[A2_CARGO]		= @A2_CARGO		
      ,[A2_DEDBSPC]		= @A2_DEDBSPC		
      ,[A2_RECFMD]		= @A2_RECFMD		
      ,[A2_ZZCTPG]		= @A2_ZZCTPG		
      ,[A2_RIPFAVR]		= @A2_RIPFAVR		
      ,[A2_RCICFAV]		= @A2_RCICFAV		
      ,[A2_NOVAGIA]		= @A2_NOVAGIA		
      ,[A2_TPENT]		= @A2_TPENT		
      ,[A2_ZZTPFOR]		= @A2_ZZTPFOR		
      ,[A2_CLIENTE]		= @A2_CLIENTE		
      ,[A2_DRPEXP]		= @A2_DRPEXP		
      ,[A2_CPRB]		= @A2_CPRB		
      ,[A2_LOJCLI]		= @A2_LOJCLI		
      ,[A2_USERLGI]		= @A2_USERLGI		
      ,[A2_USERLGA]		= @A2_USERLGA		
      ,[A2_ZIDFLIN]		= @A2_ZIDFLIN		
      ,[A2_ZIDFLAL]		= @A2_ZIDFLAL		
      ,[A2_ZZPART]		= @A2_ZZPART		
      ,[A2_GROSSIR]		= @A2_GROSSIR		
      ,[A2_INDCP]		= @A2_INDCP		
      ,[A2_CPFRUR]		= @A2_CPFRUR		
      ,[A2_MSEXP]		= @A2_MSEXP		
      ,[A2_ZZTP]		= @A2_ZZTP		
      ,[A2_ZINTSRM]		= @A2_ZINTSRM		
      ,[A2_CATEFD]		= @A2_CATEFD		
      ,[dt_alteracao]   = getdate()
	  ,A2_FILIAL		= @A2_FILIAL
	  ,A2_COD			= @A2_COD
	  ,A2_LOJA			= @A2_LOJA
	  ,R_E_C_D_E_L_		= @R_E_C_D_E_L_
 WHERE sk_destino = @sk_destino

GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSB1010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_alteraRegistroSB1010]
@sk_destino int
,@B1_DESC varchar(100)
,@B1_TIPO varchar(2)
,@B1_CODITE varchar(27)
,@B1_UM varchar(2)
,@B1_LOCPAD varchar(2)
,@B1_GRUPO varchar(4)
,@B1_PICM float
,@B1_IPI float
,@B1_POSIPI varchar(10)
,@B1_ESPECIE varchar(2)
,@B1_EX_NCM varchar(3)
,@B1_EX_NBM varchar(3)
,@B1_ALIQISS float
,@B1_CODISS varchar(9)
,@B1_TE varchar(3)
,@B1_TS varchar(3)
,@B1_PICMRET float
,@B1_PICMENT float
,@B1_IMPZFRC varchar(1)
,@B1_BITMAP varchar(20)
,@B1_SEGUM varchar(2)
,@B1_CONV float
,@B1_TIPCONV varchar(1)
,@B1_ALTER varchar(15)
,@B1_QE float
,@B1_PRV1 float
,@B1_EMIN float
,@B1_CUSTD float
,@B1_UCALSTD varchar(8)
,@B1_UPRC float
,@B1_MCUSTD varchar(1)
,@B1_UCOM varchar(8)
,@B1_PESO float
,@B1_ESTSEG float
,@B1_ESTFOR varchar(3)
,@B1_FORPRZ varchar(3)
,@B1_PE float
,@B1_TIPE varchar(1)
,@B1_LE float
,@B1_LM float
,@B1_CONTA varchar(20)
,@B1_TOLER float
,@B1_CC varchar(9)
,@B1_ITEMCC varchar(9)
,@B1_FAMILIA varchar(1)
,@B1_PROC varchar(6)
,@B1_QB float
,@B1_LOJPROC varchar(2)
,@B1_APROPRI varchar(1)
,@B1_TIPODEC varchar(1)
,@B1_ORIGEM varchar(1)
,@B1_CLASFIS varchar(2)
,@B1_FANTASM varchar(1)
,@B1_RASTRO varchar(1)
,@B1_UREV varchar(8)
,@B1_DATREF varchar(8)
,@B1_FORAEST varchar(1)
,@B1_COMIS float
,@B1_MONO varchar(1)
,@B1_PERINV float
,@B1_DTREFP1 varchar(8)
,@B1_GRTRIB varchar(6)
,@B1_MRP varchar(1)
,@B1_NOTAMIN float
,@B1_PRVALID float
,@B1_NUMCOP float
,@B1_CONINI varchar(8)
,@B1_CONTSOC varchar(1)
,@B1_IRRF varchar(1)
,@B1_CODBAR varchar(15)
,@B1_GRADE varchar(1)
,@B1_FORMLOT varchar(3)
,@B1_FPCOD varchar(10)
,@B1_LOCALIZ varchar(1)
,@B1_OPERPAD varchar(2)
,@B1_DESC_P varchar(6)
,@B1_CONTRAT varchar(1)
,@B1_DESC_I varchar(6)
,@B1_DESC_GI varchar(6)
,@B1_VLREFUS float
,@B1_IMPORT varchar(1)
,@B1_OPC varchar(80)
,@B1_ANUENTE varchar(1)
,@B1_CODOBS varchar(6)
,@B1_SITPROD varchar(2)
,@B1_FABRIC varchar(20)
,@B1_MODELO varchar(15)
,@B1_SETOR varchar(2)
,@B1_BALANCA varchar(1)
,@B1_TECLA varchar(3)
,@B1_PRODPAI varchar(15)
,@B1_TIPOCQ varchar(1)
,@B1_SOLICIT varchar(1)
,@B1_BASE3 varchar(14)
,@B1_DESBSE3 varchar(60)
,@B1_AGREGCU varchar(1)
,@B1_GRUPCOM varchar(6)
,@B1_QUADPRO varchar(1)
,@B1_DESPIMP varchar(1)
,@B1_NUMCQPR float
,@B1_CONTCQP float
,@B1_REVATU varchar(3)
,@B1_CODEMB varchar(30)
,@B1_INSS varchar(1)
,@B1_ESPECIF varchar(80)
,@B1_MAT_PRI varchar(20)
,@B1_REDINSS float
,@B1_NALNCCA varchar(7)
,@B1_ALADI varchar(3)
,@B1_NALSH varchar(8)
,@B1_REDIRRF float
,@B1_TAB_IPI varchar(2)
,@B1_GRUDES varchar(3)
,@B1_REDPIS float
,@B1_REDCOF float
,@B1_DATASUB varchar(8)
,@B1_PCSLL float
,@B1_PCOFINS float
,@B1_PPIS float
,@B1_MTBF float
,@B1_MTTR float
,@B1_FLAGSUG varchar(1)
,@B1_CLASSVE varchar(1)
,@B1_MIDIA varchar(1)
,@B1_QTMIDIA float
,@B1_VLR_IPI float
,@B1_ENVOBR varchar(1)
,@B1_SERIE varchar(20)
,@B1_FAIXAS float
,@B1_NROPAG float
,@B1_ISBN varchar(10)
,@B1_TITORIG varchar(50)
,@B1_LINGUA varchar(20)
,@B1_EDICAO varchar(3)
,@B1_OBSISBN varchar(40)
,@B1_CLVL varchar(9)
,@B1_ATIVO varchar(1)
,@B1_EMAX float
,@B1_PESBRU float
,@B1_TIPCAR varchar(6)
,@B1_FRACPER float
,@B1_INT_ICM float
,@B1_VLR_ICM float
,@B1_VLRSELO float
,@B1_CODNOR varchar(3)
,@B1_CORPRI varchar(6)
,@B1_CORSEC varchar(6)
,@B1_NICONE varchar(15)
,@B1_ATRIB1 varchar(6)
,@B1_ATRIB2 varchar(6)
,@B1_ATRIB3 varchar(6)
,@B1_REGSEQ varchar(6)
,@B1_CPOTENC varchar(1)
,@B1_POTENCI float
,@B1_QTDACUM float
,@B1_QTDINIC float
,@B1_REQUIS varchar(1)
,@B1_SELO varchar(1)
,@B1_LOTVEN float
,@B1_OK varchar(4)
,@B1_USAFEFO varchar(1)
,@B1_IAT varchar(1)
,@B1_IPPT varchar(1)
,@B1_CNATREC varchar(3)
,@B1_TNATREC varchar(4)
,@B1_AFASEMT float
,@B1_AIMAMT float
,@B1_AFUNDES float
,@B1_DCRE varchar(10)
,@B1_DCR varchar(9)
,@B1_DCRII float
,@B1_COEFDCR float
,@B1_DCI varchar(1)
,@B1_DIFCNAE varchar(11)
,@B1_GRPNATR varchar(2)
,@B1_DTFIMNT varchar(8)
,@B1_TPPROD varchar(2)
,@B1_FECP float
,@B1_MARKUP float
,@B1_DTCORTE varchar(8)
,@B1_TPREG varchar(1)
,@B1_VEREAN varchar(2)
,@B1_VIGENC varchar(8)
,@B1_CHASSI varchar(25)
,@B1_AFABOV float
,@B1_INTEG varchar(1)
,@B1_USERLGI varchar(17)
,@B1_USERLGA varchar(17)
,@B1_HREXPO varchar(8)
,@B1_CRICMS varchar(1)
,@B1_CEST varchar(9)
,@B1_GRPCST varchar(3)
,@B1_MOPC varbinary(max)
,@B1_REFBAS varchar(1)
,@B1_TIPOBN varchar(2)
,@B1_ESCRIPI varchar(1)
,@B1_UMOEC float
,@B1_UVLRC float
,@B1_PIS varchar(1)
,@B1_GCCUSTO varchar(8)
,@B1_CCCUSTO varchar(9)
,@B1_VLR_PIS float
,@B1_CLASSE varchar(6)
,@B1_PARCEI varchar(6)
,@B1_GDODIF varchar(1)
,@B1_TALLA varchar(6)
,@B1_VALEPRE varchar(1)
,@B1_FUSTF varchar(1)
,@B1_CODQAD varchar(20)
,@B1_PMACNUT float
,@B1_PMICNUT float
,@B1_MSBLQL varchar(1)
,@B1_CODPROC varchar(100)
,@B1_QBP float
,@B1_PRODSBP varchar(1)
,@B1_VLCIF float
,@B1_LOTESBP float
,@B1_AFACS float
,@B1_ALFECRN float
,@B1_ALFECST float
,@B1_CFEM varchar(1)
,@B1_CFEMA float
,@B1_CFEMS varchar(1)
,@B1_CRDPRES float
,@B1_CRICMST varchar(1)
,@B1_FECPBA float
,@B1_IDHIST varchar(20)
,@B1_AJUDIF varchar(1)
,@B1_ALFECOP float
,@B1_FECOP varchar(1)
,@B1_MEPLES varchar(1)
,@B1_MSEXP varchar(8)
,@B1_PAFMD5 varchar(32)
,@B1_REGESIM varchar(1)
,@B1_RSATIVO varchar(1)
,@B1_SITTRIB varchar(1)
,@B1_TFETHAB varchar(1)
,@B1_TPDP varchar(1)
,@B1_ALFUMAC float
,@B1_PRN944I varchar(1)
,@B1_CODLAN varchar(6)
,@B1_CARGAE varchar(1)
,@B1_TRIBMUN varchar(20)
,@B1_GARANT varchar(1)
,@B1_PERGART float
,@B1_ADMIN varchar(10)
,@B1_PR43080 float
,@B1_PRINCMG float
,@B1_RPRODEP varchar(1)
,@B1_PORCPRL varchar(2)
,@B1_IMPNCM float
,@B1_AFETHAB float
,@B1_RICM65 varchar(1)
,@B1_GRPTI varchar(4)
,@B1_PRDORI varchar(15)
,@B1_DESBSE2 varchar(60)
,@B1_BASE2 varchar(14)
,@B1_FRETISS varchar(1)
,@B1_CRDEST float
,@B1_REGRISS varchar(2)
,@B1_IVAAJU varchar(1)
,@B1_BASE varchar(14)
,@B1_TIPVEC varchar(6)
,@B1_COLOR varchar(10)
,@B1_VLR_COF float
,@B1_PRFDSUL float
,@B1_COFINS varchar(1)
,@B1_CSLL varchar(1)
,@B1_RETOPER varchar(1)
,@B1_CNAE varchar(9)
,@B1_SELOEN varchar(6)
,@B1_CODANT varchar(15)
,@B1_PRODREC varchar(1)
,@B1_FETHAB varchar(1)
,@B1_ESTRORI varchar(15)
,@B1_CALCFET varchar(1)
,@B1_PAUTFET float
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@B1_EC05DB varchar(16)
,@B1_EC05CR varchar(16)
,@B1_EC06DB varchar(16)
,@B1_EC06CR varchar(16)
,@B1_EC07DB varchar(16)
,@B1_EC07CR varchar(16)
,@B1_EC08DB varchar(16)
,@B1_EC08CR varchar(16)
,@B1_EC09DB varchar(16)
,@B1_EC09CR varchar(16)
,@B1_TERUM varchar(2)
,@B1_AFAMAD float
,@B1_ZZDEVOB varchar(1)
,@B1_ZSCEALT varchar(8)
,@B1_ZZFAMRP varchar(6)
,@B1_ZZOLD varchar(20)
,@B1_ZCONTA2 varchar(20)
,@B1_CODGTIN varchar(15)
,@B1_QTDSER varchar(1)
,@B1_ZFABRIC varchar(4)
,@B1_ZREFFAB varchar(30)
,@B1_ZPAI varchar(15)
,@B1_ZCODCH varchar(30)
,@B1_ZLOGCH varbinary(max)
,@B1_TESCUMU varchar(200)
,@B1_ZATIVCU varchar(200)
,@B1_ZTENCUM varchar(200)
,@B1_ZATVNCU varchar(200)
,@B1_ZDSCCHL varbinary(max)
,@B1_ZNATCON varchar(9)
,@B1_ZZNATAP varchar(9)
,@B1_ZCTOREX varchar(2)
,@B1_ZZDTENT varchar(17)
,@B1_FILIAL varchar(2)
,@B1_COD  varchar(15)
,@R_E_C_D_E_L_  int

as


UPDATE [dbo].[SB1010]
   SET 
       [B1_DESC]		= @B1_DESC		 
      ,[B1_TIPO]		= @B1_TIPO		
      ,[B1_CODITE]		= @B1_CODITE		
      ,[B1_UM]			= @B1_UM			
      ,[B1_LOCPAD]		= @B1_LOCPAD		
      ,[B1_GRUPO]		= @B1_GRUPO		
      ,[B1_PICM]		= @B1_PICM		
      ,[B1_IPI]			= @B1_IPI			
      ,[B1_POSIPI]		= @B1_POSIPI		
      ,[B1_ESPECIE]		= @B1_ESPECIE		
      ,[B1_EX_NCM]		= @B1_EX_NCM		
      ,[B1_EX_NBM]		= @B1_EX_NBM		
      ,[B1_ALIQISS]		= @B1_ALIQISS		
      ,[B1_CODISS]		= @B1_CODISS		
      ,[B1_TE]			= @B1_TE			
      ,[B1_TS]			= @B1_TS			
      ,[B1_PICMRET]		= @B1_PICMRET		
      ,[B1_PICMENT]		= @B1_PICMENT		
      ,[B1_IMPZFRC]		= @B1_IMPZFRC		
      ,[B1_BITMAP]		= @B1_BITMAP		
      ,[B1_SEGUM]		= @B1_SEGUM		
      ,[B1_CONV]		= @B1_CONV		
      ,[B1_TIPCONV]		= @B1_TIPCONV		
      ,[B1_ALTER]		= @B1_ALTER		
      ,[B1_QE]			= @B1_QE			
      ,[B1_PRV1]		= @B1_PRV1		
      ,[B1_EMIN]		= @B1_EMIN		
      ,[B1_CUSTD]		= @B1_CUSTD		
      ,[B1_UCALSTD]		= @B1_UCALSTD		
      ,[B1_UPRC]		= @B1_UPRC		
      ,[B1_MCUSTD]		= @B1_MCUSTD		
      ,[B1_UCOM]		= @B1_UCOM		
      ,[B1_PESO]		= @B1_PESO		
      ,[B1_ESTSEG]		= @B1_ESTSEG		
      ,[B1_ESTFOR]		= @B1_ESTFOR		
      ,[B1_FORPRZ]		= @B1_FORPRZ		
      ,[B1_PE]			= @B1_PE			
      ,[B1_TIPE]		= @B1_TIPE		
      ,[B1_LE]			= @B1_LE			
      ,[B1_LM]			= @B1_LM			
      ,[B1_CONTA]		= @B1_CONTA		
      ,[B1_TOLER]		= @B1_TOLER		
      ,[B1_CC]			= @B1_CC			
      ,[B1_ITEMCC]		= @B1_ITEMCC		
      ,[B1_FAMILIA]		= @B1_FAMILIA		
      ,[B1_PROC]		= @B1_PROC		
      ,[B1_QB]			= @B1_QB			
      ,[B1_LOJPROC]		= @B1_LOJPROC		
      ,[B1_APROPRI]		= @B1_APROPRI		
      ,[B1_TIPODEC]		= @B1_TIPODEC		
      ,[B1_ORIGEM]		= @B1_ORIGEM		
      ,[B1_CLASFIS]		= @B1_CLASFIS		
      ,[B1_FANTASM]		= @B1_FANTASM		
      ,[B1_RASTRO]		= @B1_RASTRO		
      ,[B1_UREV]		= @B1_UREV		
      ,[B1_DATREF]		= @B1_DATREF		
      ,[B1_FORAEST]		= @B1_FORAEST		
      ,[B1_COMIS]		= @B1_COMIS		
      ,[B1_MONO]		= @B1_MONO		
      ,[B1_PERINV]		= @B1_PERINV		
      ,[B1_DTREFP1]		= @B1_DTREFP1		
      ,[B1_GRTRIB]		= @B1_GRTRIB		
      ,[B1_MRP]			= @B1_MRP			
      ,[B1_NOTAMIN]		= @B1_NOTAMIN		
      ,[B1_PRVALID]		= @B1_PRVALID		
      ,[B1_NUMCOP]		= @B1_NUMCOP		
      ,[B1_CONINI]		= @B1_CONINI		
      ,[B1_CONTSOC]		= @B1_CONTSOC		
      ,[B1_IRRF]		= @B1_IRRF		
      ,[B1_CODBAR]		= @B1_CODBAR		
      ,[B1_GRADE]		= @B1_GRADE		
      ,[B1_FORMLOT]		= @B1_FORMLOT		
      ,[B1_FPCOD]		= @B1_FPCOD		
      ,[B1_LOCALIZ]		= @B1_LOCALIZ		
      ,[B1_OPERPAD]		= @B1_OPERPAD		
      ,[B1_DESC_P]		= @B1_DESC_P		
      ,[B1_CONTRAT]		= @B1_CONTRAT		
      ,[B1_DESC_I]		= @B1_DESC_I		
      ,[B1_DESC_GI]		= @B1_DESC_GI		
      ,[B1_VLREFUS]		= @B1_VLREFUS		
      ,[B1_IMPORT]		= @B1_IMPORT		
      ,[B1_OPC]			= @B1_OPC			
      ,[B1_ANUENTE]		= @B1_ANUENTE		
      ,[B1_CODOBS]		= @B1_CODOBS		
      ,[B1_SITPROD]		= @B1_SITPROD		
      ,[B1_FABRIC]		= @B1_FABRIC		
      ,[B1_MODELO]		= @B1_MODELO		
      ,[B1_SETOR]		= @B1_SETOR		
      ,[B1_BALANCA]		= @B1_BALANCA		
      ,[B1_TECLA]		= @B1_TECLA		
      ,[B1_PRODPAI]		= @B1_PRODPAI		
      ,[B1_TIPOCQ]		= @B1_TIPOCQ		
      ,[B1_SOLICIT]		= @B1_SOLICIT		
      ,[B1_BASE3]		= @B1_BASE3		
      ,[B1_DESBSE3]		= @B1_DESBSE3		
      ,[B1_AGREGCU]		= @B1_AGREGCU		
      ,[B1_GRUPCOM]		= @B1_GRUPCOM		
      ,[B1_QUADPRO]		= @B1_QUADPRO		
      ,[B1_DESPIMP]		= @B1_DESPIMP		
      ,[B1_NUMCQPR]		= @B1_NUMCQPR		
      ,[B1_CONTCQP]		= @B1_CONTCQP		
      ,[B1_REVATU]		= @B1_REVATU		
      ,[B1_CODEMB]		= @B1_CODEMB		
      ,[B1_INSS]		= @B1_INSS		
      ,[B1_ESPECIF]		= @B1_ESPECIF		
      ,[B1_MAT_PRI]		= @B1_MAT_PRI		
      ,[B1_REDINSS]		= @B1_REDINSS		
      ,[B1_NALNCCA]		= @B1_NALNCCA		
      ,[B1_ALADI]		= @B1_ALADI		
      ,[B1_NALSH]		= @B1_NALSH		
      ,[B1_REDIRRF]		= @B1_REDIRRF		
      ,[B1_TAB_IPI]		= @B1_TAB_IPI		
      ,[B1_GRUDES]		= @B1_GRUDES		
      ,[B1_REDPIS]		= @B1_REDPIS		
      ,[B1_REDCOF]		= @B1_REDCOF		
      ,[B1_DATASUB]		= @B1_DATASUB		
      ,[B1_PCSLL]		= @B1_PCSLL		
      ,[B1_PCOFINS]		= @B1_PCOFINS		
      ,[B1_PPIS]		= @B1_PPIS		
      ,[B1_MTBF]		= @B1_MTBF		
      ,[B1_MTTR]		= @B1_MTTR		
      ,[B1_FLAGSUG]		= @B1_FLAGSUG		
      ,[B1_CLASSVE]		= @B1_CLASSVE		
      ,[B1_MIDIA]		= @B1_MIDIA		
      ,[B1_QTMIDIA]		= @B1_QTMIDIA		
      ,[B1_VLR_IPI]		= @B1_VLR_IPI		
      ,[B1_ENVOBR]		= @B1_ENVOBR		
      ,[B1_SERIE]		= @B1_SERIE		
      ,[B1_FAIXAS]		= @B1_FAIXAS		
      ,[B1_NROPAG]		= @B1_NROPAG		
      ,[B1_ISBN]		= @B1_ISBN		
      ,[B1_TITORIG]		= @B1_TITORIG		
      ,[B1_LINGUA]		= @B1_LINGUA		
      ,[B1_EDICAO]		= @B1_EDICAO		
      ,[B1_OBSISBN]		= @B1_OBSISBN		
      ,[B1_CLVL]		= @B1_CLVL		
      ,[B1_ATIVO]		= @B1_ATIVO		
      ,[B1_EMAX]		= @B1_EMAX		
      ,[B1_PESBRU]		= @B1_PESBRU		
      ,[B1_TIPCAR]		= @B1_TIPCAR		
      ,[B1_FRACPER]		= @B1_FRACPER		
      ,[B1_INT_ICM]		= @B1_INT_ICM		
      ,[B1_VLR_ICM]		= @B1_VLR_ICM		
      ,[B1_VLRSELO]		= @B1_VLRSELO		
      ,[B1_CODNOR]		= @B1_CODNOR		
      ,[B1_CORPRI]		= @B1_CORPRI		
      ,[B1_CORSEC]		= @B1_CORSEC		
      ,[B1_NICONE]		= @B1_NICONE		
      ,[B1_ATRIB1]		= @B1_ATRIB1		
      ,[B1_ATRIB2]		= @B1_ATRIB2		
      ,[B1_ATRIB3]		= @B1_ATRIB3		
      ,[B1_REGSEQ]		= @B1_REGSEQ		
      ,[B1_CPOTENC]		= @B1_CPOTENC		
      ,[B1_POTENCI]		= @B1_POTENCI		
      ,[B1_QTDACUM]		= @B1_QTDACUM		
      ,[B1_QTDINIC]		= @B1_QTDINIC		
      ,[B1_REQUIS]		= @B1_REQUIS		
      ,[B1_SELO]		= @B1_SELO		
      ,[B1_LOTVEN]		= @B1_LOTVEN		
      ,[B1_OK]			= @B1_OK			
      ,[B1_USAFEFO]		= @B1_USAFEFO		
      ,[B1_IAT]			= @B1_IAT			
      ,[B1_IPPT]		= @B1_IPPT		
      ,[B1_CNATREC]		= @B1_CNATREC		
      ,[B1_TNATREC]		= @B1_TNATREC		
      ,[B1_AFASEMT]		= @B1_AFASEMT		
      ,[B1_AIMAMT]		= @B1_AIMAMT		
      ,[B1_AFUNDES]		= @B1_AFUNDES		
      ,[B1_DCRE]		= @B1_DCRE		
      ,[B1_DCR]			= @B1_DCR			
      ,[B1_DCRII]		= @B1_DCRII		
      ,[B1_COEFDCR]		= @B1_COEFDCR		
      ,[B1_DCI]			= @B1_DCI			
      ,[B1_DIFCNAE]		= @B1_DIFCNAE		
      ,[B1_GRPNATR]		= @B1_GRPNATR		
      ,[B1_DTFIMNT]		= @B1_DTFIMNT		
      ,[B1_TPPROD]		= @B1_TPPROD		
      ,[B1_FECP]		= @B1_FECP		
      ,[B1_MARKUP]		= @B1_MARKUP		
      ,[B1_DTCORTE]		= @B1_DTCORTE		
      ,[B1_TPREG]		= @B1_TPREG		
      ,[B1_VEREAN]		= @B1_VEREAN		
      ,[B1_VIGENC]		= @B1_VIGENC		
      ,[B1_CHASSI]		= @B1_CHASSI		
      ,[B1_AFABOV]		= @B1_AFABOV		
      ,[B1_INTEG]		= @B1_INTEG		
      ,[B1_USERLGI]		= @B1_USERLGI		
      ,[B1_USERLGA]		= @B1_USERLGA		
      ,[B1_HREXPO]		= @B1_HREXPO		
      ,[B1_CRICMS]		= @B1_CRICMS		
      ,[B1_CEST]		= @B1_CEST		
      ,[B1_GRPCST]		= @B1_GRPCST		
      ,[B1_MOPC]		= @B1_MOPC		
      ,[B1_REFBAS]		= @B1_REFBAS		
      ,[B1_TIPOBN]		= @B1_TIPOBN		
      ,[B1_ESCRIPI]		= @B1_ESCRIPI		
      ,[B1_UMOEC]		= @B1_UMOEC		
      ,[B1_UVLRC]		= @B1_UVLRC		
      ,[B1_PIS]			= @B1_PIS			
      ,[B1_GCCUSTO]		= @B1_GCCUSTO		
      ,[B1_CCCUSTO]		= @B1_CCCUSTO		
      ,[B1_VLR_PIS]		= @B1_VLR_PIS		
      ,[B1_CLASSE]		= @B1_CLASSE		
      ,[B1_PARCEI]		= @B1_PARCEI		
      ,[B1_GDODIF]		= @B1_GDODIF		
      ,[B1_TALLA]		= @B1_TALLA		
      ,[B1_VALEPRE]		= @B1_VALEPRE		
      ,[B1_FUSTF]		= @B1_FUSTF		
      ,[B1_CODQAD]		= @B1_CODQAD		
      ,[B1_PMACNUT]		= @B1_PMACNUT		
      ,[B1_PMICNUT]		= @B1_PMICNUT		
      ,[B1_MSBLQL]		= @B1_MSBLQL		
      ,[B1_CODPROC]		= @B1_CODPROC		
      ,[B1_QBP]			= @B1_QBP			
      ,[B1_PRODSBP]		= @B1_PRODSBP		
      ,[B1_VLCIF]		= @B1_VLCIF		
      ,[B1_LOTESBP]		= @B1_LOTESBP		
      ,[B1_AFACS]		= @B1_AFACS		
      ,[B1_ALFECRN]		= @B1_ALFECRN		
      ,[B1_ALFECST]		= @B1_ALFECST		
      ,[B1_CFEM]		= @B1_CFEM		
      ,[B1_CFEMA]		= @B1_CFEMA		
      ,[B1_CFEMS]		= @B1_CFEMS		
      ,[B1_CRDPRES]		= @B1_CRDPRES		
      ,[B1_CRICMST]		= @B1_CRICMST		
      ,[B1_FECPBA]		= @B1_FECPBA		
      ,[B1_IDHIST]		= @B1_IDHIST		
      ,[B1_AJUDIF]		= @B1_AJUDIF		
      ,[B1_ALFECOP]		= @B1_ALFECOP		
      ,[B1_FECOP]		= @B1_FECOP		
      ,[B1_MEPLES]		= @B1_MEPLES		
      ,[B1_MSEXP]		= @B1_MSEXP		
      ,[B1_PAFMD5]		= @B1_PAFMD5		
      ,[B1_REGESIM]		= @B1_REGESIM		
      ,[B1_RSATIVO]		= @B1_RSATIVO		
      ,[B1_SITTRIB]		= @B1_SITTRIB		
      ,[B1_TFETHAB]		= @B1_TFETHAB		
      ,[B1_TPDP]		= @B1_TPDP		
      ,[B1_ALFUMAC]		= @B1_ALFUMAC		
      ,[B1_PRN944I]		= @B1_PRN944I		
      ,[B1_CODLAN]		= @B1_CODLAN		
      ,[B1_CARGAE]		= @B1_CARGAE		
      ,[B1_TRIBMUN]		= @B1_TRIBMUN		
      ,[B1_GARANT]		= @B1_GARANT		
      ,[B1_PERGART]		= @B1_PERGART		
      ,[B1_ADMIN]		= @B1_ADMIN		
      ,[B1_PR43080]		= @B1_PR43080		
      ,[B1_PRINCMG]		= @B1_PRINCMG		
      ,[B1_RPRODEP]		= @B1_RPRODEP		
      ,[B1_PORCPRL]		= @B1_PORCPRL		
      ,[B1_IMPNCM]		= @B1_IMPNCM		
      ,[B1_AFETHAB]		= @B1_AFETHAB		
      ,[B1_RICM65]		= @B1_RICM65		
      ,[B1_GRPTI]		= @B1_GRPTI		
      ,[B1_PRDORI]		= @B1_PRDORI		
      ,[B1_DESBSE2]		= @B1_DESBSE2		
      ,[B1_BASE2]		= @B1_BASE2		
      ,[B1_FRETISS]		= @B1_FRETISS		
      ,[B1_CRDEST]		= @B1_CRDEST		
      ,[B1_REGRISS]		= @B1_REGRISS		
      ,[B1_IVAAJU]		= @B1_IVAAJU		
      ,[B1_BASE]		= @B1_BASE		
      ,[B1_TIPVEC]		= @B1_TIPVEC		
      ,[B1_COLOR]		= @B1_COLOR		
      ,[B1_VLR_COF]		= @B1_VLR_COF		
      ,[B1_PRFDSUL]		= @B1_PRFDSUL		
      ,[B1_COFINS]		= @B1_COFINS		
      ,[B1_CSLL]		= @B1_CSLL		
      ,[B1_RETOPER]		= @B1_RETOPER		
      ,[B1_CNAE]		= @B1_CNAE		
      ,[B1_SELOEN]		= @B1_SELOEN		
      ,[B1_CODANT]		= @B1_CODANT		
      ,[B1_PRODREC]		= @B1_PRODREC		
      ,[B1_FETHAB]		= @B1_FETHAB		
      ,[B1_ESTRORI]		= @B1_ESTRORI		
      ,[B1_CALCFET]		= @B1_CALCFET		
      ,[B1_PAUTFET]		= @B1_PAUTFET		
      ,[D_E_L_E_T_]		= @D_E_L_E_T_		
      --,[R_E_C_N_O_]		= @R_E_C_N_O_		
      ,[B1_EC05DB]		= @B1_EC05DB		
      ,[B1_EC05CR]		= @B1_EC05CR		
      ,[B1_EC06DB]		= @B1_EC06DB		
      ,[B1_EC06CR]		= @B1_EC06CR		
      ,[B1_EC07DB]		= @B1_EC07DB		
      ,[B1_EC07CR]		= @B1_EC07CR		
      ,[B1_EC08DB]		= @B1_EC08DB		
      ,[B1_EC08CR]		= @B1_EC08CR		
      ,[B1_EC09DB]		= @B1_EC09DB		
      ,[B1_EC09CR]		= @B1_EC09CR		
      ,[B1_TERUM]		= @B1_TERUM		
      ,[B1_AFAMAD]		= @B1_AFAMAD		
      ,[B1_ZZDEVOB]		= @B1_ZZDEVOB		
      ,[B1_ZSCEALT]		= @B1_ZSCEALT		
      ,[B1_ZZFAMRP]		= @B1_ZZFAMRP		
      ,[B1_ZZOLD]		= @B1_ZZOLD		
      ,[B1_ZCONTA2]		= @B1_ZCONTA2		
      ,[B1_CODGTIN]		= @B1_CODGTIN		
      ,[B1_QTDSER]		= @B1_QTDSER		
      ,[B1_ZFABRIC]		= @B1_ZFABRIC		
      ,[B1_ZREFFAB]		= @B1_ZREFFAB		
      ,[B1_ZPAI]		= @B1_ZPAI		
      ,[B1_ZCODCH]		= @B1_ZCODCH		
      ,[B1_ZLOGCH]		= @B1_ZLOGCH		
      ,[B1_TESCUMU]		= @B1_TESCUMU		
      ,[B1_ZATIVCU]		= @B1_ZATIVCU		
      ,[B1_ZTENCUM]		= @B1_ZTENCUM		
      ,[B1_ZATVNCU]		= @B1_ZATVNCU		
      ,[B1_ZDSCCHL]		= @B1_ZDSCCHL		
      ,[B1_ZNATCON]		= @B1_ZNATCON		
      ,[B1_ZZNATAP]		= @B1_ZZNATAP		
      ,[B1_ZCTOREX]		= @B1_ZCTOREX		
      ,[B1_ZZDTENT]		= @B1_ZZDTENT		
      ,[dt_alteracao]	= getdate()
	  ,B1_FILIAL		= @B1_FILIAL 
	  ,B1_COD			= @B1_COD  
	  ,R_E_C_D_E_L_    = @R_E_C_D_E_L_ 
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSB2010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_alteraRegistroSB2010]

@sk_destino int
,@B2_QFIM float
,@B2_QATU float
,@B2_VFIM1 float
,@B2_VATU1 float
,@B2_CM1 float
,@B2_VFIM2 float
,@B2_VATU2 float
,@B2_CM2 float
,@B2_VFIM3 float
,@B2_VATU3 float
,@B2_CM3 float
,@B2_VFIM4 float
,@B2_VATU4 float
,@B2_CM4 float
,@B2_VFIM5 float
,@B2_VATU5 float
,@B2_CM5 float
,@B2_QEMP float
,@B2_QEMPN float
,@B2_QTSEGUM float
,@B2_USAI varchar(8)
,@B2_RESERVA float
,@B2_QPEDVEN float
,@B2_LOCALIZ varchar(15)
,@B2_NAOCLAS float
,@B2_SALPEDI float
,@B2_DINVENT varchar(8)
,@B2_DINVFIM varchar(8)
,@B2_QTNP float
,@B2_QNPT float
,@B2_QTER float
,@B2_QFIM2 float
,@B2_QACLASS float
,@B2_DTINV varchar(8)
,@B2_CMFF1 float
,@B2_CMFF2 float
,@B2_CMFF3 float
,@B2_CMFF4 float
,@B2_CMFF5 float
,@B2_VFIMFF1 float
,@B2_VFIMFF2 float
,@B2_VFIMFF3 float
,@B2_VFIMFF4 float
,@B2_VFIMFF5 float
,@B2_QEMPSA float
,@B2_QEMPPRE float
,@B2_SALPPRE float
,@B2_QEMP2 float
,@B2_QEMPN2 float
,@B2_RESERV2 float
,@B2_QPEDVE2 float
,@B2_QEPRE2 float
,@B2_QFIMFF float
,@B2_SALPED2 float
,@B2_QEMPPRJ float
,@B2_QEMPPR2 float
,@B2_STATUS varchar(1)
,@B2_CMFIM1 float
,@B2_CMFIM2 float
,@B2_CMFIM3 float
,@B2_CMFIM4 float
,@B2_CMFIM5 float
,@B2_TIPO varchar(1)
,@B2_CMRP1 float
,@B2_VFRP1 float
,@B2_CMRP2 float
,@B2_VFRP2 float
,@B2_CMRP3 float
,@B2_VFRP3 float
,@B2_CMRP4 float
,@B2_VFRP4 float
,@B2_CMRP5 float
,@B2_VFRP5 float
,@B2_QULT float
,@B2_DULT varchar(8)
,@B2_BLOQUEI varchar(1)
,@B2_MSEXP varchar(8)
,@B2_ECSALDO float
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@B2_XDTINI varchar(8)
,@B2_XDTFIN varchar(8)
,@B2_HMOV varchar(8)
,@B2_HULT varchar(8)
,@B2_DMOV varchar(8)
,@B2_FILIAL varchar(2)
,@B2_LOCAL varchar(2)
,@B2_COD varchar(15)
,@R_E_C_D_E_L_ int

as


--- chave composta: B2_FILIAL, B2_LOCAL, B2_COD, R_E_C_D_E_L_

UPDATE [dbo].[SB2010]
   SET 
      [B2_QFIM]			= @B2_QFIM			
      ,[B2_QATU]		= @B2_QATU		
      ,[B2_VFIM1]		= @B2_VFIM1		
      ,[B2_VATU1]		= @B2_VATU1		
      ,[B2_CM1]			= @B2_CM1			
      ,[B2_VFIM2]		= @B2_VFIM2		
      ,[B2_VATU2]		= @B2_VATU2		
      ,[B2_CM2]			= @B2_CM2			
      ,[B2_VFIM3]		= @B2_VFIM3		
      ,[B2_VATU3]		= @B2_VATU3		
      ,[B2_CM3]			= @B2_CM3			
      ,[B2_VFIM4]		= @B2_VFIM4		
      ,[B2_VATU4]		= @B2_VATU4		
      ,[B2_CM4]			= @B2_CM4			
      ,[B2_VFIM5]		= @B2_VFIM5		
      ,[B2_VATU5]		= @B2_VATU5		
      ,[B2_CM5]			= @B2_CM5			
      ,[B2_QEMP]		= @B2_QEMP		
      ,[B2_QEMPN]		= @B2_QEMPN		
      ,[B2_QTSEGUM]		= @B2_QTSEGUM		
      ,[B2_USAI]		= @B2_USAI		
      ,[B2_RESERVA]		= @B2_RESERVA		
      ,[B2_QPEDVEN]		= @B2_QPEDVEN		
      ,[B2_LOCALIZ]		= @B2_LOCALIZ		
      ,[B2_NAOCLAS]		= @B2_NAOCLAS		
      ,[B2_SALPEDI]		= @B2_SALPEDI		
      ,[B2_DINVENT]		= @B2_DINVENT		
      ,[B2_DINVFIM]		= @B2_DINVFIM		
      ,[B2_QTNP]		= @B2_QTNP		
      ,[B2_QNPT]		= @B2_QNPT		
      ,[B2_QTER]		= @B2_QTER		
      ,[B2_QFIM2]		= @B2_QFIM2		
      ,[B2_QACLASS]		= @B2_QACLASS		
      ,[B2_DTINV]		= @B2_DTINV		
      ,[B2_CMFF1]		= @B2_CMFF1		
      ,[B2_CMFF2]		= @B2_CMFF2		
      ,[B2_CMFF3]		= @B2_CMFF3		
      ,[B2_CMFF4]		= @B2_CMFF4		
      ,[B2_CMFF5]		= @B2_CMFF5		
      ,[B2_VFIMFF1]		= @B2_VFIMFF1		
      ,[B2_VFIMFF2]		= @B2_VFIMFF2		
      ,[B2_VFIMFF3]		= @B2_VFIMFF3		
      ,[B2_VFIMFF4]		= @B2_VFIMFF4		
      ,[B2_VFIMFF5]		= @B2_VFIMFF5		
      ,[B2_QEMPSA]		= @B2_QEMPSA		
      ,[B2_QEMPPRE]		= @B2_QEMPPRE		
      ,[B2_SALPPRE]		= @B2_SALPPRE		
      ,[B2_QEMP2]		= @B2_QEMP2		
      ,[B2_QEMPN2]		= @B2_QEMPN2		
      ,[B2_RESERV2]		= @B2_RESERV2		
      ,[B2_QPEDVE2]		= @B2_QPEDVE2		
      ,[B2_QEPRE2]		= @B2_QEPRE2		
      ,[B2_QFIMFF]		= @B2_QFIMFF		
      ,[B2_SALPED2]		= @B2_SALPED2		
      ,[B2_QEMPPRJ]		= @B2_QEMPPRJ		
      ,[B2_QEMPPR2]		= @B2_QEMPPR2		
      ,[B2_STATUS]		= @B2_STATUS		
      ,[B2_CMFIM1]		= @B2_CMFIM1		
      ,[B2_CMFIM2]		= @B2_CMFIM2		
      ,[B2_CMFIM3]		= @B2_CMFIM3		
      ,[B2_CMFIM4]		= @B2_CMFIM4		
      ,[B2_CMFIM5]		= @B2_CMFIM5		
      ,[B2_TIPO]		= @B2_TIPO		
      ,[B2_CMRP1]		= @B2_CMRP1		
      ,[B2_VFRP1]		= @B2_VFRP1		
      ,[B2_CMRP2]		= @B2_CMRP2		
      ,[B2_VFRP2]		= @B2_VFRP2		
      ,[B2_CMRP3]		= @B2_CMRP3		
      ,[B2_VFRP3]		= @B2_VFRP3		
      ,[B2_CMRP4]		= @B2_CMRP4		
      ,[B2_VFRP4]		= @B2_VFRP4		
      ,[B2_CMRP5]		= @B2_CMRP5		
      ,[B2_VFRP5]		= @B2_VFRP5		
      ,[B2_QULT]		= @B2_QULT		
      ,[B2_DULT]		= @B2_DULT		
      ,[B2_BLOQUEI]		= @B2_BLOQUEI		
      ,[B2_MSEXP]		= @B2_MSEXP		
      ,[B2_ECSALDO]		= @B2_ECSALDO		
      ,[D_E_L_E_T_]		= @D_E_L_E_T_		
      --,[R_E_C_N_O_]		= @R_E_C_N_O_		
      ,[B2_XDTINI]		= @B2_XDTINI		
      ,[B2_XDTFIN]		= @B2_XDTFIN		
      ,[B2_HMOV]		= @B2_HMOV		
      ,[B2_HULT]		= @B2_HULT		
      ,[B2_DMOV]		= @B2_DMOV		
      ,[dt_alteracao]	= getdate()
	  ,B2_FILIAL		= @B2_FILIAL
	  ,B2_LOCAL			= @B2_LOCAL
	  ,B2_COD			= @B2_COD
	  ,R_E_C_D_E_L_     = @R_E_C_D_E_L_

 WHERE sk_destino = @sk_destino


GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSB5010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_alteraRegistroSB5010]

@sk_destino int
,@B5_PRV2 float
,@B5_PRV3 float
,@B5_PRV4 float
,@B5_PRV5 float
,@B5_PRV6 float
,@B5_ECDESCR varbinary(max)
,@B5_PRV7 float
,@B5_ECENQUA varchar(20)
,@B5_CEME varchar(254)
,@B5_ECPESOE float
,@B5_CODCLI varchar(15)
,@B5_ECALTEM float
,@B5_CERT varchar(1)
,@B5_COMPR float
,@B5_DES varchar(15)
,@B5_EMB1 varchar(10)
,@B5_EMB2 varchar(10)
,@B5_ESPESS float
,@B5_ESTMAT varchar(1)
,@B5_LARG float
,@B5_QE1 float
,@B5_QE2 float
,@B5_CONVDIP float
,@B5_UMDIPI varchar(2)
,@B5_DTREFP2 varchar(8)
,@B5_CARPER varchar(1)
,@B5_DTREFP3 varchar(8)
,@B5_IDADEM float
,@B5_DTREFP4 varchar(8)
,@B5_DTREFP5 varchar(8)
,@B5_DTREFP6 varchar(8)
,@B5_DTREFP7 varchar(8)
,@B5_COMPRLC float
,@B5_LARGLC float
,@B5_ALTURLC float
,@B5_FATARMA float
,@B5_EMPMAX float
,@B5_ROTACAO varchar(1)
,@B5_CODCAI varchar(6)
,@B5_LOCALIZ varchar(15)
,@B5_AM4PORC float
,@B5_ZF4PORC float
,@B5_CODZON varchar(6)
,@B5_UMIND varchar(1)
,@B5_SERVENT varchar(3)
,@B5_SERVINT varchar(3)
,@B5_SERVSAI varchar(3)
,@B5_LVLEMB float
,@B5_LPSEMB float
,@B5_INTDI varchar(1)
,@B5_PERCUB float
,@B5_IMPGRUP varchar(1)
,@B5_BENDL varchar(1)
,@B5_PINSUMO varchar(1)
,@B5_PORTMS varchar(1)
,@B5_REGMAPA varchar(10)
,@B5_EMBAGRO varchar(3)
,@B5_INDPETR varchar(1)
,@B5_PRODDNF float
,@B5_NPULMAO varchar(1)
,@B5_INSUMO float
,@B5_VOLRECI float
,@B5_CODISRF float
,@B5_USOITE varchar(1)
,@B5_LOCALI2 varchar(15)
,@B5_CONCENT float
,@B5_DENSID float
,@B5_FTIN float
,@B5_FTIF float
,@B5_PROPOR1 float
,@B5_PROPOR2 float
,@B5_CRDEST1 float
,@B5_CRDEST2 float
,@B5_SERVEMB varchar(3)
,@B5_CALORIA float
,@B5_PESO float
,@B5_TOTGOR float
,@B5_TOTGORS float
,@B5_TOTGORT float
,@B5_COR varchar(15)
,@B5_ALTURA float
,@B5_MODELO varchar(30)
,@B5_ESPECIE varchar(5)
,@B5_QUALIDA varchar(5)
,@B5_ONU varchar(4)
,@B5_ITEM varchar(2)
,@B5_CODTP varchar(3)
,@B5_CMPEXTR varchar(1)
,@B5_EAN141 float
,@B5_EAN142 float
,@B5_EAN143 float
,@B5_EAN144 float
,@B5_EAN145 float
,@B5_EAN146 float
,@B5_EAN147 float
,@B5_EAN148 float
,@B5_TIPUNIT varchar(1)
,@B5_QTDVAR varchar(1)
,@B5_IMPETI varchar(1)
,@B5_VLDOPER varchar(1)
,@B5_VLDREQ varchar(1)
,@B5_DTINV varchar(8)
,@B5_NSERIE varchar(1)
,@B5_QEI float
,@B5_QEL float
,@B5_CDDMDBA varchar(5)
,@B5_SITDIEF varchar(2)
,@B5_DESCNFE varbinary(max)
,@B5_TABINC varchar(2)
,@B5_CODGRU varchar(2)
,@B5_MARCA varchar(60)
,@B5_DIASHL float
,@B5_DIASHF float
,@B5_REVPROD varchar(1)
,@B5_CODTRAM varchar(4)
,@B5_TPSERV varchar(1)
,@B5_WMSEMB varchar(1)
,@B5_NATBEN varchar(2)
,@B5_SEMENTE varchar(1)
,@B5_CULTRA varchar(10)
,@B5_DTDECRE varchar(8)
,@B5_CTVAR varchar(10)
,@B5_CATEG varchar(2)
,@B5_PENE varchar(4)
,@B5_COMPEND varchar(1)
,@B5_FUNCEP varchar(1)
,@B5_TPESOC varchar(2)
,@B5_MARGPRE float
,@B5_VLRCID float
,@B5_CODSERC varchar(9)
,@B5_ISEN varchar(1)
,@B5_VERIND varchar(1)
,@B5_IDHIST varchar(20)
,@B5_PROJDES varchar(1)
,@B5_NRECAGR varchar(15)
,@B5_INGATV varchar(40)
,@B5_FORCAO varchar(70)
,@B5_CLASSE varchar(70)
,@B5_CONCEN varchar(25)
,@B5_DESCSER varbinary(max)
,@B5_CODATIV varchar(8)
,@B5_FORMMRP varchar(1)
,@B5_PRZCQ float
,@B5_ENDSAI varchar(15)
,@B5_FCIPRV float
,@B5_REDALIQ varchar(1)
,@B5_AMMULTO float
,@B5_AMMULTS float
,@B5_ZFMULTO float
,@B5_ZFMULTS float
,@B5_NBS varchar(9)
,@B5_ECEAN1 varchar(20)
,@B5_ECSUBT varchar(100)
,@B5_ISIDUNI varchar(1)
,@B5_CDFATD varchar(5)
,@B5_ECSEQ varchar(15)
,@B5_NUMBEAL varchar(5)
,@B5_DTDECAL varchar(8)
,@B5_NATALBE varchar(2)
,@B5_ECLARGE float
,@B5_ECINDIC varbinary(max)
,@B5_NUMBEN varchar(5)
,@B5_ANOBEN varchar(4)
,@B5_BLQINVA varchar(1)
,@B5_BLQINVD float
,@B5_MONTA varchar(1)
,@B5_FPRZCQ varchar(3)
,@B5_VERSAO varchar(3)
,@B5_GRPIVA varchar(3)
,@B5_DIASES float
,@B5_AGLUMRP varchar(1)
,@B5_PROTCON varchar(30)
,@B5_ALTTRIB varchar(1)
,@B5_CODGNRE float
,@B5_PROTOTI varchar(1)
,@B5_ECSEQ2 varchar(15)
,@B5_INSPAT varchar(1)
,@B5_CTRWMS varchar(1)
,@B5_ENVMKT varchar(1)
,@B5_ECCUBAG float
,@B5_ECAPRES varbinary(max)
,@B5_ECBENFI varbinary(max)
,@B5_ECDTEX2 varchar(8)
,@B5_ECIMGFI varchar(90)
,@B5_ECPCHAV varchar(254)
,@B5_ECDTLAN varchar(8)
,@B5_CTDACON varchar(9)
,@B5_TPISERV varchar(1)
,@B5_ENDENT varchar(15)
,@B5_ENDREQ varchar(15)
,@B5_ENDDEV varchar(15)
,@B5_FORSER varchar(3)
,@B5_CATMAT varchar(20)
,@B5_TIPO varchar(1)
,@B5_DEC7174 varchar(1)
,@B5_ECDTEX varchar(8)
,@B5_CLAUBA varchar(3)
,@B5_TRATAM varchar(6)
,@B5_UMPRC varchar(2)
,@B5_LEADTR float
,@B5_ECCARAC varbinary(max)
,@B5_ECFLAG varchar(1)
,@B5_ECTITU varchar(100)
,@B5_ECPROFU float
,@B5_TPAPUR varchar(1)
,@B5_CODFAM varchar(6)
,@B5_MARPEC varchar(6)
,@B5_CODLIN varchar(6)
,@B5_ECCOMP float
,@B5_ECLARGU float
,@B5_SERVDEV varchar(3)
,@B5_SERVREQ varchar(3)
,@B5_GSLE varchar(1)
,@B5_GSMC varchar(1)
,@B5_GSMI varchar(1)
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@B5_INSSPAT varchar(1)
,@B5_VLZERO varchar(1)
,@B5_ECDESF varchar(1)
,@B5_INDCPRB varchar(1)
,@B5_ARREQTD varchar(1)
,@B5_SERVTDV varchar(3)
,@B5_SERSCD varchar(3)
,@B5_ENDSCD varchar(15)
,@B5_SERECD varchar(3)
,@B5_ENDECD varchar(15)
,@B5_ISDSHIP varchar(1)
,@B5_PERIOT float
,@B5_2CODBAR varchar(15)
,@B5_TPCOMMO varchar(1)
,@B5_TAKEUP varchar(1)
,@B5_FILIAL varchar(2)
,@B5_COD varchar(15)
,@R_E_C_D_E_L_ int


as


UPDATE [dbo].[SB5010]
   SET 
      [B5_PRV2]			= @B5_PRV2			
      ,[B5_PRV3]		= @B5_PRV3		
      ,[B5_PRV4]		= @B5_PRV4		
      ,[B5_PRV5]		= @B5_PRV5		
      ,[B5_PRV6]		= @B5_PRV6		
      ,[B5_ECDESCR]		= @B5_ECDESCR		
      ,[B5_PRV7]		= @B5_PRV7		
      ,[B5_ECENQUA]		= @B5_ECENQUA		
      ,[B5_CEME]		= @B5_CEME		
      ,[B5_ECPESOE]		= @B5_ECPESOE		
      ,[B5_CODCLI]		= @B5_CODCLI		
      ,[B5_ECALTEM]		= @B5_ECALTEM		
      ,[B5_CERT]		= @B5_CERT		
      ,[B5_COMPR]		= @B5_COMPR		
      ,[B5_DES]			= @B5_DES			
      ,[B5_EMB1]		= @B5_EMB1		
      ,[B5_EMB2]		= @B5_EMB2		
      ,[B5_ESPESS]		= @B5_ESPESS		
      ,[B5_ESTMAT]		= @B5_ESTMAT		
      ,[B5_LARG]		= @B5_LARG		
      ,[B5_QE1]			= @B5_QE1			
      ,[B5_QE2]			= @B5_QE2			
      ,[B5_CONVDIP]		= @B5_CONVDIP		
      ,[B5_UMDIPI]		= @B5_UMDIPI		
      ,[B5_DTREFP2]		= @B5_DTREFP2		
      ,[B5_CARPER]		= @B5_CARPER		
      ,[B5_DTREFP3]		= @B5_DTREFP3		
      ,[B5_IDADEM]		= @B5_IDADEM		
      ,[B5_DTREFP4]		= @B5_DTREFP4		
      ,[B5_DTREFP5]		= @B5_DTREFP5		
      ,[B5_DTREFP6]		= @B5_DTREFP6		
      ,[B5_DTREFP7]		= @B5_DTREFP7		
      ,[B5_COMPRLC]		= @B5_COMPRLC		
      ,[B5_LARGLC]		= @B5_LARGLC		
      ,[B5_ALTURLC]		= @B5_ALTURLC		
      ,[B5_FATARMA]		= @B5_FATARMA		
      ,[B5_EMPMAX]		= @B5_EMPMAX		
      ,[B5_ROTACAO]		= @B5_ROTACAO		
      ,[B5_CODCAI]		= @B5_CODCAI		
      ,[B5_LOCALIZ]		= @B5_LOCALIZ		
      ,[B5_AM4PORC]		= @B5_AM4PORC		
      ,[B5_ZF4PORC]		= @B5_ZF4PORC		
      ,[B5_CODZON]		= @B5_CODZON		
      ,[B5_UMIND]		= @B5_UMIND		
      ,[B5_SERVENT]		= @B5_SERVENT		
      ,[B5_SERVINT]		= @B5_SERVINT		
      ,[B5_SERVSAI]		= @B5_SERVSAI		
      ,[B5_LVLEMB]		= @B5_LVLEMB		
      ,[B5_LPSEMB]		= @B5_LPSEMB		
      ,[B5_INTDI]		= @B5_INTDI		
      ,[B5_PERCUB]		= @B5_PERCUB		
      ,[B5_IMPGRUP]		= @B5_IMPGRUP		
      ,[B5_BENDL]		= @B5_BENDL		
      ,[B5_PINSUMO]		= @B5_PINSUMO		
      ,[B5_PORTMS]		= @B5_PORTMS		
      ,[B5_REGMAPA]		= @B5_REGMAPA		
      ,[B5_EMBAGRO]		= @B5_EMBAGRO		
      ,[B5_INDPETR]		= @B5_INDPETR		
      ,[B5_PRODDNF]		= @B5_PRODDNF		
      ,[B5_NPULMAO]		= @B5_NPULMAO		
      ,[B5_INSUMO]		= @B5_INSUMO		
      ,[B5_VOLRECI]		= @B5_VOLRECI		
      ,[B5_CODISRF]		= @B5_CODISRF		
      ,[B5_USOITE]		= @B5_USOITE		
      ,[B5_LOCALI2]		= @B5_LOCALI2		
      ,[B5_CONCENT]		= @B5_CONCENT		
      ,[B5_DENSID]		= @B5_DENSID		
      ,[B5_FTIN]		= @B5_FTIN		
      ,[B5_FTIF]		= @B5_FTIF		
      ,[B5_PROPOR1]		= @B5_PROPOR1		
      ,[B5_PROPOR2]		= @B5_PROPOR2		
      ,[B5_CRDEST1]		= @B5_CRDEST1		
      ,[B5_CRDEST2]		= @B5_CRDEST2		
      ,[B5_SERVEMB]		= @B5_SERVEMB		
      ,[B5_CALORIA]		= @B5_CALORIA		
      ,[B5_PESO]		= @B5_PESO		
      ,[B5_TOTGOR]		= @B5_TOTGOR		
      ,[B5_TOTGORS]		= @B5_TOTGORS		
      ,[B5_TOTGORT]		= @B5_TOTGORT		
      ,[B5_COR]			= @B5_COR			
      ,[B5_ALTURA]		= @B5_ALTURA		
      ,[B5_MODELO]		= @B5_MODELO		
      ,[B5_ESPECIE]		= @B5_ESPECIE		
      ,[B5_QUALIDA]		= @B5_QUALIDA		
      ,[B5_ONU]			= @B5_ONU			
      ,[B5_ITEM]		= @B5_ITEM		
      ,[B5_CODTP]		= @B5_CODTP		
      ,[B5_CMPEXTR]		= @B5_CMPEXTR		
      ,[B5_EAN141]		= @B5_EAN141		
      ,[B5_EAN142]		= @B5_EAN142		
      ,[B5_EAN143]		= @B5_EAN143		
      ,[B5_EAN144]		= @B5_EAN144		
      ,[B5_EAN145]		= @B5_EAN145		
      ,[B5_EAN146]		= @B5_EAN146		
      ,[B5_EAN147]		= @B5_EAN147		
      ,[B5_EAN148]		= @B5_EAN148		
      ,[B5_TIPUNIT]		= @B5_TIPUNIT		
      ,[B5_QTDVAR]		= @B5_QTDVAR		
      ,[B5_IMPETI]		= @B5_IMPETI		
      ,[B5_VLDOPER]		= @B5_VLDOPER		
      ,[B5_VLDREQ]		= @B5_VLDREQ		
      ,[B5_DTINV]		= @B5_DTINV		
      ,[B5_NSERIE]		= @B5_NSERIE		
      ,[B5_QEI]			= @B5_QEI			
      ,[B5_QEL]			= @B5_QEL			
      ,[B5_CDDMDBA]		= @B5_CDDMDBA		
      ,[B5_SITDIEF]		= @B5_SITDIEF		
      ,[B5_DESCNFE]		= @B5_DESCNFE		
      ,[B5_TABINC]		= @B5_TABINC		
      ,[B5_CODGRU]		= @B5_CODGRU		
      ,[B5_MARCA]		= @B5_MARCA		
      ,[B5_DIASHL]		= @B5_DIASHL		
      ,[B5_DIASHF]		= @B5_DIASHF		
      ,[B5_REVPROD]		= @B5_REVPROD		
      ,[B5_CODTRAM]		= @B5_CODTRAM		
      ,[B5_TPSERV]		= @B5_TPSERV		
      ,[B5_WMSEMB]		= @B5_WMSEMB		
      ,[B5_NATBEN]		= @B5_NATBEN		
      ,[B5_SEMENTE]		= @B5_SEMENTE		
      ,[B5_CULTRA]		= @B5_CULTRA		
      ,[B5_DTDECRE]		= @B5_DTDECRE		
      ,[B5_CTVAR]		= @B5_CTVAR		
      ,[B5_CATEG]		= @B5_CATEG		
      ,[B5_PENE]		= @B5_PENE		
      ,[B5_COMPEND]		= @B5_COMPEND		
      ,[B5_FUNCEP]		= @B5_FUNCEP		
      ,[B5_TPESOC]		= @B5_TPESOC		
      ,[B5_MARGPRE]		= @B5_MARGPRE		
      ,[B5_VLRCID]		= @B5_VLRCID		
      ,[B5_CODSERC]		= @B5_CODSERC		
      ,[B5_ISEN]		= @B5_ISEN		
      ,[B5_VERIND]		= @B5_VERIND		
      ,[B5_IDHIST]		= @B5_IDHIST		
      ,[B5_PROJDES]		= @B5_PROJDES		
      ,[B5_NRECAGR]		= @B5_NRECAGR		
      ,[B5_INGATV]		= @B5_INGATV		
      ,[B5_FORCAO]		= @B5_FORCAO		
      ,[B5_CLASSE]		= @B5_CLASSE		
      ,[B5_CONCEN]		= @B5_CONCEN		
      ,[B5_DESCSER]		= @B5_DESCSER		
      ,[B5_CODATIV]		= @B5_CODATIV		
      ,[B5_FORMMRP]		= @B5_FORMMRP		
      ,[B5_PRZCQ]		= @B5_PRZCQ		
      ,[B5_ENDSAI]		= @B5_ENDSAI		
      ,[B5_FCIPRV]		= @B5_FCIPRV		
      ,[B5_REDALIQ]		= @B5_REDALIQ		
      ,[B5_AMMULTO]		= @B5_AMMULTO		
      ,[B5_AMMULTS]		= @B5_AMMULTS		
      ,[B5_ZFMULTO]		= @B5_ZFMULTO		
      ,[B5_ZFMULTS]		= @B5_ZFMULTS		
      ,[B5_NBS]			= @B5_NBS			
      ,[B5_ECEAN1]		= @B5_ECEAN1		
      ,[B5_ECSUBT]		= @B5_ECSUBT		
      ,[B5_ISIDUNI]		= @B5_ISIDUNI		
      ,[B5_CDFATD]		= @B5_CDFATD		
      ,[B5_ECSEQ]		= @B5_ECSEQ		
      ,[B5_NUMBEAL]		= @B5_NUMBEAL		
      ,[B5_DTDECAL]		= @B5_DTDECAL		
      ,[B5_NATALBE]		= @B5_NATALBE		
      ,[B5_ECLARGE]		= @B5_ECLARGE		
      ,[B5_ECINDIC]		= @B5_ECINDIC		
      ,[B5_NUMBEN]		= @B5_NUMBEN		
      ,[B5_ANOBEN]		= @B5_ANOBEN		
      ,[B5_BLQINVA]		= @B5_BLQINVA		
      ,[B5_BLQINVD]		= @B5_BLQINVD		
      ,[B5_MONTA]		= @B5_MONTA		
      ,[B5_FPRZCQ]		= @B5_FPRZCQ		
      ,[B5_VERSAO]		= @B5_VERSAO		
      ,[B5_GRPIVA]		= @B5_GRPIVA		
      ,[B5_DIASES]		= @B5_DIASES		
      ,[B5_AGLUMRP]		= @B5_AGLUMRP		
      ,[B5_PROTCON]		= @B5_PROTCON		
      ,[B5_ALTTRIB]		= @B5_ALTTRIB		
      ,[B5_CODGNRE]		= @B5_CODGNRE		
      ,[B5_PROTOTI]		= @B5_PROTOTI		
      ,[B5_ECSEQ2]		= @B5_ECSEQ2		
      ,[B5_INSPAT]		= @B5_INSPAT		
      ,[B5_CTRWMS]		= @B5_CTRWMS		
      ,[B5_ENVMKT]		= @B5_ENVMKT		
      ,[B5_ECCUBAG]		= @B5_ECCUBAG		
      ,[B5_ECAPRES]		= @B5_ECAPRES		
      ,[B5_ECBENFI]		= @B5_ECBENFI		
      ,[B5_ECDTEX2]		= @B5_ECDTEX2		
      ,[B5_ECIMGFI]		= @B5_ECIMGFI		
      ,[B5_ECPCHAV]		= @B5_ECPCHAV		
      ,[B5_ECDTLAN]		= @B5_ECDTLAN		
      ,[B5_CTDACON]		= @B5_CTDACON		
      ,[B5_TPISERV]		= @B5_TPISERV		
      ,[B5_ENDENT]		= @B5_ENDENT		
      ,[B5_ENDREQ]		= @B5_ENDREQ		
      ,[B5_ENDDEV]		= @B5_ENDDEV		
      ,[B5_FORSER]		= @B5_FORSER		
      ,[B5_CATMAT]		= @B5_CATMAT		
      ,[B5_TIPO]		= @B5_TIPO		
      ,[B5_DEC7174]		= @B5_DEC7174		
      ,[B5_ECDTEX]		= @B5_ECDTEX		
      ,[B5_CLAUBA]		= @B5_CLAUBA		
      ,[B5_TRATAM]		= @B5_TRATAM		
      ,[B5_UMPRC]		= @B5_UMPRC		
      ,[B5_LEADTR]		= @B5_LEADTR		
      ,[B5_ECCARAC]		= @B5_ECCARAC		
      ,[B5_ECFLAG]		= @B5_ECFLAG		
      ,[B5_ECTITU]		= @B5_ECTITU		
      ,[B5_ECPROFU]		= @B5_ECPROFU		
      ,[B5_TPAPUR]		= @B5_TPAPUR		
      ,[B5_CODFAM]		= @B5_CODFAM		
      ,[B5_MARPEC]		= @B5_MARPEC		
      ,[B5_CODLIN]		= @B5_CODLIN		
      ,[B5_ECCOMP]		= @B5_ECCOMP		
      ,[B5_ECLARGU]		= @B5_ECLARGU		
      ,[B5_SERVDEV]		= @B5_SERVDEV		
      ,[B5_SERVREQ]		= @B5_SERVREQ		
      ,[B5_GSLE]		= @B5_GSLE		
      ,[B5_GSMC]		= @B5_GSMC		
      ,[B5_GSMI]		= @B5_GSMI		
      ,[D_E_L_E_T_]		= @D_E_L_E_T_		
      --,[R_E_C_N_O_]		= @R_E_C_N_O_		
      ,[B5_INSSPAT]		= @B5_INSSPAT		
      ,[B5_VLZERO]		= @B5_VLZERO		
      ,[B5_ECDESF]		= @B5_ECDESF		
      ,[B5_INDCPRB]		= @B5_INDCPRB		
      ,[B5_ARREQTD]		= @B5_ARREQTD		
      ,[B5_SERVTDV]		= @B5_SERVTDV		
      ,[B5_SERSCD]		= @B5_SERSCD		
      ,[B5_ENDSCD]		= @B5_ENDSCD		
      ,[B5_SERECD]		= @B5_SERECD		
      ,[B5_ENDECD]		= @B5_ENDECD		
      ,[B5_ISDSHIP]		= @B5_ISDSHIP		
      ,[B5_PERIOT]		= @B5_PERIOT		
      ,[B5_2CODBAR]		= @B5_2CODBAR		
      ,[B5_TPCOMMO]		= @B5_TPCOMMO		
      ,[B5_TAKEUP]		= @B5_TAKEUP		
      ,[dt_alteracao]	= getdate()
	  ,B5_FILIAL       = @B5_FILIAL
	  ,B5_COD		   = @B5_COD
	  ,R_E_C_D_E_L_	   = @R_E_C_D_E_L_

 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSBE010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




--- BE_FILIAL, BE_LOCAL, BE_LOCALIZ, BE_ESTFIS, R_E_C_D_E_L_

CREATE proc [dbo].[sp_alteraRegistroSBE010]

@sk_destino int
,@BE_DESCRIC varchar(30)
,@BE_CAPACID float
,@BE_PRIOR varchar(3)
,@BE_ALTURLC float
,@BE_LARGLC float
,@BE_COMPRLC float
,@BE_PERDA float
,@BE_CODZON varchar(6)
,@BE_STATUS varchar(1)
,@BE_CODCFG varchar(6)
,@BE_CODPRO varchar(15)
,@BE_HORA varchar(5)
,@BE_OK varchar(2)
,@BE_EXCECAO varchar(3)
,@BE_DATGER varchar(8)
,@BE_HORGER varchar(4)
,@BE_VALNV1 float
,@BE_VALNV2 float
,@BE_VALNV3 float
,@BE_VALNV4 float
,@BE_VALNV5 float
,@BE_VALNV6 float
,@BE_DTINV varchar(8)
,@BE_IDETIQ varchar(10)
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@BE_NRUNIT float
,@BE_FILIAL varchar(2)
,@BE_LOCAL varchar(2)
,@BE_LOCALIZ varchar(15)
,@BE_ESTFIS varchar(6)
,@R_E_C_D_E_L_ int 

as

UPDATE [dbo].[SBE010]
   SET 
       [BE_DESCRIC]		= @BE_DESCRIC	
      ,[BE_CAPACID]		= @BE_CAPACID	
      ,[BE_PRIOR]		= @BE_PRIOR	
      ,[BE_ALTURLC]		= @BE_ALTURLC	
      ,[BE_LARGLC]		= @BE_LARGLC	
      ,[BE_COMPRLC]		= @BE_COMPRLC	
      ,[BE_PERDA]		= @BE_PERDA	
      ,[BE_CODZON]		= @BE_CODZON	
      ,[BE_STATUS]		= @BE_STATUS	
      ,[BE_CODCFG]		= @BE_CODCFG	
      ,[BE_CODPRO]		= @BE_CODPRO	
      ,[BE_HORA]		= @BE_HORA	
      ,[BE_OK]			= @BE_OK		
      ,[BE_EXCECAO]		= @BE_EXCECAO	
      ,[BE_DATGER]		= @BE_DATGER	
      ,[BE_HORGER]		= @BE_HORGER	
      ,[BE_VALNV1]		= @BE_VALNV1	
      ,[BE_VALNV2]		= @BE_VALNV2	
      ,[BE_VALNV3]		= @BE_VALNV3	
      ,[BE_VALNV4]		= @BE_VALNV4	
      ,[BE_VALNV5]		= @BE_VALNV5	
      ,[BE_VALNV6]		= @BE_VALNV6	
      ,[BE_DTINV]		= @BE_DTINV	
      ,[BE_IDETIQ]		= @BE_IDETIQ	
      ,[D_E_L_E_T_]		= @D_E_L_E_T_	
      --,[R_E_C_N_O_]		= @R_E_C_N_O_	
      ,[BE_NRUNIT]		= @BE_NRUNIT	
      ,[dt_alteracao]	= getdate()
	  ,BE_FILIAL        = @BE_FILIAL
	  ,BE_LOCAL			= @BE_LOCAL
	  ,BE_LOCALIZ		= @BE_LOCALIZ
	  ,BE_ESTFIS		= @BE_ESTFIS
	  ,R_E_C_D_E_L_		= @R_E_C_D_E_L_
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSBF010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_alteraRegistroSBF010]

@sk_destino int
,@BF_LOCAL varchar(2)
,@BF_PRIOR varchar(3)
,@BF_LOCALIZ varchar(15)
,@BF_NUMSERI varchar(20)
,@BF_LOTECTL varchar(21)
,@BF_NUMLOTE varchar(6)
,@BF_QUANT float
,@BF_EMPENHO float
,@BF_QEMPPRE float
,@BF_QTSEGUM float
,@BF_EMPEN2 float
,@BF_QEPRE2 float
,@BF_DATAVEN varchar(8)
,@BF_ESTFIS varchar(6)
,@BF_DINVENT varchar(8)
,@D_E_L_E_T_ varchar(1)
,@R_E_C_D_E_L_ int
,@BF_FILIAL varchar(2)
,@BF_PRODUTO varchar(15)
,@R_E_C_N_O_ int

as


UPDATE [dbo].[SBF010]
   SET [BF_FILIAL]			= @BF_FILIAL		
      ,[BF_PRODUTO]			= @BF_PRODUTO		
      ,[BF_LOCAL]			= @BF_LOCAL		
      ,[BF_PRIOR]			= @BF_PRIOR		
      ,[BF_LOCALIZ]			= @BF_LOCALIZ		
      ,[BF_NUMSERI]			= @BF_NUMSERI		
      ,[BF_LOTECTL]			= @BF_LOTECTL		
      ,[BF_NUMLOTE]			= @BF_NUMLOTE		
      ,[BF_QUANT]			= @BF_QUANT		
      ,[BF_EMPENHO]			= @BF_EMPENHO		
      ,[BF_QEMPPRE]			= @BF_QEMPPRE		
      ,[BF_QTSEGUM]			= @BF_QTSEGUM		
      ,[BF_EMPEN2]			= @BF_EMPEN2		
      ,[BF_QEPRE2]			= @BF_QEPRE2		
      ,[BF_DATAVEN]			= @BF_DATAVEN		
      ,[BF_ESTFIS]			= @BF_ESTFIS		
      ,[BF_DINVENT]			= @BF_DINVENT		
      ,[D_E_L_E_T_]			= @D_E_L_E_T_		
      --,[R_E_C_N_O_]			= @R_E_C_N_O_		
      ,[R_E_C_D_E_L_]		= @R_E_C_D_E_L_	
      ,[dt_alteracao]		= getdate()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSBM010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[sp_alteraRegistroSBM010]

@sk_destino int
,@BM_DESC varchar(100)
,@BM_PICPAD varchar(30)
,@BM_PROORI varchar(1)
,@BM_CODMAR varchar(3)
,@BM_STATUS varchar(1)
,@BM_GRUREL varchar(40)
,@BM_TIPGRU varchar(2)
,@BM_MARKUP float
,@BM_PRECO varchar(3)
,@BM_MARGPRE float
,@BM_LENREL float
,@BM_TIPMOV varchar(1)
,@BM_CODGRT varchar(2)
,@BM_CLASGRU varchar(1)
,@BM_FORMUL varchar(6)
,@BM_DTUMOV varchar(8)
,@BM_HRUMOV varchar(5)
,@BM_CONC varchar(1)
,@BM_CORP varchar(1)
,@BM_EVENTO varchar(1)
,@BM_LAZER varchar(1)
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@BM_ZZCOMPL varbinary(max)
,@BM_ZZFAMRP varchar(3)
,@BM_ZCONTA1 varchar(20)
,@BM_ZCONTA2 varchar(20)
,@BM_TESCUMU varchar(200)
,@BM_ZTENCUM varchar(200)
,@BM_ZATIVCU varchar(200)
,@BM_ZATVNCU varchar(200)
,@BM_TPSEGP varchar(1)
,@BM_ZGRPCH varchar(30)
,@BM_ZTIPOB1 varchar(2)
,@BM_MSEXP varchar(8)
,@BM_MSBLQL varchar(1)
,@BM_ZCTOREX varchar(2)
,@BM_ZZDTENT varchar(17)
,@BM_ZNATCON varchar(9)
,@BM_ZZNATAP varchar(9)
,@BM_FILIAL varchar(2)
,@BM_GRUPO varchar(4)
,@R_E_C_D_E_L_ int

as

UPDATE [dbo].[SBM010]
   SET 
       [BM_DESC]		= @BM_DESC		
      ,[BM_PICPAD]		= @BM_PICPAD		
      ,[BM_PROORI]		= @BM_PROORI		
      ,[BM_CODMAR]		= @BM_CODMAR		
      ,[BM_STATUS]		= @BM_STATUS		
      ,[BM_GRUREL]		= @BM_GRUREL		
      ,[BM_TIPGRU]		= @BM_TIPGRU		
      ,[BM_MARKUP]		= @BM_MARKUP		
      ,[BM_PRECO]		= @BM_PRECO		
      ,[BM_MARGPRE]		= @BM_MARGPRE		
      ,[BM_LENREL]		= @BM_LENREL		
      ,[BM_TIPMOV]		= @BM_TIPMOV		
      ,[BM_CODGRT]		= @BM_CODGRT		
      ,[BM_CLASGRU]		= @BM_CLASGRU		
      ,[BM_FORMUL]		= @BM_FORMUL		
      ,[BM_DTUMOV]		= @BM_DTUMOV		
      ,[BM_HRUMOV]		= @BM_HRUMOV		
      ,[BM_CONC]		= @BM_CONC		
      ,[BM_CORP]		= @BM_CORP		
      ,[BM_EVENTO]		= @BM_EVENTO		
      ,[BM_LAZER]		= @BM_LAZER		
      ,[D_E_L_E_T_]		= @D_E_L_E_T_		
      --,[R_E_C_N_O_]		= @R_E_C_N_O_		
      ,[BM_ZZCOMPL]		= @BM_ZZCOMPL		
      ,[BM_ZZFAMRP]		= @BM_ZZFAMRP		
      ,[BM_ZCONTA1]		= @BM_ZCONTA1		
      ,[BM_ZCONTA2]		= @BM_ZCONTA2		
      ,[BM_TESCUMU]		= @BM_TESCUMU		
      ,[BM_ZTENCUM]		= @BM_ZTENCUM		
      ,[BM_ZATIVCU]		= @BM_ZATIVCU		
      ,[BM_ZATVNCU]		= @BM_ZATVNCU		
      ,[BM_TPSEGP]		= @BM_TPSEGP		
      ,[BM_ZGRPCH]		= @BM_ZGRPCH		
      ,[BM_ZTIPOB1]		= @BM_ZTIPOB1		
      ,[BM_MSEXP]		= @BM_MSEXP		
      ,[BM_MSBLQL]		= @BM_MSBLQL		
      ,[BM_ZCTOREX]		= @BM_ZCTOREX		
      ,[BM_ZZDTENT]		= @BM_ZZDTENT		
      ,[BM_ZNATCON]		= @BM_ZNATCON		
      ,[BM_ZZNATAP]		= @BM_ZZNATAP		
      ,[dt_alteracao]	= getdate()
	  ,BM_FILIAL		=@BM_FILIAL
	  ,BM_GRUPO			=@BM_GRUPO
	  ,R_E_C_D_E_L_     =@R_E_C_D_E_L_
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSC0010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE proc [dbo].[sp_alteraRegistroSC0010] 
	@sk_destino int
	,@C0_FILIAL     varchar(2) 
	,@C0_NUM		  varchar(6) 
	,@C0_TIPO		  varchar(2) 
	,@C0_DOCRES	  varchar(9) 
	,@C0_SOLICIT	  varchar(20)
	,@C0_FILRES	  varchar(2) 
	,@C0_PRODUTO	  varchar(15)
	,@C0_LOCAL	  varchar(2) 
	,@C0_QUANT	  float		 
	,@C0_VALIDA	  varchar(8) 
	,@C0_EMISSAO	  varchar(8) 
	,@C0_NUMLOTE	  varchar(6) 
	,@C0_LOTECTL	  varchar(21)
	,@C0_LOCALIZ	  varchar(15)
	,@C0_NUMSERI	  varchar(20)
	,@C0_QTDORIG	  float		 
	,@C0_QTDPED	  float		 
	,@C0_OBS		  varchar(80)
	,@C0_QTDELIM	  float		 
	,@D_E_L_E_T_	  varchar(1) 	 
	,@R_E_C_D_E_L_  int		 
	,@C0_ORIGEM	  varchar(15)

as

UPDATE [dbo].SC0010
   SET 
		C0_FILIAL     = @C0_FILIAL    
		,C0_NUM		  = @C0_NUM		  
		,C0_TIPO		  = @C0_TIPO		
		,C0_DOCRES	  = @C0_DOCRES	  
		,C0_SOLICIT	  = @C0_SOLICIT	  
		,C0_FILRES	  = @C0_FILRES	  
		,C0_PRODUTO	  = @C0_PRODUTO	  
		,C0_LOCAL	  = @C0_LOCAL	  
		,C0_QUANT	  = @C0_QUANT	  
		,C0_VALIDA	  = @C0_VALIDA	  
		,C0_EMISSAO	  = @C0_EMISSAO	  
		,C0_NUMLOTE	  = @C0_NUMLOTE	  
		,C0_LOTECTL	  = @C0_LOTECTL	  
		,C0_LOCALIZ	  = @C0_LOCALIZ	  
		,C0_NUMSERI	  = @C0_NUMSERI	  
		,C0_QTDORIG	  = @C0_QTDORIG	  
		,C0_QTDPED	  = @C0_QTDPED	  
		,C0_OBS		  = @C0_OBS		  
		,C0_QTDELIM	  = @C0_QTDELIM	  
		,D_E_L_E_T_	  = @D_E_L_E_T_	  
		,R_E_C_D_E_L_  = @R_E_C_D_E_L_ 
		,C0_ORIGEM	  = @C0_ORIGEM	  
      ,[dt_alteracao] = getdate()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSC1010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--- chave composta C1_FILIAL, C1_NUM, C1_ITEM, C1_ITEMGRD, R_E_C_D_E_L_

CREATE proc [dbo].[sp_alteraRegistroSC1010]

@sk_destino int
,@C1_PRODUTO varchar(15)
,@C1_UM varchar(2)
,@C1_DESCRI varchar(100)
,@C1_QUANT float
,@C1_PRECO float
,@C1_TOTAL float
,@C1_SEGUM varchar(2)
,@C1_QTSEGUM float
,@C1_DATPRF varchar(8)
,@C1_OBS varchar(200)
,@C1_OP varchar(14)
,@C1_LOCAL varchar(2)
,@C1_CC varchar(9)
,@C1_CONTA varchar(20)
,@C1_ITEMCTA varchar(9)
,@C1_EMISSAO varchar(8)
,@C1_COTACAO varchar(6)
,@C1_FORNECE varchar(6)
,@C1_LOJA varchar(2)
,@C1_PEDIDO varchar(6)
,@C1_ITEMPED varchar(4)
,@C1_SOLICIT varchar(25)
,@C1_IDENT varchar(4)
,@C1_QUJE float
,@C1_TX varchar(2)
,@C1_OK varchar(2)
,@C1_OS varchar(6)
,@C1_IMPORT varchar(1)
,@C1_UNIDREQ varchar(5)
,@C1_CODCOMP varchar(3)
,@C1_CLASS varchar(1)
,@C1_FABR varchar(6)
,@C1_FABRLOJ varchar(2)
,@C1_NUM_SI varchar(6)
,@C1_TPOP varchar(1)
,@C1_QUJE2 float
,@C1_GRUPCOM varchar(6)
,@C1_USER varchar(6)
,@C1_ORIGEM varchar(8)
,@C1_CLVL varchar(9)
,@C1_PROJETO varchar(1)
,@C1_FILENT varchar(2)
,@C1_SEQMRP varchar(6)
,@C1_VUNIT float
,@C1_CONDPAG varchar(3)
,@C1_CODORCA varchar(8)
,@C1_RESIDUO varchar(1)
,@C1_QTDORIG float
,@C1_TIPOEMP varchar(1)
,@C1_ESPEMP varchar(1)
,@C1_APROV varchar(1)
,@C1_TIPO float
,@C1_MOEDA float
,@C1_GERACTR varchar(1)
,@C1_LOJFABR varchar(2)
,@C1_NOMAPRO varchar(25)
,@C1_SIGLA varchar(2)
,@C1_FABRICA varchar(6)
,@C1_FLAGGCT varchar(1)
,@C1_QTDREEM float
,@C1_PROGRAM varchar(10)
,@C1_GRADE varchar(1)
,@C1_TPSC varchar(1)
,@C1_MODAL varchar(2)
,@C1_TPMOD varchar(2)
,@C1_CODED varchar(15)
,@C1_NUMPR varchar(15)
,@C1_ORCAM varchar(6)
,@C1_ESTOQUE varchar(1)
,@C1_REVISAO varchar(3)
,@C1_RATEIO varchar(1)
,@C1_ACCPROC varchar(1)
,@C1_ACCNUM varchar(50)
,@C1_ACCITEM varchar(50)
,@C1_IDAPS varchar(80)
,@C1_COMPRAC varchar(1)
,@C1_FISCORI varchar(2)
,@C1_ITSCORI varchar(4)
,@C1_SCORI varchar(6)
,@C1_USRCODE varchar(6)
,@C1_PRDREF varchar(15)
,@C1_TIPCOM varchar(3)
,@C1_PEDRES varchar(6)
,@C1_NRBPIMS varchar(10)
,@C1_EC05DB varchar(16)
,@C1_EC05CR varchar(16)
,@C1_EC06DB varchar(16)
,@C1_EC06CR varchar(16)
,@C1_EC07DB varchar(16)
,@C1_EC07CR varchar(16)
,@C1_EC08DB varchar(16)
,@C1_EC08CR varchar(16)
,@C1_EC09DB varchar(16)
,@C1_EC09CR varchar(16)
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@C1_ZNSCFLU float
,@C1_ZZEMERG varchar(1)
,@C1_ZZUSO varchar(1)
,@C1_ZZDTDIG varchar(8)
,@C1_ZNATURE varchar(10)
,@C1_ZSUBFLU float
,@C1_ZZLOCSO varchar(1)
,@C1_USERLGI varchar(17)
,@C1_USERLGA varchar(17)
,@C1_ZCODZE1 varchar(20)
,@C1_ZITEZE1 varchar(4)
,@C1_ZZTPSOL varchar(1)
,@C1_ZNOS varchar(20)
,@C1_MSEXP varchar(8)
,@C1_FILIAL  varchar(2)
,@C1_NUM varchar(6)
,@C1_ITEM varchar(4)
,@C1_ITEMGRD varchar(3)
,@R_E_C_D_E_L_ int
as


UPDATE [dbo].[SC1010]
   SET 
       [C1_PRODUTO]		= @C1_PRODUTO		
      ,[C1_UM]			= @C1_UM			
      ,[C1_DESCRI]		= @C1_DESCRI		
      ,[C1_QUANT]		= @C1_QUANT		
      ,[C1_PRECO]		= @C1_PRECO		
      ,[C1_TOTAL]		= @C1_TOTAL		
      ,[C1_SEGUM]		= @C1_SEGUM		
      ,[C1_QTSEGUM]		= @C1_QTSEGUM		
      ,[C1_DATPRF]		= @C1_DATPRF		
      ,[C1_OBS]			= @C1_OBS			
      ,[C1_OP]			= @C1_OP			
      ,[C1_LOCAL]		= @C1_LOCAL		
      ,[C1_CC]			= @C1_CC			
      ,[C1_CONTA]		= @C1_CONTA		
      ,[C1_ITEMCTA]		= @C1_ITEMCTA		
      ,[C1_EMISSAO]		= @C1_EMISSAO		
      ,[C1_COTACAO]		= @C1_COTACAO		
      ,[C1_FORNECE]		= @C1_FORNECE		
      ,[C1_LOJA]		= @C1_LOJA		
      ,[C1_PEDIDO]		= @C1_PEDIDO		
      ,[C1_ITEMPED]		= @C1_ITEMPED		
      ,[C1_SOLICIT]		= @C1_SOLICIT		
      ,[C1_IDENT]		= @C1_IDENT		
      ,[C1_QUJE]		= @C1_QUJE		
      ,[C1_TX]			= @C1_TX			
      ,[C1_OK]			= @C1_OK			
      ,[C1_OS]			= @C1_OS			
      ,[C1_IMPORT]		= @C1_IMPORT		
      ,[C1_UNIDREQ]		= @C1_UNIDREQ		
      ,[C1_CODCOMP]		= @C1_CODCOMP		
      ,[C1_CLASS]		= @C1_CLASS		
      ,[C1_FABR]		= @C1_FABR		
      ,[C1_FABRLOJ]		= @C1_FABRLOJ		
      ,[C1_NUM_SI]		= @C1_NUM_SI		
      ,[C1_TPOP]		= @C1_TPOP		
      ,[C1_QUJE2]		= @C1_QUJE2		
      ,[C1_GRUPCOM]		= @C1_GRUPCOM		
      ,[C1_USER]		= @C1_USER		
      ,[C1_ORIGEM]		= @C1_ORIGEM		
      ,[C1_CLVL]		= @C1_CLVL		
      ,[C1_PROJETO]		= @C1_PROJETO		
      ,[C1_FILENT]		= @C1_FILENT		
      ,[C1_SEQMRP]		= @C1_SEQMRP		
      ,[C1_VUNIT]		= @C1_VUNIT		
      ,[C1_CONDPAG]		= @C1_CONDPAG		
      ,[C1_CODORCA]		= @C1_CODORCA		
      ,[C1_RESIDUO]		= @C1_RESIDUO		
      ,[C1_QTDORIG]		= @C1_QTDORIG		
      ,[C1_TIPOEMP]		= @C1_TIPOEMP		
      ,[C1_ESPEMP]		= @C1_ESPEMP		
      ,[C1_APROV]		= @C1_APROV		
      ,[C1_TIPO]		= @C1_TIPO		
      ,[C1_MOEDA]		= @C1_MOEDA		
      ,[C1_GERACTR]		= @C1_GERACTR		
      ,[C1_LOJFABR]		= @C1_LOJFABR		
      ,[C1_NOMAPRO]		= @C1_NOMAPRO		
      ,[C1_SIGLA]		= @C1_SIGLA		
      ,[C1_FABRICA]		= @C1_FABRICA		
      ,[C1_FLAGGCT]		= @C1_FLAGGCT		
      ,[C1_QTDREEM]		= @C1_QTDREEM		
      ,[C1_PROGRAM]		= @C1_PROGRAM		
      ,[C1_GRADE]		= @C1_GRADE		
      ,[C1_TPSC]		= @C1_TPSC		
      ,[C1_MODAL]		= @C1_MODAL		
      ,[C1_TPMOD]		= @C1_TPMOD		
      ,[C1_CODED]		= @C1_CODED		
      ,[C1_NUMPR]		= @C1_NUMPR		
      ,[C1_ORCAM]		= @C1_ORCAM		
      ,[C1_ESTOQUE]		= @C1_ESTOQUE		
      ,[C1_REVISAO]		= @C1_REVISAO		
      ,[C1_RATEIO]		= @C1_RATEIO		
      ,[C1_ACCPROC]		= @C1_ACCPROC		
      ,[C1_ACCNUM]		= @C1_ACCNUM		
      ,[C1_ACCITEM]		= @C1_ACCITEM		
      ,[C1_IDAPS]		= @C1_IDAPS		
      ,[C1_COMPRAC]		= @C1_COMPRAC		
      ,[C1_FISCORI]		= @C1_FISCORI		
      ,[C1_ITSCORI]		= @C1_ITSCORI		
      ,[C1_SCORI]		= @C1_SCORI		
      ,[C1_USRCODE]		= @C1_USRCODE		
      ,[C1_PRDREF]		= @C1_PRDREF		
      ,[C1_TIPCOM]		= @C1_TIPCOM		
      ,[C1_PEDRES]		= @C1_PEDRES		
      ,[C1_NRBPIMS]		= @C1_NRBPIMS		
      ,[C1_EC05DB]		= @C1_EC05DB		
      ,[C1_EC05CR]		= @C1_EC05CR		
      ,[C1_EC06DB]		= @C1_EC06DB		
      ,[C1_EC06CR]		= @C1_EC06CR		
      ,[C1_EC07DB]		= @C1_EC07DB		
      ,[C1_EC07CR]		= @C1_EC07CR		
      ,[C1_EC08DB]		= @C1_EC08DB		
      ,[C1_EC08CR]		= @C1_EC08CR		
      ,[C1_EC09DB]		= @C1_EC09DB		
      ,[C1_EC09CR]		= @C1_EC09CR		
      ,[D_E_L_E_T_]		= @D_E_L_E_T_		
      --,[R_E_C_N_O_]		= @R_E_C_N_O_		
      ,[C1_ZNSCFLU]		= @C1_ZNSCFLU		
      ,[C1_ZZEMERG]		= @C1_ZZEMERG		
      ,[C1_ZZUSO]		= @C1_ZZUSO		
      ,[C1_ZZDTDIG]		= @C1_ZZDTDIG		
      ,[C1_ZNATURE]		= @C1_ZNATURE		
      ,[C1_ZSUBFLU]		= @C1_ZSUBFLU		
      ,[C1_ZZLOCSO]		= @C1_ZZLOCSO		
      ,[C1_USERLGI]		= @C1_USERLGI		
      ,[C1_USERLGA]		= @C1_USERLGA		
      ,[C1_ZCODZE1]		= @C1_ZCODZE1		
      ,[C1_ZITEZE1]		= @C1_ZITEZE1		
      ,[C1_ZZTPSOL]		= @C1_ZZTPSOL		
      ,[C1_ZNOS]		= @C1_ZNOS		
      ,[C1_MSEXP]		= @C1_MSEXP		
      ,[dt_alteracao]	= getdate()
	  ,C1_FILIAL        =@C1_FILIAL
	  ,C1_NUM			=@C1_NUM
	  ,C1_ITEM			=@C1_ITEM
	  ,C1_ITEMGRD		=@C1_ITEMGRD
	  ,R_E_C_D_E_L_		=@R_E_C_D_E_L_
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSC5010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE proc [dbo].[sp_alteraRegistroSC5010] 
	@sk_destino int
    ,@C5_TIPO varchar(1)
    ,@C5_CLIENTE varchar(6)
    ,@C5_LOJACLI varchar(2)
    ,@C5_CLIENT varchar(6)
    ,@C5_LOJAENT varchar(2)
    ,@C5_TRANSP varchar(6)
    ,@C5_TIPOCLI varchar(1)
    ,@C5_MSBLQL varchar(1)
    ,@C5_CONDPAG varchar(3)
    ,@C5_TABELA varchar(3)
    ,@C5_VEND1 varchar(6)
    ,@C5_COMIS1 float
    ,@C5_VEND2 varchar(6)
    ,@C5_COMIS2 float
    ,@C5_VEND3 varchar(6)
    ,@C5_COMIS3 float
    ,@C5_VEND4 varchar(6)
    ,@C5_COMIS4 float
    ,@C5_VEND5 varchar(6)
    ,@C5_COMIS5 float
    ,@C5_DESC1 float
    ,@C5_DESC2 float
    ,@C5_DESC3 float
    ,@C5_DESC4 float
    ,@C5_BANCO varchar(3)
    ,@C5_DESCFI float
    ,@C5_EMISSAO varchar(8)
    ,@C5_COTACAO varchar(6)
    ,@C5_PARC1 float
    ,@C5_DATA1 varchar(8)
    ,@C5_PARC2 float
    ,@C5_DATA2 varchar(8)
    ,@C5_PARC3 float
    ,@C5_DATA3 varchar(8)
    ,@C5_PARC4 float
    ,@C5_DATA4 varchar(8)
    ,@C5_TPFRETE varchar(1)
    ,@C5_FRETE float
    ,@C5_SEGURO float
    ,@C5_DESPESA float
    ,@C5_FRETAUT float
    ,@C5_REAJUST varchar(3)
    ,@C5_MOEDA float
    ,@C5_PESOL float
    ,@C5_PBRUTO float
    ,@C5_REIMP float
    ,@C5_REDESP varchar(6)
    ,@C5_VOLUME1 float
    ,@C5_VOLUME2 float
    ,@C5_VOLUME3 float
    ,@C5_VOLUME4 float
    ,@C5_ESPECI1 varchar(10)
    ,@C5_ESPECI2 varchar(10)
    ,@C5_ESPECI3 varchar(10)
    ,@C5_ESPECI4 varchar(10)
    ,@C5_ACRSFIN float
    ,@C5_MENNOTA varchar(100)
    ,@C5_MENPAD varchar(3)
    ,@C5_INCISS varchar(1)
    ,@C5_LIBEROK varchar(1)
    ,@C5_OK varchar(2)
    ,@C5_NOTA varchar(9)
    ,@C5_SERIE varchar(3)
    ,@C5_KITREP varchar(6)
    ,@C5_OS varchar(6)
    ,@C5_TIPLIB varchar(1)
    ,@C5_DESCONT float
    ,@C5_PEDEXP varchar(20)
    ,@C5_TXMOEDA float
    ,@C5_TPCARGA varchar(1)
    ,@C5_DTLANC varchar(8)
    ,@C5_PDESCAB float
    ,@C5_BLQ varchar(1)
    ,@C5_FORNISS varchar(6)
    ,@C5_CONTRA varchar(10)
    ,@C5_VLR_FRT float
    ,@C5_MDCONTR varchar(15)
    ,@C5_GERAWMS varchar(1)
    ,@C5_MDNUMED varchar(6)
    ,@C5_MDPLANI varchar(6)
    ,@C5_SOLFRE varchar(2)
    ,@C5_FECENT varchar(8)
    ,@C5_SOLOPC varchar(1)
    ,@C5_SUGENT varchar(8)
    ,@C5_CODED varchar(15)
    ,@C5_NUMPR varchar(15)
    ,@C5_RECFAUT varchar(1)
    ,@C5_RECISS varchar(1)
    ,@C5_ORCRES varchar(6)
    ,@C5_ESTPRES varchar(2)
    ,@C5_OBRA varchar(10)
    ,@C5_MUNPRES varchar(7)
    ,@C5_ORIGEM varchar(15)
    ,@C5_VEICULO varchar(8)
    ,@C5_NUMENT varchar(9)
    ,@C5_NATUREZ varchar(10)
    ,@C5_TPCOMPL varchar(1)
    ,@C5_TABTRF varchar(3)
    ,@C5_DESCMUN varchar(30)
    ,@C5_PREPEMB varchar(1)
    ,@C5_DTTXREF varchar(8)
    ,@C5_TXREF float
    ,@C5_MOEDTIT float
    ,@C5_NFSUBST varchar(9)
    ,@C5_CNO varchar(6)
    ,@C5_FILGCT varchar(2)
    ,@C5_INDPRES varchar(1)
    ,@C5_ARTOBRA varchar(15)
    ,@C5_TIPOBRA varchar(1)
    ,@C5_IMINT varchar(18)
    ,@C5_CGCINT varchar(14)
    ,@C5_CLIINT varchar(40)
    ,@C5_PEDECOM varchar(10)
    ,@C5_RASTR varchar(20)
    ,@C5_STATUS varchar(2)
    ,@C5_SDOC varchar(3)
    ,@C5_SDOCSUB varchar(3)
    ,@C5_ECSEDEX varchar(13)
    ,@C5_SERSUBS varchar(3)
    ,@C5_ECPRESN varchar(1)
    ,@C5_VOLTAPS varchar(1)
    ,@C5_ECVINCU varchar(6)
    ,@C5_NTEMPEN varchar(22)
    ,@C5_REMCTR varchar(15)
    ,@C5_CODEMB varchar(4)
    ,@C5_REMREV varchar(3)
    ,@C5_PLACA2 varchar(7)
    ,@C5_MODANP varchar(2)
    ,@C5_CODVGLP varchar(6)
    ,@C5_CODMOT varchar(11)
    ,@C5_SLENVT varchar(1)
    ,@C5_RET20G varchar(1)
    ,@C5_PLACA1 varchar(7)
    ,@C5_ZZOBS varbinary(max)
    ,@C5_IDFLUIG float
    ,@C5_ZZOBSFL varbinary(max)
    ,@C5_ZZPFATU varchar(1)
    ,@C5_ZZCC varchar(9)
    ,@C5_ZDTRESI varchar(8)
    ,@C5_ZQTDRES float
    ,@C5_ZCTBRES varchar(1)
    ,@C5_ZCTBAPV varchar(1)
    ,@C5_TRCNUM varchar(15)
    ,@C5_CODSAF varchar(15)
    ,@C5_CLIRET varchar(6)
    ,@C5_LOJARET varchar(2)
    ,@C5_USERLGI varchar(17)
    ,@C5_USERLGA varchar(17)
    ,@C5_ZZCCORI varchar(9)
    ,@C5_FRTCFOP varchar(5)
    ,@C5_CMUNOR varchar(5)
    ,@C5_UFDEST varchar(2)
    ,@C5_CMUNDE varchar(5)
    ,@C5_UFORIG varchar(2)
    ,@C5_CLIREM varchar(6)
    ,@C5_LOJAREM varchar(2)
    --,@C5_ZZIBGE varchar(7)
    ,@D_E_L_E_T_ varchar(1)
    ,@R_E_C_N_O_ int
	,@R_E_C_D_E_L_ int
	,@C5_FILIAL varchar(2)
	,@C5_NUM varchar(6)
as

UPDATE [dbo].[SC5010]
   SET [C5_FILIAL]		= @C5_FILIAL
      ,C5_NUM			= @C5_NUM
      ,C5_TIPO			= @C5_TIPO		
      ,C5_CLIENTE		= @C5_CLIENTE	
      ,C5_LOJACLI		= @C5_LOJACLI	
      ,C5_CLIENT		= @C5_CLIENT	
      ,C5_LOJAENT		= @C5_LOJAENT	
      ,C5_TRANSP		= @C5_TRANSP	
      ,C5_TIPOCLI		= @C5_TIPOCLI	
      ,C5_MSBLQL		= @C5_MSBLQL	
      ,C5_CONDPAG		= @C5_CONDPAG	
      ,C5_TABELA		= @C5_TABELA	
      ,C5_VEND1			= @C5_VEND1		
      ,C5_COMIS1		= @C5_COMIS1	
      ,C5_VEND2			= @C5_VEND2		
      ,C5_COMIS2		= @C5_COMIS2	
      ,C5_VEND3			= @C5_VEND3		
      ,C5_COMIS3		= @C5_COMIS3	
      ,C5_VEND4			= @C5_VEND4		
      ,C5_COMIS4		= @C5_COMIS4	
      ,C5_VEND5			= @C5_VEND5		
      ,C5_COMIS5		= @C5_COMIS5	
      ,C5_DESC1			= @C5_DESC1		
      ,C5_DESC2			= @C5_DESC2		
      ,C5_DESC3			= @C5_DESC3		
      ,C5_DESC4			= @C5_DESC4		
      ,C5_BANCO			= @C5_BANCO		
      ,C5_DESCFI		= @C5_DESCFI	
      ,C5_EMISSAO		= @C5_EMISSAO	
      ,C5_COTACAO		= @C5_COTACAO	
      ,C5_PARC1			= @C5_PARC1		
      ,C5_DATA1			= @C5_DATA1		
      ,C5_PARC2			= @C5_PARC2		
      ,C5_DATA2			= @C5_DATA2		
      ,C5_PARC3			= @C5_PARC3		
      ,C5_DATA3			= @C5_DATA3		
      ,C5_PARC4			= @C5_PARC4		
      ,C5_DATA4			= @C5_DATA4		
      ,C5_TPFRETE		= @C5_TPFRETE	
      ,C5_FRETE			= @C5_FRETE		
      ,C5_SEGURO		= @C5_SEGURO	
      ,C5_DESPESA		= @C5_DESPESA	
      ,C5_FRETAUT		= @C5_FRETAUT	
      ,C5_REAJUST		= @C5_REAJUST	
      ,C5_MOEDA			= @C5_MOEDA		
      ,C5_PESOL			= @C5_PESOL		
      ,C5_PBRUTO		= @C5_PBRUTO	
      ,C5_REIMP			= @C5_REIMP		
      ,C5_REDESP		= @C5_REDESP	
      ,C5_VOLUME1		= @C5_VOLUME1	
      ,C5_VOLUME2		= @C5_VOLUME2	
      ,C5_VOLUME3		= @C5_VOLUME3	
      ,C5_VOLUME4		= @C5_VOLUME4	
      ,C5_ESPECI1		= @C5_ESPECI1	
      ,C5_ESPECI2		= @C5_ESPECI2	
      ,C5_ESPECI3		= @C5_ESPECI3	
      ,C5_ESPECI4		= @C5_ESPECI4	
      ,C5_ACRSFIN		= @C5_ACRSFIN	
      ,C5_MENNOTA		= @C5_MENNOTA	
      ,C5_MENPAD		= @C5_MENPAD	
      ,C5_INCISS		= @C5_INCISS	
      ,C5_LIBEROK		= @C5_LIBEROK	
      ,C5_OK			= @C5_OK		
      ,C5_NOTA			= @C5_NOTA		
      ,C5_SERIE			= @C5_SERIE		
      ,C5_KITREP		= @C5_KITREP	
      ,C5_OS			= @C5_OS		
      ,C5_TIPLIB		= @C5_TIPLIB	
      ,C5_DESCONT		= @C5_DESCONT	
      ,C5_PEDEXP		= @C5_PEDEXP	
      ,C5_TXMOEDA		= @C5_TXMOEDA	
      ,C5_TPCARGA		= @C5_TPCARGA	
      ,C5_DTLANC		= @C5_DTLANC	
      ,C5_PDESCAB		= @C5_PDESCAB	
      ,C5_BLQ			= @C5_BLQ		
      ,C5_FORNISS		= @C5_FORNISS	
      ,C5_CONTRA		= @C5_CONTRA	
      ,C5_VLR_FRT		= @C5_VLR_FRT	
      ,C5_MDCONTR		= @C5_MDCONTR	
      ,C5_GERAWMS		= @C5_GERAWMS	
      ,C5_MDNUMED		= @C5_MDNUMED	
      ,C5_MDPLANI		= @C5_MDPLANI	
      ,C5_SOLFRE		= @C5_SOLFRE	
      ,C5_FECENT		= @C5_FECENT	
      ,C5_SOLOPC		= @C5_SOLOPC	
      ,C5_SUGENT		= @C5_SUGENT	
      ,C5_CODED			= @C5_CODED		
      ,C5_NUMPR			= @C5_NUMPR		
      ,C5_RECFAUT		= @C5_RECFAUT	
      ,C5_RECISS		= @C5_RECISS	
      ,C5_ORCRES		= @C5_ORCRES	
      ,C5_ESTPRES		= @C5_ESTPRES	
      ,C5_OBRA			= @C5_OBRA		
      ,C5_MUNPRES		= @C5_MUNPRES	
      ,C5_ORIGEM		= @C5_ORIGEM	
      ,C5_VEICULO		= @C5_VEICULO	
      ,C5_NUMENT		= @C5_NUMENT	
      ,C5_NATUREZ		= @C5_NATUREZ	
      ,C5_TPCOMPL		= @C5_TPCOMPL	
      ,C5_TABTRF		= @C5_TABTRF	
      ,C5_DESCMUN		= @C5_DESCMUN	
      ,C5_PREPEMB		= @C5_PREPEMB	
      ,C5_DTTXREF		= @C5_DTTXREF	
      ,C5_TXREF			= @C5_TXREF		
      ,C5_MOEDTIT		= @C5_MOEDTIT	
      ,C5_NFSUBST		= @C5_NFSUBST	
      ,C5_CNO			= @C5_CNO		
      ,C5_FILGCT		= @C5_FILGCT	
      ,C5_INDPRES		= @C5_INDPRES	
      ,C5_ARTOBRA		= @C5_ARTOBRA	
      ,C5_TIPOBRA		= @C5_TIPOBRA	
      ,C5_IMINT			= @C5_IMINT		
      ,C5_CGCINT		= @C5_CGCINT	
      ,C5_CLIINT		= @C5_CLIINT	
      ,C5_PEDECOM		= @C5_PEDECOM	
      ,C5_RASTR			= @C5_RASTR		
      ,C5_STATUS		= @C5_STATUS	
      ,C5_SDOC			= @C5_SDOC		
      ,C5_SDOCSUB		= @C5_SDOCSUB	
      ,C5_ECSEDEX		= @C5_ECSEDEX	
      ,C5_SERSUBS		= @C5_SERSUBS	
      ,C5_ECPRESN		= @C5_ECPRESN	
      ,C5_VOLTAPS		= @C5_VOLTAPS	
      ,C5_ECVINCU		= @C5_ECVINCU	
      ,C5_NTEMPEN		= @C5_NTEMPEN	
      ,C5_REMCTR		= @C5_REMCTR	
      ,C5_CODEMB		= @C5_CODEMB	
      ,C5_REMREV		= @C5_REMREV	
      ,C5_PLACA2		= @C5_PLACA2	
      ,C5_MODANP		= @C5_MODANP	
      ,C5_CODVGLP		= @C5_CODVGLP	
      ,C5_CODMOT		= @C5_CODMOT	
      ,C5_SLENVT		= @C5_SLENVT	
      ,C5_RET20G		= @C5_RET20G	
      ,C5_PLACA1		= @C5_PLACA1	
      ,C5_ZZOBS			= @C5_ZZOBS		
      ,C5_IDFLUIG		= @C5_IDFLUIG	
      ,C5_ZZOBSFL		= @C5_ZZOBSFL	
      ,C5_ZZPFATU		= @C5_ZZPFATU	
      ,C5_ZZCC			= @C5_ZZCC		
      ,C5_ZDTRESI		= @C5_ZDTRESI	
      ,C5_ZQTDRES		= @C5_ZQTDRES	
      ,C5_ZCTBRES		= @C5_ZCTBRES	
      ,C5_ZCTBAPV		= @C5_ZCTBAPV	
      ,C5_TRCNUM		= @C5_TRCNUM	
      ,C5_CODSAF		= @C5_CODSAF	
      ,C5_CLIRET		= @C5_CLIRET	
      ,C5_LOJARET		= @C5_LOJARET	
      ,C5_USERLGI		= @C5_USERLGI	
      ,C5_USERLGA		= @C5_USERLGA	
      ,C5_ZZCCORI		= @C5_ZZCCORI	
      ,C5_FRTCFOP		= @C5_FRTCFOP	
      ,C5_CMUNOR		= @C5_CMUNOR	
      ,C5_UFDEST		= @C5_UFDEST	
      ,C5_CMUNDE		= @C5_CMUNDE	
      ,C5_UFORIG		= @C5_UFORIG	
      ,C5_CLIREM		= @C5_CLIREM	
      ,C5_LOJAREM		= @C5_LOJAREM	
      --,C5_ZZIBGE		= @C5_ZZIBGE	
      ,D_E_L_E_T_		= @D_E_L_E_T_	
      --,R_E_C_N_O_		= @R_E_C_N_O_	
      ,[R_E_C_D_E_L_]	= @R_E_C_D_E_L_
      --,[dt_criacao] = <dt_criacao, datetime,>
      ,[dt_alteracao] = getdate()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSC6010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_alteraRegistroSC6010] 
		
	   @sk_destino		int
	  ,@C6_UM			varchar(2)
      ,@C6_QTDVEN		float
      ,@C6_PRCVEN		float
      ,@C6_VALOR		float
      ,@C6_QTDLIB		float
      ,@C6_QTDLIB2		float
      ,@C6_SEGUM		varchar(2)
      ,@C6_TES			varchar(3)
      ,@C6_UNSVEN		float
      ,@C6_LOCAL		varchar(2)
      ,@C6_CF			varchar(5)
      ,@C6_QTDENT		float
      ,@C6_QTDENT2		float
      ,@C6_CLI			varchar(6)
      ,@C6_DESCONT		float
      ,@C6_VALDESC		float
      ,@C6_ENTREG		varchar(8)
      ,@C6_LA			varchar(8)
      ,@C6_LOJA			varchar(2)
      ,@C6_NOTA			varchar(9)
      ,@C6_SERIE		varchar(3)
      ,@C6_DATFAT		varchar(8)
      ,@C6_NUM			varchar(6)
      ,@C6_COMIS1		float
      ,@C6_COMIS2		float
      ,@C6_COMIS3		float
      ,@C6_COMIS4		float
      ,@C6_COMIS5		float
      ,@C6_PEDCLI		varchar(9)
      ,@C6_DESCRI		varchar(100)
      ,@C6_PRUNIT		float
      ,@C6_BLOQUEI		varchar(2)
      ,@C6_RESERVA		varchar(6)
      ,@C6_OK			varchar(2)
      ,@C6_OP			varchar(2)
      ,@C6_NFORI		varchar(9)
      ,@C6_SERIORI		varchar(3)
      ,@C6_ITEMORI		varchar(4)
      ,@C6_IPIDEV		float
      ,@C6_IDENTB6		varchar(6)
      ,@C6_BLQ			varchar(2)
      ,@C6_PICMRET		float
      ,@C6_CODISS		varchar(9)
      ,@C6_GRADE		varchar(1)
      ,@C6_ITEMGRD		varchar(3)
      ,@C6_LOTECTL		varchar(21)
      ,@C6_NUMLOTE		varchar(6)
      ,@C6_DTVALID		varchar(8)
      ,@C6_NUMORC		varchar(8)
      ,@C6_CHASSI		varchar(25)
      ,@C6_OPC			varchar(80)
      ,@C6_LOCALIZ		varchar(15)
      ,@C6_NUMSERI		varchar(20)
      ,@C6_NUMOP		varchar(6)
      ,@C6_ITEMOP		varchar(2)
      ,@C6_CLASFIS		varchar(3)
      ,@C6_QTDRESE		float
      ,@C6_CONTRAT		varchar(6)
      ,@C6_NUMOS		varchar(14)
      ,@C6_NUMOSFA		varchar(14)
      ,@C6_CODFAB		varchar(6)
      ,@C6_LOJAFA		varchar(2)
      ,@C6_ITEMCON		varchar(2)
      ,@C6_TPOP			varchar(1)
      ,@C6_REVISAO		varchar(3)
      ,@C6_SERVIC		varchar(3)
      ,@C6_ENDPAD		varchar(15)
      ,@C6_TPESTR		varchar(6)
      ,@C6_CONTRT		varchar(15)
      ,@C6_TPCONTR		varchar(1)
      ,@C6_ITCONTR		varchar(2)
      ,@C6_GEROUPV		varchar(1)
      ,@C6_PROJPMS		varchar(10)
      ,@C6_EDTPMS		varchar(12)
      ,@C6_TASKPMS		varchar(12)
      ,@C6_TRT			varchar(3)
      ,@C6_QTDEMP		float
      ,@C6_QTDEMP2		float
      ,@C6_PROJET		varchar(6)
      ,@C6_ITPROJ		varchar(2)
      ,@C6_POTENCI		float
      ,@C6_LICITA		varchar(6)
      ,@C6_REGWMS		varchar(1)
      ,@C6_MOPC			varbinary(max)
      ,@C6_NUMCP		varchar(9)
      ,@C6_NUMSC		varchar(6)
      ,@C6_ITEMSC		varchar(4)
      ,@C6_SUGENTR		varchar(8)
      ,@C6_ITEMED		varchar(3)
      ,@C6_ABSCINS		float
      ,@C6_ABATISS		float
      ,@C6_VLIMPOR		float
      ,@C6_ABATMAT		float
      ,@C6_FUNRURA		float
      ,@C6_FETAB		float
      ,@C6_CODROM		varchar(6)
      ,@C6_PROGRAM		varchar(10)
      ,@C6_TURNO		varchar(1)
      ,@C6_DTFIMNT		varchar(8)
      ,@C6_FCICOD		varchar(36)
      ,@C6_FORDED		varchar(6)
      ,@C6_LOJDED		varchar(2)
      ,@C6_CODLAN		varchar(6)
      ,@C6_BASVEIC		float
      ,@C6_ABATINS		float
      ,@C6_HORENT		varchar(4)
      ,@C6_TNATREC		varchar(4)
      ,@C6_ITEMGAR		varchar(2)
      ,@C6_ORCGAR		varchar(6)
      ,@C6_ITEMPC		varchar(6)
      ,@C6_NUMPCOM		varchar(15)
      ,@C6_GCPIT		varchar(6)
      ,@C6_GCPLT		varchar(8)
      ,@C6_CC			varchar(9)
      ,@C6_CONTA		varchar(20)
      ,@C6_ITEMCTA		varchar(9)
      ,@C6_CLVL			varchar(9)
      ,@C6_ALMTERC		varchar(2)
      ,@C6_CCUSTO		varchar(9)
      ,@C6_SOLCOM		varchar(6)
      ,@C6_VDMOST		varchar(1)
      ,@C6_VDOBS		varbinary(max)
      ,@C6_PEDCOM		varchar(6)
      ,@C6_ITPC			varchar(4)
      ,@C6_FILPED		varchar(2)
      ,@C6_PVCOMOP		varchar(1)
      ,@C6_PMSID		varchar(10)
      ,@C6_SERDED		varchar(3)
      ,@C6_NFDED		varchar(9)
      ,@C6_VLDED		float
      ,@C6_VLNFD		float
      ,@C6_PCDED		float
      ,@C6_TPDEDUZ		varchar(1)
      ,@C6_MOTDED		varchar(1)
      ,@C6_RATEIO		varchar(1)
      ,@C6_REVPROD		varchar(3)
      ,@C6_PEDVINC		varchar(6)
      ,@C6_CNATREC		varchar(3)
      ,@C6_GRPNATR		varchar(2)
      ,@C6_PRODFIN		varchar(15)
      ,@C6_CODLPRE		varchar(6)
      ,@C6_D1ITEM		varchar(4)
      ,@C6_ITLPRE		varchar(3)
      ,@C6_D1DOC		varchar(15)
      ,@C6_CODINF		varchar(6)
      ,@C6_D1SERIE		varchar(3)
      ,@C6_CSTPIS		varchar(2)
      ,@C6_IPITRF		float
      ,@C6_SDOC			varchar(3)
      ,@C6_SDOCDED		varchar(3)
      ,@C6_SDOCSD1		varchar(3)
      ,@C6_SDOCORI		varchar(3)
      ,@C6_NRSEQCQ		varchar(6)
      ,@C6_TPPROD		varchar(1)
      ,@C6_ZZMEDB		varchar(16)
      ,@C6_ZZMECR		varchar(16)
      ,@C6_ZZMODB		varchar(16)
      ,@C6_ZZMOCR		varchar(16)
      ,@C6_ZZLODB		varchar(16)
      ,@C6_ZZLOCR		varchar(16)
      ,@C6_ZZATDB		varchar(16)
      ,@C6_ZZATCR		varchar(16)
      ,@C6_ZZLEDB		varchar(16)
      ,@C6_ZZLECR		varchar(16)
      ,@C6_HORCPL		varchar(8)
      ,@C6_DATCPL		varchar(8)
      ,@C6_INTROT		varchar(1)
      ,@C6_DATAEMB		varchar(8)
      ,@C6_PENE			varchar(4)
      ,@C6_CATEG		varchar(2)
      ,@C6_CTVAR		varchar(10)
      ,@C6_CULTRA		varchar(10)
      ,@C6_ZDTRESI		varchar(8)
      ,@C6_ZQTDRES		float
      ,@C6_ZQTDAPR		float
      ,@C6_ZQTNAPR		float
      ,@C6_ZQTSALD		float
      ,@C6_ZCTBRES		varchar(1)
      ,@C6_TPREPAS		varchar(6)
      ,@C6_USERLGI		varchar(17)
      ,@C6_USERLGA		varchar(17)
      ,@C6_OPER			varchar(2)
      ,@C6_ZPDEINS		float
      ,@D_E_L_E_T_		varchar(1)
      ,@R_E_C_N_O_		int
	  ,@C6_FILIAL		varchar(2)
	  ,@C6_ITEM			varchar(2)
	  ,@C6_PRODUTO		varchar(15)
	  ,@R_E_C_D_E_L_ int

as

UPDATE [dbo].[SC6010]
   SET [C6_FILIAL]		= @C6_FILIAL
      ,[C6_ITEM]		= @C6_ITEM
      ,[C6_PRODUTO]		= @C6_PRODUTO
      ,[C6_UM]			= @C6_UM
      ,[C6_QTDVEN]		= @C6_QTDVEN	
      ,[C6_PRCVEN]		= @C6_PRCVEN	
      ,[C6_VALOR]		= @C6_VALOR	
      ,[C6_QTDLIB]		= @C6_QTDLIB	
      ,[C6_QTDLIB2]		= @C6_QTDLIB2	
      ,[C6_SEGUM]		= @C6_SEGUM	
      ,[C6_TES]			= @C6_TES		
      ,[C6_UNSVEN]		= @C6_UNSVEN	
      ,[C6_LOCAL]		= @C6_LOCAL	
      ,[C6_CF]			= @C6_CF		
      ,[C6_QTDENT]		= @C6_QTDENT	
      ,[C6_QTDENT2]		= @C6_QTDENT2	
      ,[C6_CLI]			= @C6_CLI		
      ,[C6_DESCONT]		= @C6_DESCONT	
      ,[C6_VALDESC]		= @C6_VALDESC	
      ,[C6_ENTREG]		= @C6_ENTREG	
      ,[C6_LA]			= @C6_LA		
      ,[C6_LOJA]		= @C6_LOJA		
      ,[C6_NOTA]		= @C6_NOTA		
      ,[C6_SERIE]		= @C6_SERIE	
      ,[C6_DATFAT]		= @C6_DATFAT	
      ,[C6_NUM]			= @C6_NUM		
      ,[C6_COMIS1]		= @C6_COMIS1	
      ,[C6_COMIS2]		= @C6_COMIS2	
      ,[C6_COMIS3]		= @C6_COMIS3	
      ,[C6_COMIS4]		= @C6_COMIS4	
      ,[C6_COMIS5]		= @C6_COMIS5	
      ,[C6_PEDCLI]		= @C6_PEDCLI	
      ,[C6_DESCRI]		= @C6_DESCRI	
      ,[C6_PRUNIT]		= @C6_PRUNIT	
      ,[C6_BLOQUEI]		= @C6_BLOQUEI	
      ,[C6_RESERVA]		= @C6_RESERVA	
      ,[C6_OK]			= @C6_OK		
      ,[C6_OP]			= @C6_OP		
      ,[C6_NFORI]		= @C6_NFORI	
      ,[C6_SERIORI]		= @C6_SERIORI	
      ,[C6_ITEMORI]		= @C6_ITEMORI	
      ,[C6_IPIDEV]		= @C6_IPIDEV	
      ,[C6_IDENTB6]		= @C6_IDENTB6	
      ,[C6_BLQ]			= @C6_BLQ		
      ,[C6_PICMRET]		= @C6_PICMRET	
      ,[C6_CODISS]		= @C6_CODISS	
      ,[C6_GRADE]		= @C6_GRADE	
      ,[C6_ITEMGRD]		= @C6_ITEMGRD	
      ,[C6_LOTECTL]		= @C6_LOTECTL	
      ,[C6_NUMLOTE]		= @C6_NUMLOTE	
      ,[C6_DTVALID]		= @C6_DTVALID	
      ,[C6_NUMORC]		= @C6_NUMORC	
      ,[C6_CHASSI]		= @C6_CHASSI	
      ,[C6_OPC]			= @C6_OPC		
      ,[C6_LOCALIZ]		= @C6_LOCALIZ	
      ,[C6_NUMSERI]		= @C6_NUMSERI	
      ,[C6_NUMOP]		= @C6_NUMOP	
      ,[C6_ITEMOP]		= @C6_ITEMOP	
      ,[C6_CLASFIS]		= @C6_CLASFIS	
      ,[C6_QTDRESE]		= @C6_QTDRESE	
      ,[C6_CONTRAT]		= @C6_CONTRAT	
      ,[C6_NUMOS]		= @C6_NUMOS	
      ,[C6_NUMOSFA]		= @C6_NUMOSFA	
      ,[C6_CODFAB]		= @C6_CODFAB	
      ,[C6_LOJAFA]		= @C6_LOJAFA	
      ,[C6_ITEMCON]		= @C6_ITEMCON	
      ,[C6_TPOP]		= @C6_TPOP		
      ,[C6_REVISAO]		= @C6_REVISAO	
      ,[C6_SERVIC]		= @C6_SERVIC	
      ,[C6_ENDPAD]		= @C6_ENDPAD	
      ,[C6_TPESTR]		= @C6_TPESTR	
      ,[C6_CONTRT]		= @C6_CONTRT	
      ,[C6_TPCONTR]		= @C6_TPCONTR	
      ,[C6_ITCONTR]		= @C6_ITCONTR	
      ,[C6_GEROUPV]		= @C6_GEROUPV	
      ,[C6_PROJPMS]		= @C6_PROJPMS	
      ,[C6_EDTPMS]		= @C6_EDTPMS	
      ,[C6_TASKPMS]		= @C6_TASKPMS	
      ,[C6_TRT]			= @C6_TRT		
      ,[C6_QTDEMP]		= @C6_QTDEMP	
      ,[C6_QTDEMP2]		= @C6_QTDEMP2	
      ,[C6_PROJET]		= @C6_PROJET	
      ,[C6_ITPROJ]		= @C6_ITPROJ	
      ,[C6_POTENCI]		= @C6_POTENCI	
      ,[C6_LICITA]		= @C6_LICITA	
      ,[C6_REGWMS]		= @C6_REGWMS	
      ,[C6_MOPC]		= @C6_MOPC		
      ,[C6_NUMCP]		= @C6_NUMCP	
      ,[C6_NUMSC]		= @C6_NUMSC	
      ,[C6_ITEMSC]		= @C6_ITEMSC	
      ,[C6_SUGENTR]		= @C6_SUGENTR	
      ,[C6_ITEMED]		= @C6_ITEMED	
      ,[C6_ABSCINS]		= @C6_ABSCINS	
      ,[C6_ABATISS]		= @C6_ABATISS	
      ,[C6_VLIMPOR]		= @C6_VLIMPOR	
      ,[C6_ABATMAT]		= @C6_ABATMAT	
      ,[C6_FUNRURA]		= @C6_FUNRURA	
      ,[C6_FETAB]		= @C6_FETAB	
      ,[C6_CODROM]		= @C6_CODROM	
      ,[C6_PROGRAM]		= @C6_PROGRAM	
      ,[C6_TURNO]		= @C6_TURNO	
      ,[C6_DTFIMNT]		= @C6_DTFIMNT	
      ,[C6_FCICOD]		= @C6_FCICOD	
      ,[C6_FORDED]		= @C6_FORDED	
      ,[C6_LOJDED]		= @C6_LOJDED	
      ,[C6_CODLAN]		= @C6_CODLAN	
      ,[C6_BASVEIC]		= @C6_BASVEIC	
      ,[C6_ABATINS]		= @C6_ABATINS	
      ,[C6_HORENT]		= @C6_HORENT	
      ,[C6_TNATREC]		= @C6_TNATREC	
      ,[C6_ITEMGAR]		= @C6_ITEMGAR	
      ,[C6_ORCGAR]		= @C6_ORCGAR	
      ,[C6_ITEMPC]		= @C6_ITEMPC	
      ,[C6_NUMPCOM]		= @C6_NUMPCOM	
      ,[C6_GCPIT]		= @C6_GCPIT	
      ,[C6_GCPLT]		= @C6_GCPLT	
      ,[C6_CC]			= @C6_CC		
      ,[C6_CONTA]		= @C6_CONTA	
      ,[C6_ITEMCTA]		= @C6_ITEMCTA	
      ,[C6_CLVL]		= @C6_CLVL		
      ,[C6_ALMTERC]		= @C6_ALMTERC	
      ,[C6_CCUSTO]		= @C6_CCUSTO	
      ,[C6_SOLCOM]		= @C6_SOLCOM	
      ,[C6_VDMOST]		= @C6_VDMOST	
      ,[C6_VDOBS]		= @C6_VDOBS	
      ,[C6_PEDCOM]		= @C6_PEDCOM	
      ,[C6_ITPC]		= @C6_ITPC		
      ,[C6_FILPED]		= @C6_FILPED	
      ,[C6_PVCOMOP]		= @C6_PVCOMOP	
      ,[C6_PMSID]		= @C6_PMSID	
      ,[C6_SERDED]		= @C6_SERDED	
      ,[C6_NFDED]		= @C6_NFDED	
      ,[C6_VLDED]		= @C6_VLDED	
      ,[C6_VLNFD]		= @C6_VLNFD	
      ,[C6_PCDED]		= @C6_PCDED	
      ,[C6_TPDEDUZ]		= @C6_TPDEDUZ	
      ,[C6_MOTDED]		= @C6_MOTDED	
      ,[C6_RATEIO]		= @C6_RATEIO	
      ,[C6_REVPROD]		= @C6_REVPROD	
      ,[C6_PEDVINC]		= @C6_PEDVINC	
      ,[C6_CNATREC]		= @C6_CNATREC	
      ,[C6_GRPNATR]		= @C6_GRPNATR	
      ,[C6_PRODFIN]		= @C6_PRODFIN	
      ,[C6_CODLPRE]		= @C6_CODLPRE	
      ,[C6_D1ITEM]		= @C6_D1ITEM	
      ,[C6_ITLPRE]		= @C6_ITLPRE	
      ,[C6_D1DOC]		= @C6_D1DOC	
      ,[C6_CODINF]		= @C6_CODINF	
      ,[C6_D1SERIE]		= @C6_D1SERIE	
      ,[C6_CSTPIS]		= @C6_CSTPIS	
      ,[C6_IPITRF]		= @C6_IPITRF	
      ,[C6_SDOC]		= @C6_SDOC		
      ,[C6_SDOCDED]		= @C6_SDOCDED	
      ,[C6_SDOCSD1]		= @C6_SDOCSD1	
      ,[C6_SDOCORI]		= @C6_SDOCORI	
      ,[C6_NRSEQCQ]		= @C6_NRSEQCQ	
      ,[C6_TPPROD]		= @C6_TPPROD	
      ,[C6_ZZMEDB]		= @C6_ZZMEDB	
      ,[C6_ZZMECR]		= @C6_ZZMECR	
      ,[C6_ZZMODB]		= @C6_ZZMODB	
      ,[C6_ZZMOCR]		= @C6_ZZMOCR	
      ,[C6_ZZLODB]		= @C6_ZZLODB	
      ,[C6_ZZLOCR]		= @C6_ZZLOCR	
      ,[C6_ZZATDB]		= @C6_ZZATDB	
      ,[C6_ZZATCR]		= @C6_ZZATCR	
      ,[C6_ZZLEDB]		= @C6_ZZLEDB	
      ,[C6_ZZLECR]		= @C6_ZZLECR	
      ,[C6_HORCPL]		= @C6_HORCPL	
      ,[C6_DATCPL]		= @C6_DATCPL	
      ,[C6_INTROT]		= @C6_INTROT	
      ,[C6_DATAEMB]		= @C6_DATAEMB	
      ,[C6_PENE]		= @C6_PENE		
      ,[C6_CATEG]		= @C6_CATEG	
      ,[C6_CTVAR]		= @C6_CTVAR	
      ,[C6_CULTRA]		= @C6_CULTRA	
      ,[C6_ZDTRESI]		= @C6_ZDTRESI	
      ,[C6_ZQTDRES]		= @C6_ZQTDRES	
      ,[C6_ZQTDAPR]		= @C6_ZQTDAPR	
      ,[C6_ZQTNAPR]		= @C6_ZQTNAPR	
      ,[C6_ZQTSALD]		= @C6_ZQTSALD	
      ,[C6_ZCTBRES]		= @C6_ZCTBRES	
      ,[C6_TPREPAS]		= @C6_TPREPAS	
      ,[C6_USERLGI]		= @C6_USERLGI	
      ,[C6_USERLGA]		= @C6_USERLGA	
      ,[C6_OPER]		= @C6_OPER		
      ,[C6_ZPDEINS]		= @C6_ZPDEINS	
      ,[D_E_L_E_T_]		= @D_E_L_E_T_	
      --,[R_E_C_N_O_]		= @R_E_C_N_O_	
      ,[R_E_C_D_E_L_]   = @R_E_C_D_E_L_
      ,[dt_alteracao]	= getdate()
 WHERE sk_destino = @sk_destino



GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSC7010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_alteraRegistroSC7010]

-- C7_FILIAL, C7_NUM, C7_ITEM, C7_SEQUEN, C7_ITEMGRD, R_E_C_D_E_L_
@sk_destino int
,@C7_TIPO float
,@C7_PRODUTO varchar(15)
,@C7_UM varchar(2)
,@C7_SEGUM varchar(2)
,@C7_QUANT float
,@C7_CODTAB varchar(3)
,@C7_PRECO float
,@C7_TOTAL float
,@C7_QTSEGUM float
,@C7_IPI float
,@C7_NUMSC varchar(6)
,@C7_ITEMSC varchar(4)
,@C7_DINICOM varchar(8)
,@C7_DINITRA varchar(8)
,@C7_DINICQ varchar(8)
,@C7_DATPRF varchar(8)
,@C7_LOCAL varchar(2)
,@C7_OBS varchar(200)
,@C7_FORNECE varchar(6)
,@C7_CC varchar(9)
,@C7_CONTA varchar(20)
,@C7_ITEMCTA varchar(9)
,@C7_LOJA varchar(2)
,@C7_COND varchar(3)
,@C7_CONTATO varchar(15)
,@C7_FILENT varchar(2)
,@C7_DESC1 float
,@C7_DESC2 float
,@C7_DESC3 float
,@C7_EMISSAO varchar(8)
,@C7_QUJE float
,@C7_REAJUST varchar(3)
,@C7_FRETE float
,@C7_EMITIDO varchar(1)
,@C7_DESCRI varchar(100)
,@C7_TPFRETE varchar(1)
,@C7_QTDREEM float
,@C7_CODLIB varchar(10)
,@C7_RESIDUO varchar(1)
,@C7_NUMCOT varchar(6)
,@C7_MSG varchar(3)
,@C7_TX varchar(2)
,@C7_CONTROL varchar(1)
,@C7_IPIBRUT varchar(1)
,@C7_ENCER varchar(1)
,@C7_OP varchar(14)
,@C7_VLDESC float
,@C7_NUMIMP varchar(6)
,@C7_ORIGEM varchar(8)
,@C7_QTDACLA float
,@C7_VALEMB float
,@C7_FLUXO varchar(1)
,@C7_TPOP varchar(1)
,@C7_APROV varchar(6)
,@C7_CONAPRO varchar(1)
,@C7_GRUPCOM varchar(6)
,@C7_USER varchar(6)
,@C7_STATME varchar(1)
,@C7_OK varchar(2)
,@C7_RESREM varchar(1)
,@C7_QTDSOL float
,@C7_VALIPI float
,@C7_VALICM float
,@C7_TES varchar(3)
,@C7_DESC float
,@C7_PICM float
,@C7_BASEICM float
,@C7_BASEIPI float
,@C7_SEGURO float
,@C7_DESPESA float
,@C7_VALFRE float
,@C7_MOEDA float
,@C7_TXMOEDA float
,@C7_PENDEN varchar(1)
,@C7_CLVL varchar(9)
,@C7_BASEIR float
,@C7_ALIQIR float
,@C7_VALIR float
,@C7_ICMCOMP float
,@C7_ICMSRET float
,@C7_BASIMP5 float
,@C7_BASIMP6 float
,@C7_ESTOQUE varchar(1)
,@C7_SOLICIT varchar(30)
,@C7_VALSOL float
,@C7_VALIMP5 float
,@C7_VALIMP6 float
,@C7_SEQMRP varchar(6)
,@C7_CODORCA varchar(8)
,@C7_DTLANC varchar(8)
,@C7_CODCRED varchar(6)
,@C7_TIPOEMP varchar(1)
,@C7_ESPEMP varchar(1)
,@C7_CONTRA varchar(15)
,@C7_CONTREV varchar(3)
,@C7_PLANILH varchar(6)
,@C7_MEDICAO varchar(6)
,@C7_ITEMED varchar(10)
,@C7_FREPPCC varchar(2)
,@C7_POLREPR varchar(1)
,@C7_PERREPR float
,@C7_DT_IMP varchar(8)
,@C7_AGENTE varchar(3)
,@C7_GRADE varchar(1)
,@C7_FORWARD varchar(3)
,@C7_TIPO_EM varchar(3)
,@C7_ORIGIMP varchar(3)
,@C7_DEST varchar(3)
,@C7_COMPRA varchar(3)
,@C7_PESO_B float
,@C7_INCOTER varchar(3)
,@C7_IMPORT varchar(3)
,@C7_CONSIG varchar(3)
,@C7_CONF_PE varchar(8)
,@C7_DESP varchar(3)
,@C7_EXPORTA varchar(6)
,@C7_LOJAEXP varchar(2)
,@C7_CONTAIN varchar(1)
,@C7_MT3 float
,@C7_CONTA20 float
,@C7_CONTA40 float
,@C7_CON40HC float
,@C7_ARMAZEM varchar(7)
,@C7_FABRICA varchar(6)
,@C7_LOJFABR varchar(2)
,@C7_DT_EMB varchar(8)
,@C7_TEC varchar(10)
,@C7_EX_NCM varchar(3)
,@C7_EX_NBM varchar(3)
,@C7_BASESOL float
,@C7_DIACTB varchar(2)
,@C7_NODIA varchar(10)
,@C7_PO_EIC varchar(15)
,@C7_CODED varchar(15)
,@C7_NUMPR varchar(15)
,@C7_OBSM varbinary(max)
,@C7_TIPCOM varchar(3)
,@C7_FILEDT varchar(2)
,@C7_NUMSA varchar(6)
,@C7_REVISAO varchar(3)
,@C7_ACCPROC varchar(1)
,@C7_BASECSL float
,@C7_ALIQINS float
,@C7_VALINS float
,@C7_ALQCSL float
,@C7_ALIQISS float
,@C7_VALISS float
,@C7_TPCOLAB varchar(3)
,@C7_IDTSS varchar(15)
,@C7_CODNE varchar(12)
,@C7_ITEMNE varchar(3)
,@C7_GCPIT varchar(6)
,@C7_GCPLT varchar(8)
,@C7_FILCEN varchar(2)
,@C7_RATEIO varchar(1)
,@C7_ACCNUM varchar(50)
,@C7_ACCITEM varchar(50)
,@C7_BASEINS float
,@C7_VALCSL float
,@C7_LOTPLS varchar(10)
,@C7_CODRDA varchar(6)
,@C7_BASEISS float
,@C7_FISCORI varchar(2)
,@C7_PLOPELT varchar(4)
,@C7_OBRIGA varbinary(max)
,@C7_DIREITO varbinary(max)
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@C7_EC05DB varchar(16)
,@C7_EC05CR varchar(16)
,@C7_EC06DB varchar(16)
,@C7_EC06CR varchar(16)
,@C7_EC07DB varchar(16)
,@C7_EC07CR varchar(16)
,@C7_EC08DB varchar(16)
,@C7_EC08CR varchar(16)
,@C7_EC09DB varchar(16)
,@C7_EC09CR varchar(16)
,@C7_ZZUSO varchar(1)
,@C7_ZZFLUIG varchar(20)
,@C7_ZZORIPC varchar(20)
,@C7_ZNATURE varchar(10)
,@C7_USERLGI varchar(17)
,@C7_USERLGA varchar(17)
,@C7_DEDUCAO float
,@C7_QUJERET float
,@C7_TRANSP varchar(6)
,@C7_QUJEFAT float
,@C7_RETENCA float
,@C7_QUJEDED float
,@C7_FRETCON float
,@C7_FATDIRE float
,@C7_TRANSLJ varchar(2)
,@C7_IDTRIB varchar(36)
,@C7_MSEXP varchar(8)
,@C7_MSIMP varchar(8)
,@C7_ZTPUSO varchar(1)
,@C7_ZMARCA varchar(15)
,@C7_ZCODMAR varchar(15)
,@C7_ZZTIPO varchar(3)
,@C7_ZZTPORG varchar(3)
,@C7_FILIAL varchar(2)
,@C7_NUM varchar(6)
,@C7_ITEM varchar(4)
,@C7_SEQUEN varchar(4)
,@C7_ITEMGRD varchar(3)
,@R_E_C_D_E_L_ int

as


UPDATE [dbo].[SC7010]
   SET 
      [C7_TIPO]			= @C7_TIPO	
      ,[C7_PRODUTO]		= @C7_PRODUTO		
      ,[C7_UM]			= @C7_UM			
      ,[C7_SEGUM]		= @C7_SEGUM		
      ,[C7_QUANT]		= @C7_QUANT		
      ,[C7_CODTAB]		= @C7_CODTAB		
      ,[C7_PRECO]		= @C7_PRECO		
      ,[C7_TOTAL]		= @C7_TOTAL		
      ,[C7_QTSEGUM]		= @C7_QTSEGUM		
      ,[C7_IPI]			= @C7_IPI			
      ,[C7_NUMSC]		= @C7_NUMSC		
      ,[C7_ITEMSC]		= @C7_ITEMSC		
      ,[C7_DINICOM]		= @C7_DINICOM		
      ,[C7_DINITRA]		= @C7_DINITRA		
      ,[C7_DINICQ]		= @C7_DINICQ		
      ,[C7_DATPRF]		= @C7_DATPRF		
      ,[C7_LOCAL]		= @C7_LOCAL		
      ,[C7_OBS]			= @C7_OBS			
      ,[C7_FORNECE]		= @C7_FORNECE		
      ,[C7_CC]			= @C7_CC			
      ,[C7_CONTA]		= @C7_CONTA		
      ,[C7_ITEMCTA]		= @C7_ITEMCTA		
      ,[C7_LOJA]		= @C7_LOJA		
      ,[C7_COND]		= @C7_COND		
      ,[C7_CONTATO]		= @C7_CONTATO		
      ,[C7_FILENT]		= @C7_FILENT		
      ,[C7_DESC1]		= @C7_DESC1		
      ,[C7_DESC2]		= @C7_DESC2		
      ,[C7_DESC3]		= @C7_DESC3		
      ,[C7_EMISSAO]		= @C7_EMISSAO		
      ,[C7_QUJE]		= @C7_QUJE		
      ,[C7_REAJUST]		= @C7_REAJUST		
      ,[C7_FRETE]		= @C7_FRETE		
      ,[C7_EMITIDO]		= @C7_EMITIDO		
      ,[C7_DESCRI]		= @C7_DESCRI		
      ,[C7_TPFRETE]		= @C7_TPFRETE		
      ,[C7_QTDREEM]		= @C7_QTDREEM		
      ,[C7_CODLIB]		= @C7_CODLIB		
      ,[C7_RESIDUO]		= @C7_RESIDUO		
      ,[C7_NUMCOT]		= @C7_NUMCOT		
      ,[C7_MSG]			= @C7_MSG			
      ,[C7_TX]			= @C7_TX			
      ,[C7_CONTROL]		= @C7_CONTROL		
      ,[C7_IPIBRUT]		= @C7_IPIBRUT		
      ,[C7_ENCER]		= @C7_ENCER		
      ,[C7_OP]			= @C7_OP			
      ,[C7_VLDESC]		= @C7_VLDESC		
      ,[C7_NUMIMP]		= @C7_NUMIMP		
      ,[C7_ORIGEM]		= @C7_ORIGEM		
      ,[C7_QTDACLA]		= @C7_QTDACLA		
      ,[C7_VALEMB]		= @C7_VALEMB		
      ,[C7_FLUXO]		= @C7_FLUXO		
      ,[C7_TPOP]		= @C7_TPOP		
      ,[C7_APROV]		= @C7_APROV		
      ,[C7_CONAPRO]		= @C7_CONAPRO		
      ,[C7_GRUPCOM]		= @C7_GRUPCOM		
      ,[C7_USER]		= @C7_USER		
      ,[C7_STATME]		= @C7_STATME		
      ,[C7_OK]			= @C7_OK			
      ,[C7_RESREM]		= @C7_RESREM		
      ,[C7_QTDSOL]		= @C7_QTDSOL		
      ,[C7_VALIPI]		= @C7_VALIPI		
      ,[C7_VALICM]		= @C7_VALICM		
      ,[C7_TES]			= @C7_TES			
      ,[C7_DESC]		= @C7_DESC		
      ,[C7_PICM]		= @C7_PICM		
      ,[C7_BASEICM]		= @C7_BASEICM		
      ,[C7_BASEIPI]		= @C7_BASEIPI		
      ,[C7_SEGURO]		= @C7_SEGURO		
      ,[C7_DESPESA]		= @C7_DESPESA		
      ,[C7_VALFRE]		= @C7_VALFRE		
      ,[C7_MOEDA]		= @C7_MOEDA		
      ,[C7_TXMOEDA]		= @C7_TXMOEDA		
      ,[C7_PENDEN]		= @C7_PENDEN		
      ,[C7_CLVL]		= @C7_CLVL		
      ,[C7_BASEIR]		= @C7_BASEIR		
      ,[C7_ALIQIR]		= @C7_ALIQIR		
      ,[C7_VALIR]		= @C7_VALIR		
      ,[C7_ICMCOMP]		= @C7_ICMCOMP		
      ,[C7_ICMSRET]		= @C7_ICMSRET		
      ,[C7_BASIMP5]		= @C7_BASIMP5		
      ,[C7_BASIMP6]		= @C7_BASIMP6		
      ,[C7_ESTOQUE]		= @C7_ESTOQUE		
      ,[C7_SOLICIT]		= @C7_SOLICIT		
      ,[C7_VALSOL]		= @C7_VALSOL		
      ,[C7_VALIMP5]		= @C7_VALIMP5		
      ,[C7_VALIMP6]		= @C7_VALIMP6		
      ,[C7_SEQMRP]		= @C7_SEQMRP		
      ,[C7_CODORCA]		= @C7_CODORCA		
      ,[C7_DTLANC]		= @C7_DTLANC		
      ,[C7_CODCRED]		= @C7_CODCRED		
      ,[C7_TIPOEMP]		= @C7_TIPOEMP		
      ,[C7_ESPEMP]		= @C7_ESPEMP		
      ,[C7_CONTRA]		= @C7_CONTRA		
      ,[C7_CONTREV]		= @C7_CONTREV		
      ,[C7_PLANILH]		= @C7_PLANILH		
      ,[C7_MEDICAO]		= @C7_MEDICAO		
      ,[C7_ITEMED]		= @C7_ITEMED		
      ,[C7_FREPPCC]		= @C7_FREPPCC		
      ,[C7_POLREPR]		= @C7_POLREPR		
      ,[C7_PERREPR]		= @C7_PERREPR		
      ,[C7_DT_IMP]		= @C7_DT_IMP		
      ,[C7_AGENTE]		= @C7_AGENTE		
      ,[C7_GRADE]		= @C7_GRADE		
      ,[C7_FORWARD]		= @C7_FORWARD		
      ,[C7_TIPO_EM]		= @C7_TIPO_EM		
      ,[C7_ORIGIMP]		= @C7_ORIGIMP		
      ,[C7_DEST]		= @C7_DEST		
      ,[C7_COMPRA]		= @C7_COMPRA		
      ,[C7_PESO_B]		= @C7_PESO_B		
      ,[C7_INCOTER]		= @C7_INCOTER		
      ,[C7_IMPORT]		= @C7_IMPORT		
      ,[C7_CONSIG]		= @C7_CONSIG		
      ,[C7_CONF_PE]		= @C7_CONF_PE		
      ,[C7_DESP]		= @C7_DESP		
      ,[C7_EXPORTA]		= @C7_EXPORTA		
      ,[C7_LOJAEXP]		= @C7_LOJAEXP		
      ,[C7_CONTAIN]		= @C7_CONTAIN		
      ,[C7_MT3]			= @C7_MT3			
      ,[C7_CONTA20]		= @C7_CONTA20		
      ,[C7_CONTA40]		= @C7_CONTA40		
      ,[C7_CON40HC]		= @C7_CON40HC		
      ,[C7_ARMAZEM]		= @C7_ARMAZEM		
      ,[C7_FABRICA]		= @C7_FABRICA		
      ,[C7_LOJFABR]		= @C7_LOJFABR		
      ,[C7_DT_EMB]		= @C7_DT_EMB		
      ,[C7_TEC]			= @C7_TEC			
      ,[C7_EX_NCM]		= @C7_EX_NCM		
      ,[C7_EX_NBM]		= @C7_EX_NBM		
      ,[C7_BASESOL]		= @C7_BASESOL		
      ,[C7_DIACTB]		= @C7_DIACTB		
      ,[C7_NODIA]		= @C7_NODIA		
      ,[C7_PO_EIC]		= @C7_PO_EIC		
      ,[C7_CODED]		= @C7_CODED		
      ,[C7_NUMPR]		= @C7_NUMPR		
      ,[C7_OBSM]		= @C7_OBSM		
      ,[C7_TIPCOM]		= @C7_TIPCOM		
      ,[C7_FILEDT]		= @C7_FILEDT		
      ,[C7_NUMSA]		= @C7_NUMSA		
      ,[C7_REVISAO]		= @C7_REVISAO		
      ,[C7_ACCPROC]		= @C7_ACCPROC		
      ,[C7_BASECSL]		= @C7_BASECSL		
      ,[C7_ALIQINS]		= @C7_ALIQINS		
      ,[C7_VALINS]		= @C7_VALINS		
      ,[C7_ALQCSL]		= @C7_ALQCSL		
      ,[C7_ALIQISS]		= @C7_ALIQISS		
      ,[C7_VALISS]		= @C7_VALISS		
      ,[C7_TPCOLAB]		= @C7_TPCOLAB		
      ,[C7_IDTSS]		= @C7_IDTSS		
      ,[C7_CODNE]		= @C7_CODNE		
      ,[C7_ITEMNE]		= @C7_ITEMNE		
      ,[C7_GCPIT]		= @C7_GCPIT		
      ,[C7_GCPLT]		= @C7_GCPLT		
      ,[C7_FILCEN]		= @C7_FILCEN		
      ,[C7_RATEIO]		= @C7_RATEIO		
      ,[C7_ACCNUM]		= @C7_ACCNUM		
      ,[C7_ACCITEM]		= @C7_ACCITEM		
      ,[C7_BASEINS]		= @C7_BASEINS		
      ,[C7_VALCSL]		= @C7_VALCSL		
      ,[C7_LOTPLS]		= @C7_LOTPLS		
      ,[C7_CODRDA]		= @C7_CODRDA		
      ,[C7_BASEISS]		= @C7_BASEISS		
      ,[C7_FISCORI]		= @C7_FISCORI		
      ,[C7_PLOPELT]		= @C7_PLOPELT		
      ,[C7_OBRIGA]		= @C7_OBRIGA		
      ,[C7_DIREITO]		= @C7_DIREITO		
      ,[D_E_L_E_T_]		= @D_E_L_E_T_		
      --,[R_E_C_N_O_]		= @R_E_C_N_O_		
      ,[C7_EC05DB]		= @C7_EC05DB		
      ,[C7_EC05CR]		= @C7_EC05CR		
      ,[C7_EC06DB]		= @C7_EC06DB		
      ,[C7_EC06CR]		= @C7_EC06CR		
      ,[C7_EC07DB]		= @C7_EC07DB		
      ,[C7_EC07CR]		= @C7_EC07CR		
      ,[C7_EC08DB]		= @C7_EC08DB		
      ,[C7_EC08CR]		= @C7_EC08CR		
      ,[C7_EC09DB]		= @C7_EC09DB		
      ,[C7_EC09CR]		= @C7_EC09CR		
      ,[C7_ZZUSO]		= @C7_ZZUSO		
      ,[C7_ZZFLUIG]		= @C7_ZZFLUIG		
      ,[C7_ZZORIPC]		= @C7_ZZORIPC		
      ,[C7_ZNATURE]		= @C7_ZNATURE		
      ,[C7_USERLGI]		= @C7_USERLGI		
      ,[C7_USERLGA]		= @C7_USERLGA		
      ,[C7_DEDUCAO]		= @C7_DEDUCAO		
      ,[C7_QUJERET]		= @C7_QUJERET		
      ,[C7_TRANSP]		= @C7_TRANSP		
      ,[C7_QUJEFAT]		= @C7_QUJEFAT		
      ,[C7_RETENCA]		= @C7_RETENCA		
      ,[C7_QUJEDED]		= @C7_QUJEDED		
      ,[C7_FRETCON]		= @C7_FRETCON		
      ,[C7_FATDIRE]		= @C7_FATDIRE		
      ,[C7_TRANSLJ]		= @C7_TRANSLJ		
      ,[C7_IDTRIB]		= @C7_IDTRIB		
      ,[C7_MSEXP]		= @C7_MSEXP		
      ,[C7_MSIMP]		= @C7_MSIMP		
      ,[C7_ZTPUSO]		= @C7_ZTPUSO		
      ,[C7_ZMARCA]		= @C7_ZMARCA		
      ,[C7_ZCODMAR]		= @C7_ZCODMAR		
      ,[C7_ZZTIPO]		= @C7_ZZTIPO		
      ,[C7_ZZTPORG]		= @C7_ZZTPORG	
	  ,C7_FILIAL 		= @C7_FILIAL 
	  ,C7_NUM			= @C7_NUM
	  ,C7_ITEM			= @C7_ITEM
	  ,C7_SEQUEN		= @C7_SEQUEN
	  ,C7_ITEMGRD		= @C7_ITEMGRD
	  ,R_E_C_D_E_L_     = @R_E_C_D_E_L_	
      ,[dt_alteracao]	= getdate()	
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSCP010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_alteraRegistroSCP010]
@sk_destino int
,@CP_FILIAL varchar(2)
,@CP_NUM varchar(6)
,@CP_ITEM varchar(2)
,@CP_PRODUTO varchar(15)
,@CP_UM varchar(2)
,@CP_QUANT float
,@CP_SEGUM varchar(2)
,@CP_QTSEGUM float
,@CP_DATPRF varchar(8)
,@CP_LOCAL varchar(2)
,@CP_OBS varchar(254)
,@CP_OP varchar(14)
,@CP_CC varchar(9)
,@CP_CONTA varchar(20)
,@CP_EMISSAO varchar(8)
,@CP_DESCRI varchar(100)
,@CP_CODSOLI varchar(6)
,@CP_SOLICIT varchar(25)
,@CP_QUJE float
,@CP_OK varchar(2)
,@CP_PREREQU varchar(1)
,@CP_STATUS varchar(1)
,@CP_NUMOS varchar(8)
,@CP_SEQRC varchar(2)
,@CP_ITEMCTA varchar(9)
,@CP_CLVL varchar(9)
,@CP_PROJETO varchar(1)
,@CP_USER varchar(6)
,@CP_NUMSC varchar(6)
,@CP_ITSC varchar(4)
,@CP_STATSA varchar(1)
,@CP_SALBLQ float
,@CP_MEDIDA varchar(6)
,@CP_SULCMI float
,@CP_SULCMA float
,@CP_TIPMOD varchar(10)
,@CP_LOTE varchar(6)
,@CP_RATEIO varchar(1)
,@CP_CONSEST varchar(1)
,@CP_NRBPIMS varchar(10)
,@CP_VUNIT float
,@CP_EC05DB varchar(16)
,@CP_EC05CR varchar(16)
,@CP_EC06DB varchar(16)
,@CP_EC06CR varchar(16)
,@CP_EC07DB varchar(16)
,@CP_EC07CR varchar(16)
,@CP_EC08DB varchar(16)
,@CP_EC08CR varchar(16)
,@CP_EC09DB varchar(16)
,@CP_EC09CR varchar(16)
,@CP_ZZFLUIG float
,@CP_ZZEMERG varchar(1)
,@CP_ZZUSO varchar(1)
,@CP_ZZDTDIG varchar(8)
,@CP_ZSUBFLU float
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@R_E_C_D_E_L_ int

as


--- chave composta: B2_FILIAL, B2_LOCAL, B2_COD, R_E_C_D_E_L_

UPDATE [dbo].[SCP010]
   SET
   
		 CP_FILIAL =@CP_FILIAL 
		,CP_NUM =@CP_NUM 
		,CP_ITEM=@CP_ITEM
		,CP_PRODUTO =@CP_PRODUTO 
		,CP_UM =@CP_UM 
		,CP_QUANT =@CP_QUANT 
		,CP_SEGUM =@CP_SEGUM 
		,CP_QTSEGUM =@CP_QTSEGUM 
		,CP_DATPRF =@CP_DATPRF 
		,CP_LOCAL =@CP_LOCAL 
		,CP_OBS =@CP_OBS 
		,CP_OP =@CP_OP 
		,CP_CC =@CP_CC 
		,CP_CONTA =@CP_CONTA 
		,CP_EMISSAO =@CP_EMISSAO 
		,CP_DESCRI =@CP_DESCRI 
		,CP_CODSOLI =@CP_CODSOLI 
		,CP_SOLICIT =@CP_SOLICIT 
		,CP_QUJE =@CP_QUJE 
		,CP_OK =@CP_OK 
		,CP_PREREQU =@CP_PREREQU 
		,CP_STATUS =@CP_STATUS 
		,CP_NUMOS =@CP_NUMOS 
		,CP_SEQRC =@CP_SEQRC 
		,CP_ITEMCTA =@CP_ITEMCTA 
		,CP_CLVL =@CP_CLVL 
		,CP_PROJETO =@CP_PROJETO 
		,CP_USER =@CP_USER 
		,CP_NUMSC =@CP_NUMSC 
		,CP_ITSC =@CP_ITSC 
		,CP_STATSA=@CP_STATSA
		,CP_SALBLQ =@CP_SALBLQ 
		,CP_MEDIDA =@CP_MEDIDA 
		,CP_SULCMI =@CP_SULCMI 
		,CP_SULCMA =@CP_SULCMA 
		,CP_TIPMOD =@CP_TIPMOD 
		,CP_LOTE =@CP_LOTE 
		,CP_RATEIO =@CP_RATEIO 
		,CP_CONSEST=@CP_CONSEST
		,CP_NRBPIMS =@CP_NRBPIMS 
		,CP_VUNIT =@CP_VUNIT 
		,CP_EC05DB =@CP_EC05DB 
		,CP_EC05CR =@CP_EC05CR 
		,CP_EC06DB =@CP_EC06DB 
		,CP_EC06CR =@CP_EC06CR 
		,CP_EC07DB =@CP_EC07DB 
		,CP_EC07CR =@CP_EC07CR 
		,CP_EC08DB =@CP_EC08DB 
		,CP_EC08CR =@CP_EC08CR 
		,CP_EC09DB =@CP_EC09DB 
		,CP_EC09CR =@CP_EC09CR 
		,CP_ZZFLUIG=@CP_ZZFLUIG
		,CP_ZZEMERG =@CP_ZZEMERG 
		,CP_ZZUSO =@CP_ZZUSO 
		,CP_ZZDTDIG =@CP_ZZDTDIG 
		,CP_ZSUBFLU =@CP_ZSUBFLU 
		,D_E_L_E_T_ =@D_E_L_E_T_ 
		,R_E_C_D_E_L_ =@R_E_C_D_E_L_ 
		,dt_alteracao = getdate()
    
 WHERE sk_destino = @sk_destino


GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSD1010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--- D1_FILIAL, D1_DOC, D1_SERIE, D1_FORNECE, D1_LOJA, D1_ITEM, D1_FORMUL, D1_ITEMGRD, R_E_C_D_E_L_

CREATE proc [dbo].[sp_alteraRegistroSD1010]
@sk_destino int

,@D1_COD varchar(15)
,@D1_UM varchar(2)
,@D1_SEGUM varchar(2)
,@D1_QUANT float
,@D1_VUNIT float
,@D1_TOTAL float
,@D1_VALIPI float
,@D1_VLSLXML float
,@D1_VALICM float
,@D1_TES varchar(3)
,@D1_CF varchar(5)
,@D1_DESC float
,@D1_IPI float
,@D1_PICM float
,@D1_PESO float
,@D1_CONTA varchar(20)
,@D1_ITEMCTA varchar(9)
,@D1_CC varchar(9)
,@D1_OP varchar(13)
,@D1_PEDIDO varchar(6)
,@D1_ITEMPC varchar(4)
,@D1_LOCAL varchar(2)
,@D1_EMISSAO varchar(8)
,@D1_DTDIGIT varchar(8)
,@D1_GRUPO varchar(4)
,@D1_TIPO varchar(1)
,@D1_CUSTO2 float
,@D1_CUSTO3 float
,@D1_CUSTO4 float
,@D1_CUSTO5 float
,@D1_TP varchar(2)
,@D1_QTSEGUM float
,@D1_NUMSEQ varchar(6)
,@D1_DATACUS varchar(8)
,@D1_NFORI varchar(9)
,@D1_SERIORI varchar(3)
,@D1_ITEMORI varchar(4)
,@D1_QTDEDEV float
,@D1_VALDEV float
,@D1_ORIGLAN varchar(2)
,@D1_ICMSRET float
,@D1_BRICMS float
,@D1_NUMCQ varchar(6)
,@D1_DATORI varchar(8)
,@D1_BASEICM float
,@D1_VALDESC float
,@D1_IDENTB6 varchar(6)
,@D1_LOTEFOR varchar(18)
,@D1_SKIPLOT varchar(1)
,@D1_BASEIPI float
,@D1_SEQCALC varchar(14)
,@D1_LOTECTL varchar(21)
,@D1_NUMLOTE varchar(6)
,@D1_DTVALID varchar(8)
,@D1_PLACA varchar(7)
,@D1_CHASSI varchar(25)
,@D1_ANOFAB varchar(2)
,@D1_MODFAB varchar(2)
,@D1_MODELO varchar(15)
,@D1_COMBUST varchar(10)
,@D1_COR varchar(3)
,@D1_EQUIPS varchar(3)
,@D1_II float
,@D1_TEC varchar(16)
,@D1_CONHEC varchar(17)
,@D1_NUMPV varchar(6)
,@D1_ITEMPV varchar(2)
,@D1_CUSFF1 float
,@D1_CUSFF2 float
,@D1_CUSFF3 float
,@D1_CUSFF4 float
,@D1_CUSFF5 float
,@D1_CODCIAP varchar(6)
,@D1_CLASFIS varchar(3)
,@D1_BASIMP1 float
,@D1_REMITO varchar(9)
,@D1_SERIREM varchar(3)
,@D1_CUSTO float
,@D1_BASIMP3 float
,@D1_BASIMP4 float
,@D1_BASIMP5 float
,@D1_BASIMP6 float
,@D1_VALIMP1 float
,@D1_VALIMP2 float
,@D1_VALIMP3 float
,@D1_VALIMP4 float
,@D1_VALIMP5 float
,@D1_VALIMP6 float
,@D1_CBASEAF varchar(14)
,@D1_ICMSCOM float
,@D1_CIF float
,@D1_ITEMREM varchar(4)
,@D1_BASIMP2 float
,@D1_PROJ varchar(10)
,@D1_TIPO_NF varchar(1)
,@D1_ALQIMP1 float
,@D1_ALQIMP2 float
,@D1_ALQIMP3 float
,@D1_ALQIMP4 float
,@D1_ALQIMP5 float
,@D1_ALQIMP6 float
,@D1_QTDPEDI float
,@D1_VALFRE float
,@D1_ALIIMA float
,@D1_RATEIO varchar(1)
,@D1_SEGURO float
,@D1_DESPESA float
,@D1_BASEIRR float
,@D1_ALIQIRR float
,@D1_VALIRR float
,@D1_BASEISS float
,@D1_ALIQISS float
,@D1_VALISS float
,@D1_BASEINS float
,@D1_ALIQINS float
,@D1_VALINS float
,@D1_CUSORI float
,@D1_LOCPAD varchar(6)
,@D1_CLVL varchar(9)
,@D1_ORDEM varchar(6)
,@D1_CODFIS varchar(15)
,@D1_CNO varchar(14)
,@D1_ORDDIA varchar(4)
,@D1_NRECAGR varchar(5)
,@D1_VALFASE float
,@D1_FILEDT varchar(2)
,@D1_ALIFASE float
,@D1_ALIFUND float
,@D1_BASFASE float
,@D1_BASFUND float
,@D1_BASIMA float
,@D1_BASEDES float
,@D1_PDDES float
,@D1_PERCINP float
,@D1_VFCPDIF float
,@D1_SERVIC varchar(3)
,@D1_STSERV varchar(1)
,@D1_ENDER varchar(15)
,@D1_TPESTR varchar(6)
,@D1_REGWMS varchar(1)
,@D1_ITPCCEN varchar(4)
,@D1_PCCENTR varchar(6)
,@D1_QTPCCEN float
,@D1_PDORI float
,@D1_VALINP float
,@D1_ALIQCMP float
,@D1_VALFUND float
,@D1_VRDICMS float
,@D1_TIPODOC varchar(2)
,@D1_POTENCI float
,@D1_TRT varchar(3)
,@D1_TESACLA varchar(3)
,@D1_NUMDESP varchar(16)
,@D1_ORIGEM varchar(3)
,@D1_GRADE varchar(1)
,@D1_DESCICM float
,@D1_VALIMA float
,@D1_ESTCRED float
,@D1_CFPS varchar(6)
,@D1_ALIQCF3 float
,@D1_BASEPS3 float
,@D1_ALIQPS3 float
,@D1_VALPS3 float
,@D1_BASECF3 float
,@D1_VALCF3 float
,@D1_CRDZFM float
,@D1_CONBAR varchar(1)
,@D1_NFVINC varchar(9)
,@D1_VALCOF float
,@D1_MARGEM float
,@D1_VALACRS float
,@D1_ICMSDIF float
,@D1_BASECOF float
,@D1_BASECSL float
,@D1_BASEPIS float
,@D1_VALANTI float
,@D1_SLDDEP float
,@D1_ITMVINC varchar(4)
,@D1_PRUNDA float
,@D1_BASEFMP float
,@D1_VALFMP float
,@D1_ABATISS float
,@D1_VLCIDE float
,@D1_BASECID float
,@D1_ALQCIDE float
,@D1_VALCPM float
,@D1_BASECPM float
,@D1_ALQCPM float
,@D1_CODNE varchar(12)
,@D1_ITEMNE varchar(3)
,@D1_EXPSOP varchar(8)
,@D1_MSEXP varchar(8)
,@D1_HREXPO varchar(8)
,@D1_IDCFC varchar(20)
,@D1_ABATMAT float
,@D1_VALCMAJ float
,@D1_CRPRSIM float
,@D1_IDSB1 varchar(20)
,@D1_IDSB5 varchar(20)
,@D1_IDSBZ varchar(20)
,@D1_CONIMP float
,@D1_VALINA float
,@D1_VLSENAR float
,@D1_REVISAO varchar(3)
,@D1_ABATINS float
,@D1_ALIQINA float
,@D1_BASEINA float
,@D1_VALPMAJ float
,@D1_DTFIMNT varchar(8)
,@D1_TNATREC varchar(4)
,@D1_CNATREC varchar(3)
,@D1_GRUPONC varchar(2)
,@D1_DFABRIC varchar(8)
,@D1_ALIQSOL float
,@D1_CODNOR varchar(6)
,@D1_QTDCONF float
,@D1_VALFAB float
,@D1_BASEFAB float
,@D1_ALIQFAB float
,@D1_BASEFAC float
,@D1_ALIQFAC float
,@D1_VALFAC float
,@D1_BASEFET float
,@D1_ALIQFET float
,@D1_VALFET float
,@D1_AVLINSS float
,@D1_FTRICMS float
,@D1_GRPCST varchar(3)
,@D1_TRIBMUN varchar(20)
,@D1_CODISS varchar(9)
,@D1_SERVINC varchar(3)
,@D1_ALFCCMP float
,@D1_BASEINP float
,@D1_CSOSN varchar(3)
,@D1_DIFAL float
,@D1_ALSENAR float
,@D1_BSSENAR float
,@D1_ALIQSES float
,@D1_GARANTI varchar(1)
,@D1_VALPIS float
,@D1_ALQCOF float
,@D1_ALQCSL float
,@D1_ALQPIS float
,@D1_CUSRP1 float
,@D1_CUSRP2 float
,@D1_TRANSIT varchar(1)
,@D1_CUSRP3 float
,@D1_CUSRP4 float
,@D1_CUSRP5 float
,@D1_VALCSL float
,@D1_BASESES float
,@D1_VALSES float
,@D1_RGESPST varchar(1)
,@D1_CRPRESC float
,@D1_CODLAN varchar(6)
,@D1_OPERADO varchar(3)
,@D1_ALIQFUN float
,@D1_VALFUN float
,@D1_BASEFUN float
,@D1_CRPREPR float
,@D1_VLINCMG float
,@D1_PRINCMG float
,@D1_CODBAIX varchar(6)
,@D1_VALFDS float
,@D1_PRFDSUL float
,@D1_UFERMS float
,@D1_OKISS varchar(2)
,@D1_IDSF4 varchar(20)
,@D1_IDSF7 varchar(20)
,@D1_FILORI varchar(2)
,@D1_ALMTERC varchar(2)
,@D1_FCICOD varchar(36)
,@D1_ALIQII float
,@D1_BASNDES float
,@D1_ICMNDES float
,@D1_SDOCVNC varchar(3)
,@D1_SDOCREM varchar(3)
,@D1_SDOC varchar(3)
,@D1_SDOCORI varchar(3)
,@D1_ALQFMP float
,@D1_NUMPED varchar(15)
,@D1_SLDEXP float
,@D1_EC05DB varchar(16)
,@D1_EC05CR varchar(16)
,@D1_EC06DB varchar(16)
,@D1_EC06CR varchar(16)
,@D1_EC07DB varchar(16)
,@D1_EC07CR varchar(16)
,@D1_EC08DB varchar(16)
,@D1_EC08CR varchar(16)
,@D1_EC09DB varchar(16)
,@D1_EC09CR varchar(16)
,@D1_TESDES varchar(3)
,@D1_BASECPB float
,@D1_CODDIS varchar(6)
,@D1_ABATTRA float
,@D1_ALIQCPB float
,@D1_VRETSUB float
,@D1_ABATALM float
,@D1_BASFEEF float
,@D1_TPREPAS varchar(6)
,@D1_VALCPB float
,@D1_VALFEEF float
,@D1_IDDCF varchar(6)
,@D1_ALQFEEF float
,@D1_BASEPRO float
,@D1_ALIQPRO float
,@D1_VALPRO float
,@D1_ZZUSO varchar(1)
,@D1_ZZNATUR varchar(9)
,@D1_VOPDIF float
,@D1_ALFCPST float
,@D1_VFECPST float
,@D1_BFCPANT float
,@D1_DESCZFP float
,@D1_VFCPANT float
,@D1_BASEFMD float
,@D1_VALFMD float
,@D1_ALQNDES float
,@D1_DESCZFR float
,@D1_ALQFMD float
,@D1_DESCZFC float
,@D1_AFCPANT float
,@D1_ALQFECP float
,@D1_VALFECP float
,@D1_ZDESCPR varchar(100)
,@D1_ZZUSER varchar(20)
,@D1_ZCNAE varchar(30)
,@D1_ZREGIME varchar(1)
,@D1_CODROM varchar(10)
,@D1_NFPNUM varchar(9)
,@D1_CTROG varchar(6)
,@D1_CODSAF varchar(15)
,@D1_NFPSER varchar(3)
,@D1_ITEROM varchar(2)
,@D1_BASFECP float
,@D1_BSFCCMP float
,@D1_FCPAUX float
,@D1_BSFCPST float
,@D1_USERLGI varchar(17)
,@D1_USERLGA varchar(17)
,@D1_ZZITAUX varchar(4)
,@D1_ZZTES varchar(3)
,@D1_DEDUCAO float
,@D1_FATDIRE float
,@D1_RETENCA float
,@D1_IDTRIB varchar(36)
,@D1_CTAREC varchar(20)
,@D1_ZTPUSO varchar(1)
,@D1_ZPREDIC float
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@R_E_C_D_E_L_ int
,@D1_ITEMGRD varchar(3)
,@D1_FORMUL varchar(1)
,@D1_SERIE varchar(3)
,@D1_DOC varchar(9)
,@D1_FORNECE varchar(6)
,@D1_LOJA varchar(2)
,@D1_FILIAL varchar(2)
,@D1_ITEM varchar(4)

as

UPDATE [dbo].[SD1010]
   SET D1_FILIAL			= @D1_FILIAL		
      ,D1_ITEM				= @D1_ITEM		
      ,D1_COD				= @D1_COD			
      ,D1_UM				= @D1_UM			
      ,D1_SEGUM				= @D1_SEGUM		
      ,D1_QUANT				= @D1_QUANT		
      ,D1_VUNIT				= @D1_VUNIT		
      ,D1_TOTAL				= @D1_TOTAL		
      ,D1_VALIPI			= @D1_VALIPI		
      ,D1_VLSLXML			= @D1_VLSLXML		
      ,D1_VALICM			= @D1_VALICM		
      ,D1_TES				= @D1_TES			
      ,D1_CF				= @D1_CF			
      ,D1_DESC				= @D1_DESC		
      ,D1_IPI				= @D1_IPI			
      ,D1_PICM				= @D1_PICM		
      ,D1_PESO				= @D1_PESO		
      ,D1_CONTA				= @D1_CONTA		
      ,D1_ITEMCTA			= @D1_ITEMCTA		
      ,D1_CC				= @D1_CC			
      ,D1_OP				= @D1_OP			
      ,D1_PEDIDO			= @D1_PEDIDO		
      ,D1_ITEMPC			= @D1_ITEMPC		
      ,D1_FORNECE			= @D1_FORNECE		
      ,D1_LOJA				= @D1_LOJA		
      ,D1_LOCAL				= @D1_LOCAL		
      ,D1_DOC				= @D1_DOC			
      ,D1_EMISSAO			= @D1_EMISSAO		
      ,D1_DTDIGIT			= @D1_DTDIGIT		
      ,D1_GRUPO				= @D1_GRUPO		
      ,D1_TIPO				= @D1_TIPO		
      ,D1_SERIE				= @D1_SERIE		
      ,D1_CUSTO2			= @D1_CUSTO2		
      ,D1_CUSTO3			= @D1_CUSTO3		
      ,D1_CUSTO4			= @D1_CUSTO4		
      ,D1_CUSTO5			= @D1_CUSTO5		
      ,D1_TP				= @D1_TP			
      ,D1_QTSEGUM			= @D1_QTSEGUM		
      ,D1_NUMSEQ			= @D1_NUMSEQ		
      ,D1_DATACUS			= @D1_DATACUS		
      ,D1_NFORI				= @D1_NFORI		
      ,D1_SERIORI			= @D1_SERIORI		
      ,D1_ITEMORI			= @D1_ITEMORI		
      ,D1_QTDEDEV			= @D1_QTDEDEV		
      ,D1_VALDEV			= @D1_VALDEV		
      ,D1_ORIGLAN			= @D1_ORIGLAN		
      ,D1_ICMSRET			= @D1_ICMSRET		
      ,D1_BRICMS			= @D1_BRICMS		
      ,D1_NUMCQ				= @D1_NUMCQ		
      ,D1_DATORI			= @D1_DATORI		
      ,D1_BASEICM			= @D1_BASEICM		
      ,D1_VALDESC			= @D1_VALDESC		
      ,D1_IDENTB6			= @D1_IDENTB6		
      ,D1_LOTEFOR			= @D1_LOTEFOR		
      ,D1_SKIPLOT			= @D1_SKIPLOT		
      ,D1_BASEIPI			= @D1_BASEIPI		
      ,D1_SEQCALC			= @D1_SEQCALC		
      ,D1_LOTECTL			= @D1_LOTECTL		
      ,D1_NUMLOTE			= @D1_NUMLOTE		
      ,D1_DTVALID			= @D1_DTVALID		
      ,D1_PLACA				= @D1_PLACA		
      ,D1_CHASSI			= @D1_CHASSI		
      ,D1_ANOFAB			= @D1_ANOFAB		
      ,D1_MODFAB			= @D1_MODFAB		
      ,D1_MODELO			= @D1_MODELO		
      ,D1_COMBUST			= @D1_COMBUST		
      ,D1_COR				= @D1_COR			
      ,D1_EQUIPS			= @D1_EQUIPS		
      ,D1_FORMUL			= @D1_FORMUL		
      ,D1_II				= @D1_II			
      ,D1_TEC				= @D1_TEC			
      ,D1_CONHEC			= @D1_CONHEC		
      ,D1_NUMPV				= @D1_NUMPV		
      ,D1_ITEMPV			= @D1_ITEMPV		
      ,D1_CUSFF1			= @D1_CUSFF1		
      ,D1_CUSFF2			= @D1_CUSFF2		
      ,D1_CUSFF3			= @D1_CUSFF3		
      ,D1_CUSFF4			= @D1_CUSFF4		
      ,D1_CUSFF5			= @D1_CUSFF5		
      ,D1_CODCIAP			= @D1_CODCIAP		
      ,D1_CLASFIS			= @D1_CLASFIS		
      ,D1_BASIMP1			= @D1_BASIMP1		
      ,D1_REMITO			= @D1_REMITO		
      ,D1_SERIREM			= @D1_SERIREM		
      ,D1_CUSTO				= @D1_CUSTO		
      ,D1_BASIMP3			= @D1_BASIMP3		
      ,D1_BASIMP4			= @D1_BASIMP4		
      ,D1_BASIMP5			= @D1_BASIMP5		
      ,D1_BASIMP6			= @D1_BASIMP6		
      ,D1_VALIMP1			= @D1_VALIMP1		
      ,D1_VALIMP2			= @D1_VALIMP2		
      ,D1_VALIMP3			= @D1_VALIMP3		
      ,D1_VALIMP4			= @D1_VALIMP4		
      ,D1_VALIMP5			= @D1_VALIMP5		
      ,D1_VALIMP6			= @D1_VALIMP6		
      ,D1_CBASEAF			= @D1_CBASEAF		
      ,D1_ICMSCOM			= @D1_ICMSCOM		
      ,D1_CIF				= @D1_CIF			
      ,D1_ITEMREM			= @D1_ITEMREM		
      ,D1_BASIMP2			= @D1_BASIMP2		
      ,D1_PROJ				= @D1_PROJ		
      ,D1_TIPO_NF			= @D1_TIPO_NF		
      ,D1_ALQIMP1			= @D1_ALQIMP1		
      ,D1_ALQIMP2			= @D1_ALQIMP2		
      ,D1_ALQIMP3			= @D1_ALQIMP3		
      ,D1_ALQIMP4			= @D1_ALQIMP4		
      ,D1_ALQIMP5			= @D1_ALQIMP5		
      ,D1_ALQIMP6			= @D1_ALQIMP6		
      ,D1_QTDPEDI			= @D1_QTDPEDI		
      ,D1_VALFRE			= @D1_VALFRE		
      ,D1_ALIIMA			= @D1_ALIIMA		
      ,D1_RATEIO			= @D1_RATEIO		
      ,D1_SEGURO			= @D1_SEGURO		
      ,D1_DESPESA			= @D1_DESPESA		
      ,D1_BASEIRR			= @D1_BASEIRR		
      ,D1_ALIQIRR			= @D1_ALIQIRR		
      ,D1_VALIRR			= @D1_VALIRR		
      ,D1_BASEISS			= @D1_BASEISS		
      ,D1_ALIQISS			= @D1_ALIQISS		
      ,D1_VALISS			= @D1_VALISS		
      ,D1_BASEINS			= @D1_BASEINS		
      ,D1_ALIQINS			= @D1_ALIQINS		
      ,D1_VALINS			= @D1_VALINS		
      ,D1_CUSORI			= @D1_CUSORI		
      ,D1_LOCPAD			= @D1_LOCPAD		
      ,D1_CLVL				= @D1_CLVL		
      ,D1_ORDEM				= @D1_ORDEM		
      ,D1_CODFIS			= @D1_CODFIS		
      ,D1_CNO				= @D1_CNO			
      ,D1_ORDDIA			= @D1_ORDDIA		
      ,D1_NRECAGR			= @D1_NRECAGR		
      ,D1_VALFASE			= @D1_VALFASE		
      ,D1_FILEDT			= @D1_FILEDT		
      ,D1_ALIFASE			= @D1_ALIFASE		
      ,D1_ALIFUND			= @D1_ALIFUND		
      ,D1_BASFASE			= @D1_BASFASE		
      ,D1_BASFUND			= @D1_BASFUND		
      ,D1_BASIMA			= @D1_BASIMA		
      ,D1_BASEDES			= @D1_BASEDES		
      ,D1_PDDES				= @D1_PDDES		
      ,D1_PERCINP			= @D1_PERCINP		
      ,D1_VFCPDIF			= @D1_VFCPDIF		
      ,D1_SERVIC			= @D1_SERVIC		
      ,D1_STSERV			= @D1_STSERV		
      ,D1_ENDER				= @D1_ENDER		
      ,D1_TPESTR			= @D1_TPESTR		
      ,D1_REGWMS			= @D1_REGWMS		
      ,D1_ITPCCEN			= @D1_ITPCCEN		
      ,D1_PCCENTR			= @D1_PCCENTR		
      ,D1_QTPCCEN			= @D1_QTPCCEN		
      ,D1_PDORI				= @D1_PDORI		
      ,D1_VALINP			= @D1_VALINP		
      ,D1_ALIQCMP			= @D1_ALIQCMP		
      ,D1_VALFUND			= @D1_VALFUND		
      ,D1_VRDICMS			= @D1_VRDICMS		
      ,D1_TIPODOC			= @D1_TIPODOC		
      ,D1_POTENCI			= @D1_POTENCI		
      ,D1_TRT				= @D1_TRT			
      ,D1_TESACLA			= @D1_TESACLA		
      ,D1_NUMDESP			= @D1_NUMDESP		
      ,D1_ORIGEM			= @D1_ORIGEM		
      ,D1_GRADE				= @D1_GRADE		
      ,D1_ITEMGRD			= @D1_ITEMGRD		
      ,D1_DESCICM			= @D1_DESCICM		
      ,D1_VALIMA			= @D1_VALIMA		
      ,D1_ESTCRED			= @D1_ESTCRED		
      ,D1_CFPS				= @D1_CFPS		
      ,D1_ALIQCF3			= @D1_ALIQCF3		
      ,D1_BASEPS3			= @D1_BASEPS3		
      ,D1_ALIQPS3			= @D1_ALIQPS3		
      ,D1_VALPS3			= @D1_VALPS3		
      ,D1_BASECF3			= @D1_BASECF3		
      ,D1_VALCF3			= @D1_VALCF3		
      ,D1_CRDZFM			= @D1_CRDZFM		
      ,D1_CONBAR			= @D1_CONBAR		
      ,D1_NFVINC			= @D1_NFVINC		
      ,D1_VALCOF			= @D1_VALCOF		
      ,D1_MARGEM			= @D1_MARGEM		
      ,D1_VALACRS			= @D1_VALACRS		
      ,D1_ICMSDIF			= @D1_ICMSDIF		
      ,D1_BASECOF			= @D1_BASECOF		
      ,D1_BASECSL			= @D1_BASECSL		
      ,D1_BASEPIS			= @D1_BASEPIS		
      ,D1_VALANTI			= @D1_VALANTI		
      ,D1_SLDDEP			= @D1_SLDDEP		
      ,D1_ITMVINC			= @D1_ITMVINC		
      ,D1_PRUNDA			= @D1_PRUNDA		
      ,D1_BASEFMP			= @D1_BASEFMP		
      ,D1_VALFMP			= @D1_VALFMP		
      ,D1_ABATISS			= @D1_ABATISS		
      ,D1_VLCIDE			= @D1_VLCIDE		
      ,D1_BASECID			= @D1_BASECID		
      ,D1_ALQCIDE			= @D1_ALQCIDE		
      ,D1_VALCPM			= @D1_VALCPM		
      ,D1_BASECPM			= @D1_BASECPM		
      ,D1_ALQCPM			= @D1_ALQCPM		
      ,D1_CODNE				= @D1_CODNE		
      ,D1_ITEMNE			= @D1_ITEMNE		
      ,D1_EXPSOP			= @D1_EXPSOP		
      ,D1_MSEXP				= @D1_MSEXP		
      ,D1_HREXPO			= @D1_HREXPO		
      ,D1_IDCFC				= @D1_IDCFC		
      ,D1_ABATMAT			= @D1_ABATMAT		
      ,D1_VALCMAJ			= @D1_VALCMAJ		
      ,D1_CRPRSIM			= @D1_CRPRSIM		
      ,D1_IDSB1				= @D1_IDSB1		
      ,D1_IDSB5				= @D1_IDSB5		
      ,D1_IDSBZ				= @D1_IDSBZ		
      ,D1_CONIMP			= @D1_CONIMP		
      ,D1_VALINA			= @D1_VALINA		
      ,D1_VLSENAR			= @D1_VLSENAR		
      ,D1_REVISAO			= @D1_REVISAO		
      ,D1_ABATINS			= @D1_ABATINS		
      ,D1_ALIQINA			= @D1_ALIQINA		
      ,D1_BASEINA			= @D1_BASEINA		
      ,D1_VALPMAJ			= @D1_VALPMAJ		
      ,D1_DTFIMNT			= @D1_DTFIMNT		
      ,D1_TNATREC			= @D1_TNATREC		
      ,D1_CNATREC			= @D1_CNATREC		
      ,D1_GRUPONC			= @D1_GRUPONC		
      ,D1_DFABRIC			= @D1_DFABRIC		
      ,D1_ALIQSOL			= @D1_ALIQSOL		
      ,D1_CODNOR			= @D1_CODNOR		
      ,D1_QTDCONF			= @D1_QTDCONF		
      ,D1_VALFAB			= @D1_VALFAB		
      ,D1_BASEFAB			= @D1_BASEFAB		
      ,D1_ALIQFAB			= @D1_ALIQFAB		
      ,D1_BASEFAC			= @D1_BASEFAC		
      ,D1_ALIQFAC			= @D1_ALIQFAC		
      ,D1_VALFAC			= @D1_VALFAC		
      ,D1_BASEFET			= @D1_BASEFET		
      ,D1_ALIQFET			= @D1_ALIQFET		
      ,D1_VALFET			= @D1_VALFET		
      ,D1_AVLINSS			= @D1_AVLINSS		
      ,D1_FTRICMS			= @D1_FTRICMS		
      ,D1_GRPCST			= @D1_GRPCST		
      ,D1_TRIBMUN			= @D1_TRIBMUN		
      ,D1_CODISS			= @D1_CODISS		
      ,D1_SERVINC			= @D1_SERVINC		
      ,D1_ALFCCMP			= @D1_ALFCCMP		
      ,D1_BASEINP			= @D1_BASEINP		
      ,D1_CSOSN				= @D1_CSOSN		
      ,D1_DIFAL				= @D1_DIFAL		
      ,D1_ALSENAR			= @D1_ALSENAR		
      ,D1_BSSENAR			= @D1_BSSENAR		
      ,D1_ALIQSES			= @D1_ALIQSES		
      ,D1_GARANTI			= @D1_GARANTI		
      ,D1_VALPIS			= @D1_VALPIS		
      ,D1_ALQCOF			= @D1_ALQCOF		
      ,D1_ALQCSL			= @D1_ALQCSL		
      ,D1_ALQPIS			= @D1_ALQPIS		
      ,D1_CUSRP1			= @D1_CUSRP1		
      ,D1_CUSRP2			= @D1_CUSRP2		
      ,D1_TRANSIT			= @D1_TRANSIT		
      ,D1_CUSRP3			= @D1_CUSRP3		
      ,D1_CUSRP4			= @D1_CUSRP4		
      ,D1_CUSRP5			= @D1_CUSRP5		
      ,D1_VALCSL			= @D1_VALCSL		
      ,D1_BASESES			= @D1_BASESES		
      ,D1_VALSES			= @D1_VALSES		
      ,D1_RGESPST			= @D1_RGESPST		
      ,D1_CRPRESC			= @D1_CRPRESC		
      ,D1_CODLAN			= @D1_CODLAN		
      ,D1_OPERADO			= @D1_OPERADO		
      ,D1_ALIQFUN			= @D1_ALIQFUN		
      ,D1_VALFUN			= @D1_VALFUN		
      ,D1_BASEFUN			= @D1_BASEFUN		
      ,D1_CRPREPR			= @D1_CRPREPR		
      ,D1_VLINCMG			= @D1_VLINCMG		
      ,D1_PRINCMG			= @D1_PRINCMG		
      ,D1_CODBAIX			= @D1_CODBAIX		
      ,D1_VALFDS			= @D1_VALFDS		
      ,D1_PRFDSUL			= @D1_PRFDSUL		
      ,D1_UFERMS			= @D1_UFERMS		
      ,D1_OKISS				= @D1_OKISS		
      ,D1_IDSF4				= @D1_IDSF4		
      ,D1_IDSF7				= @D1_IDSF7		
      ,D1_FILORI			= @D1_FILORI		
      ,D1_ALMTERC			= @D1_ALMTERC		
      ,D1_FCICOD			= @D1_FCICOD		
      ,D1_ALIQII			= @D1_ALIQII		
      ,D1_BASNDES			= @D1_BASNDES		
      ,D1_ICMNDES			= @D1_ICMNDES		
      ,D1_SDOCVNC			= @D1_SDOCVNC		
      ,D1_SDOCREM			= @D1_SDOCREM		
      ,D1_SDOC				= @D1_SDOC		
      ,D1_SDOCORI			= @D1_SDOCORI		
      ,D1_ALQFMP			= @D1_ALQFMP		
      ,D1_NUMPED			= @D1_NUMPED		
      ,D1_SLDEXP			= @D1_SLDEXP		
      ,D1_EC05DB			= @D1_EC05DB		
      ,D1_EC05CR			= @D1_EC05CR		
      ,D1_EC06DB			= @D1_EC06DB		
      ,D1_EC06CR			= @D1_EC06CR		
      ,D1_EC07DB			= @D1_EC07DB		
      ,D1_EC07CR			= @D1_EC07CR		
      ,D1_EC08DB			= @D1_EC08DB		
      ,D1_EC08CR			= @D1_EC08CR		
      ,D1_EC09DB			= @D1_EC09DB		
      ,D1_EC09CR			= @D1_EC09CR		
      ,D1_TESDES			= @D1_TESDES		
      ,D1_BASECPB			= @D1_BASECPB		
      ,D1_CODDIS			= @D1_CODDIS		
      ,D1_ABATTRA			= @D1_ABATTRA		
      ,D1_ALIQCPB			= @D1_ALIQCPB		
      ,D1_VRETSUB			= @D1_VRETSUB		
      ,D1_ABATALM			= @D1_ABATALM		
      ,D1_BASFEEF			= @D1_BASFEEF		
      ,D1_TPREPAS			= @D1_TPREPAS		
      ,D1_VALCPB			= @D1_VALCPB		
      ,D1_VALFEEF			= @D1_VALFEEF		
      ,D1_IDDCF				= @D1_IDDCF		
      ,D1_ALQFEEF			= @D1_ALQFEEF		
      ,D1_BASEPRO			= @D1_BASEPRO		
      ,D1_ALIQPRO			= @D1_ALIQPRO		
      ,D1_VALPRO			= @D1_VALPRO		
      ,D1_ZZUSO				= @D1_ZZUSO		
      ,D1_ZZNATUR			= @D1_ZZNATUR		
      ,D1_VOPDIF			= @D1_VOPDIF		
      ,D1_ALFCPST			= @D1_ALFCPST		
      ,D1_VFECPST			= @D1_VFECPST		
      ,D1_BFCPANT			= @D1_BFCPANT		
      ,D1_DESCZFP			= @D1_DESCZFP		
      ,D1_VFCPANT			= @D1_VFCPANT		
      ,D1_BASEFMD			= @D1_BASEFMD		
      ,D1_VALFMD			= @D1_VALFMD		
      ,D1_ALQNDES			= @D1_ALQNDES		
      ,D1_DESCZFR			= @D1_DESCZFR		
      ,D1_ALQFMD			= @D1_ALQFMD		
      ,D1_DESCZFC			= @D1_DESCZFC		
      ,D1_AFCPANT			= @D1_AFCPANT		
      ,D1_ALQFECP			= @D1_ALQFECP		
      ,D1_VALFECP			= @D1_VALFECP		
      ,D1_ZDESCPR			= @D1_ZDESCPR		
      ,D1_ZZUSER			= @D1_ZZUSER		
      ,D1_ZCNAE				= @D1_ZCNAE		
      ,D1_ZREGIME			= @D1_ZREGIME		
      ,D1_CODROM			= @D1_CODROM		
      ,D1_NFPNUM			= @D1_NFPNUM		
      ,D1_CTROG				= @D1_CTROG		
      ,D1_CODSAF			= @D1_CODSAF		
      ,D1_NFPSER			= @D1_NFPSER		
      ,D1_ITEROM			= @D1_ITEROM		
      ,D1_BASFECP			= @D1_BASFECP		
      ,D1_BSFCCMP			= @D1_BSFCCMP		
      ,D1_FCPAUX			= @D1_FCPAUX		
      ,D1_BSFCPST			= @D1_BSFCPST		
      ,D1_USERLGI			= @D1_USERLGI		
      ,D1_USERLGA			= @D1_USERLGA		
      ,D1_ZZITAUX			= @D1_ZZITAUX		
      ,D1_ZZTES				= @D1_ZZTES		
      ,D1_DEDUCAO			= @D1_DEDUCAO		
      ,D1_FATDIRE			= @D1_FATDIRE		
      ,D1_RETENCA			= @D1_RETENCA		
      ,D1_IDTRIB			= @D1_IDTRIB		
      ,D1_CTAREC			= @D1_CTAREC		
      ,D1_ZTPUSO			= @D1_ZTPUSO		
      ,D1_ZPREDIC			= @D1_ZPREDIC		
      ,D_E_L_E_T_			= @D_E_L_E_T_		
      --,R_E_C_N_O_			= @R_E_C_N_O_		
      ,R_E_C_D_E_L_		= @R_E_C_D_E_L_	
      --,[dt_criacao]		= 
      ,[dt_alteracao]		= getdate()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSD2010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[sp_alteraRegistroSD2010]
@sk_destino int 
,@D2_COD varchar(15)
,@D2_SEGUM varchar(2)
,@D2_UM varchar(2)
,@D2_QUANT float
,@D2_PRCVEN float
,@D2_TOTAL float
,@D2_VALIPI float
,@D2_VALICM float
,@D2_TES varchar(3)
,@D2_CF varchar(5)
,@D2_DESC float
,@D2_IPI float
,@D2_PICM float
,@D2_VALCSL float
,@D2_CONTA varchar(20)
,@D2_PESO float
,@D2_OP varchar(14)
,@D2_PEDIDO varchar(6)
,@D2_ITEMPV varchar(2)
,@D2_LOCAL varchar(2)
,@D2_GRUPO varchar(4)
,@D2_TP varchar(2)
,@D2_EMISSAO varchar(8)
,@D2_CUSTO1 float
,@D2_CUSTO2 float
,@D2_CUSTO3 float
,@D2_CUSTO4 float
,@D2_CUSTO5 float
,@D2_PRUNIT float
,@D2_QTSEGUM float
,@D2_NUMSEQ varchar(6)
,@D2_EST varchar(2)
,@D2_DESCON float
,@D2_TIPO varchar(1)
,@D2_NFORI varchar(9)
,@D2_SERIORI varchar(3)
,@D2_QTDEDEV float
,@D2_VALDEV float
,@D2_ORIGLAN varchar(2)
,@D2_BRICMS float
,@D2_BASEORI float
,@D2_BASEICM float
,@D2_VALACRS float
,@D2_IDENTB6 varchar(6)
,@D2_CODISS varchar(9)
,@D2_GRADE varchar(1)
,@D2_SEQCALC varchar(14)
,@D2_ICMSRET float
,@D2_COMIS1 float
,@D2_COMIS2 float
,@D2_COMIS3 float
,@D2_COMIS4 float
,@D2_COMIS5 float
,@D2_LOTECTL varchar(21)
,@D2_NUMLOTE varchar(6)
,@D2_DTVALID varchar(8)
,@D2_DESCZFR float
,@D2_PDV varchar(10)
,@D2_NUMSERI varchar(20)
,@D2_DTLCTCT varchar(8)
,@D2_CUSFF1 float
,@D2_CUSFF2 float
,@D2_CUSFF3 float
,@D2_CUSFF4 float
,@D2_CUSFF5 float
,@D2_CLASFIS varchar(3)
,@D2_BASIMP1 float
,@D2_REMITO varchar(9)
,@D2_SERIREM varchar(3)
,@D2_BASIMP3 float
,@D2_BASIMP2 float
,@D2_ITEMREM varchar(2)
,@D2_BASIMP4 float
,@D2_BASIMP5 float
,@D2_BASIMP6 float
,@D2_VALIMP1 float
,@D2_VALIMP2 float
,@D2_VALIMP3 float
,@D2_VALIMP4 float
,@D2_VALIMP5 float
,@D2_VALIMP6 float
,@D2_ITEMORI varchar(4)
,@D2_CODFAB varchar(6)
,@D2_LOJAFA varchar(2)
,@D2_ALQIMP1 float
,@D2_SERMAN varchar(3)
,@D2_ALQIMP2 float
,@D2_ALQIMP3 float
,@D2_ALQIMP4 float
,@D2_ALQIMP5 float
,@D2_ALQIMP6 float
,@D2_ESPECIE varchar(5)
,@D2_CCUSTO varchar(9)
,@D2_ITEMCC varchar(9)
,@D2_LOCALIZ varchar(15)
,@D2_ENVCNAB varchar(8)
,@D2_ALIQINS float
,@D2_ABSCINS float
,@D2_VLIMPOR float
,@D2_VCAT156 float
,@D2_DFABRIC varchar(8)
,@D2_PREEMB varchar(20)
,@D2_ALIQISS float
,@D2_BASEIPI float
,@D2_BASEISS float
,@D2_VALISS float
,@D2_SEGURO float
,@D2_VALFRE float
,@D2_TPDCENV varchar(1)
,@D2_DESPESA float
,@D2_OK varchar(2)
,@D2_CLVL varchar(9)
,@D2_BASEINS float
,@D2_ICMFRET float
,@D2_SERVIC varchar(3)
,@D2_STSERV varchar(1)
,@D2_VALINS float
,@D2_PROJPMS varchar(10)
,@D2_EDTPMS varchar(12)
,@D2_TASKPMS varchar(12)
,@D2_LICITA varchar(6)
,@D2_VARPRUN float
,@D2_FORMUL varchar(1)
,@D2_TIPODOC varchar(2)
,@D2_VAC float
,@D2_TIPOREM varchar(1)
,@D2_QTDEFAT float
,@D2_QTDAFAT float
,@D2_SEQUEN varchar(2)
,@D2_POTENCI float
,@D2_TPESTR varchar(6)
,@D2_VALBRUT float
,@D2_REGWMS varchar(1)
,@D2_DTDIGIT varchar(8)
,@D2_NUMCP varchar(9)
,@D2_CUSRP1 float
,@D2_CUSRP2 float
,@D2_CUSRP3 float
,@D2_CUSRP4 float
,@D2_CUSRP5 float
,@D2_SITTRIB varchar(5)
,@D2_NFCUP varchar(9)
,@D2_ALQIRRF float
,@D2_VALFDS float
,@D2_PRFDSUL float
,@D2_UFERMS float
,@D2_BASEIRR float
,@D2_CODROM varchar(6)
,@D2_ESTCRED float
,@D2_BASETST float
,@D2_ALIQTST float
,@D2_VALTST float
,@D2_BASEPS3 float
,@D2_ALIQPS3 float
,@D2_CFPS varchar(6)
,@D2_DESCICM float
,@D2_TRT varchar(3)
,@D2_PRUNDA float
,@D2_VALPS3 float
,@D2_BASECF3 float
,@D2_ALIQCF3 float
,@D2_VALCF3 float
,@D2_IDSB1 varchar(20)
,@D2_IDSB5 varchar(20)
,@D2_IDSBZ varchar(20)
,@D2_IDSF4 varchar(20)
,@D2_IDSF7 varchar(20)
,@D2_09CAT17 float
,@D2_16CAT17 float
,@D2_ABATINS float
,@D2_ALIQFET float
,@D2_ALIQSOL float
,@D2_BASEFAB float
,@D2_BASEFAC float
,@D2_BASEFET float
,@D2_CRPRESC float
,@D2_OKISS varchar(10)
,@D2_VALFAC float
,@D2_VALFET float
,@D2_TOTIMP float
,@D2_BASEPIS float
,@D2_VALCOF float
,@D2_BASECSL float
,@D2_ALIQFAB float
,@D2_ALIQFAC float
,@D2_VALFAB float
,@D2_VALIRRF float
,@D2_BASECOF float
,@D2_FCICOD varchar(36)
,@D2_ORDSEP varchar(6)
,@D2_DESCZFC float
,@D2_DESCZFP float
,@D2_ESTOQUE varchar(1)
,@D2_ALIQINA float
,@D2_VALINA float
,@D2_BASEINA float
,@D2_ABATISS float
,@D2_ABATMAT float
,@D2_TNATREC varchar(4)
,@D2_CNATREC varchar(3)
,@D2_GRUPONC varchar(2)
,@D2_DTFIMNT varchar(8)
,@D2_TOTEST float
,@D2_TOTFED float
,@D2_TOTMUN float
,@D2_VALFMP float
,@D2_VALFMD float
,@D2_IDCFC varchar(20)
,@D2_GRPCST varchar(3)
,@D2_ALQFMD float
,@D2_ALQFMP float
,@D2_BASEFMD float
,@D2_BASEFMP float
,@D2_MSEXP varchar(8)
,@D2_HREXPO varchar(8)
,@D2_VALCPB float
,@D2_ALIQCPB float
,@D2_FTRICMS float
,@D2_VRDICMS float
,@D2_INDICE float
,@D2_CODLAN varchar(6)
,@D2_CODLPRE varchar(6)
,@D2_ITLPRE varchar(3)
,@D2_CBASEAF varchar(14)
,@D2_BASEFUN float
,@D2_ALIQFUN float
,@D2_VALFUN float
,@D2_RATEIO varchar(1)
,@D2_VLSENAR float
,@D2_ALSENAR float
,@D2_BSSENAR float
,@D2_VLINCMG float
,@D2_PRINCMG float
,@D2_ALQCOF float
,@D2_VALPIS float
,@D2_ALQCSL float
,@D2_ALQPIS float
,@D2_ITEMGAR varchar(2)
,@D2_ORCGAR varchar(6)
,@D2_ALMTERC varchar(2)
,@D2_PRODFIN varchar(15)
,@D2_MARGEM float
,@D2_VREINT float
,@D2_BSREIN float
,@D2_REVISAO varchar(3)
,@D2_SDOC varchar(3)
,@D2_SDOCREM varchar(3)
,@D2_SDOCMAN varchar(3)
,@D2_SDOCORI varchar(3)
,@D2_ALIFUND float
,@D2_ALIIMA float
,@D2_ALIFASE float
,@D2_BASFASE float
,@D2_BASFUND float
,@D2_BASIMA float
,@D2_VALFASE float
,@D2_VALFUND float
,@D2_VALIMA float
,@D2_CSOSN varchar(3)
,@D2_BASECPB float
,@D2_NRECAGR varchar(5)
,@D2_BASEDES float
,@D2_ALIQCMP float
,@D2_DIFAL float
,@D2_ICMSCOM float
,@D2_PDDES float
,@D2_PDORI float
,@D2_VFCPDIF float
,@D2_ALFCCMP float
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@D2_EC05DB varchar(16)
,@D2_EC05CR varchar(16)
,@D2_EC06DB varchar(16)
,@D2_EC06CR varchar(16)
,@D2_EC07DB varchar(16)
,@D2_EC07CR varchar(16)
,@D2_EC08DB varchar(16)
,@D2_EC08CR varchar(16)
,@D2_EC09DB varchar(16)
,@D2_EC09CR varchar(16)
,@D2_ALQFEEF float
,@D2_VALFEEF float
,@D2_BASFEEF float
,@D2_VALPRO float
,@D2_BASEPRO float
,@D2_ALIQPRO float
,@D2_ZZNATUR varchar(9)
,@D2_VALFECP float
,@D2_ALQFECP float
,@D2_ALFCPST float
,@D2_VOPDIF float
,@D2_ICMSDIF float
,@D2_VFECPST float
,@D2_ZCONTRA varchar(20)
,@D2_ZREVISA varchar(3)
,@D2_ZMEDICA varchar(6)
,@D2_TPREPAS varchar(6)
,@D2_BSFCCMP float
,@D2_FCPAUX float
,@D2_BASFECP float
,@D2_BSFCPST float
,@D2_USERLGI varchar(17)
,@D2_USERLGA varchar(17)
,@D2_ALQCPM float
,@D2_BASECPM float
,@D2_VALCPM float
,@D2_CTAREC varchar(20)
,@D2_DECQTD float
,@D2_IDTRIB varchar(36)
,@D2_PAFMD5 varchar(32)
,@D2_DECVLU float
,@D2_FILIAL varchar(2)
,@D2_DOC varchar(9)
,@D2_SERIE varchar(3)
,@D2_CLIENTE varchar(6)
,@D2_LOJA varchar(2)
,@D2_ITEM varchar(2)
,@R_E_C_D_E_L_ int
as

UPDATE [dbo].[SD2010]
   SET 
       [D2_COD]			= @D2_COD		
      ,[D2_SEGUM]		= @D2_SEGUM	
      ,[D2_UM]			= @D2_UM		
      ,[D2_QUANT]		= @D2_QUANT	
      ,[D2_PRCVEN]		= @D2_PRCVEN	
      ,[D2_TOTAL]		= @D2_TOTAL	
      ,[D2_VALIPI]		= @D2_VALIPI	
      ,[D2_VALICM]		= @D2_VALICM	
      ,[D2_TES]			= @D2_TES		
      ,[D2_CF]			= @D2_CF		
      ,[D2_DESC]		= @D2_DESC	
      ,[D2_IPI]			= @D2_IPI		
      ,[D2_PICM]		= @D2_PICM	
      ,[D2_VALCSL]		= @D2_VALCSL	
      ,[D2_CONTA]		= @D2_CONTA	
      ,[D2_PESO]		= @D2_PESO	
      ,[D2_OP]			= @D2_OP		
      ,[D2_PEDIDO]		= @D2_PEDIDO	
      ,[D2_ITEMPV]		= @D2_ITEMPV	
      ,[D2_LOCAL]		= @D2_LOCAL	
      ,[D2_GRUPO]		= @D2_GRUPO	
      ,[D2_TP]			= @D2_TP		
      ,[D2_EMISSAO]		= @D2_EMISSAO	
      ,[D2_CUSTO1]		= @D2_CUSTO1	
      ,[D2_CUSTO2]		= @D2_CUSTO2	
      ,[D2_CUSTO3]		= @D2_CUSTO3	
      ,[D2_CUSTO4]		= @D2_CUSTO4	
      ,[D2_CUSTO5]		= @D2_CUSTO5	
      ,[D2_PRUNIT]		= @D2_PRUNIT	
      ,[D2_QTSEGUM]		= @D2_QTSEGUM	
      ,[D2_NUMSEQ]		= @D2_NUMSEQ	
      ,[D2_EST]			= @D2_EST		
      ,[D2_DESCON]		= @D2_DESCON	
      ,[D2_TIPO]		= @D2_TIPO	
      ,[D2_NFORI]		= @D2_NFORI	
      ,[D2_SERIORI]		= @D2_SERIORI	
      ,[D2_QTDEDEV]		= @D2_QTDEDEV	
      ,[D2_VALDEV]		= @D2_VALDEV	
      ,[D2_ORIGLAN]		= @D2_ORIGLAN	
      ,[D2_BRICMS]		= @D2_BRICMS	
      ,[D2_BASEORI]		= @D2_BASEORI	
      ,[D2_BASEICM]		= @D2_BASEICM	
      ,[D2_VALACRS]		= @D2_VALACRS	
      ,[D2_IDENTB6]		= @D2_IDENTB6	
      ,[D2_CODISS]		= @D2_CODISS	
      ,[D2_GRADE]		= @D2_GRADE	
      ,[D2_SEQCALC]		= @D2_SEQCALC	
      ,[D2_ICMSRET]		= @D2_ICMSRET	
      ,[D2_COMIS1]		= @D2_COMIS1	
      ,[D2_COMIS2]		= @D2_COMIS2	
      ,[D2_COMIS3]		= @D2_COMIS3	
      ,[D2_COMIS4]		= @D2_COMIS4	
      ,[D2_COMIS5]		= @D2_COMIS5	
      ,[D2_LOTECTL]		= @D2_LOTECTL	
      ,[D2_NUMLOTE]		= @D2_NUMLOTE	
      ,[D2_DTVALID]		= @D2_DTVALID	
      ,[D2_DESCZFR]		= @D2_DESCZFR	
      ,[D2_PDV]			= @D2_PDV		
      ,[D2_NUMSERI]		= @D2_NUMSERI	
      ,[D2_DTLCTCT]		= @D2_DTLCTCT	
      ,[D2_CUSFF1]		= @D2_CUSFF1	
      ,[D2_CUSFF2]		= @D2_CUSFF2	
      ,[D2_CUSFF3]		= @D2_CUSFF3	
      ,[D2_CUSFF4]		= @D2_CUSFF4	
      ,[D2_CUSFF5]		= @D2_CUSFF5	
      ,[D2_CLASFIS]		= @D2_CLASFIS	
      ,[D2_BASIMP1]		= @D2_BASIMP1	
      ,[D2_REMITO]		= @D2_REMITO	
      ,[D2_SERIREM]		= @D2_SERIREM	
      ,[D2_BASIMP3]		= @D2_BASIMP3	
      ,[D2_BASIMP2]		= @D2_BASIMP2	
      ,[D2_ITEMREM]		= @D2_ITEMREM	
      ,[D2_BASIMP4]		= @D2_BASIMP4	
      ,[D2_BASIMP5]		= @D2_BASIMP5	
      ,[D2_BASIMP6]		= @D2_BASIMP6	
      ,[D2_VALIMP1]		= @D2_VALIMP1	
      ,[D2_VALIMP2]		= @D2_VALIMP2	
      ,[D2_VALIMP3]		= @D2_VALIMP3	
      ,[D2_VALIMP4]		= @D2_VALIMP4	
      ,[D2_VALIMP5]		= @D2_VALIMP5	
      ,[D2_VALIMP6]		= @D2_VALIMP6	
      ,[D2_ITEMORI]		= @D2_ITEMORI	
      ,[D2_CODFAB]		= @D2_CODFAB	
      ,[D2_LOJAFA]		= @D2_LOJAFA	
      ,[D2_ALQIMP1]		= @D2_ALQIMP1	
      ,[D2_SERMAN]		= @D2_SERMAN	
      ,[D2_ALQIMP2]		= @D2_ALQIMP2	
      ,[D2_ALQIMP3]		= @D2_ALQIMP3	
      ,[D2_ALQIMP4]		= @D2_ALQIMP4	
      ,[D2_ALQIMP5]		= @D2_ALQIMP5	
      ,[D2_ALQIMP6]		= @D2_ALQIMP6	
      ,[D2_ESPECIE]		= @D2_ESPECIE	
      ,[D2_CCUSTO]		= @D2_CCUSTO	
      ,[D2_ITEMCC]		= @D2_ITEMCC	
      ,[D2_LOCALIZ]		= @D2_LOCALIZ	
      ,[D2_ENVCNAB]		= @D2_ENVCNAB	
      ,[D2_ALIQINS]		= @D2_ALIQINS	
      ,[D2_ABSCINS]		= @D2_ABSCINS	
      ,[D2_VLIMPOR]		= @D2_VLIMPOR	
      ,[D2_VCAT156]		= @D2_VCAT156	
      ,[D2_DFABRIC]		= @D2_DFABRIC	
      ,[D2_PREEMB]		= @D2_PREEMB	
      ,[D2_ALIQISS]		= @D2_ALIQISS	
      ,[D2_BASEIPI]		= @D2_BASEIPI	
      ,[D2_BASEISS]		= @D2_BASEISS	
      ,[D2_VALISS]		= @D2_VALISS	
      ,[D2_SEGURO]		= @D2_SEGURO	
      ,[D2_VALFRE]		= @D2_VALFRE	
      ,[D2_TPDCENV]		= @D2_TPDCENV	
      ,[D2_DESPESA]		= @D2_DESPESA	
      ,[D2_OK]			= @D2_OK		
      ,[D2_CLVL]		= @D2_CLVL	
      ,[D2_BASEINS]		= @D2_BASEINS	
      ,[D2_ICMFRET]		= @D2_ICMFRET	
      ,[D2_SERVIC]		= @D2_SERVIC	
      ,[D2_STSERV]		= @D2_STSERV	
      ,[D2_VALINS]		= @D2_VALINS	
      ,[D2_PROJPMS]		= @D2_PROJPMS	
      ,[D2_EDTPMS]		= @D2_EDTPMS	
      ,[D2_TASKPMS]		= @D2_TASKPMS	
      ,[D2_LICITA]		= @D2_LICITA	
      ,[D2_VARPRUN]		= @D2_VARPRUN	
      ,[D2_FORMUL]		= @D2_FORMUL	
      ,[D2_TIPODOC]		= @D2_TIPODOC	
      ,[D2_VAC]			= @D2_VAC		
      ,[D2_TIPOREM]		= @D2_TIPOREM	
      ,[D2_QTDEFAT]		= @D2_QTDEFAT	
      ,[D2_QTDAFAT]		= @D2_QTDAFAT	
      ,[D2_SEQUEN]		= @D2_SEQUEN	
      ,[D2_POTENCI]		= @D2_POTENCI	
      ,[D2_TPESTR]		= @D2_TPESTR	
      ,[D2_VALBRUT]		= @D2_VALBRUT	
      ,[D2_REGWMS]		= @D2_REGWMS	
      ,[D2_DTDIGIT]		= @D2_DTDIGIT	
      ,[D2_NUMCP]		= @D2_NUMCP	
      ,[D2_CUSRP1]		= @D2_CUSRP1	
      ,[D2_CUSRP2]		= @D2_CUSRP2	
      ,[D2_CUSRP3]		= @D2_CUSRP3	
      ,[D2_CUSRP4]		= @D2_CUSRP4	
      ,[D2_CUSRP5]		= @D2_CUSRP5	
      ,[D2_SITTRIB]		= @D2_SITTRIB	
      ,[D2_NFCUP]		= @D2_NFCUP	
      ,[D2_ALQIRRF]		= @D2_ALQIRRF	
      ,[D2_VALFDS]		= @D2_VALFDS	
      ,[D2_PRFDSUL]		= @D2_PRFDSUL	
      ,[D2_UFERMS]		= @D2_UFERMS	
      ,[D2_BASEIRR]		= @D2_BASEIRR	
      ,[D2_CODROM]		= @D2_CODROM	
      ,[D2_ESTCRED]		= @D2_ESTCRED	
      ,[D2_BASETST]		= @D2_BASETST	
      ,[D2_ALIQTST]		= @D2_ALIQTST	
      ,[D2_VALTST]		= @D2_VALTST	
      ,[D2_BASEPS3]		= @D2_BASEPS3	
      ,[D2_ALIQPS3]		= @D2_ALIQPS3	
      ,[D2_CFPS]		= @D2_CFPS	
      ,[D2_DESCICM]		= @D2_DESCICM	
      ,[D2_TRT]			= @D2_TRT		
      ,[D2_PRUNDA]		= @D2_PRUNDA	
      ,[D2_VALPS3]		= @D2_VALPS3	
      ,[D2_BASECF3]		= @D2_BASECF3	
      ,[D2_ALIQCF3]		= @D2_ALIQCF3	
      ,[D2_VALCF3]		= @D2_VALCF3	
      ,[D2_IDSB1]		= @D2_IDSB1	
      ,[D2_IDSB5]		= @D2_IDSB5	
      ,[D2_IDSBZ]		= @D2_IDSBZ	
      ,[D2_IDSF4]		= @D2_IDSF4	
      ,[D2_IDSF7]		= @D2_IDSF7	
      ,[D2_09CAT17]		= @D2_09CAT17	
      ,[D2_16CAT17]		= @D2_16CAT17	
      ,[D2_ABATINS]		= @D2_ABATINS	
      ,[D2_ALIQFET]		= @D2_ALIQFET	
      ,[D2_ALIQSOL]		= @D2_ALIQSOL	
      ,[D2_BASEFAB]		= @D2_BASEFAB	
      ,[D2_BASEFAC]		= @D2_BASEFAC	
      ,[D2_BASEFET]		= @D2_BASEFET	
      ,[D2_CRPRESC]		= @D2_CRPRESC	
      ,[D2_OKISS]		= @D2_OKISS	
      ,[D2_VALFAC]		= @D2_VALFAC	
      ,[D2_VALFET]		= @D2_VALFET	
      ,[D2_TOTIMP]		= @D2_TOTIMP	
      ,[D2_BASEPIS]		= @D2_BASEPIS	
      ,[D2_VALCOF]		= @D2_VALCOF	
      ,[D2_BASECSL]		= @D2_BASECSL	
      ,[D2_ALIQFAB]		= @D2_ALIQFAB	
      ,[D2_ALIQFAC]		= @D2_ALIQFAC	
      ,[D2_VALFAB]		= @D2_VALFAB	
      ,[D2_VALIRRF]		= @D2_VALIRRF	
      ,[D2_BASECOF]		= @D2_BASECOF	
      ,[D2_FCICOD]		= @D2_FCICOD	
      ,[D2_ORDSEP]		= @D2_ORDSEP	
      ,[D2_DESCZFC]		= @D2_DESCZFC	
      ,[D2_DESCZFP]		= @D2_DESCZFP	
      ,[D2_ESTOQUE]		= @D2_ESTOQUE	
      ,[D2_ALIQINA]		= @D2_ALIQINA	
      ,[D2_VALINA]		= @D2_VALINA	
      ,[D2_BASEINA]		= @D2_BASEINA	
      ,[D2_ABATISS]		= @D2_ABATISS	
      ,[D2_ABATMAT]		= @D2_ABATMAT	
      ,[D2_TNATREC]		= @D2_TNATREC	
      ,[D2_CNATREC]		= @D2_CNATREC	
      ,[D2_GRUPONC]		= @D2_GRUPONC	
      ,[D2_DTFIMNT]		= @D2_DTFIMNT	
      ,[D2_TOTEST]		= @D2_TOTEST	
      ,[D2_TOTFED]		= @D2_TOTFED	
      ,[D2_TOTMUN]		= @D2_TOTMUN	
      ,[D2_VALFMP]		= @D2_VALFMP	
      ,[D2_VALFMD]		= @D2_VALFMD	
      ,[D2_IDCFC]		= @D2_IDCFC	
      ,[D2_GRPCST]		= @D2_GRPCST	
      ,[D2_ALQFMD]		= @D2_ALQFMD	
      ,[D2_ALQFMP]		= @D2_ALQFMP	
      ,[D2_BASEFMD]		= @D2_BASEFMD	
      ,[D2_BASEFMP]		= @D2_BASEFMP	
      ,[D2_MSEXP]		= @D2_MSEXP	
      ,[D2_HREXPO]		= @D2_HREXPO	
      ,[D2_VALCPB]		= @D2_VALCPB	
      ,[D2_ALIQCPB]		= @D2_ALIQCPB	
      ,[D2_FTRICMS]		= @D2_FTRICMS	
      ,[D2_VRDICMS]		= @D2_VRDICMS	
      ,[D2_INDICE]		= @D2_INDICE	
      ,[D2_CODLAN]		= @D2_CODLAN	
      ,[D2_CODLPRE]		= @D2_CODLPRE	
      ,[D2_ITLPRE]		= @D2_ITLPRE	
      ,[D2_CBASEAF]		= @D2_CBASEAF	
      ,[D2_BASEFUN]		= @D2_BASEFUN	
      ,[D2_ALIQFUN]		= @D2_ALIQFUN	
      ,[D2_VALFUN]		= @D2_VALFUN	
      ,[D2_RATEIO]		= @D2_RATEIO	
      ,[D2_VLSENAR]		= @D2_VLSENAR	
      ,[D2_ALSENAR]		= @D2_ALSENAR	
      ,[D2_BSSENAR]		= @D2_BSSENAR	
      ,[D2_VLINCMG]		= @D2_VLINCMG	
      ,[D2_PRINCMG]		= @D2_PRINCMG	
      ,[D2_ALQCOF]		= @D2_ALQCOF	
      ,[D2_VALPIS]		= @D2_VALPIS	
      ,[D2_ALQCSL]		= @D2_ALQCSL	
      ,[D2_ALQPIS]		= @D2_ALQPIS	
      ,[D2_ITEMGAR]		= @D2_ITEMGAR	
      ,[D2_ORCGAR]		= @D2_ORCGAR	
      ,[D2_ALMTERC]		= @D2_ALMTERC	
      ,[D2_PRODFIN]		= @D2_PRODFIN	
      ,[D2_MARGEM]		= @D2_MARGEM	
      ,[D2_VREINT]		= @D2_VREINT	
      ,[D2_BSREIN]		= @D2_BSREIN	
      ,[D2_REVISAO]		= @D2_REVISAO	
      ,[D2_SDOC]		= @D2_SDOC	
      ,[D2_SDOCREM]		= @D2_SDOCREM	
      ,[D2_SDOCMAN]		= @D2_SDOCMAN	
      ,[D2_SDOCORI]		= @D2_SDOCORI	
      ,[D2_ALIFUND]		= @D2_ALIFUND	
      ,[D2_ALIIMA]		= @D2_ALIIMA	
      ,[D2_ALIFASE]		= @D2_ALIFASE	
      ,[D2_BASFASE]		= @D2_BASFASE	
      ,[D2_BASFUND]		= @D2_BASFUND	
      ,[D2_BASIMA]		= @D2_BASIMA	
      ,[D2_VALFASE]		= @D2_VALFASE	
      ,[D2_VALFUND]		= @D2_VALFUND	
      ,[D2_VALIMA]		= @D2_VALIMA	
      ,[D2_CSOSN]		= @D2_CSOSN	
      ,[D2_BASECPB]		= @D2_BASECPB	
      ,[D2_NRECAGR]		= @D2_NRECAGR	
      ,[D2_BASEDES]		= @D2_BASEDES	
      ,[D2_ALIQCMP]		= @D2_ALIQCMP	
      ,[D2_DIFAL]		= @D2_DIFAL	
      ,[D2_ICMSCOM]		= @D2_ICMSCOM	
      ,[D2_PDDES]		= @D2_PDDES	
      ,[D2_PDORI]		= @D2_PDORI	
      ,[D2_VFCPDIF]		= @D2_VFCPDIF	
      ,[D2_ALFCCMP]		= @D2_ALFCCMP	
      ,[D_E_L_E_T_]		= @D_E_L_E_T_	
      --,[R_E_C_N_O_]		= @R_E_C_N_O_	
      ,[D2_EC05DB]		= @D2_EC05DB	
      ,[D2_EC05CR]		= @D2_EC05CR	
      ,[D2_EC06DB]		= @D2_EC06DB	
      ,[D2_EC06CR]		= @D2_EC06CR	
      ,[D2_EC07DB]		= @D2_EC07DB	
      ,[D2_EC07CR]		= @D2_EC07CR	
      ,[D2_EC08DB]		= @D2_EC08DB	
      ,[D2_EC08CR]		= @D2_EC08CR	
      ,[D2_EC09DB]		= @D2_EC09DB	
      ,[D2_EC09CR]		= @D2_EC09CR	
      ,[D2_ALQFEEF]		= @D2_ALQFEEF	
      ,[D2_VALFEEF]		= @D2_VALFEEF	
      ,[D2_BASFEEF]		= @D2_BASFEEF	
      ,[D2_VALPRO]		= @D2_VALPRO	
      ,[D2_BASEPRO]		= @D2_BASEPRO	
      ,[D2_ALIQPRO]		= @D2_ALIQPRO	
      ,[D2_ZZNATUR]		= @D2_ZZNATUR	
      ,[D2_VALFECP]		= @D2_VALFECP	
      ,[D2_ALQFECP]		= @D2_ALQFECP	
      ,[D2_ALFCPST]		= @D2_ALFCPST	
      ,[D2_VOPDIF]		= @D2_VOPDIF	
      ,[D2_ICMSDIF]		= @D2_ICMSDIF	
      ,[D2_VFECPST]		= @D2_VFECPST	
      ,[D2_ZCONTRA]		= @D2_ZCONTRA	
      ,[D2_ZREVISA]		= @D2_ZREVISA	
      ,[D2_ZMEDICA]		= @D2_ZMEDICA	
      ,[D2_TPREPAS]		= @D2_TPREPAS	
      ,[D2_BSFCCMP]		= @D2_BSFCCMP	
      ,[D2_FCPAUX]		= @D2_FCPAUX	
      ,[D2_BASFECP]		= @D2_BASFECP	
      ,[D2_BSFCPST]		= @D2_BSFCPST	
      ,[D2_USERLGI]		= @D2_USERLGI	
      ,[D2_USERLGA]		= @D2_USERLGA	
      ,[D2_ALQCPM]		= @D2_ALQCPM	
      ,[D2_BASECPM]		= @D2_BASECPM	
      ,[D2_VALCPM]		= @D2_VALCPM	
      ,[D2_CTAREC]		= @D2_CTAREC	
      ,[D2_DECQTD]		= @D2_DECQTD	
      ,[D2_IDTRIB]		= @D2_IDTRIB	
      ,[D2_PAFMD5]		= @D2_PAFMD5	
      ,[D2_DECVLU]		= @D2_DECVLU
	  ,D2_FILIAL		= @D2_FILIAL
	  ,D2_DOC			= @D2_DOC
	  ,D2_SERIE			= @D2_SERIE
	  ,D2_CLIENTE		= @D2_CLIENTE
	  ,D2_LOJA			= @D2_LOJA
	  ,D2_ITEM			= @D2_ITEM
	  ,R_E_C_D_E_L_     = @R_E_C_D_E_L_
      ,[dt_alteracao]	= getdate()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSD3010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE proc [dbo].[sp_alteraRegistroSD3010]
@sk_destino int
,@D3_FILIAL varchar(2)
,@D3_TM varchar(3)
,@D3_COD varchar(15)
,@D3_UM varchar(2)
,@D3_QUANT float
,@D3_CF varchar(3)
,@D3_CONTA varchar(20)
,@D3_OP varchar(14)
,@D3_LOCAL varchar(2)
,@D3_DOC varchar(9)
,@D3_EMISSAO varchar(8)
,@D3_GRUPO varchar(4)
,@D3_CUSTO1 float
,@D3_CUSTO2 float
,@D3_CUSTO3 float
,@D3_CUSTO4 float
,@D3_CUSTO5 float
,@D3_CC varchar(9)
,@D3_PARCTOT varchar(1)
,@D3_ESTORNO varchar(1)
,@D3_NUMSEQ varchar(6)
,@D3_SEGUM varchar(2)
,@D3_QTSEGUM float
,@D3_TIPO varchar(2)
,@D3_NIVEL varchar(3)
,@D3_USUARIO varchar(25)
,@D3_REGWMS varchar(1)
,@D3_PERDA float
,@D3_DTLANC varchar(8)
,@D3_TRT varchar(3)
,@D3_CHAVE varchar(2)
,@D3_IDENT varchar(6)
,@D3_SEQCALC varchar(14)
,@D3_RATEIO float
,@D3_LOTECTL varchar(21)
,@D3_NUMLOTE varchar(6)
,@D3_DTVALID varchar(8)
,@D3_LOCALIZ varchar(15)
,@D3_NUMSERI varchar(20)
,@D3_CUSFF1 float
,@D3_CUSFF2 float
,@D3_CUSFF3 float
,@D3_CUSFF4 float
,@D3_CUSFF5 float
,@D3_ITEM varchar(2)
,@D3_OK varchar(2)
,@D3_ITEMCTA varchar(9)
,@D3_CLVL varchar(9)
,@D3_PROJPMS varchar(10)
,@D3_TASKPMS varchar(12)
,@D3_ORDEM varchar(6)
,@D3_SERVIC varchar(3)
,@D3_STSERV varchar(1)
,@D3_OSTEC varchar(8)
,@D3_POTENCI float
,@D3_TPESTR varchar(6)
,@D3_REGATEN varchar(10)
,@D3_DOCSWN varchar(15)
,@D3_ITEMSWN varchar(4)
,@D3_ITEMGRD varchar(3)
,@D3_STATUS varchar(2)
,@D3_CUSRP1 float
,@D3_CUSRP2 float
,@D3_CUSRP3 float
,@D3_CUSRP4 float
,@D3_CUSRP5 float
,@D3_CMRP float
,@D3_MOEDRP varchar(1)
,@D3_REVISAO varchar(3)
,@D3_HAWB varchar(20)
,@D3_EMPOP varchar(1)
,@D3_CMFIXO float
,@D3_PMACNUT float
,@D3_PMICNUT float
,@D3_MOEDA varchar(1)
,@D3_DIACTB varchar(2)
,@D3_GARANTI varchar(1)
,@D3_NODIA varchar(10)
,@D3_NRBPIMS varchar(10)
,@D3_QTGANHO float
,@D3_QTMAIOR float
,@D3_NUMSA varchar(6)
,@D3_PERIMP float
,@D3_VLRVI float
,@D3_CHAVEF1 varchar(52)
,@D3_NRABATE varchar(8)
,@D3_CODLAN varchar(6)
,@D3_OKISS varchar(2)
,@D3_ITEMSA varchar(2)
,@D3_VLRPD float
,@D3_TEATF varchar(3)
,@D3_CODSAF varchar(15)
,@D3_EC05DB varchar(16)
,@D3_EC05CR varchar(16)
,@D3_EC06DB varchar(16)
,@D3_EC06CR varchar(16)
,@D3_EC07DB varchar(16)
,@D3_EC07CR varchar(16)
,@D3_EC08DB varchar(16)
,@D3_EC08CR varchar(16)
,@D3_EC09DB varchar(16)
,@D3_EC09CR varchar(16)
,@D_E_L_E_T_ varchar(1)
,@D3_TANQUE varchar(6)
,@D3_MASSA float
,@D3_TEMPAMO float
,@D3_TEMPTAQ float
,@D3_DENSAMB float
,@D3_QTDAMB float
,@D3_FATCORR float
,@D3_TPMOVAJ varchar(2)
,@D3_CODFOR varchar(6)
,@D3_LOJAFOR varchar(2)
,@D3_NFORP varchar(6)
,@D3_OBS varchar(20)
,@D3_CHAVEF2 varchar(52)
,@D3_IDDCF varchar(6)
,@D3_OBSERVA varchar(30)
,@D3_FORNDOC varchar(6)
,@D3_LOJADOC varchar(2)
,@D3_PERBLK varchar(6)
,@D3_FATHER varchar(1)
,@D3_USERLGI varchar(17)
,@D3_ZESTMAT varchar(1)
,@D3_ZCRDOBR float
,@D3_ZCRDORG varchar(9)
,@D3_ZZCHVNF varchar(44)
,@D3_MSUIDT uniqueidentifier
as

UPDATE [dbo].[SD3010]
   SET 
      D3_FILIAL		= @D3_FILIAL		
	  ,D3_TM			= @D3_TM			
	  ,D3_COD			= @D3_COD			
	  ,D3_UM			= @D3_UM			
	  ,D3_QUANT			= @D3_QUANT			
	  ,D3_CF			= @D3_CF			
	  ,D3_CONTA			= @D3_CONTA			
	  ,D3_OP			= @D3_OP			
	  ,D3_LOCAL			= @D3_LOCAL			
	  ,D3_DOC			= @D3_DOC			
	  ,D3_EMISSAO		= @D3_EMISSAO		
	  ,D3_GRUPO			= @D3_GRUPO			
	  ,D3_CUSTO1		= @D3_CUSTO1		
	  ,D3_CUSTO2		= @D3_CUSTO2		
	  ,D3_CUSTO3		= @D3_CUSTO3		
	  ,D3_CUSTO4		= @D3_CUSTO4		
	  ,D3_CUSTO5		= @D3_CUSTO5		
	  ,D3_CC			= @D3_CC			
	  ,D3_PARCTOT		= @D3_PARCTOT		
	  ,D3_ESTORNO		= @D3_ESTORNO		
	  ,D3_NUMSEQ		= @D3_NUMSEQ		
	  ,D3_SEGUM			= @D3_SEGUM			
	  ,D3_QTSEGUM		= @D3_QTSEGUM		
	  ,D3_TIPO			= @D3_TIPO			
	  ,D3_NIVEL			= @D3_NIVEL			
	  ,D3_USUARIO		= @D3_USUARIO		
	  ,D3_REGWMS		= @D3_REGWMS		
	  ,D3_PERDA			= @D3_PERDA			
	  ,D3_DTLANC		= @D3_DTLANC		
	  ,D3_TRT			= @D3_TRT			
	  ,D3_CHAVE			= @D3_CHAVE			
	  ,D3_IDENT			= @D3_IDENT			
	  ,D3_SEQCALC		= @D3_SEQCALC		
	  ,D3_RATEIO		= @D3_RATEIO		
	  ,D3_LOTECTL		= @D3_LOTECTL		
	  ,D3_NUMLOTE		= @D3_NUMLOTE		
	  ,D3_DTVALID		= @D3_DTVALID		
	  ,D3_LOCALIZ		= @D3_LOCALIZ		
	  ,D3_NUMSERI		= @D3_NUMSERI		
	  ,D3_CUSFF1		= @D3_CUSFF1		
	  ,D3_CUSFF2		= @D3_CUSFF2		
	  ,D3_CUSFF3		= @D3_CUSFF3		
	  ,D3_CUSFF4		= @D3_CUSFF4		
	  ,D3_CUSFF5		= @D3_CUSFF5		
	  ,D3_ITEM			= @D3_ITEM			
	  ,D3_OK			= @D3_OK			
	  ,D3_ITEMCTA		= @D3_ITEMCTA		
	  ,D3_CLVL			= @D3_CLVL			
	  ,D3_PROJPMS		= @D3_PROJPMS		
	  ,D3_TASKPMS		= @D3_TASKPMS		
	  ,D3_ORDEM			= @D3_ORDEM			
	  ,D3_SERVIC		= @D3_SERVIC		
	  ,D3_STSERV		= @D3_STSERV		
	  ,D3_OSTEC			= @D3_OSTEC			
	  ,D3_POTENCI		= @D3_POTENCI		
	  ,D3_TPESTR		= @D3_TPESTR		
	  ,D3_REGATEN		= @D3_REGATEN		
	  ,D3_DOCSWN		= @D3_DOCSWN		
	  ,D3_ITEMSWN		= @D3_ITEMSWN		
	  ,D3_ITEMGRD		= @D3_ITEMGRD		
	  ,D3_STATUS		= @D3_STATUS		
	  ,D3_CUSRP1		= @D3_CUSRP1		
	  ,D3_CUSRP2		= @D3_CUSRP2		
	  ,D3_CUSRP3		= @D3_CUSRP3		
	  ,D3_CUSRP4		= @D3_CUSRP4		
	  ,D3_CUSRP5		= @D3_CUSRP5		
	  ,D3_CMRP			= @D3_CMRP			
	  ,D3_MOEDRP		= @D3_MOEDRP		
	  ,D3_REVISAO		= @D3_REVISAO		
	  ,D3_HAWB			= @D3_HAWB			
	  ,D3_EMPOP			= @D3_EMPOP			
	  ,D3_CMFIXO		= @D3_CMFIXO		
	  ,D3_PMACNUT		= @D3_PMACNUT		
	  ,D3_PMICNUT		= @D3_PMICNUT		
	  ,D3_MOEDA			= @D3_MOEDA			
	  ,D3_DIACTB		= @D3_DIACTB		
	  ,D3_GARANTI		= @D3_GARANTI		
	  ,D3_NODIA			= @D3_NODIA			
	  ,D3_NRBPIMS		= @D3_NRBPIMS		
	  ,D3_QTGANHO		= @D3_QTGANHO		
	  ,D3_QTMAIOR		= @D3_QTMAIOR		
	  ,D3_NUMSA			= @D3_NUMSA			
	  ,D3_PERIMP		= @D3_PERIMP		
	  ,D3_VLRVI			= @D3_VLRVI			
	  ,D3_CHAVEF1		= @D3_CHAVEF1		
	  ,D3_NRABATE		= @D3_NRABATE		
	  ,D3_CODLAN		= @D3_CODLAN		
	  ,D3_OKISS			= @D3_OKISS			
	  ,D3_ITEMSA		= @D3_ITEMSA		
	  ,D3_VLRPD			= @D3_VLRPD			
	  ,D3_TEATF			= @D3_TEATF			
	  ,D3_CODSAF		= @D3_CODSAF		
	  ,D3_EC05DB		= @D3_EC05DB		
	  ,D3_EC05CR		= @D3_EC05CR		
	  ,D3_EC06DB		= @D3_EC06DB		
	  ,D3_EC06CR		= @D3_EC06CR		
	  ,D3_EC07DB		= @D3_EC07DB		
	  ,D3_EC07CR		= @D3_EC07CR		
	  ,D3_EC08DB		= @D3_EC08DB		
	  ,D3_EC08CR		= @D3_EC08CR		
	  ,D3_EC09DB		= @D3_EC09DB		
	  ,D3_EC09CR		= @D3_EC09CR		
	  ,D_E_L_E_T_		= @D_E_L_E_T_		
	  ,D3_TANQUE		= @D3_TANQUE		
	  ,D3_MASSA			= @D3_MASSA			
	  ,D3_TEMPAMO		= @D3_TEMPAMO		
	  ,D3_TEMPTAQ		= @D3_TEMPTAQ		
	  ,D3_DENSAMB		= @D3_DENSAMB		
	  ,D3_QTDAMB		= @D3_QTDAMB		
	  ,D3_FATCORR		= @D3_FATCORR		
	  ,D3_TPMOVAJ		= @D3_TPMOVAJ		
	  ,D3_CODFOR		= @D3_CODFOR		
	  ,D3_LOJAFOR		= @D3_LOJAFOR		
	  ,D3_NFORP			= @D3_NFORP			
	  ,D3_OBS			= @D3_OBS			
	  ,D3_CHAVEF2		= @D3_CHAVEF2		
	  ,D3_IDDCF			= @D3_IDDCF			
	  ,D3_OBSERVA		= @D3_OBSERVA		
	  ,D3_FORNDOC		= @D3_FORNDOC		
	  ,D3_LOJADOC		= @D3_LOJADOC		
	  ,D3_PERBLK		= @D3_PERBLK		
	  ,D3_FATHER		= @D3_FATHER		
	  ,D3_USERLGI		= @D3_USERLGI		
	  ,D3_ZESTMAT		= @D3_ZESTMAT		
	  ,D3_ZCRDOBR		= @D3_ZCRDOBR		
	  ,D3_ZCRDORG		= @D3_ZCRDORG		
	  ,D3_ZZCHVNF		= @D3_ZZCHVNF		
	  ,D3_MSUIDT		= @D3_MSUIDT		
      ,[dt_alteracao]	= getdate()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSE4010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_alteraRegistroSE4010]
@sk_destino int
,@E4_TIPO varchar(1)
,@E4_COND varchar(40)
,@E4_DESCRI varchar(15)
,@E4_IPI varchar(1)
,@E4_DDD varchar(1)
,@E4_DESCFIN float
,@E4_DIADESC float
,@E4_MSBLQL varchar(1)
,@E4_FORMA varchar(6)
,@E4_ACRSFIN float
,@E4_SOLID varchar(1)
,@E4_ACRES varchar(1)
,@E4_PERCOM float
,@E4_SUPER float
,@E4_INFER float
,@E4_FATOR float
,@E4_PLANO varchar(3)
,@E4_JURCART varchar(1)
,@E4_CTRADT varchar(1)
,@E4_AGRACRS varchar(1)
,@E4_LIMACRS float
,@E4_CCORREN varchar(1)
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@E4_MSEXP varchar(8)
,@E4_FILIAL varchar(2)
,@E4_CODIGO varchar(3)
,@R_E_C_D_E_L_ int

as


UPDATE [dbo].[SE4010]
   SET 
      [E4_TIPO]			=  @E4_TIPO			
      ,[E4_COND]		=  @E4_COND		
      ,[E4_DESCRI]		=  @E4_DESCRI		
      ,[E4_IPI]			=  @E4_IPI			
      ,[E4_DDD]			=  @E4_DDD			
      ,[E4_DESCFIN]		=  @E4_DESCFIN		
      ,[E4_DIADESC]		=  @E4_DIADESC		
      ,[E4_MSBLQL]		=  @E4_MSBLQL		
      ,[E4_FORMA]		=  @E4_FORMA		
      ,[E4_ACRSFIN]		=  @E4_ACRSFIN		
      ,[E4_SOLID]		=  @E4_SOLID		
      ,[E4_ACRES]		=  @E4_ACRES		
      ,[E4_PERCOM]		=  @E4_PERCOM		
      ,[E4_SUPER]		=  @E4_SUPER		
      ,[E4_INFER]		=  @E4_INFER		
      ,[E4_FATOR]		=  @E4_FATOR		
      ,[E4_PLANO]		=  @E4_PLANO		
      ,[E4_JURCART]		=  @E4_JURCART		
      ,[E4_CTRADT]		=  @E4_CTRADT		
      ,[E4_AGRACRS]		=  @E4_AGRACRS		
      ,[E4_LIMACRS]		=  @E4_LIMACRS		
      ,[E4_CCORREN]		=  @E4_CCORREN		
      ,[D_E_L_E_T_]		=  @D_E_L_E_T_		
      --,[R_E_C_N_O_]		=  @R_E_C_N_O_		
      ,[E4_MSEXP]		=  @E4_MSEXP
      ,[dt_alteracao]	= getdate()
	  ,E4_FILIAL        = @E4_FILIAL
	  ,E4_CODIGO		= @E4_CODIGO
	  ,R_E_C_D_E_L_		= @R_E_C_D_E_L_
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSF1010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- F1_FILIAL, F1_DOC, F1_SERIE, F1_FORNECE, F1_LOJA, F1_FORMUL, R_E_C_D_E_L_

CREATE proc [dbo].[sp_alteraRegistroSF1010] 

	   @sk_destino		 int
      ,@F1_COND			 varchar(3)
      ,@F1_DUPL			 varchar(9)
      ,@F1_EMISSAO		 varchar(8)
      ,@F1_EST			 varchar(2)
      ,@F1_FRETE		 float
      ,@F1_DESPESA		 float
      ,@F1_BASEICM		 float
      ,@F1_VALICM		 float
      ,@F1_BASEIPI		 float
      ,@F1_VALIPI		 float
      ,@F1_VALMERC		 float
      ,@F1_VALBRUT		 float
      ,@F1_TIPO			 varchar(1)
      ,@F1_DESCONT		 float
      ,@F1_DTDIGIT		 varchar(8)
      ,@F1_NUMTRIB		 varchar(9)
      ,@F1_CPROVA		 varchar(14)
      ,@F1_BRICMS		 float
      ,@F1_ICMSRET		 float
      ,@F1_BASEFD		 float
      ,@F1_DTLANC		 varchar(8)
      ,@F1_OK			 varchar(2)
      ,@F1_ORIGLAN		 varchar(2)
      ,@F1_TX			 varchar(1)
      ,@F1_CONTSOC		 float
      ,@F1_IRRF			 float
      ,@F1_NFORIG		 varchar(9)
      ,@F1_SERORIG		 varchar(3)
      ,@F1_ESPECIE		 varchar(5)
      ,@F1_IMPORT		 varchar(1)
      ,@F1_II			 float
      ,@F1_REMITO		 varchar(9)
      ,@F1_BASIMP2		 float
      ,@F1_BASIMP3		 float
      ,@F1_BASIMP4		 float
      ,@F1_BASIMP5		 float
      ,@F1_BASIMP6		 float
      ,@F1_VALIMP1		 float
      ,@F1_VALIMP2		 float
      ,@F1_VALIMP3		 float
      ,@F1_VALIMP4		 float
      ,@F1_VALIMP5		 float
      ,@F1_VALIMP6		 float
      ,@F1_ORDPAGO		 varchar(6)
      ,@F1_HORA			 varchar(8)
      ,@F1_INSS			 float
      ,@F1_ISS			 float
      ,@F1_BASIMP1		 float
      ,@F1_HAWB			 varchar(17)
      ,@F1_TIPO_NF		 varchar(1)
      ,@F1_IPI			 float
      ,@F1_ICMS			 float
      ,@F1_PESOL		 float
      ,@F1_FOB_R		 float
      ,@F1_SEGURO		 float
      ,@F1_CIF			 float
      ,@F1_MOEDA		 float
      ,@F1_PREFIXO		 varchar(3)
      ,@F1_STATUS		 varchar(1)
      ,@F1_VALEMB		 float
      ,@F1_RECBMTO		 varchar(8)
      ,@F1_APROV		 varchar(6)
      ,@F1_CTR_NFC		 varchar(12)
      ,@F1_TXMOEDA		 float
      ,@F1_PEDVEND		 varchar(6)
      ,@F1_TIPODOC		 varchar(2)
      ,@F1_TIPOREM		 varchar(1)
      ,@F1_GNR			 varchar(6)
      ,@F1_ORIGEM		 varchar(8)
      ,@F1_PLACA		 varchar(8)
      ,@F1_VALPIS		 float
      ,@F1_VALCOFI		 float
      ,@F1_VALCSLL		 float
      ,@F1_BASEPS3		 float
      ,@F1_VALPS3		 float
      ,@F1_BASECF3		 float
      ,@F1_VALCF3		 float
      ,@F1_NFELETR		 varchar(20)
      ,@F1_EMINFE		 varchar(8)
      ,@F1_HORNFE		 varchar(8)
      ,@F1_CODNFE		 varchar(50)
      ,@F1_CREDNFE		 float
      ,@F1_VNAGREG		 float
      ,@F1_NUMRPS		 varchar(12)
      ,@F1_VALIRF		 float
      ,@F1_NUMMOV		 varchar(2)
      ,@F1_CHVNFE		 varchar(44)
      ,@F1_RECISS		 varchar(1)
      ,@F1_FILORIG		 varchar(2)
      ,@F1_NODIA		 varchar(10)
      ,@F1_ESTCRED		 float
      ,@F1_DIACTB		 varchar(2)
      ,@F1_NUMRA		 varchar(6)
      ,@F1_BASEINS		 float
      ,@F1_VALFDS		 float
      ,@F1_TRANSP		 varchar(6)
      ,@F1_PLIQUI		 float
      ,@F1_PBRUTO		 float
      ,@F1_ESPECI1		 varchar(10)
      ,@F1_VOLUME1		 float
      ,@F1_ESPECI2		 varchar(10)
      ,@F1_VOLUME2		 float
      ,@F1_ESPECI3		 varchar(10)
      ,@F1_VOLUME3		 float
      ,@F1_ESPECI4		 varchar(10)
      ,@F1_VOLUME4		 float
      ,@F1_MOTIVO		 varchar(14)
      ,@F1_VALIMA		 float
      ,@F1_VALFUND		 float
      ,@F1_CLIDEST		 varchar(6)
      ,@F1_LOJDEST		 varchar(2)
      ,@F1_VALFASE		 float
      ,@F1_ESTPRES		 varchar(2)
      ,@F1_MODAL		 varchar(2)
      ,@F1_NUMAIDF		 varchar(7)
      ,@F1_ANOAIDF		 varchar(4)
      ,@F1_VALINA		 float
      ,@F1_BASEINA		 float
      ,@F1_RECOPI		 varchar(1)
      ,@F1_FORRET		 varchar(6)
      ,@F1_LOJARET		 varchar(2)
      ,@F1_MENNOTA		 varchar(60)
      ,@F1_VALFET		 float
      ,@F1_VALFAB		 float
      ,@F1_VALFAC		 float
      ,@F1_FIMP			 varchar(1)
      ,@F1_CLIORI		 varchar(6)
      ,@F1_LOJAORI		 varchar(2)
      ,@F1_FORENT		 varchar(6)
      ,@F1_LOJAENT		 varchar(2)
      ,@F1_TPCOMPL		 varchar(1)
      ,@F1_VALPEDG		 float
      ,@F1_SIMPNAC		 varchar(1)
      ,@F1_VLSENAR		 float
      ,@F1_BASEFMP		 float
      ,@F1_VALFMP		 float
      ,@F1_VLCIDE		 float
      ,@F1_BASECID		 float
      ,@F1_BASECPM		 float
      ,@F1_VLCPM		 float
      ,@F1_MOTRET		 varchar(6)
      ,@F1_IDSA1		 varchar(20)
      ,@F1_IDSA2		 varchar(20)
      ,@F1_IDSED		 varchar(20)
      ,@F1_MSIDENT		 varchar(10)
      ,@F1_BASCOFI		 float
      ,@F1_BASPIS		 float
      ,@F1_TPCTE		 varchar(1)
      ,@F1_MENPAD		 varchar(3)
      ,@F1_QTDCONF		 float
      ,@F1_STATCON		 varchar(1)
      ,@F1_DOCFOL		 varchar(9)
      ,@F1_VERBAFO		 varchar(9)
      ,@F1_BASEFUN		 float
      ,@F1_TPFRETE		 varchar(1)
      ,@F1_BASCSLL		 float
      ,@F1_CODRGS		 varchar(1)
      ,@F1_DAUTNFE		 varchar(8)
      ,@F1_EVENFLG		 varchar(1)
      ,@F1_FLAGRGS		 varchar(4)
      ,@F1_HAUTNFE		 varchar(5)
      ,@F1_IDCCE		 varchar(54)
      ,@F1_IDRGS		 varchar(54)
      ,@F1_INCISS		 varchar(5)
      ,@F1_VEICUL1		 varchar(8)
      ,@F1_VEICUL2		 varchar(8)
      ,@F1_VEICUL3		 varchar(8)
      ,@F1_SDOC			 varchar(3)
      ,@F1_SDOCORI		 varchar(3)
      ,@F1_SDOCMAN		 varchar(3)
      ,@F1_HISTRET		 varbinary(max)
      ,@F1_IDRECOP		 varchar(6)
      ,@F1_DTCPISS		 varchar(8)
      ,@F1_SERMDF		 varchar(3)
      ,@F1_NUMMDF		 varchar(9)
      ,@F1_VERBAIS		 varchar(9)
      ,@F1_DOCISEN		 varchar(9)
      ,@F1_DEVMERC		 varchar(1)
      ,@F1_BOMDES		 varchar(4)
      ,@F1_ZZFLUIG		 float
      ,@F1_VALFMD		 float
      ,@F1_ESTDES		 varchar(2)
      ,@F1_ZLOCPAP		 varchar(50)
      ,@F1_ZLOCPGT		 varchar(2)
      ,@F1_ZOBS			 varbinary(max)
      ,@F1_CODROM		 varchar(10)
      ,@F1_BFCPANT		 float
      ,@F1_VFCPANT		 float
      ,@F1_BASFECP		 float
      ,@F1_BSFCPST		 float
      ,@F1_BSFCCMP		 float
      ,@F1_USERLGI		 varchar(17)
      ,@F1_USERLGA		 varchar(17)
      ,@F1_MUORITR		 varchar(5)
      ,@F1_MUDESTR		 varchar(5)
      ,@F1_UFDESTR		 varchar(2)
      ,@F1_UFORITR		 varchar(2)
      ,@F1_SUBSERI		 varchar(3)
      ,@F1_IDNF			 varchar(36)
      ,@F1_ZRECWMS		 varchar(1)
      ,@F1_ZZSTATU		 varchar(1)
      ,@D_E_L_E_T_		 varchar(1)
      ,@R_E_C_N_O_		 int
      ,@R_E_C_D_E_L_	 int
	  ,@F1_FORMUL		 varchar(1)
	  ,@F1_FILIAL		 varchar(2)
	  ,@F1_DOC			 varchar(9)
	  ,@F1_SERIE		 varchar(3)
	  ,@F1_FORNECE		 varchar(6)
	  ,@F1_LOJA			 varchar(2)

as

UPDATE [dbo].[SF1010]
   SET [F1_FILIAL]			= @F1_FILIAL
      ,[F1_DOC]				= @F1_DOC
      ,[F1_SERIE]			= @F1_SERIE
      ,[F1_FORNECE]			= @F1_FORNECE
      ,[F1_LOJA]			= @F1_LOJA
      ,[F1_COND]			= @F1_COND
      ,[F1_DUPL]			= @F1_DUPL		
      ,[F1_EMISSAO]			= @F1_EMISSAO		
      ,[F1_EST]				= @F1_EST			
      ,[F1_FRETE]			= @F1_FRETE		
      ,[F1_DESPESA]			= @F1_DESPESA		
      ,[F1_BASEICM]			= @F1_BASEICM		
      ,[F1_VALICM]			= @F1_VALICM		
      ,[F1_BASEIPI]			= @F1_BASEIPI		
      ,[F1_VALIPI]			= @F1_VALIPI		
      ,[F1_VALMERC]			= @F1_VALMERC		
      ,[F1_VALBRUT]			= @F1_VALBRUT		
      ,[F1_TIPO]			= @F1_TIPO		
      ,[F1_DESCONT]			= @F1_DESCONT		
      ,[F1_DTDIGIT]			= @F1_DTDIGIT		
      ,[F1_NUMTRIB]			= @F1_NUMTRIB		
      ,[F1_CPROVA]			= @F1_CPROVA		
      ,[F1_BRICMS]			= @F1_BRICMS		
      ,[F1_ICMSRET]			= @F1_ICMSRET		
      ,[F1_BASEFD]			= @F1_BASEFD		
      ,[F1_DTLANC]			= @F1_DTLANC		
      ,[F1_OK]				= @F1_OK			
      ,[F1_ORIGLAN]			= @F1_ORIGLAN		
      ,[F1_TX]				= @F1_TX			
      ,[F1_CONTSOC]			= @F1_CONTSOC		
      ,[F1_IRRF]			= @F1_IRRF		
      ,[F1_FORMUL]			= @F1_FORMUL
      ,[F1_NFORIG]			= @F1_NFORIG		
      ,[F1_SERORIG]			= @F1_SERORIG		
      ,[F1_ESPECIE]			= @F1_ESPECIE		
      ,[F1_IMPORT]			= @F1_IMPORT		
      ,[F1_II]				= @F1_II			
      ,[F1_REMITO]			= @F1_REMITO		
      ,[F1_BASIMP2]			= @F1_BASIMP2		
      ,[F1_BASIMP3]			= @F1_BASIMP3		
      ,[F1_BASIMP4]			= @F1_BASIMP4		
      ,[F1_BASIMP5]			= @F1_BASIMP5		
      ,[F1_BASIMP6]			= @F1_BASIMP6		
      ,[F1_VALIMP1]			= @F1_VALIMP1		
      ,[F1_VALIMP2]			= @F1_VALIMP2		
      ,[F1_VALIMP3]			= @F1_VALIMP3		
      ,[F1_VALIMP4]			= @F1_VALIMP4		
      ,[F1_VALIMP5]			= @F1_VALIMP5		
      ,[F1_VALIMP6]			= @F1_VALIMP6		
      ,[F1_ORDPAGO]			= @F1_ORDPAGO		
      ,[F1_HORA]			= @F1_HORA		
      ,[F1_INSS]			= @F1_INSS		
      ,[F1_ISS]				= @F1_ISS			
      ,[F1_BASIMP1]			= @F1_BASIMP1		
      ,[F1_HAWB]			= @F1_HAWB		
      ,[F1_TIPO_NF]			= @F1_TIPO_NF		
      ,[F1_IPI]				= @F1_IPI			
      ,[F1_ICMS]			= @F1_ICMS		
      ,[F1_PESOL]			= @F1_PESOL		
      ,[F1_FOB_R]			= @F1_FOB_R		
      ,[F1_SEGURO]			= @F1_SEGURO		
      ,[F1_CIF]				= @F1_CIF			
      ,[F1_MOEDA]			= @F1_MOEDA		
      ,[F1_PREFIXO]			= @F1_PREFIXO		
      ,[F1_STATUS]			= @F1_STATUS		
      ,[F1_VALEMB]			= @F1_VALEMB		
      ,[F1_RECBMTO]			= @F1_RECBMTO		
      ,[F1_APROV]			= @F1_APROV		
      ,[F1_CTR_NFC]			= @F1_CTR_NFC		
      ,[F1_TXMOEDA]			= @F1_TXMOEDA		
      ,[F1_PEDVEND]			= @F1_PEDVEND		
      ,[F1_TIPODOC]			= @F1_TIPODOC		
      ,[F1_TIPOREM]			= @F1_TIPOREM		
      ,[F1_GNR]				= @F1_GNR			
      ,[F1_ORIGEM]			= @F1_ORIGEM		
      ,[F1_PLACA]			= @F1_PLACA		
      ,[F1_VALPIS]			= @F1_VALPIS		
      ,[F1_VALCOFI]			= @F1_VALCOFI		
      ,[F1_VALCSLL]			= @F1_VALCSLL		
      ,[F1_BASEPS3]			= @F1_BASEPS3		
      ,[F1_VALPS3]			= @F1_VALPS3		
      ,[F1_BASECF3]			= @F1_BASECF3		
      ,[F1_VALCF3]			= @F1_VALCF3		
      ,[F1_NFELETR]			= @F1_NFELETR		
      ,[F1_EMINFE]			= @F1_EMINFE		
      ,[F1_HORNFE]			= @F1_HORNFE		
      ,[F1_CODNFE]			= @F1_CODNFE		
      ,[F1_CREDNFE]			= @F1_CREDNFE		
      ,[F1_VNAGREG]			= @F1_VNAGREG		
      ,[F1_NUMRPS]			= @F1_NUMRPS		
      ,[F1_VALIRF]			= @F1_VALIRF		
      ,[F1_NUMMOV]			= @F1_NUMMOV		
      ,[F1_CHVNFE]			= @F1_CHVNFE		
      ,[F1_RECISS]			= @F1_RECISS		
      ,[F1_FILORIG]			= @F1_FILORIG		
      ,[F1_NODIA]			= @F1_NODIA		
      ,[F1_ESTCRED]			= @F1_ESTCRED		
      ,[F1_DIACTB]			= @F1_DIACTB		
      ,[F1_NUMRA]			= @F1_NUMRA		
      ,[F1_BASEINS]			= @F1_BASEINS		
      ,[F1_VALFDS]			= @F1_VALFDS		
      ,[F1_TRANSP]			= @F1_TRANSP		
      ,[F1_PLIQUI]			= @F1_PLIQUI		
      ,[F1_PBRUTO]			= @F1_PBRUTO		
      ,[F1_ESPECI1]			= @F1_ESPECI1		
      ,[F1_VOLUME1]			= @F1_VOLUME1		
      ,[F1_ESPECI2]			= @F1_ESPECI2		
      ,[F1_VOLUME2]			= @F1_VOLUME2		
      ,[F1_ESPECI3]			= @F1_ESPECI3		
      ,[F1_VOLUME3]			= @F1_VOLUME3		
      ,[F1_ESPECI4]			= @F1_ESPECI4		
      ,[F1_VOLUME4]			= @F1_VOLUME4		
      ,[F1_MOTIVO]			= @F1_MOTIVO		
      ,[F1_VALIMA]			= @F1_VALIMA		
      ,[F1_VALFUND]			= @F1_VALFUND		
      ,[F1_CLIDEST]			= @F1_CLIDEST		
      ,[F1_LOJDEST]			= @F1_LOJDEST		
      ,[F1_VALFASE]			= @F1_VALFASE		
      ,[F1_ESTPRES]			= @F1_ESTPRES		
      ,[F1_MODAL]			= @F1_MODAL		
      ,[F1_NUMAIDF]			= @F1_NUMAIDF		
      ,[F1_ANOAIDF]			= @F1_ANOAIDF		
      ,[F1_VALINA]			= @F1_VALINA		
      ,[F1_BASEINA]			= @F1_BASEINA		
      ,[F1_RECOPI]			= @F1_RECOPI		
      ,[F1_FORRET]			= @F1_FORRET		
      ,[F1_LOJARET]			= @F1_LOJARET		
      ,[F1_MENNOTA]			= @F1_MENNOTA		
      ,[F1_VALFET]			= @F1_VALFET		
      ,[F1_VALFAB]			= @F1_VALFAB		
      ,[F1_VALFAC]			= @F1_VALFAC		
      ,[F1_FIMP]			= @F1_FIMP		
      ,[F1_CLIORI]			= @F1_CLIORI		
      ,[F1_LOJAORI]			= @F1_LOJAORI		
      ,[F1_FORENT]			= @F1_FORENT		
      ,[F1_LOJAENT]			= @F1_LOJAENT		
      ,[F1_TPCOMPL]			= @F1_TPCOMPL		
      ,[F1_VALPEDG]			= @F1_VALPEDG		
      ,[F1_SIMPNAC]			= @F1_SIMPNAC		
      ,[F1_VLSENAR]			= @F1_VLSENAR		
      ,[F1_BASEFMP]			= @F1_BASEFMP		
      ,[F1_VALFMP]			= @F1_VALFMP		
      ,[F1_VLCIDE]			= @F1_VLCIDE		
      ,[F1_BASECID]			= @F1_BASECID		
      ,[F1_BASECPM]			= @F1_BASECPM		
      ,[F1_VLCPM]			= @F1_VLCPM		
      ,[F1_MOTRET]			= @F1_MOTRET		
      ,[F1_IDSA1]			= @F1_IDSA1		
      ,[F1_IDSA2]			= @F1_IDSA2		
      ,[F1_IDSED]			= @F1_IDSED		
      ,[F1_MSIDENT]			= @F1_MSIDENT		
      ,[F1_BASCOFI]			= @F1_BASCOFI		
      ,[F1_BASPIS]			= @F1_BASPIS		
      ,[F1_TPCTE]			= @F1_TPCTE		
      ,[F1_MENPAD]			= @F1_MENPAD		
      ,[F1_QTDCONF]			= @F1_QTDCONF		
      ,[F1_STATCON]			= @F1_STATCON		
      ,[F1_DOCFOL]			= @F1_DOCFOL		
      ,[F1_VERBAFO]			= @F1_VERBAFO		
      ,[F1_BASEFUN]			= @F1_BASEFUN		
      ,[F1_TPFRETE]			= @F1_TPFRETE		
      ,[F1_BASCSLL]			= @F1_BASCSLL		
      ,[F1_CODRGS]			= @F1_CODRGS		
      ,[F1_DAUTNFE]			= @F1_DAUTNFE		
      ,[F1_EVENFLG]			= @F1_EVENFLG		
      ,[F1_FLAGRGS]			= @F1_FLAGRGS		
      ,[F1_HAUTNFE]			= @F1_HAUTNFE		
      ,[F1_IDCCE]			= @F1_IDCCE		
      ,[F1_IDRGS]			= @F1_IDRGS		
      ,[F1_INCISS]			= @F1_INCISS		
      ,[F1_VEICUL1]			= @F1_VEICUL1		
      ,[F1_VEICUL2]			= @F1_VEICUL2		
      ,[F1_VEICUL3]			= @F1_VEICUL3		
      ,[F1_SDOC]			= @F1_SDOC		
      ,[F1_SDOCORI]			= @F1_SDOCORI		
      ,[F1_SDOCMAN]			= @F1_SDOCMAN		
      ,[F1_HISTRET]			= @F1_HISTRET		
      ,[F1_IDRECOP]			= @F1_IDRECOP		
      ,[F1_DTCPISS]			= @F1_DTCPISS		
      ,[F1_SERMDF]			= @F1_SERMDF		
      ,[F1_NUMMDF]			= @F1_NUMMDF		
      ,[F1_VERBAIS]			= @F1_VERBAIS		
      ,[F1_DOCISEN]			= @F1_DOCISEN		
      ,[F1_DEVMERC]			= @F1_DEVMERC		
      ,[F1_BOMDES]			= @F1_BOMDES		
      ,[F1_ZZFLUIG]			= @F1_ZZFLUIG		
      ,[F1_VALFMD]			= @F1_VALFMD		
      ,[F1_ESTDES]			= @F1_ESTDES		
      ,[F1_ZLOCPAP]			= @F1_ZLOCPAP		
      ,[F1_ZLOCPGT]			= @F1_ZLOCPGT		
      ,[F1_ZOBS]			= @F1_ZOBS		
      ,[F1_CODROM]			= @F1_CODROM		
      ,[F1_BFCPANT]			= @F1_BFCPANT		
      ,[F1_VFCPANT]			= @F1_VFCPANT		
      ,[F1_BASFECP]			= @F1_BASFECP		
      ,[F1_BSFCPST]			= @F1_BSFCPST		
      ,[F1_BSFCCMP]			= @F1_BSFCCMP		
      ,[F1_USERLGI]			= @F1_USERLGI		
      ,[F1_USERLGA]			= @F1_USERLGA		
      ,[F1_MUORITR]			= @F1_MUORITR		
      ,[F1_MUDESTR]			= @F1_MUDESTR		
      ,[F1_UFDESTR]			= @F1_UFDESTR		
      ,[F1_UFORITR]			= @F1_UFORITR		
      ,[F1_SUBSERI]			= @F1_SUBSERI		
      ,[F1_IDNF]			= @F1_IDNF		
      ,[F1_ZRECWMS]			= @F1_ZRECWMS		
      ,[F1_ZZSTATU]			= @F1_ZZSTATU		
      ,[D_E_L_E_T_]			= @D_E_L_E_T_		
      --,[R_E_C_N_O_]			= @R_E_C_N_O_		
      ,[R_E_C_D_E_L_]		= @R_E_C_D_E_L_
      --,[dt_criacao]		= 
      ,[dt_alteracao]		= getdate()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSF2010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_alteraRegistroSF2010]
@sk_destino int
,@F2_COND varchar(3)
,@F2_DUPL varchar(9)
,@F2_EMISSAO varchar(8)
,@F2_EST varchar(2)
,@F2_FRETE float
,@F2_SEGURO float
,@F2_ICMFRET float
,@F2_TIPOCLI varchar(1)
,@F2_VALBRUT float
,@F2_VALICM float
,@F2_BASEICM float
,@F2_VALIPI float
,@F2_BASEIPI float
,@F2_VALMERC float
,@F2_NFORI varchar(9)
,@F2_DESCONT float
,@F2_SERIORI varchar(3)
,@F2_TIPO varchar(1)
,@F2_ESPECI1 varchar(10)
,@F2_ESPECI2 varchar(10)
,@F2_ESPECI3 varchar(10)
,@F2_ESPECI4 varchar(10)
,@F2_VOLUME1 float
,@F2_VOLUME2 float
,@F2_VOLUME3 float
,@F2_VOLUME4 float
,@F2_ICMSRET float
,@F2_PLIQUI float
,@F2_PBRUTO float
,@F2_TRANSP varchar(6)
,@F2_REDESP varchar(6)
,@F2_VEND1 varchar(6)
,@F2_VEND2 varchar(6)
,@F2_VEND3 varchar(6)
,@F2_VEND4 varchar(6)
,@F2_VEND5 varchar(6)
,@F2_OK varchar(4)
,@F2_FIMP varchar(1)
,@F2_DTLANC varchar(8)
,@F2_DTREAJ varchar(8)
,@F2_REAJUST varchar(3)
,@F2_DTBASE0 varchar(8)
,@F2_FATORB0 float
,@F2_DTBASE1 varchar(8)
,@F2_FATORB1 float
,@F2_VARIAC float
,@F2_BASEISS float
,@F2_VALISS float
,@F2_VALFAT float
,@F2_CONTSOC float
,@F2_BRICMS float
,@F2_FRETAUT float
,@F2_ICMAUTO float
,@F2_DESPESA float
,@F2_NEXTSER varchar(3)
,@F2_NEXTDOC varchar(9)
,@F2_ESPECIE varchar(5)
,@F2_PDV varchar(10)
,@F2_MAPA varchar(10)
,@F2_ECF varchar(1)
,@F2_PREFIXO varchar(3)
,@F2_BASIMP1 float
,@F2_BASIMP2 float
,@F2_BASIMP3 float
,@F2_BASIMP4 float
,@F2_BASIMP5 float
,@F2_BASIMP6 float
,@F2_VALIMP1 float
,@F2_VALIMP2 float
,@F2_VALIMP3 float
,@F2_VALIMP4 float
,@F2_VALIMP5 float
,@F2_VALIMP6 float
,@F2_ORDPAGO varchar(6)
,@F2_NFCUPOM varchar(12)
,@F2_VALINSS float
,@F2_HORA varchar(5)
,@F2_MOEDA float
,@F2_REGIAO varchar(3)
,@F2_VALCSLL float
,@F2_VALCOFI float
,@F2_VALPIS float
,@F2_LOTE varchar(1)
,@F2_TXMOEDA float
,@F2_CLEOK varchar(4)
,@F2_CHVCLE varchar(14)
,@F2_IDCLE varchar(12)
,@F2_VALIRRF float
,@F2_RECFAUT varchar(1)
,@F2_CARGA varchar(6)
,@F2_SEQCAR varchar(2)
,@F2_BASEINS float
,@F2_PEDPEND varchar(6)
,@F2_DESCCAB float
,@F2_DTENTR varchar(8)
,@F2_FORMUL varchar(1)
,@F2_TIPODOC varchar(2)
,@F2_NFEACRS varchar(9)
,@F2_TIPOREM varchar(1)
,@F2_SEQENT varchar(6)
,@F2_ICMSDIF float
,@F2_VALACRS float
,@F2_RECISS varchar(1)
,@F2_EMINFE varchar(8)
,@F2_BASEPS3 float
,@F2_VALPS3 float
,@F2_BASECF3 float
,@F2_VALCF3 float
,@F2_FILDEST varchar(2)
,@F2_TIPORET varchar(1)
,@F2_FLAGDEV varchar(1)
,@F2_CGCCLI varchar(16)
,@F2_VALTST float
,@F2_BASEIRR float
,@F2_ESTCRED float
,@F2_NODIA varchar(10)
,@F2_DIACTB varchar(2)
,@F2_HAWB varchar(17)
,@F2_VEICUL2 varchar(8)
,@F2_VEICUL1 varchar(8)
,@F2_ORDSEP varchar(6)
,@F2_BASPIS float
,@F2_RECOPI varchar(1)
,@F2_NUMORC varchar(6)
,@F2_TPFRETE varchar(1)
,@F2_CREDNFE float
,@F2_FORMDES varchar(1)
,@F2_CHVNFE varchar(44)
,@F2_IDSA1 varchar(20)
,@F2_IDSA2 varchar(20)
,@F2_IDSED varchar(20)
,@F2_STATUS varchar(3)
,@F2_CODNFE varchar(50)
,@F2_BSREIN float
,@F2_NFELETR varchar(20)
,@F2_VALFAC float
,@F2_VALFET float
,@F2_VALINA float
,@F2_HORNFE varchar(8)
,@F2_BASEINA float
,@F2_TIPIMP varchar(1)
,@F2_TPCOMPL varchar(1)
,@F2_MENNOTA varchar(60)
,@F2_BASEFMP float
,@F2_IDRECOP varchar(6)
,@F2_TOTEST float
,@F2_TOTFED float
,@F2_TOTMUN float
,@F2_VALFMD float
,@F2_VALFMP float
,@F2_LTRAN varchar(41)
,@F2_TOTIMP float
,@F2_CODRGS varchar(1)
,@F2_DAUTNFE varchar(8)
,@F2_EVENFLG varchar(1)
,@F2_FLAGRGS varchar(4)
,@F2_HAUTNFE varchar(5)
,@F2_IDCCE varchar(54)
,@F2_IDRGS varchar(54)
,@F2_CNO varchar(6)
,@F2_VALFAB float
,@F2_NFSUBST varchar(9)
,@F2_NUMMDF varchar(9)
,@F2_VREINT float
,@F2_FORDES varchar(6)
,@F2_LOJADES varchar(2)
,@F2_DESCZFR float
,@F2_DTTXREF varchar(8)
,@F2_TXREF float
,@F2_VLSENAR float
,@F2_BASEFUN float
,@F2_NTFECP varchar(12)
,@F2_REFTAXA float
,@F2_REFMOED float
,@F2_NFICMST varchar(12)
,@F2_VEICUL3 varchar(8)
,@F2_BASETST float
,@F2_VALFDS float
,@F2_CLIENT varchar(6)
,@F2_LOJENT varchar(2)
,@F2_PREFORI varchar(3)
,@F2_BASCOFI float
,@F2_BASCSLL float
,@F2_DTDIGIT varchar(8)
,@F2_VLR_FRT float
,@F2_VALFUND float
,@F2_VALIMA float
,@F2_VALFASE float
,@F2_SDOCSUB varchar(3)
,@F2_SDOCMAN varchar(3)
,@F2_SDOCORI varchar(3)
,@F2_SDOCMDF varchar(3)
,@F2_SDOCNXT varchar(3)
,@F2_SDOC varchar(3)
,@F2_SERMDF varchar(3)
,@F2_GNRDIF varchar(12)
,@F2_GNRFECP varchar(12)
,@F2_SERSUBS varchar(3)
,@F2_SERSAT varchar(9)
,@F2_DTESERV varchar(8)
,@F2_ZLOCPAP varchar(20)
,@F2_ZMENNOT varbinary(max)
,@F2_BSFCCMP float
,@F2_LOJARET varchar(2)
,@F2_BASFECP float
,@F2_BSFCPST float
,@F2_CLIRET varchar(6)
,@F2_USERLGI varchar(17)
,@F2_USERLGA varchar(17)
,@F2_BASECPM float
,@F2_VLCPM float
,@F2_MUNPRES varchar(7)
,@F2_ESTPRES varchar(2)
,@F2_FRTCFOP varchar(5)
,@F2_CMUNDE varchar(5)
,@F2_PAFMD5 varchar(32)
,@F2_CMUNOR varchar(5)
,@F2_IDNF varchar(36)
,@F2_UFDEST varchar(2)
,@F2_UFORIG varchar(2)
,@F2_CLIREM varchar(6)
,@F2_LOJAREM varchar(2)
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@F2_FILIAL varchar(2)
,@F2_DOC  varchar (9)
,@F2_SERIE  varchar(3)
,@F2_CLIENTE  varchar(6)
,@F2_LOJA varchar(2)
,@R_E_C_D_E_L_ int

as

UPDATE [dbo].[SF2010]
   SET 
       [F2_COND]		= @F2_COND		 
      ,[F2_DUPL]		= @F2_DUPL		
      ,[F2_EMISSAO]		= @F2_EMISSAO		
      ,[F2_EST]			= @F2_EST			
      ,[F2_FRETE]		= @F2_FRETE		
      ,[F2_SEGURO]		= @F2_SEGURO		
      ,[F2_ICMFRET]		= @F2_ICMFRET		
      ,[F2_TIPOCLI]		= @F2_TIPOCLI		
      ,[F2_VALBRUT]		= @F2_VALBRUT		
      ,[F2_VALICM]		= @F2_VALICM		
      ,[F2_BASEICM]		= @F2_BASEICM		
      ,[F2_VALIPI]		= @F2_VALIPI		
      ,[F2_BASEIPI]		= @F2_BASEIPI		
      ,[F2_VALMERC]		= @F2_VALMERC		
      ,[F2_NFORI]		= @F2_NFORI		
      ,[F2_DESCONT]		= @F2_DESCONT		
      ,[F2_SERIORI]		= @F2_SERIORI		
      ,[F2_TIPO]		= @F2_TIPO		
      ,[F2_ESPECI1]		= @F2_ESPECI1		
      ,[F2_ESPECI2]		= @F2_ESPECI2		
      ,[F2_ESPECI3]		= @F2_ESPECI3		
      ,[F2_ESPECI4]		= @F2_ESPECI4		
      ,[F2_VOLUME1]		= @F2_VOLUME1		
      ,[F2_VOLUME2]		= @F2_VOLUME2		
      ,[F2_VOLUME3]		= @F2_VOLUME3		
      ,[F2_VOLUME4]		= @F2_VOLUME4		
      ,[F2_ICMSRET]		= @F2_ICMSRET		
      ,[F2_PLIQUI]		= @F2_PLIQUI		
      ,[F2_PBRUTO]		= @F2_PBRUTO		
      ,[F2_TRANSP]		= @F2_TRANSP		
      ,[F2_REDESP]		= @F2_REDESP		
      ,[F2_VEND1]		= @F2_VEND1		
      ,[F2_VEND2]		= @F2_VEND2		
      ,[F2_VEND3]		= @F2_VEND3		
      ,[F2_VEND4]		= @F2_VEND4		
      ,[F2_VEND5]		= @F2_VEND5		
      ,[F2_OK]			= @F2_OK			
      ,[F2_FIMP]		= @F2_FIMP		
      ,[F2_DTLANC]		= @F2_DTLANC		
      ,[F2_DTREAJ]		= @F2_DTREAJ		
      ,[F2_REAJUST]		= @F2_REAJUST		
      ,[F2_DTBASE0]		= @F2_DTBASE0		
      ,[F2_FATORB0]		= @F2_FATORB0		
      ,[F2_DTBASE1]		= @F2_DTBASE1		
      ,[F2_FATORB1]		= @F2_FATORB1		
      ,[F2_VARIAC]		= @F2_VARIAC		
      ,[F2_BASEISS]		= @F2_BASEISS		
      ,[F2_VALISS]		= @F2_VALISS		
      ,[F2_VALFAT]		= @F2_VALFAT		
      ,[F2_CONTSOC]		= @F2_CONTSOC		
      ,[F2_BRICMS]		= @F2_BRICMS		
      ,[F2_FRETAUT]		= @F2_FRETAUT		
      ,[F2_ICMAUTO]		= @F2_ICMAUTO		
      ,[F2_DESPESA]		= @F2_DESPESA		
      ,[F2_NEXTSER]		= @F2_NEXTSER		
      ,[F2_NEXTDOC]		= @F2_NEXTDOC		
      ,[F2_ESPECIE]		= @F2_ESPECIE		
      ,[F2_PDV]			= @F2_PDV			
      ,[F2_MAPA]		= @F2_MAPA		
      ,[F2_ECF]			= @F2_ECF			
      ,[F2_PREFIXO]		= @F2_PREFIXO		
      ,[F2_BASIMP1]		= @F2_BASIMP1		
      ,[F2_BASIMP2]		= @F2_BASIMP2		
      ,[F2_BASIMP3]		= @F2_BASIMP3		
      ,[F2_BASIMP4]		= @F2_BASIMP4		
      ,[F2_BASIMP5]		= @F2_BASIMP5		
      ,[F2_BASIMP6]		= @F2_BASIMP6		
      ,[F2_VALIMP1]		= @F2_VALIMP1		
      ,[F2_VALIMP2]		= @F2_VALIMP2		
      ,[F2_VALIMP3]		= @F2_VALIMP3		
      ,[F2_VALIMP4]		= @F2_VALIMP4		
      ,[F2_VALIMP5]		= @F2_VALIMP5		
      ,[F2_VALIMP6]		= @F2_VALIMP6		
      ,[F2_ORDPAGO]		= @F2_ORDPAGO		
      ,[F2_NFCUPOM]		= @F2_NFCUPOM		
      ,[F2_VALINSS]		= @F2_VALINSS		
      ,[F2_HORA]		= @F2_HORA		
      ,[F2_MOEDA]		= @F2_MOEDA		
      ,[F2_REGIAO]		= @F2_REGIAO		
      ,[F2_VALCSLL]		= @F2_VALCSLL		
      ,[F2_VALCOFI]		= @F2_VALCOFI		
      ,[F2_VALPIS]		= @F2_VALPIS		
      ,[F2_LOTE]		= @F2_LOTE		
      ,[F2_TXMOEDA]		= @F2_TXMOEDA		
      ,[F2_CLEOK]		= @F2_CLEOK		
      ,[F2_CHVCLE]		= @F2_CHVCLE		
      ,[F2_IDCLE]		= @F2_IDCLE		
      ,[F2_VALIRRF]		= @F2_VALIRRF		
      ,[F2_RECFAUT]		= @F2_RECFAUT		
      ,[F2_CARGA]		= @F2_CARGA		
      ,[F2_SEQCAR]		= @F2_SEQCAR		
      ,[F2_BASEINS]		= @F2_BASEINS		
      ,[F2_PEDPEND]		= @F2_PEDPEND		
      ,[F2_DESCCAB]		= @F2_DESCCAB		
      ,[F2_DTENTR]		= @F2_DTENTR		
      ,[F2_FORMUL]		= @F2_FORMUL		
      ,[F2_TIPODOC]		= @F2_TIPODOC		
      ,[F2_NFEACRS]		= @F2_NFEACRS		
      ,[F2_TIPOREM]		= @F2_TIPOREM		
      ,[F2_SEQENT]		= @F2_SEQENT		
      ,[F2_ICMSDIF]		= @F2_ICMSDIF		
      ,[F2_VALACRS]		= @F2_VALACRS		
      ,[F2_RECISS]		= @F2_RECISS		
      ,[F2_EMINFE]		= @F2_EMINFE		
      ,[F2_BASEPS3]		= @F2_BASEPS3		
      ,[F2_VALPS3]		= @F2_VALPS3		
      ,[F2_BASECF3]		= @F2_BASECF3		
      ,[F2_VALCF3]		= @F2_VALCF3		
      ,[F2_FILDEST]		= @F2_FILDEST		
      ,[F2_TIPORET]		= @F2_TIPORET		
      ,[F2_FLAGDEV]		= @F2_FLAGDEV		
      ,[F2_CGCCLI]		= @F2_CGCCLI		
      ,[F2_VALTST]		= @F2_VALTST		
      ,[F2_BASEIRR]		= @F2_BASEIRR		
      ,[F2_ESTCRED]		= @F2_ESTCRED		
      ,[F2_NODIA]		= @F2_NODIA		
      ,[F2_DIACTB]		= @F2_DIACTB		
      ,[F2_HAWB]		= @F2_HAWB		
      ,[F2_VEICUL2]		= @F2_VEICUL2		
      ,[F2_VEICUL1]		= @F2_VEICUL1		
      ,[F2_ORDSEP]		= @F2_ORDSEP		
      ,[F2_BASPIS]		= @F2_BASPIS		
      ,[F2_RECOPI]		= @F2_RECOPI		
      ,[F2_NUMORC]		= @F2_NUMORC		
      ,[F2_TPFRETE]		= @F2_TPFRETE		
      ,[F2_CREDNFE]		= @F2_CREDNFE		
      ,[F2_FORMDES]		= @F2_FORMDES		
      ,[F2_CHVNFE]		= @F2_CHVNFE		
      ,[F2_IDSA1]		= @F2_IDSA1		
      ,[F2_IDSA2]		= @F2_IDSA2		
      ,[F2_IDSED]		= @F2_IDSED		
      ,[F2_STATUS]		= @F2_STATUS		
      ,[F2_CODNFE]		= @F2_CODNFE		
      ,[F2_BSREIN]		= @F2_BSREIN		
      ,[F2_NFELETR]		= @F2_NFELETR		
      ,[F2_VALFAC]		= @F2_VALFAC		
      ,[F2_VALFET]		= @F2_VALFET		
      ,[F2_VALINA]		= @F2_VALINA		
      ,[F2_HORNFE]		= @F2_HORNFE		
      ,[F2_BASEINA]		= @F2_BASEINA		
      ,[F2_TIPIMP]		= @F2_TIPIMP		
      ,[F2_TPCOMPL]		= @F2_TPCOMPL		
      ,[F2_MENNOTA]		= @F2_MENNOTA		
      ,[F2_BASEFMP]		= @F2_BASEFMP		
      ,[F2_IDRECOP]		= @F2_IDRECOP		
      ,[F2_TOTEST]		= @F2_TOTEST		
      ,[F2_TOTFED]		= @F2_TOTFED		
      ,[F2_TOTMUN]		= @F2_TOTMUN		
      ,[F2_VALFMD]		= @F2_VALFMD		
      ,[F2_VALFMP]		= @F2_VALFMP		
      ,[F2_LTRAN]		= @F2_LTRAN		
      ,[F2_TOTIMP]		= @F2_TOTIMP		
      ,[F2_CODRGS]		= @F2_CODRGS		
      ,[F2_DAUTNFE]		= @F2_DAUTNFE		
      ,[F2_EVENFLG]		= @F2_EVENFLG		
      ,[F2_FLAGRGS]		= @F2_FLAGRGS		
      ,[F2_HAUTNFE]		= @F2_HAUTNFE		
      ,[F2_IDCCE]		= @F2_IDCCE		
      ,[F2_IDRGS]		= @F2_IDRGS		
      ,[F2_CNO]			= @F2_CNO			
      ,[F2_VALFAB]		= @F2_VALFAB		
      ,[F2_NFSUBST]		= @F2_NFSUBST		
      ,[F2_NUMMDF]		= @F2_NUMMDF		
      ,[F2_VREINT]		= @F2_VREINT		
      ,[F2_FORDES]		= @F2_FORDES		
      ,[F2_LOJADES]		= @F2_LOJADES		
      ,[F2_DESCZFR]		= @F2_DESCZFR		
      ,[F2_DTTXREF]		= @F2_DTTXREF		
      ,[F2_TXREF]		= @F2_TXREF		
      ,[F2_VLSENAR]		= @F2_VLSENAR		
      ,[F2_BASEFUN]		= @F2_BASEFUN		
      ,[F2_NTFECP]		= @F2_NTFECP		
      ,[F2_REFTAXA]		= @F2_REFTAXA		
      ,[F2_REFMOED]		= @F2_REFMOED		
      ,[F2_NFICMST]		= @F2_NFICMST		
      ,[F2_VEICUL3]		= @F2_VEICUL3		
      ,[F2_BASETST]		= @F2_BASETST		
      ,[F2_VALFDS]		= @F2_VALFDS		
      ,[F2_CLIENT]		= @F2_CLIENT		
      ,[F2_LOJENT]		= @F2_LOJENT		
      ,[F2_PREFORI]		= @F2_PREFORI		
      ,[F2_BASCOFI]		= @F2_BASCOFI		
      ,[F2_BASCSLL]		= @F2_BASCSLL		
      ,[F2_DTDIGIT]		= @F2_DTDIGIT		
      ,[F2_VLR_FRT]		= @F2_VLR_FRT		
      ,[F2_VALFUND]		= @F2_VALFUND		
      ,[F2_VALIMA]		= @F2_VALIMA		
      ,[F2_VALFASE]		= @F2_VALFASE		
      ,[F2_SDOCSUB]		= @F2_SDOCSUB		
      ,[F2_SDOCMAN]		= @F2_SDOCMAN		
      ,[F2_SDOCORI]		= @F2_SDOCORI		
      ,[F2_SDOCMDF]		= @F2_SDOCMDF		
      ,[F2_SDOCNXT]		= @F2_SDOCNXT		
      ,[F2_SDOC]		= @F2_SDOC		
      ,[F2_SERMDF]		= @F2_SERMDF		
      ,[F2_GNRDIF]		= @F2_GNRDIF		
      ,[F2_GNRFECP]		= @F2_GNRFECP		
      ,[F2_SERSUBS]		= @F2_SERSUBS		
      ,[F2_SERSAT]		= @F2_SERSAT		
      ,[F2_DTESERV]		= @F2_DTESERV		
      ,[F2_ZLOCPAP]		= @F2_ZLOCPAP		
      ,[F2_ZMENNOT]		= @F2_ZMENNOT		
      ,[F2_BSFCCMP]		= @F2_BSFCCMP		
      ,[F2_LOJARET]		= @F2_LOJARET		
      ,[F2_BASFECP]		= @F2_BASFECP		
      ,[F2_BSFCPST]		= @F2_BSFCPST		
      ,[F2_CLIRET]		= @F2_CLIRET		
      ,[F2_USERLGI]		= @F2_USERLGI		
      ,[F2_USERLGA]		= @F2_USERLGA		
      ,[F2_BASECPM]		= @F2_BASECPM		
      ,[F2_VLCPM]		= @F2_VLCPM		
      ,[F2_MUNPRES]		= @F2_MUNPRES		
      ,[F2_ESTPRES]		= @F2_ESTPRES		
      ,[F2_FRTCFOP]		= @F2_FRTCFOP		
      ,[F2_CMUNDE]		= @F2_CMUNDE		
      ,[F2_PAFMD5]		= @F2_PAFMD5		
      ,[F2_CMUNOR]		= @F2_CMUNOR		
      ,[F2_IDNF]		= @F2_IDNF		
      ,[F2_UFDEST]		= @F2_UFDEST		
      ,[F2_UFORIG]		= @F2_UFORIG		
      ,[F2_CLIREM]		= @F2_CLIREM		
      ,[F2_LOJAREM]		= @F2_LOJAREM		
      ,[D_E_L_E_T_]		= @D_E_L_E_T_		
      --,[R_E_C_N_O_]		= @R_E_C_N_O_	
	  ,F2_FILIAL		= @F2_FILIAL
	  ,F2_DOC			= @F2_DOC
	  ,F2_SERIE			= @F2_SERIE
	  ,F2_CLIENTE		= @F2_CLIENTE
	  ,F2_LOJA			= @F2_LOJA
	  ,R_E_C_D_E_L_		= @R_E_C_D_E_L_
      ,[dt_alteracao] = getdate()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSF4010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_alteraRegistroSF4010]

@sk_destino int
,@F4_TIPO varchar(1)
,@F4_ICM varchar(1)
,@F4_IPI varchar(1)
,@F4_CREDICM varchar(1)
,@F4_CREDIPI varchar(1)
,@F4_DUPLIC varchar(1)
,@F4_ESTOQUE varchar(1)
,@F4_CF varchar(5)
,@F4_CFEXT varchar(3)
,@F4_TEXTO varchar(20)
,@F4_BASEICM float
,@F4_BASEIPI float
,@F4_PODER3 varchar(1)
,@F4_LFICM varchar(1)
,@F4_LFIPI varchar(1)
,@F4_DESTACA varchar(1)
,@F4_INCIDE varchar(1)
,@F4_COMPL varchar(1)
,@F4_IPIFRET varchar(1)
,@F4_ISS varchar(1)
,@F4_LFISS varchar(1)
,@F4_NRLIVRO varchar(1)
,@F4_UPRC varchar(1)
,@F4_CONSUMO varchar(1)
,@F4_FORMULA varchar(3)
,@F4_AGREG varchar(1)
,@F4_INCSOL varchar(1)
,@F4_CIAP varchar(1)
,@F4_DESPIPI varchar(1)
,@F4_LIVRO varchar(64)
,@F4_ATUTEC varchar(1)
,@F4_ATUATF varchar(1)
,@F4_TPIPI varchar(1)
,@F4_STDESC varchar(1)
,@F4_BSICMST float
,@F4_CREDST varchar(1)
,@F4_BASEISS float
,@F4_DESPICM varchar(1)
,@F4_SITTRIB varchar(2)
,@F4_PISCOF varchar(1)
,@F4_PISCRED varchar(1)
,@F4_TESDV varchar(3)
,@F4_BASEPIS float
,@F4_BASECOF float
,@F4_IPILICM varchar(1)
,@F4_MOVPRJ varchar(1)
,@F4_ICMSDIF varchar(1)
,@F4_TESP3 varchar(3)
,@F4_QTDZERO varchar(1)
,@F4_SLDNPT varchar(1)
,@F4_DEVZERO varchar(1)
,@F4_TIPOPER varchar(1)
,@F4_MSBLQL varchar(1)
,@F4_TRFICM varchar(1)
,@F4_TESENV varchar(3)
,@F4_OBSICM varchar(1)
,@F4_OBSSOL varchar(1)
,@F4_PICMDIF float
,@F4_SELO varchar(1)
,@F4_ISSST varchar(1)
,@F4_FINALID varchar(254)
,@F4_PISFISC varchar(1)
,@F4_CONTSOC varchar(1)
,@F4_COP varchar(4)
,@F4_INDNTFR varchar(1)
,@F4_CODBCC varchar(2)
,@F4_CPPRODE float
,@F4_AJUSTE varchar(1)
,@F4_TPPRODE varchar(1)
,@F4_CPRECTR varchar(1)
,@F4_IPIANT varchar(1)
,@F4_TPCPRES varchar(1)
,@F4_DESPCOF varchar(1)
,@F4_DSPRDIC varchar(1)
,@F4_REGDSTA varchar(1)
,@F4_OPEMOV varchar(2)
,@F4_TPREG varchar(1)
,@F4_AFRMM varchar(1)
,@F4_BENSATF varchar(1)
,@F4_ICMSST varchar(1)
,@F4_FRETAUT varchar(1)
,@F4_MKPCMP varchar(1)
,@F4_AGRRETC varchar(1)
,@F4_CRDEST varchar(1)
,@F4_RETISS varchar(1)
,@F4_CRPRST float
,@F4_CTIPI varchar(2)
,@F4_TRANFIL varchar(1)
,@F4_CRPRELE float
,@F4_BCRDCOF float
,@F4_AGRCOF varchar(1)
,@F4_LFICMST varchar(1)
,@F4_PISBRUT varchar(1)
,@F4_COFDSZF varchar(1)
,@F4_BCRDPIS float
,@F4_COFBRUT varchar(1)
,@F4_DESPPIS varchar(1)
,@F4_AGRPIS varchar(1)
,@F4_PISDSZF varchar(1)
,@F4_CRDPRES float
,@F4_IPIPC varchar(1)
,@F4_ALICRST float
,@F4_TRIBPRD varchar(2)
,@F4_IPIPECR float
,@F4_TXAPIPI varchar(3)
,@F4_TESE3 varchar(3)
,@F4_CFPS varchar(6)
,@F4_IPIOBS varchar(1)
,@F4_VARATAC varchar(1)
,@F4_IVAUTIL float
,@F4_CFACS varchar(1)
,@F4_CFABOV varchar(1)
,@F4_CPRESPR float
,@F4_VDASOFT varchar(1)
,@F4_VENPRES varchar(1)
,@F4_MOVFIS varchar(1)
,@F4_AGRDRED varchar(1)
,@F4_APLIIVA varchar(1)
,@F4_APLREDP varchar(1)
,@F4_OPERSUC varchar(1)
,@F4_TEMDOCS varchar(1)
,@F4_ESTCRED float
,@F4_ATACVAR varchar(1)
,@F4_CRICMST varchar(1)
,@F4_CODOBSE varchar(6)
,@F4_BSRURAL varchar(1)
,@F4_CREDACU varchar(1)
,@F4_BENDUB varchar(1)
,@F4_CRPRSIM float
,@F4_REDANT float
,@F4_DESCOND varchar(1)
,@F4_NATOPER varchar(10)
,@F4_RECDAC varchar(1)
,@F4_ISEFEMT varchar(1)
,@F4_TABGIAC varchar(3)
,@F4_CTBHISS varchar(9)
,@F4_CSBHISS varchar(5)
,@F4_TNATREC varchar(4)
,@F4_CNATREC varchar(3)
,@F4_GRPNATR varchar(2)
,@F4_DTFIMNT varchar(8)
,@F4_CREDPRE float
,@F4_CONSIND varchar(1)
,@F4_ANTICMS varchar(1)
,@F4_NUMDUB varchar(12)
,@F4_CODDET varchar(4)
,@F4_ISEFECP varchar(1)
,@F4_PARTICM varchar(1)
,@F4_COMPONE varchar(1)
,@F4_PSCFST varchar(1)
,@F4_APLIRED varchar(1)
,@F4_ICMSTMT varchar(1)
,@F4_PERCATM float
,@F4_CRDACUM varchar(1)
,@F4_PERCMED float
,@F4_BSICMRE varchar(1)
,@F4_STLIQ varchar(1)
,@F4_CV139 varchar(1)
,@F4_RFETALG varchar(1)
,@F4_FTATUSC varchar(1)
,@F4_MALQPIS float
,@F4_TIPODUB varchar(1)
,@F4_OPERGAR varchar(1)
,@F4_DESTRUI varchar(1)
,@F4_DEVPARC varchar(1)
,@F4_IMPIND varchar(1)
,@F4_DICMFUN varchar(1)
,@F4_IDHIST varchar(20)
,@F4_BSRDICM varchar(1)
,@F4_MALQCOF float
,@F4_NORESP varchar(1)
,@F4_CIAPTRB varchar(1)
,@F4_CFAMAD varchar(1)
,@F4_COFMIN varchar(1)
,@F4_CROUTSP float
,@F4_RDBSICM varchar(1)
,@F4_IPIVFCF varchar(1)
,@F4_TRAFILI varchar(1)
,@F4_TREGDMA varchar(2)
,@F4_IPIMIN varchar(1)
,@F4_PISMIN varchar(1)
,@F4_TPOP varchar(2)
,@F4_APSCFST varchar(1)
,@F4_CRDTRAN float
,@F4_CSOSN varchar(3)
,@F4_NATOPNF varchar(3)
,@F4_OUTPERC float
,@F4_CSTCF1 varchar(2)
,@F4_CSTPF1 varchar(2)
,@F4_EFDF100 varchar(1)
,@F4_DUPLIPI varchar(1)
,@F4_REGESP varchar(2)
,@F4_AGRPEDG varchar(1)
,@F4_INDVF varchar(1)
,@F4_MKPSOL varchar(1)
,@F4_CROUTGO float
,@F4_REFATAN varchar(1)
,@F4_DBSTCSL varchar(1)
,@F4_DBSTIRR varchar(1)
,@F4_INTBSIC varchar(1)
,@F4_CRICMS varchar(1)
,@F4_CRPREPR float
,@F4_SOMAIPI varchar(1)
,@F4_ISEFEMG varchar(1)
,@F4_MTRTBH varchar(2)
,@F4_TPRSPL varchar(1)
,@F4_MSGLT varchar(1)
,@F4_CRPREPE float
,@F4_DUPLIST varchar(1)
,@F4_BCPCST varchar(1)
,@F4_CODLEG varchar(4)
,@F4_CRPRERO float
,@F4_TABGIAI varchar(3)
,@F4_TABGIAO varchar(3)
,@F4_ISEFERN varchar(1)
,@F4_STCONF varchar(1)
,@F4_PCREDAC float
,@F4_TRANSIT varchar(1)
,@F4_PR35701 float
,@F4_RGESPCI varchar(1)
,@F4_VLAGREG varchar(1)
,@F4_PAUTICM varchar(1)
,@F4_COMPRED varchar(1)
,@F4_REDBCCE float
,@F4_CODPAG varchar(2)
,@F4_PAGCOM varchar(1)
,@F4_CODLAN varchar(6)
,@F4_FRETISS varchar(1)
,@F4_CSTISS varchar(2)
,@F4_TIPOTES varchar(1)
,@F4_BONIF varchar(1)
,@F4_ALSENAR float
,@F4_PRZESP varchar(1)
,@F4_RGESPST varchar(1)
,@F4_CLFDSUL varchar(1)
,@F4_GRPCST varchar(3)
,@F4_IPMMG varchar(60)
,@F4_IPMSP varchar(60)
,@F4_MOTICMS varchar(2)
,@F4_CALCCPB varchar(1)
,@F4_DIFAL varchar(1)
,@F4_ESCRDPR varchar(1)
,@F4_INOVAUT varchar(1)
,@F4_DESCISS varchar(1)
,@F4_ENQLEG varchar(2)
,@F4_CUSENTR varchar(1)
,@F4_AGREGCP varchar(1)
,@F4_RESSARC varchar(1)
,@F4_VLRZERO varchar(1)
,@F4_INDDET varchar(1)
,@F4_CALCFET varchar(1)
,@F4_TRANCQ varchar(1)
,@F4_TRFICST varchar(1)
,@F4_CSTPIS varchar(2)
,@F4_CSTCOF varchar(2)
,@F4_ART274 varchar(1)
,@F4_AGRISS varchar(1)
,@F4_CRLEIT varchar(1)
,@F4_CFASE varchar(1)
,@F4_CFUNDES varchar(1)
,@F4_CIMAMT varchar(1)
,@F4_FTRICMS float
,@F4_BASCMP float
,@F4_CRPRESP float
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@F4_OPANRE varchar(7)
,@F4_COPSIMP varchar(7)
,@F4_FORINFC varchar(3)
,@F4_ALQFEEF float
,@F4_ALIQPRO float
,@F4_CODINFC varchar(6)
,@F4_CONTERC varchar(1)
,@F4_DEDDIF varchar(1)
,@F4_FCALCPR varchar(1)
,@F4_STREDU varchar(1)
,@F4_COLVDIF varchar(1)
,@F4_DIFALPC varchar(1)
,@F4_INDISEN varchar(1)
,@F4_ZZBLK varchar(1)
,@F4_ZZNFSPC varchar(1)
,@F4_INFITEM varchar(8)
,@F4_CRDICMA varchar(1)
,@F4_EFUTUR varchar(1)
,@F4_FEEF varchar(1)
,@F4_CSENAR varchar(1)
,@F4_CINSS varchar(1)
,@F4_APLREPC varchar(1)
,@F4_BICMCMP varchar(1)
,@F4_FILIAL varchar(2)
,@F4_CODIGO varchar(3)
,@R_E_C_D_E_L_ int



as

UPDATE [dbo].[SF4010]
   SET 
       [F4_TIPO]		= @F4_TIPO		
      ,[F4_ICM]			= @F4_ICM			
      ,[F4_IPI]			= @F4_IPI			
      ,[F4_CREDICM]		= @F4_CREDICM		
      ,[F4_CREDIPI]		= @F4_CREDIPI		
      ,[F4_DUPLIC]		= @F4_DUPLIC		
      ,[F4_ESTOQUE]		= @F4_ESTOQUE		
      ,[F4_CF]			= @F4_CF			
      ,[F4_CFEXT]		= @F4_CFEXT		
      ,[F4_TEXTO]		= @F4_TEXTO		
      ,[F4_BASEICM]		= @F4_BASEICM		
      ,[F4_BASEIPI]		= @F4_BASEIPI		
      ,[F4_PODER3]		= @F4_PODER3		
      ,[F4_LFICM]		= @F4_LFICM		
      ,[F4_LFIPI]		= @F4_LFIPI		
      ,[F4_DESTACA]		= @F4_DESTACA		
      ,[F4_INCIDE]		= @F4_INCIDE		
      ,[F4_COMPL]		= @F4_COMPL		
      ,[F4_IPIFRET]		= @F4_IPIFRET		
      ,[F4_ISS]			= @F4_ISS			
      ,[F4_LFISS]		= @F4_LFISS		
      ,[F4_NRLIVRO]		= @F4_NRLIVRO		
      ,[F4_UPRC]		= @F4_UPRC		
      ,[F4_CONSUMO]		= @F4_CONSUMO		
      ,[F4_FORMULA]		= @F4_FORMULA		
      ,[F4_AGREG]		= @F4_AGREG		
      ,[F4_INCSOL]		= @F4_INCSOL		
      ,[F4_CIAP]		= @F4_CIAP		
      ,[F4_DESPIPI]		= @F4_DESPIPI		
      ,[F4_LIVRO]		= @F4_LIVRO		
      ,[F4_ATUTEC]		= @F4_ATUTEC		
      ,[F4_ATUATF]		= @F4_ATUATF		
      ,[F4_TPIPI]		= @F4_TPIPI		
      ,[F4_STDESC]		= @F4_STDESC		
      ,[F4_BSICMST]		= @F4_BSICMST		
      ,[F4_CREDST]		= @F4_CREDST		
      ,[F4_BASEISS]		= @F4_BASEISS		
      ,[F4_DESPICM]		= @F4_DESPICM		
      ,[F4_SITTRIB]		= @F4_SITTRIB		
      ,[F4_PISCOF]		= @F4_PISCOF		
      ,[F4_PISCRED]		= @F4_PISCRED		
      ,[F4_TESDV]		= @F4_TESDV		
      ,[F4_BASEPIS]		= @F4_BASEPIS		
      ,[F4_BASECOF]		= @F4_BASECOF		
      ,[F4_IPILICM]		= @F4_IPILICM		
      ,[F4_MOVPRJ]		= @F4_MOVPRJ		
      ,[F4_ICMSDIF]		= @F4_ICMSDIF		
      ,[F4_TESP3]		= @F4_TESP3		
      ,[F4_QTDZERO]		= @F4_QTDZERO		
      ,[F4_SLDNPT]		= @F4_SLDNPT		
      ,[F4_DEVZERO]		= @F4_DEVZERO		
      ,[F4_TIPOPER]		= @F4_TIPOPER		
      ,[F4_MSBLQL]		= @F4_MSBLQL		
      ,[F4_TRFICM]		= @F4_TRFICM		
      ,[F4_TESENV]		= @F4_TESENV		
      ,[F4_OBSICM]		= @F4_OBSICM		
      ,[F4_OBSSOL]		= @F4_OBSSOL		
      ,[F4_PICMDIF]		= @F4_PICMDIF		
      ,[F4_SELO]		= @F4_SELO		
      ,[F4_ISSST]		= @F4_ISSST		
      ,[F4_FINALID]		= @F4_FINALID		
      ,[F4_PISFISC]		= @F4_PISFISC		
      ,[F4_CONTSOC]		= @F4_CONTSOC		
      ,[F4_COP]			= @F4_COP			
      ,[F4_INDNTFR]		= @F4_INDNTFR		
      ,[F4_CODBCC]		= @F4_CODBCC		
      ,[F4_CPPRODE]		= @F4_CPPRODE		
      ,[F4_AJUSTE]		= @F4_AJUSTE		
      ,[F4_TPPRODE]		= @F4_TPPRODE		
      ,[F4_CPRECTR]		= @F4_CPRECTR		
      ,[F4_IPIANT]		= @F4_IPIANT		
      ,[F4_TPCPRES]		= @F4_TPCPRES		
      ,[F4_DESPCOF]		= @F4_DESPCOF		
      ,[F4_DSPRDIC]		= @F4_DSPRDIC		
      ,[F4_REGDSTA]		= @F4_REGDSTA		
      ,[F4_OPEMOV]		= @F4_OPEMOV		
      ,[F4_TPREG]		= @F4_TPREG		
      ,[F4_AFRMM]		= @F4_AFRMM		
      ,[F4_BENSATF]		= @F4_BENSATF		
      ,[F4_ICMSST]		= @F4_ICMSST		
      ,[F4_FRETAUT]		= @F4_FRETAUT		
      ,[F4_MKPCMP]		= @F4_MKPCMP		
      ,[F4_AGRRETC]		= @F4_AGRRETC		
      ,[F4_CRDEST]		= @F4_CRDEST		
      ,[F4_RETISS]		= @F4_RETISS		
      ,[F4_CRPRST]		= @F4_CRPRST		
      ,[F4_CTIPI]		= @F4_CTIPI		
      ,[F4_TRANFIL]		= @F4_TRANFIL		
      ,[F4_CRPRELE]		= @F4_CRPRELE		
      ,[F4_BCRDCOF]		= @F4_BCRDCOF		
      ,[F4_AGRCOF]		= @F4_AGRCOF		
      ,[F4_LFICMST]		= @F4_LFICMST		
      ,[F4_PISBRUT]		= @F4_PISBRUT		
      ,[F4_COFDSZF]		= @F4_COFDSZF		
      ,[F4_BCRDPIS]		= @F4_BCRDPIS		
      ,[F4_COFBRUT]		= @F4_COFBRUT		
      ,[F4_DESPPIS]		= @F4_DESPPIS		
      ,[F4_AGRPIS]		= @F4_AGRPIS		
      ,[F4_PISDSZF]		= @F4_PISDSZF		
      ,[F4_CRDPRES]		= @F4_CRDPRES		
      ,[F4_IPIPC]		= @F4_IPIPC		
      ,[F4_ALICRST]		= @F4_ALICRST		
      ,[F4_TRIBPRD]		= @F4_TRIBPRD		
      ,[F4_IPIPECR]		= @F4_IPIPECR		
      ,[F4_TXAPIPI]		= @F4_TXAPIPI		
      ,[F4_TESE3]		= @F4_TESE3		
      ,[F4_CFPS]		= @F4_CFPS		
      ,[F4_IPIOBS]		= @F4_IPIOBS		
      ,[F4_VARATAC]		= @F4_VARATAC		
      ,[F4_IVAUTIL]		= @F4_IVAUTIL		
      ,[F4_CFACS]		= @F4_CFACS		
      ,[F4_CFABOV]		= @F4_CFABOV		
      ,[F4_CPRESPR]		= @F4_CPRESPR		
      ,[F4_VDASOFT]		= @F4_VDASOFT		
      ,[F4_VENPRES]		= @F4_VENPRES		
      ,[F4_MOVFIS]		= @F4_MOVFIS		
      ,[F4_AGRDRED]		= @F4_AGRDRED		
      ,[F4_APLIIVA]		= @F4_APLIIVA		
      ,[F4_APLREDP]		= @F4_APLREDP		
      ,[F4_OPERSUC]		= @F4_OPERSUC		
      ,[F4_TEMDOCS]		= @F4_TEMDOCS		
      ,[F4_ESTCRED]		= @F4_ESTCRED		
      ,[F4_ATACVAR]		= @F4_ATACVAR		
      ,[F4_CRICMST]		= @F4_CRICMST		
      ,[F4_CODOBSE]		= @F4_CODOBSE		
      ,[F4_BSRURAL]		= @F4_BSRURAL		
      ,[F4_CREDACU]		= @F4_CREDACU		
      ,[F4_BENDUB]		= @F4_BENDUB		
      ,[F4_CRPRSIM]		= @F4_CRPRSIM		
      ,[F4_REDANT]		= @F4_REDANT		
      ,[F4_DESCOND]		= @F4_DESCOND		
      ,[F4_NATOPER]		= @F4_NATOPER		
      ,[F4_RECDAC]		= @F4_RECDAC		
      ,[F4_ISEFEMT]		= @F4_ISEFEMT		
      ,[F4_TABGIAC]		= @F4_TABGIAC		
      ,[F4_CTBHISS]		= @F4_CTBHISS		
      ,[F4_CSBHISS]		= @F4_CSBHISS		
      ,[F4_TNATREC]		= @F4_TNATREC		
      ,[F4_CNATREC]		= @F4_CNATREC		
      ,[F4_GRPNATR]		= @F4_GRPNATR		
      ,[F4_DTFIMNT]		= @F4_DTFIMNT		
      ,[F4_CREDPRE]		= @F4_CREDPRE		
      ,[F4_CONSIND]		= @F4_CONSIND		
      ,[F4_ANTICMS]		= @F4_ANTICMS		
      ,[F4_NUMDUB]		= @F4_NUMDUB		
      ,[F4_CODDET]		= @F4_CODDET		
      ,[F4_ISEFECP]		= @F4_ISEFECP		
      ,[F4_PARTICM]		= @F4_PARTICM		
      ,[F4_COMPONE]		= @F4_COMPONE		
      ,[F4_PSCFST]		= @F4_PSCFST		
      ,[F4_APLIRED]		= @F4_APLIRED		
      ,[F4_ICMSTMT]		= @F4_ICMSTMT		
      ,[F4_PERCATM]		= @F4_PERCATM		
      ,[F4_CRDACUM]		= @F4_CRDACUM		
      ,[F4_PERCMED]		= @F4_PERCMED		
      ,[F4_BSICMRE]		= @F4_BSICMRE		
      ,[F4_STLIQ]		= @F4_STLIQ		
      ,[F4_CV139]		= @F4_CV139		
      ,[F4_RFETALG]		= @F4_RFETALG		
      ,[F4_FTATUSC]		= @F4_FTATUSC		
      ,[F4_MALQPIS]		= @F4_MALQPIS		
      ,[F4_TIPODUB]		= @F4_TIPODUB		
      ,[F4_OPERGAR]		= @F4_OPERGAR		
      ,[F4_DESTRUI]		= @F4_DESTRUI		
      ,[F4_DEVPARC]		= @F4_DEVPARC		
      ,[F4_IMPIND]		= @F4_IMPIND		
      ,[F4_DICMFUN]		= @F4_DICMFUN		
      ,[F4_IDHIST]		= @F4_IDHIST		
      ,[F4_BSRDICM]		= @F4_BSRDICM		
      ,[F4_MALQCOF]		= @F4_MALQCOF		
      ,[F4_NORESP]		= @F4_NORESP		
      ,[F4_CIAPTRB]		= @F4_CIAPTRB		
      ,[F4_CFAMAD]		= @F4_CFAMAD		
      ,[F4_COFMIN]		= @F4_COFMIN		
      ,[F4_CROUTSP]		= @F4_CROUTSP		
      ,[F4_RDBSICM]		= @F4_RDBSICM		
      ,[F4_IPIVFCF]		= @F4_IPIVFCF		
      ,[F4_TRAFILI]		= @F4_TRAFILI		
      ,[F4_TREGDMA]		= @F4_TREGDMA		
      ,[F4_IPIMIN]		= @F4_IPIMIN		
      ,[F4_PISMIN]		= @F4_PISMIN		
      ,[F4_TPOP]		= @F4_TPOP		
      ,[F4_APSCFST]		= @F4_APSCFST		
      ,[F4_CRDTRAN]		= @F4_CRDTRAN		
      ,[F4_CSOSN]		= @F4_CSOSN		
      ,[F4_NATOPNF]		= @F4_NATOPNF		
      ,[F4_OUTPERC]		= @F4_OUTPERC		
      ,[F4_CSTCF1]		= @F4_CSTCF1		
      ,[F4_CSTPF1]		= @F4_CSTPF1		
      ,[F4_EFDF100]		= @F4_EFDF100		
      ,[F4_DUPLIPI]		= @F4_DUPLIPI		
      ,[F4_REGESP]		= @F4_REGESP		
      ,[F4_AGRPEDG]		= @F4_AGRPEDG		
      ,[F4_INDVF]		= @F4_INDVF		
      ,[F4_MKPSOL]		= @F4_MKPSOL		
      ,[F4_CROUTGO]		= @F4_CROUTGO		
      ,[F4_REFATAN]		= @F4_REFATAN		
      ,[F4_DBSTCSL]		= @F4_DBSTCSL		
      ,[F4_DBSTIRR]		= @F4_DBSTIRR		
      ,[F4_INTBSIC]		= @F4_INTBSIC		
      ,[F4_CRICMS]		= @F4_CRICMS		
      ,[F4_CRPREPR]		= @F4_CRPREPR		
      ,[F4_SOMAIPI]		= @F4_SOMAIPI		
      ,[F4_ISEFEMG]		= @F4_ISEFEMG		
      ,[F4_MTRTBH]		= @F4_MTRTBH		
      ,[F4_TPRSPL]		= @F4_TPRSPL		
      ,[F4_MSGLT]		= @F4_MSGLT		
      ,[F4_CRPREPE]		= @F4_CRPREPE		
      ,[F4_DUPLIST]		= @F4_DUPLIST		
      ,[F4_BCPCST]		= @F4_BCPCST		
      ,[F4_CODLEG]		= @F4_CODLEG		
      ,[F4_CRPRERO]		= @F4_CRPRERO		
      ,[F4_TABGIAI]		= @F4_TABGIAI		
      ,[F4_TABGIAO]		= @F4_TABGIAO		
      ,[F4_ISEFERN]		= @F4_ISEFERN		
      ,[F4_STCONF]		= @F4_STCONF		
      ,[F4_PCREDAC]		= @F4_PCREDAC		
      ,[F4_TRANSIT]		= @F4_TRANSIT		
      ,[F4_PR35701]		= @F4_PR35701		
      ,[F4_RGESPCI]		= @F4_RGESPCI		
      ,[F4_VLAGREG]		= @F4_VLAGREG		
      ,[F4_PAUTICM]		= @F4_PAUTICM		
      ,[F4_COMPRED]		= @F4_COMPRED		
      ,[F4_REDBCCE]		= @F4_REDBCCE		
      ,[F4_CODPAG]		= @F4_CODPAG		
      ,[F4_PAGCOM]		= @F4_PAGCOM		
      ,[F4_CODLAN]		= @F4_CODLAN		
      ,[F4_FRETISS]		= @F4_FRETISS		
      ,[F4_CSTISS]		= @F4_CSTISS		
      ,[F4_TIPOTES]		= @F4_TIPOTES		
      ,[F4_BONIF]		= @F4_BONIF		
      ,[F4_ALSENAR]		= @F4_ALSENAR		
      ,[F4_PRZESP]		= @F4_PRZESP		
      ,[F4_RGESPST]		= @F4_RGESPST		
      ,[F4_CLFDSUL]		= @F4_CLFDSUL		
      ,[F4_GRPCST]		= @F4_GRPCST		
      ,[F4_IPMMG]		= @F4_IPMMG		
      ,[F4_IPMSP]		= @F4_IPMSP		
      ,[F4_MOTICMS]		= @F4_MOTICMS		
      ,[F4_CALCCPB]		= @F4_CALCCPB		
      ,[F4_DIFAL]		= @F4_DIFAL		
      ,[F4_ESCRDPR]		= @F4_ESCRDPR		
      ,[F4_INOVAUT]		= @F4_INOVAUT		
      ,[F4_DESCISS]		= @F4_DESCISS		
      ,[F4_ENQLEG]		= @F4_ENQLEG		
      ,[F4_CUSENTR]		= @F4_CUSENTR		
      ,[F4_AGREGCP]		= @F4_AGREGCP		
      ,[F4_RESSARC]		= @F4_RESSARC		
      ,[F4_VLRZERO]		= @F4_VLRZERO		
      ,[F4_INDDET]		= @F4_INDDET		
      ,[F4_CALCFET]		= @F4_CALCFET		
      ,[F4_TRANCQ]		= @F4_TRANCQ		
      ,[F4_TRFICST]		= @F4_TRFICST		
      ,[F4_CSTPIS]		= @F4_CSTPIS		
      ,[F4_CSTCOF]		= @F4_CSTCOF		
      ,[F4_ART274]		= @F4_ART274		
      ,[F4_AGRISS]		= @F4_AGRISS		
      ,[F4_CRLEIT]		= @F4_CRLEIT		
      ,[F4_CFASE]		= @F4_CFASE		
      ,[F4_CFUNDES]		= @F4_CFUNDES		
      ,[F4_CIMAMT]		= @F4_CIMAMT		
      ,[F4_FTRICMS]		= @F4_FTRICMS		
      ,[F4_BASCMP]		= @F4_BASCMP		
      ,[F4_CRPRESP]		= @F4_CRPRESP		
      ,[D_E_L_E_T_]		= @D_E_L_E_T_		
      --,[R_E_C_N_O_]		= @R_E_C_N_O_		
      ,[F4_OPANRE]		= @F4_OPANRE		
      ,[F4_COPSIMP]		= @F4_COPSIMP		
      ,[F4_FORINFC]		= @F4_FORINFC		
      ,[F4_ALQFEEF]		= @F4_ALQFEEF		
      ,[F4_ALIQPRO]		= @F4_ALIQPRO		
      ,[F4_CODINFC]		= @F4_CODINFC		
      ,[F4_CONTERC]		= @F4_CONTERC		
      ,[F4_DEDDIF]		= @F4_DEDDIF		
      ,[F4_FCALCPR]		= @F4_FCALCPR		
      ,[F4_STREDU]		= @F4_STREDU		
      ,[F4_COLVDIF]		= @F4_COLVDIF		
      ,[F4_DIFALPC]		= @F4_DIFALPC		
      ,[F4_INDISEN]		= @F4_INDISEN		
      ,[F4_ZZBLK]		= @F4_ZZBLK		
      ,[F4_ZZNFSPC]		= @F4_ZZNFSPC		
      ,[F4_INFITEM]		= @F4_INFITEM		
      ,[F4_CRDICMA]		= @F4_CRDICMA		
      ,[F4_EFUTUR]		= @F4_EFUTUR		
      ,[F4_FEEF]		= @F4_FEEF		
      ,[F4_CSENAR]		= @F4_CSENAR		
      ,[F4_CINSS]		= @F4_CINSS		
      ,[F4_APLREPC]		= @F4_APLREPC		
      ,[F4_BICMCMP]		= @F4_BICMCMP		
      ,[dt_alteracao]	= getdate()
	  ,F4_FILIAL		= @F4_FILIAL
	  ,F4_CODIGO		= @F4_CODIGO
	  ,R_E_C_D_E_L_     = @R_E_C_D_E_L_
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSRA010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE proc [dbo].[sp_alteraRegistroSRA010]

@sk_destino int
,@RA_NOME varchar(30)
,@RA_CC varchar(9)
,@RA_ADMISSA varchar(8)
,@RA_CARGO varchar(5)
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@RA_FILIAL varchar(2)
,@RA_MAT  varchar(6)
,@R_E_C_D_E_L_ int 
as


UPDATE [dbo].[SRA010]
   SET 
       [RA_NOME]		= @RA_NOME	
      ,[RA_CC]			= @RA_CC	
      ,[RA_ADMISSA]		= @RA_ADMISSA
      ,[RA_CARGO]		= @RA_CARGO
      ,[D_E_L_E_T_]		= @D_E_L_E_T_
      --,[R_E_C_N_O_]		= R_E_C_N_O_
      ,[dt_alteracao]	= getdate()
	  ,RA_FILIAL        = @RA_FILIAL
	  ,RA_MAT			= @RA_MAT
	  ,R_E_C_D_E_L_		= @R_E_C_D_E_L_
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSRA010_v2]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE proc [dbo].[sp_alteraRegistroSRA010_v2]

@sk_destino int
,@RA_NOME varchar(30)
,@RA_CC varchar(9)
,@RA_ADMISSA varchar(8)
,@RA_CARGO varchar(5)
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@RA_FILIAL varchar(2)
,@RA_MAT  varchar(6)
,@R_E_C_D_E_L_ int 


,@RA_BITMAP		varchar(20)	
,@RA_NOMECMP	varchar(70)	
,@RA_MAE		varchar(40)	
,@RA_PAI		varchar(40)	
,@RA_SEXO		varchar(1)	
,@RA_NSOCIAL	varchar(70)	
,@RA_HOJORVA	varchar(1)	
,@RA_RACACOR	varchar(1)	
,@RA_NASC		varchar(8)	
,@RA_ALTNASC	varchar(1)	
,@RA_ESTCIVI	varchar(1)	
,@RA_CPAISOR	varchar(5)	
,@RA_NACIONA	varchar(2)	
,@RA_NACIONC	varchar(5)	
,@RA_BRNASEX	varchar(1)	
,@RA_NATURAL	varchar(2)	
,@RA_CODMUNN	varchar(5)	
,@RA_MUNNASC	varchar(30)	
,@RA_APELIDO	varchar(15)	
,@RA_GRINRAI	varchar(2)	
,@RA_EMAIL		varchar(50)	
,@RA_EMAIL2		varchar(60)	
,@RA_RECMAIL	varchar(1)	
,@RA_TPMAIL		varchar(1)	
,@RA_DEFIFIS	varchar(1)	
,@RA_BRPDH		varchar(1)	
,@RA_TPDEFFI	varchar(1)	
,@RA_PORTDEF	varchar(6)	
,@RA_OBSDEFI	image		
,@RA_CLVL		varchar(9)	
,@RA_ITEM		varchar(9)	
,@RA_ALTADM		varchar(1)	
,@RA_DEPIR		varchar(2)	
,@RA_TIPOADM	varchar(2)	
,@RA_DEPSF		varchar(2)	
,@RA_DEMISSA	varchar(8)	
,@RA_OPCAO		varchar(8)	
,@RA_ALTOPC		varchar(1)	
,@RA_BCDPFGT	varchar(8)	
,@RA_CTDPFGT	varchar(12)	
,@RA_CHAPA		varchar(5)	
,@RA_PERFGTS	float		
,@RA_LOCBNF		varchar(4)	
,@RA_TNOTRAB	varchar(3)	
,@RA_BCDEPSA	varchar(8)	
,@RA_TPCTSAL	varchar(1)	
,@RA_CTDEPSA	varchar(12)	
,@RA_TPPREVI	varchar(1)	
,@RA_SITFOLH	varchar(1)	
,@RA_PROCES		varchar(5)	
,@RA_HRSMES		float		
,@RA_HRSEMAN	float		
,@RA_CATFUNC	varchar(1)	
,@RA_HRSDIA		float		
,@RA_CODFUNC	varchar(5)	
,@RA_SALARIO	float		
,@RA_ANTEAUM	float		
,@RA_PGCTSIN	varchar(1)	
,@RA_ADCPERI	varchar(1)	
,@RA_CESTAB		varchar(1)	
,@RA_TPCONTR	varchar(1)	
,@RA_DTFIMCT	varchar(8)	
,@RA_VALEREF	varchar(3)	
,@RA_VALEALI	varchar(3)	
,@RA_HOPARC		varchar(1)	
,@RA_SEGUROV	varchar(2)	
,@RA_CLAURES	varchar(1)	
,@RA_PERCADT	float		
,@RA_PENSALI	float		
,@RA_SINDICA	varchar(2)	
,@RA_CBO		varchar(5)	
,@RA_ALTCBO		varchar(1)	
,@RA_TIPOPGT	varchar(1)	
,@RA_VIEMRAI	varchar(2)	
,@RA_CATEG		varchar(2)	
,@RA_CATEFD		varchar(3)	
,@RA_PERICUL	float		
,@RA_VCTOEXP	varchar(8)	
,@RA_INSMIN		float		
,@RA_VCTEXP2	varchar(8)	
,@RA_INSMED		float		
,@RA_EXAMEDI	varchar(8)	
,@RA_DTVTEST	varchar(8)	
,@RA_ADCINS		varchar(1)	
,@RA_AFASFGT	varchar(2)	
,@RA_ASSIST		varchar(1)	
,@RA_CONFED		varchar(1)	
,@RA_MENSIND	varchar(1)	
,@RA_RESCRAI	varchar(2)	
,@RA_MESESAN	float		
,@RA_FTINSAL	float		
,@RA_MESTRAB	varchar(2)	
,@RA_CLASSEC	varchar(2)	
,@RA_OCORREN	varchar(2)	
,@RA_PERCSAT	float		
,@RA_CODTIT		varchar(2)	
,@RA_POSTO		varchar(9)	
,@RA_DEPTO		varchar(9)	
,@RA_ALTNOME	varchar(1)	
,@RA_CODRET		varchar(4)	
,@RA_FECREI		varchar(8)	
,@RA_CRACHA		varchar(10)	
,@RA_DEMIANT	varchar(8)	
,@RA_REGRA		varchar(2)	
,@RA_MOLEST		varchar(8)	
,@RA_COMPSAB	varchar(1)	
,@RA_EAPOSEN	varchar(1)	
,@RA_NJUD14		varchar(20)	
,@RA_TPREINT	varchar(1)	
,@RA_SEQTURN	varchar(2)	
,@RA_NRPROC		varchar(20)	
,@RA_SENHA		varchar(6)	
,@RA_NRLEIAN	varchar(14)	
,@RA_DTEFRET	varchar(8)	
,@RA_DTEFRTN	varchar(8)	
,@RA_CIC		varchar(11)	
,@RA_NIVEL		varchar(2)	
,@RA_PIS		varchar(12)	
,@RA_TPRCBT		varchar(1)	
,@RA_ALTPIS		varchar(1)	
,@RA_TCFMSG		varchar(6)	
,@RA_RG			varchar(15)	
,@RA_INSSSC		varchar(1)	
,@RA_DTRGEXP	varchar(8)	
,@RA_RGUF		varchar(2)	
,@RA_RGORG		varchar(3)	
,@RA_RGEXP		varchar(6)	
,@RA_DISTSN		varchar(1)	
,@RA_ORGEMRG	varchar(5)	
,@RA_COMPLRG	varchar(20)	
,@RA_NUMCP		varchar(7)	
,@RA_BHFOL		varchar(1)	
,@RA_SERCP		varchar(5)	
,@RA_UFCP		varchar(2)	
,@RA_ACUMBH		varchar(1)	
,@RA_OKTRANS	varchar(2)	
,@RA_DTCPEXP	varchar(8)	
,@RA_ALTCP		varchar(1)	
,@RA_TABELA		varchar(3)	
,@RA_TABNIVE	varchar(2)	
,@RA_HABILIT	varchar(11)	
,@RA_TABFAIX	varchar(2)	
,@RA_CNHORG		varchar(20)	
,@RA_DTEMCNH	varchar(8)	
,@RA_DTVCCNH	varchar(8)	
,@RA_RECPFNC	varchar(1)	
,@RA_CATCNH		varchar(1)	
,@RA_UFCNH		varchar(2)	
,@RA_TIPENDE	varchar(1)	
,@RA_RESERVI	varchar(12)	
,@RA_TITULOE	varchar(12)	
,@RA_RESEXT		varchar(1)	
,@RA_PAISEXT	varchar(5)	
,@RA_ZONASEC	varchar(8)	
,@RA_SECAO		varchar(4)	
,@RA_LOGRTP		varchar(4)	
,@RA_REGISTR	varchar(6)	
,@RA_FICHA		varchar(8)	
,@RA_LOGRDSC	varchar(80)	
,@RA_SERVENT	varchar(6)	
,@RA_CODACER	varchar(2)	
,@RA_LOGRNUM	varchar(10)	
,@RA_REGCIVI	varchar(2)	
,@RA_ENDEREC	varchar(30)	
,@RA_TPLIVRO	varchar(1)	
,@RA_CLASEST	varchar(2)	
,@RA_NUMENDE	varchar(6)	
,@RA_MSBLQL		varchar(1)	
,@RA_TIPCERT	varchar(1)	
,@RA_COMPLEM	varchar(15)	
,@RA_EMICERT	varchar(8)	
,@RA_BAIRRO		varchar(15)	
,@RA_MATCERT	varchar(32)	
,@RA_ESTADO		varchar(2)	
,@RA_LIVCERT	varchar(8)	
,@RA_CODMUN		varchar(5)	
,@RA_FOLCERT	varchar(4)	
,@RA_CARCERT	varchar(30)	
,@RA_MUNICIP	varchar(20)	
,@RA_UFCERT		varchar(2)	
,@RA_CEP		varchar(8)	
,@RA_CPOSTAL	varchar(9)	
,@RA_CDMUCER	varchar(5)	
,@RA_CEPCXPO	varchar(8)	
,@RA_NUMEPAS	varchar(15)	
,@RA_ALTEND		varchar(1)	
,@RA_EMISPAS	varchar(15)	
,@RA_DDDFONE	varchar(2)	
,@RA_TIPAMED	varchar(1)	
,@RA_UFPAS		varchar(2)	
,@RA_ASMEDIC	varchar(2)	
,@RA_TELEFON	varchar(20)	
,@RA_DDDCELU	varchar(2)	
,@RA_DEMIPAS	varchar(8)	
,@RA_DPASSME	varchar(2)	
,@RA_DVALPAS	varchar(8)	
,@RA_NUMCELU	varchar(10)	
,@RA_TPASODO	varchar(1)	
,@RA_ASODONT	varchar(2)	
,@RA_CHIDENT	varchar(25)	
,@RA_CODPAIS	varchar(5)	
,@RA_NUMRIC		varchar(12)	
,@RA_EMISRIC	varchar(10)	
,@RA_UFRIC		varchar(2)	
,@RA_CDMURIC	varchar(5)	
,@RA_NUMINSC	varchar(11)	
,@RA_SERVICO	varchar(60)	
,@RA_DEXPRIC	varchar(8)	
,@RA_CODIGO		varchar(14)	
,@RA_OCEMIS		varchar(20)	
,@RA_OCDTEXP	varchar(8)	
,@RA_OCDTVAL	varchar(8)	
,@RA_CODUNIC	varchar(30)	
,@RA_PRCFCH		varchar(5)	
,@RA_PERFCH		varchar(6)	
,@RA_ROTFCH		varchar(3)	
,@RA_NUPFCH		varchar(2)	
,@RA_RNE		varchar(14)	
,@RA_RNEORG		varchar(20)	
,@RA_RNEDEXP	varchar(8)	
,@RA_DATCHEG	varchar(8)	
,@RA_ANOCHEG	varchar(2)	
,@RA_NUMNATU	varchar(10)	
,@RA_DATNATU	varchar(8)	
,@RA_CASADBR	varchar(1)	
,@RA_FILHOBR	varchar(1)	
,@RA_INSSAUT	varchar(1)	
,@RA_REGIME		varchar(1)	
,@RA_FWIDM		varchar(34)	
,@RA_INSMAX		float		
,@RA_ADCCONF	float		
,@RA_ADCTRF		float		
,@RA_PLSAUDE	varchar(1)	
,@RA_RHEXP		varchar(6)	
,@RA_ADTPOSE	varchar(6)	
,@RA_TPJORNA	varchar(1)	
,@RA_FITIPEN	varchar(2)	
,@RA_MATIPEN	varchar(6)	
,@RA_TIPOPEN	varchar(1)	
,@RA_APOSENT	varchar(8)	
,@RA_SUBCARR	float		
,@RA_DTNOMEA	varchar(8)	
,@RA_DEFETIV	varchar(8)	
,@RA_CODCON		varchar(4)	
,@RA_ADICEDI	varchar(1)	
,@RA_JORNRED	float		
,@RA_TPSBCOM	varchar(1)	
,@RA_DTHREST	varchar(8)	
,@RA_TPCUEST	varchar(1)	
,@RA_ANOSEME	float		
,@RA_PERESTU	varchar(1)	
,@RA_DTCAGED	varchar(8)	
,@RA_CTRLEMA	float		
,@RA_MATMIG		varchar(20)	
,@RA_AUTMEI		varchar(1)	
,@RA_ZMAT01		varchar(12)	
,@RA_ZMAT02		varchar(12)	
,@RA_ZSCEALT	varchar(8)	
,@RA_USRADM		varchar(6)	
,@RA_CONFID		varchar(1)	
,@RA_HABILMT	varchar(1)	
,@RA_CTPCD		varchar(1)	
,@RA_ZPAREN		varchar(1)	
,@RA_ZGRAU		varchar(1)	
,@RA_ZFORM		varchar(100)
,@RA_ZEXSDX		varchar(1)	
,@RA_ZEVSDX1	float		
,@RA_ZEVSDX2	float		
,@RA_ZALOSDX	varchar(1)	
,@RA_ZEALSDX	varchar(1)	
,@RA_ZVALSDX	float		
,@RA_ZTPCAL		varchar(1)	
,@RA_ZSEGVD		varchar(1)	
,@RA_DESEPS		varchar(254)
,@RA_DTINCON	varchar(8)	
,@RA_USERLGI	varchar(17)	
,@RA_USERLGA	varchar(17)	
,@RA_PLAPRE		varchar(14)	
,@RA_TIPCTA		varchar(1)	
,@RA_KEYLOC		varchar(4)	
,@RA_BLOQADM	varchar(1)	
,@RA_ZZVAGA		varchar(6)	
,@RA_ZZIDFLU	float		
,@RA_TIPOCON	varchar(1)	
,@RA_ZDIRIMG	varchar(1)	
,@RA_ZZGED		varchar(20)	
,@RA_ZZRVAL		varchar(1)	
,@RA_ZZPP		varchar(1)	
,@RA_DESCEP		varchar(1)	
,@RA_TIPOVIA	varchar(1)	
,@RA_ZZPONTO	varchar(2)	
,@RA_DTENTRA	varchar(8)	
,@RA_TIPINF		varchar(1)	
,@RA_DTREC		varchar(8)	
,@S_T_A_M_P_	datetime	
,@I_N_S_D_T_	datetime	
,@RA_TSTCNB		varchar(1)	
,@RA_ZZGRPV		varchar(100)
as


UPDATE [dbo].[SRA010]
   SET 
       [RA_NOME]		= @RA_NOME	
      ,[RA_CC]			= @RA_CC	
      ,[RA_ADMISSA]		= @RA_ADMISSA
      ,[RA_CARGO]		= @RA_CARGO
      ,[D_E_L_E_T_]		= @D_E_L_E_T_
      --,[R_E_C_N_O_]		= R_E_C_N_O_
      ,[dt_alteracao]	= getdate()
	  ,RA_FILIAL        = @RA_FILIAL
	  ,RA_MAT			= @RA_MAT
	  ,R_E_C_D_E_L_		= @R_E_C_D_E_L_


	  ,[RA_BITMAP]	= @RA_BITMAP		
	  ,[RA_NOMECMP]	= @RA_NOMECMP	
	  ,[RA_MAE]		= @RA_MAE		
	  ,[RA_PAI]		= @RA_PAI		
	  ,[RA_SEXO]	= @RA_SEXO		
	  ,[RA_NSOCIAL]	= @RA_NSOCIAL	
	  ,[RA_HOJORVA]	= @RA_HOJORVA	
	  ,[RA_RACACOR]	= @RA_RACACOR	
	  ,[RA_NASC]	= @RA_NASC		
	  ,[RA_ALTNASC]	= @RA_ALTNASC	
	  ,[RA_ESTCIVI]	= @RA_ESTCIVI	
	  ,[RA_CPAISOR]	= @RA_CPAISOR	
	  ,[RA_NACIONA]	= @RA_NACIONA	
	  ,[RA_NACIONC]	= @RA_NACIONC	
	  ,[RA_BRNASEX]	= @RA_BRNASEX	
	  ,[RA_NATURAL]	= @RA_NATURAL	
	  ,[RA_CODMUNN]	= @RA_CODMUNN	
	  ,[RA_MUNNASC]	= @RA_MUNNASC	
	  ,[RA_APELIDO]	= @RA_APELIDO	
	  ,[RA_GRINRAI]	= @RA_GRINRAI	
	  ,[RA_EMAIL]	= @RA_EMAIL		
	  ,[RA_EMAIL2]	= @RA_EMAIL2		
	  ,[RA_RECMAIL]	= @RA_RECMAIL	
	  ,[RA_TPMAIL]	= @RA_TPMAIL		
	  ,[RA_DEFIFIS]	= @RA_DEFIFIS	
	  ,[RA_BRPDH]	= @RA_BRPDH		
	  ,[RA_TPDEFFI]	= @RA_TPDEFFI	
	  ,[RA_PORTDEF]	= @RA_PORTDEF	
	  ,[RA_OBSDEFI]	= @RA_OBSDEFI	
	  ,[RA_CLVL]	= @RA_CLVL		
	  ,[RA_ITEM]	= @RA_ITEM		
	  ,[RA_ALTADM]	= @RA_ALTADM		
	  ,[RA_DEPIR]	= @RA_DEPIR		
	  ,[RA_TIPOADM]	= @RA_TIPOADM	
	  ,[RA_DEPSF]	= @RA_DEPSF		
	  ,[RA_DEMISSA]	= @RA_DEMISSA	
	  ,[RA_OPCAO]	= @RA_OPCAO		
	  ,[RA_ALTOPC]	= @RA_ALTOPC		
	  ,[RA_BCDPFGT]	= @RA_BCDPFGT	
	  ,[RA_CTDPFGT]	= @RA_CTDPFGT	
	  ,[RA_CHAPA]	= @RA_CHAPA		
	  ,[RA_PERFGTS]	= @RA_PERFGTS	
	  ,[RA_LOCBNF]	= @RA_LOCBNF		
	  ,[RA_TNOTRAB]	= @RA_TNOTRAB	
	  ,[RA_BCDEPSA]	= @RA_BCDEPSA	
	  ,[RA_TPCTSAL]	= @RA_TPCTSAL	
	  ,[RA_CTDEPSA]	= @RA_CTDEPSA	
	  ,[RA_TPPREVI]	= @RA_TPPREVI	
	  ,[RA_SITFOLH]	= @RA_SITFOLH	
	  ,[RA_PROCES]	= @RA_PROCES		
	  ,[RA_HRSMES]	= @RA_HRSMES		
	  ,[RA_HRSEMAN]	= @RA_HRSEMAN	
	  ,[RA_CATFUNC]	= @RA_CATFUNC	
	  ,[RA_HRSDIA]	= @RA_HRSDIA		
	  ,[RA_CODFUNC]	= @RA_CODFUNC	
	  ,[RA_SALARIO]	= @RA_SALARIO	
	  ,[RA_ANTEAUM]	= @RA_ANTEAUM	
	  ,[RA_PGCTSIN]	= @RA_PGCTSIN	
	  ,[RA_ADCPERI]	= @RA_ADCPERI	
	  ,[RA_CESTAB]	= @RA_CESTAB		
	  ,[RA_TPCONTR]	= @RA_TPCONTR	
	  ,[RA_DTFIMCT]	= @RA_DTFIMCT	
	  ,[RA_VALEREF]	= @RA_VALEREF	
	  ,[RA_VALEALI]	= @RA_VALEALI	
	  ,[RA_HOPARC]	= @RA_HOPARC		
	  ,[RA_SEGUROV]	= @RA_SEGUROV	
	  ,[RA_CLAURES]	= @RA_CLAURES	
	  ,[RA_PERCADT]	= @RA_PERCADT	
	  ,[RA_PENSALI]	= @RA_PENSALI	
	  ,[RA_SINDICA]	= @RA_SINDICA	
	  ,[RA_CBO]		= @RA_CBO		
	  ,[RA_ALTCBO]	= @RA_ALTCBO		
	  ,[RA_TIPOPGT]	= @RA_TIPOPGT	
	  ,[RA_VIEMRAI]	= @RA_VIEMRAI	
	  ,[RA_CATEG]	= @RA_CATEG		
	  ,[RA_CATEFD]	= @RA_CATEFD		
	  ,[RA_PERICUL]	= @RA_PERICUL	
	  ,[RA_VCTOEXP]	= @RA_VCTOEXP	
	  ,[RA_INSMIN]	= @RA_INSMIN		
	  ,[RA_VCTEXP2]	= @RA_VCTEXP2	
	  ,[RA_INSMED]	= @RA_INSMED		
	  ,[RA_EXAMEDI]	= @RA_EXAMEDI	
	  ,[RA_DTVTEST]	= @RA_DTVTEST	
	  ,[RA_ADCINS]	= @RA_ADCINS		
	  ,[RA_AFASFGT]	= @RA_AFASFGT	
	  ,[RA_ASSIST]	= @RA_ASSIST		
	  ,[RA_CONFED]	= @RA_CONFED		
	  ,[RA_MENSIND]	= @RA_MENSIND	
	  ,[RA_RESCRAI]	= @RA_RESCRAI	
	  ,[RA_MESESAN]	= @RA_MESESAN	
	  ,[RA_FTINSAL]	= @RA_FTINSAL	
	  ,[RA_MESTRAB]	= @RA_MESTRAB	
	  ,[RA_CLASSEC]	= @RA_CLASSEC	
	  ,[RA_OCORREN]	= @RA_OCORREN	
	  ,[RA_PERCSAT]	= @RA_PERCSAT	
	  ,[RA_CODTIT]	= @RA_CODTIT		
	  ,[RA_POSTO]	= @RA_POSTO		
	  ,[RA_DEPTO]	= @RA_DEPTO		
	  ,[RA_ALTNOME]	= @RA_ALTNOME	
	  ,[RA_CODRET]	= @RA_CODRET		
	  ,[RA_FECREI]	= @RA_FECREI		
	  ,[RA_CRACHA]	= @RA_CRACHA		
	  ,[RA_DEMIANT]	= @RA_DEMIANT	
	  ,[RA_REGRA]	= @RA_REGRA		
	  ,[RA_MOLEST]	= @RA_MOLEST		
	  ,[RA_COMPSAB]	= @RA_COMPSAB	
	  ,[RA_EAPOSEN]	= @RA_EAPOSEN	
	  ,[RA_NJUD14]	= @RA_NJUD14		
	  ,[RA_TPREINT]	= @RA_TPREINT	
	  ,[RA_SEQTURN]	= @RA_SEQTURN	
	  ,[RA_NRPROC]	= @RA_NRPROC		
	  ,[RA_SENHA]	= @RA_SENHA		
	  ,[RA_NRLEIAN]	= @RA_NRLEIAN	
	  ,[RA_DTEFRET]	= @RA_DTEFRET	
	  ,[RA_DTEFRTN]	= @RA_DTEFRTN	
	  ,[RA_CIC]		= @RA_CIC		
	  ,[RA_NIVEL]	= @RA_NIVEL		
	  ,[RA_PIS]		= @RA_PIS		
	  ,[RA_TPRCBT]	= @RA_TPRCBT		
	  ,[RA_ALTPIS]	= @RA_ALTPIS		
	  ,[RA_TCFMSG]	= @RA_TCFMSG		
	  ,[RA_RG]		= @RA_RG			
	  ,[RA_INSSSC]	= @RA_INSSSC		
	  ,[RA_DTRGEXP]	= @RA_DTRGEXP	
	  ,[RA_RGUF]	= @RA_RGUF		
	  ,[RA_RGORG]	= @RA_RGORG		
	  ,[RA_RGEXP]	= @RA_RGEXP		
	  ,[RA_DISTSN]	= @RA_DISTSN		
	  ,[RA_ORGEMRG]	= @RA_ORGEMRG	
	  ,[RA_COMPLRG]	= @RA_COMPLRG	
	  ,[RA_NUMCP]	= @RA_NUMCP		
	  ,[RA_BHFOL]	= @RA_BHFOL		
	  ,[RA_SERCP]	= @RA_SERCP		
	  ,[RA_UFCP]	= @RA_UFCP		
	  ,[RA_ACUMBH]	= @RA_ACUMBH		
	  ,[RA_OKTRANS]	= @RA_OKTRANS	
	  ,[RA_DTCPEXP]	= @RA_DTCPEXP	
	  ,[RA_ALTCP]	= @RA_ALTCP		
	  ,[RA_TABELA]	= @RA_TABELA		
	  ,[RA_TABNIVE]	= @RA_TABNIVE	
	  ,[RA_HABILIT]	= @RA_HABILIT	
	  ,[RA_TABFAIX]	= @RA_TABFAIX	
	  ,[RA_CNHORG]	= @RA_CNHORG		
	  ,[RA_DTEMCNH]	= @RA_DTEMCNH	
	  ,[RA_DTVCCNH]	= @RA_DTVCCNH	
	  ,[RA_RECPFNC]	= @RA_RECPFNC	
	  ,[RA_CATCNH]	= @RA_CATCNH		
	  ,[RA_UFCNH]	= @RA_UFCNH		
	  ,[RA_TIPENDE]	= @RA_TIPENDE	
	  ,[RA_RESERVI]	= @RA_RESERVI	
	  ,[RA_TITULOE]	= @RA_TITULOE	
	  ,[RA_RESEXT]	= @RA_RESEXT		
	  ,[RA_PAISEXT]	= @RA_PAISEXT	
	  ,[RA_ZONASEC]	= @RA_ZONASEC	
	  ,[RA_SECAO]	= @RA_SECAO		
	  ,[RA_LOGRTP]	= @RA_LOGRTP		
	  ,[RA_REGISTR]	= @RA_REGISTR	
	  ,[RA_FICHA]	= @RA_FICHA		
	  ,[RA_LOGRDSC]	= @RA_LOGRDSC	
	  ,[RA_SERVENT]	= @RA_SERVENT	
	  ,[RA_CODACER]	= @RA_CODACER	
	  ,[RA_LOGRNUM]	= @RA_LOGRNUM	
	  ,[RA_REGCIVI]	= @RA_REGCIVI	
	  ,[RA_ENDEREC]	= @RA_ENDEREC	
	  ,[RA_TPLIVRO]	= @RA_TPLIVRO	
	  ,[RA_CLASEST]	= @RA_CLASEST	
	  ,[RA_NUMENDE]	= @RA_NUMENDE	
	  ,[RA_MSBLQL]	= @RA_MSBLQL		
	  ,[RA_TIPCERT]	= @RA_TIPCERT	
	  ,[RA_COMPLEM]	= @RA_COMPLEM	
	  ,[RA_EMICERT]	= @RA_EMICERT	
	  ,[RA_BAIRRO]	= @RA_BAIRRO		
	  ,[RA_MATCERT]	= @RA_MATCERT	
	  ,[RA_ESTADO]	= @RA_ESTADO		
	  ,[RA_LIVCERT]	= @RA_LIVCERT	
	  ,[RA_CODMUN]	= @RA_CODMUN		
	  ,[RA_FOLCERT]	= @RA_FOLCERT	
	  ,[RA_CARCERT]	= @RA_CARCERT	
	  ,[RA_MUNICIP]	= @RA_MUNICIP	
	  ,[RA_UFCERT]	= @RA_UFCERT		
	  ,[RA_CEP]		= @RA_CEP		
	  ,[RA_CPOSTAL]	= @RA_CPOSTAL	
	  ,[RA_CDMUCER]	= @RA_CDMUCER	
	  ,[RA_CEPCXPO]	= @RA_CEPCXPO	
	  ,[RA_NUMEPAS]	= @RA_NUMEPAS	
	  ,[RA_ALTEND]	= @RA_ALTEND		
	  ,[RA_EMISPAS]	= @RA_EMISPAS	
	  ,[RA_DDDFONE]	= @RA_DDDFONE	
	  ,[RA_TIPAMED]	= @RA_TIPAMED	
	  ,[RA_UFPAS]	= @RA_UFPAS		
	  ,[RA_ASMEDIC]	= @RA_ASMEDIC	
	  ,[RA_TELEFON]	= @RA_TELEFON	
	  ,[RA_DDDCELU]	= @RA_DDDCELU	
	  ,[RA_DEMIPAS]	= @RA_DEMIPAS	
	  ,[RA_DPASSME]	= @RA_DPASSME	
	  ,[RA_DVALPAS]	= @RA_DVALPAS	
	  ,[RA_NUMCELU]	= @RA_NUMCELU	
	  ,[RA_TPASODO]	= @RA_TPASODO	
	  ,[RA_ASODONT]	= @RA_ASODONT	
	  ,[RA_CHIDENT]	= @RA_CHIDENT	
	  ,[RA_CODPAIS]	= @RA_CODPAIS	
	  ,[RA_NUMRIC]	= @RA_NUMRIC		
	  ,[RA_EMISRIC]	= @RA_EMISRIC	
	  ,[RA_UFRIC]	= @RA_UFRIC		
	  ,[RA_CDMURIC]	= @RA_CDMURIC	
	  ,[RA_NUMINSC]	= @RA_NUMINSC	
	  ,[RA_SERVICO]	= @RA_SERVICO	
	  ,[RA_DEXPRIC]	= @RA_DEXPRIC	
	  ,[RA_CODIGO]	= @RA_CODIGO		
	  ,[RA_OCEMIS]	= @RA_OCEMIS		
	  ,[RA_OCDTEXP]	= @RA_OCDTEXP	
	  ,[RA_OCDTVAL]	= @RA_OCDTVAL	
	  ,[RA_CODUNIC]	= @RA_CODUNIC	
	  ,[RA_PRCFCH]	= @RA_PRCFCH		
	  ,[RA_PERFCH]	= @RA_PERFCH		
	  ,[RA_ROTFCH]	= @RA_ROTFCH		
	  ,[RA_NUPFCH]	= @RA_NUPFCH		
	  ,[RA_RNE]		= @RA_RNE		
	  ,[RA_RNEORG]	= @RA_RNEORG		
	  ,[RA_RNEDEXP]	= @RA_RNEDEXP	
	  ,[RA_DATCHEG]	= @RA_DATCHEG	
	  ,[RA_ANOCHEG]	= @RA_ANOCHEG	
	  ,[RA_NUMNATU]	= @RA_NUMNATU	
	  ,[RA_DATNATU]	= @RA_DATNATU	
	  ,[RA_CASADBR]	= @RA_CASADBR	
	  ,[RA_FILHOBR]	= @RA_FILHOBR	
	  ,[RA_INSSAUT]	= @RA_INSSAUT	
	  ,[RA_REGIME]	= @RA_REGIME		
	  ,[RA_FWIDM]	= @RA_FWIDM		
	  ,[RA_INSMAX]	= @RA_INSMAX		
	  ,[RA_ADCCONF]	= @RA_ADCCONF	
	  ,[RA_ADCTRF]	= @RA_ADCTRF		
	  ,[RA_PLSAUDE]	= @RA_PLSAUDE	
	  ,[RA_RHEXP]	= @RA_RHEXP		
	  ,[RA_ADTPOSE]	= @RA_ADTPOSE	
	  ,[RA_TPJORNA]	= @RA_TPJORNA	
	  ,[RA_FITIPEN]	= @RA_FITIPEN	
	  ,[RA_MATIPEN]	= @RA_MATIPEN	
	  ,[RA_TIPOPEN]	= @RA_TIPOPEN	
	  ,[RA_APOSENT]	= @RA_APOSENT	
	  ,[RA_SUBCARR]	= @RA_SUBCARR	
	  ,[RA_DTNOMEA]	= @RA_DTNOMEA	
	  ,[RA_DEFETIV]	= @RA_DEFETIV	
	  ,[RA_CODCON]	= @RA_CODCON		
	  ,[RA_ADICEDI]	= @RA_ADICEDI	
	  ,[RA_JORNRED]	= @RA_JORNRED	
	  ,[RA_TPSBCOM]	= @RA_TPSBCOM	
	  ,[RA_DTHREST]	= @RA_DTHREST	
	  ,[RA_TPCUEST]	= @RA_TPCUEST	
	  ,[RA_ANOSEME]	= @RA_ANOSEME	
	  ,[RA_PERESTU]	= @RA_PERESTU	
	  ,[RA_DTCAGED]	= @RA_DTCAGED	
	  ,[RA_CTRLEMA]	= @RA_CTRLEMA	
	  ,[RA_MATMIG]	= @RA_MATMIG		
	  ,[RA_AUTMEI]	= @RA_AUTMEI		
	  ,[RA_ZMAT01]	= @RA_ZMAT01		
	  ,[RA_ZMAT02]	= @RA_ZMAT02		
	  ,[RA_ZSCEALT]	= @RA_ZSCEALT	
	  ,[RA_USRADM]	= @RA_USRADM		
	  ,[RA_CONFID]	= @RA_CONFID		
	  ,[RA_HABILMT]	= @RA_HABILMT	
	  ,[RA_CTPCD]	= @RA_CTPCD		
	  ,[RA_ZPAREN]	= @RA_ZPAREN		
	  ,[RA_ZGRAU]	= @RA_ZGRAU		
	  ,[RA_ZFORM]	= @RA_ZFORM		
	  ,[RA_ZEXSDX]	= @RA_ZEXSDX		
	  ,[RA_ZEVSDX1]	= @RA_ZEVSDX1	
	  ,[RA_ZEVSDX2]	= @RA_ZEVSDX2	
	  ,[RA_ZALOSDX]	= @RA_ZALOSDX	
	  ,[RA_ZEALSDX]	= @RA_ZEALSDX	
	  ,[RA_ZVALSDX]	= @RA_ZVALSDX	
	  ,[RA_ZTPCAL]	= @RA_ZTPCAL		
	  ,[RA_ZSEGVD]	= @RA_ZSEGVD		
	  ,[RA_DESEPS]	= @RA_DESEPS		
	  ,[RA_DTINCON]	= @RA_DTINCON	
	  ,[RA_USERLGI]	= @RA_USERLGI	
	  ,[RA_USERLGA]	= @RA_USERLGA	
	  ,[RA_PLAPRE]	= @RA_PLAPRE		
	  ,[RA_TIPCTA]	= @RA_TIPCTA		
	  ,[RA_KEYLOC]	= @RA_KEYLOC		
	  ,[RA_BLOQADM]	= @RA_BLOQADM	
	  ,[RA_ZZVAGA]	= @RA_ZZVAGA		
	  ,[RA_ZZIDFLU]	= @RA_ZZIDFLU	
	  ,[RA_TIPOCON]	= @RA_TIPOCON	
	  ,[RA_ZDIRIMG]	= @RA_ZDIRIMG	
	  ,[RA_ZZGED]	= @RA_ZZGED		
	  ,[RA_ZZRVAL]	= @RA_ZZRVAL		
	  ,[RA_ZZPP]	= @RA_ZZPP		
	  ,[RA_DESCEP]	= @RA_DESCEP		
	  ,[RA_TIPOVIA]	= @RA_TIPOVIA	
	  ,[RA_ZZPONTO]	= @RA_ZZPONTO	
	  ,[RA_DTENTRA]	= @RA_DTENTRA	
	  ,[RA_TIPINF]	= @RA_TIPINF		
	  ,[RA_DTREC]	= @RA_DTREC		
	  ,[S_T_A_M_P_]	= @S_T_A_M_P_	
	  ,[I_N_S_D_T_]	= @I_N_S_D_T_	
	  ,[RA_TSTCNB]	= @RA_TSTCNB		
	  ,[RA_ZZGRPV]	= @RA_ZZGRPV		
 WHERE sk_destino = @sk_destino

GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSRB010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







create proc [dbo].[sp_alteraRegistroSRB010]

@sk_destino int

,@RB_FILIAL     varchar(2) 	
,@RB_MAT        varchar(6) 	
,@RB_COD        varchar(2) 	
,@RB_NOME       varchar(70) 	
,@RB_TPDEP      varchar(2) 	
,@RB_DTNASC     varchar(8) 	
,@RB_SEXO       varchar(1) 	
,@RB_GRAUPAR    varchar(1) 	
,@RB_TIPIR      varchar(1) 	
,@RB_TIPSF      varchar(1) 	
,@RB_LOCNASC    varchar(12) 	
,@RB_CARTORI    varchar(12) 	
,@RB_NREGCAR    varchar(6) 	
,@RB_NUMLIVR    varchar(5) 	
,@RB_NUMFOLH    varchar(7) 	
,@RB_DTENTRA    varchar(8) 	
,@RB_DTBAIXA    varchar(8) 	
,@RB_CIC        varchar(11) 	
,@RB_TPDEPAM    varchar(1) 	
,@RB_TIPAMED    varchar(1) 	
,@RB_CODAMED    varchar(2) 	
,@RB_VBDESAM    varchar(3) 	
,@RB_DTINIAM    varchar(8) 	
,@RB_DTFIMAM    varchar(8) 	
,@RB_TPDPODO    varchar(1) 	
,@RB_TPASODO    varchar(1) 	
,@RB_ASODONT    varchar(2) 	
,@RB_VBDESAO    varchar(3) 	
,@RB_DTINIAO    varchar(8) 	
,@RB_DTFIMAO    varchar(8) 	
,@RB_AUXCRE     varchar(1) 	
,@RB_VLRCRE     float 		
,@RB_PLSAUDE    varchar(1) 	
,@RB_NUMAT      varchar(37) 	
,@D_E_L_E_T_    varchar(1) 	
,@R_E_C_N_O_    int 			
,@R_E_C_D_E_L_  int 			
,@RB_INCT       varchar(1) 	
,@RB_USERLGI    varchar(17) 	
,@RB_USERLGA    varchar(17) 	
,@RB_ZZID       varchar(15) 	
,@RB_ZZNMAE     varchar(40) 	
,@RB_ZDTCAS     varchar(8) 	
,@RB_ZZESTAC    varchar(1) 	
,@RB_DTINIAC    varchar(8) 	
,@RB_DESCDEP    varchar(100) 
,@RB_DTINIVI		varchar(8) 	

as


UPDATE [dbo].[SRB010]
   SET 

	 [RB_FILIAL]    = @RB_FILIAL      
	,[RB_MAT]       = @RB_MAT         
	,[RB_COD]       = @RB_COD         
	,[RB_NOME]      = @RB_NOME        
	,[RB_TPDEP]     = @RB_TPDEP       
	,[RB_DTNASC]    = @RB_DTNASC      
	,[RB_SEXO]      = @RB_SEXO        
	,[RB_GRAUPAR]   = @RB_GRAUPAR     
	,[RB_TIPIR]     = @RB_TIPIR       
	,[RB_TIPSF]     = @RB_TIPSF       
	,[RB_LOCNASC]   = @RB_LOCNASC     
	,[RB_CARTORI]   = @RB_CARTORI     
	,[RB_NREGCAR]   = @RB_NREGCAR     
	,[RB_NUMLIVR]   = @RB_NUMLIVR     
	,[RB_NUMFOLH]   = @RB_NUMFOLH     
	,[RB_DTENTRA]   = @RB_DTENTRA     
	,[RB_DTBAIXA]   = @RB_DTBAIXA     
	,[RB_CIC]       = @RB_CIC         
	,[RB_TPDEPAM]   = @RB_TPDEPAM     
	,[RB_TIPAMED]   = @RB_TIPAMED     
	,[RB_CODAMED]   = @RB_CODAMED     
	,[RB_VBDESAM]   = @RB_VBDESAM     
	,[RB_DTINIAM]   = @RB_DTINIAM     
	,[RB_DTFIMAM]   = @RB_DTFIMAM     
	,[RB_TPDPODO]   = @RB_TPDPODO     
	,[RB_TPASODO]   = @RB_TPASODO     
	,[RB_ASODONT]   = @RB_ASODONT     
	,[RB_VBDESAO]   = @RB_VBDESAO     
	,[RB_DTINIAO]   = @RB_DTINIAO     
	,[RB_DTFIMAO]   = @RB_DTFIMAO     
	,[RB_AUXCRE]    = @RB_AUXCRE      
	,[RB_VLRCRE]    = @RB_VLRCRE      
	,[RB_PLSAUDE]   = @RB_PLSAUDE     
	,[RB_NUMAT]     = @RB_NUMAT       
	,[D_E_L_E_T_]   = @D_E_L_E_T_     

	--,[R_E_C_N_O_]   = @R_E_C_N_O_     
    ,[dt_alteracao]	= getdate()

	,[R_E_C_D_E_L_] = @R_E_C_D_E_L_   
	,[RB_INCT]      = @RB_INCT        
	,[RB_USERLGI]   = @RB_USERLGI     
	,[RB_USERLGA]   = @RB_USERLGA     
	,[RB_ZZID]      = @RB_ZZID        
	,[RB_ZZNMAE]    = @RB_ZZNMAE      
	,[RB_ZDTCAS]    = @RB_ZDTCAS      
	,[RB_ZZESTAC]   = @RB_ZZESTAC     
	,[RB_DTINIAC]   = @RB_DTINIAC     
	,[RB_DESCDEP]   = @RB_DESCDEP     
	,[RB_DTINIVI]	= @RB_DTINIVI	

	
 WHERE sk_destino = @sk_destino

GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSRJ010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_alteraRegistroSRJ010]

@sk_destino int 
,@RJ_MAOBRA varchar(1)
,@RJ_DESC varchar(20)
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@RJ_FILIAL  varchar(2)
,@RJ_FUNCAO  varchar(5)
,@R_E_C_D_E_L_ int

as

UPDATE [dbo].[SRJ010]
   SET 
       [RJ_MAOBRA]		=  @RJ_MAOBRA	
      ,[RJ_DESC]		=  @RJ_DESC
      ,[D_E_L_E_T_]		=  @D_E_L_E_T_	
      ,[R_E_C_N_O_]		=  @R_E_C_N_O_	
      ,[dt_alteracao]	=  getdate()
	  ,RJ_FILIAL        = @RJ_FILIAL
	  ,RJ_FUNCAO		= @RJ_FUNCAO
	  ,R_E_C_D_E_L_		= @R_E_C_D_E_L_

WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSX5010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create proc [dbo].[sp_alteraRegistroSX5010]
@sk_destino int
,@X5_FILIAL varchar(2)
,@X5_TABELA varchar(2)
,@X5_CHAVE varchar(6)
,@X5_DESCRI varchar(55)
,@X5_DESCSPA varchar(55)
,@X5_DESCENG varchar(55)
,@D_E_L_E_T_ varchar(1)
,@R_E_C_D_E_L_ bigint

as


UPDATE [dbo].[SX5010]
   SET [X5_FILIAL]		= @X5_FILIAL	
      ,[X5_TABELA]		= @X5_TABELA	
      ,[X5_CHAVE]		= @X5_CHAVE
      ,[X5_DESCRI]		= @X5_DESCRI	
      ,[X5_DESCSPA]		= @X5_DESCSPA
      ,[X5_DESCENG]		= @X5_DESCENG	
      ,[D_E_L_E_T_]		= @D_E_L_E_T_
      ,[R_E_C_D_E_L_]	= @R_E_C_D_E_L_
      ,[dt_alteracao]	= getdate()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSY1010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_alteraRegistroSY1010]
@sk_destino int
,@Y1_NOME varchar(40)
,@Y1_USER varchar(6)
,@Y1_TEL varchar(30)
,@Y1_FAX varchar(30)
,@Y1_EMAIL varchar(40)
,@Y1_GRAPROV varchar(6)
,@Y1_PEDIDO varchar(1)
,@Y1_GRUPCOM varchar(6)
,@Y1_GRAPRCP varchar(6)
,@Y1_ACCID varchar(22)
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ int
,@Y1_MSBLQL varchar(1)
,@Y1_MSEXP varchar(8)
,@Y1_USERLGA varchar(17)
,@Y1_USERLGI varchar(17)
,@Y1_ZINTSRM varchar(1)
,@Y1_FILIAL varchar(2)
,@Y1_COD varchar(3)
,@R_E_C_D_E_L_ int

as
UPDATE [dbo].[SY1010]
   SET 
      [Y1_NOME]			= @Y1_NOME		
      ,[Y1_USER]		= @Y1_USER	
      ,[Y1_TEL]			= @Y1_TEL		
      ,[Y1_FAX]			= @Y1_FAX		
      ,[Y1_EMAIL]		= @Y1_EMAIL	
      ,[Y1_GRAPROV]		= @Y1_GRAPROV	
      ,[Y1_PEDIDO]		= @Y1_PEDIDO	
      ,[Y1_GRUPCOM]		= @Y1_GRUPCOM	
      ,[Y1_GRAPRCP]		= @Y1_GRAPRCP	
      ,[Y1_ACCID]		= @Y1_ACCID	
      ,[D_E_L_E_T_]		= @D_E_L_E_T_	
      --,[R_E_C_N_O_]		= @R_E_C_N_O_	
      ,[Y1_MSBLQL]		= @Y1_MSBLQL	
      ,[Y1_MSEXP]		= @Y1_MSEXP	
      ,[Y1_USERLGA]		= @Y1_USERLGA	
      ,[Y1_USERLGI]		= @Y1_USERLGI	
      ,[Y1_ZINTSRM]		= @Y1_ZINTSRM	
      ,[dt_alteracao]	= getdate()
	  ,Y1_FILIAL        = @Y1_FILIAL
	  ,Y1_COD			= @Y1_COD
	  ,R_E_C_D_E_L_ 	= @R_E_C_D_E_L_ 
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroSYSCOMPANY]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_alteraRegistroSYSCOMPANY]
@sk_destino int
,@M0_FILIAL varchar(41)
,@M0_NOME varchar(40)
,@M0_NOMECOM varchar(60)
,@M0_TEL varchar(14)
,@M0_FAX varchar(14)
,@M0_EQUIP varchar(1)
,@M0_TPINSC float
,@M0_CGC varchar(14)
,@M0_CEI varchar(14)
,@M0_INSC varchar(14)
,@M0_INSCM varchar(25)
,@M0_ENDENT varchar(60)
,@M0_COMPENT varchar(25)
,@M0_BAIRENT varchar(35)
,@M0_CIDENT varchar(60)
,@M0_ESTENT varchar(2)
,@M0_CEPENT varchar(8)
,@M0_CODMUN varchar(7)
,@M0_ENDCOB varchar(60)
,@M0_COMPCOB varchar(25)
,@M0_BAIRCOB varchar(35)
,@M0_CIDCOB varchar(60)
,@M0_ESTCOB varchar(2)
,@M0_CEPCOB varchar(8)
,@M0_PRODRUR varchar(1)
,@M0_FPAS varchar(4)
,@M0_NATJUR varchar(4)
,@M0_DTBASE varchar(2)
,@M0_CNAE varchar(7)
,@M0_ACTRAB varchar(8)
,@M0_NUMPROP float
,@M0_MODEND varchar(1)
,@M0_MODINSC varchar(1)
,@M0_CAUSA varchar(1)
,@M0_INSCANT varchar(14)
,@M0_TPESTAB varchar(2)
,@M0_TEL_IMP varchar(22)
,@M0_FAX_IMP varchar(22)
,@M0_IMP_CON varchar(1)
,@M0_TEL_PO varchar(22)
,@M0_FAX_PO varchar(22)
,@M0_CODZOSE varchar(12)
,@M0_DESZOSE varchar(30)
,@M0_COD_ATV varchar(5)
,@M0_INS_SUF varchar(12)
,@M0_NIRE varchar(25)
,@M0_DTRE varchar(8)
,@M0_DSCCNA varchar(60)
,@M0_ASSPAT1 varchar(3)
,@M0_ASSPAT2 varchar(3)
,@M0_ASSPAT3 varchar(3)
,@M0_RNTRC varchar(8)
,@M0_DTRNTRC varchar(8)
,@M0_SEQUENC varchar(10)
,@M0_DOCSEQ float
,@M0_EMERGEN varchar(8)
,@M0_LIBMOD varchar(97)
,@M0_DTAUTOR varchar(8)
,@M0_EMPB2B varchar(30)
,@M0_CAIXA varchar(5)
,@M0_LICENSA varchar(64)
,@M0_CORPKEY varchar(16)
,@M0_CHKSUM float
,@M0_DTVLD varchar(8)
,@M0_PSW varchar(8)
,@M0_CTPSW varchar(8)
,@M0_INTCTRL varchar(18)
,@M0_PSWSTRT varchar(31)
,@M0_CNES varchar(7)
,@M0_SIZEFIL float
,@M0_LEIAUTE varchar(12)
,@M0_PICTURE varchar(255)
,@M0_STATUS varchar(1)
,@D_E_L_E_T_ varchar(1)
,@R_E_C_N_O_ bigint
,@M0_CODIGO varchar(2)
,@M0_CODFIL varchar(12)
,@R_E_C_D_E_L_ int


as


UPDATE [dbo].[SYS_COMPANY]
   SET 
       [M0_FILIAL]		= @M0_FILIAL	
      ,[M0_NOME]		= @M0_NOME	
      ,[M0_NOMECOM]		= @M0_NOMECOM	
      ,[M0_TEL]			= @M0_TEL		
      ,[M0_FAX]			= @M0_FAX		
      ,[M0_EQUIP]		= @M0_EQUIP	
      ,[M0_TPINSC]		= @M0_TPINSC	
      ,[M0_CGC]			= @M0_CGC		
      ,[M0_CEI]			= @M0_CEI		
      ,[M0_INSC]		= @M0_INSC	
      ,[M0_INSCM]		= @M0_INSCM	
      ,[M0_ENDENT]		= @M0_ENDENT	
      ,[M0_COMPENT]		= @M0_COMPENT	
      ,[M0_BAIRENT]		= @M0_BAIRENT	
      ,[M0_CIDENT]		= @M0_CIDENT	
      ,[M0_ESTENT]		= @M0_ESTENT	
      ,[M0_CEPENT]		= @M0_CEPENT	
      ,[M0_CODMUN]		= @M0_CODMUN	
      ,[M0_ENDCOB]		= @M0_ENDCOB	
      ,[M0_COMPCOB]		= @M0_COMPCOB	
      ,[M0_BAIRCOB]		= @M0_BAIRCOB	
      ,[M0_CIDCOB]		= @M0_CIDCOB	
      ,[M0_ESTCOB]		= @M0_ESTCOB	
      ,[M0_CEPCOB]		= @M0_CEPCOB	
      ,[M0_PRODRUR]		= @M0_PRODRUR	
      ,[M0_FPAS]		= @M0_FPAS	
      ,[M0_NATJUR]		= @M0_NATJUR	
      ,[M0_DTBASE]		= @M0_DTBASE	
      ,[M0_CNAE]		= @M0_CNAE	
      ,[M0_ACTRAB]		= @M0_ACTRAB	
      ,[M0_NUMPROP]		= @M0_NUMPROP	
      ,[M0_MODEND]		= @M0_MODEND	
      ,[M0_MODINSC]		= @M0_MODINSC	
      ,[M0_CAUSA]		= @M0_CAUSA	
      ,[M0_INSCANT]		= @M0_INSCANT	
      ,[M0_TPESTAB]		= @M0_TPESTAB	
      ,[M0_TEL_IMP]		= @M0_TEL_IMP	
      ,[M0_FAX_IMP]		= @M0_FAX_IMP	
      ,[M0_IMP_CON]		= @M0_IMP_CON	
      ,[M0_TEL_PO]		= @M0_TEL_PO	
      ,[M0_FAX_PO]		= @M0_FAX_PO	
      ,[M0_CODZOSE]		= @M0_CODZOSE	
      ,[M0_DESZOSE]		= @M0_DESZOSE	
      ,[M0_COD_ATV]		= @M0_COD_ATV	
      ,[M0_INS_SUF]		= @M0_INS_SUF	
      ,[M0_NIRE]		= @M0_NIRE
      ,[M0_DTRE]		= @M0_DTRE
      ,[M0_DSCCNA]		= @M0_DSCCNA	
      ,[M0_ASSPAT1]		= @M0_ASSPAT1
      ,[M0_ASSPAT2]		= @M0_ASSPAT2
      ,[M0_ASSPAT3]		= @M0_ASSPAT3
      ,[M0_RNTRC]		= @M0_RNTRC
      ,[M0_DTRNTRC]		= @M0_DTRNTRC
      ,[M0_SEQUENC]		= @M0_SEQUENC
      ,[M0_DOCSEQ]		= @M0_DOCSEQ
      ,[M0_EMERGEN]		= @M0_EMERGEN
      ,[M0_LIBMOD]		= @M0_LIBMOD
      ,[M0_DTAUTOR]		= @M0_DTAUTOR
      ,[M0_EMPB2B]		= @M0_EMPB2B
      ,[M0_CAIXA]		= @M0_CAIXA
      ,[M0_LICENSA]		= @M0_LICENSA
      ,[M0_CORPKEY]		= @M0_CORPKEY
      ,[M0_CHKSUM]		= @M0_CHKSUM
      ,[M0_DTVLD]		= @M0_DTVLD
      ,[M0_PSW]			= @M0_PSW	
      ,[M0_CTPSW]		= @M0_CTPSW
      ,[M0_INTCTRL]		= @M0_INTCTRL
      ,[M0_PSWSTRT]		= @M0_PSWSTRT
      ,[M0_CNES]		= @M0_CNES
      ,[M0_SIZEFIL]		= @M0_SIZEFIL
      ,[M0_LEIAUTE]		= @M0_LEIAUTE
      ,[M0_PICTURE]		= @M0_PICTURE
      ,[M0_STATUS]		= @M0_STATUS
      ,[D_E_L_E_T_]		= @D_E_L_E_T_
      --,[R_E_C_N_O_]		= @R_E_C_N_O_
      ,[dt_alteracao]	= getdate()
	  ,M0_CODIGO		= @M0_CODIGO
	  ,@M0_CODFIL		= @M0_CODFIL
	  ,@R_E_C_D_E_L_	= @R_E_C_D_E_L_ 
 WHERE sk_destino = @sk_destino 
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroT83010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_alteraRegistroT83010]

@sk_destino int

,@T83_FILIAL	 varchar(2)	
,@T83_ID		 varchar(36)	
,@T83_CODIGO	 varchar(2)	
,@T83_CODSEC	 varchar(4)	
,@T83_DESCRI	 varchar(80)	
,@D_E_L_E_T_     varchar(1)	
,@R_E_C_N_O_     int			
,@R_E_C_D_E_L_   int			

as


UPDATE [dbo].[T83010]
   SET 

	 [T83_FILIAL]	= @T83_FILIAL	
	,[T83_ID]		= @T83_ID		
	,[T83_CODIGO]	= @T83_CODIGO	
	,[T83_CODSEC]	= @T83_CODSEC	
	,[T83_DESCRI]	= @T83_DESCRI	
	,[D_E_L_E_T_]   = @D_E_L_E_T_  
	--,[R_E_C_N_O_]   = @R_E_C_N_O_  
    ,[dt_alteracao]	= getdate()

	,[R_E_C_D_E_L_] = @R_E_C_D_E_L_     

	
 WHERE sk_destino = @sk_destino

GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroTB_ACC_USER]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create proc [dbo].[sp_alteraRegistroTB_ACC_USER]
@sk_destino                int		
,@ID_USR_PROFILE	  		   int
,@TX_USR_PASS	  			   varchar(300)
,@NR_USR_EMPLOYEE  		   varchar(100)
,@TX_USR_NAME	  			   varchar(150)
,@TX_USR_ITIN	  			   varchar(255)
,@TX_USR_EMAIL	  		   varchar(255)
,@DT_USR_UPDATED	  		   datetime
,@ID_USR_UPDATED_BY		   int
,@ID_USR_STATUS	  		   int
,@ID_USR_USER_OT	  		   int
,@TX_USR_LOGIN	  		   varchar(100)

AS
UPDATE [dbo].[TB_ACC_USER]
   SET 				  	
@ID_USR_PROFILE		  = ID_USR_PROFILE	
,@TX_USR_PASS	  	  = TX_USR_PASS	  	
,@NR_USR_EMPLOYEE  	  = NR_USR_EMPLOYEE  	
,@TX_USR_NAME	  	  = TX_USR_NAME	  	
,@TX_USR_ITIN	  	  = TX_USR_ITIN	  	
,@TX_USR_EMAIL	  	  = TX_USR_EMAIL	  	
,@DT_USR_UPDATED	  = DT_USR_UPDATED	
,@ID_USR_UPDATED_BY	  = ID_USR_UPDATED_BY	
,@ID_USR_STATUS	  	  = ID_USR_STATUS	  	
,@ID_USR_USER_OT	  = ID_USR_USER_OT	
,@TX_USR_LOGIN	  	  = TX_USR_LOGIN
,dt_alteracao 		  = GETDATE()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroTB_DSH_DISTRIBUTION]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[sp_alteraRegistroTB_DSH_DISTRIBUTION]
@sk_destino                int
,@DISTRIBUTION_MESSAGE_ID				     int
,@DISTRIBUTION_MESSAGE_REF					 varchar(50)
,@DISTRIBUTION_MESSAGE_STATUS				 int
,@DISTRIBUTION_DATA_REF						 varchar(50)
,@DISTRIBUTION_TASK_ID						 int
,@DISTRIBUTION_TASK_STATUS					 int
,@DISTRIBUTION_TASK_BUSINESS_UNIT_CODE		 varchar(50)
,@DISTRIBUTION_TASK_BUSINESS_UNIT_NAME		 nchar(250)
,@DISTRIBUTION_TASK_EMPLOYEE_NUMBER			 varchar(50)
,@DISTRIBUTION_TASK_EMPLOYEE_NAME			 nchar(250)
,@DISTRIBUTION_TASK_SENT_ERP_STATUS			 int
,@DISTRIBUTION_TASK_RECEIVED_ERP_STATUS		 int
,@MESSAGE									 varchar(MAX)

AS
UPDATE [dbo].[TB_DSH_DISTRIBUTION]
   SET
DISTRIBUTION_MESSAGE_ID					  = @DISTRIBUTION_MESSAGE_ID
,DISTRIBUTION_MESSAGE_REF				  = @DISTRIBUTION_MESSAGE_REF				
,DISTRIBUTION_MESSAGE_STATUS			  = @DISTRIBUTION_MESSAGE_STATUS			
,DISTRIBUTION_DATA_REF					  = @DISTRIBUTION_DATA_REF					
,DISTRIBUTION_TASK_ID					  = @DISTRIBUTION_TASK_ID					
,DISTRIBUTION_TASK_STATUS				  = @DISTRIBUTION_TASK_STATUS				
,DISTRIBUTION_TASK_BUSINESS_UNIT_CODE	  = @DISTRIBUTION_TASK_BUSINESS_UNIT_CODE	
,DISTRIBUTION_TASK_BUSINESS_UNIT_NAME	  = @DISTRIBUTION_TASK_BUSINESS_UNIT_NAME	
,DISTRIBUTION_TASK_EMPLOYEE_NUMBER		  = @DISTRIBUTION_TASK_EMPLOYEE_NUMBER		
,DISTRIBUTION_TASK_EMPLOYEE_NAME		  = @DISTRIBUTION_TASK_EMPLOYEE_NAME		
,DISTRIBUTION_TASK_SENT_ERP_STATUS		  = @DISTRIBUTION_TASK_SENT_ERP_STATUS		
,DISTRIBUTION_TASK_RECEIVED_ERP_STATUS	  = @DISTRIBUTION_TASK_RECEIVED_ERP_STATUS	
,[MESSAGE]								  = @MESSAGE								
,dt_alteracao 							  = GETDATE()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroTB_REG_BUSINESS_UNIT]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_alteraRegistroTB_REG_BUSINESS_UNIT]
@sk_destino                int		
,@TX_BUU_CODE		  varchar(20)
,@TX_BUU_NAME		  varchar(150)
,@TX_BUU_CONTACT		  varchar(50)
,@TX_BUU_EMAIL		  varchar(50)
,@TX_BUU_TELPHONE	  varchar(20)
,@TX_BUU_CELPHONE	  varchar(20)
,@TX_BUU_ADDRESS		  varchar(255)
,@NR_BUU_NUMBER		  int
,@TX_BUU_ADDRESS_2	  varchar(255)
,@TX_BUU_DISTRICT	  varchar(150)
,@ID_BUU_CITY		  int
,@ID_BUU_STATE		  int
,@ID_BUU_COUNTRY		  int
,@TX_BUU_EIN			  varchar(255)
,@TX_BUU_ZIPCODE		  varchar(20)
,@TX_BUU_STATE_ID	  varchar(25)
,@DT_BUU_UPDATED		  datetime
,@ID_BUU_UPDATED_BY	  int
,@ID_BUU_STATUS		  int

AS
UPDATE [dbo].[TB_REG_BUSINESS_UNIT]
   SET 			
TX_BUU_CODE		= @TX_BUU_CODE		
,TX_BUU_NAME		= @TX_BUU_NAME		
,TX_BUU_CONTACT		= @TX_BUU_CONTACT	
,TX_BUU_EMAIL		= @TX_BUU_EMAIL		
,TX_BUU_TELPHONE	= @TX_BUU_TELPHONE	
,TX_BUU_CELPHONE	= @TX_BUU_CELPHONE	
,TX_BUU_ADDRESS		= @TX_BUU_ADDRESS	
,NR_BUU_NUMBER		= @NR_BUU_NUMBER		
,TX_BUU_ADDRESS_2	= @TX_BUU_ADDRESS_2	
,TX_BUU_DISTRICT	= @TX_BUU_DISTRICT	
,ID_BUU_CITY		= @ID_BUU_CITY		
,ID_BUU_STATE		= @ID_BUU_STATE		
,ID_BUU_COUNTRY		= @ID_BUU_COUNTRY	
,TX_BUU_EIN			= @TX_BUU_EIN		
,TX_BUU_ZIPCODE		= @TX_BUU_ZIPCODE	
,TX_BUU_STATE_ID	= @TX_BUU_STATE_ID	
,DT_BUU_UPDATED		= @DT_BUU_UPDATED	
,ID_BUU_UPDATED_BY	= @ID_BUU_UPDATED_BY	
,ID_BUU_STATUS		= @ID_BUU_STATUS	
,dt_alteracao 		  = GETDATE()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroTB_REG_EMPLOYEE]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_alteraRegistroTB_REG_EMPLOYEE]
@sk_destino                int	
,@NR_EMP_NUMBER			   varchar(100)	
,@TX_EMP_NAME			   varchar(50)
,@DT_EMP_UPDATED		   datetime	
,@ID_EMP_UPDATED_BY		   int		
,@ID_EMP_STATUS			   int		

AS
UPDATE [dbo].[TB_REG_EMPLOYEE]
   SET 			
	  NR_EMP_NUMBER		= @NR_EMP_NUMBER		
	  ,TX_EMP_NAME			= @TX_EMP_NAME		
	  ,DT_EMP_UPDATED		= @DT_EMP_UPDATED	
	  ,ID_EMP_UPDATED_BY	= @ID_EMP_UPDATED_BY	
	  ,ID_EMP_STATUS		= @ID_EMP_STATUS
	  ,dt_alteracao 		  = GETDATE()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroTB_REG_PRODUCT]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_alteraRegistroTB_REG_PRODUCT]
@sk_destino                int		
,@TX_PRO_CODE				 varchar(200)
,@ID_PRO_PRODUCT_CATEGORY	 int
,@TX_PRO_DESCRIPTION		 varchar(260)
,@ID_PRO_UNIT_MEASUREMENT	 int
,@ID_PRO_TYPE				 int
,@DT_PRO_UPDATED			 datetime
,@ID_PRO_UPDATED_BY			 int
,@ID_PRO_STATUS				 int

AS
UPDATE [dbo].[TB_REG_PRODUCT]
   SET 			
TX_PRO_CODE				= @TX_PRO_CODE				
,ID_PRO_PRODUCT_CATEGORY	= @ID_PRO_PRODUCT_CATEGORY	
,TX_PRO_DESCRIPTION			= @TX_PRO_DESCRIPTION		
,ID_PRO_UNIT_MEASUREMENT	= @ID_PRO_UNIT_MEASUREMENT	
,ID_PRO_TYPE				= @ID_PRO_TYPE				
,DT_PRO_UPDATED				= @DT_PRO_UPDATED			
,ID_PRO_UPDATED_BY			= @ID_PRO_UPDATED_BY			
,ID_PRO_STATUS				= @ID_PRO_STATUS
,dt_alteracao 				= GETDATE()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroTB_REG_WAREHOUSE]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_alteraRegistroTB_REG_WAREHOUSE]
@sk_destino                int		
,@TX_WAR_CODE				   varchar(10)
,@TX_WAR_NAME				   varchar(150)
,@DT_WAR_UPDATED			   datetime
,@ID_WAR_UPDATED_BY		   int
,@ID_WAR_STATUS			   int
,@ID_WAR_BUSINESS_UNIT	   int

AS
UPDATE [dbo].[TB_REG_WAREHOUSE]
   SET 			
TX_WAR_CODE				= @TX_WAR_CODE			
,TX_WAR_NAME			= @TX_WAR_NAME			
,DT_WAR_UPDATED			= @DT_WAR_UPDATED		
,ID_WAR_UPDATED_BY		= @ID_WAR_UPDATED_BY		
,ID_WAR_STATUS			= @ID_WAR_STATUS			
,ID_WAR_BUSINESS_UNIT 	= @ID_WAR_BUSINESS_UNIT	
,dt_alteracao 			= GETDATE()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroTB_REG_WAREHOUSE_ADDRESS]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_alteraRegistroTB_REG_WAREHOUSE_ADDRESS]
@sk_destino                int		
,@ID_WHA_WAREHOUSE	 	   int
,@TX_WHA_ADDRESS		   varchar(200)
,@DT_WHA_UPDATED		   datetime
,@ID_WHA_UPDATED_BY	 	   int
,@ID_WHA_STATUS		 	   int
,@TX_WHA_ADDRESS_FULL	   varchar(100)

AS
UPDATE [dbo].[TB_REG_WAREHOUSE_ADDRESS]
   SET 			
ID_WHA_WAREHOUSE	 	= @ID_WHA_WAREHOUSE	 
,TX_WHA_ADDRESS			= @TX_WHA_ADDRESS	
,DT_WHA_UPDATED			= @DT_WHA_UPDATED	
,ID_WHA_UPDATED_BY	 	= @ID_WHA_UPDATED_BY	 
,ID_WHA_STATUS		 	= @ID_WHA_STATUS		 
,TX_WHA_ADDRESS_FULL	= @TX_WHA_ADDRESS_FULL
,dt_alteracao 			= GETDATE()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroTB_TSK_DISTRIBUTION]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_alteraRegistroTB_TSK_DISTRIBUTION]
@sk_destino                int		
,@ID_DIS_OT_IN				int			
,@ID_DIS_BUSINESS_UNIT		int			
,@ID_DIS_EMPLOYEE			int			
,@ID_DIS_OWNER				int			
,@DT_DIS_REFERENCE_DATE		datetime	
,@DT_DIS_UPDATED			datetime	
,@ID_DIS_UPDATED_BY			int			
,@ID_DIS_STATUS				int			
,@TX_OUTSOURCING_NAME		varchar(100)	

AS
UPDATE [dbo].[TB_TSK_DISTRIBUTION]
   SET 			
ID_DIS_OT_IN			= @ID_DIS_OT_IN			
,ID_DIS_BUSINESS_UNIT	= @ID_DIS_BUSINESS_UNIT	
,ID_DIS_EMPLOYEE		= @ID_DIS_EMPLOYEE		
,ID_DIS_OWNER			= @ID_DIS_OWNER			
,DT_DIS_REFERENCE_DATE	= @DT_DIS_REFERENCE_DATE	
,DT_DIS_UPDATED			= @DT_DIS_UPDATED		
,ID_DIS_UPDATED_BY		= @ID_DIS_UPDATED_BY		
,ID_DIS_STATUS			= @ID_DIS_STATUS			
,TX_OUTSOURCING_NAME	= @TX_OUTSOURCING_NAME	
,dt_alteracao 			= GETDATE()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroTB_TSK_DISTRIBUTION_ITEM]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[sp_alteraRegistroTB_TSK_DISTRIBUTION_ITEM]
@sk_destino                int	
,@ID_DIT_DISTRIBUTION		   int	
,@ID_DIT_PRODUCT			   int	
,@ID_DIT_WAREHOUSE		   int	
,@ID_DIT_WAREHOUSE_ADDRESS   int	
,@VL_DIT_QUANTITY			   decimal	
,@DT_DIT_UPDATED			   datetime
,@ID_DIT_UPDATED_BY		   int	
,@ID_DIT_STATUS			   int	
,@NR_DIT_CAP_NUMBER		   varchar(100)
,@NR_DIT_ASSET			   varchar(100)	

AS
UPDATE [dbo].[TB_TSK_DISTRIBUTION_ITEM]
   SET 			  
ID_DIT_DISTRIBUTION		= @ID_DIT_DISTRIBUTION		
,ID_DIT_PRODUCT				= @ID_DIT_PRODUCT			
,ID_DIT_WAREHOUSE		  	= @ID_DIT_WAREHOUSE		  
,ID_DIT_WAREHOUSE_ADDRESS	= @ID_DIT_WAREHOUSE_ADDRESS
,VL_DIT_QUANTITY			= @VL_DIT_QUANTITY			
,DT_DIT_UPDATED				= @DT_DIT_UPDATED			
,ID_DIT_UPDATED_BY		  	= @ID_DIT_UPDATED_BY		  
,ID_DIT_STATUS			  	= @ID_DIT_STATUS			  
,NR_DIT_CAP_NUMBER		  	= @NR_DIT_CAP_NUMBER		  
,NR_DIT_ASSET			  	= @NR_DIT_ASSET	
,dt_alteracao 				= GETDATE()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroTB_TSK_DISTRIBUTION_ITEM_STATUS]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_alteraRegistroTB_TSK_DISTRIBUTION_ITEM_STATUS]
@sk_destino                int		
,@TX_DIS_DESCRIPTION				varchar(100)

AS
UPDATE [dbo].[TB_TSK_DISTRIBUTION_ITEM_STATUS]
   SET 			
TX_DIS_DESCRIPTION				= @TX_DIS_DESCRIPTION
,dt_alteracao 					= GETDATE()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroTM0010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[sp_alteraRegistroTM0010]
	@sk_destino int,
	@TM0_FILIAL varchar(2),
	@TM0_NUMFIC varchar(9),
	@TM0_CANDID varchar(6),
	@TM0_FILFUN varchar(2),
	@TM0_MAT varchar(6),
	@TM0_NUMDEP varchar(2),
	@TM0_NOMFIC varchar(40),
	@TM0_DTIMPL varchar(8),
	@TM0_DOADOR varchar(1),
	@TM0_DTDOAC varchar(8),
	@TM0_SANGUE varchar(1),
	@TM0_FATORH varchar(1),
	@TM0_FICANT varchar(12),
	@TM0_DTNASC varchar(8),
	@TM0_SEXO varchar(1),
	@TM0_PESO float,
	@TM0_ALTURA float,
	@TM0_MASSA varchar(20),
	@TM0_ALTOLH float,
	@TM0_LMAMIL float,
	@TM0_ALTPUB float,
	@TM0_ALTJOE float,
	@TM0_ALTCOT float,
	@TM0_TAMBRA float,
	@TM0_TAMANT float,
	@TM0_TAMMAO float,
	@TM0_COMPPE float,
	@TM0_NUMCAL float,
	@TM0_TIPFIS varchar(20),
	@TM0_FUMA varchar(1),
	@TM0_QTCIG float,
	@TM0_QTTEMP float,
	@TM0_RG varchar(15),
	@TM0_LOCFIC varchar(30),
	@TM0_DESCRI image,
	@TM0_CODFUN varchar(5),
	@TM0_CC varchar(9),
	@TM0_DEPTO varchar(9),
	@TM0_COROLH varchar(1),
	@TM0_CORCAB varchar(1),
	@TM0_CORPEL varchar(1),
	@TM0_SERCP varchar(5),
	@TM0_UFCP varchar(2),
	@TM0_CLIENT varchar(6),
	@TM0_LOJA varchar(2),
	@TM0_ESTCIV varchar(1),
	@TM0_CPF varchar(11),
	@TM0_BITMAP varchar(8),
	@TM0_CODCID varchar(8),
	@TM0_TIPDEF varchar(1),
	@TM0_INDBIO varchar(1),
	@TM0_NUMCP varchar(7),
	@D_E_L_E_T_ varchar(1),
	@R_E_C_N_O_ int,
	@R_E_C_D_E_L_ int,
	@TM0_CTPCD varchar(1),
	@TM0_ZZDTPR varchar(8),
	@TM0_REGBIO varbinary,
	@TM0_NOMSOC varchar(40),
	@dt_criacao datetime,
	@dt_alteracao datetime

as


UPDATE [dbo].[TM0010]
   SET 
	TM0_FILIAL = @TM0_FILIAL,
	TM0_NUMFIC = @TM0_NUMFIC,
	TM0_CANDID = @TM0_CANDID,
	TM0_FILFUN = @TM0_FILFUN,
	TM0_MAT = @TM0_MAT,
	TM0_NUMDEP = @TM0_NUMDEP,
	TM0_NOMFIC = @TM0_NOMFIC,
	TM0_DTIMPL = @TM0_DTIMPL,
	TM0_DOADOR = @TM0_DOADOR,
	TM0_DTDOAC = @TM0_DTDOAC,
	TM0_SANGUE = @TM0_SANGUE,
	TM0_FATORH = @TM0_FATORH,
	TM0_FICANT = @TM0_FICANT,
	TM0_DTNASC = @TM0_DTNASC,
	TM0_SEXO = @TM0_SEXO,
	TM0_PESO = @TM0_PESO,
	TM0_ALTURA = @TM0_ALTURA,
	TM0_MASSA = @TM0_MASSA,
	TM0_ALTOLH = @TM0_ALTOLH,
	TM0_LMAMIL = @TM0_LMAMIL,
	TM0_ALTPUB = @TM0_ALTPUB,
	TM0_ALTJOE = @TM0_ALTJOE,
	TM0_ALTCOT = @TM0_ALTCOT,
	TM0_TAMBRA = @TM0_TAMBRA,
	TM0_TAMANT = @TM0_TAMANT,
	TM0_TAMMAO = @TM0_TAMMAO,
	TM0_COMPPE = @TM0_COMPPE,
	TM0_NUMCAL = @TM0_NUMCAL,
	TM0_TIPFIS = @TM0_TIPFIS,
	TM0_FUMA = @TM0_FUMA,
	TM0_QTCIG = @TM0_QTCIG,
	TM0_QTTEMP = @TM0_QTTEMP,
	TM0_RG = @TM0_RG,
	TM0_LOCFIC = @TM0_LOCFIC,
	TM0_DESCRI = @TM0_DESCRI,
	TM0_CODFUN = @TM0_CODFUN,
	TM0_CC = @TM0_CC,
	TM0_DEPTO = @TM0_DEPTO,
	TM0_COROLH = @TM0_COROLH,
	TM0_CORCAB = @TM0_CORCAB,
	TM0_CORPEL = @TM0_CORPEL,
	TM0_SERCP = @TM0_SERCP,
	TM0_UFCP = @TM0_UFCP,
	TM0_CLIENT = @TM0_CLIENT,
	TM0_LOJA = @TM0_LOJA,
	TM0_ESTCIV = @TM0_ESTCIV,
	TM0_CPF = @TM0_CPF,
	TM0_BITMAP = @TM0_BITMAP,
	TM0_CODCID = @TM0_CODCID,
	TM0_TIPDEF = @TM0_TIPDEF,
	TM0_INDBIO = @TM0_INDBIO,
	TM0_NUMCP = @TM0_NUMCP,
	D_E_L_E_T_ = @D_E_L_E_T_,
	R_E_C_D_E_L_ = @R_E_C_D_E_L_,
	TM0_CTPCD = @TM0_CTPCD,
	TM0_ZZDTPR = @TM0_ZZDTPR,
	TM0_REGBIO = @TM0_REGBIO,
	TM0_NOMSOC = @TM0_NOMSOC,
	dt_alteracao = GETDATE()

 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroTNY010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[sp_alteraRegistroTNY010]

@sk_destino int,

	@TNY_FILIAL varchar(2),
	@TNY_NUMFIC varchar(9),
	@TNY_DTINIC varchar(8),
	@TNY_HRINIC varchar(5),
	@TNY_DTFIM varchar(8),
	@TNY_HRFIM varchar(5),
	@TNY_GRPCID varchar(3),
	@TNY_CID varchar(8),
	@TNY_EMITEN varchar(12),
	@TNY_TIPAFA varchar(1),
	@TNY_CODAFA varchar(3),
	@TNY_TIPATE varchar(1),
	@TNY_OBSERV varchar(80),
	@TNY_NATEST varchar(10),
	@TNY_DTCONS varchar(8),
	@TNY_HRCONS varchar(5),
	@TNY_ENDERE varchar(30),
	@TNY_CODESP varchar(2),
	@TNY_CODABO varchar(3),
	@TNY_QTDIAS float,
	@TNY_DTSAID varchar(8),
	@TNY_DTALTA varchar(8),
	@TNY_DTSAI2 varchar(8),
	@TNY_DTALT2 varchar(8),
	@TNY_DTSAI3 varchar(8),
	@TNY_DTALT3 varchar(8),
	@TNY_INDMED varchar(1),
	@TNY_OCORRE varchar(1),
	@TNY_ACIDEN varchar(6),
	@TNY_AFRAIS varchar(2),
	@TNY_QTDTRA varchar(4),
	@TNY_ATEANT varchar(10),
	@TNY_USERGI varchar(17),
	@TNY_TPEFD varchar(2),
	@D_E_L_E_T_ varchar(1),
	@R_E_C_N_O_ int,
	@R_E_C_D_E_L_ int,
	@TNY_ZFLUIG varchar(30),
	@TNY_COMUOK varchar(2),
	@TNY_ZHOJE varchar(8)

as


UPDATE [dbo].[TNY010]
   SET 

	[TNY_FILIAL] = @TNY_FILIAL,
	[TNY_NUMFIC] = @TNY_NUMFIC,
	[TNY_DTINIC] = @TNY_DTINIC,
	[TNY_HRINIC] = @TNY_HRINIC,
	[TNY_DTFIM] = @TNY_DTFIM,
	[TNY_HRFIM] = @TNY_HRFIM,
	[TNY_GRPCID] = @TNY_GRPCID,
	[TNY_CID] = @TNY_CID,
	[TNY_EMITEN] = @TNY_EMITEN,
	[TNY_TIPAFA] = @TNY_TIPAFA,
	[TNY_CODAFA] = @TNY_CODAFA,
	[TNY_TIPATE] = @TNY_TIPATE,
	[TNY_OBSERV] = @TNY_OBSERV,
	[TNY_NATEST] = @TNY_NATEST,
	[TNY_DTCONS] = @TNY_DTCONS,
	[TNY_HRCONS] = @TNY_HRCONS,
	[TNY_ENDERE] = @TNY_ENDERE,
	[TNY_CODESP] = @TNY_CODESP,
	[TNY_CODABO] = @TNY_CODABO,
	[TNY_QTDIAS] = @TNY_QTDIAS,
	[TNY_DTSAID] = @TNY_DTSAID,
	[TNY_DTALTA] = @TNY_DTALTA,
	[TNY_DTSAI2] = @TNY_DTSAI2,
	[TNY_DTALT2] = @TNY_DTALT2,
	[TNY_DTSAI3] = @TNY_DTSAI3,
	[TNY_DTALT3] = @TNY_DTALT3,
	[TNY_INDMED] = @TNY_INDMED,
	[TNY_OCORRE] = @TNY_OCORRE,
	[TNY_ACIDEN] = @TNY_ACIDEN,
	[TNY_AFRAIS] = @TNY_AFRAIS,
	[TNY_QTDTRA] = @TNY_QTDTRA,
	[TNY_ATEANT] = @TNY_ATEANT,
	[TNY_USERGI] = @TNY_USERGI,
	[TNY_TPEFD] = @TNY_TPEFD,
	[D_E_L_E_T_] = @D_E_L_E_T_,
	--[R_E_C_N_O_] = @R_E_C_N_O_,
	[dt_alteracao]	= getdate(),
	[R_E_C_D_E_L_] = @R_E_C_D_E_L_,
	[TNY_ZFLUIG] = @TNY_ZFLUIG,
	[TNY_COMUOK] = @TNY_COMUOK,
	[TNY_ZHOJE] = @TNY_ZHOJE
	

	
 WHERE sk_destino = @sk_destino

GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroZE1010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE proc [dbo].[sp_alteraRegistroZE1010]

@sk_destino int
,@ZE1_FILIAL varchar(2)
,@ZE1_FILORI varchar(2)
,@ZE1_CC varchar(9)
,@ZE1_FILDES varchar(2)
,@ZE1_CODIGO varchar(20)
,@ZE1_ITEM varchar(4)
,@ZE1_FLUIG varchar(20)
,@ZE1_EMISSA varchar(8)
,@ZE1_PRODUT varchar(20)
,@ZE1_QUANT float
,@ZE1_ATENDI varchar(1)
,@ZE1_EMERGE varchar(1)
,@ZE1_NECESS varchar(8)
,@ZE1_QUJE float
,@ZE1_LOCAL varchar(2)
,@ZE1_QDTZE2 float
,@ZE1_QDTSC1 float
,@ZE1_OBSZE2 varbinary(max)
,@ZE1_OBSSC1 varbinary(max)
,@ZE1_STATUS varchar(1)
,@ZE1_SOLICI varchar(40)
,@ZE1_NOMESO varchar(50)
,@ZE1_MARK varchar(3)
,@ZE1_DTATU varchar(8)
,@ZE1_HRATU varchar(5)
,@ZE1_LOCALD varchar(2)
,@D_E_L_E_T_ varchar(1)
--,@R_E_C_N_O_ int
,@R_E_C_D_E_L_ int
,@ZE1_TPSOL varchar(1)
,@ZE1_COMPL varchar(200)
,@ZE1_NOS varchar(20)
,@ZE1_TPUSO varchar(1)
,@ZE1_STSWMS varchar(1)
,@ZE1_STSRM varchar(3)
,@ZE1_SC1QTD float
,@ZE1_SC7QTD float
,@ZE1_SD1QCO float
,@ZE1_ZE3QTD float
,@ZE1_ZE3QSE float
,@ZE1_NNTQTD float
,@ZE1_SD2QTD float
,@ZE1_SD1QPE float
,@ZE1_SD1QTR float
,@ZE1_SC6QTD float
,@ZE1_SD3QTD float
,@ZE1_DTINT varchar(8)

as


UPDATE [dbo].[ZE1010]
   SET [ZE1_FILIAL]		= @ZE1_FILIAL	 
      ,[ZE1_FILORI]		= @ZE1_FILORI	
      ,[ZE1_CC]			= @ZE1_CC		
      ,[ZE1_FILDES]		= @ZE1_FILDES	
      ,[ZE1_CODIGO]		= @ZE1_CODIGO	
      ,[ZE1_ITEM]		= @ZE1_ITEM	
      ,[ZE1_FLUIG]		= @ZE1_FLUIG	
      ,[ZE1_EMISSA]		= @ZE1_EMISSA	
      ,[ZE1_PRODUT]		= @ZE1_PRODUT	
      ,[ZE1_QUANT]		= @ZE1_QUANT	
      ,[ZE1_ATENDI]		= @ZE1_ATENDI	
      ,[ZE1_EMERGE]		= @ZE1_EMERGE	
      ,[ZE1_NECESS]		= @ZE1_NECESS	
      ,[ZE1_QUJE]		= @ZE1_QUJE	
      ,[ZE1_LOCAL]		= @ZE1_LOCAL	
      ,[ZE1_QDTZE2]		= @ZE1_QDTZE2	
      ,[ZE1_QDTSC1]		= @ZE1_QDTSC1	
      ,[ZE1_OBSZE2]		= @ZE1_OBSZE2	
      ,[ZE1_OBSSC1]		= @ZE1_OBSSC1	
      ,[ZE1_STATUS]		= @ZE1_STATUS	
      ,[ZE1_SOLICI]		= @ZE1_SOLICI	
      ,[ZE1_NOMESO]		= @ZE1_NOMESO	
      ,[ZE1_MARK]		= @ZE1_MARK	
      ,[ZE1_DTATU]		= @ZE1_DTATU	
      ,[ZE1_HRATU]		= @ZE1_HRATU	
      ,[ZE1_LOCALD]		= @ZE1_LOCALD	
      ,[D_E_L_E_T_]		= @D_E_L_E_T_	
      --,[R_E_C_N_O_]	= @R_E_C_N_O_
      ,[R_E_C_D_E_L_]	= @R_E_C_D_E_L_
      ,[ZE1_TPSOL]		= @ZE1_TPSOL	
      ,[ZE1_COMPL]		= @ZE1_COMPL	
      ,[ZE1_NOS]		= @ZE1_NOS	
      ,[ZE1_TPUSO]		= @ZE1_TPUSO	
      ,[ZE1_STSWMS]		= @ZE1_STSWMS	
	  ,ZE1_STSRM		= @ZE1_STSRM
	  ,ZE1_SC1QTD		= @ZE1_SC1QTD
	  ,ZE1_SC7QTD		= @ZE1_SC7QTD
	  ,ZE1_SD1QCO		= @ZE1_SD1QCO
	  ,ZE1_ZE3QTD		= @ZE1_ZE3QTD
	  ,ZE1_ZE3QSE		= @ZE1_ZE3QSE
	  ,ZE1_NNTQTD		= @ZE1_NNTQTD
	  ,ZE1_SD2QTD		= @ZE1_SD2QTD
	  ,ZE1_SD1QPE		= @ZE1_SD1QPE
	  ,ZE1_SD1QTR		= @ZE1_SD1QTR
	  ,ZE1_SC6QTD		= @ZE1_SC6QTD
	  ,ZE1_SD3QTD		= @ZE1_SD3QTD
	  ,ZE1_DTINT		= @ZE1_DTINT
      ,[dt_alteracao]	= getdate()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroZE3010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[sp_alteraRegistroZE3010]
@sk_destino int
,@ZE3_FILIAL varchar(2)
,@ZE3_ITEMRQ varchar(4)
,@ZE3_PRODUT varchar(20)
,@ZE3_QUANT float
,@ZE3_QDESEP float
,@ZE3_ORIGEM varchar(20)
,@ZE3_DESTIN varchar(20)
,@ZE3_DTSEPA varchar(8)
,@ZE3_USERSE varchar(20)
,@ZE3_OBS varbinary(max)
,@ZE3_LOCAL varchar(2)
,@ZE3_STATUS varchar(1)
,@ZE3_USER varchar(20)
,@ZE3_NUMST varchar(10)
,@ZE3_EMPEDI float
,@ZE3_EMREQU float
,@ZE3_EMTRAN float
,@ZE3_IDPEDI varchar(25)
,@ZE3_IDSOLT varchar(25)
,@ZE3_IDREQU varchar(25)
,@ZE3_DTATEN varchar(8)
,@ZE3_HORAAT varchar(8)
,@ZE3_USUATE varchar(10)
,@ZE3_IDTRAN varchar(30)
,@ZE3_CC varchar(9)
,@ZE3_EMISSA varchar(8)
,@ZE3_LOCALD varchar(2)
,@ZE3_CTLREN varchar(1)
,@D_E_L_E_T_ varchar(1)
--,@R_E_C_N_O_ int
,@R_E_C_D_E_L_ int
,@ZE3_ITEM varchar(4)
,@ZE3_CODRQ varchar(20)

as

UPDATE [dbo].[ZE3010]
   SET [ZE3_FILIAL]		= @ZE3_FILIAL		
      ,[ZE3_ITEM]		= @ZE3_ITEM		
      ,[ZE3_CODRQ]		= @ZE3_CODRQ		
      ,[ZE3_ITEMRQ]		= @ZE3_ITEMRQ		
      ,[ZE3_PRODUT]		= @ZE3_PRODUT		
      ,[ZE3_QUANT]		= @ZE3_QUANT		
      ,[ZE3_QDESEP]		= @ZE3_QDESEP		
      ,[ZE3_ORIGEM]		= @ZE3_ORIGEM		
      ,[ZE3_DESTIN]		= @ZE3_DESTIN		
      ,[ZE3_DTSEPA]		= @ZE3_DTSEPA		
      ,[ZE3_USERSE]		= @ZE3_USERSE		
      ,[ZE3_OBS]		= @ZE3_OBS		
      ,[ZE3_LOCAL]		= @ZE3_LOCAL		
      ,[ZE3_STATUS]		= @ZE3_STATUS		
      ,[ZE3_USER]		= @ZE3_USER		
      ,[ZE3_NUMST]		= @ZE3_NUMST		
      ,[ZE3_EMPEDI]		= @ZE3_EMPEDI		
      ,[ZE3_EMREQU]		= @ZE3_EMREQU		
      ,[ZE3_EMTRAN]		= @ZE3_EMTRAN		
      ,[ZE3_IDPEDI]		= @ZE3_IDPEDI		
      ,[ZE3_IDSOLT]		= @ZE3_IDSOLT		
      ,[ZE3_IDREQU]		= @ZE3_IDREQU		
      ,[ZE3_DTATEN]		= @ZE3_DTATEN		
      ,[ZE3_HORAAT]		= @ZE3_HORAAT		
      ,[ZE3_USUATE]		= @ZE3_USUATE		
      ,[ZE3_IDTRAN]		= @ZE3_IDTRAN		
      ,[ZE3_CC]			= @ZE3_CC			
      ,[ZE3_EMISSA]		= @ZE3_EMISSA		
      ,[ZE3_LOCALD]		= @ZE3_LOCALD		
      ,[ZE3_CTLREN]		= @ZE3_CTLREN		
      ,[D_E_L_E_T_]		= @D_E_L_E_T_		
      --,[R_E_C_N_O_]		= @R_E_C_N_O_		
      ,[R_E_C_D_E_L_]	= @R_E_C_D_E_L_	
      ,[dt_alteracao]	= GETDATE()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroZNI010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_alteraRegistroZNI010]

@sk_destino int
,@ZNI_FILIAL	varchar(2)
,@ZNI_CODMNT	varchar(9)
,@ZNI_EMISSA	varchar(8)
,@ZNI_CODVOL	varchar(15)
,@ZNI_NUMREQ	varchar(6)
,@ZNI_CC	varchar(9)
,@ZNI_ORDEXP	varchar(9)
,@ZNI_FILDES	varchar(2)
,@ZNI_STATUS	varchar(1)
,@ZNI_LOCVOL	varchar(15)
,@D_E_L_E_T_	varchar(1)	
,@R_E_C_D_E_L_	bigint		

as


UPDATE [dbo].[ZNI010]
   SET 

	 ZNI_FILIAL    = @ZNI_FILIAL	
	 ,ZNI_CODMNT   = @ZNI_CODMNT	
	 ,ZNI_EMISSA   = @ZNI_EMISSA	
	 ,ZNI_CODVOL   = @ZNI_CODVOL	
	 ,ZNI_NUMREQ   = @ZNI_NUMREQ	
	 ,ZNI_CC	   = @ZNI_CC
	 ,ZNI_ORDEXP   = @ZNI_ORDEXP	
	 ,ZNI_FILDES   = @ZNI_FILDES	
	 ,ZNI_STATUS   = @ZNI_STATUS	
	 ,ZNI_LOCVOL   = @ZNI_LOCVOL	
	 ,D_E_L_E_T_   = @D_E_L_E_T_	
	 ,R_E_C_D_E_L_ = @R_E_C_D_E_L_
	 ,dt_alteracao = getdate()

	
 WHERE sk_destino = @sk_destino

GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroZNJ010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_alteraRegistroZNJ010]

@sk_destino int
,@ZNJ_FILIAL	varchar(2)
,@ZNJ_CODMNT	varchar(9)
,@ZNJ_ITEM	    varchar(4)
,@ZNJ_CODPRO	varchar(15)
,@ZNJ_QTORIG	float	
,@D_E_L_E_T_	varchar(1)
,@R_E_C_N_O_	INT	
,@R_E_C_D_E_L_	bigint	

as


UPDATE [dbo].[ZNJ010]
   SET 

	 ZNJ_FILIAL   =  @ZNJ_FILIAL  
	 ,ZNJ_CODMNT   = @ZNJ_CODMNT  
	 ,ZNJ_ITEM	   = @ZNJ_ITEM	  
	 ,ZNJ_CODPRO   = @ZNJ_CODPRO  
	 ,ZNJ_QTORIG   = @ZNJ_QTORIG  
	 ,D_E_L_E_T_   = @D_E_L_E_T_   
	 ,R_E_C_D_E_L_ = @R_E_C_D_E_L_	
	 ,dt_alteracao = getdate()

	
 WHERE sk_destino = @sk_destino

GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroZNL010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_alteraRegistroZNL010]

@sk_destino int
,@ZNL_FILIAL	varchar(2)
,@ZNL_CODMNT	varchar(9)
,@ZNL_ITEM	varchar(4)
,@ZNL_CODPRO	varchar(15)
,@ZNL_LOCAL	varchar(2)
,@ZNL_ENDERE	varchar(15)
,@ZNL_QTSEPA	float	
,@ZNL_RESERV	varchar	(6)
,@D_E_L_E_T_	varchar	(1)
,@R_E_C_D_E_L_	bigint	

as


UPDATE [dbo].[ZNL010]
   SET 

	 ZNL_FILIAL	   = @ZNL_FILIAL
	 ,ZNL_CODMNT   = @ZNL_CODMNT  
	 ,ZNL_ITEM	   = @ZNL_ITEM	  
	 ,ZNL_CODPRO   = @ZNL_CODPRO  
	 ,ZNL_LOCAL	   = @ZNL_LOCAL	  
	 ,ZNL_ENDERE   = @ZNL_ENDERE  
	 ,ZNL_QTSEPA   = @ZNL_QTSEPA  
	 ,ZNL_RESERV   = @ZNL_RESERV  
	 ,D_E_L_E_T_   = @D_E_L_E_T_  
	 ,R_E_C_D_E_L_ = @R_E_C_D_E_L_
	 ,dt_alteracao = getdate()

	
 WHERE sk_destino = @sk_destino

GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroZNM010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_alteraRegistroZNM010]

@sk_destino int
,@ZNM_FILIAL	varchar(2)
,@ZNM_ORDEXP	varchar(9)
,@ZNM_EMISSA	varchar(8)
,@ZNM_CCUSTO	varchar(9)
,@ZNM_FILDES	varchar(2)
,@ZNM_TIPDOC	varchar(2)
,@ZNM_USRGER	varchar(25)
,@ZNM_NUMDOC	varchar(10)
,@D_E_L_E_T_	varchar(1)
,@R_E_C_D_E_L_	bigint
,@ZNM_PEDREM	varchar(6)
,@ZNM_TRANSP	varchar(6)

as


UPDATE [dbo].[ZNM010]
   SET 

	 ZNM_FILIAL   = @ZNM_FILIAL
	 ,ZNM_ORDEXP   = @ZNM_ORDEXP
	 ,ZNM_EMISSA   = @ZNM_EMISSA
	 ,ZNM_CCUSTO   = @ZNM_CCUSTO
	 ,ZNM_FILDES   = @ZNM_FILDES
	 ,ZNM_TIPDOC   = @ZNM_TIPDOC
	 ,ZNM_USRGER   = @ZNM_USRGER
	 ,ZNM_NUMDOC   = @ZNM_NUMDOC
	 ,D_E_L_E_T_   = @D_E_L_E_T_
	 ,R_E_C_D_E_L_ = @R_E_C_D_E_L_
	 ,ZNM_PEDREM   = @ZNM_PEDREM
	 ,ZNM_TRANSP   = @ZNM_TRANSP
	 ,dt_alteracao = getdate()

	
 WHERE sk_destino = @sk_destino

GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroZNQ010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_alteraRegistroZNQ010]

@sk_destino int
,@ZNQ_FILIAL	varchar(2)
,@ZNQ_CODMNT	varchar(9)
,@ZNQ_ITEM	    varchar(4)
,@ZNQ_CODPRO	varchar(15)
,@ZNQ_LOCAL	    varchar(2)
,@ZNQ_ENDERE	varchar(15)
,@ZNQ_TAROFT	varchar(15)
,@ZNQ_REQSEP	varchar(20)
,@ZNQ_ITREQ	    varchar(4)
,@ZNQ_QTSEPA	float
,@D_E_L_E_T_	varchar(1)
,@R_E_C_D_E_L_	bigint

as


UPDATE [dbo].[ZNQ010]
   SET 

	 ZNQ_FILIAL   = @ZNQ_FILIAL  
	 ,ZNQ_CODMNT   = @ZNQ_CODMNT  
	 ,ZNQ_ITEM	   = @ZNQ_ITEM	  
	 ,ZNQ_CODPRO   = @ZNQ_CODPRO  
	 ,ZNQ_LOCAL	   = @ZNQ_LOCAL	  
	 ,ZNQ_ENDERE   = @ZNQ_ENDERE  
	 ,ZNQ_TAROFT   = @ZNQ_TAROFT  
	 ,ZNQ_REQSEP   = @ZNQ_REQSEP  
	 ,ZNQ_ITREQ	   = @ZNQ_ITREQ	  
	 ,ZNQ_QTSEPA   = @ZNQ_QTSEPA  
	 ,D_E_L_E_T_   = @D_E_L_E_T_  
	 ,R_E_C_D_E_L_ = @R_E_C_D_E_L_
	 ,dt_alteracao = getdate()

	
 WHERE sk_destino = @sk_destino

GO
/****** Object:  StoredProcedure [dbo].[sp_alteraRegistroZX5010]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create proc [dbo].[sp_alteraRegistroZX5010]
@sk_destino int
,@D_E_L_E_T_ varchar(1)
,@R_E_C_D_E_L_ bigint
,@ZX5_TABELA varchar(2)
,@ZX5_CHAVE varchar(6)
,@ZX5_CONTEU varchar(50)

as


UPDATE [dbo].[ZX5010]
   SET 
	    ZX5_TABELA= @ZX5_TABELA
	  ,ZX5_CHAVE = @ZX5_CHAVE 
	  ,ZX5_CONTEU= @ZX5_CONTEU
      ,[D_E_L_E_T_]		= @D_E_L_E_T_
      ,[R_E_C_D_E_L_]	= @R_E_C_D_E_L_
      ,[dt_alteracao]	= getdate()
 WHERE sk_destino = @sk_destino
GO
/****** Object:  StoredProcedure [dbo].[sp_retornaParametro]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

















CREATE procedure [dbo].[sp_retornaParametro](@nm_tabela as varchar(100) = null)

as

declare @parametros table (
nm_tabela varchar(100) primary key,
dt_inicio date
)

declare @hora int
set @hora = (select datepart(hour, getdate()));

insert into @parametros values 
('NNS010',getdate()-360),
('SC5010',getdate()-360),
('SF1010',getdate()-360),
('SF2010',getdate()-360),
('NNT010',getdate()-360),
('SD1010',getdate()-360),
('SD2010',getdate()-360),
('SC6010',getdate()-360),
('SC7010',getdate()-360),
('SB2010',getdate()-360),
('ZE1010',getdate()-360),
('ZE3010',getdate()-360),
('SC1010',getdate()-360),
('SCP010',getdate()-360),
('SD3010',getdate()-360)


--- se for entre 0 e 5 da manhã, recarrega tudo
if @hora between 0 and 5
	begin
		select '0' as dt_parametro
	end

--- se não encontrar a tabela parametro solicitada, recarrrega tudo
else if (select count(*) from @parametros where nm_tabela = @nm_tabela) = 0 
	begin
		select '0' as dt_parametro
	end

--- retorna o parametro da tabela solicitada
else
	begin
		select --'0'
		dt_parametro = 
			convert(varchar,year(dt_inicio))+
			iif(month(dt_inicio)<10,'0'+convert(varchar,month(dt_inicio)),convert(varchar,month(dt_inicio)))+
			iif(day(dt_inicio)<10,'0'+convert(varchar,day(dt_inicio)),convert(varchar,day(dt_inicio)))
		from @parametros
		where nm_tabela = @nm_tabela
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_retornaParametroRPA]    Script Date: 24/01/2024 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[sp_retornaParametroRPA](@nm_tabela as varchar(100) = null)

as

declare @parametros table (
nm_tabela varchar(100) primary key,
dt_inicio date
)

declare @hora int
set @hora = (select datepart(hour, getdate()));

insert into @parametros values 
('LogRPA',getdate()-180)
,('Nao Processados',getdate()-180)
,('Processados',getdate()-180)
,('Erros',getdate()-180)
,('Arquivos Nao Processados',getdate()-180)
,('Arquivos Processados',getdate()-180)
,('Gestao de Bots',getdate()-180)


--- se for entre 0 e 4 da manhã, recarrega tudo
if @hora between 0 and 4
	begin
		select '0' as dt_parametro
	end

--- se não encontrar a tabela parametro solicitada, recarrrega tudo
else if (select count(*) from @parametros where nm_tabela = @nm_tabela) = 0 
	begin
		select '0' as dt_parametro
	end

--- retorna o parametro da tabela solicitada
else
	begin
		select --'0'
		dt_parametro = 
			convert(varchar,year(dt_inicio))+
			iif(month(dt_inicio)<10,'0'+convert(varchar,month(dt_inicio)),convert(varchar,month(dt_inicio)))+
			iif(day(dt_inicio)<10,'0'+convert(varchar,day(dt_inicio)),convert(varchar,day(dt_inicio)))
		from @parametros
		where nm_tabela = @nm_tabela
	end


GO
