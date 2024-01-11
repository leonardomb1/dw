SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [sup].[vw_rel_recebimento]
AS
WITH CONS 
AS
(
SELECT
	ZNH_FILIAL AS [Filial],
	SUBSTRING(ZNH_CHVNFE, 26, 9) AS [Num NF],
	ZNF_NOME AS [Fornecedor],
	CASE ZNG_STATUS 
		WHEN '1' THEN 'Não Iniciado'
		WHEN '2' THEN 'Pre Conferido'
		WHEN '3' THEN 'Em Conferência WMS'
		WHEN '4' THEN 'Doc. Recusado Div'
		WHEN '5' THEN 'Doc. Classif.'
		WHEN '6' THEN 'Inconsistência Recebimento'
		WHEN '7' THEN 'Doc. Recusado'
		WHEN '8' THEN 'Armazenamento WMS'
		WHEN 'A' THEN 'Concluído WMS'
		WHEN '9' THEN 'Inconsistência Armazenamento' 
		WHEN 'B' THEN 'Doc. Cancelado Sefaz'
		WHEN 'C' THEN 'Receb. Outra Rotina'
		ELSE NULL END AS [Sts Receb],
	ZNH_COD AS [Cod Prod],
	ZNH_DESFOR AS [Ds Forn],
	B1_DESC AS [Ds Curta RIP],
	ZNH_NCMSH AS [NCM],
	C1_NUM  AS [Num SC],
	C1_ITEM AS [Item SC],
	ZNH_PEDIDO AS [Pedido],
	ZNH_ITEMPC AS [Item PC],
	ZNH_TES AS [TES Pre Nota],
	F4_TEXTO AS [Desc TES Pre Nota],
	RIGHT(ZE1_CODIGO, 6) AS [Cod RM],
	ZE1_ITEM AS [Item RM],
	ZE1_FLUIG AS [Fluig],
	CASE ZE1_EMERGE
		WHEN 0 THEN 'Não Emergencial'
		WHEN 1 THEN 'Mobilização Obra'
		WHEN 2 THEN 'Aumento de Escopo'
		WHEN 3 THEN 'Aumento de Efetivo'
		WHEN 4 THEN 'Aceleração Obra'
		WHEN 5 THEN 'Serviços Extras'
		WHEN 6 THEN 'Solicitação do Cliente' 
		ELSE '' END AS [Tipo Emergência],
	CASE 
		WHEN ZE1_QDTZE2 = 0 AND ZE1_QDTSC1 = 0 AND ZE1_STATUS NOT IN ('O', 'P') THEN 'Em Aberto'
		WHEN ZE1_QDTZE2 > 0 AND ZE1_QDTSC1 = 0 AND ZE1_STATUS NOT IN ('O', 'P') THEN 'Em Atendimento Estoque'
		WHEN ZE1_QDTZE2 = 0 AND ZE1_QDTSC1 > 0 AND ZE1_STATUS NOT IN ('O', 'P') THEN 'Em Atendimento Compras'
		WHEN ZE1_QDTZE2 > 0 AND ZE1_QDTSC1 > 0 AND ZE1_STATUS NOT IN ('O', 'P') THEN 'Em Atendimento Estoque/Compras'
		WHEN ZE1_STATUS = 'O' THEN 'Encerrada'
		WHEN ZE1_STATUS = 'P' THEN 'Eliminado Resíduo'
		ELSE NULL END AS [Status RM],
	CASE
		WHEN ZE1_QDTSC1 = 0 AND ZE1_SC7QTD = 0 AND ZE1_SD1QCO = 0 THEN ''
		WHEN ZE1_QDTSC1 > 0 AND ZE1_SC7QTD = 0 AND ZE1_SD1QCO = 0 AND (ZE1_QDTSC1 < ZE1_QUANT) THEN 'Solicitado p/ Compra Parcial'
		WHEN ZE1_QDTSC1 > 0 AND ZE1_SC7QTD = 0 AND ZE1_SD1QCO = 0 AND (ZE1_QDTSC1 >= ZE1_QUANT) THEN 'Solicitado p/ Compra Total'
		WHEN ZE1_QDTSC1 > 0 AND ZE1_SC7QTD > 0 AND ZE1_SD1QCO = 0 AND (ZE1_SC7QTD < ZE1_QUANT) THEN 'Ped Compra Emitido Parcial'
		WHEN ZE1_QDTSC1 > 0 AND ZE1_SC7QTD > 0 AND ZE1_SD1QCO = 0 AND (ZE1_SC7QTD >= ZE1_QUANT) THEN 'Ped Compra Emitido Total'
		WHEN ZE1_QDTSC1 > 0 AND ZE1_SC7QTD > 0 AND ZE1_SD1QCO > 0 AND (ZE1_SD1QCO < ZE1_QUANT) THEN 'Nota Fiscal Recebida Parcial'
		WHEN ZE1_QDTSC1 > 0 AND ZE1_SC7QTD > 0 AND ZE1_SD1QCO > 0 AND (ZE1_SD1QCO >= ZE1_QUANT) THEN 'Nota Fiscal Recebida Total'
		ELSE NULL END AS [Status Receb],
	CASE
		WHEN LEFT(ZE1_CC,3) = '999' AND ZE3_STATUS <> 'SA' AND (ZE1_QDTZE2 < ZE1_QUANT) AND ZE1_STATUS <> 'O' THEN 'Pendente Baixa SA - Sep Parcial'
		WHEN LEFT(ZE1_CC,3) = '999' AND ZE3_STATUS <> 'SA' AND (ZE1_QDTZE2 >= ZE1_QUANT) AND ZE1_STATUS <> 'O' THEN 'Pendente Baixa SA - Sep Total'
		WHEN LEFT(ZE1_CC,3) = '999' AND ZE3_STATUS = 'SA' AND (ZE1_QDTZE2 < ZE1_QUANT)  THEN 'Baixado SA - Sep. Parcial'
		WHEN LEFT(ZE1_CC,3) = '999' AND ZE3_STATUS = 'SA' AND (ZE1_QUANT >= ZE1_QDTZE2)  THEN 'Baixado SA - Sep. Total'
		WHEN LEFT(ZE1_CC,3) <> '999' AND ZE1_NNTQTD = 0 AND ZE1_SD2QTD = 0 THEN NULL
		WHEN LEFT(ZE1_CC,3) <> '999' AND ZE1_NNTQTD > 0 AND ZE1_SD2QTD = 0 AND (ZE1_QUANT > ZE1_NNTQTD) THEN 'Em Solic Transf - Sep. Parcial'
		WHEN LEFT(ZE1_CC,3) <> '999' AND ZE1_NNTQTD > 0 AND ZE1_SD2QTD = 0 AND (ZE1_QUANT <= ZE1_NNTQTD) THEN 'Em Solic Transf - Sep. Total'
		WHEN LEFT(ZE1_CC,3) <> '999' AND ZE1_NNTQTD > 0 AND ZE1_SD2QTD > 0 AND (ZE1_QUANT > ZE1_SD2QTD) THEN 'Em Nota Transf - Sep. Parcial'
		WHEN LEFT(ZE1_CC,3) <> '999' AND ZE1_NNTQTD > 0 AND ZE1_SD2QTD > 0 AND (ZE1_QUANT <= ZE1_SD2QTD) THEN 'Em Nota Transf - Sep. Total'
		ELSE NULL	END AS [Status Envio],
	ZE1_CC AS [Centro Custo],
	CTT_DESC01 AS [Desc CR],
	C1_LOJA AS [Loja],
	C1_FORNECE AS [Cod Forn],
	C1_SOLICIT AS [Nm Solic],
	CASE ZNF_DTEMIS WHEN '' THEN NULL ELSE CONVERT(DATE,ZNF_DTEMIS, 103) END AS [Dt Emissao],
	CASE ZNF_DTDIG  WHEN '' THEN NULL ELSE CONVERT(DATE,ZNF_DTDIG, 103)  END AS [Dt Digit],
	CASE ZE1_EMISSA WHEN '' THEN NULL ELSE CONVERT(DATE,ZE1_EMISSA, 103) END AS [Dt Emi Fluig],
	CASE ZE1_DTINT  WHEN '' THEN NULL ELSE CONVERT(DATE,ZE1_DTINT, 103)  END AS [Dt Int Fluig],
	C1_CC AS [CR SC],
	CASE ZNF_SITNFE 
		WHEN '3' THEN 'NF Cancelada' 
		WHEN '9' THEN 'NF Verificar SEFAZ'
		WHEN '1' THEN 'Uso Autorizado' 
		ELSE 'Uso Denegado' END AS [Sit NF],
	CASE C1_OBS WHEN '' THEN NULL ELSE C1_OBS END AS [Obs SC],
	CASE ZNF_ZZPRO WHEN '' THEN NULL ELSE ZNF_ZZPRO END AS [Bipe NF],
	CASE ZNF_USR WHEN '' THEN NULL ELSE ZNF_USR END AS [Bipe Usr],
	CASE ZNF_OBS WHEN '' THEN NULL ELSE ZNF_OBS END AS [Obs Fiscal],
	CASE 
		WHEN C7_NUMSC = '' AND C1_ZCODZE1 = '' THEN 'Inclusão PC'
		WHEN C7_NUMSC <> '' AND C1_ZCODZE1 = '' THEN 'Inclusão SC'
		ELSE NULL END AS [Verif SC],
	ZNH_QUANT AS [Qtd Pre Nota],
	ZE1_QUANT AS [Qtd Solic],
	ZE1_QDTZE2 AS [Qtd Separado],
	ZNQ_QTSEPA AS [Qtd Separ WMS],
	B2_QATU AS [Qtd Estoq],
	CASE B2_USAI WHEN '' THEN NULL ELSE CONVERT(DATE, B2_USAI, 103) END AS [Dt Ult Saida Estoque]
--TABELAS
FROM [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.ZNH010 ZH WITH(NOLOCK)
	INNER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.ZNF010 ZF WITH(NOLOCK)
	ON ZNH_CHVNFE = ZNF_CHAVE AND ZF.D_E_L_E_T_ = '' AND ZNF_TPDOC = 'NF-e'
	LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SB1010 B1 WITH(NOLOCK)
	ON ZNH_COD = B1_COD AND B1.D_E_L_E_T_= ''
	LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SC7010 C7 WITH(NOLOCK)
	ON (C7_NUM + C7_ITEM + C7_FILENT) = (ZNH_PEDIDO + ZNH_ITEMPC + ZNH_FILIAL) AND C7.D_E_L_E_T_ = ''
	LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SC1010 C1 WITH(NOLOCK)
	ON (C7_NUMSC + C7_ITEMSC + C7_FILIAL) = (C1_NUM + C1_ITEM + C1_FILIAL) AND C1.D_E_L_E_T_ = ''
	LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.ZE1010 Z1 WITH(NOLOCK)
	ON (C1_ZCODZE1 + C1_ZITEZE1 + C1_FILIAL) = (ZE1_CODIGO + ZE1_ITEM + ZE1_FILORI) AND Z1.D_E_L_E_T_ = ''
	LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.CTT010 CT WITH(NOLOCK)
	ON CTT_CUSTO = ZE1_CC AND CT.D_E_L_E_T_ = ''
	LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.ZNG010 ZG WITH(NOLOCK)
	ON ZNG_CHVNFE = ZNH_CHVNFE AND ZG.D_E_L_E_T_ = ''
	LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SF4010 F4 WITH(NOLOCK)
	ON ZNH_TES = F4_CODIGO AND F4.D_E_L_E_T_ = ''
	LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SB2010 B2 WITH(NOLOCK)
	ON B2_COD = B1_COD AND B2.D_E_L_E_T_ = '' AND B2_LOCAL = '01' AND B2_FILIAL = '10'
	LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.ZNQ010 ZN WITH(NOLOCK)
	ON (ZE1_CODIGO + ZE1_ITEM + ZE1_FILORI) = (ZNQ_REQSEP + ZNQ_ITREQ + ZNQ_FILIAL) AND ZN.D_E_L_E_T_ = ''
	LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.ZE3010 ZE3 WITH(NOLOCK)
	ON (ZE3_CODRQ + ZE3_ITEMRQ + ZE3_FILIAL) = (ZE1_CODIGO + ZE1_ITEM + ZE1_FILORI) AND ZE3.D_E_L_E_T_ = ''
--CONDIÇÕES
WHERE ZH.D_E_L_E_T_ = '' AND ZNH_PEDIDO <> '' AND ZNH_ITEMPC <> '' AND CONVERT(DATE, ZNF_DTEMIS, 103) > GETDATE() - 180 AND ZNH_FILIAL = '10' 
),

AGGR AS
(
SELECT
	[Filial]
	,[Num NF]
	,[Fornecedor]
	,[Sts Receb]
	,[Cod Prod]
	,[Ds Forn]
	,[Ds Curta RIP]
	,[NCM]
	,[Pedido]
	,[Item PC]
	,[TES Pre Nota]
	,[Desc TES Pre Nota]
	,[Cod RM]
	,[Item RM]
	,[Fluig]
	,[Tipo Emergência]
	,[Status RM]
	,[Status Receb]
	,[Status Envio]
	,[Centro Custo]
	,[Desc CR]
	,[Loja]
	,[Cod Forn]
	,[Nm Solic]
	,[Dt Emissao]
	,[Dt Digit]
	,[Dt Emi Fluig]
	,[Dt Int Fluig]
	,[CR SC]
	,[Sit NF]
	,[Obs SC]
	,[Bipe NF]
	,[Bipe Usr]
	,[Obs Fiscal]
	,[Verif SC]
	,SUM([Qtd Pre Nota]) AS [Qtd Pre Nota]
	,[Qtd Solic]
	,[Qtd Separado]
	,[Qtd Separ WMS]
	,[Qtd Estoq]
	,[Dt Ult Saida Estoque]
FROM CONS
--GRUPAMENTO
GROUP BY
	[Filial]
	,[Num NF]
	,[Fornecedor]
	,[Sts Receb]
	,[Cod Prod]
	,[Ds Forn]
	,[Ds Curta RIP]
	,[NCM]
	,[Pedido]
	,[Item PC]
	,[TES Pre Nota]
	,[Desc TES Pre Nota]
	,[Cod RM]
	,[Item RM]
	,[Fluig]
	,[Tipo Emergência]
	,[Status RM]
	,[Status Receb]
	,[Status Envio]
	,[Centro Custo]
	,[Desc CR]
	,[Loja]
	,[Cod Forn]
	,[Nm Solic]
	,[Dt Emissao]
	,[Dt Digit]
	,[Dt Emi Fluig]
	,[Dt Int Fluig]
	,[CR SC]
	,[Sit NF]
	,[Obs SC]
	,[Bipe NF]
	,[Bipe Usr]
	,[Obs Fiscal]
	,[Verif SC]
	,[Qtd Solic]
	,[Qtd Separado]
	,[Qtd Separ WMS]
	,[Qtd Estoq]
	,[Dt Ult Saida Estoque]
)

SELECT
	*,
	IIF(([Qtd Solic] - [Qtd Separado] - [Qtd Pre Nota]) < 0, ([Qtd Solic] - [Qtd Separado]),  [Qtd Pre Nota]) AS [Qtd P/ Separar Pre NF],
	([Qtd Solic] - [Qtd Separado]) AS [Qtd Pendente RM]
FROM AGGR

GO
