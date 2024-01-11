SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [sup].[vw_rel_separacao]

AS

WITH CONSTRUCAO

AS
(
SELECT
	
	ZE3_STATUS,
	(ZE1_CODIGO + ZE1_ITEM + ZE1_FILDES + ZE1_FLUIG) AS [Chave RM],
	ZE1_FILDES AS [Filial],
	ZE1_CC AS [Centro Custo],
	CTT_DESC01 AS [Desc CR],
	ZE1_PRODUT AS [Produto],
	B5_CEME AS [Desc Prod],
	CASE 
		WHEN ZE1_QDTZE2 = 0 AND ZE1_QDTSC1 = 0 AND ZE1_STATUS NOT IN ('O', 'P') THEN 'Em Aberto'
		WHEN ZE1_QDTZE2 > 0 AND ZE1_QDTSC1 = 0 AND ZE1_STATUS NOT IN ('O', 'P') THEN 'Em Atendimento Estoque'
		WHEN ZE1_QDTZE2 = 0 AND ZE1_QDTSC1 > 0 AND ZE1_STATUS NOT IN ('O', 'P') THEN 'Em Atendimento Compras'
		WHEN ZE1_QDTZE2 > 0 AND ZE1_QDTSC1 > 0 AND ZE1_STATUS NOT IN ('O', 'P') THEN 'Em Atendimento Estoque/Compras'
		WHEN ZE1_STATUS = 'O' THEN 'Encerrada'
		WHEN ZE1_STATUS = 'P' THEN 'Eliminado Resíduo'
		ELSE '' END AS [Status RM],
	CASE
		WHEN ZE1_QDTSC1 = 0 AND ZE1_SC7QTD = 0 AND ZE1_SD1QCO = 0 THEN ''
		WHEN ZE1_QDTSC1 > 0 AND ZE1_SC7QTD = 0 AND ZE1_SD1QCO = 0 AND (ZE1_QDTSC1 < ZE1_QUANT) THEN 'Solicitado p/ Compra Parcial'
		WHEN ZE1_QDTSC1 > 0 AND ZE1_SC7QTD = 0 AND ZE1_SD1QCO = 0 AND (ZE1_QDTSC1 >= ZE1_QUANT) THEN 'Solicitado p/ Compra Total'
		WHEN ZE1_QDTSC1 > 0 AND ZE1_SC7QTD > 0 AND ZE1_SD1QCO = 0 AND (ZE1_SC7QTD < ZE1_QUANT) THEN 'Ped Compra Emitido Parcial'
		WHEN ZE1_QDTSC1 > 0 AND ZE1_SC7QTD > 0 AND ZE1_SD1QCO = 0 AND (ZE1_SC7QTD >= ZE1_QUANT) THEN 'Ped Compra Emitido Total'
		WHEN ZE1_QDTSC1 > 0 AND ZE1_SC7QTD > 0 AND ZE1_SD1QCO > 0 AND (ZE1_SD1QCO < ZE1_QUANT) THEN 'Nota Fiscal Recebida Parcial'
		WHEN ZE1_QDTSC1 > 0 AND ZE1_SC7QTD > 0 AND ZE1_SD1QCO > 0 AND (ZE1_SD1QCO >= ZE1_QUANT) THEN 'Nota Fiscal Recebida Total'
		ELSE '' END AS [Status Receb],
	CASE
		WHEN LEFT(ZE1_CC,3) = '999' AND ZE3_STATUS <> 'SA' AND (ZE1_QDTZE2 < ZE1_QUANT) AND ZE1_STATUS <> 'O' THEN 'Pendente Baixa SA - Sep Parcial'
		WHEN LEFT(ZE1_CC,3) = '999' AND ZE3_STATUS <> 'SA' AND (ZE1_QDTZE2 >= ZE1_QUANT) AND ZE1_STATUS <> 'O' THEN 'Pendente Baixa SA - Sep Total'
		WHEN LEFT(ZE1_CC,3) = '999' AND ZE3_STATUS = 'SA' AND (ZE1_QDTZE2 < ZE1_QUANT)  THEN 'Baixado SA - Sep. Parcial'
		WHEN LEFT(ZE1_CC,3) = '999' AND ZE3_STATUS = 'SA' AND (ZE1_QUANT >= ZE1_QDTZE2)  THEN 'Baixado SA - Sep. Total'
		WHEN LEFT(ZE1_CC,3) <> '999' AND ZE1_NNTQTD = 0 AND ZE1_SD2QTD = 0 THEN ''
		WHEN LEFT(ZE1_CC,3) <> '999' AND ZE1_NNTQTD > 0 AND ZE1_SD2QTD = 0 AND (ZE1_QUANT > ZE1_NNTQTD) THEN 'Em Solic Transf - Sep. Parcial'
		WHEN LEFT(ZE1_CC,3) <> '999' AND ZE1_NNTQTD > 0 AND ZE1_SD2QTD = 0 AND (ZE1_QUANT <= ZE1_NNTQTD) THEN 'Em Solic Transf - Sep. Total'
		WHEN LEFT(ZE1_CC,3) <> '999' AND ZE1_NNTQTD > 0 AND ZE1_SD2QTD > 0 AND (ZE1_QUANT > ZE1_SD2QTD) THEN 'Em Nota Transf - Sep. Parcial'
		WHEN LEFT(ZE1_CC,3) <> '999' AND ZE1_NNTQTD > 0 AND ZE1_SD2QTD > 0 AND (ZE1_QUANT <= ZE1_SD2QTD) THEN 'Em Nota Transf - Sep. Total'
		ELSE ''	END AS [Status Envio],
	ZE1_FLUIG AS [Fluig],
	CONVERT(date,ZE1_EMISSA, 103) AS [Dt Emissao],
	CONVERT(date,ZE1_DTINT, 103) AS [Dt Integracao],
	ZE1_SOLICI AS [Solicitante],
		CASE ZE1_EMERGE
			WHEN 0 THEN 'Não Emergencial'
			WHEN 1 THEN 'Mobilização Obra'
			WHEN 2 THEN 'Aumento de Escopo'
			WHEN 3 THEN 'Aumento de Efetivo'
			WHEN 4 THEN 'Aceleração Obra'
			WHEN 5 THEN 'Serviços Extras'
			WHEN 6 THEN 'Solicitação do Cliente' ELSE '' END AS [Tipo Emergência],
	CONVERT(date,C7_DATPRF, 103) AS [Dt Prev Entrega],
	C1_PEDIDO AS [Pedido],
	C1_ITEMPED AS [Item Pedido],
	CASE ZE1_STSWMS WHEN '1' THEN 'Sim' WHEN '2' THEN 'Não' ELSE 'Não' END AS [WMS],
	ZE1_OBSSC1 AS [Obs Sol Compra],
	C7_OBS AS [Obs PC],
	Y1_NOME AS [Comprador],
	D1_TES AS [TES],
	F4_TEXTO AS [Desc TES],
	CASE F4_ESTOQUE WHEN 'S' THEN 'Sim' WHEN 'N' THEN 'Não' ELSE '' END AS [Atu Estoque],
	CASE ZE1_ATENDI WHEN 'S' THEN 'Sede' WHEN 'L' THEN 'Local' Else '' END AS Atendimento,
	CONVERT(date,D1_DTDIGIT, 103) AS [Dt Digit],
	D1_DOC AS [Nota Fiscal],
	A2_NOME AS [Razão Social],
	B2_QATU AS [Qtd Saldo Estoque],
	B2_CM1 AS [Custo Unitario Estoque],
	B2_QEMPN AS [Qtd Empenhada Estoque NF],
	B2_RESERVA AS [Qtd Reservado Estoque],
	B2_QPEDVEN AS [Qtd Estoque Ped Venda],
	B2_NAOCLAS AS [Qtd N Endereçada Est],
	CONVERT(DATE, B2_USAI, 103) AS [Dt Ult Saida Estoque],
	ZE1_QUANT AS [Qtd Solicitada],
	ZE1_QDTSC1 AS [Qtd Sol Compra],
	ZE1_SC7QTD AS [Qtd Ped Compra],
	D1_QUANT AS [Qtd Nota],
	ZE1_QUJE AS [Qtd Entregue],
	ZE1_QDTZE2 AS [Qtd Separado],
	ZNQ_QTSEPA AS [Qtd Separado WMS],
	ZE1_NNTQTD AS [Qtd Sol Transf],
	ZE1_SD2QTD AS [Qtd Nota Transf],
	RIGHT(ZE1_CODIGO, 6) AS [Cod RM]
-- TABELAS
FROM [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.ZE1010 Z WITH(NOLOCK)
LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.ZE3010 ZE3 WITH(NOLOCK)
ON (ZE3_CODRQ + ZE3_ITEMRQ + ZE3_FILIAL) = (ZE1_CODIGO + ZE1_ITEM + ZE1_FILORI) AND ZE3.D_E_L_E_T_ = ''
INNER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SB5010 B5 WITH(NOLOCK)
ON B5_COD = ZE1_PRODUT AND B5.D_E_L_E_T_ = ''
INNER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SB1010 B1 WITH(NOLOCK)
ON B1.B1_COD = B5.B5_COD AND B1.D_E_L_E_T_ = '' AND B1_MSBLQL = '2'
INNER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.CTT010 CT WITH(NOLOCK)
ON (CTT_CUSTO = ZE1_CC) AND CT.D_E_L_E_T_ = ''
LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SC1010 SC WITH(NOLOCK)
ON (C1_ZCODZE1 + C1_ZITEZE1 + C1_FILENT) = (ZE1_CODIGO + ZE1_ITEM + ZE1_FILORI) AND SC.D_E_L_E_T_ = '' AND SC.C1_PEDIDO <> '' AND SC.C1_NUM <> ''
LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SC7010 PD WITH(NOLOCK)
ON (C1_NUM + C1_ITEM) = (C7_NUMSC + C7_ITEMSC) AND PD.D_E_L_E_T_ = '' AND PD.C7_NUMSC <> ''
LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SY1010 SY WITH(NOLOCK)
ON (C7_USER + C7_FILIAL) = (Y1_USER + Y1_FILIAL) AND SY.D_E_L_E_T_ = '' 
LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SD1010 D1 WITH(NOLOCK)
ON (C7_NUM + C7_ITEM + C7_FILENT) = (D1_PEDIDO + D1_ITEMPC + D1_FILIAL) AND D1.D_E_L_E_T_ = ''
LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SA2010 A2 WITH(NOLOCK)
ON (D1_FORNECE + D1_LOJA) = (A2_COD + A2_LOJA) AND A2.D_E_L_E_T_ = ''
LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SF4010 F4 WITH(NOLOCK)
ON D1_TES = F4_CODIGO AND F4.D_E_L_E_T_ =''
LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SB2010 B2 WITH(NOLOCK)
ON B2_COD = ZE1_PRODUT AND B2.D_E_L_E_T_ = '' AND B2_LOCAL = '01' AND B2_FILIAL = '10'
LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.ZNQ010 ZN WITH(NOLOCK)
ON (ZE1_CODIGO + ZE1_ITEM + ZE1_FILORI) = (ZNQ_REQSEP + ZNQ_ITREQ + ZNQ_FILIAL) AND ZN.D_E_L_E_T_ = ''
-- CONDIÇÕES
WHERE Z.D_E_L_E_T_ = '' /*AND ZE1_ATENDI = 'S'*/ AND CONVERT(date, ZE1_EMISSA, 103) > (GETDATE() - 360)
),


AGRUPAMENTO AS
(

SELECT
	[Chave RM],
	[Filial],
	[Centro Custo],
	[Desc CR],
	[Produto],
	[Desc Prod],
	[Status RM],
	[Status Receb],
	[Status Envio],
	[Fluig],
	[Dt Emissao],
	[Dt Integracao],
	[Solicitante],
	[Tipo Emergência],
	[Dt Prev Entrega],
	[Pedido],
	[Item Pedido],
	[WMS],
	[Obs Sol Compra],
	[Obs PC],
	[Comprador],
	[TES],
	[Desc TES],
	[Atu Estoque],
	Atendimento,
	[Dt Digit],
	[Nota Fiscal],
	[Razão Social],
	[Qtd Saldo Estoque],
	[Qtd Empenhada Estoque NF],
	[Qtd Reservado Estoque],
	[Qtd Estoque Ped Venda],
	[Qtd N Endereçada Est],
	[Dt Ult Saida Estoque],
	[Custo Unitario Estoque],
	[Qtd Solicitada],
	[Qtd Entregue],
	[Qtd Separado],
	[Qtd Sol Compra],
	[Qtd Ped Compra],
	SUM([Qtd Nota]) AS [Qtd em NF Entrada],
	SUM([Qtd Separado WMS]) AS [Qtd Separado WMS],
	[Qtd Sol Transf],
	[Qtd Nota Transf],
	[Cod RM]
FROM CONSTRUCAO
GROUP BY 
	[Chave RM],
	[Filial],
	[Centro Custo],
	[Desc CR],
	[Produto],
	[Desc Prod],
	[Status RM],
	[Status Receb],
	[Status Envio],
	[Fluig],
	[Dt Emissao],
	[Dt Integracao],
	[Solicitante],
	[Tipo Emergência],
	[Dt Prev Entrega],
	[Pedido],
	[Item Pedido],
	[WMS],
	[Obs Sol Compra],
	[Obs PC],
	[Comprador],
	[TES],
	[Desc TES],
	[Atu Estoque],
	Atendimento,
	[Dt Digit],
	[Nota Fiscal],
	[Razão Social],
	[Qtd Saldo Estoque],
	[Qtd Empenhada Estoque NF],
	[Qtd Reservado Estoque],
	[Qtd Estoque Ped Venda],
	[Qtd N Endereçada Est],
	[Dt Ult Saida Estoque],
	[Custo Unitario Estoque],
	[Qtd Solicitada],
	[Qtd Entregue],
	[Qtd Separado],
	[Qtd Sol Compra],
	[Qtd Ped Compra],
	[Qtd Sol Transf],
	[Qtd Nota Transf],
	[Cod RM]
)

SELECT
	*,
	IIF(([Qtd Solicitada] - [Qtd Separado] - [Qtd em NF Entrada]) < 0, ([Qtd Solicitada] - [Qtd Separado]),  [Qtd em NF Entrada]) AS [Qtd P/ Separar Entrada NF],
	([Qtd Solicitada] - [Qtd Separado]) AS [Qtd Pendente RM]
FROM AGRUPAMENTO
GO
