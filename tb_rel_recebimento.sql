SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_rel_recebimento](
	[pk_dest] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial] [varchar](2) NULL,
	[cd_armazem] [varchar](2) NULL,
	[cd_nf] [varchar](9) NULL,
	[nm_fornecedor] [varchar](60) NULL,
	[tp_receb] [varchar](28) NULL,
	[cd_produto] [varchar](15) NULL,
	[ds_prodForn] [varchar](30) NULL,
	[ds_prodRip] [varchar](100) NULL,
	[cd_ncm] [varchar](10) NULL,
	[cd_pedido] [varchar](6) NULL,
	[cd_itemPedido] [varchar](4) NULL,
	[cd_tes] [varchar](3) NULL,
	[ds_tes] [varchar](20) NULL,
	[cd_rm] [varchar](6) NULL,
	[cd_itemRm] [varchar](4) NULL,
	[cd_fluig] [varchar](20) NULL,
	[tp_emerg] [varchar](22) NULL,
	[tp_rm] [varchar](30) NULL,
	[tp_entrada] [varchar](28) NULL,
	[tp_envio] [varchar](31) NULL,
	[cd_cr] [varchar](9) NULL,
	[ds_cr] [varchar](40) NULL,
	[cd_loja] [varchar](2) NULL,
	[cd_forn] [varchar](6) NULL,
	[nm_solic] [varchar](25) NULL,
	[dt_emissa] [date] NULL,
	[dt_digit] [date] NULL,
	[dt_emiFluig] [date] NULL,
	[dt_intFluig] [date] NULL,
	[dt_envFluig] [date] NULL,
	[cd_crSc] [varchar](9) NULL,
	[tp_sitNf] [varchar](18) NULL,
	[ds_obsSc] [varchar](200) NULL,
	[nm_usrConf] [varchar](20) NULL,
	[cd_tktFiscal] [varchar](8) NULL,
	[ds_tktFiscal] [varchar](200) NULL,
	[ds_bipeNf] [varchar](55) NULL,
	[nm_usrBipe] [varchar](30) NULL,
	[ds_obsFiscal] [varchar](250) NULL,
	[fl_verifSc] [varchar](11) NULL,
	[qt_preNota] [float] NULL,
	[vl_unPreNota] [float] NULL,
	[qt_solic] [float] NULL,
	[qt_separado] [float] NULL,
	[qt_separWms] [float] NULL,
	[qt_estoque] [float] NULL,
	[dt_ultSaida] [date] NULL,
	[qt_separNf] [float] NULL,
	[qt_pendenteRm] [float] NULL,
	[dt_criacao] [datetime] NULL,
 CONSTRAINT [pk_rel_recebimento] PRIMARY KEY CLUSTERED 
(
	[pk_dest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_rel_recebimento] ADD  CONSTRAINT [default_dt_criacao]  DEFAULT (getdate()) FOR [dt_criacao]
GO


