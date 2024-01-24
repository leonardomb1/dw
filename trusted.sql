USE [bi_rip_trustedZone]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_pedidosEmitidos_geraLegendaEmissaoMicro]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE function [dbo].[fn_pedidosEmitidos_geraLegendaEmissaoMicro] (

	@cd_filialOrigem varchar(10)
	,@cd_filialDestino varchar(10) 
	,@qt_solicitada  float
	,@tp_atendimento  varchar(10)
	,@st_emissao  varchar(10)
	,@qt_emSolicitacaoDeCompras float
	,@qt_emPedidoDeCompras float
	,@qt_recebidaEmNotaFiscalDoFornecedor float
	,@qt_paraSeparacaoDeEstoque float 
	,@qt_jaSeparadaNoEstoque float
	,@qt_emSolicitacaoDeTransferencia float
	,@qt_emNotaFiscalDeTransferenciaDeSaida float
	,@qt_emNotaFiscalDeEntradaTransferenciaEmTransito float
	,@qt_emNotaFiscalDeEntradaTransferenciaClassificada float
	,@qt_emPedidoDeVenda float
	,@qt_emMovimentoInternoDeEstoque float

)

returns int

as

begin 


--- declaracoes (1 pra sim e 0 para nao)

declare @fl_filialIgual varchar
declare @fl_sede varchar
declare @fl_elimResiduo varchar
declare @fl_finalizado varchar
declare @fl_difZero_solicitada varchar   
declare @fl_difZero_emSolicitacaoDeCompras varchar
declare @fl_difZero_emPedidoDeCompras varchar
declare @fl_difZero_recebidaEmNotaFiscalDoFornecedor varchar
declare @fl_difZero_paraSeparacaoDeEstoque varchar
declare @fl_difZero_jaSeparadaNoEstoque varchar
declare @fl_difZero_emSolicitacaoDeTransferencia varchar
declare @fl_difZero_emNotaFiscalDeTransferenciaDeSaida varchar
declare @fl_difZero_emNotaFiscalDeEntradaTransferenciaEmTransito varchar
declare @fl_difZero_emNotaFiscalDeEntradaTransferenciaClassificada varchar
declare @fl_difZero_emPedidoDeVenda varchar
declare @fl_difZero_emMovimentoInternoDeEstoque varchar
declare @fl_emSolicitacaoDeCompras_menor_solicitada  varchar
declare @fl_emPedidoDeCompras_menor_emSolicitacaoDeCompras varchar
declare @fl_recebidaEmNotaFiscalDoFornecedor_menor_emPedidoDeCompras varchar
declare @fl_emPedidoDeCompras_menor_solicitada varchar
declare @fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada varchar
declare @fl_paraSeparacaoDeEstoque_menor_solicitada varchar
declare @fl_jaSeparadaNoEstoque_menor_solicitada varchar
declare @fl_emSolicitacaoDeTransferencia_menor_solicitada varchar
declare @fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada varchar
declare @fl_emNotaFiscalDeEntradaTransferenciaEmTransito_menor_solicitada varchar
declare @fl_emNotaFiscalDeEntradaTransferenciaClassificada_menor_solicitada varchar
declare @fl_emPedidoDeVenda_menor_solicitada varchar
declare @fl_emMovimentoInternoDeEstoque_menor_solicitada varchar

-- atendimento nas mesmas filiais?
set @fl_filialIgual = iif(@cd_filialOrigem=@cd_filialDestino,'1','0')

-- atendimento na sede?
set @fl_sede = iif(@tp_atendimento='L','0',iif(@tp_atendimento='S','1',null))

-- status igual a P?
set @fl_elimResiduo = iif(@st_emissao<>'P','0','1')

-- status igual a 0?
set @fl_finalizado = iif(@st_emissao='O','1','0')

-- verifica de difere de zero (se sim retorna 1, se não 0)

set @fl_difZero_solicitada = iif(@qt_solicitada>0,'1','0')

set  @fl_difZero_emSolicitacaoDeCompras= iif(@qt_emSolicitacaoDeCompras>0,'1','0')

set @fl_difZero_emPedidoDeCompras = iif(@qt_emPedidoDeCompras>0,'1','0')

set @fl_difZero_recebidaEmNotaFiscalDoFornecedor = iif(@qt_recebidaEmNotaFiscalDoFornecedor>0,'1','0')

set @fl_difZero_paraSeparacaoDeEstoque = iif(@qt_paraSeparacaoDeEstoque>0,'1','0')

set @fl_difZero_jaSeparadaNoEstoque = iif(@qt_jaSeparadaNoEstoque>0,'1','0')

set @fl_difZero_emSolicitacaoDeTransferencia = iif(@qt_emSolicitacaoDeTransferencia>0,'1','0')

set @fl_difZero_emNotaFiscalDeTransferenciaDeSaida = iif(@qt_emNotaFiscalDeTransferenciaDeSaida>0,'1','0')

set @fl_difZero_emNotaFiscalDeEntradaTransferenciaEmTransito = iif(@qt_emNotaFiscalDeEntradaTransferenciaEmTransito>0,'1','0')

set @fl_difZero_emNotaFiscalDeEntradaTransferenciaClassificada = iif(@qt_emNotaFiscalDeEntradaTransferenciaClassificada>0,'1','0')

set @fl_difZero_emPedidoDeVenda = iif(@qt_emPedidoDeVenda>0,'1','0')

set @fl_difZero_emMovimentoInternoDeEstoque = iif(@qt_emMovimentoInternoDeEstoque>0,'1','0')


-- verifica se é menor (se sim retorna '1', se não '0')

set @fl_emSolicitacaoDeCompras_menor_solicitada  = iif(@qt_emSolicitacaoDeCompras<@qt_solicitada,'1','0')

set @fl_emPedidoDeCompras_menor_emSolicitacaoDeCompras = iif(@qt_emPedidoDeCompras<@qt_emSolicitacaoDeCompras,'1','0')

set @fl_recebidaEmNotaFiscalDoFornecedor_menor_emPedidoDeCompras = iif(@qt_recebidaEmNotaFiscalDoFornecedor<@qt_emPedidoDeCompras,'1','0')

set @fl_emPedidoDeCompras_menor_solicitada =iif(@qt_emPedidoDeCompras<@qt_solicitada,'1','0')

set @fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada =iif(@qt_recebidaEmNotaFiscalDoFornecedor<@qt_solicitada,'1','0')

set @fl_paraSeparacaoDeEstoque_menor_solicitada =iif(@qt_paraSeparacaoDeEstoque<@qt_solicitada,'1','0')

set @fl_jaSeparadaNoEstoque_menor_solicitada =iif(@qt_jaSeparadaNoEstoque<@qt_solicitada,'1','0')

set @fl_emSolicitacaoDeTransferencia_menor_solicitada =iif(@qt_emSolicitacaoDeTransferencia<@qt_solicitada,'1','0')

set @fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada =iif(@qt_emNotaFiscalDeTransferenciaDeSaida<@qt_solicitada,'1','0')

set @fl_emNotaFiscalDeEntradaTransferenciaEmTransito_menor_solicitada =iif(@qt_emNotaFiscalDeEntradaTransferenciaEmTransito<@qt_solicitada,'1','0')

set @fl_emNotaFiscalDeEntradaTransferenciaClassificada_menor_solicitada =iif(@qt_emNotaFiscalDeEntradaTransferenciaClassificada<@qt_solicitada,'1','0')

set @fl_emPedidoDeVenda_menor_solicitada =iif(@qt_emPedidoDeVenda<@qt_solicitada,'1','0')

set @fl_emMovimentoInternoDeEstoque_menor_solicitada =iif(@qt_emMovimentoInternoDeEstoque<@qt_solicitada,'1','0')


------- construtor de cada codigo condicional das legendas
---- > em ordem: @fl_filialIgual+@fl_sede+@fl_elimResiduo+@fl_difZero_solicitada+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+@fl_difZero_emNotaFiscalDeEntradaTransferenciaEmTransito+@fl_difZero_emNotaFiscalDeEntradaTransferenciaClassificada+@fl_difZero_emPedidoDeVenda+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+@fl_emPedidoDeCompras_menor_emSolicitacaoDeCompras+@fl_recebidaEmNotaFiscalDoFornecedor_menor_emPedidoDeCompras+@fl_emPedidoDeCompras_menor_solicitada+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+@fl_paraSeparacaoDeEstoque_menor_solicitada+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+@fl_emNotaFiscalDeEntradaTransferenciaEmTransito_menor_solicitada+@fl_emNotaFiscalDeEntradaTransferenciaClassificada_menor_solicitada+@fl_emPedidoDeVenda_menor_solicitada+@fl_emMovimentoInternoDeEstoque_menor_solicitada
---- > colocar X caso o campo não seja necessário para o código micro da legenda

declare  @legendasCalculadas table (cd_condicionalLegenda varchar(150))
insert into @legendasCalculadas values

/* 1 */	(@fl_filialIgual+@fl_sede+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+'X'),
/* 2 */	(@fl_filialIgual+@fl_sede+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+'X'),
/* 3 */	(@fl_filialIgual+@fl_sede+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+'X'),
/* 4 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+'X'),
/* 5 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 6 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+'X'),
/* 7 */	('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 8 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+@fl_emPedidoDeCompras_menor_solicitada+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 9 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+'X'+'X'+@fl_emPedidoDeCompras_menor_solicitada+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 10 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+@fl_emPedidoDeCompras_menor_emSolicitacaoDeCompras+'X'+@fl_emPedidoDeCompras_menor_solicitada+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+@fl_finalizado),
/* 11 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+@fl_finalizado),
/* 12 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+@fl_finalizado),
/* 13 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+@fl_finalizado),
/* 14 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 15 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 16 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emSolicitacaoDeTransferencia_menor_solicitada+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 17 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emSolicitacaoDeTransferencia_menor_solicitada+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 18 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_jaSeparadaNoEstoque_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 19 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_jaSeparadaNoEstoque_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 20 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_paraSeparacaoDeEstoque_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 21 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_paraSeparacaoDeEstoque_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 22 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 23 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 24 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+@fl_emPedidoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 25 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+@fl_emPedidoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 26 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+@fl_emPedidoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 27 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+@fl_emPedidoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 28 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 29 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 30 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 31 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 32 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 33 */	(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 51 */	('X'+@fl_sede+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+'X'),
/* 52 */	('X'+@fl_sede+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+'X'),
/* 53 */	('X'+@fl_sede+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+'X'),
/* 54 */	('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+'X'),
/* 55 */	('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'+'X'),
/* 56 */	('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+'X'),
/* 57 */	('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+'X'),
/* 58 */	('X'+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+@fl_finalizado),
/* 59 */	('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+@fl_finalizado),
/* 60 */	('X'+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+'X'+'X'+'X'+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+@fl_finalizado),
/* 61 */	('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 62 */	('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 63 */	('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 64 */	('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 65 */	('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 66 */	('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 67 */	('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_paraSeparacaoDeEstoque_menor_solicitada+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 68 */	('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_paraSeparacaoDeEstoque_menor_solicitada+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 69 */	('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+@fl_paraSeparacaoDeEstoque_menor_solicitada+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 70 */	('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+@fl_paraSeparacaoDeEstoque_menor_solicitada+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 71 */	('X'+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+'X'+'X'+@fl_difZero_paraSeparacaoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+'X'+'X'+@fl_emPedidoDeCompras_menor_solicitada+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+@fl_paraSeparacaoDeEstoque_menor_solicitada+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+@fl_finalizado),
/* 72 */	('X'+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+'X'+'X'+@fl_emPedidoDeCompras_menor_solicitada+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+@fl_paraSeparacaoDeEstoque_menor_solicitada+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+@fl_finalizado),
/* 73 */	('X'+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+@fl_difZero_emPedidoDeVenda+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+@fl_emPedidoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 74 */	('X'+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+@fl_difZero_emPedidoDeVenda+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+@fl_emPedidoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 75 */	('X'+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+@fl_difZero_emPedidoDeVenda+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 76 */	('X'+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+@fl_difZero_emPedidoDeVenda+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 77 */	('X'+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+@fl_difZero_emPedidoDeVenda+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_finalizado),
/* 34 */	('X'+@fl_sede+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+@fl_finalizado),
/* 78 */	('X'+@fl_sede+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada+@fl_finalizado)

declare  @legendas table (cd_legendaMicro int , cd_condicionalLegenda varchar(500))


------ legendas e codigo indicador

insert into @legendas values
(1, '10XXXXXXXXXXXXXXXXX1XXXXXXX0X'),
(2, '10XXXXXXXXXXXXXXXXX0XXXXXXX1X'),
(3, '10XXXXXXXXXXXXXXXXX0XXXXXXX0X'),
(4, '101XXX0XXXXXXX1XXXXXXXXXXXX1X'),
(5, '101XXX1XXXXXXX0XXXX1XXXXXXXXX'),
(6, '101XXX1XXXXXXX1XXXX1XXXXXXX1X'),
(7, 'X01XXX0XXXXXXX0XXXXXXXXXXXXXX'),
(8, '100XXX1XXXXXXX1XXX01XXXXXXXX0'),
(9, '100XXX1XXXXXXX00XX01XXXXXXXX0'),
(10, '100XX11XXXXXXX001X11XXXXXXX10'),
(11, '100XX10XXXXXXX1XXXX1XXXXXXX10'),
(12, '100XXX1XXXXXXX01XXX1XXXXXXX10'),
(13, '100X0X0XXXXXXX1XXXXXXXXXXXX10'),
(14, '000XXXXXXXXXXXXXXXXXXXX0XXXX0'),
(15, '000XXXXXXX1XXXXXXXXXXXX1XXXX0'),
(16, '000XXXXXX10XXXXXXXXXXX0XXXXX0'),
(17, '000XXXXXX10XXXXXXXXXXX1XXXXX0'),
(18, '000XXXXX100XXXXXXXXXX0XXXXXX0'),
(19, '000XXXXX100XXXXXXXXXX1XXXXXX0'),
(20, '000XXXX1000XXXXXXXXX0XXXXXXX0'),
(21, '000XXXX1000XXXXXXXXX1XXXXXXX0'),
(22, '000XXX10000XXXXXXXX0XXXXXXXX0'),
(23, '000XXX10000XXXXXXXX1XXXXXXXX0'),
(24, '100XX10XXXXXXX0XXX0XXXXXXXXX0'),
(25, '100XX10XXXXXXX0XXX1XXXXXXXXX0'),
(26, '000XX10XXXXXXX0XXX1XXXXXXXXX0'),
(27, '000XX10XXXXXXX0XXX0XXXXXXXXX0'),
(28, '100X100XXXXXXX00XXXXXXXXXXXX0'),
(29, '000X100XXXXXXX00XXXXXXXXXXXX0'),
(30, '100X100XXXXXXX01XXXXXXXXXXXX0'),
(31, '000X100XXXXXXX01XXXXXXXXXXXX0'),
(32, '100X000XXXXXXX0XXXXXXXXXXXXX0'),
(33, '000X0000000XXX0XXXX1XXXXXXXX0'),
(51, 'X1XXXXXXXXXXXX1XXXXXXXX1XXX0X'),
(52, 'X1XXXXXXXXXXXXXXXXXXXXX0XXX1X'),
(53, 'X1XXXXXXXX1XXX1XXXXXXXX0XXX0X'),
(54, 'X11XXXXXXX0XXX1XXXXXXXXXXXX1X'),
(55, 'X11XXXXXXX1XXX0XXXXXXXX1XXXXX'),
(56, 'X11XXXXXXX1XXX1XXXXXXXX1XXX1X'),
(57, 'X11XXXXXXX0XXX0XXXXXXXX1XXX1X'),
(58, 'X10X1XXXXX1XXX1XXXXXX111XXX10'),
(59, 'X10XXXXXXX1XXX0XXXXXX111XXX10'),
(60, 'X10X1XXX000XXX1XXXXXXXXXXXX10'),
(61, 'X10XXXXXX11XXXXXXXXXXX01XXXX0'),
(62, 'X10XXXXX111XXXXXXXXXX011XXXX0'),
(63, 'X10XXXXXX10XXXXXXXXXXX01XXXX0'),
(64, 'X10XXXXXX10XXXXXXXXXXX11XXXX0'),
(65, 'X10XXXXX100XXX0XXXXXX011XXXX0'),
(66, 'X10XXXXX100XXXXXXXXXX111XXXX0'),
(67, 'X10XXXX1000XXXXXXXXX0111XXXX0'),
(68, 'X10XXXX1000XXXXXXXXX1111XXXX0'),
(69, 'X10XXX10000XXXXXXXX01111XXXX0'),
(70, 'X10XXX10000XXXXXXXX11111XXXX0'),
(71, 'X10X0XX0XXXXXX11XX111111XXX10'),
(72, 'X10X0XXXXX1XXX11XX111111XXX10'),
(73, 'X10X1100000XX00XXX0XXXXXXXXX0'),
(74, 'X10X1100000XX00XXX1XXXXXXXXX0'),
(75, 'X10X1000000XX000XXXXXXXXXXXX0'),
(76, 'X10X1000000XX001XXXXXXXXXXXX0'),
(77, 'X10X0000000XX00XXXXXXXXXXXXX0'),
(34, 'X0XXXXXXXXXXXXXXXXX1XXX1XXX11'),
(78, 'X1XXXXXXXXXXXXXXXXXXXXX1XXX11')

--- se o codigo construido estiver dentro dos codigos mapeados, então retorna o primeiro
return (
	select top 1 cd_legendaMicro
	from @legendas 
	where convert(varchar,cd_condicionalLegenda) in (select convert(varchar,cd_condicionalLegenda) from @legendasCalculadas)
)

end
GO
/****** Object:  UserDefinedFunction [dbo].[fn_removeZeros]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[fn_removeZeros]
(@TEXTO AS VARCHAR(30), @DIRECAO BIT)
RETURNS VARCHAR(30)
AS
BEGIN
    DECLARE @RETORNO VARCHAR(30)
    IF @DIRECAO = 0 --Remover zeros a esquerda
     SET @RETORNO = SUBSTRING(@TEXTO,PATINDEX('%[a-z,1-9]%',@TEXTO),LEN(@TEXTO))
    ELSE --Remover zeros a direita
     SET @RETORNO = REVERSE(SUBSTRING(REVERSE(@TEXTO),PATINDEX('%[a-z,1-9]%',REVERSE(@TEXTO)),LEN(@TEXTO)))  
    RETURN (@RETORNO)
END
GO
/****** Object:  Table [dbo].[_bkp_tb_fat_pedidosEmitidos]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_bkp_tb_fat_pedidosEmitidos](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cc_pedidosEmitidosXsolicitacoesSeparacoes] [varchar](max) NULL,
	[cc_pedidosEmitidosXsolicitacoesCompras] [varchar](max) NULL,
	[cd_filialOrigem_pedidosEmitidos] [varchar](2) NULL,
	[cd_centroCusto_pedidosEmitidos] [varchar](9) NULL,
	[cd_filialDestino_pedidosEmitidos] [varchar](2) NULL,
	[cd_pedido_pedidosEmitidos] [varchar](20) NULL,
	[cd_itemEmissao_pedidosEmitidos] [varchar](4) NULL,
	[cd_fluigEmissao_pedidosEmitidos] [varchar](20) NULL,
	[dt_emissao_pedidosEmitidos] [date] NULL,
	[cd_produto_pedidosEmitidos] [varchar](20) NULL,
	[qt_solicitada_pedidosEmitidos] [float] NULL,
	[tp_atendimento_pedidosEmitidos] [varchar](1) NULL,
	[tp_emergencia_pedidosEmitidos] [varchar](1) NULL,
	[dt_necessidade_pedidosEmitidos] [date] NULL,
	[qt_entregue_pedidosEmitidos] [float] NULL,
	[nm_local_pedidosEmitidos] [varchar](2) NULL,
	[qt_aSeparar_pedidosEmitidos] [float] NULL,
	[qt_aComprar_pedidosEmitidos] [float] NULL,
	[ds_observacaoASeparar_pedidosEmitidos] [varbinary](max) NULL,
	[ds_observacaoAComprar_pedidosEmitidos] [varbinary](max) NULL,
	[st_emissao_pedidosEmitidos] [varchar](1) NULL,
	[cd_solicitante_pedidosEmitidos] [varchar](40) NULL,
	[nm_solicitante_pedidosEmitidos] [varchar](50) NULL,
	[cd_localDestino_pedidosEmitidos] [varchar](2) NULL,
	[ds_complementoEimssao_pedidosEmitidos] [varchar](200) NULL,
	[nr_ordemServico_pedidosEmitidos] [varchar](20) NULL,
	[tp_usoMaterial_pedidosEmitidos] [varchar](1) NULL,
	[st_wms_pedidosEmitidos] [varchar](1) NULL,
	[cd_recno_ZE1] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_bkp_tb_fat_pedidosEmitidos_14062022]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_bkp_tb_fat_pedidosEmitidos_14062022](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cc_pedidosEmitidosXsolicitacoesSeparacoes] [varchar](max) NULL,
	[cc_pedidosEmitidosXsolicitacoesCompras] [varchar](max) NULL,
	[cd_filialOrigem_pedidosEmitidos] [varchar](2) NULL,
	[cd_centroCusto_pedidosEmitidos] [varchar](9) NULL,
	[cd_filialDestino_pedidosEmitidos] [varchar](2) NULL,
	[cd_pedido_pedidosEmitidos] [varchar](20) NULL,
	[cd_itemEmissao_pedidosEmitidos] [varchar](4) NULL,
	[cd_fluigEmissao_pedidosEmitidos] [varchar](20) NULL,
	[dt_emissao_pedidosEmitidos] [date] NULL,
	[cd_produto_pedidosEmitidos] [varchar](20) NULL,
	[qt_solicitada_pedidosEmitidos] [float] NULL,
	[tp_atendimento_pedidosEmitidos] [varchar](1) NULL,
	[tp_emergencia_pedidosEmitidos] [varchar](1) NULL,
	[dt_necessidade_pedidosEmitidos] [date] NULL,
	[qt_entregue_pedidosEmitidos] [float] NULL,
	[nm_local_pedidosEmitidos] [varchar](2) NULL,
	[qt_aSeparar_pedidosEmitidos] [float] NULL,
	[qt_aComprar_pedidosEmitidos] [float] NULL,
	[ds_observacaoASeparar_pedidosEmitidos] [varbinary](max) NULL,
	[ds_observacaoAComprar_pedidosEmitidos] [varbinary](max) NULL,
	[st_emissao_pedidosEmitidos] [varchar](1) NULL,
	[cd_solicitante_pedidosEmitidos] [varchar](40) NULL,
	[nm_solicitante_pedidosEmitidos] [varchar](50) NULL,
	[cd_localDestino_pedidosEmitidos] [varchar](2) NULL,
	[ds_complementoEimssao_pedidosEmitidos] [varchar](200) NULL,
	[nr_ordemServico_pedidosEmitidos] [varchar](20) NULL,
	[tp_usoMaterial_pedidosEmitidos] [varchar](1) NULL,
	[st_wms_pedidosEmitidos] [varchar](1) NULL,
	[st_rm_pedidosEmitidos] [varchar](3) NULL,
	[cd_recno_ZE1] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
	[qt_emSolicitacaoDeCompras_pedidosEmitidos] [float] NULL,
	[qt_emPedidoDeCompras_pedidosEmitidos] [float] NULL,
	[qt_recebidaEmNotaFiscalDoFornecedor_pedidosEmitidos] [float] NULL,
	[qt_paraSeparacaoDeEstoque_pedidosEmitidos] [float] NULL,
	[qt_jaSeparadaNoEstoque_pedidosEmitidos] [float] NULL,
	[qt_emSolicitacaoDeTransferencia_pedidosEmitidos] [float] NULL,
	[qt_emNotaFiscalDeTransferenciaDeSaida_pedidosEmitidos] [float] NULL,
	[qt_emNotaFiscalDeEntradaTransferenciaEmTransito_pedidosEmitidos] [float] NULL,
	[qt_emNotaFiscalDeEntradaTransferenciaClassificada_pedidosEmitidos] [float] NULL,
	[qt_emPedidoDeVenda_pedidosEmitidos] [float] NULL,
	[qt_emMovimentoInternoDeEstoque_pedidosEmitidos] [float] NULL,
	[cd_legendaEmissaoMicro_pedidosEmitidos] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_bkp_tb_fat_requisicoesArmazem]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_bkp_tb_fat_requisicoesArmazem](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial] [varchar](2) NULL,
	[nr_requisicao] [varchar](6) NULL,
	[nr_item] [varchar](2) NULL,
	[cd_procuto] [varchar](15) NULL,
	[ds_unidadeMedida] [varchar](2) NULL,
	[qt_requisicao] [float] NULL,
	[dt_necessidade] [date] NULL,
	[cd_armazem] [varchar](2) NULL,
	[ds_observacao] [varchar](254) NULL,
	[cd_centroCusto] [varchar](9) NULL,
	[cd_contaContabil] [varchar](20) NULL,
	[dt_emissao] [date] NULL,
	[ds_requisicao] [varchar](100) NULL,
	[cd_solicitacao] [varchar](6) NULL,
	[cd_solicitante] [varchar](25) NULL,
	[qt_atendida] [float] NULL,
	[st_solicitacao] [varchar](1) NULL,
	[cd_itemContabil] [varchar](9) NULL,
	[cd_classeValor] [varchar](9) NULL,
	[cd_usuario] [varchar](6) NULL,
	[nr_solicitacaoCompra] [varchar](6) NULL,
	[cd_itemSolicitacaoCompra] [varchar](4) NULL,
	[st_solicitacaoAtendimento] [varchar](1) NULL,
	[vl_saldoBloqueio] [float] NULL,
	[cd_mercadoDebito] [varchar](16) NULL,
	[cd_mercadoCredito] [varchar](16) NULL,
	[cd_modalidadeDebito] [varchar](16) NULL,
	[cd_modalidadeCredito] [varchar](16) NULL,
	[cd_localDebito] [varchar](16) NULL,
	[cd_localCredito] [varchar](16) NULL,
	[cd_atividadeDebito] [varchar](16) NULL,
	[cd_atividadeCredito] [varchar](16) NULL,
	[cd_letraDebito] [varchar](16) NULL,
	[cd_letraCredito] [varchar](16) NULL,
	[nr_fluig] [float] NULL,
	[fl_emergencia] [varchar](1) NULL,
	[tp_usoRip] [varchar](1) NULL,
	[dt_digitacao] [date] NULL,
	[cd_recno_SCP] [int] NOT NULL,
	[cd_criacao] [datetime] NOT NULL,
	[cd_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bkp_tb_fat_pedidosEmitidos_0413]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bkp_tb_fat_pedidosEmitidos_0413](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cc_pedidosEmitidosXsolicitacoesSeparacoes] [varchar](max) NULL,
	[cc_pedidosEmitidosXsolicitacoesCompras] [varchar](max) NULL,
	[cd_filialOrigem_pedidosEmitidos] [varchar](2) NULL,
	[cd_centroCusto_pedidosEmitidos] [varchar](9) NULL,
	[cd_filialDestino_pedidosEmitidos] [varchar](2) NULL,
	[cd_pedido_pedidosEmitidos] [varchar](20) NULL,
	[cd_itemEmissao_pedidosEmitidos] [varchar](4) NULL,
	[cd_fluigEmissao_pedidosEmitidos] [varchar](20) NULL,
	[dt_emissao_pedidosEmitidos] [date] NULL,
	[cd_produto_pedidosEmitidos] [varchar](20) NULL,
	[qt_solicitada_pedidosEmitidos] [float] NULL,
	[tp_atendimento_pedidosEmitidos] [varchar](1) NULL,
	[tp_emergencia_pedidosEmitidos] [varchar](1) NULL,
	[dt_necessidade_pedidosEmitidos] [date] NULL,
	[qt_entregue_pedidosEmitidos] [float] NULL,
	[nm_local_pedidosEmitidos] [varchar](2) NULL,
	[qt_aSeparar_pedidosEmitidos] [float] NULL,
	[qt_aComprar_pedidosEmitidos] [float] NULL,
	[ds_observacaoASeparar_pedidosEmitidos] [varbinary](max) NULL,
	[ds_observacaoAComprar_pedidosEmitidos] [varbinary](max) NULL,
	[st_emissao_pedidosEmitidos] [varchar](1) NULL,
	[cd_solicitante_pedidosEmitidos] [varchar](40) NULL,
	[nm_solicitante_pedidosEmitidos] [varchar](50) NULL,
	[cd_localDestino_pedidosEmitidos] [varchar](2) NULL,
	[ds_complementoEimssao_pedidosEmitidos] [varchar](200) NULL,
	[nr_ordemServico_pedidosEmitidos] [varchar](20) NULL,
	[tp_usoMaterial_pedidosEmitidos] [varchar](1) NULL,
	[st_wms_pedidosEmitidos] [varchar](1) NULL,
	[st_rm_pedidosEmitidos] [varchar](3) NULL,
	[cd_recno_ZE1] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bkp_tb_fat_pedidosEmitidos_25042022]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bkp_tb_fat_pedidosEmitidos_25042022](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cc_pedidosEmitidosXsolicitacoesSeparacoes] [varchar](max) NULL,
	[cc_pedidosEmitidosXsolicitacoesCompras] [varchar](max) NULL,
	[cd_filialOrigem_pedidosEmitidos] [varchar](2) NULL,
	[cd_centroCusto_pedidosEmitidos] [varchar](9) NULL,
	[cd_filialDestino_pedidosEmitidos] [varchar](2) NULL,
	[cd_pedido_pedidosEmitidos] [varchar](20) NULL,
	[cd_itemEmissao_pedidosEmitidos] [varchar](4) NULL,
	[cd_fluigEmissao_pedidosEmitidos] [varchar](20) NULL,
	[dt_emissao_pedidosEmitidos] [date] NULL,
	[cd_produto_pedidosEmitidos] [varchar](20) NULL,
	[qt_solicitada_pedidosEmitidos] [float] NULL,
	[tp_atendimento_pedidosEmitidos] [varchar](1) NULL,
	[tp_emergencia_pedidosEmitidos] [varchar](1) NULL,
	[dt_necessidade_pedidosEmitidos] [date] NULL,
	[qt_entregue_pedidosEmitidos] [float] NULL,
	[nm_local_pedidosEmitidos] [varchar](2) NULL,
	[qt_aSeparar_pedidosEmitidos] [float] NULL,
	[qt_aComprar_pedidosEmitidos] [float] NULL,
	[ds_observacaoASeparar_pedidosEmitidos] [varbinary](max) NULL,
	[ds_observacaoAComprar_pedidosEmitidos] [varbinary](max) NULL,
	[st_emissao_pedidosEmitidos] [varchar](1) NULL,
	[cd_solicitante_pedidosEmitidos] [varchar](40) NULL,
	[nm_solicitante_pedidosEmitidos] [varchar](50) NULL,
	[cd_localDestino_pedidosEmitidos] [varchar](2) NULL,
	[ds_complementoEimssao_pedidosEmitidos] [varchar](200) NULL,
	[nr_ordemServico_pedidosEmitidos] [varchar](20) NULL,
	[tp_usoMaterial_pedidosEmitidos] [varchar](1) NULL,
	[st_wms_pedidosEmitidos] [varchar](1) NULL,
	[st_rm_pedidosEmitidos] [varchar](3) NULL,
	[cd_recno_ZE1] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
	[qt_emSolicitacaoDeCompras_pedidosEmitidos] [float] NULL,
	[qt_emPedidoDeCompras_pedidosEmitidos] [float] NULL,
	[qt_recebidaEmNotaFiscalDoFornecedor_pedidosEmitidos] [float] NULL,
	[qt_paraSeparacaoDeEstoque_pedidosEmitidos] [float] NULL,
	[qt_jaSeparadaNoEstoque_pedidosEmitidos] [float] NULL,
	[qt_emSolicitacaoDeTransferencia_pedidosEmitidos] [float] NULL,
	[qt_emNotaFiscalDeTransferenciaDeSaida_pedidosEmitidos] [float] NULL,
	[qt_emNotaFiscalDeEntradaTransferenciaEmTransito_pedidosEmitidos] [float] NULL,
	[qt_emNotaFiscalDeEntradaTransferenciaClassificada_pedidosEmitidos] [float] NULL,
	[qt_emPedidoDeVenda_pedidosEmitidos] [float] NULL,
	[qt_emMovimentoInternoDeEstoque_pedidosEmitidos] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_agenda]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_agenda](
	[cd_identificador] [int] IDENTITY(1,1) NOT NULL,
	[nm_procedure] [varchar](250) NULL,
	[st_procedure] [varchar](19) NOT NULL,
	[dt_inicio] [datetime] NULL,
	[dt_fim] [datetime] NOT NULL,
	[qtd_linhasAfetadas] [int] NULL,
	[ds_erroNumero] [int] NULL,
	[ds_erroSeveridade] [int] NULL,
	[ds_erroEstado] [int] NULL,
	[ds_erroLinha] [int] NULL,
	[ds_erroMensagem] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[cd_identificador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_cadastroEntidades]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_cadastroEntidades](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_planoContabil] [varchar](2) NULL,
	[cd_item_planoContabil] [varchar](6) NULL,
	[cd_entidade] [varchar](16) NULL,
	[ds_entidade] [varchar](30) NULL,
	[tp_classe] [varchar](1) NULL,
	[cd_condicaoNormal] [varchar](1) NULL,
	[cd_entidadeSuperior] [varchar](16) NULL,
	[cd_bloqueia_entidade] [varchar](1) NULL,
	[cd_filial_gerencialEntidade] [varchar](2) NULL,
	[cd_recno_CV0] [int] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_calendario]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_calendario](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[dt_referencia] [datetime] NULL,
	[nr_dia] [float] NULL,
	[nr_mes] [float] NULL,
	[nr_ano] [float] NULL,
	[dt_diaUtilAnterior] [datetime] NULL,
	[dt_proximoDiaUtil] [datetime] NULL,
	[fl_diaUtil] [float] NULL,
	[fl_diaUtilIncluindoSabado] [float] NULL,
	[fl_feriado] [float] NULL,
	[nr_diaSemana] [float] NULL,
	[ds_diaSemana] [nvarchar](255) NULL,
	[nr_semana] [float] NULL,
	[nr_semanaMes] [float] NULL,
	[nr_diaAno] [float] NULL,
	[qtd_diasUteisMes] [float] NULL,
	[qtd_diasUteisAno] [float] NULL,
	[fl_ultimoDiaMes] [float] NULL,
	[fl_ultimoDiaUtilMes] [float] NULL,
	[nr_bimestre] [float] NULL,
	[nr_trimestre] [float] NULL,
	[nr_semestre] [float] NULL,
	[nm_mes] [nvarchar](255) NULL,
	[nm_mesAno] [datetime] NULL,
	[nm_mesAnoAbreviado] [datetime] NULL,
	[nr_mesAno] [float] NULL,
	[nr_quinzena] [float] NULL,
	[ds_semana] [nvarchar](255) NULL,
	[ds_quinzena] [nvarchar](255) NULL,
	[ds_bimestre] [nvarchar](255) NULL,
	[ds_trimestre] [nvarchar](255) NULL,
	[ds_semestre] [nvarchar](255) NULL,
	[fl_inativo] [nvarchar](255) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[dt_referencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_calendarioFeriados]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_calendarioFeriados](
	[dt_referencia] [datetime] NULL,
	[tp_feriado] [nvarchar](255) NULL,
	[ds_feriado] [nvarchar](255) NULL,
	[nm_UfFeriadoEstadual] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_cargos]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_cargos](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_cargo] [varchar](2) NULL,
	[cd_cargo] [varchar](5) NULL,
	[tp_maoObra_cargo] [varchar](1) NULL,
	[ds_cargo] [varchar](20) NULL,
	[cd_recno_SRJ] [int] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_centroCusto]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_centroCusto](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_centroCusto] [varchar](2) NULL,
	[cd_filialArmazem_centroCusto] [varchar](10) NULL,
	[cd_centroCusto_centroCusto] [varchar](9) NULL,
	[ds_moeda1_centroCusto] [varchar](40) NULL,
	[fl_bloqueado_centroCusto] [varchar](1) NULL,
	[dt_inicioExistencia_centroCusto] [date] NULL,
	[dt_finalExistencia_centroCusto] [date] NULL,
	[cd_red_centroCusto] [varchar](10) NULL,
	[cd_filialResponsavel_centroCusto] [varchar](2) NULL,
	[cd_responsavel_centroCusto] [varchar](6) NULL,
	[nm_tomadorServico_centroCusto] [varchar](40) NULL,
	[ds_enderecoTomadorServico_centroCusto] [varchar](40) NULL,
	[nm_unidadeFederal_centroCusto] [varchar](2) NULL,
	[nm_municipio_centroCusto] [varchar](20) NULL,
	[ds_letraDebito_centroCusto] [varchar](16) NULL,
	[ds_letraCredito_centroCusto] [varchar](16) NULL,
	[cd_mercadoDebito_centroCusto] [varchar](16) NULL,
	[cd_mercadoCredito_centroCusto] [varchar](16) NULL,
	[cd_modalidadeDebito_centroCusto] [varchar](16) NULL,
	[cd_modalidadeCredito_centroCusto] [varchar](16) NULL,
	[cd_localDebito_centroCusto] [varchar](16) NULL,
	[cd_localCredito_centroCusto] [varchar](16) NULL,
	[cd_atividadeDebito_centroCusto] [varchar](16) NULL,
	[cd_atividadeCredito_centroCusto] [varchar](16) NULL,
	[cd_empresaFilial_centroCusto] [varchar](4) NULL,
	[cd_armazemFilial_centroCusto] [varchar](2) NULL,
	[fl_possueRecebimentoLocal_centroCusto] [varchar](1) NULL,
	[cd_recno_CTT] [int] NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_cid]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_cid](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_cid] [varchar](5) NOT NULL,
	[cd_subCat] [varchar](3) NOT NULL,
	[ds_cid] [varchar](264) NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_cid_capitulo]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_cid_capitulo](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_subCat] [varchar](3) NOT NULL,
	[cd_rangeSubCat] [varchar](3) NULL,
	[cd_capitulo] [int] NOT NULL,
	[ds_capitulo] [varchar](122) NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_cid_categoria]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_cid_categoria](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_categoria_cid] [varchar](3) NOT NULL,
	[ds_categoria_cid] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_codificacoesNotasFiscais]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_codificacoesNotasFiscais](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_codificacoesNotasFiscais] [varchar](2) NULL,
	[cd_entradaSaida_codificacoesNotasFiscais] [varchar](3) NULL,
	[tp_tes_codificacoesNotasFiscais] [varchar](1) NULL,
	[fl_calculaIcms_codificacoesNotasFiscais] [varchar](1) NULL,
	[fl_calculaIpi_codificacoesNotasFiscais] [varchar](1) NULL,
	[fl_creditaIcm_codificacoesNotasFiscais] [varchar](1) NULL,
	[fl_creditaIpi_codificacoesNotasFiscais] [varchar](1) NULL,
	[fl_duplicata_codificacoesNotasFiscais] [varchar](1) NULL,
	[fl_estoque_codificacoesNotasFiscais] [varchar](1) NULL,
	[cd_fiscalOperacao_codificacoesNotasFiscais] [varchar](5) NULL,
	[cd_textoPadrao_codificacoesNotasFiscais] [varchar](20) NULL,
	[vl_percentualReducaoBaseIcms_codificacoesNotasFiscais] [float] NULL,
	[vl_percentualReducaoBaseIpi_codificacoesNotasFiscais] [float] NULL,
	[cd_livroFiscalIcmi_codificacoesNotasFiscais] [varchar](1) NULL,
	[cd_livroFiscalIpi_codificacoesNotasFiscais] [varchar](1) NULL,
	[fl_destacaIpiNaNota_codificacoesNotasFiscais] [varchar](1) NULL,
	[fl_incideIpiNaBase_codificacoesNotasFiscais] [varchar](1) NULL,
	[fl_calculaDiferencaIcm_codificacoesNotasFiscais] [varchar](1) NULL,
	[fl_incideIpiSemFrete_codificacoesNotasFiscais] [varchar](1) NULL,
	[fl_incideIss_codificacoesNotasFiscais] [varchar](1) NULL,
	[cd_livroFiscalIss_codificacoesNotasFiscais] [varchar](1) NULL,
	[fl_materialConsumo_codificacoesNotasFiscais] [varchar](1) NULL,
	[fl_baseIcmsSt_codificacoesNotasFiscais] [varchar](1) NULL,
	[vl_percentualBaseIcmsSt_codificacoesNotasFiscais] [float] NULL,
	[fl_creditaIcmsSt_codificacoesNotasFiscais] [varchar](1) NULL,
	[vl_percentualIss_codificacoesNotasFiscais] [float] NULL,
	[fl_despesasBaseIcms_codificacoesNotasFiscais] [varchar](1) NULL,
	[cd_situacaoTributariaIcms_codificacoesNotasFiscais] [varchar](2) NULL,
	[fl_defineSeGeraPisCofins_codificacoesNotasFiscais] [varchar](1) NULL,
	[fl_creditaPisCofins_codificacoesNotasFiscais] [varchar](1) NULL,
	[tp_operacao_codificacoesNotasFiscais] [varchar](1) NULL,
	[fl_bloqueiaUsoTes_codificacoesNotasFiscais] [varchar](1) NULL,
	[ds_finalidadeTes_codificacoesNotasFiscais] [varchar](254) NULL,
	[tp_regime_codificacoesNotasFiscais] [varchar](1) NULL,
	[fl_transferenciaFiliais_codificacoesNotasFiscais] [varchar](1) NULL,
	[cd_recno_SRA] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_competencia_ponto]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_competencia_ponto](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[dt_referencia] [date] NOT NULL,
	[mes] [varchar](2) NOT NULL,
	[ano] [varchar](4) NOT NULL,
	[mes_desc] [varchar](20) NOT NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[dt_referencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_compradores]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_compradores](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_compradores] [varchar](2) NULL,
	[cd_comprador_compradores] [varchar](3) NULL,
	[nm_usuario_compradores] [varchar](40) NULL,
	[cd_usuario_compradores] [varchar](6) NULL,
	[nr_telefone_compradores] [varchar](30) NULL,
	[nr_fax_compradores] [varchar](30) NULL,
	[nm_email_compradores] [varchar](40) NULL,
	[cd_grupoAprovacao_compradores] [varchar](6) NULL,
	[fl_incluiPedidoSemSC_compradores] [varchar](1) NULL,
	[cd_grupoComprasPadrao_compradores] [varchar](6) NULL,
	[cd_grupoAprovacaoContrato_compradores] [varchar](6) NULL,
	[cd_perfilAcc_compradores] [varchar](22) NULL,
	[cd_usuarioBloqueado_compradores] [varchar](1) NULL,
	[cd_recno_SY1] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_condicoesPagamento]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_condicoesPagamento](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_condicoesPagamento] [varchar](2) NULL,
	[cd_condicao_condicoesPagamento] [varchar](3) NULL,
	[tp_condicao_condicoesPagamento] [varchar](1) NULL,
	[nm_condicao_condicoesPagamento] [varchar](40) NULL,
	[ds_condicao_condicoesPagamento] [varchar](15) NULL,
	[ds_dias_condicoesPagamento] [varchar](1) NULL,
	[st_registro_condicoesPagamento] [varchar](1) NULL,
	[fl_permiteAdiantamento_condicoesPagamento] [varchar](1) NULL,
	[cd_recno_CTT] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_depara_stouFilial]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_depara_stouFilial](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cod_filialStou] [varchar](5) NULL,
	[cod_filialRIP] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_dependentes]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_dependentes](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_funcionarios] [varchar](2) NULL,
	[cd_matricula_funcionarios] [varchar](6) NULL,
	[cd_dependente] [varchar](2) NULL,
	[nm_dependente] [varchar](100) NULL,
	[cd_tpDependente] [varchar](2) NULL,
	[dt_nascimentoDependente] [varchar](8) NULL,
	[tp_sexoDependente] [varchar](50) NULL,
	[tp_grauParentesco] [varchar](50) NULL,
	[tp_dependenteImpostoRenda] [varchar](50) NULL,
	[tp_dependenteSalarioFamilia] [varchar](50) NULL,
	[cd_recno_SRB] [int] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
	[vl_idadeDependente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_empresasFiliais]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_empresasFiliais](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_empresaFilial_empresasFiliais] [varchar](60) NULL,
	[cd_empresa_empresasFiliais] [varchar](2) NULL,
	[cd_filial_empresasFiliais] [varchar](12) NULL,
	[nm_filial_empresasFiliais] [varchar](41) NULL,
	[nm_empresa_empresasFiliais] [varchar](40) NULL,
	[nm_empresaCompleto_empresasFiliais] [varchar](60) NULL,
	[sg_unidadeFederal_empresasFiliais] [varchar](2) NULL,
	[cd_recno_SYS_COMPANY] [bigint] NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_enderecosEstoque]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_enderecosEstoque](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_enderecosEstoque] [varchar](2) NULL,
	[cd_armazem_enderecosEstoque] [varchar](2) NULL,
	[cd_endereco_enderecosEstoque] [varchar](15) NULL,
	[ds_endereco_enderecosEstoque] [varchar](30) NULL,
	[st_endereco_enderecosEstoque] [varchar](1) NULL,
	[cd_produto_enderecosEstoque] [varchar](15) NULL,
	[hr_ultimoMovimento_enderecosEstoque] [varchar](5) NULL,
	[fl_ok_enderecosEstoque] [varchar](2) NULL,
	[cd_excecao_enderecosEstoque] [varchar](3) NULL,
	[dt_geracao_enderecosEstoque] [date] NULL,
	[hr_geracao_enderecosEstoque] [varchar](4) NULL,
	[dt_bloqueioInventario_enderecosEstoque] [date] NULL,
	[cd_etiqueta_enderecosEstoque] [varchar](10) NULL,
	[cd_recno_SBE] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_esocial_tpDependentes]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_esocial_tpDependentes](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_tpDependente] [varchar](2) NOT NULL,
	[ds_tpDependente] [varchar](150) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cd_tpDependente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_fichaMedica]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_fichaMedica](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial] [varchar](2) NOT NULL,
	[cd_fichaMedica] [varchar](9) NOT NULL,
	[cd_candidato] [varchar](6) NOT NULL,
	[cd_filial_funcionario] [varchar](2) NOT NULL,
	[cd_matricula_funcionario] [varchar](6) NOT NULL,
	[cd_dependente] [varchar](2) NOT NULL,
	[nm_funcionario] [varchar](40) NOT NULL,
	[dt_dataImpl] [varchar](8) NOT NULL,
	[cd_fichaAnterior] [varchar](12) NOT NULL,
	[dt_dataNascimento] [varchar](8) NOT NULL,
	[cd_recno_TM0] [int] NOT NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_fornecedores]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_fornecedores](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_fornecedores] [varchar](2) NULL,
	[cd_fornecedor_fornecedores] [varchar](6) NULL,
	[cd_loja_fornecedores] [varchar](2) NULL,
	[nm_filial_fornecedores] [varchar](40) NULL,
	[nm_fantasia_fornecedores] [varchar](20) NULL,
	[nm_enderecoFornecedor_fornecedores] [varchar](80) NULL,
	[nr_endereco_fornecedores] [varchar](6) NULL,
	[sg_unidadeFederal_fornecedores] [varchar](2) NULL,
	[nm_estado_fornecedores] [varchar](20) NULL,
	[nm_municipioFornecedor_fornecedores] [varchar](60) NULL,
	[cnr_cpfCnpj_fornecedores] [varchar](14) NULL,
	[nr_telefone_fornecedores] [varchar](50) NULL,
	[nr_faxFornecedor_fornecedores] [varchar](15) NULL,
	[nr_inscricaoEstadual_fornecedores] [varchar](18) NULL,
	[nr_inscricaoMunicipal_fornecedores] [varchar](18) NULL,
	[nr_contatoEmpresa_fornecedores] [varchar](15) NULL,
	[cd_condicaoPagamento_fornecedores] [varchar](3) NULL,
	[nr_maiorAtrasoEmDias_fornecedores] [float] NULL,
	[vl_maiorCompra_fornecedores] [float] NULL,
	[nr_mediaAtrasoEmDias_fornecedores] [float] NULL,
	[vl_maiorSaldoCredor_fornecedores] [float] NULL,
	[nt_totalCompras_fornecedores] [float] NULL,
	[dt_primeiraCompra_fornecedores] [date] NULL,
	[dt_ultimaCompra_fornecedores] [date] NULL,
	[cd_paisFornecedor_fornecedores] [varchar](3) NULL,
	[fl_fornecedorHomologado_fornecedores] [varchar](1) NULL,
	[cd_atividadeEconomica_fornecedores] [varchar](7) NULL,
	[cd_recno_SA2] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_funcionarios]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_funcionarios](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_funcionarios] [varchar](2) NULL,
	[nm_funcionario_funcionarios] [varchar](30) NULL,
	[cd_matricula_funcionarios] [varchar](6) NULL,
	[dt_admissao_funcionarios] [date] NULL,
	[cd_centroCusto_funcionarios] [varchar](9) NULL,
	[cd_funcao_funcionarios] [varchar](5) NULL,
	[ds_funcao_funcionarios] [varchar](20) NULL,
	[tp_maoObra_funcionarios] [varchar](8) NULL,
	[cd_recno_SRA] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
	[ds_escolaridade_funcionarios] [varchar](40) NULL,
	[ds_estadoCivil_funcionarios] [varchar](15) NULL,
	[tp_defic_funcionarios] [varchar](35) NULL,
	[ds_faixaEtaria_funcionarios] [varchar](8) NULL,
	[vl_salario_funcionarios] [float] NULL,
	[vl_idade_funcionarios] [int] NULL,
	[tp_sexo_funcionario] [varchar](10) NULL,
	[tp_raca_funcionario] [varchar](15) NULL,
	[tp_situacao_folha] [varchar](12) NOT NULL,
	[dt_demissao_funcionario] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_grupoProdutos]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_grupoProdutos](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_grupoProdutos] [varchar](2) NULL,
	[cd_grupo_grupoProdutos] [varchar](4) NULL,
	[ds_grupo_grupoProdutos] [varchar](100) NULL,
	[st_grupo_grupoProdutos] [varchar](1) NULL,
	[cd_grupoRelacionado_grupoProdutos] [varchar](40) NULL,
	[cd_grupoProdutos_grupoProdutos] [varchar](2) NULL,
	[cd_familiaRip_grupoProdutos] [varchar](3) NULL,
	[cd_contaContabilConsumo_grupoProdutos] [varchar](20) NULL,
	[cd_contaContabilDespesa_grupoProdutos] [varchar](20) NULL,
	[tp_produto_grupoProdutos] [varchar](2) NULL,
	[cd_categoriaOrex_grupoProdutos] [varchar](2) NULL,
	[nr_diasEntrega_grupoProdutos] [varchar](17) NULL,
	[cd_naturezaConsumo_grupoProdutos] [varchar](9) NULL,
	[cd_naturezaAplicacao_grupoProdutos] [varchar](9) NULL,
	[cd_recno_SBM] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
	[fl_bloqueado_grupoProdutos] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_locaisEstoque]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_locaisEstoque](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filialArmazem_locaisEstoque] [varchar](10) NULL,
	[cd_filial_locaisEstoque] [varchar](2) NULL,
	[cd_local_locaisEstoque] [varchar](2) NULL,
	[ds_local_locaisEstoque] [varchar](100) NULL,
	[tp_armazem_locaisEstoque] [varchar](1) NULL,
	[fl_integracaoPims_locaisEstoque] [varchar](1) NULL,
	[fl_entraCalculo_locaisEstoque] [varchar](1) NULL,
	[fl_verificaSaldoAlternativo_locaisEstoque] [varchar](1) NULL,
	[fl_anp45_locaisEstoque] [varchar](1) NULL,
	[fl_amrmazemVendaDms_locaisEstoque] [varchar](1) NULL,
	[fl_armazenagemUnitizada_locaisEstoque] [varchar](1) NULL,
	[cd_recno_NNR] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_niveisCargo]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_niveisCargo](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ds_cargo] [varchar](28) NOT NULL,
	[tp_nivel_cargo] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_produtos]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_produtos](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_produtos] [varchar](2) NULL,
	[cd_produto_produtos] [varchar](15) NULL,
	[ds_produto_produtos] [varchar](100) NULL,
	[tp_produto_produtos] [varchar](2) NULL,
	[ds_unidadeMedida_produtos] [varchar](2) NULL,
	[cd_grupo_produtos] [varchar](4) NULL,
	[vl_aliquoaIcms_produtos] [float] NULL,
	[cd_nomenclaturaExtMercosul_produtos] [varchar](10) NULL,
	[cd_pontoPedido_produtos] [float] NULL,
	[dt_ultimoCalculoCusto_produtos] [date] NULL,
	[vl_ultimoPrecoCompra_produtos] [float] NULL,
	[dt_ultimaCompra_produtos] [date] NULL,
	[vl_estoqueSeguranca_produtos] [float] NULL,
	[nr_prazoEntrega_produtos] [float] NULL,
	[tp_prazoEntrega_produtos] [varchar](1) NULL,
	[vl_loteEconomico_produtos] [float] NULL,
	[vl_loteMinimo_produtos] [float] NULL,
	[cd_contaContabilProducao_produtos] [varchar](20) NULL,
	[nr_tolerancia_produtos] [float] NULL,
	[dt_ultimaRevisao_produtos] [date] NULL,
	[cd_grupoTributacao_produtos] [varchar](6) NULL,
	[dt_consumoInicial_produtos] [date] NULL,
	[cd_fabricante_produtos] [varchar](20) NULL,
	[cd_produtoPai_produtos] [varchar](15) NULL,
	[vl_parcentualCofins_produtos] [float] NULL,
	[vl_parcentualPis_produtos] [float] NULL,
	[vl_estoqueMaximo_produtos] [float] NULL,
	[vl_ultimaCompra_produtos] [float] NULL,
	[cd_grupoContabilCusteio_produtos] [varchar](8) NULL,
	[tp_bloqueioTela_produtos] [varchar](1) NULL,
	[cd_situacaoTributaria_produtos] [varchar](1) NULL,
	[cd_anterior_produtos] [varchar](15) NULL,
	[fl_devolucaoObrigatoria_produtos] [varchar](1) NULL,
	[dt_alteracaoSce_produtos] [date] NULL,
	[ds_referenciaFrabricante_produtos] [varchar](30) NULL,
	[nr_diasEntrega_produtos] [varchar](17) NULL,
	[ds_completaProduto_produtos] [varbinary](max) NULL,
	[nm_cientifico_produtos] [varchar](254) NULL,
	[cd_recno_SB5] [int] NOT NULL,
	[cd_recno_SB1] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_dim_statusPedidosEmitidos]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_dim_statusPedidosEmitidos](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_tabela_statusPedidosEmitidos] [varchar](4) NULL,
	[st_pedidoEmitido_statusPedidosEmitidos] [varchar](10) NULL,
	[ds_pedidoEmitido_statusPedidosEmitidos] [varchar](150) NULL,
	[cd_recno_ZX5] [bigint] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_ArqNaoProcessadosRPA]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_ArqNaoProcessadosRPA](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_ID] [int] NOT NULL,
	[dt_Data_do_Email] [varchar](250) NULL,
	[ds_Origem_do_Email] [varchar](250) NULL,
	[dt_Data_do_processamento] [varchar](250) NULL,
	[ds_Status] [varchar](250) NULL,
	[ds_Mensagem_de_Erro] [varchar](max) NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_ArqProcessadosRPA]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_ArqProcessadosRPA](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_ID] [int] NOT NULL,
	[dt_Data_do_Email] [varchar](250) NULL,
	[ds_Origem_do_Email] [varchar](250) NULL,
	[dt_Data_do_processamento] [varchar](250) NULL,
	[ds_Status] [varchar](250) NULL,
	[ds_Arquivo_PDF] [varchar](max) NULL,
	[ds_CPF] [varchar](250) NULL,
	[ds_Funcionario] [varchar](250) NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_atestados]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_atestados](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial] [varchar](2) NULL,
	[cd_fichaFuncionario] [varchar](9) NOT NULL,
	[dt_dataInicio_afastamento] [varchar](8) NULL,
	[hr_horaInicio_afastamento] [varchar](5) NULL,
	[dt_dataFim_afastamento] [varchar](8) NULL,
	[hr_horaFim_afastamento] [varchar](5) NULL,
	[cd_grupoCID] [varchar](3) NULL,
	[cd_CID] [varchar](8) NULL,
	[cd_emitenteAtestado] [varchar](12) NULL,
	[tp_afastamento] [varchar](1) NULL,
	[cd_afastamento] [varchar](3) NULL,
	[tp_atestado] [varchar](20) NULL,
	[cd_atestado] [varchar](10) NULL,
	[cd_abono] [varchar](3) NULL,
	[vl_qtdeDias] [float] NULL,
	[tp_medicoEmitente] [varchar](1) NULL,
	[cd_acidenteTrabalho] [varchar](6) NULL,
	[cd_recno_TNY] [int] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_docMontagemVolume]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_docMontagemVolume](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_docMontagemVolume] [varchar](2) NOT NULL,
	[cd_centroCusto_docMontagemVolume] [varchar](9) NOT NULL,
	[cd_endereco_docMontagemVolume] [varchar](15) NOT NULL,
	[cd_carga_docMontagemVolume] [varchar](15) NOT NULL,
	[cd_montagem_docMontagemVolume] [varchar](9) NOT NULL,
	[dt_montagem_docMontagemVolume] [varchar](8) NOT NULL,
	[tp_status_docMontagemVolume] [varchar](1) NOT NULL,
	[cd_ordemExpedicao_docMontagemVolume] [varchar](9) NULL,
	[cd_filialDestino_docMontagemVolume] [varchar](2) NOT NULL,
	[cd_recno_ZNI] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_ErrosRPA]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_ErrosRPA](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_ID] [int] NOT NULL,
	[ds_Arquivos_do_Email] [varchar](max) NULL,
	[dt_Data_do_Erro] [varchar](250) NULL,
	[ds_Mensagem_do_Erro] [varchar](7000) NULL,
	[dt_Data_do_Email] [varchar](250) NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_estoque]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_estoque](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cc_estoqueXestoqueEnderecos] [varchar](max) NULL,
	[cd_filial_estoque] [varchar](2) NULL,
	[cd_produto_estoque] [varchar](15) NULL,
	[cd_armazem_estoque] [varchar](2) NULL,
	[qt_saldoFimMes_estoque] [float] NULL,
	[qt_saldoAtual_estoque] [float] NULL,
	[vl_saldoAtual_estoque] [float] NULL,
	[vl_custoUnitario_estoque] [float] NULL,
	[qt_empenhada_estoque] [float] NULL,
	[dt_ultimaSaida_estoque] [varchar](8) NULL,
	[qt_reservada_estoque] [float] NULL,
	[qt_pedidoVendas_estoque] [float] NULL,
	[qt_naoEnderecada_estoque] [float] NULL,
	[qt_previstaParaEntrar_estoque] [float] NULL,
	[dt_ultimoInventario_estoque] [varchar](8) NULL,
	[dt_bloqueioInventarioFinal_estoque] [varchar](8) NULL,
	[qt_saldoPoder3_estoque] [float] NULL,
	[qt_aEnderecar_estoque] [float] NULL,
	[dt_bloqueioInventarioInicial_estoque] [varchar](8) NULL,
	[qt_saldoFimMes2_estoque] [float] NULL,
	[tp_armazem_estoque] [varchar](1) NULL,
	[vl_custoUnitarioReposicao_estoque] [float] NULL,
	[qt_ultimoSaldoEmEstoque_estoque] [float] NULL,
	[dt_ultimoEnvio_estoque] [varchar](8) NULL,
	[tp_bloqueio_estoque] [varchar](1) NULL,
	[ds_fechamentoInicial_estoque] [varchar](8) NULL,
	[ds_fechamentoFinal_estoque] [varchar](8) NULL,
	[hr_ultimoMovimento_estoque] [varchar](8) NULL,
	[hr_ultimoEnvio_estoque] [varchar](8) NULL,
	[dt_ultimoMovimento_estoque] [varchar](8) NULL,
	[cd_recno_SB2] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_estoqueEndereco]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_estoqueEndereco](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cc_estoqueXestoqueEnderecos] [varchar](max) NULL,
	[cd_filial_estoqueEnderecos] [varchar](2) NULL,
	[cd_produto_estoqueEnderecos] [varchar](15) NULL,
	[cd_armazem_estoqueEnderecos] [varchar](2) NULL,
	[cd_endereco_estoqueEnderecos] [varchar](15) NULL,
	[qt_endereco_estoqueEnderecos] [float] NULL,
	[qt_empenhoEndereco_estoqueEnderecos] [float] NULL,
	[qt_empenhadaPrevista_estoqueEnderecos] [float] NULL,
	[dt_ultimoInventario_estoqueEnderecos] [varchar](8) NULL,
	[cd_recno_SBF] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_expedicaoVolumes]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_expedicaoVolumes](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_expedicaoVolumes] [varchar](2) NOT NULL,
	[cd_ordem_expedicaoVolumes] [varchar](9) NULL,
	[dt_emissao_expedicaoVolumes] [varchar](8) NULL,
	[cd_centroCusto_expedicaoVolumes] [varchar](9) NULL,
	[cd_filialDestino_expedicaoVolumes] [varchar](2) NULL,
	[tp_documento_expedicaoVolumes] [varchar](2) NULL,
	[nm_usuarioCriacao_expedicaoVolumes] [varchar](25) NULL,
	[cd_documento_expedicaoVolumes] [varchar](10) NULL,
	[cd_pedidoRemessa_expedicaoVolumes] [varchar](6) NULL,
	[cd_transp_expedicaoVolumes] [varchar](6) NULL,
	[cd_recno_ZNM] [int] NOT NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_GestaoBotsRPA]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_GestaoBotsRPA](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_ID] [int] NOT NULL,
	[dt_Data_do_Email] [varchar](250) NULL,
	[ds_Arquivos_do_Email] [varchar](max) NULL,
	[ds_Pasta_de_destino_do_email] [varchar](250) NULL,
	[dt_Data_do_processamento] [varchar](250) NULL,
	[ds_Mover_para_processados] [varchar](250) NULL,
	[ds_Remetente_do_Email] [varchar](250) NULL,
	[ds_Assunto_do_Email] [varchar](250) NULL,
	[ds_Ocupação] [varchar](250) NULL,
	[nm_Fluig] [varchar](250) NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_horaextra]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_horaextra](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_funcionarios] [varchar](2) NULL,
	[cd_matricula_funcionarios] [varchar](6) NULL,
	[cd_filialMatricula_funcionarios] [varchar](8) NOT NULL,
	[dt_pontoEspelho] [datetime] NULL,
	[ds_horas_normais] [varchar](5) NULL,
	[ds_desconto] [varchar](5) NULL,
	[ds_horas_extras_total] [varchar](5) NULL,
	[ds_extra_excessiva] [varchar](5) NULL,
	[ds_extra_normal] [varchar](5) NULL,
	[ds_total_calculado] [varchar](5) NULL,
	[qt_horas_normais] [float] NULL,
	[qt_desconto] [float] NULL,
	[qt_horas_extras_total] [float] NULL,
	[qt_horas_extras_50] [float] NULL,
	[qt_horas_extras_55] [float] NULL,
	[qt_horas_extras_60] [float] NULL,
	[qt_horas_extras_70] [float] NULL,
	[qt_horas_extras_75] [float] NULL,
	[qt_horas_extras_80] [float] NULL,
	[qt_horas_extras_100] [float] NULL,
	[qt_horas_extras_120] [float] NULL,
	[qt_horas_extras_150] [float] NULL,
	[qt_extra_excessiva] [float] NULL,
	[qt_extra_normal] [float] NULL,
	[qt_total_calculado] [float] NULL,
	[cd_id_unico_stou] [varchar](15) NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
	[cd_deptoConta_funcionarios] [varchar](6) NULL,
	[cd_deptocc_funcionarios] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_inclusaomarcacao]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_inclusaomarcacao](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_matricula_funcionarios] [varchar](6) NULL,
	[cd_filial_funcionarios] [varchar](2) NULL,
	[dt_pontoEspelho] [datetime] NULL,
	[dt_marcacao1] [datetime] NULL,
	[dt_marcacao2] [datetime] NULL,
	[dt_marcacao3] [datetime] NULL,
	[dt_marcacao4] [datetime] NULL,
	[dt_marcacao5] [datetime] NULL,
	[dt_marcacao6] [datetime] NULL,
	[dt_marcacao7] [datetime] NULL,
	[dt_marcacao8] [datetime] NULL,
	[dt_marcacao9] [datetime] NULL,
	[dt_marcacao10] [datetime] NULL,
	[dt_marcacao11] [datetime] NULL,
	[dt_marcacao12] [datetime] NULL,
	[dt_marcacao1_alterada] [datetime] NULL,
	[dt_marcacao2_alterada] [datetime] NULL,
	[dt_marcacao3_alterada] [datetime] NULL,
	[dt_marcacao4_alterada] [datetime] NULL,
	[dt_marcacao5_alterada] [datetime] NULL,
	[dt_marcacao6_alterada] [datetime] NULL,
	[dt_marcacao7_alterada] [datetime] NULL,
	[dt_marcacao8_alterada] [datetime] NULL,
	[dt_marcacao9_alterada] [datetime] NULL,
	[dt_marcacao10_alterada] [datetime] NULL,
	[dt_marcacao11_alterada] [datetime] NULL,
	[dt_marcacao12_alterada] [datetime] NULL,
	[cd_id_unico_stou] [varchar](15) NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
	[cd_deptoConta_funcionarios] [varchar](6) NULL,
	[cd_deptocc_funcionarios] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_itensMontagemVolume]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_itensMontagemVolume](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_itensMontagemVolume] [varchar](2) NOT NULL,
	[cd_montagem_itensMonstagemVolume] [varchar](9) NULL,
	[cd_item_itensMontagemVolume] [varchar](4) NULL,
	[cd_produto_itensMontagemVolume] [varchar](15) NULL,
	[qt_origem_itensMontagemVolume] [float] NOT NULL,
	[cd_recno_ZNJ] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_LogRPA]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_LogRPA](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_ID] [int] NOT NULL,
	[ds_Nome_Pasta_Clinica] [varchar](250) NULL,
	[ds_Nome_Pasta_Funcionario] [varchar](250) NULL,
	[ds_Status_Tarefa_Executada] [varchar](250) NULL,
	[ds_Msg_Excecao] [varchar](max) NULL,
	[dt_Data_Hora] [varchar](250) NULL,
	[nm_Cod_Fluig] [varchar](250) NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_mestreInventario]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_mestreInventario](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_mestreInventario] [varchar](2) NOT NULL,
	[cd_inventario_mestreInventario] [varchar](9) NOT NULL,
	[tp_analise_mestreInventario] [varchar](15) NOT NULL,
	[dt_inventario_mestreInventario] [varchar](8) NOT NULL,
	[qt_contagensArealizar_mestreInventario] [float] NOT NULL,
	[cd_almoxarifado_mestreInventario] [varchar](5) NOT NULL,
	[tp_tipoInventario_mestreInventario] [varchar](15) NOT NULL,
	[cd_endereco_mestreInventario] [varchar](15) NOT NULL,
	[cd_produto_mestreInventario] [varchar](15) NOT NULL,
	[qt_contagensRealizadas_mestreInventario] [float] NOT NULL,
	[tp_status_mestreInventario] [varchar](25) NOT NULL,
	[tp_autorizacaoRecontagem_mestreInventario] [varchar](5) NOT NULL,
	[tp_curvaA_mestreInventario] [varchar](5) NOT NULL,
	[tp_curvaB_mestreInventario] [varchar](5) NOT NULL,
	[tp_curvaC_mestreInventario] [varchar](5) NOT NULL,
	[tp_inventarioGuiado_mestreInventario] [varchar](5) NOT NULL,
	[tp_inventarioEletronico_mestreInventario] [varchar](5) NOT NULL,
	[tp_dispositivo_mestreInventario] [varchar](15) NOT NULL,
	[cd_recno_CBA] [int] NOT NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_movInterna]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_movInterna](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_movInterna] [varchar](2) NOT NULL,
	[tp_movimento_movInterna] [varchar](3) NOT NULL,
	[cd_produto_movInterna] [varchar](15) NOT NULL,
	[cd_unidade_movInterna] [varchar](2) NOT NULL,
	[qt_movimento_movInterna] [float] NOT NULL,
	[tp_reDe_movInterna] [varchar](3) NOT NULL,
	[cd_contabil_movInterna] [varchar](20) NOT NULL,
	[cd_ordemProducao_movInterna] [varchar](14) NOT NULL,
	[cd_armazem_movInterna] [varchar](2) NOT NULL,
	[cd_documento_movInterna] [varchar](9) NOT NULL,
	[dt_emissao_movInterna] [varchar](8) NOT NULL,
	[cd_grupo_movInterna] [varchar](4) NOT NULL,
	[vl_custo1_movInterna] [float] NOT NULL,
	[vl_custo2_movInterna] [float] NOT NULL,
	[vl_custo3_movInterna] [float] NOT NULL,
	[vl_custo4_movInterna] [float] NOT NULL,
	[vl_custo5_movInterna] [float] NOT NULL,
	[cd_centroCusto_movInterna] [varchar](9) NOT NULL,
	[vf_parcialTotal_movInterna] [varchar](1) NOT NULL,
	[vf_estornardo_movInterna] [varchar](1) NOT NULL,
	[cd_sequencial_movInterna] [varchar](6) NOT NULL,
	[cd_segundaUnidade_movInterna] [varchar](2) NOT NULL,
	[qt_movimentoSegundaUnidade_movInterna] [float] NOT NULL,
	[cd_tipo_movInterna] [varchar](2) NOT NULL,
	[cd_nivelEstrutura_movInterna] [varchar](3) NOT NULL,
	[nm_usuario_movInterna] [varchar](25) NOT NULL,
	[cd_regraWms_movInterna] [varchar](1) NOT NULL,
	[vl_perda_movInterna] [float] NOT NULL,
	[dt_lancContabil_movInterna] [varchar](8) NOT NULL,
	[cd_sequencia_movInterna] [varchar](3) NOT NULL,
	[cd_chave_movInterna] [varchar](2) NOT NULL,
	[cd_operacaoPai_movInterna] [varchar](6) NOT NULL,
	[cd_seqRecalc_movInterna] [varchar](14) NOT NULL,
	[vl_porcRateio_movInterna] [float] NOT NULL,
	[cd_lote_movInterna] [varchar](21) NOT NULL,
	[cd_subLote_movInterna] [varchar](6) NOT NULL,
	[cd_validLote_movInterna] [varchar](8) NOT NULL,
	[cd_endereco_movInterna] [varchar](15) NOT NULL,
	[cd_numSerie_movInterna] [varchar](20) NOT NULL,
	[vl_custoFifo1_movInterna] [float] NOT NULL,
	[vl_custoFIfo2_movInterna] [float] NOT NULL,
	[vl_custoFifo3_movInterna] [float] NOT NULL,
	[vl_custoFifo4_movInterna] [float] NOT NULL,
	[vl_custoFifo5_movInterna] [float] NOT NULL,
	[cd_itemRemito_movInterna] [varchar](2) NOT NULL,
	[cd_verificacao_movInterna] [varchar](2) NOT NULL,
	[cd_itemConta_movInterna] [varchar](9) NOT NULL,
	[cd_clVal_movInterna] [varchar](9) NOT NULL,
	[cd_projeto_movInterna] [varchar](10) NOT NULL,
	[cd_tarefa_movInterna] [varchar](12) NOT NULL,
	[cd_ordemServico_movInterna] [varchar](6) NOT NULL,
	[cd_servico_movInterna] [varchar](3) NOT NULL,
	[cd_statusServico_movInterna] [varchar](1) NOT NULL,
	[cd_osAssinTec_movInterna] [varchar](8) NOT NULL,
	[vl_potenciaLote_movInterna] [float] NOT NULL,
	[cd_estrFisica_movInterna] [varchar](6) NOT NULL,
	[cd_regAtendim_movInterna] [varchar](10) NOT NULL,
	[cd_docSWN_movInterna] [varchar](15) NOT NULL,
	[cd_itemSWN_movInterna] [varchar](4) NOT NULL,
	[cd_itemGrade_movInterna] [varchar](3) NOT NULL,
	[tp_statusMov_movInterna] [varchar](2) NOT NULL,
	[vl_reposicao_movInterna] [float] NOT NULL,
	[vl_repos2am_movInterna] [float] NOT NULL,
	[vl_repos3am_movInterna] [float] NOT NULL,
	[vl_repos4am_movInterna] [float] NOT NULL,
	[vl_repos5am_movInterna] [float] NOT NULL,
	[vl_repUni_movInterna] [float] NOT NULL,
	[cd_moedaCrep_movInterna] [varchar](1) NOT NULL,
	[cd_revEstrutura_movInterna] [varchar](3) NOT NULL,
	[cd_procImport_movInterna] [varchar](20) NOT NULL,
	[cd_emenhoOP_movInterna] [varchar](1) NOT NULL,
	[vl_CSTFixo_movInterna] [float] NOT NULL,
	[vl_macroNutr_movInterna] [float] NOT NULL,
	[vl_microNutr_movInterna] [float] NOT NULL,
	[cd_moedaCfixo_movInterna] [varchar](1) NOT NULL,
	[cd_diario_movInterna] [varchar](2) NOT NULL,
	[vf_garantia_movInterna] [varchar](1) NOT NULL,
	[cd_seqDiario_movInterna] [varchar](10) NOT NULL,
	[cd_boletim_movInterna] [varchar](10) NOT NULL,
	[qt_ganho_movInterna] [float] NOT NULL,
	[qt_maior_movInterna] [float] NOT NULL,
	[cd_SA_movInterna] [varchar](6) NOT NULL,
	[cd_perImpo_movInterna] [float] NOT NULL,
	[vl_valorVi_movInterna] [float] NOT NULL,
	[cd_chaveNF_movInterna] [varchar](52) NOT NULL,
	[cd_desconto_movInterna] [varchar](8) NOT NULL,
	[cd_cat83_movInterna] [varchar](6) NOT NULL,
	[cd_marca_movInterna] [varchar](2) NOT NULL,
	[cd_itemSA_movInterna] [varchar](2) NOT NULL,
	[vl_PD_movInterna] [float] NOT NULL,
	[cd_tipoEntrada_movInterna] [varchar](3) NOT NULL,
	[cd_safra_movInterna] [varchar](15) NOT NULL,
	[cd_mercadoDeb_movInterna] [varchar](16) NOT NULL,
	[cd_mercadoCred_movInterna] [varchar](16) NOT NULL,
	[cd_modalidadeDeb_movInterna] [varchar](16) NOT NULL,
	[cd_modalidadeCred_movInterna] [varchar](16) NOT NULL,
	[cd_localDeb_movInterna] [varchar](16) NOT NULL,
	[cd_localCred_movInterna] [varchar](16) NOT NULL,
	[cd_atividadeDeb_movInterna] [varchar](16) NOT NULL,
	[cd_atividadeCred_movInterna] [varchar](16) NOT NULL,
	[cd_letraDeb_movInterna] [varchar](16) NOT NULL,
	[cd_letraCred_movInterna] [varchar](16) NOT NULL,
	[cd_tanque_movInterna] [varchar](6) NOT NULL,
	[vl_massaEsp_movInterna] [float] NOT NULL,
	[vl_tempAmostra_movInterna] [float] NOT NULL,
	[vl_tempTanque_movInterna] [float] NOT NULL,
	[vl_densAmbient_movInterna] [float] NOT NULL,
	[qt_ambiente_movInterna] [float] NOT NULL,
	[vl_fatorCorrecao_movInterna] [float] NOT NULL,
	[tp_movAjust_movInterna] [varchar](2) NOT NULL,
	[cd_fornecedor_movInterna] [varchar](6) NOT NULL,
	[cd_lojaFornecedor_movInterna] [varchar](2) NOT NULL,
	[cd_operacao_movInterna] [varchar](6) NOT NULL,
	[ds_observacao_movInterna] [varchar](20) NOT NULL,
	[cd_chaveSF2_movInterna] [varchar](52) NOT NULL,
	[cd_dcf_movInterna] [varchar](6) NOT NULL,
	[ds_observ2_movInterna] [varchar](30) NOT NULL,
	[cd_fornecedorDoc_movInterna] [varchar](6) NOT NULL,
	[cd_lojaDoc_movInterna] [varchar](2) NOT NULL,
	[cd_perBlocoK_movInterna] [varchar](6) NOT NULL,
	[cd_origem_movInterna] [varchar](1) NOT NULL,
	[nm_usuarioInclusao_movInterna] [varchar](17) NOT NULL,
	[cd_estaMat_movInterna] [varchar](1) NOT NULL,
	[vl_percCreditoObra_movInterna] [float] NOT NULL,
	[cd_centroCustoOrigem_movInterna] [varchar](9) NOT NULL,
	[cd_chaveAcessoNF_movInterna] [varchar](44) NOT NULL,
	[vf_campoUUID_movInterna] [uniqueidentifier] NULL,
	[cd_recno_SD3] [int] NOT NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_NaoProcessadosRPA]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_NaoProcessadosRPA](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_ID] [int] NOT NULL,
	[dt_Data_do_Email] [varchar](250) NULL,
	[ds_Origem_do_Email] [varchar](250) NULL,
	[dt_Data_do_processamento] [varchar](250) NULL,
	[ds_Status] [varchar](250) NULL,
	[ds_Mensagem_de_Erro] [varchar](max) NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_notasFiscaisEntrada]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_notasFiscaisEntrada](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cc_pedidosComprasXnotasFiscaisEntrada] [varchar](max) NULL,
	[cd_filial_notasFiscaisEntrada] [varchar](2) NULL,
	[nr_documento_notasFiscaisEntrada] [varchar](9) NULL,
	[nr_serieDocumento_notasFiscaisEntrada] [varchar](3) NULL,
	[cd_fornecedor_notasFiscaisEntrada] [varchar](6) NULL,
	[cd_lojaFornecedor_notasFiscaisEntrada] [varchar](2) NULL,
	[cd_condicaoPagamento_notasFiscaisEntrada] [varchar](3) NULL,
	[nr_titulo_notasFiscaisEntrada] [varchar](9) NULL,
	[dt_emissao_notasFiscaisEntrada] [date] NULL,
	[nm_UnidadeFederal_notasFiscaisEntrada] [varchar](2) NULL,
	[vl_frete_notasFiscaisEntrada] [float] NULL,
	[vl_despesas_notasFiscaisEntrada] [float] NULL,
	[vl_baseIcm_notasFiscaisEntrada] [float] NULL,
	[vl_icm_notasFiscaisEntrada] [float] NULL,
	[vl_baseIpi_notasFiscaisEntrada] [float] NULL,
	[vl_ipi_notasFiscaisEntrada] [float] NULL,
	[vl_mercadoria_notasFiscaisEntrada] [float] NULL,
	[vl_bruto_notasFiscaisEntrada] [float] NULL,
	[dt_digitacao_notasFiscaisEntrada] [date] NULL,
	[dt_lancamento_notasFiscaisEntrada] [date] NULL,
	[fl_importacao_notasFiscaisEntrada] [varchar](1) NULL,
	[vl_impostoImportacao_notasFiscaisEntrada] [float] NULL,
	[vl_inss_notasFiscaisEntrada] [float] NULL,
	[vl_iss_notasFiscaisEntrada] [float] NULL,
	[vl_icms_notasFiscaisEntrada] [float] NULL,
	[st_notaFiscal_notasFiscaisEntrada] [varchar](1) NULL,
	[dt_recebimento_notasFiscaisEntrada] [date] NULL,
	[cd_notaFiscalEletronica_notasFiscaisEntrada] [varchar](20) NULL,
	[cd_emissaoNotaFicalEletronica_notasFiscaisEntrada] [varchar](8) NULL,
	[cd_filialOrigem_notasFiscaisEntrada] [varchar](2) NULL,
	[cd_clienteDestino_notasFiscaisEntrada] [varchar](6) NULL,
	[cd_lojaClienteDestino_notasFiscaisEntrada] [varchar](2) NULL,
	[cd_lojaClienteOrigem_notasFiscaisEntrada] [varchar](2) NULL,
	[cd_fornecedorEntrega_notasFiscaisEntrada] [varchar](6) NULL,
	[cd_fluig_notasFiscaisEntrada] [float] NULL,
	[cd_filial_notasFiscaisEntradaItens] [varchar](2) NULL,
	[cd_item_notasFiscaisEntradaItens] [varchar](4) NULL,
	[cd_produto_notasFiscaisEntradaItens] [varchar](15) NULL,
	[ds_unidadeMedida_notasFiscaisEntradaItens] [varchar](2) NULL,
	[qt_produto_notasFiscaisEntradaItens] [float] NULL,
	[vl_unitario_notasFiscaisEntradaItens] [float] NULL,
	[vl_total_notasFiscaisEntradaItens] [float] NULL,
	[vl_ipi_notasFiscaisEntradaItens] [float] NULL,
	[vl_icm_notasFiscaisEntradaItens] [float] NULL,
	[tp_entrada_notasFiscaisEntradaItens] [varchar](3) NULL,
	[cd_ficalOperacao_notasFiscaisEntradaItens] [varchar](5) NULL,
	[vl_desconto_notasFiscaisEntradaItens] [float] NULL,
	[vl_aliquotaIpi_notasFiscaisEntradaItens] [float] NULL,
	[vl_aliquotaIcms_notasFiscaisEntradaItens] [float] NULL,
	[cd_contaContabil_notasFiscaisEntradaItens] [varchar](20) NULL,
	[cd_itemContaContabil_notasFiscaisEntradaItens] [varchar](9) NULL,
	[cd_centroCusto_notasFiscaisEntradaItens] [varchar](9) NULL,
	[cd_pedidoCompra_notasFiscaisEntradaItens] [varchar](6) NULL,
	[cd_itemPedidoCompra_notasFiscaisEntradaItens] [varchar](4) NULL,
	[cd_forncedor_notasFiscaisEntradaItens] [varchar](6) NULL,
	[cd_lojaFornecedor_notasFiscaisEntradaItens] [varchar](2) NULL,
	[cd_armazem_notasFiscaisEntradaItens] [varchar](2) NULL,
	[nr_documento_notasFiscaisEntradaItens] [varchar](9) NULL,
	[dt_emissao_notasFiscaisEntradaItens] [date] NULL,
	[dt_digitacao_notasFiscaisEntradaItens] [date] NULL,
	[cd_grupoProduto_notasFiscaisEntradaItens] [varchar](4) NULL,
	[tp_documento_notasFiscaisEntradaItens] [varchar](1) NULL,
	[nr_serieNotaFical_notasFiscaisEntradaItens] [varchar](3) NULL,
	[nr_documentoOriginal_notasFiscaisEntradaItens] [varchar](9) NULL,
	[nr_serieDocumentoOriginal_notasFiscaisEntradaItens] [varchar](3) NULL,
	[nr_itemDocumentoOriginal_notasFiscaisEntradaItens] [varchar](4) NULL,
	[qt_devolvida_notasFiscaisEntradaItens] [float] NULL,
	[vl_devolvido_notasFiscaisEntradaItens] [float] NULL,
	[dt_emissaoOriginal_notasFiscaisEntradaItens] [date] NULL,
	[nr_imobilizado_notasFiscaisEntradaItens] [varchar](14) NULL,
	[nr_tesClassificacao_notasFiscaisEntradaItens] [varchar](3) NULL,
	[cd_itemXml_notasFiscaisEntradaItens] [varchar](4) NULL,
	[tp_tesSugerida_notasFiscaisEntradaItens] [varchar](3) NULL,
	[vl_percentualReducaoIcmsXml_notasFiscaisEntradaItens] [float] NULL,
	[cd_recno_SF1] [int] NOT NULL,
	[cd_recno_SD1] [bigint] NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_notasFiscaisSaida]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_notasFiscaisSaida](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cc_pedidosVendasXnotasFiscaisSaida] [varchar](max) NULL,
	[cd_filial_notasFiscaisSaida] [varchar](2) NULL,
	[nr_documento_notasFiscaisSaida] [varchar](9) NULL,
	[nr_serieDocumento_notasFiscaisSaida] [varchar](3) NULL,
	[cd_cliente_notasFiscaisSaida] [varchar](6) NULL,
	[cd_loja_notasFiscaisSaida] [varchar](2) NULL,
	[cd_condicaoPagamento_notasFiscaisSaida] [varchar](3) NULL,
	[dt_emissao_notasFiscaisSaida] [date] NULL,
	[cd_cpfCnpjCliente_notasFiscaisSaida] [varchar](16) NULL,
	[st_notaFiscal_notasFiscaisSaida] [varchar](3) NULL,
	[cd_localTrabalho_notasFiscaisSaida] [varchar](20) NULL,
	[cd_mds_notasFiscaisSaida] [varchar](32) NULL,
	[cd_municipio_notasFiscaisSaida] [varchar](5) NULL,
	[cd_notaFiscal_notasFiscaisSaida] [varchar](36) NULL,
	[cd_unidadeFederalDestino_notasFiscaisSaida] [varchar](2) NULL,
	[cd_unidadeFederalOrigem_notasFiscaisSaida] [varchar](2) NULL,
	[cd_clienteRemessa_notasFiscaisSaida] [varchar](6) NULL,
	[cd_lojaRemessa_notasFiscaisSaida] [varchar](2) NULL,
	[cd_filial_notasFiscaisSaidaItens] [varchar](2) NULL,
	[cd_item_notasFiscaisSaidaItens] [varchar](2) NULL,
	[cd_produto_notasFiscaisSaidaItens] [varchar](15) NULL,
	[ds_unidadeMedida_notasFiscaisSaidaItens] [varchar](2) NULL,
	[qt_produto_notasFiscaisSaidaItens] [float] NULL,
	[vl_unitario_notasFiscaisSaidaItens] [float] NULL,
	[vl_total_notasFiscaisSaidaItens] [float] NULL,
	[vl_ipi_notasFiscaisSaidaItens] [float] NULL,
	[vl_icm_notasFiscaisSaidaItens] [float] NULL,
	[tp_saida_notasFiscaisSaidaItens] [varchar](3) NULL,
	[cd_fiscal_notasFiscaisSaidaItens] [varchar](5) NULL,
	[cd_pedidoCompra_notasFiscaisSaidaItens] [varchar](6) NULL,
	[cd_itemPedidoVenda_notasFiscaisSaidaItens] [varchar](2) NULL,
	[cd_cliente_notasFiscaisSaidaItens] [varchar](6) NULL,
	[cd_lojaCliente_notasFiscaisSaidaItens] [varchar](2) NULL,
	[cd_armazem_notasFiscaisSaidaItens] [varchar](2) NULL,
	[cd_notaFiscal_notasFiscaisSaidaItens] [varchar](9) NULL,
	[cd_serieNotaFiscal_notasFiscaisSaidaItens] [varchar](3) NULL,
	[cd_grupoProduto_notasFiscaisSaidaItens] [varchar](4) NULL,
	[tp_produto_notasFiscaisSaidaItens] [varchar](2) NULL,
	[dt_emissao_notasFiscaisSaidaItens] [date] NULL,
	[nr_sequencial_notasFiscaisSaidaItens] [varchar](6) NULL,
	[cd_notaFiscalOriginal_notasFiscaisSaidaItens] [varchar](9) NULL,
	[nr_serieNotaFiscalOriginal_notasFiscaisSaidaItens] [varchar](3) NULL,
	[qt_devolvida_notasFiscaisSaidaItens] [float] NULL,
	[vl_devolvido_notasFiscaisSaidaItens] [float] NULL,
	[cd_identificadorPoder_notasFiscaisSaidaItens] [varchar](6) NULL,
	[cd_centroCusto_notasFiscaisSaidaItens] [varchar](9) NULL,
	[cd_servivo_notasFiscaisSaidaItens] [varchar](3) NULL,
	[st_servico_notasFiscaisSaidaItens] [varchar](1) NULL,
	[dt_digitacao_notasFiscaisSaidaItens] [date] NULL,
	[fl_movimentaEstoque_notasFiscaisSaidaItens] [varchar](1) NULL,
	[cd_md5_notasFiscaisSaidaItens] [varchar](32) NULL,
	[cd_recno_SF2] [int] NOT NULL,
	[cd_recno_SD2] [int] NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_pedidosCompras]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_pedidosCompras](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cc_solicitacoesComprasXpedidosCompras] [varchar](max) NULL,
	[cc_pedidosComprasXnotasFiscaisEntrada] [varchar](max) NULL,
	[cd_filial_pedidosCompras] [varchar](2) NULL,
	[cd_item_pedidosCompras] [varchar](4) NULL,
	[cd_produto_pedidosCompras] [varchar](15) NULL,
	[ds_unidadeMedida_pedidosCompras] [varchar](2) NULL,
	[qt_pedido_pedidosCompras] [float] NULL,
	[cd_tabelaPreco_pedidosCompras] [varchar](3) NULL,
	[vl_unitario_pedidosCompras] [float] NULL,
	[vl_total_pedidosCompras] [float] NULL,
	[nr_solicitacao_pedidosCompras] [varchar](6) NULL,
	[cd_itemSolicitacao_pedidosCompras] [varchar](4) NULL,
	[dt_inicioCompra_pedidosCompras] [date] NULL,
	[dt_entrega_pedidosCompras] [date] NULL,
	[cd_armazem_pedidosCompras] [varchar](2) NULL,
	[ds_observacao_pedidosCompras] [varchar](200) NULL,
	[cd_fornecedor_pedidosCompras] [varchar](6) NULL,
	[cd_centroCusto_pedidosCompras] [varchar](9) NULL,
	[cd_contaContabil_pedidosCompras] [varchar](20) NULL,
	[cd_itemContaContabil_pedidosCompras] [varchar](9) NULL,
	[cd_lojaForncedor_pedidosCompras] [varchar](2) NULL,
	[cd_condicaoPagamento_pedidosCompras] [varchar](3) NULL,
	[cd_contato_pedidosCompras] [varchar](15) NULL,
	[cd_filialEntrega_pedidosCompras] [varchar](2) NULL,
	[dt_emissao_pedidosCompras] [date] NULL,
	[nr_pedidoCompra_pedidosCompras] [varchar](6) NULL,
	[qtd_jaEntregue_pedidosCompras] [float] NULL,
	[ds_produto_pedidosCompras] [varchar](100) NULL,
	[fl_residuoEliminado_pedidosCompras] [varchar](1) NULL,
	[nr_cotacao_pedidosCompras] [varchar](6) NULL,
	[ds_mensagem_pedidosCompras] [varchar](3) NULL,
	[fl_transmissao_pedidosCompras] [varchar](2) NULL,
	[fl_pedidoEncerrado_pedidosCompras] [varchar](1) NULL,
	[cd_grupoAprovacao_pedidosCompras] [varchar](6) NULL,
	[fl_controleAprovacao_pedidosCompras] [varchar](1) NULL,
	[cd_grupoCopradores_pedidosCompras] [varchar](6) NULL,
	[cd_usuario_pedidosCompras] [varchar](6) NULL,
	[fl_eliminadoRemanescente_pedidosCompras] [varchar](1) NULL,
	[qt_solicitada_pedidosCompras] [float] NULL,
	[vl_ipi_pedidosCompras] [float] NULL,
	[vl_icms_pedidosCompras] [float] NULL,
	[tp_entradaNota_pedidosCompras] [varchar](3) NULL,
	[fl_atualizaEstoque_pedidosCompras] [varchar](1) NULL,
	[nm_solicitante_pedidosCompras] [varchar](30) NULL,
	[dt_contabilizacao_pedidosCompras] [date] NULL,
	[cd_origem_pedidosCompras] [varchar](3) NULL,
	[cd_destino_pedidosCompras] [varchar](3) NULL,
	[cd_comprador_pedidosCompras] [varchar](3) NULL,
	[dt_conferencia_pedidosCompras] [date] NULL,
	[tp_compra_pedidosCompras] [varchar](3) NULL,
	[cd_filialOrigem_pedidosCompras] [varchar](2) NULL,
	[nr_fluig_pedidosCompras] [varchar](20) NULL,
	[cd_natureza_pedidosCompras] [varchar](10) NULL,
	[fl_faturamentoDireto_pedidosCompras] [float] NULL,
	[cd_recno_SC7] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_pedidosEmitidos]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_pedidosEmitidos](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cc_pedidosEmitidosXsolicitacoesSeparacoes] [varchar](max) NULL,
	[cc_pedidosEmitidosXsolicitacoesCompras] [varchar](max) NULL,
	[cd_filialOrigem_pedidosEmitidos] [varchar](2) NULL,
	[cd_centroCusto_pedidosEmitidos] [varchar](9) NULL,
	[cd_filialDestino_pedidosEmitidos] [varchar](2) NULL,
	[cd_pedido_pedidosEmitidos] [varchar](20) NULL,
	[cd_itemEmissao_pedidosEmitidos] [varchar](4) NULL,
	[cd_fluigEmissao_pedidosEmitidos] [varchar](20) NULL,
	[dt_emissao_pedidosEmitidos] [date] NULL,
	[cd_produto_pedidosEmitidos] [varchar](20) NULL,
	[qt_solicitada_pedidosEmitidos] [float] NULL,
	[tp_atendimento_pedidosEmitidos] [varchar](1) NULL,
	[tp_emergencia_pedidosEmitidos] [varchar](1) NULL,
	[dt_necessidade_pedidosEmitidos] [date] NULL,
	[qt_entregue_pedidosEmitidos] [float] NULL,
	[nm_local_pedidosEmitidos] [varchar](2) NULL,
	[qt_aSeparar_pedidosEmitidos] [float] NULL,
	[qt_aComprar_pedidosEmitidos] [float] NULL,
	[ds_observacaoASeparar_pedidosEmitidos] [varbinary](max) NULL,
	[ds_observacaoAComprar_pedidosEmitidos] [varbinary](max) NULL,
	[st_emissao_pedidosEmitidos] [varchar](1) NULL,
	[cd_solicitante_pedidosEmitidos] [varchar](40) NULL,
	[nm_solicitante_pedidosEmitidos] [varchar](50) NULL,
	[cd_localDestino_pedidosEmitidos] [varchar](2) NULL,
	[ds_complementoEimssao_pedidosEmitidos] [varchar](200) NULL,
	[nr_ordemServico_pedidosEmitidos] [varchar](20) NULL,
	[tp_usoMaterial_pedidosEmitidos] [varchar](1) NULL,
	[st_wms_pedidosEmitidos] [varchar](1) NULL,
	[st_rm_pedidosEmitidos] [varchar](3) NULL,
	[cd_recno_ZE1] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
	[qt_emSolicitacaoDeCompras_pedidosEmitidos] [float] NULL,
	[qt_emPedidoDeCompras_pedidosEmitidos] [float] NULL,
	[qt_recebidaEmNotaFiscalDoFornecedor_pedidosEmitidos] [float] NULL,
	[qt_paraSeparacaoDeEstoque_pedidosEmitidos] [float] NULL,
	[qt_jaSeparadaNoEstoque_pedidosEmitidos] [float] NULL,
	[qt_emSolicitacaoDeTransferencia_pedidosEmitidos] [float] NULL,
	[qt_emNotaFiscalDeTransferenciaDeSaida_pedidosEmitidos] [float] NULL,
	[qt_emNotaFiscalDeEntradaTransferenciaEmTransito_pedidosEmitidos] [float] NULL,
	[qt_emNotaFiscalDeEntradaTransferenciaClassificada_pedidosEmitidos] [float] NULL,
	[qt_emPedidoDeVenda_pedidosEmitidos] [float] NULL,
	[qt_emMovimentoInternoDeEstoque_pedidosEmitidos] [float] NULL,
	[cd_legendaEmissaoMicro_pedidosEmitidos] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cd_recno_ZE1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_pedidosTransferencias]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_pedidosTransferencias](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cc_pedidosTransferenciasXpedidosVendas] [varchar](max) NULL,
	[cc_solicitacoesSeparacoesXpedidosTransferencias] [varchar](max) NULL,
	[cd_pedido_pedidosTransferencias] [varchar](10) NULL,
	[cd_filial_pedidosTransferencias] [varchar](2) NULL,
	[dt_emissao_pedidosTransferencias] [date] NULL,
	[cd_solicitante_pedidosTransferencias] [varchar](20) NULL,
	[st_pedido_pedidosTransferencias] [varchar](1) NULL,
	[ds_justificativa_pedidosTransferencias] [varbinary](max) NULL,
	[tp_documentoEntrada_pedidosTransferencias] [varchar](1) NULL,
	[tp_notaFiscal_pedidosTransferencias] [varchar](5) NULL,
	[nr_fluig_pedidosTransferencias] [float] NULL,
	[fl_emercial_pedidosTransferencias] [varchar](1) NULL,
	[dt_digitacao_pedidosTransferencias] [date] NULL,
	[cd_centroCusto_pedidosTransferencias] [varchar](9) NULL,
	[ds_mensagemPadrao_pedidosTransferencias] [varchar](3) NULL,
	[cd_transporte_pedidosTransferencias] [varchar](6) NULL,
	[cd_filial_pedidosTransferenciasItens] [varchar](2) NULL,
	[cd_pedido_pedidosTransferenciasItens] [varchar](10) NULL,
	[cd_filialOrigem_pedidosTransferenciasItens] [varchar](2) NULL,
	[cd_produto_pedidosTransferenciasItens] [varchar](15) NULL,
	[ds_unidadeMedidaOrigem_pedidosTransferenciasItens] [varchar](2) NULL,
	[cd_armazemOrigem_pedidosTransferenciasItens] [varchar](2) NULL,
	[cd_endereco_pedidosTransferenciasItens] [varchar](15) NULL,
	[dt_validadeLote_pedidosTransferenciasItens] [date] NULL,
	[qt_pedido_pedidosTransferenciasItens] [float] NULL,
	[cd_filialDestino_pedidosTransferenciasItens] [varchar](2) NULL,
	[cd_produtoDestino_pedidosTransferenciasItens] [varchar](15) NULL,
	[ds_unidadeMedidaDestino_pedidosTransferenciasItens] [varchar](2) NULL,
	[cd_armazemDestino_pedidosTransferenciasItens] [varchar](2) NULL,
	[cd_TESSaida_pedidosTransferenciasItens] [varchar](3) NULL,
	[cd_TESEntrada_pedidosTransferenciasItens] [varchar](3) NULL,
	[nr_documento_pedidosTransferenciasItens] [varchar](9) NULL,
	[nr_serieDocumento_pedidosTransferenciasItens] [varchar](3) NULL,
	[ds_obervacao_pedidosTransferenciasItens] [varchar](40) NULL,
	[vl_precoVenda_pedidosTransferenciasItens] [float] NULL,
	[cd_recno_NNS] [int] NOT NULL,
	[cd_recno_NNT] [int] NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_pedidosVendas]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_pedidosVendas](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cc_pedidosVendasXnotasFiscaisSaida] [varchar](max) NULL,
	[cc_solicitacoesSeparacoesXpedidosVendas] [varchar](max) NULL,
	[cc_pedidosTransferenciasXpedidosVendas] [varchar](max) NULL,
	[cd_filial_pedidosVendas] [varchar](2) NULL,
	[nr_pedido_pedidosVendas] [varchar](6) NULL,
	[tp_pedido_pedidosVendas] [varchar](1) NULL,
	[cd_cliente_pedidosVendas] [varchar](6) NULL,
	[cd_lojaCliente_pedidosVendas] [varchar](2) NULL,
	[cd_clienteEntrega_pedidosVendas] [varchar](6) NULL,
	[cd_lojaEntrega_pedidosVendas] [varchar](2) NULL,
	[cd_transportadora_pedidosVendas] [varchar](6) NULL,
	[st_registro_pedidosVendas] [varchar](1) NULL,
	[dt_emissao_pedidosVendas] [date] NULL,
	[nr_notaFiscal_pedidosVendas] [varchar](9) NULL,
	[nr_serieNotaFiscal_pedidosVendas] [varchar](3) NULL,
	[nr_contrato_pedidosVendas] [varchar](10) NULL,
	[nr_geraWms_pedidosVendas] [varchar](1) NULL,
	[dt_entrega_pedidosVendas] [date] NULL,
	[cd_obra_pedidosVendas] [varchar](10) NULL,
	[cd_natureza_pedidosVendas] [varchar](10) NULL,
	[nr_fluig_pedidosVendas] [float] NULL,
	[cd_centroCustoDestino_pedidosVendas] [varchar](9) NULL,
	[nm_municipioOrigem_pedidosVendas] [varchar](5) NULL,
	[nm_unidadeFederalOrigem_pedidosVendas] [varchar](2) NULL,
	[nm_municipioDestino_pedidosVendas] [varchar](5) NULL,
	[nm_unidadeFederalDestino_pedidosVendas] [varchar](2) NULL,
	[cd_filial_pedidosVendasItens] [varchar](2) NULL,
	[cd_item_pedidosVendasItens] [varchar](2) NULL,
	[cd_produto_pedidosVendasItens] [varchar](15) NULL,
	[ds_unidadeMedidaPrimaria_pedidosVendasItens] [varchar](2) NULL,
	[qt_vendida_pedidosVendasItens] [float] NULL,
	[vl_unidadeVendida_pedidosVendasItens] [float] NULL,
	[vl_totalItem_pedidosVendasItens] [float] NULL,
	[qt_liberada_pedidosVendasItens] [float] NULL,
	[cd_armazem_pedidosVendasItens] [varchar](2) NULL,
	[cd_ficalOperacao_pedidosVendasItens] [varchar](5) NULL,
	[qt_entregue_pedidosVendasItens] [float] NULL,
	[cd_cliente_pedidosVendasItens] [varchar](6) NULL,
	[dt_entrega_pedidosVendasItens] [date] NULL,
	[cd_lojaCliente_pedidosVendasItens] [varchar](2) NULL,
	[nr_notaFiscal_pedidosVendasItens] [varchar](9) NULL,
	[nr_serieNotaFiscal_pedidosVendasItens] [varchar](3) NULL,
	[dt_faturamento_pedidosVendasItens] [date] NULL,
	[nr_pedido_pedidosVendasItens] [varchar](6) NULL,
	[nr_pedidoCliente_pedidosVendasItens] [varchar](9) NULL,
	[ds_auxiliar_pedidosVendasItens] [varchar](100) NULL,
	[vl_unitarioTabela_pedidosVendasItens] [float] NULL,
	[fl_bloqueio_pedidosVendasItens] [varchar](2) NULL,
	[cd_situacaoTributaria_pedidosVendasItens] [varchar](3) NULL,
	[qt_empenhada_pedidosVendasItens] [float] NULL,
	[nr_solicitacaoCompra_pedidosVendasItens] [varchar](6) NULL,
	[nr_itemSolicitacaoCompra_pedidosVendasItens] [varchar](4) NULL,
	[dt_entregaSugeridaAPS_pedidosVendasItens] [date] NULL,
	[cd_centroCusto_pedidosVendasItens] [varchar](9) NULL,
	[cd_contaContabil_pedidosVendasItens] [varchar](20) NULL,
	[tp_produto_pedidosVendasItens] [varchar](1) NULL,
	[dt_integracao_pedidosVendasItens] [date] NULL,
	[fl_integracaoRoteirizador_pedidosVendasItens] [varchar](1) NULL,
	[fl_saldoFluig_pedidosVendasItens] [varchar](1) NULL,
	[cd_recno_SC5010] [int] NOT NULL,
	[cd_recno_SC6010] [int] NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_pickListMontagemVolume]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_pickListMontagemVolume](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_pickListMontagemVolume] [varchar](2) NOT NULL,
	[cd_montagem_pickListMontagemVolume] [varchar](9) NULL,
	[cd_item_pickListMontagemVolume] [varchar](4) NULL,
	[cd_produto_pickListMontagemVolume] [varchar](15) NULL,
	[cd_local_pickListMontagemVolume] [varchar](2) NULL,
	[cd_endereco_pickListMontagemVolume] [varchar](15) NULL,
	[qt_separar_pickListMontagemVolume] [float] NULL,
	[cd_reserva_pickListMontagemVolume] [varchar](6) NULL,
	[cd_recno_ZNL] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_ProcessadosRPA]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_ProcessadosRPA](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_ID] [int] NOT NULL,
	[dt_Data_do_Email] [varchar](250) NULL,
	[ds_Origem_do_Email] [varchar](250) NULL,
	[dt_Data_do_processamento] [varchar](250) NULL,
	[ds_Status] [varchar](250) NULL,
	[ds_Arquivo_PDF] [varchar](max) NULL,
	[ds_CPF] [varchar](250) NULL,
	[ds_Funcionario] [varchar](250) NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_requisicoesArmazem]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_requisicoesArmazem](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_requisicoesArmazem] [varchar](2) NULL,
	[nr_requisicao_requisicoesArmazem] [varchar](6) NULL,
	[nr_item_requisicoesArmazem] [varchar](2) NULL,
	[cd_produto_requisicoesArmazem] [varchar](15) NULL,
	[ds_unidadeMedida_requisicoesArmazem] [varchar](2) NULL,
	[qt_requisicao_requisicoesArmazem] [float] NULL,
	[ds_segundaUnidadeMedida_requisicoesArmazem] [varchar](2) NULL,
	[qt_segundaRequisicao_requisicoesArmazem] [float] NULL,
	[dt_necessidade_requisicoesArmazem] [varchar](8) NULL,
	[cd_armazem_requisicoesArmazem] [varchar](2) NULL,
	[ds_observacao_requisicoesArmazem] [varchar](254) NULL,
	[cd_ordemProducao_requisicoesArmazem] [varchar](14) NULL,
	[cd_centroCusto_requisicoesArmazem] [varchar](9) NULL,
	[cd_contaContabil_requisicoesArmazem] [varchar](20) NULL,
	[dt_emissao_requisicoesArmazem] [varchar](8) NULL,
	[ds_requisicao_requisicoesArmazem] [varchar](100) NULL,
	[cd_solicitacao_requisicoesArmazem] [varchar](6) NULL,
	[cd_solicitante_requisicoesArmazem] [varchar](25) NULL,
	[qt_atendida_requisicoesArmazem] [float] NULL,
	[fl_saMarcada_requisicoesArmazem] [varchar](2) NULL,
	[fl_preRequisicao_requisicoesArmazem] [varchar](1) NULL,
	[st_requisicao_requisicoesArmazem] [varchar](1) NULL,
	[nr_os_requisicoesArmazem] [varchar](8) NULL,
	[cd_SequenciaRepairCenter_requisicoesArmazem] [varchar](2) NULL,
	[nr_itemContabil_requisicoesArmazem] [varchar](9) NULL,
	[cd_classeValor_requisicoesArmazem] [varchar](9) NULL,
	[fl_utilizaGerencProjeto_requisicoesArmazem] [varchar](1) NULL,
	[cd_usuario_requisicoesArmazem] [varchar](6) NULL,
	[nr_solicitacaoCompra_requisicoesArmazem] [varchar](6) NULL,
	[cd_itemSolicitacaoCompra_requisicoesArmazem] [varchar](4) NULL,
	[st_solicitacaoArmazem_requisicoesArmazem] [varchar](1) NULL,
	[vl_saldoBloqueio_requisicoesArmazem] [float] NULL,
	[cd_medidaPneu_requisicoesArmazem] [varchar](6) NULL,
	[vl_sulcoMinimoDesejado_requisicoesArmazem] [float] NULL,
	[vl_sulcoMaximoDesejado_requisicoesArmazem] [float] NULL,
	[cd_tipoModelo_requisicoesArmazem] [varchar](10) NULL,
	[nr_loteTransferencia_requisicoesArmazem] [varchar](6) NULL,
	[cd_rateio_requisicoesArmazem] [varchar](1) NULL,
	[fl_consomeEstoque_requisicoesArmazem] [varchar](1) NULL,
	[nr_boletim_requisicoesArmazem] [varchar](10) NULL,
	[vl_unitario_requisicoesArmazem] [float] NULL,
	[cd_EC05DB_requisicoesArmazem] [varchar](16) NULL,
	[cd_EC05CR_requisicoesArmazem] [varchar](16) NULL,
	[cd_EC06DB_requisicoesArmazem] [varchar](16) NULL,
	[cd_EC06CR_requisicoesArmazem] [varchar](16) NULL,
	[cd_EC07DB_requisicoesArmazem] [varchar](16) NULL,
	[cd_EC07CR_requisicoesArmazem] [varchar](16) NULL,
	[cd_EC08DB_requisicoesArmazem] [varchar](16) NULL,
	[cd_EC08CR_requisicoesArmazem] [varchar](16) NULL,
	[cd_EC09DB_requisicoesArmazem] [varchar](16) NULL,
	[cd_EC09CR_requisicoesArmazem] [varchar](16) NULL,
	[nr_fluig_requisicoesArmazem] [float] NULL,
	[fl_emergencia_requisicoesArmazem] [varchar](1) NULL,
	[tp_usoRip_requisicoesArmazem] [varchar](1) NULL,
	[dt_digitacao_requisicoesArmazem] [varchar](8) NULL,
	[cd_subFluig_requisicoesArmazem] [float] NULL,
	[cd_recno_SCP] [int] NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_reservaFaturamento]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_reservaFaturamento](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_reservaFaturamento] [varchar](2) NULL,
	[cd_reserva_reservaFaturamento] [varchar](6) NULL,
	[tp_reserva_reservaFaturamento] [varchar](2) NULL,
	[cd_docReserva_reservaFaturamento] [varchar](9) NULL,
	[nm_solicit_reservaFaturamento] [varchar](20) NULL,
	[cd_filialReserva_reservaFaturamento] [varchar](2) NULL,
	[cd_produto_reservaFaturamento] [varchar](15) NULL,
	[cd_armazem_reservaFaturamento] [varchar](2) NULL,
	[qt_reserva_reservaFaturamento] [float] NULL,
	[dt_validade_reservaFaturamento] [varchar](8) NULL,
	[dt_emissao_reservaFaturamento] [varchar](8) NULL,
	[cd_subLote_reservaFaturamento] [varchar](6) NULL,
	[cd_lote_reservaFaturamento] [varchar](21) NULL,
	[cd_endereco_reservaFaturamento] [varchar](15) NULL,
	[cd_numSerie_reservaFaturamento] [varchar](20) NULL,
	[cd_qtdOriginal_reservaFaturamento] [float] NULL,
	[qt_pedido_reservaFaturamento] [float] NULL,
	[ds_observacao_reservaFaturamento] [varchar](80) NULL,
	[qt_eliminacao_reservaFaturamento] [float] NULL,
	[cd_recno_SC0] [int] NULL,
	[cd_origem_reservaFaturamento] [varchar](15) NULL,
	[dt_criacao] [datetime] NULL,
	[dt_alteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_solicitacoesCompras]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_solicitacoesCompras](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cc_pedidosEmitidosXsolicitacoesCompras] [varchar](max) NULL,
	[cc_solicitacoesComprasXpedidosCompras] [varchar](max) NULL,
	[cd_filial_solicitacoesCompras] [varchar](2) NULL,
	[cd_solicitacao_solicitacoesCompras] [varchar](6) NULL,
	[cd_item_solicitacoesCompras] [varchar](4) NULL,
	[cd_produto_solicitacoesCompras] [varchar](15) NULL,
	[ds_unidadeMedida_solicitacoesCompras] [varchar](2) NULL,
	[ds_produto_solicitacoesCompras] [varchar](100) NULL,
	[qt_solicitada_solicitacoesCompras] [float] NULL,
	[vl_unitario_solicitacoesCompras] [float] NULL,
	[vl_total_solicitacoesCompras] [float] NULL,
	[dt_previsaoNecessidade_solicitacoesCompras] [date] NULL,
	[ds_observacao_solicitacoesCompras] [varchar](200) NULL,
	[cd_armazem_solicitacoesCompras] [varchar](2) NULL,
	[cd_centroCusto_solicitacoesCompras] [varchar](9) NULL,
	[cd_contaContabil_solicitacoesCompras] [varchar](20) NULL,
	[cd_itemContaContabil_solicitacoesCompras] [varchar](9) NULL,
	[dt_emissao_solicitacoesCompras] [date] NULL,
	[nr_cotacaoGerada_solicitacoesCompras] [varchar](6) NULL,
	[cd_fornecedor_solicitacoesCompras] [varchar](6) NULL,
	[cd_lojaForncedor_solicitacoesCompras] [varchar](2) NULL,
	[nr_pedidoCompra_solicitacoesCompras] [varchar](6) NULL,
	[cd_itemPedidoCompra_solicitacoesCompras] [varchar](4) NULL,
	[nm_solicitante_solicitacoesCompras] [varchar](25) NULL,
	[qt_emPedido_solicitacoesCompras] [float] NULL,
	[cd_comprador_solicitacoesCompras] [varchar](3) NULL,
	[cd_grupoCopradores_solicitacoesCompras] [varchar](6) NULL,
	[cd_usuario_solicitacoesCompras] [varchar](6) NULL,
	[cd_filialEntrega_solicitacoesCompras] [varchar](2) NULL,
	[vl_unitarioEstimado_solicitacoesCompras] [float] NULL,
	[cd_condicaoPagamento_solicitacoesCompras] [varchar](3) NULL,
	[fl_eliminarResiduo_solicitacoesCompras] [varchar](1) NULL,
	[qt_ooriginal_solicitacoesCompras] [float] NULL,
	[fl_aprovacao_solicitacoesCompras] [varchar](1) NULL,
	[tp_solicitacao_solicitacoesCompras] [varchar](1) NULL,
	[fl_atualizaEstoque_solicitacoesCompras] [varchar](1) NULL,
	[cd_filialOrigem_solicitacoesCompras] [varchar](2) NULL,
	[cd_itemSolicitacaOrigem_solicitacoesCompras] [varchar](4) NULL,
	[cd_solicitacaoCompraOrigem_solicitacoesCompras] [varchar](6) NULL,
	[tp_compra_solicitacoesCompras] [varchar](3) NULL,
	[nr_pedidoVenda_solicitacoesCompras] [varchar](6) NULL,
	[nr_SubFluig_solicitacoesCompras] [float] NULL,
	[fl_emergencial_solicitacoesCompras] [varchar](1) NULL,
	[cd_ze1_solicitacoesCompras] [varchar](20) NULL,
	[cd_itemZe1_solicitacoesCompras] [varchar](4) NULL,
	[cd_recno_SC1] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
	[dt_aprovacao_fluig_solicitacoesCompras] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_solicitacoesSeparacoes]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_solicitacoesSeparacoes](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cc_solicitacoesSeparacoesXpedidosVendas] [varchar](max) NULL,
	[cc_pedidosEmitidosXsolicitacoesSeparacoes] [varchar](max) NULL,
	[cc_solicitacoesSeparacoesXpedidosTransferencias] [varchar](max) NULL,
	[cd_filial_solicitacoesSeparacoes] [varchar](2) NULL,
	[cd_item_solicitacoesSeparacoes] [varchar](4) NULL,
	[cd_requisicao_solicitacoesSeparacoes] [varchar](20) NULL,
	[cd_itemRequisicao_solicitacoesSeparacoes] [varchar](4) NULL,
	[cd_produto_solicitacoesSeparacoes] [varchar](20) NULL,
	[qt_produto_solicitacoesSeparacoes] [float] NULL,
	[qt_separada_solicitacoesSeparacoes] [float] NULL,
	[nm_enderecoOrigem_solicitacoesSeparacoes] [varchar](20) NULL,
	[nm_enderecoDestino_solicitacoesSeparacoes] [varchar](20) NULL,
	[dt_separacao_solicitacoesSeparacoes] [date] NULL,
	[cd_usuarioSeparador_solicitacoesSeparacoes] [varchar](20) NULL,
	[ds_observacao_solicitacoesSeparacoes] [varbinary](max) NULL,
	[nm_local_solicitacoesSeparacoes] [varchar](2) NULL,
	[st_separacao_solicitacoesSeparacoes] [varchar](2) NULL,
	[cd_usuarioOrdemServico_solicitacoesSeparacoes] [varchar](20) NULL,
	[nr_solicitacaoTransferencia_solicitacoesSeparacoes] [varchar](10) NULL,
	[st_emPedidoVenda_solicitacoesSeparacoes] [float] NULL,
	[st_emRequisicao_solicitacoesSeparacoes] [float] NULL,
	[st_emTransferencia_solicitacoesSeparacoes] [float] NULL,
	[nr_pedidoVenda_solicitacoesSeparacoes] [varchar](25) NULL,
	[nr_soliciatacaoTransferencia_solicitacoesSeparacoes] [varchar](25) NULL,
	[nr_requisicao_solicitacoesSeparacoes] [varchar](25) NULL,
	[dt_atendimento_solicitacoesSeparacoes] [date] NULL,
	[hr_atendimento_solicitacoesSeparacoes] [varchar](8) NULL,
	[nm_uruarioAtendimento_solicitacoesSeparacoes] [varchar](10) NULL,
	[cd_transferencia_solicitacoesSeparacoes] [varchar](30) NULL,
	[cd_centroCusto_solicitacoesSeparacoes] [varchar](9) NULL,
	[dt_emissao_solicitacoesSeparacoes] [date] NULL,
	[nm_armarioDestino_solicitacoesSeparacoes] [varchar](2) NULL,
	[nm_ControleEndereco_solicitacoesSeparacoes] [varchar](1) NULL,
	[cd_recno_ZE3] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fat_tarefaSeparacaoOT]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fat_tarefaSeparacaoOT](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_filial_tarefaSeparacaoOT] [varchar](2) NOT NULL,
	[cd_montagem_tarefaSeparacaoOT] [varchar](9) NOT NULL,
	[cd_itemVolume_tarefaSeparacaoOT] [varchar](4) NOT NULL,
	[cd_produto_tarefaSeparacaoOT] [varchar](15) NOT NULL,
	[cd_armazem_tarefaSeparacaoOT] [varchar](2) NOT NULL,
	[cd_endereco_tarefaSeparacaoOT] [varchar](15) NOT NULL,
	[cd_tarefa_tarefaSeparacaoOT] [varchar](15) NOT NULL,
	[cd_requisicao_tarefaSeparacaoOT] [varchar](20) NOT NULL,
	[cd_itemRequisicao_tarefaSeparacaoOT] [varchar](4) NOT NULL,
	[qt_separado_tarefaSeparacaoOT] [float] NOT NULL,
	[cd_recno_ZNQ] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_rel_distribuicaoWms]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_rel_distribuicaoWms](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[ID_DISTRIBUICAO] [int] NOT NULL,
	[DT_RETIRADA] [datetime] NOT NULL,
	[CD_FUNCIONARIO] [varchar](100) NULL,
	[NM_FUNCIONARIO] [varchar](50) NULL,
	[CD_PRODUTO] [varchar](200) NOT NULL,
	[NM_PRODUTO] [varchar](254) NULL,
	[CD_UNIDADEMED] [varchar](2) NULL,
	[CD_FILIAL] [varchar](20) NULL,
	[NM_FILIAL] [varchar](150) NULL,
	[CD_ARMAZEM] [varchar](10) NULL,
	[NM_ARMAZEM] [varchar](150) NULL,
	[CD_ENDERECO] [varchar](255) NULL,
	[QT_DISTRIBUICAO] [float] NOT NULL,
	[NM_USUARIO] [varchar](150) NULL,
	[DS_ATIVO] [varchar](100) NULL,
	[DS_ENVIOERP] [varchar](100) NULL,
	[DS_RETORNOERP] [varchar](100) NULL,
	[DS_MSG] [varchar](max) NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_rel_separacao]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_rel_separacao](
	[Produto] [varchar](20) NOT NULL,
	[Qtd Solic] [float] NULL,
	[Dt Emissao] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_rel_separacaoEntrada]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_rel_separacaoEntrada](
	[sk_destino] [int] IDENTITY(1,1) NOT NULL,
	[cd_rmFilialOrigem_separacaoEntrada] [varchar](26) NULL,
	[cd_filial_separacaoEntrada] [varchar](2) NULL,
	[cd_centroCusto_separacaoEntrada] [varchar](9) NULL,
	[ds_centroCusto_separacaoEntrada] [varchar](40) NULL,
	[cd_produto_separacaoEntrada] [varchar](20) NULL,
	[ds_produto_separacaoEntrada] [varchar](254) NULL,
	[tp_statusRm_separacaoEntrada] [varchar](30) NULL,
	[tp_statusReceb_separacaoEntrada] [varchar](28) NULL,
	[tp_statusEnvio_separacaoEntrada] [varchar](31) NULL,
	[cd_fluig_separacaoEntrada] [varchar](20) NULL,
	[dt_emissaoFluig_separacaoEntrada] [date] NULL,
	[dt_integracaoFluig_separacaoEntrada] [date] NULL,
	[cd_solicitante_separacaoEntrada] [varchar](40) NULL,
	[tp_emergencia_separacaoEntrada] [varchar](22) NULL,
	[dt_prevEntrega_separacaoEntrada] [date] NULL,
	[cd_pedido_separacaoEntrada] [varchar](6) NULL,
	[cd_itemPedido_separacaoEntrada] [varchar](4) NULL,
	[tp_separacaoWms_separacaoEntrada] [varchar](3) NULL,
	[ds_obsSolCompra_separacaoEntrada] [varbinary](max) NULL,
	[ds_obsPedido_separacaoEntrada] [varchar](200) NULL,
	[nm_comprador_separacaoEntrada] [varchar](40) NULL,
	[cd_tipoEntrada_separacaoEntrada] [varchar](3) NULL,
	[ds_tipoEntrada_separacaoEntrada] [varchar](20) NULL,
	[tp_atuEstoque_separacaoEntrada] [varchar](3) NULL,
	[tp_atendimento_separacaoEntrada] [varchar](5) NULL,
	[dt_digitacao_separacaoEntrada] [date] NULL,
	[cd_notaFiscal_separacaoEntrada] [varchar](9) NULL,
	[ds_fornecedor_separacaoEntrada] [varchar](40) NULL,
	[qt_saldoEstoque_separacaoEntrada] [float] NULL,
	[qt_empenhadaEstoque_separacaoEntrada] [float] NULL,
	[qt_reservadoEstoque_separacaoEntrada] [float] NULL,
	[qt_estoquePedVenda_separacaoEntrada] [float] NULL,
	[qt_naoEnderecada_separacaoEntrada] [float] NULL,
	[dt_ultSaidaEstoque_separacaoEntrada] [date] NULL,
	[vl_custoUnitarioEstoque_separacaoEntrada] [float] NULL,
	[qt_solicitada_separacaoEntrada] [float] NULL,
	[qt_entregue_separacaoEntrada] [float] NULL,
	[qt_separado_separacaoEntrada] [float] NULL,
	[qt_solCompra_separacaoEntrada] [float] NULL,
	[qt_pedido_separacaoEntrada] [float] NULL,
	[qt_notaFiscal_separacaoEntrada] [float] NULL,
	[qt_separadoWms_separacaoEntrada] [float] NULL,
	[qt_solTransf_separacaoEntrada] [float] NULL,
	[qt_notaTransf_separacaoEntrada] [float] NULL,
	[qt_pendenteSepararNotaFiscal_separacaoEntrada] [float] NULL,
	[qt_pendenteRequisicao_separacaoEntrada] [float] NULL,
	[dt_criacao] [datetime] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_dim_calendario] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[tb_dim_calendario] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[tb_dim_competencia_ponto] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[tb_dim_competencia_ponto] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[tb_dim_dependentes] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[tb_dim_dependentes] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[tb_dim_esocial_tpDependentes] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[tb_dim_esocial_tpDependentes] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[tb_dim_statusPedidosEmitidos] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[tb_dim_statusPedidosEmitidos] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[tb_fat_pedidosEmitidos] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[tb_fat_pedidosEmitidos] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
ALTER TABLE [dbo].[tb_fat_requisicoesArmazem] ADD  DEFAULT (getdate()) FOR [dt_criacao]
GO
ALTER TABLE [dbo].[tb_fat_requisicoesArmazem] ADD  DEFAULT (getdate()) FOR [dt_alteracao]
GO
/****** Object:  StoredProcedure [dbo].[sp_agenda]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--- exec [dbo].[sp_agenda]

CREATE proc [dbo].[sp_agenda]
as

exec [dbo].[sp_executaProcedure] 'sp_tb_dim_cadastroEntidades'
exec [dbo].[sp_executaProcedure] 'sp_tb_dim_dependentes'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_pedidosEmitidos'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_pedidosTransferencias'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_solicitacoesSeparacoes'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_pedidosVendas'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_notasFiscaisSaida'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_solicitacoesCompras'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_pedidosCompras'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_notasFiscaisEntrada'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_estoque'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_estoqueEndereco'
exec [dbo].[sp_executaProcedure] 'sp_tb_dim_centroCusto'
exec [dbo].[sp_executaProcedure] 'sp_tb_dim_compradores'
exec [dbo].[sp_executaProcedure] 'sp_tb_dim_condicoesPagamento'
exec [dbo].[sp_executaProcedure] 'sp_tb_dim_enderecosEstoque'
exec [dbo].[sp_executaProcedure] 'sp_tb_dim_empresasFiliais'
exec [dbo].[sp_executaProcedure] 'sp_tb_dim_fornecedores'
exec [dbo].[sp_executaProcedure] 'sp_tb_dim_funcionarios'
exec [dbo].[sp_executaProcedure] 'sp_tb_dim_cargos'
exec [dbo].[sp_executaProcedure] 'sp_tb_dim_grupoProdutos'
exec [dbo].[sp_executaProcedure] 'sp_tb_dim_locaisEstoque'
exec [dbo].[sp_executaProcedure] 'sp_tb_dim_fornecedores'
exec [dbo].[sp_executaProcedure] 'sp_tb_dim_produtos'
exec [dbo].[sp_executaProcedure] 'sp_tb_dim_codificacoesNotasFiscais'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_LogRPA'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_requisicoesArmazem'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_docMontagemVolume'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_tarefaSeparacaoOT'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_pickListMontagemVolume'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_itensMontagemVolume'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_expedicaoVolumes'
GO
/****** Object:  StoredProcedure [dbo].[sp_agenda2]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--- exec [dbo].[sp_agenda]

CREATE proc [dbo].[sp_agenda2]
as

exec [dbo].[sp_executaProcedure] 'sp_tb_fat_LogRPA'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_ProcessadosRPA'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_ErrosRPA'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_NaoProcessadosRPA'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_ArqNaoProcessadosRPA'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_ArqProcessadosRPA'
exec [dbo].[sp_executaProcedure] 'sp_tb_fat_GestaoBotsRPA'


GO
/****** Object:  StoredProcedure [dbo].[sp_executaProcedure]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE procedure [dbo].[sp_executaProcedure] (@nome_procedure varchar(250))

as

BEGIN 

declare @dt_inicio datetime;

set @dt_inicio = getdate();

DECLARE @linhas int

DECLARE @erros table
(  
	ds_erroNumero int,
	ds_erroSeveridade int,
	ds_erroEstado int,
	ds_erroLinha int,
	ds_erroMensagem varchar(1000),
	st_procedure int
)

begin try
	
	execute @linhas  = @nome_procedure 
	
end try

begin catch
	insert into @erros
       select 
        ERROR_NUMBER() AS ds_erroNumero  
        ,ERROR_SEVERITY() AS ds_erroSeveridade  
        ,ERROR_STATE() AS ds_erroEstado  
        ,ERROR_LINE() AS ds_erroLinha  
        ,ERROR_MESSAGE() AS ds_erroMensagem
		,st_procedure = 1 
end catch

insert into bi_rip_TrustedZone.dbo.tb_agenda
select
nm_procedure = @nome_procedure
,st_procedure = iif((select top 1 st_procedure from @erros) = 1,'Concluída com erros','Concluída sem erros')
,dt_inicio = @dt_inicio
,dt_fim = getdate()
,qtd_linhasAfetadas = @linhas
,ds_erroNumero =  (select top 1 ds_erroNumero from @erros)
,ds_erroSeveridade = (select top 1 ds_erroSeveridade from @erros)
,ds_erroEstado = (select top 1 ds_erroEstado from @erros)
,ds_erroLinha =  (select top 1 ds_erroLinha from @erros)
,ds_erroMensagem = (select top 1 ds_erroMensagem from @erros)
end


GO
/****** Object:  StoredProcedure [dbo].[sp_retornaParametroParaVariavel]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_retornaParametroParaVariavel]
@tabela varchar(100)
as

declare @parametro_retorno varchar(100) 
declare @tabela_retorno table(parametro_retorno varchar(100))

insert into @tabela_retorno
execute bi_rip_rawZone_bck.dbo.sp_retornaParametro @tabela;


set @parametro_retorno = (select top 1 parametro_retorno from @tabela_retorno);

return @parametro_retorno

GO
/****** Object:  StoredProcedure [dbo].[sp_tb_dim_cadastroEntidades]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_tb_dim_cadastroEntidades]

as

declare @linhas int;
merge tb_dim_cadastroEntidades as destino

using (

	select 
		sk_destino = null,
		cd_planoContabil = CV0_PLANO,
		cd_item_planoContabil = CV0_ITEM,
		cd_entidade = CV0_CODIGO,
		ds_entidade = CV0_DESC,
		tp_classe = CV0_CLASSE,
		cd_condicaoNormal = CV0_NORMAL,
		cd_entidadeSuperior = CV0_ENTSUP,
		cd_bloqueia_entidade = CV0_BLOQUE,
		cd_filial_gerencialEntidade = CV0_ZGERFL,
		cd_recno_CV0 = R_E_C_N_O_,
		dt_criacao = getdate(),
		dt_alteracao = getdate()

	from [bi_rip_rawZone_bck].dbo.CV0010
	where D_E_L_E_T_ = ''


) origem on  
(		
	origem.cd_recno_CV0 = destino.cd_recno_CV0
)

WHEN MATCHED THEN
	UPDATE SET 
		destino.cd_planoContabil = origem.cd_planoContabil,
		destino.cd_item_planoContabil = origem.cd_item_planoContabil,
		destino.cd_entidade = origem.cd_entidade,
		destino.ds_entidade = origem.ds_entidade,
		destino.tp_classe = origem.tp_classe,
		destino.cd_condicaoNormal = origem.cd_condicaoNormal,
		destino.cd_entidadeSuperior = origem.cd_entidadeSuperior,
		destino.cd_bloqueia_entidade = origem.cd_bloqueia_entidade,
		destino.cd_filial_gerencialEntidade = origem.cd_filial_gerencialEntidade,
		destino.cd_recno_CV0 = origem.cd_recno_CV0,
		destino.dt_alteracao = getdate()			

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		origem.cd_planoContabil,
		origem.cd_item_planoContabil,
		origem.cd_entidade,
		origem.ds_entidade,
		origem.tp_classe,
		origem.cd_condicaoNormal,
		origem.cd_entidadeSuperior,
		origem.cd_bloqueia_entidade,
		origem.cd_filial_gerencialEntidade,
		origem.cd_recno_CV0,
		origem.dt_criacao,
		origem.dt_alteracao										
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas

GO
/****** Object:  StoredProcedure [dbo].[sp_tb_dim_cargos]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_tb_dim_cargos]

as

declare @linhas int;
merge tb_dim_cargos as destino

using (
	SELECT
	sk_destino = null,
	cd_filial_cargo = RJ_FILIAL,
	cd_cargo = RJ_FUNCAO,
	tp_maoObra_cargo = RJ_MAOBRA,
	ds_cargo = RJ_DESC,
	cd_recno_SRJ = R_E_C_N_O_,
	dt_criacao = getdate(),
	dt_alteracao = getdate()
	FROM [bi_rip_rawZone_bck].dbo.SRJ010
	WHERE D_E_L_E_T_ = ''


) origem on  
(		
	origem.cd_recno_SRJ = destino.cd_recno_SRJ
)

WHEN MATCHED THEN
	UPDATE SET
	destino.cd_filial_cargo = origem.cd_filial_cargo
	,destino.cd_cargo = origem.cd_cargo
	,destino.tp_maoObra_cargo = origem.tp_maoObra_cargo
	,destino.ds_cargo = origem.ds_cargo
	,destino.cd_recno_SRJ = origem.cd_recno_SRJ 
	,destino.dt_alteracao = getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		origem.cd_filial_cargo
		,origem.cd_cargo
		,origem.tp_maoObra_cargo
		,origem.ds_cargo
		,origem.cd_recno_SRJ						
		,origem.dt_criacao							
		,origem.dt_alteracao
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas
GO
/****** Object:  StoredProcedure [dbo].[sp_tb_dim_centroCusto]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










CREATE proc [dbo].[sp_tb_dim_centroCusto]

as

declare @linhas int;
merge tb_dim_centroCusto as destino

using (

	select 
	 --sk_destino									= null
	cd_filial_centroCusto						= CTT_FILIAL
	,cd_filialArmazem_centroCusto				=  RIGHT(CTT_ZZFEST,2)+CTT_ZZARM
	,cd_centroCusto_centroCusto					= CTT_CUSTO
	,ds_moeda1_centroCusto						= CTT_DESC01
	,fl_bloqueado_centroCusto					= CTT_BLOQ
	,dt_inicioExistencia_centroCusto			= iif(CTT_DTEXIS='',null,DATEFROMPARTS(left(CTT_DTEXIS,4),right(left(CTT_DTEXIS,6),2),right(CTT_DTEXIS,2)))  
	,dt_finalExistencia_centroCusto				= iif(CTT_DTEXSF='',null,DATEFROMPARTS(left(CTT_DTEXSF,4),right(left(CTT_DTEXSF,6),2),right(CTT_DTEXSF,2)))  
	,cd_red_centroCusto							= CTT_RES
	,cd_filialResponsavel_centroCusto			= CTT_FILMAT
	,cd_responsavel_centroCusto					= CTT_MAT
	,nm_tomadorServico_centroCusto				= CTT_NOME
	,ds_enderecoTomadorServico_centroCusto		= CTT_ENDER
	,nm_unidadeFederal_centroCusto				= CTT_ESTADO
	,nm_municipio_centroCusto					= CTT_MUNIC
	,ds_letraDebito_centroCusto					= CTT_ZZLEDB
	,ds_letraCredito_centroCusto				= CTT_ZZLECR 
	,cd_mercadoDebito_centroCusto				= CTT_ZZMEDB
	,cd_mercadoCredito_centroCusto				= CTT_ZZMECR
	,cd_modalidadeDebito_centroCusto			= CTT_ZZMODB
	,cd_modalidadeCredito_centroCusto			= CTT_ZZMOCR
	,cd_localDebito_centroCusto					= CTT_ZZLODB
	,cd_localCredito_centroCusto				= CTT_ZZLOCR
	,cd_atividadeDebito_centroCusto				= CTT_ZZATDB
	,cd_atividadeCredito_centroCusto			= CTT_ZZATCR
	,cd_empresaFilial_centroCusto				= CTT_ZZFEST
	,cd_armazemFilial_centroCusto				= CTT_ZZARM
	,fl_possueRecebimentoLocal_centroCusto		= CTT_ZZRBME
	,cd_recno_CTT								= R_E_C_N_O_
	,dt_criacao									= getdate()
	,dt_alteracao								= getdate()

	from [bi_rip_rawZone_bck].dbo.CTT010
	where D_E_L_E_T_ = ''


) origem on  
(		
	origem.cd_recno_CTT = destino.cd_recno_CTT
)

WHEN MATCHED THEN
	UPDATE SET 
	 destino.cd_filial_centroCusto						= origem.cd_filial_centroCusto
	,destino.cd_filialArmazem_centroCusto				= origem.cd_filialArmazem_centroCusto							
	,destino.cd_centroCusto_centroCusto					= origem.cd_centroCusto_centroCusto				
	,destino.ds_moeda1_centroCusto						= origem.ds_moeda1_centroCusto					
	,destino.fl_bloqueado_centroCusto					= origem.fl_bloqueado_centroCusto				
	,destino.dt_inicioExistencia_centroCusto			= origem.dt_inicioExistencia_centroCusto		
	,destino.dt_finalExistencia_centroCusto				= origem.dt_finalExistencia_centroCusto			
	,destino.cd_red_centroCusto							= origem.cd_red_centroCusto						
	,destino.cd_filialResponsavel_centroCusto			= origem.cd_filialResponsavel_centroCusto		
	,destino.cd_responsavel_centroCusto					= origem.cd_responsavel_centroCusto				
	,destino.nm_tomadorServico_centroCusto				= origem.nm_tomadorServico_centroCusto			
	,destino.ds_enderecoTomadorServico_centroCusto		= origem.ds_enderecoTomadorServico_centroCusto	
	,destino.nm_unidadeFederal_centroCusto				= origem.nm_unidadeFederal_centroCusto			
	,destino.nm_municipio_centroCusto					= origem.nm_municipio_centroCusto				
	,destino.ds_letraDebito_centroCusto					= origem.ds_letraDebito_centroCusto				
	,destino.ds_letraCredito_centroCusto				= origem.ds_letraCredito_centroCusto			
	,destino.cd_mercadoDebito_centroCusto				= origem.cd_mercadoDebito_centroCusto						
	,destino.cd_mercadoCredito_centroCusto				= origem.cd_mercadoCredito_centroCusto						
	,destino.cd_modalidadeDebito_centroCusto			= origem.cd_modalidadeDebito_centroCusto					
	,destino.cd_modalidadeCredito_centroCusto			= origem.cd_modalidadeCredito_centroCusto					
	,destino.cd_localDebito_centroCusto					= origem.cd_localDebito_centroCusto							
	,destino.cd_localCredito_centroCusto				= origem.cd_localCredito_centroCusto						
	,destino.cd_atividadeDebito_centroCusto				= origem.cd_atividadeDebito_centroCusto						
	,destino.cd_atividadeCredito_centroCusto			= origem.cd_atividadeCredito_centroCusto					
	,destino.cd_empresaFilial_centroCusto				= origem.cd_empresaFilial_centroCusto			
	,destino.cd_armazemFilial_centroCusto				= origem.cd_armazemFilial_centroCusto						
	,destino.fl_possueRecebimentoLocal_centroCusto		= origem.fl_possueRecebimentoLocal_centroCusto				
	,dt_alteracao										= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		 origem.cd_filial_centroCusto
		,origem.cd_filialArmazem_centroCusto					
		,origem.cd_centroCusto_centroCusto				
		,origem.ds_moeda1_centroCusto					
		,origem.fl_bloqueado_centroCusto				
		,origem.dt_inicioExistencia_centroCusto		
		,origem.dt_finalExistencia_centroCusto			
		,origem.cd_red_centroCusto						
		,origem.cd_filialResponsavel_centroCusto		
		,origem.cd_responsavel_centroCusto				
		,origem.nm_tomadorServico_centroCusto			
		,origem.ds_enderecoTomadorServico_centroCusto	
		,origem.nm_unidadeFederal_centroCusto			
		,origem.nm_municipio_centroCusto				
		,origem.ds_letraDebito_centroCusto				
		,origem.ds_letraCredito_centroCusto			
		,origem.cd_mercadoDebito_centroCusto						
		,origem.cd_mercadoCredito_centroCusto						
		,origem.cd_modalidadeDebito_centroCusto					
		,origem.cd_modalidadeCredito_centroCusto					
		,origem.cd_localDebito_centroCusto							
		,origem.cd_localCredito_centroCusto						
		,origem.cd_atividadeDebito_centroCusto						
		,origem.cd_atividadeCredito_centroCusto					
		,origem.cd_empresaFilial_centroCusto			
		,origem.cd_armazemFilial_centroCusto						
		,origem.fl_possueRecebimentoLocal_centroCusto				
		,origem.cd_recno_CTT							
		,origem.dt_criacao								
		,origem.dt_alteracao							
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas
GO
/****** Object:  StoredProcedure [dbo].[sp_tb_dim_codificacoesNotasFiscais]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_tb_dim_codificacoesNotasFiscais]

as


declare @linhas int;
merge tb_dim_codificacoesNotasFiscais as destino

using (

	select
		--sk_destino												= null 
		 cd_filial_codificacoesNotasFiscais						= F4_FILIAL
		,cd_entradaSaida_codificacoesNotasFiscais				= F4_CODIGO
		,tp_tes_codificacoesNotasFiscais						= F4_TIPO
		,fl_calculaIcms_codificacoesNotasFiscais				= F4_ICM
		,fl_calculaIpi_codificacoesNotasFiscais					= F4_IPI
		,fl_creditaIcm_codificacoesNotasFiscais					= F4_CREDICM
		,fl_creditaIpi_codificacoesNotasFiscais					= F4_CREDIPI
		,fl_duplicata_codificacoesNotasFiscais					= F4_DUPLIC
		,fl_estoque_codificacoesNotasFiscais					= F4_ESTOQUE
		,cd_fiscalOperacao_codificacoesNotasFiscais				= F4_CF
		,cd_textoPadrao_codificacoesNotasFiscais				= F4_TEXTO
		,vl_percentualReducaoBaseIcms_codificacoesNotasFiscais	= F4_BASEICM
		,vl_percentualReducaoBaseIpi_codificacoesNotasFiscais	= F4_BASEIPI
		,cd_livroFiscalIcmi_codificacoesNotasFiscais			= F4_LFICM
		,cd_livroFiscalIpi_codificacoesNotasFiscais				= F4_LFIPI
		,fl_destacaIpiNaNota_codificacoesNotasFiscais			= F4_DESTACA
		,fl_incideIpiNaBase_codificacoesNotasFiscais			= F4_INCIDE
		,fl_calculaDiferencaIcm_codificacoesNotasFiscais		= F4_COMPL
		,fl_incideIpiSemFrete_codificacoesNotasFiscais			= F4_IPIFRET
		,fl_incideIss_codificacoesNotasFiscais					= F4_ISS
		,cd_livroFiscalIss_codificacoesNotasFiscais				= F4_LFISS
		,fl_materialConsumo_codificacoesNotasFiscais			= F4_CONSUMO
		,fl_baseIcmsSt_codificacoesNotasFiscais					= F4_STDESC
		,vl_percentualBaseIcmsSt_codificacoesNotasFiscais		= F4_BSICMST
		,fl_creditaIcmsSt_codificacoesNotasFiscais				= F4_CREDST
		,vl_percentualIss_codificacoesNotasFiscais				= F4_BASEISS
		,fl_despesasBaseIcms_codificacoesNotasFiscais			= F4_DESPICM
		,cd_situacaoTributariaIcms_codificacoesNotasFiscais		= F4_SITTRIB
		,fl_defineSeGeraPisCofins_codificacoesNotasFiscais		= F4_PISCOF
		,fl_creditaPisCofins_codificacoesNotasFiscais			= F4_PISCRED
		,tp_operacao_codificacoesNotasFiscais					= F4_TIPOPER
		,fl_bloqueiaUsoTes_codificacoesNotasFiscais				= F4_MSBLQL
		,ds_finalidadeTes_codificacoesNotasFiscais				= F4_FINALID
		,tp_regime_codificacoesNotasFiscais						= F4_TPREG
		,fl_transferenciaFiliais_codificacoesNotasFiscais		= F4_TRANFIL
		,cd_recno_SRA											= R_E_C_N_O_ 
		,dt_criacao												= getdate()
		,dt_alteracao											= getdate()
	from [bi_rip_rawZone_bck].dbo.SF4010
	WHERE D_E_L_E_T_ = ''


) origem on  
(		
	origem.cd_recno_SRA = destino.cd_recno_SRA
)

WHEN MATCHED THEN
	UPDATE SET 
	 destino.cd_filial_codificacoesNotasFiscais						= origem.cd_filial_codificacoesNotasFiscais						
	,destino.cd_entradaSaida_codificacoesNotasFiscais				= origem.cd_entradaSaida_codificacoesNotasFiscais				
	,destino.tp_tes_codificacoesNotasFiscais						= origem.tp_tes_codificacoesNotasFiscais						
	,destino.fl_calculaIcms_codificacoesNotasFiscais				= origem.fl_calculaIcms_codificacoesNotasFiscais				
	,destino.fl_calculaIpi_codificacoesNotasFiscais					= origem.fl_calculaIpi_codificacoesNotasFiscais					
	,destino.fl_creditaIcm_codificacoesNotasFiscais					= origem.fl_creditaIcm_codificacoesNotasFiscais					
	,destino.fl_creditaIpi_codificacoesNotasFiscais					= origem.fl_creditaIpi_codificacoesNotasFiscais					
	,destino.fl_duplicata_codificacoesNotasFiscais					= origem.fl_duplicata_codificacoesNotasFiscais					
	,destino.fl_estoque_codificacoesNotasFiscais					= origem.fl_estoque_codificacoesNotasFiscais					
	,destino.cd_fiscalOperacao_codificacoesNotasFiscais				= origem.cd_fiscalOperacao_codificacoesNotasFiscais				
	,destino.cd_textoPadrao_codificacoesNotasFiscais				= origem.cd_textoPadrao_codificacoesNotasFiscais				
	,destino.vl_percentualReducaoBaseIcms_codificacoesNotasFiscais	= origem.vl_percentualReducaoBaseIcms_codificacoesNotasFiscais	
	,destino.vl_percentualReducaoBaseIpi_codificacoesNotasFiscais	= origem.vl_percentualReducaoBaseIpi_codificacoesNotasFiscais	
	,destino.cd_livroFiscalIcmi_codificacoesNotasFiscais			= origem.cd_livroFiscalIcmi_codificacoesNotasFiscais			
	,destino.cd_livroFiscalIpi_codificacoesNotasFiscais				= origem.cd_livroFiscalIpi_codificacoesNotasFiscais				
	,destino.fl_destacaIpiNaNota_codificacoesNotasFiscais			= origem.fl_destacaIpiNaNota_codificacoesNotasFiscais			
	,destino.fl_incideIpiNaBase_codificacoesNotasFiscais			= origem.fl_incideIpiNaBase_codificacoesNotasFiscais			
	,destino.fl_calculaDiferencaIcm_codificacoesNotasFiscais		= origem.fl_calculaDiferencaIcm_codificacoesNotasFiscais		
	,destino.fl_incideIpiSemFrete_codificacoesNotasFiscais			= origem.fl_incideIpiSemFrete_codificacoesNotasFiscais			
	,destino.fl_incideIss_codificacoesNotasFiscais					= origem.fl_incideIss_codificacoesNotasFiscais					
	,destino.cd_livroFiscalIss_codificacoesNotasFiscais				= origem.cd_livroFiscalIss_codificacoesNotasFiscais				
	,destino.fl_materialConsumo_codificacoesNotasFiscais			= origem.fl_materialConsumo_codificacoesNotasFiscais			
	,destino.fl_baseIcmsSt_codificacoesNotasFiscais					= origem.fl_baseIcmsSt_codificacoesNotasFiscais					
	,destino.vl_percentualBaseIcmsSt_codificacoesNotasFiscais		= origem.vl_percentualBaseIcmsSt_codificacoesNotasFiscais		
	,destino.fl_creditaIcmsSt_codificacoesNotasFiscais				= origem.fl_creditaIcmsSt_codificacoesNotasFiscais				
	,destino.vl_percentualIss_codificacoesNotasFiscais				= origem.vl_percentualIss_codificacoesNotasFiscais				
	,destino.fl_despesasBaseIcms_codificacoesNotasFiscais			= origem.fl_despesasBaseIcms_codificacoesNotasFiscais			
	,destino.cd_situacaoTributariaIcms_codificacoesNotasFiscais		= origem.cd_situacaoTributariaIcms_codificacoesNotasFiscais		
	,destino.fl_defineSeGeraPisCofins_codificacoesNotasFiscais		= origem.fl_defineSeGeraPisCofins_codificacoesNotasFiscais		
	,destino.fl_creditaPisCofins_codificacoesNotasFiscais			= origem.fl_creditaPisCofins_codificacoesNotasFiscais			
	,destino.tp_operacao_codificacoesNotasFiscais					= origem.tp_operacao_codificacoesNotasFiscais					
	,destino.fl_bloqueiaUsoTes_codificacoesNotasFiscais				= origem.fl_bloqueiaUsoTes_codificacoesNotasFiscais				
	,destino.ds_finalidadeTes_codificacoesNotasFiscais				= origem.ds_finalidadeTes_codificacoesNotasFiscais				
	,destino.tp_regime_codificacoesNotasFiscais						= origem.tp_regime_codificacoesNotasFiscais						
	,destino.fl_transferenciaFiliais_codificacoesNotasFiscais		= origem.fl_transferenciaFiliais_codificacoesNotasFiscais		
	,destino.dt_alteracao											= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		 origem.cd_filial_codificacoesNotasFiscais						
		,origem.cd_entradaSaida_codificacoesNotasFiscais				
		,origem.tp_tes_codificacoesNotasFiscais						
		,origem.fl_calculaIcms_codificacoesNotasFiscais				
		,origem.fl_calculaIpi_codificacoesNotasFiscais					
		,origem.fl_creditaIcm_codificacoesNotasFiscais					
		,origem.fl_creditaIpi_codificacoesNotasFiscais					
		,origem.fl_duplicata_codificacoesNotasFiscais					
		,origem.fl_estoque_codificacoesNotasFiscais					
		,origem.cd_fiscalOperacao_codificacoesNotasFiscais				
		,origem.cd_textoPadrao_codificacoesNotasFiscais				
		,origem.vl_percentualReducaoBaseIcms_codificacoesNotasFiscais	
		,origem.vl_percentualReducaoBaseIpi_codificacoesNotasFiscais	
		,origem.cd_livroFiscalIcmi_codificacoesNotasFiscais			
		,origem.cd_livroFiscalIpi_codificacoesNotasFiscais				
		,origem.fl_destacaIpiNaNota_codificacoesNotasFiscais			
		,origem.fl_incideIpiNaBase_codificacoesNotasFiscais			
		,origem.fl_calculaDiferencaIcm_codificacoesNotasFiscais		
		,origem.fl_incideIpiSemFrete_codificacoesNotasFiscais			
		,origem.fl_incideIss_codificacoesNotasFiscais					
		,origem.cd_livroFiscalIss_codificacoesNotasFiscais				
		,origem.fl_materialConsumo_codificacoesNotasFiscais			
		,origem.fl_baseIcmsSt_codificacoesNotasFiscais					
		,origem.vl_percentualBaseIcmsSt_codificacoesNotasFiscais		
		,origem.fl_creditaIcmsSt_codificacoesNotasFiscais				
		,origem.vl_percentualIss_codificacoesNotasFiscais				
		,origem.fl_despesasBaseIcms_codificacoesNotasFiscais			
		,origem.cd_situacaoTributariaIcms_codificacoesNotasFiscais		
		,origem.fl_defineSeGeraPisCofins_codificacoesNotasFiscais		
		,origem.fl_creditaPisCofins_codificacoesNotasFiscais			
		,origem.tp_operacao_codificacoesNotasFiscais					
		,origem.fl_bloqueiaUsoTes_codificacoesNotasFiscais				
		,origem.ds_finalidadeTes_codificacoesNotasFiscais				
		,origem.tp_regime_codificacoesNotasFiscais						
		,origem.fl_transferenciaFiliais_codificacoesNotasFiscais		
		,origem.cd_recno_SRA											
		,origem.dt_criacao												
		,origem.dt_alteracao											
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas
GO
/****** Object:  StoredProcedure [dbo].[sp_tb_dim_competencia_ponto]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_tb_dim_competencia_ponto] AS

	DELETE FROM bi_rip_trustedZone.dbo.tb_dim_competencia_ponto;

	DECLARE @Inicio DATE, @Fim DATE, @mes VARCHAR(2), @ano VARCHAR(4), @mes_desc VARCHAR(20);
	DECLARE date_cursor CURSOR FOR 
	SELECT 
		CONVERT(DATE, dtinicio),
		CONVERT(DATE, dtfim),
		CONVERT(VARCHAR(2),mes), 
		CONVERT(VARCHAR(4),ano), 
		CONVERT(VARCHAR(20),mes_desc)
	FROM bi_rip_rawZone_bck.dbo.STOU_COMPETENCIA;

	OPEN date_cursor;

	FETCH NEXT FROM date_cursor INTO @Inicio, @Fim, @mes, @ano, @mes_desc;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		WITH DTRANGE AS
		(
			SELECT @Inicio AS DATAS, @mes AS MES, @ano AS ANO, @mes_desc AS MES_DESC
			UNION ALL
			SELECT DATEADD(DAY, 1, DATAS), @mes, @ano, @mes_desc 
			FROM DTRANGE
			WHERE DATAS < @Fim
		)
		INSERT INTO bi_rip_trustedZone.dbo.tb_dim_competencia_ponto (dt_referencia, mes, ano, mes_desc)
		SELECT DATAS, MES, ANO, MES_DESC
		FROM DTRANGE
		OPTION (MAXRECURSION 0);

		FETCH NEXT FROM date_cursor INTO @Inicio, @Fim, @mes, @ano, @mes_desc;
	END;

	CLOSE date_cursor;
	DEALLOCATE date_cursor;
GO
/****** Object:  StoredProcedure [dbo].[sp_tb_dim_compradores]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE proc [dbo].[sp_tb_dim_compradores]

as

declare @linhas int;
merge tb_dim_compradores as destino

using (

	select 
	 sk_destino								= null
	,cd_filial_compradores					= Y1_FILIAL
	,cd_comprador_compradores				= Y1_COD
	,nm_usuario_compradores					= Y1_NOME
	,cd_usuario_compradores					= Y1_USER
	,nr_telefone_compradores				= Y1_TEL
	,nr_fax_compradores						= Y1_FAX
	,nm_email_compradores					= Y1_EMAIL
	,cd_grupoAprovacao_compradores			= Y1_GRAPROV
	,fl_incluiPedidoSemSC_compradores		= Y1_PEDIDO
	,cd_grupoComprasPadrao_compradores		= Y1_GRUPCOM
	,cd_grupoAprovacaoContrato_compradores	= Y1_GRAPRCP 
	,cd_perfilAcc_compradores				= Y1_ACCID
	,cd_usuarioBloqueado_compradores		= Y1_MSBLQL
	,cd_recno_SY1							= R_E_C_N_O_ 
	,dt_criacao								= getdate()
	,dt_alteracao							= getdate()
	from [bi_rip_rawZone_bck].dbo.SY1010
	--where D_E_L_E_T_ = ''


) origem on  
(		
	origem.cd_recno_SY1 = destino.cd_recno_SY1
)

WHEN MATCHED THEN
	UPDATE SET 
	
	 destino.cd_filial_compradores					= origem.cd_filial_compradores					
	,destino.cd_comprador_compradores				= origem.cd_comprador_compradores				
	,destino.nm_usuario_compradores					= origem.nm_usuario_compradores					
	,destino.cd_usuario_compradores					= origem.cd_usuario_compradores					
	,destino.nr_telefone_compradores				= origem.nr_telefone_compradores				
	,destino.nr_fax_compradores						= origem.nr_fax_compradores						
	,destino.nm_email_compradores					= origem.nm_email_compradores					
	,destino.cd_grupoAprovacao_compradores			= origem.cd_grupoAprovacao_compradores			
	,destino.fl_incluiPedidoSemSC_compradores		= origem.fl_incluiPedidoSemSC_compradores		
	,destino.cd_grupoComprasPadrao_compradores		= origem.cd_grupoComprasPadrao_compradores		
	,destino.cd_grupoAprovacaoContrato_compradores	= origem.cd_grupoAprovacaoContrato_compradores	
	,destino.cd_perfilAcc_compradores				= origem.cd_perfilAcc_compradores				
	,destino.cd_usuarioBloqueado_compradores		= origem.cd_usuarioBloqueado_compradores				
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		 origem.cd_filial_compradores					
		,origem.cd_comprador_compradores				
		,origem.nm_usuario_compradores					
		,origem.cd_usuario_compradores					
		,origem.nr_telefone_compradores				
		,origem.nr_fax_compradores						
		,origem.nm_email_compradores					
		,origem.cd_grupoAprovacao_compradores			
		,origem.fl_incluiPedidoSemSC_compradores		
		,origem.cd_grupoComprasPadrao_compradores		
		,origem.cd_grupoAprovacaoContrato_compradores	
		,origem.cd_perfilAcc_compradores				
		,origem.cd_usuarioBloqueado_compradores		
		,origem.cd_recno_SY1							
		,origem.dt_criacao								
		,origem.dt_alteracao										
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas

GO
/****** Object:  StoredProcedure [dbo].[sp_tb_dim_condicoesPagamento]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE procedure [dbo].[sp_tb_dim_condicoesPagamento]

as

declare @linhas int

merge tb_dim_condicoesPagamento as destino

using (

select
	--sk_destino									= null 
	 cd_filial_condicoesPagamento				= E4_FILIAL
	,cd_condicao_condicoesPagamento				= E4_CODIGO
	,tp_condicao_condicoesPagamento				= E4_TIPO
	,nm_condicao_condicoesPagamento				= E4_COND
	,ds_condicao_condicoesPagamento				= E4_DESCRI
	,ds_dias_condicoesPagamento					= E4_DDD
	,st_registro_condicoesPagamento				= E4_MSBLQL
	,fl_permiteAdiantamento_condicoesPagamento	= E4_CTRADT
	,cd_recno_CTT								= R_E_C_N_O_ 
	,dt_criacao									= getdate()
	,dt_alteracao								= getdate()
from bi_rip_rawZone_bck.dbo.SE4010
where D_E_L_E_T_ = ''


) origem on  
(		
	origem.cd_recno_CTT = destino.cd_recno_CTT
)

WHEN MATCHED THEN
	UPDATE SET 
	 destino.cd_filial_condicoesPagamento				= origem.cd_filial_condicoesPagamento				
	,destino.cd_condicao_condicoesPagamento				= origem.cd_condicao_condicoesPagamento				
	,destino.tp_condicao_condicoesPagamento				= origem.tp_condicao_condicoesPagamento				
	,destino.nm_condicao_condicoesPagamento				= origem.nm_condicao_condicoesPagamento				
	,destino.ds_condicao_condicoesPagamento				= origem.ds_condicao_condicoesPagamento				
	,destino.ds_dias_condicoesPagamento					= origem.ds_dias_condicoesPagamento					
	,destino.st_registro_condicoesPagamento				= origem.st_registro_condicoesPagamento				
	,destino.fl_permiteAdiantamento_condicoesPagamento	= origem.fl_permiteAdiantamento_condicoesPagamento	
	,destino.dt_alteracao								= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		 origem.cd_filial_condicoesPagamento				
		,origem.cd_condicao_condicoesPagamento				
		,origem.tp_condicao_condicoesPagamento				
		,origem.nm_condicao_condicoesPagamento				
		,origem.ds_condicao_condicoesPagamento				
		,origem.ds_dias_condicoesPagamento					
		,origem.st_registro_condicoesPagamento				
		,origem.fl_permiteAdiantamento_condicoesPagamento	
		,origem.cd_recno_CTT								
		,origem.dt_criacao									
		,origem.dt_alteracao										
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas
GO
/****** Object:  StoredProcedure [dbo].[sp_tb_dim_dependentes]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_tb_dim_dependentes]

as

declare @linhas int;
merge tb_dim_dependentes as destino

using (

	select 
	sk_destino = null,
	cd_filial_funcionarios = RB_FILIAL,
	cd_matricula_funcionarios = RB_MAT,
	cd_dependente = RB_COD,
	nm_dependente = RB_NOME,
	cd_tpDependente = RB_TPDEP,
	dt_nascimentoDependente = RB_DTNASC,
	tp_sexoDependente = CASE RB_SEXO WHEN 'M' THEN 'Masculino' WHEN 'F' THEN 'Feminino' ELSE 'Outro' END,
	tp_grauParentesco = CASE RB_GRAUPAR WHEN 'C' THEN 'Cônjuge/Companheiro' WHEN 'F' THEN 'Filho' WHEN 'E' THEN 'Enteado' WHEN 'P' THEN 'Pai/Mãe' WHEN 'O' THEN 'Agregado/Outros' ELSE 'Outro' END,
	tp_dependenteImpostoRenda = CASE RB_TIPIR WHEN '1' THEN 'Sem limite de Idade' WHEN '2' THEN 'Até 21 anos' WHEN '3' THEN 'Até 24 anos' WHEN '4' THEN 'Não é Dependente' ELSE 'Outro' END,
	tp_dependenteSalarioFamilia = CASE RB_TIPSF WHEN '1' THEN 'Sem Limite de Idade' WHEN '2' THEN 'Até 14 anos' WHEN '3' THEN 'Não é Dependente' ELSE 'Outro' END,
	cd_recno_SRB = R_E_C_N_O_,
	dt_criacao = getdate(),
	dt_alteracao = getdate(),
	vl_idadeDependente = DATEDIFF(year, CONVERT(date, RB_DTNASC), getdate())
	from [bi_rip_rawZone_bck].dbo.SRB010
	where D_E_L_E_T_ = ''


) origem on  
(		
	origem.cd_recno_SRB = destino.cd_recno_SRB
)

WHEN MATCHED THEN
	UPDATE SET 
	
	destino.cd_filial_funcionarios = origem.cd_filial_funcionarios,
	destino.cd_matricula_funcionarios = origem.cd_matricula_funcionarios,
	destino.cd_dependente = origem.cd_dependente,
	destino.nm_dependente = origem.nm_dependente,
	destino.cd_tpDependente = origem.cd_tpDependente,
	destino.dt_nascimentoDependente = origem.dt_nascimentoDependente,
	destino.tp_sexoDependente = origem.tp_sexoDependente,
	destino.tp_grauParentesco = origem.tp_grauParentesco,
	destino.tp_dependenteImpostoRenda = origem.tp_dependenteImpostoRenda,
	destino.tp_dependenteSalarioFamilia = origem.tp_dependenteSalarioFamilia,
	destino.cd_recno_SRB = origem.cd_recno_SRB,
	destino.dt_alteracao = getdate(),
	destino.vl_idadeDependente = origem.vl_idadeDependente
						

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
							
	origem.cd_filial_funcionarios,
	origem.cd_matricula_funcionarios,
	origem.cd_dependente,
	origem.nm_dependente,
	origem.cd_tpDependente,
	origem.dt_nascimentoDependente,
	origem.tp_sexoDependente,
	origem.tp_grauParentesco,
	origem.tp_dependenteImpostoRenda,
	origem.tp_dependenteSalarioFamilia,
	origem.cd_recno_SRB,
	origem.dt_criacao,
	origem.dt_alteracao,
	origem.vl_idadeDependente
										
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas

GO
/****** Object:  StoredProcedure [dbo].[sp_tb_dim_empresasFiliais]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE proc [dbo].[sp_tb_dim_empresasFiliais]

as

declare @linhas int;
merge tb_dim_empresasFiliais as destino

using (

	select
		sk_destino								= null 
		,cd_empresaFilial_empresasFiliais		= convert(varchar,M0_CODIGO)+convert(varchar,M0_CODFIL)
		,cd_empresa_empresasFiliais				= M0_CODIGO
		,cd_filial_empresasFiliais				= M0_CODFIL
		,nm_filial_empresasFiliais				= M0_FILIAL
		,nm_empresa_empresasFiliais				= M0_NOME
		,nm_empresaCompleto_empresasFiliais		= M0_NOMECOM
		,sg_unidadeFederal_empresasFiliais		= M0_ESTENT
		,cd_recno_SYS_COMPANY					= R_E_C_N_O_ 
		,dt_criacao								= getdate()
		,dt_alteracao							= getdate()
	from [bi_rip_rawZone_bck].dbo.SYS_COMPANY
	where D_E_L_E_T_ = ''

) origem on  
(		
	origem.cd_recno_SYS_COMPANY = destino.cd_recno_SYS_COMPANY
)

WHEN MATCHED THEN
	UPDATE SET 
	 destino.cd_empresa_empresasFiliais			= origem.cd_empresa_empresasFiliais
	,destino.cd_empresaFilial_empresasFiliais	= origem.cd_empresaFilial_empresasFiliais		
	,destino.cd_filial_empresasFiliais			= origem.cd_filial_empresasFiliais				
	,destino.nm_filial_empresasFiliais			= origem.nm_filial_empresasFiliais				
	,destino.nm_empresa_empresasFiliais			= origem.nm_empresa_empresasFiliais				
	,destino.nm_empresaCompleto_empresasFiliais	= origem.nm_empresaCompleto_empresasFiliais		
	,destino.sg_unidadeFederal_empresasFiliais	= origem.sg_unidadeFederal_empresasFiliais
	,destino.cd_recno_SYS_COMPANY				= origem.cd_recno_SYS_COMPANY					
	,dt_alteracao								= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		origem.cd_empresaFilial_empresasFiliais
		,origem.cd_empresa_empresasFiliais				
		,origem.cd_filial_empresasFiliais				
		,origem.nm_filial_empresasFiliais				
		,origem.nm_empresa_empresasFiliais				
		,origem.nm_empresaCompleto_empresasFiliais
		,origem.sg_unidadeFederal_empresasFiliais	
		,origem.cd_recno_SYS_COMPANY					
		,origem.dt_criacao								
		,origem.dt_alteracao									
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas



GO
/****** Object:  StoredProcedure [dbo].[sp_tb_dim_enderecosEstoque]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[sp_tb_dim_enderecosEstoque]

as

declare @linhas int;
merge tb_dim_enderecosEstoque as destino

using (

	select
		--sk_destino								= null 
		 cd_filial_enderecosEstoque				= BE_FILIAL
		,cd_armazem_enderecosEstoque			= BE_LOCAL
		,cd_endereco_enderecosEstoque			= BE_LOCALIZ
		,ds_endereco_enderecosEstoque			= BE_DESCRIC
		,st_endereco_enderecosEstoque			= BE_STATUS
		,cd_produto_enderecosEstoque			= BE_CODPRO
		,hr_ultimoMovimento_enderecosEstoque	= BE_HORA
		,fl_ok_enderecosEstoque					= BE_OK
		,cd_excecao_enderecosEstoque			= BE_EXCECAO
		,dt_geracao_enderecosEstoque			= iif(BE_DATGER='',null,DATEFROMPARTS(left(BE_DATGER,4),right(left(BE_DATGER,6),2),right(BE_DATGER,2)))   
		,hr_geracao_enderecosEstoque			= BE_HORGER 
		,dt_bloqueioInventario_enderecosEstoque = iif(BE_DTINV='',null,DATEFROMPARTS(left(BE_DTINV,4),right(left(BE_DTINV,6),2),right(BE_DTINV,2)))   
		,cd_etiqueta_enderecosEstoque			= BE_IDETIQ
		,cd_recno_SBE							= R_E_C_N_O_ 
		,dt_criacao								= getdate()
		,dt_alteracao							= getdate()
	from [bi_rip_rawZone_bck].dbo.SBE010
	where D_E_L_E_T_ = ''


) origem on  
(		
	destino.cd_recno_SBE = origem.cd_recno_SBE
)

WHEN MATCHED THEN
	UPDATE SET 
	 destino.cd_filial_enderecosEstoque					= origem.cd_filial_enderecosEstoque				
	,destino.cd_armazem_enderecosEstoque				= origem.cd_armazem_enderecosEstoque			
	,destino.cd_endereco_enderecosEstoque				= origem.cd_endereco_enderecosEstoque			
	,destino.ds_endereco_enderecosEstoque				= origem.ds_endereco_enderecosEstoque			
	,destino.st_endereco_enderecosEstoque				= origem.st_endereco_enderecosEstoque			
	,destino.cd_produto_enderecosEstoque				= origem.cd_produto_enderecosEstoque			
	,destino.hr_ultimoMovimento_enderecosEstoque		= origem.hr_ultimoMovimento_enderecosEstoque	
	,destino.fl_ok_enderecosEstoque						= origem.fl_ok_enderecosEstoque					
	,destino.cd_excecao_enderecosEstoque				= origem.cd_excecao_enderecosEstoque			
	,destino.dt_geracao_enderecosEstoque				= origem.dt_geracao_enderecosEstoque			
	,destino.hr_geracao_enderecosEstoque				= origem.hr_geracao_enderecosEstoque			
	,destino.dt_bloqueioInventario_enderecosEstoque 	= origem.dt_bloqueioInventario_enderecosEstoque 
	,destino.cd_etiqueta_enderecosEstoque			    = origem.cd_etiqueta_enderecosEstoque			
	,dt_alteracao										= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		 origem.cd_filial_enderecosEstoque				
		,origem.cd_armazem_enderecosEstoque			
		,origem.cd_endereco_enderecosEstoque			
		,origem.ds_endereco_enderecosEstoque			
		,origem.st_endereco_enderecosEstoque			
		,origem.cd_produto_enderecosEstoque			
		,origem.hr_ultimoMovimento_enderecosEstoque	
		,origem.fl_ok_enderecosEstoque					
		,origem.cd_excecao_enderecosEstoque			
		,origem.dt_geracao_enderecosEstoque			
		,origem.hr_geracao_enderecosEstoque			
		,origem.dt_bloqueioInventario_enderecosEstoque 
		,origem.cd_etiqueta_enderecosEstoque			
		,origem.cd_recno_SBE							
		,origem.dt_criacao								
		,origem.dt_alteracao									
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas
GO
/****** Object:  StoredProcedure [dbo].[sp_tb_dim_fichaMedica]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_tb_dim_fichaMedica]

as

declare @linhas int;
merge tb_dim_fichaMedica as destino

using (

	SELECT
	sk_destino	= null,
	cd_filial = TM0_FILIAL,
	cd_fichaMedica = TM0_NUMFIC,
	cd_candidato = TM0_CANDID,
	cd_filial_funcionario = TM0_FILFUN,
	cd_matricula_funcionario = TM0_MAT,
	cd_dependente = TM0_NUMDEP,
	nm_funcionario = TM0_NOMFIC,
	dt_dataImpl = TM0_DTIMPL,
	cd_fichaAnterior = TM0_FICANT,
	dt_dataNascimento = TM0_DTNASC,
	cd_recno_TM0 = R_E_C_N_O_,
	dt_criacao = getdate(),
	dt_alteracao = getdate()
	
	FROM [bi_rip_rawZone_bck].dbo.TM0010
	WHERE D_E_L_E_T_ = ''


) origem on  
(		
	origem.cd_recno_TM0	= destino.cd_recno_TM0
)

WHEN MATCHED THEN
	UPDATE SET 
	destino.cd_filial = origem.cd_filial,
	destino.cd_fichaMedica = origem.cd_fichaMedica,
	destino.cd_candidato = origem.cd_candidato,
	destino.cd_filial_funcionario = origem.cd_filial_funcionario,
	destino.cd_matricula_funcionario = origem.cd_matricula_funcionario,
	destino.cd_dependente = origem.cd_dependente,
	destino.nm_funcionario = origem.nm_funcionario,
	destino.dt_dataImpl = origem.dt_dataImpl,
	destino.cd_fichaAnterior = origem.cd_fichaAnterior,
	destino.dt_dataNascimento = origem.dt_dataNascimento,
	destino.cd_recno_TM0 = origem.cd_recno_TM0,
	destino.dt_alteracao = getdate()

	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
	origem.cd_filial,
	origem.cd_fichaMedica,
	origem.cd_candidato,
	origem.cd_filial_funcionario,
	origem.cd_matricula_funcionario,
	origem.cd_dependente,
	origem.nm_funcionario,
	origem.dt_dataImpl,
	origem.cd_fichaAnterior,
	origem.dt_dataNascimento,
	origem.cd_recno_TM0,
	origem.dt_criacao,							
	origem.dt_alteracao																
		)											

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas
GO
/****** Object:  StoredProcedure [dbo].[sp_tb_dim_fornecedores]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE proc [dbo].[sp_tb_dim_fornecedores]

as

declare @linhas int;
merge tb_dim_fornecedores as destino

using (

select
	 --sk_destino								= null 
	 cd_filial_fornecedores					= A2_FILIAL
	,cd_fornecedor_fornecedores				= A2_COD
	,cd_loja_fornecedores					= A2_LOJA
	,nm_filial_fornecedores					= A2_NOME
	,nm_fantasia_fornecedores				= A2_NREDUZ
	,nm_enderecoFornecedor_fornecedores		= A2_END
	,nr_endereco_fornecedores				= A2_NR_END
	,sg_unidadeFederal_fornecedores			= A2_EST
	,nm_estado_fornecedores					= A2_ESTADO
	,nm_municipioFornecedor_fornecedores	= A2_MUN
	,cnr_cpfCnpj_fornecedores				= A2_CGC
	,nr_telefone_fornecedores				= A2_TEL
	,nr_faxFornecedor_fornecedores			= A2_FAX
	,nr_inscricaoEstadual_fornecedores		= A2_INSCR
	,nr_inscricaoMunicipal_fornecedores		= A2_INSCRM
	,nr_contatoEmpresa_fornecedores			= A2_CONTATO
	,cd_condicaoPagamento_fornecedores		= A2_COND
	,nr_maiorAtrasoEmDias_fornecedores		= A2_MATR
	,vl_maiorCompra_fornecedores			= A2_MCOMPRA
	,nr_mediaAtrasoEmDias_fornecedores		= A2_METR
	,vl_maiorSaldoCredor_fornecedores		= A2_MSALDO
	,nt_totalCompras_fornecedores			= A2_NROCOM
	,dt_primeiraCompra_fornecedores			= iif(A2_PRICOM='',null,DATEFROMPARTS(left(A2_PRICOM,4),right(left(A2_PRICOM,6),2),right(A2_PRICOM,2)))   
	,dt_ultimaCompra_fornecedores			= iif(A2_ULTCOM='',null,DATEFROMPARTS(left(A2_ULTCOM,4),right(left(A2_ULTCOM,6),2),right(A2_ULTCOM,2)))   
	,cd_paisFornecedor_fornecedores			= A2_PAIS
	,fl_fornecedorHomologado_fornecedores	= A2_STATUS
	,cd_atividadeEconomica_fornecedores		= A2_ATIVIDA
	,cd_recno_SA2							= R_E_C_N_O_ 
	,dt_criacao								= getdate()
	,dt_alteracao							= getdate()
from [bi_rip_rawZone_bck].dbo.SA2010
where D_E_L_E_T_ = '' and R_E_C_D_E_L_ = 0


) origem on  
(		
	origem.cd_recno_SA2 = destino.cd_recno_SA2
)

WHEN MATCHED THEN
	UPDATE SET 
	 destino.cd_filial_fornecedores					= origem.cd_filial_fornecedores					
	,destino.cd_fornecedor_fornecedores				= origem.cd_fornecedor_fornecedores				
	,destino.cd_loja_fornecedores					= origem.cd_loja_fornecedores					
	,destino.nm_filial_fornecedores					= origem.nm_filial_fornecedores					
	,destino.nm_fantasia_fornecedores				= origem.nm_fantasia_fornecedores				
	,destino.nm_enderecoFornecedor_fornecedores		= origem.nm_enderecoFornecedor_fornecedores		
	,destino.nr_endereco_fornecedores				= origem.nr_endereco_fornecedores				
	,destino.sg_unidadeFederal_fornecedores			= origem.sg_unidadeFederal_fornecedores			
	,destino.nm_estado_fornecedores					= origem.nm_estado_fornecedores					
	,destino.nm_municipioFornecedor_fornecedores	= origem.nm_municipioFornecedor_fornecedores	
	,destino.cnr_cpfCnpj_fornecedores				= origem.cnr_cpfCnpj_fornecedores				
	,destino.nr_telefone_fornecedores				= origem.nr_telefone_fornecedores				
	,destino.nr_faxFornecedor_fornecedores			= origem.nr_faxFornecedor_fornecedores			
	,destino.nr_inscricaoEstadual_fornecedores		= origem.nr_inscricaoEstadual_fornecedores		
	,destino.nr_inscricaoMunicipal_fornecedores		= origem.nr_inscricaoMunicipal_fornecedores		
	,destino.nr_contatoEmpresa_fornecedores			= origem.nr_contatoEmpresa_fornecedores			
	,destino.cd_condicaoPagamento_fornecedores		= origem.cd_condicaoPagamento_fornecedores		
	,destino.nr_maiorAtrasoEmDias_fornecedores		= origem.nr_maiorAtrasoEmDias_fornecedores		
	,destino.vl_maiorCompra_fornecedores			= origem.vl_maiorCompra_fornecedores			
	,destino.nr_mediaAtrasoEmDias_fornecedores		= origem.nr_mediaAtrasoEmDias_fornecedores		
	,destino.vl_maiorSaldoCredor_fornecedores		= origem.vl_maiorSaldoCredor_fornecedores		
	,destino.nt_totalCompras_fornecedores			= origem.nt_totalCompras_fornecedores			
	,destino.dt_primeiraCompra_fornecedores			= origem.dt_primeiraCompra_fornecedores			
	,destino.dt_ultimaCompra_fornecedores			= origem.dt_ultimaCompra_fornecedores			
	,destino.cd_paisFornecedor_fornecedores			= origem.cd_paisFornecedor_fornecedores			
	,destino.fl_fornecedorHomologado_fornecedores	= origem.fl_fornecedorHomologado_fornecedores	
	,destino.cd_atividadeEconomica_fornecedores		= origem.cd_atividadeEconomica_fornecedores		
	,destino.dt_alteracao							= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		 origem.cd_filial_fornecedores					
		,origem.cd_fornecedor_fornecedores				
		,origem.cd_loja_fornecedores					
		,origem.nm_filial_fornecedores					
		,origem.nm_fantasia_fornecedores				
		,origem.nm_enderecoFornecedor_fornecedores		
		,origem.nr_endereco_fornecedores				
		,origem.sg_unidadeFederal_fornecedores			
		,origem.nm_estado_fornecedores					
		,origem.nm_municipioFornecedor_fornecedores	
		,origem.cnr_cpfCnpj_fornecedores				
		,origem.nr_telefone_fornecedores				
		,origem.nr_faxFornecedor_fornecedores			
		,origem.nr_inscricaoEstadual_fornecedores		
		,origem.nr_inscricaoMunicipal_fornecedores		
		,origem.nr_contatoEmpresa_fornecedores			
		,origem.cd_condicaoPagamento_fornecedores		
		,origem.nr_maiorAtrasoEmDias_fornecedores		
		,origem.vl_maiorCompra_fornecedores			
		,origem.nr_mediaAtrasoEmDias_fornecedores		
		,origem.vl_maiorSaldoCredor_fornecedores		
		,origem.nt_totalCompras_fornecedores			
		,origem.dt_primeiraCompra_fornecedores			
		,origem.dt_ultimaCompra_fornecedores			
		,origem.cd_paisFornecedor_fornecedores			
		,origem.fl_fornecedorHomologado_fornecedores	
		,origem.cd_atividadeEconomica_fornecedores		
		,origem.cd_recno_SA2							
		,origem.dt_criacao								
		,origem.dt_alteracao										
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas


GO
/****** Object:  StoredProcedure [dbo].[sp_tb_dim_funcionarios]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_tb_dim_funcionarios]

as

declare @linhas int;
merge tb_dim_funcionarios as destino

using (

	SELECT
	 sk_destino							= null 
	,cd_filial_funcionarios		= RA_FILIAL
	,nm_funcionario_funcionarios = RA_NOME
	,cd_matricula_funcionarios	= RA_MAT
	,dt_admissao_funcionarios	= CASE RA_ADMISSA WHEN '' THEN null ELSE DATEFROMPARTS(left(RA_ADMISSA,4),right(left(RA_ADMISSA,6),2),right(RA_ADMISSA,2)) END 
	,cd_centroCusto_funcionarios = RA_CC
	,cd_funcao_funcionarios		= RA_CARGO
	,ds_funcao_funcionarios		= RJ_DESC
	,tp_maoObra_funcionarios		= CASE RJ_MAOBRA WHEN 'D' THEN 'Direta' WHEN 'I' THEN 'Indireta' ELSE 'Indireta' END
	,cd_recno_SRA						= RA.R_E_C_N_O_ 
	,dt_criacao							= getdate()
	,dt_alteracao						= getdate()
	,ds_escolaridade_funcionarios = 
			CASE RA_GRINRAI
				WHEN '30' THEN 'PRIMEIRO GRAU (GINASIO) INCOMPLETO'
				WHEN '35' THEN 'PRIMEIRO GRAU (GINASIO) COMPLETO'                       
				WHEN '40' THEN 'SEGUNDO GRAU (COLEGIAL) INCOMPLETO'                     
				WHEN '45' THEN 'SEGUNDO GRAU (COLEGIAL) COMPLETO'                       
				WHEN '50' THEN 'SUPERIOR INCOMPLETO'                                    
				WHEN '55' THEN 'SUPERIOR COMPLETO'                                      
				WHEN '65' THEN 'MESTRADO COMPLETO'                                   
				WHEN '75' THEN 'DOUTORADO COMPLETO'                                     
				WHEN '85' THEN 'POS-GRADUACAO/ESPECIALIZACAO'                          
				WHEN '95' THEN 'POS-DOUTORADO'
				ELSE 'OUTRO'
				END
	,ds_estadoCivil_funcionarios = 
			CASE RA_ESTCIVI 
				WHEN 'S' THEN 'SOLTEIRO(A)'
				WHEN 'C' THEN 'CASADO(A)'
				WHEN 'D' THEN 'DIVORCIADO(A)'
				WHEN 'M' THEN 'UNIAO ESTAVEL'
				WHEN 'O' THEN 'OUTROS'
				WHEN 'Q' THEN 'DESQUITADO(A)'
				WHEN 'V' THEN 'VIUVO(A)'
				ELSE 'OUTRO'
				END
    ,tp_defic_funcionarios =
            CASE RA_TPDEFFI
                WHEN '0' THEN 'Não Portador'
                WHEN '1' THEN 'Física'
                WHEN '2' THEN 'Auditiva'
                WHEN '3' THEN 'Visual'
                WHEN '4' THEN 'Intelectual (Mental)'
                WHEN '5' THEN 'Multipla'
                WHEN '6' THEN 'Reabilitado'
                ELSE 'N/A'
                END
	,ds_faixaEtaria_funcionarios =
			CASE 
				WHEN DATEDIFF(YEAR, CONVERT(date, RA_NASC), CONVERT(date, GETDATE())) < 10 THEN '0-9'
				WHEN DATEDIFF(YEAR, CONVERT(date, RA_NASC), CONVERT(date, GETDATE())) < 20 THEN '10-20'
				WHEN DATEDIFF(YEAR, CONVERT(date, RA_NASC), CONVERT(date, GETDATE())) < 30 THEN '20-30'
				WHEN DATEDIFF(YEAR, CONVERT(date, RA_NASC), CONVERT(date, GETDATE())) < 40 THEN '30-40'
				WHEN DATEDIFF(YEAR, CONVERT(date, RA_NASC), CONVERT(date, GETDATE())) < 50 THEN '40-50'
				WHEN DATEDIFF(YEAR, CONVERT(date, RA_NASC), CONVERT(date, GETDATE())) < 60 THEN '50-60'
				WHEN DATEDIFF(YEAR, CONVERT(date, RA_NASC), CONVERT(date, GETDATE())) < 70 THEN '60-70'
				WHEN DATEDIFF(YEAR, CONVERT(date, RA_NASC), CONVERT(date, GETDATE())) < 80 THEN '70-80'
				WHEN DATEDIFF(YEAR, CONVERT(date, RA_NASC), CONVERT(date, GETDATE())) < 90 THEN '80-90'
				WHEN DATEDIFF(YEAR, CONVERT(date, RA_NASC), CONVERT(date, GETDATE())) < 100 THEN '90-100'
				ELSE '100+'
				END
    ,vl_idade_funcionarios = DATEDIFF(YEAR, CONVERT(date, RA_NASC), CONVERT(date, GETDATE()))
	,vl_salario_funcionarios = RA_SALARIO,
	tp_sexo_funcionario = CASE RA_SEXO WHEN 'F' THEN 'Feminino' WHEN 'M' THEN 'Masculino' Else 'Outro' END,
    CASE RA_RACACOR
                WHEN '1' THEN 'Indigena'
                WHEN '2' THEN 'Branca'
                WHEN '4' THEN 'Negra'
                WHEN '6' THEN 'Amarela'
                WHEN '8' THEN 'Parda'
                WHEN '9' THEN 'Não Informado' END AS tp_raca_funcionario
	,tp_situacao_folha = 
			CASE
				WHEN CONCAT(RA_RESCRAI, RA_SITFOLH) = '31D' THEN 'Transferido'
				WHEN RA_SITFOLH = 'D' THEN 'Demitido'
				WHEN RA_SITFOLH = 'A' THEN 'Afastado'
				WHEN RA_SITFOLH = 'F' THEN 'Ferias'
				WHEN RA_SITFOLH = '' THEN 'Normal'
			ELSE 'Outro'
			END
	,dt_demissao_funcionario = CASE RA_DEMISSA WHEN '' THEN null ELSE DATEFROMPARTS(left(RA_DEMISSA,4),right(left(RA_DEMISSA,6),2),right(RA_DEMISSA,2)) END
	FROM [bi_rip_rawZone_bck].dbo.SRA010 RA
    LEFT OUTER JOIN [bi_rip_rawZone_bck].dbo.SRJ010 RJ
    ON RJ_FUNCAO = RA_CARGO AND RJ.D_E_L_E_T_= ''
	WHERE RA.D_E_L_E_T_ = '' AND RA_MAT <> '000000' AND RA_CATFUNC <> 'A'


) origem on  
(		
	origem.cd_recno_SRA	= destino.cd_recno_SRA
)

WHEN MATCHED THEN
	UPDATE SET 
	 destino.cd_filial_funcionarios		 = origem.cd_filial_funcionarios		
	,destino.nm_funcionario_funcionarios  = origem.nm_funcionario_funcionarios 
	,destino.cd_matricula_funcionarios	 = origem.cd_matricula_funcionarios	
	,destino.dt_admissao_funcionarios	 = origem.dt_admissao_funcionarios	
	,destino.cd_centroCusto_funcionarios  = origem.cd_centroCusto_funcionarios 
	,destino.cd_funcao_funcionarios		 = origem.cd_funcao_funcionarios		
	,destino.ds_funcao_funcionarios		 = origem.ds_funcao_funcionarios		
	,destino.tp_maoObra_funcionarios		 = origem.tp_maoObra_funcionarios		
	,destino.dt_alteracao						 = getdate()
	,destino.ds_escolaridade_funcionarios = origem.ds_escolaridade_funcionarios
	,destino.ds_estadoCivil_funcionarios = origem.ds_estadoCivil_funcionarios
    ,destino.tp_defic_funcionarios       = origem.tp_defic_funcionarios
	,destino.ds_faixaEtaria_funcionarios = origem.ds_faixaEtaria_funcionarios
	,destino.vl_salario_funcionarios = origem.vl_salario_funcionarios
    ,destino.vl_idade_funcionarios  = origem.vl_idade_funcionarios
	,destino.tp_sexo_funcionario = origem.tp_sexo_funcionario
    ,destino.tp_raca_funcionario = origem.tp_raca_funcionario
	,destino.tp_situacao_folha = origem.tp_situacao_folha
	,destino.dt_demissao_funcionario = origem.dt_demissao_funcionario
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		 origem.cd_filial_funcionarios		
		,origem.nm_funcionario_funcionarios 
		,origem.cd_matricula_funcionarios	
		,origem.dt_admissao_funcionarios
		,origem.cd_centroCusto_funcionarios 
		,origem.cd_funcao_funcionarios		
		,origem.ds_funcao_funcionarios		
		,origem.tp_maoObra_funcionarios		
		,origem.cd_recno_SRA						
		,origem.dt_criacao							
		,origem.dt_alteracao
		,origem.ds_escolaridade_funcionarios
		,origem.ds_estadoCivil_funcionarios
        ,origem.tp_defic_funcionarios
		,origem.ds_faixaEtaria_funcionarios
		,origem.vl_salario_funcionarios
        ,origem.vl_idade_funcionarios
		,origem.tp_sexo_funcionario
        ,origem.tp_raca_funcionario
		,origem.tp_situacao_folha
		,origem.dt_demissao_funcionario
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas
GO
/****** Object:  StoredProcedure [dbo].[sp_tb_dim_grupoProdutos]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE proc [dbo].[sp_tb_dim_grupoProdutos]

as

declare @linhas int;
merge tb_dim_grupoProdutos as destino

using (

	select
		 --sk_destino								= null 
		 cd_filial_grupoProdutos				= BM_FILIAL
		,cd_grupo_grupoProdutos					= BM_GRUPO
		,ds_grupo_grupoProdutos					= BM_DESC
		,st_grupo_grupoProdutos					= BM_STATUS
		,cd_grupoRelacionado_grupoProdutos		= BM_GRUREL
		,cd_grupoProdutos_grupoProdutos			= BM_CODGRT
		,cd_familiaRip_grupoProdutos			= BM_ZZFAMRP
		,cd_contaContabilConsumo_grupoProdutos	= BM_ZCONTA1
		,cd_contaContabilDespesa_grupoProdutos	= BM_ZCONTA2
		,tp_produto_grupoProdutos				= BM_ZTIPOB1
		,cd_categoriaOrex_grupoProdutos			= BM_ZCTOREX
		,nr_diasEntrega_grupoProdutos			= BM_ZZDTENT
		,cd_naturezaConsumo_grupoProdutos		= BM_ZNATCON
		,cd_naturezaAplicacao_grupoProdutos		= BM_ZZNATAP
		,cd_recno_SBM							= R_E_C_N_O_ 
		,dt_criacao								= getdate()
		,dt_alteracao							= getdate()
		,fl_bloqueado_grupoProdutos				= BM_MSBLQL
	from [bi_rip_rawZone_bck].dbo.SBM010
	where D_E_L_E_T_ = ''


) origem on  
(		
	origem.cd_recno_SBM = destino.cd_recno_SBM
)

WHEN MATCHED THEN
	UPDATE SET 
	 destino.cd_filial_grupoProdutos				= origem.cd_filial_grupoProdutos				
	,destino.cd_grupo_grupoProdutos					= origem.cd_grupo_grupoProdutos					
	,destino.ds_grupo_grupoProdutos					= origem.ds_grupo_grupoProdutos					
	,destino.st_grupo_grupoProdutos					= origem.st_grupo_grupoProdutos					
	,destino.cd_grupoRelacionado_grupoProdutos		= origem.cd_grupoRelacionado_grupoProdutos		
	,destino.cd_grupoProdutos_grupoProdutos			= origem.cd_grupoProdutos_grupoProdutos			
	,destino.cd_familiaRip_grupoProdutos			= origem.cd_familiaRip_grupoProdutos			
	,destino.cd_contaContabilConsumo_grupoProdutos	= origem.cd_contaContabilConsumo_grupoProdutos	
	,destino.cd_contaContabilDespesa_grupoProdutos	= origem.cd_contaContabilDespesa_grupoProdutos	
	,destino.tp_produto_grupoProdutos				= origem.tp_produto_grupoProdutos				
	,destino.cd_categoriaOrex_grupoProdutos			= origem.cd_categoriaOrex_grupoProdutos			
	,destino.nr_diasEntrega_grupoProdutos			= origem.nr_diasEntrega_grupoProdutos			
	,destino.cd_naturezaConsumo_grupoProdutos		= origem.cd_naturezaConsumo_grupoProdutos		
	,destino.cd_naturezaAplicacao_grupoProdutos		= origem.cd_naturezaAplicacao_grupoProdutos		
	,destino.dt_alteracao							= origem.dt_alteracao	
	,destino.fl_bloqueado_grupoProdutos				= origem.fl_bloqueado_grupoProdutos								

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		 cd_filial_grupoProdutos				
		,cd_grupo_grupoProdutos					
		,ds_grupo_grupoProdutos					
		,st_grupo_grupoProdutos					
		,cd_grupoRelacionado_grupoProdutos		
		,cd_grupoProdutos_grupoProdutos			
		,cd_familiaRip_grupoProdutos			
		,cd_contaContabilConsumo_grupoProdutos	
		,cd_contaContabilDespesa_grupoProdutos	
		,tp_produto_grupoProdutos				
		,cd_categoriaOrex_grupoProdutos			
		,nr_diasEntrega_grupoProdutos			
		,cd_naturezaConsumo_grupoProdutos		
		,cd_naturezaAplicacao_grupoProdutos		
		,cd_recno_SBM							
		,dt_criacao								
		,dt_alteracao
		,fl_bloqueado_grupoProdutos							
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas

GO
/****** Object:  StoredProcedure [dbo].[sp_tb_dim_locaisEstoque]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--exec[dbo].[sp_tb_dim_locaisEstoque]

CREATE proc [dbo].[sp_tb_dim_locaisEstoque]

as

declare @linhas int;
merge tb_dim_locaisEstoque as destino

using (

	select
	--sk_destino									= null 
	 cd_filial_locaisEstoque					= NNR_FILIAL
	,cd_filialArmazem_locaisEstoque				= convert(varchar,NNR_FILIAL)+convert(varchar,NNR_CODIGO)
	,cd_local_locaisEstoque						= NNR_CODIGO
	,ds_local_locaisEstoque						= NNR_DESCRI
	,tp_armazem_locaisEstoque					= NNR_TIPO
	,fl_integracaoPims_locaisEstoque			= NNR_INTP
	,fl_entraCalculo_locaisEstoque				= NNR_MRP
	,fl_verificaSaldoAlternativo_locaisEstoque	= NNR_ARMALT
	,fl_anp45_locaisEstoque						= NNR_ANP45
	,fl_amrmazemVendaDms_locaisEstoque			= NNR_VDADMS
	,fl_armazenagemUnitizada_locaisEstoque		= NNR_AMZUNI
	,cd_recno_NNR								= R_E_C_N_O_ 
	,dt_criacao									= getdate()
	,dt_alteracao								= getdate()
from [bi_rip_rawZone_bck].dbo.NNR010
where D_E_L_E_T_ = ''


) origem on  
(		
	origem.cd_recno_NNR = destino.cd_recno_NNR
)

WHEN MATCHED THEN
	UPDATE SET 
			
	 destino.cd_filial_locaisEstoque					= origem.cd_filial_locaisEstoque
	,destino.cd_filialArmazem_locaisEstoque				= origem.cd_filialArmazem_locaisEstoque					
	,destino.cd_local_locaisEstoque						= origem.cd_local_locaisEstoque						
	,destino.ds_local_locaisEstoque						= origem.ds_local_locaisEstoque						
	,destino.tp_armazem_locaisEstoque					= origem.tp_armazem_locaisEstoque					
	,destino.fl_integracaoPims_locaisEstoque			= origem.fl_integracaoPims_locaisEstoque			
	,destino.fl_entraCalculo_locaisEstoque				= origem.fl_entraCalculo_locaisEstoque				
	,destino.fl_verificaSaldoAlternativo_locaisEstoque	= origem.fl_verificaSaldoAlternativo_locaisEstoque	
	,destino.fl_anp45_locaisEstoque						= origem.fl_anp45_locaisEstoque						
	,destino.fl_amrmazemVendaDms_locaisEstoque			= origem.fl_amrmazemVendaDms_locaisEstoque			
	,destino.fl_armazenagemUnitizada_locaisEstoque		= origem.fl_armazenagemUnitizada_locaisEstoque		
	,destino.dt_alteracao								= origem.dt_alteracao								
														
WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		 origem.cd_filialArmazem_locaisEstoque
		,origem.cd_filial_locaisEstoque					
		,origem.cd_local_locaisEstoque						
		,origem.ds_local_locaisEstoque						
		,origem.tp_armazem_locaisEstoque					
		,origem.fl_integracaoPims_locaisEstoque			
		,origem.fl_entraCalculo_locaisEstoque				
		,origem.fl_verificaSaldoAlternativo_locaisEstoque	
		,origem.fl_anp45_locaisEstoque						
		,origem.fl_amrmazemVendaDms_locaisEstoque			
		,origem.fl_armazenagemUnitizada_locaisEstoque		
		,origem.cd_recno_NNR								
		,origem.dt_criacao									
		,origem.dt_alteracao								
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas
GO
/****** Object:  StoredProcedure [dbo].[sp_tb_dim_produtos]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



---exec [dbo].[sp_tb_dim_produtos]


CREATE proc [dbo].[sp_tb_dim_produtos]

as


declare @linhas int;
merge tb_dim_produtos as destino

using (

	select
		 --sk_destino								= null 
		 cd_filial_produtos						= B1_FILIAL
		,cd_produto_produtos					= B1_COD
		,ds_produto_produtos					= B1_DESC
		,tp_produto_produtos					= B1_TIPO
		,ds_unidadeMedida_produtos				= B1_UM
		,cd_grupo_produtos						= B1_GRUPO
		,vl_aliquoaIcms_produtos				= B1_PICM
		,cd_nomenclaturaExtMercosul_produtos	= B1_POSIPI
		,cd_pontoPedido_produtos				= B1_EMIN
		,dt_ultimoCalculoCusto_produtos			= iif(B1_UCALSTD='',null,DATEFROMPARTS(left(B1_UCALSTD,4),right(left(B1_UCALSTD,6),2),right(B1_UCALSTD,2)))   
		,vl_ultimoPrecoCompra_produtos			= B1_UPRC   
		,dt_ultimaCompra_produtos				= iif(B1_UCOM='',null,DATEFROMPARTS(left(B1_UCOM,4),right(left(B1_UCOM,6),2),right(B1_UCOM,2)))   
		,vl_estoqueSeguranca_produtos			= B1_ESTSEG
		,nr_prazoEntrega_produtos				= B1_PE
		,tp_prazoEntrega_produtos				= B1_TIPE
		,vl_loteEconomico_produtos				= B1_LE
		,vl_loteMinimo_produtos					= B1_LM
		,cd_contaContabilProducao_produtos		= B1_CONTA
		,nr_tolerancia_produtos					= B1_TOLER
		,dt_ultimaRevisao_produtos				= iif(B1_UREV='',null,DATEFROMPARTS(left(B1_UREV,4),right(left(B1_UREV,6),2),right(B1_UREV,2)))  
		,cd_grupoTributacao_produtos			= B1_GRTRIB
		,dt_consumoInicial_produtos				= iif(B1_CONINI='',null,DATEFROMPARTS(left(B1_CONINI,4),right(left(B1_CONINI,6),2),right(B1_CONINI,2)))  
		,cd_fabricante_produtos					= B1_FABRIC
		,cd_produtoPai_produtos					= B1_PRODPAI
		,vl_parcentualCofins_produtos			= B1_PCOFINS
		,vl_parcentualPis_produtos				= B1_PPIS
		,vl_estoqueMaximo_produtos				= B1_EMAX 
		,vl_ultimaCompra_produtos				= B1_UVLRC
		,cd_grupoContabilCusteio_produtos		= B1_GCCUSTO
		,tp_bloqueioTela_produtos				= B1_MSBLQL
		,cd_situacaoTributaria_produtos			= B1_SITTRIB
		,cd_anterior_produtos					= B1_CODANT
		,fl_devolucaoObrigatoria_produtos		= B1_ZZDEVOB
		,dt_alteracaoSce_produtos				= iif(B1_ZSCEALT='',null,DATEFROMPARTS(left(B1_ZSCEALT,4),right(left(B1_ZSCEALT,6),2),right(B1_ZSCEALT,2)))  
		,ds_referenciaFrabricante_produtos		= B1_ZREFFAB
		,nr_diasEntrega_produtos				= B1_ZZDTENT
		,ds_completaProduto_produtos			= B5_ECDESCR
		,nm_cientifico_produtos					= B5_CEME
		,cd_recno_SB5							= isnull(sb5.R_E_C_N_O_ ,'')
		,cd_recno_SB1							= sb1.R_E_C_N_O_ 
		,dt_criacao								= getdate()
		,dt_alteracao							= getdate()
	from [bi_rip_rawZone_bck].dbo.SB1010 as sb1
	left join [bi_rip_rawZone_bck].dbo.SB5010 sb5
	on B5_COD = B1_COD and sb5.B5_FILIAL = sb1.B1_FILIAL  and sb5.D_E_L_E_T_ = ''
	where sb1.D_E_L_E_T_ = '' 


) origem on  
(		
	origem.cd_recno_SB5 = destino.cd_recno_SB5 and 
	origem.cd_recno_SB1 = destino.cd_recno_SB1
)

WHEN MATCHED THEN
	UPDATE SET 
	
	 destino.cd_filial_produtos						= origem.cd_filial_produtos						
	,destino.cd_produto_produtos					= origem.cd_produto_produtos					
	,destino.ds_produto_produtos					= origem.ds_produto_produtos					
	,destino.tp_produto_produtos					= origem.tp_produto_produtos					
	,destino.ds_unidadeMedida_produtos				= origem.ds_unidadeMedida_produtos				
	,destino.cd_grupo_produtos						= origem.cd_grupo_produtos						
	,destino.vl_aliquoaIcms_produtos				= origem.vl_aliquoaIcms_produtos				
	,destino.cd_nomenclaturaExtMercosul_produtos	= origem.cd_nomenclaturaExtMercosul_produtos	
	,destino.cd_pontoPedido_produtos				= origem.cd_pontoPedido_produtos				
	,destino.dt_ultimoCalculoCusto_produtos			= origem.dt_ultimoCalculoCusto_produtos			
	,destino.vl_ultimoPrecoCompra_produtos			= origem.vl_ultimoPrecoCompra_produtos			
	,destino.dt_ultimaCompra_produtos				= origem.dt_ultimaCompra_produtos				
	,destino.vl_estoqueSeguranca_produtos			= origem.vl_estoqueSeguranca_produtos			
	,destino.nr_prazoEntrega_produtos				= origem.nr_prazoEntrega_produtos				
	,destino.tp_prazoEntrega_produtos				= origem.tp_prazoEntrega_produtos				
	,destino.vl_loteEconomico_produtos				= origem.vl_loteEconomico_produtos				
	,destino.vl_loteMinimo_produtos					= origem.vl_loteMinimo_produtos					
	,destino.cd_contaContabilProducao_produtos		= origem.cd_contaContabilProducao_produtos		
	,destino.nr_tolerancia_produtos					= origem.nr_tolerancia_produtos					
	,destino.dt_ultimaRevisao_produtos				= origem.dt_ultimaRevisao_produtos				
	,destino.cd_grupoTributacao_produtos			= origem.cd_grupoTributacao_produtos			
	,destino.dt_consumoInicial_produtos				= origem.dt_consumoInicial_produtos				
	,destino.cd_fabricante_produtos					= origem.cd_fabricante_produtos					
	,destino.cd_produtoPai_produtos					= origem.cd_produtoPai_produtos					
	,destino.vl_parcentualCofins_produtos			= origem.vl_parcentualCofins_produtos			
	,destino.vl_parcentualPis_produtos				= origem.vl_parcentualPis_produtos				
	,destino.vl_estoqueMaximo_produtos				= origem.vl_estoqueMaximo_produtos				
	,destino.vl_ultimaCompra_produtos				= origem.vl_ultimaCompra_produtos				
	,destino.cd_grupoContabilCusteio_produtos		= origem.cd_grupoContabilCusteio_produtos		
	,destino.tp_bloqueioTela_produtos				= origem.tp_bloqueioTela_produtos				
	,destino.cd_situacaoTributaria_produtos			= origem.cd_situacaoTributaria_produtos			
	,destino.cd_anterior_produtos					= origem.cd_anterior_produtos					
	,destino.fl_devolucaoObrigatoria_produtos		= origem.fl_devolucaoObrigatoria_produtos		
	,destino.dt_alteracaoSce_produtos				= origem.dt_alteracaoSce_produtos				
	,destino.ds_referenciaFrabricante_produtos		= origem.ds_referenciaFrabricante_produtos		
	,destino.nr_diasEntrega_produtos				= origem.nr_diasEntrega_produtos				
	,destino.ds_completaProduto_produtos			= origem.ds_completaProduto_produtos			
	,destino.nm_cientifico_produtos					= origem.nm_cientifico_produtos					
	,destino.dt_alteracao							= origem.dt_alteracao								
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		 origem.cd_filial_produtos					
		,origem.cd_produto_produtos				
		,origem.ds_produto_produtos				
		,origem.tp_produto_produtos				
		,origem.ds_unidadeMedida_produtos			
		,origem.cd_grupo_produtos					
		,origem.vl_aliquoaIcms_produtos			
		,origem.cd_nomenclaturaExtMercosul_produtos
		,origem.cd_pontoPedido_produtos			
		,origem.dt_ultimoCalculoCusto_produtos		
		,origem.vl_ultimoPrecoCompra_produtos		
		,origem.dt_ultimaCompra_produtos			
		,origem.vl_estoqueSeguranca_produtos		
		,origem.nr_prazoEntrega_produtos			
		,origem.tp_prazoEntrega_produtos			
		,origem.vl_loteEconomico_produtos			
		,origem.vl_loteMinimo_produtos				
		,origem.cd_contaContabilProducao_produtos	
		,origem.nr_tolerancia_produtos				
		,origem.dt_ultimaRevisao_produtos			
		,origem.cd_grupoTributacao_produtos		
		,origem.dt_consumoInicial_produtos			
		,origem.cd_fabricante_produtos				
		,origem.cd_produtoPai_produtos				
		,origem.vl_parcentualCofins_produtos		
		,origem.vl_parcentualPis_produtos			
		,origem.vl_estoqueMaximo_produtos			
		,origem.vl_ultimaCompra_produtos			
		,origem.cd_grupoContabilCusteio_produtos	
		,origem.tp_bloqueioTela_produtos			
		,origem.cd_situacaoTributaria_produtos		
		,origem.cd_anterior_produtos				
		,origem.fl_devolucaoObrigatoria_produtos	
		,origem.dt_alteracaoSce_produtos			
		,origem.ds_referenciaFrabricante_produtos	
		,origem.nr_diasEntrega_produtos			
		,origem.ds_completaProduto_produtos		
		,origem.nm_cientifico_produtos				
		,origem.cd_recno_SB5						
		,origem.cd_recno_SB1						
		,origem.dt_criacao							
		,origem.dt_alteracao									
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas
GO
/****** Object:  StoredProcedure [dbo].[sp_tb_dim_statusPedidosEmitidos]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[sp_tb_dim_statusPedidosEmitidos]

as


declare @linhas int;
merge tb_dim_statusPedidosEmitidos as destino

using (

	select
		--sk_destino												= null 
		 ZX5_TABELA as cd_tabela_statusPedidosEmitidos
		,ZX5_CHAVE as st_pedidoEmitido_statusPedidosEmitidos
		,ZX5_CONTEU as ds_pedidoEmitido_statusPedidosEmitidos
		,cd_recno_ZX5 = R_E_C_N_O_
		,dt_criacao												= getdate()
		,dt_alteracao											= getdate()
	from bi_rip_rawZone_bck.[dbo].[ZX5010]
	where D_E_L_E_T_ = '' and ZX5_TABELA = '6'


) origem on  
(		
	origem.cd_recno_ZX5 = destino.cd_recno_ZX5
)

WHEN MATCHED THEN
	UPDATE SET 
	 destino.cd_tabela_statusPedidosEmitidos						= origem.cd_tabela_statusPedidosEmitidos						
	,destino.st_pedidoEmitido_statusPedidosEmitidos					= origem.st_pedidoEmitido_statusPedidosEmitidos
	,destino.ds_pedidoEmitido_statusPedidosEmitidos					= origem.ds_pedidoEmitido_statusPedidosEmitidos
	,destino.dt_alteracao											= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		 origem.cd_tabela_statusPedidosEmitidos							
		 ,origem.st_pedidoEmitido_statusPedidosEmitidos								
		 ,origem.ds_pedidoEmitido_statusPedidosEmitidos
		 ,origem.cd_recno_ZX5
		 ,origem.dt_criacao												
		 ,origem.dt_alteracao											
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas
GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_ArqNaoProcessadosRPA]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_tb_fat_ArqNaoProcessadosRPA]

as 

declare @linhas int;

merge [dbo].[tb_fat_ArqNaoProcessadosRPA] as destino

using (

	select
		[cd_ID]							= ID
      ,[dt_Data_do_Email]				= [Data do Email] 
      ,[ds_Origem_do_Email]				= [Origem do Email] 
      ,[dt_Data_do_processamento]		= [Data do Processamento] 
      ,[ds_Status]						= [Status] 
      ,[ds_Mensagem_de_Erro]			= [Mensagem de Erro] 
      ,[dt_criacao]						= getdate()
      ,[dt_alteracao]					= getdate()
	
	from [bi_rip_rawZone_bck].dbo.[Arquivos Nao Processados] as ArqNaoProcessadosRPA


) origem on  
(		
	origem.cd_ID = destino.cd_ID
)

WHEN MATCHED THEN
	UPDATE SET 
	
	 destino.cd_ID									= origem.cd_ID				
	,destino.dt_Data_do_Email						= origem.dt_Data_do_Email				
	,destino.ds_Origem_do_Email						= origem.ds_Origem_do_Email
	,destino.dt_Data_do_processamento				= origem.dt_Data_do_processamento
	,destino.ds_Status								= origem.ds_Status
	,destino.ds_Mensagem_de_Erro					= origem.ds_Mensagem_de_Erro
	,destino.dt_alteracao							= getdate()

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
			
			origem.cd_ID				
			,origem.dt_Data_do_Email		
			,origem.ds_Origem_do_Email
			,origem.dt_Data_do_processamento
			,origem.ds_Status
			,origem.ds_Mensagem_de_Erro
			,origem.dt_criacao							
			,origem.dt_alteracao
		)			

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas


GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_ArqProcessadosRPA]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_tb_fat_ArqProcessadosRPA]

as 

declare @linhas int;

merge [dbo].[tb_fat_ArqProcessadosRPA] as destino

using (


	select
		[cd_ID]							= ID
      ,[dt_Data_do_Email]				= [Data do Email] 
      ,[ds_Origem_do_Email]				= [Origem do Email] 
      ,[dt_Data_do_processamento]		= [Data do Processamento] 
      ,[ds_Status]						= [Status] 
	  ,[ds_Arquivo_PDF]					= [Arquivo PDF]
	  ,[ds_CPF]							= [CPF]	
	  ,[ds_Funcionario]					= [Funcionario]
      ,[dt_criacao]						= getdate()
      ,[dt_alteracao]					= getdate()
	
	from [bi_rip_rawZone_bck].dbo.[Arquivos Processados] as ArqProcessadosRPA


) origem on  
(		
	origem.cd_ID = destino.cd_ID
)

WHEN MATCHED THEN
	UPDATE SET 
	
	 destino.cd_ID									= origem.cd_ID				
	,destino.dt_Data_do_Email						= origem.dt_Data_do_Email				
	,destino.ds_Origem_do_Email						= origem.ds_Origem_do_Email
	,destino.dt_Data_do_processamento				= origem.dt_Data_do_processamento
	,destino.ds_Status								= origem.ds_Status
	,destino.ds_Arquivo_PDF							= origem.ds_Arquivo_PDF
	,destino.ds_CPF									= origem.ds_CPF
	,destino.ds_Funcionario							= origem.ds_Funcionario
	,destino.dt_alteracao							= getdate()

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
			
			origem.cd_ID				
			,origem.dt_Data_do_Email		
			,origem.ds_Origem_do_Email
			,origem.dt_Data_do_processamento
			,origem.ds_Status
			,origem.ds_Arquivo_PDF
			,origem.ds_CPF
			,origem.ds_Funcionario
			,origem.dt_criacao							
			,origem.dt_alteracao
		)			

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas



GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_atestados]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_tb_fat_atestados]

as

declare @linhas int;
merge tb_fat_atestados as destino

using (

	SELECT
	sk_destino = null,
	cd_filial = TNY_FILIAL,
	cd_fichaFuncionario = TNY_NUMFIC,
	dt_dataInicio_afastamento = TNY_DTINIC,
	hr_horaInicio_afastamento = TNY_HRINIC,
	dt_dataFim_afastamento = TNY_DTFIM,
	hr_horaFim_afastamento = TNY_HRFIM,
	cd_grupoCID = TNY_GRPCID,
	cd_CID = TNY_CID,
	cd_emitenteAtestado = TNY_EMITEN,
	tp_afastamento = TNY_TIPAFA,
	cd_afastamento = TNY_CODAFA,
	tp_atestado = CASE TNY_TIPATE WHEN 'A' THEN 'Autorizacao de Saida' WHEN 'I' THEN 'Indireto' WHEN 'D' THEN 'Direto' ELSE 'Outro' END,
	cd_atestado = TNY_NATEST,
	cd_abono = TNY_CODABO,
	vl_qtdeDias = TNY_QTDIAS,
	tp_medicoEmitente = TNY_INDMED,
	cd_acidenteTrabalho = TNY_ACIDEN,
	cd_recno_TNY = R_E_C_N_O_,
	dt_criacao = getdate(),
	dt_alteracao = getdate()

	FROM [bi_rip_rawZone_bck].dbo.TNY010
	WHERE D_E_L_E_T_ = ''


) origem on  
(		
	origem.cd_recno_TNY	= destino.cd_recno_TNY
)

WHEN MATCHED THEN
	UPDATE SET 
	destino.cd_filial = origem.cd_filial,
	destino.cd_fichaFuncionario = origem.cd_fichaFuncionario,
	destino.dt_dataInicio_afastamento = origem.dt_dataInicio_afastamento,
	destino.hr_horaInicio_afastamento = origem.hr_horaInicio_afastamento,
	destino.dt_dataFim_afastamento = origem.dt_dataFim_afastamento,
	destino.hr_horaFim_afastamento = origem.hr_horaFim_afastamento,
	destino.cd_grupoCID = origem.cd_grupoCID,
	destino.cd_CID = origem.cd_CID,
	destino.cd_emitenteAtestado = origem.cd_emitenteAtestado,
	destino.tp_afastamento = origem.tp_afastamento,
	destino.cd_afastamento = origem.cd_afastamento,
	destino.tp_atestado = origem.tp_atestado,
	destino.cd_atestado = origem.cd_atestado,
	destino.cd_abono = origem.cd_abono,
	destino.vl_qtdeDias = origem.vl_qtdeDias,
	destino.tp_medicoEmitente = origem.tp_medicoEmitente,
	destino.cd_acidenteTrabalho = origem.cd_acidenteTrabalho,
	destino.cd_recno_TNY = origem.cd_recno_TNY,
	destino.dt_alteracao = getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
	origem.cd_filial,
	origem.cd_fichaFuncionario,
	origem.dt_dataInicio_afastamento,
	origem.hr_horaInicio_afastamento,
	origem.dt_dataFim_afastamento,
	origem.hr_horaFim_afastamento,
	origem.cd_grupoCID,
	origem.cd_CID,
	origem.cd_emitenteAtestado,
	origem.tp_afastamento,
	origem.cd_afastamento,
	origem.tp_atestado,
	origem.cd_atestado,
	origem.cd_abono,
	origem.vl_qtdeDias,
	origem.tp_medicoEmitente,
	origem.cd_acidenteTrabalho,
	origem.cd_recno_TNY,
	origem.dt_criacao,							
	origem.dt_alteracao																
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas
GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_docMontagemVolume]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_tb_fat_docMontagemVolume]

as

declare @linhas int;
merge tb_fat_docMontagemVolume as destino

using (

select
	cd_filial_docMontagemVolume				= ZNI_FILIAL
	,cd_centroCusto_docMontagemVolume		= ZNI_CC
	,cd_endereco_docMontagemVolume			= ZNI_LOCVOL
	,cd_carga_docMontagemVolume				= ZNI_CODVOL
	,cd_montagem_docMontagemVolume			= ZNI_CODMNT
	,dt_montagem_docMontagemVolume			= ZNI_EMISSA
	,tp_status_docMontagemVolume				= ZNI_STATUS
	,cd_ordemExpedicao_docMontagemVolume		= ZNI_ORDEXP
	,cd_filialDestino_docMontagemVolume		= ZNI_FILDES
	,cd_recno_ZNI							= R_E_C_N_O_
	,dt_criacao								= getdate()
	,dt_alteracao							= getdate()
from [bi_rip_rawZone_bck].dbo.ZNI010
where D_E_L_E_T_ = ''


) origem on  
(		
	origem.cd_recno_ZNI = destino.cd_recno_ZNI
)

WHEN MATCHED THEN
	UPDATE SET 
	destino.cd_filial_docMontagemVolume			= origem.cd_filial_docMontagemVolume		
	,destino.cd_centroCusto_docMontagemVolume		= origem.cd_centroCusto_docMontagemVolume	
	,destino.cd_endereco_docMontagemVolume			= origem.cd_endereco_docMontagemVolume		
	,destino.cd_carga_docMontagemVolume				= origem.cd_carga_docMontagemVolume			
	,destino.tp_status_docMontagemVolume			= origem.tp_status_docMontagemVolume		
	,destino.cd_montagem_docMontagemVolume			= origem.cd_montagem_docMontagemVolume		
	,destino.dt_montagem_docMontagemVolume			= origem.dt_montagem_docMontagemVolume		
	,destino.cd_ordemExpedicao_docMontagemVolume	= origem.cd_ordemExpedicao_docMontagemVolume
	,destino.cd_filialDestino_docMontagemVolume		= origem.cd_filialDestino_docMontagemVolume	
	,destino.dt_alteracao							= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		origem.cd_filial_docMontagemVolume
		,origem.cd_centroCusto_docMontagemVolume
		,origem.cd_endereco_docMontagemVolume
		,origem.cd_carga_docMontagemVolume
		,origem.cd_montagem_docMontagemVolume
		,origem.dt_montagem_docMontagemVolume
		,origem.tp_status_docMontagemVolume
		,origem.cd_ordemExpedicao_docMontagemVolume
		,origem.cd_filialDestino_docMontagemVolume
		,origem.cd_recno_ZNI
		,origem.dt_criacao
		,origem.dt_alteracao								
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas


GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_ErrosRPA]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_tb_fat_ErrosRPA]

as 

declare @linhas int;

merge [dbo].[tb_fat_ErrosRPA] as destino

using (

	select

		[cd_ID]						= ID
      ,[ds_Arquivos_do_Email]		=  [Arquivos do Email]
      ,[dt_Data_do_Erro]			= [Data do Erro]
      ,[ds_Mensagem_do_Erro]		= [Mensagem do Erro]
      ,[dt_Data_do_Email]			= [Data do Email]
      ,[dt_criacao]					= getdate()
      ,[dt_alteracao]				= getdate()
	
	from [bi_rip_rawZone_bck].dbo.Erros as ErrosRPA


) origem on  
(		
	origem.cd_ID = destino.cd_ID
)

WHEN MATCHED THEN
	UPDATE SET 
	
	 destino.cd_ID									= origem.cd_ID				
	,destino.ds_Arquivos_do_Email					= origem.ds_Arquivos_do_Email					
	,destino.dt_Data_do_Erro						= origem.dt_Data_do_Erro
	,destino.ds_Mensagem_do_Erro					= origem.ds_Mensagem_do_Erro		
	,destino.dt_Data_do_Email						= origem.dt_Data_do_Email
	,destino.dt_alteracao							= getdate()

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
			
			origem.cd_ID				
			,origem.ds_Arquivos_do_Email
			,origem.dt_Data_do_Erro
			,origem.ds_Mensagem_do_Erro
			,origem.dt_Data_do_Email
			,origem.dt_criacao							
			,origem.dt_alteracao
		)			

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas


GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_estoque]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE proc [dbo].[sp_tb_fat_estoque]

as 

declare @linhas int;

merge [dbo].[tb_fat_estoque] as destino

using (

	select
	-- sk_destino							= null
	 cc_estoqueXestoqueEnderecos			= B2_FILIAL+'|'+B2_LOCAL+'|'+B2_COD
	,cd_filial_estoque						= B2_FILIAL
	,cd_produto_estoque						= B2_COD
	,cd_armazem_estoque						= B2_LOCAL
	,qt_saldoFimMes_estoque					= B2_QFIM
	,qt_saldoAtual_estoque					= B2_QATU
	,vl_saldoAtual_estoque					= B2_VATU1
	,vl_custoUnitario_estoque				= B2_CM1
	,qt_empenhada_estoque					= B2_QEMP
	,dt_ultimaSaida_estoque					= B2_USAI
	,qt_reservada_estoque					= B2_RESERVA
	,qt_pedidoVendas_estoque				= B2_QPEDVEN
	,qt_naoEnderecada_estoque				= B2_NAOCLAS
	,qt_previstaParaEntrar_estoque			= B2_SALPEDI
	,dt_ultimoInventario_estoque			= B2_DINVENT
	,dt_bloqueioInventarioFinal_estoque		= B2_DINVFIM
	,qt_saldoPoder3_estoque					= B2_QTER
	,qt_aEnderecar_estoque					= B2_QACLASS
	,dt_bloqueioInventarioInicial_estoque	= B2_DTINV
	,qt_saldoFimMes2_estoque				= B2_QFIMFF
	,tp_armazem_estoque						= B2_TIPO
	,vl_custoUnitarioReposicao_estoque		= B2_CMRP1
	,qt_ultimoSaldoEmEstoque_estoque		= B2_QULT
	,dt_ultimoEnvio_estoque					= B2_DULT
	,tp_bloqueio_estoque					= B2_BLOQUEI
	,ds_fechamentoInicial_estoque			= B2_XDTINI
	,ds_fechamentoFinal_estoque				= B2_XDTFIN
	,hr_ultimoMovimento_estoque				= B2_HMOV
	,hr_ultimoEnvio_estoque					= B2_HULT
	,dt_ultimoMovimento_estoque				= B2_DMOV
	,cd_recno_SB2							= sb2.R_E_C_N_O_
	,dt_criacao								= getdate()
	,dt_alteracao							= getdate()
	from [bi_rip_rawZone_bck].dbo.SB2010 as sb2
	where D_E_L_E_T_ = ''

) origem on  
(		
	origem.cd_recno_SB2 = destino.cd_recno_SB2
)

WHEN MATCHED THEN
	UPDATE SET 
	
	 destino.cc_estoqueXestoqueEnderecos				= origem.cc_estoqueXestoqueEnderecos				
	,destino.cd_filial_estoque							= origem.cd_filial_estoque							
	,destino.cd_produto_estoque							= origem.cd_produto_estoque							
	,destino.cd_armazem_estoque							= origem.cd_armazem_estoque							
	,destino.qt_saldoFimMes_estoque						= origem.qt_saldoFimMes_estoque						
	,destino.qt_saldoAtual_estoque						= origem.qt_saldoAtual_estoque						
	,destino.vl_saldoAtual_estoque						= origem.vl_saldoAtual_estoque						
	,destino.vl_custoUnitario_estoque					= origem.vl_custoUnitario_estoque					
	,destino.qt_empenhada_estoque						= origem.qt_empenhada_estoque						
	,destino.dt_ultimaSaida_estoque						= origem.dt_ultimaSaida_estoque						
	,destino.qt_reservada_estoque						= origem.qt_reservada_estoque						
	,destino.qt_pedidoVendas_estoque					= origem.qt_pedidoVendas_estoque					
	,destino.qt_naoEnderecada_estoque					= origem.qt_naoEnderecada_estoque					
	,destino.qt_previstaParaEntrar_estoque				= origem.qt_previstaParaEntrar_estoque				
	,destino.dt_ultimoInventario_estoque				= origem.dt_ultimoInventario_estoque				
	,destino.dt_bloqueioInventarioFinal_estoque			= origem.dt_bloqueioInventarioFinal_estoque			
	,destino.qt_saldoPoder3_estoque						= origem.qt_saldoPoder3_estoque						
	,destino.qt_aEnderecar_estoque						= origem.qt_aEnderecar_estoque						
	,destino.dt_bloqueioInventarioInicial_estoque		= origem.dt_bloqueioInventarioInicial_estoque		
	,destino.qt_saldoFimMes2_estoque					= origem.qt_saldoFimMes2_estoque					
	,destino.tp_armazem_estoque							= origem.tp_armazem_estoque							
	,destino.vl_custoUnitarioReposicao_estoque			= origem.vl_custoUnitarioReposicao_estoque			
	,destino.qt_ultimoSaldoEmEstoque_estoque			= origem.qt_ultimoSaldoEmEstoque_estoque			
	,destino.dt_ultimoEnvio_estoque						= origem.dt_ultimoEnvio_estoque						
	,destino.tp_bloqueio_estoque						= origem.tp_bloqueio_estoque						
	,destino.ds_fechamentoInicial_estoque				= origem.ds_fechamentoInicial_estoque				
	,destino.ds_fechamentoFinal_estoque					= origem.ds_fechamentoFinal_estoque					
	,destino.hr_ultimoMovimento_estoque					= origem.hr_ultimoMovimento_estoque					
	,destino.hr_ultimoEnvio_estoque						= origem.hr_ultimoEnvio_estoque						
	,destino.dt_ultimoMovimento_estoque					= origem.dt_ultimoMovimento_estoque						
	,destino.dt_alteracao								= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
			 origem.cc_estoqueXestoqueEnderecos			
			,origem.cd_filial_estoque						
			,origem.cd_produto_estoque						
			,origem.cd_armazem_estoque						
			,origem.qt_saldoFimMes_estoque					
			,origem.qt_saldoAtual_estoque					
			,origem.vl_saldoAtual_estoque					
			,origem.vl_custoUnitario_estoque				
			,origem.qt_empenhada_estoque					
			,origem.dt_ultimaSaida_estoque					
			,origem.qt_reservada_estoque					
			,origem.qt_pedidoVendas_estoque				
			,origem.qt_naoEnderecada_estoque				
			,origem.qt_previstaParaEntrar_estoque			
			,origem.dt_ultimoInventario_estoque			
			,origem.dt_bloqueioInventarioFinal_estoque		
			,origem.qt_saldoPoder3_estoque					
			,origem.qt_aEnderecar_estoque					
			,origem.dt_bloqueioInventarioInicial_estoque	
			,origem.qt_saldoFimMes2_estoque				
			,origem.tp_armazem_estoque						
			,origem.vl_custoUnitarioReposicao_estoque		
			,origem.qt_ultimoSaldoEmEstoque_estoque		
			,origem.dt_ultimoEnvio_estoque					
			,origem.tp_bloqueio_estoque					
			,origem.ds_fechamentoInicial_estoque			
			,origem.ds_fechamentoFinal_estoque				
			,origem.hr_ultimoMovimento_estoque				
			,origem.hr_ultimoEnvio_estoque					
			,origem.dt_ultimoMovimento_estoque				
			,origem.cd_recno_SB2							
			,origem.dt_criacao								
			,origem.dt_alteracao										
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas
GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_estoqueEndereco]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[sp_tb_fat_estoqueEndereco]

as

declare @linhas int;

merge [dbo].[tb_fat_estoqueEndereco] as destino

using (

	select 
	--sk_destino							= null
	 cc_estoqueXestoqueEnderecos			= BF_FILIAL+'|'+BF_LOCAL+'|'+BF_PRODUTO
	,cd_filial_estoqueEnderecos				= BF_FILIAL
	,cd_produto_estoqueEnderecos			= BF_PRODUTO
	,cd_armazem_estoqueEnderecos			= BF_LOCAL
	,cd_endereco_estoqueEnderecos			= BF_LOCALIZ
	,qt_endereco_estoqueEnderecos			= BF_QUANT
	,qt_empenhoEndereco_estoqueEnderecos	= BF_EMPENHO
	,qt_empenhadaPrevista_estoqueEnderecos	= BF_QEMPPRE
	,dt_ultimoInventario_estoqueEnderecos	= BF_DINVENT
	,cd_recno_SBF							= R_E_C_N_O_
	,dt_criacao								= getdate()
	,dt_alteracao							= getdate()

	from [bi_rip_rawZone_bck].dbo.SBF010 as sbf
	where D_E_L_E_T_ = ''
	
) origem on  
(		
	origem.cd_recno_SBF = destino.cd_recno_SBF
)

WHEN MATCHED THEN
	UPDATE SET 
	 destino.cc_estoqueXestoqueEnderecos				= origem.cc_estoqueXestoqueEnderecos			
	,destino.cd_filial_estoqueEnderecos					= origem.cd_filial_estoqueEnderecos				
	,destino.cd_produto_estoqueEnderecos				= origem.cd_produto_estoqueEnderecos			
	,destino.cd_armazem_estoqueEnderecos				= origem.cd_armazem_estoqueEnderecos			
	,destino.cd_endereco_estoqueEnderecos				= origem.cd_endereco_estoqueEnderecos			
	,destino.qt_endereco_estoqueEnderecos				= origem.qt_endereco_estoqueEnderecos			
	,destino.qt_empenhoEndereco_estoqueEnderecos		= origem.qt_empenhoEndereco_estoqueEnderecos	
	,destino.qt_empenhadaPrevista_estoqueEnderecos		= origem.qt_empenhadaPrevista_estoqueEnderecos	
	,destino.dt_ultimoInventario_estoqueEnderecos		= origem.dt_ultimoInventario_estoqueEnderecos		
	,destino.dt_alteracao								= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		 origem.cc_estoqueXestoqueEnderecos			
		,origem.cd_filial_estoqueEnderecos				
		,origem.cd_produto_estoqueEnderecos			
		,origem.cd_armazem_estoqueEnderecos			
		,origem.cd_endereco_estoqueEnderecos			
		,origem.qt_endereco_estoqueEnderecos			
		,origem.qt_empenhoEndereco_estoqueEnderecos	
		,origem.qt_empenhadaPrevista_estoqueEnderecos	
		,origem.dt_ultimoInventario_estoqueEnderecos	
		,origem.cd_recno_SBF							
		,origem.dt_criacao								
		,origem.dt_alteracao										
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas
GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_expedicaoVolumes]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_tb_fat_expedicaoVolumes]

as

declare @linhas int;
merge tb_fat_expedicaoVolumes as destino

using (

select
	cd_filial_expedicaoVolumes 				= ZNM_FILIAL
	,cd_ordem_expedicaoVolumes 				= ZNM_ORDEXP
	,dt_emissao_expedicaoVolumes 			= ZNM_EMISSA
	,cd_centroCusto_expedicaoVolumes		= ZNM_CCUSTO
	,cd_filialDestino_expedicaoVolumes 	= ZNM_FILDES
	,tp_documento_expedicaoVolumes 		= ZNM_TIPDOC
	,nm_usuarioCriacao_expedicaoVolumes 	= ZNM_USRGER
	,cd_documento_expedicaoVolumes 		= ZNM_NUMDOC
	,cd_pedidoRemessa_expedicaoVolumes	= ZNM_PEDREM
	,cd_transp_expedicaoVolumes 			= ZNM_TRANSP
	,[cd_recno_ZNM]							= R_E_C_N_O_
	,dt_criacao								= getdate()
	,dt_alteracao							= getdate()
from [bi_rip_rawZone_bck].dbo.ZNM010
where D_E_L_E_T_ = ''


) origem on  
(		
	origem.cd_recno_ZNM = destino.cd_recno_ZNM
)


WHEN MATCHED THEN
	UPDATE SET 
    destino.cd_filial_expedicaoVolumes 			= origem.cd_filial_expedicaoVolumes 				
    ,destino.cd_ordem_expedicaoVolumes 				= origem.cd_ordem_expedicaoVolumes 				
    ,destino.dt_emissao_expedicaoVolumes 			= origem.dt_emissao_expedicaoVolumes 			
    ,destino.cd_centroCusto_expedicaoVolumes 	= origem.cd_centroCusto_expedicaoVolumes 		
    ,destino.cd_filialDestino_expedicaoVolumes 	= origem.cd_filialDestino_expedicaoVolumes 	
    ,destino.tp_documento_expedicaoVolumes 		= origem.tp_documento_expedicaoVolumes		
    ,destino.nm_usuarioCriacao_expedicaoVolumes 	= origem.nm_usuarioCriacao_expedicaoVolumes 	
    ,destino.cd_documento_expedicaoVolumes 		= origem.cd_documento_expedicaoVolumes 		
    ,destino.cd_pedidoRemessa_expedicaoVolumes	= origem.cd_pedidoRemessa_expedicaoVolumes	
    ,destino.cd_transp_expedicaoVolumes 			= origem.cd_transp_expedicaoVolumes 					
	,destino.dt_alteracao							= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
	    origem.cd_filial_expedicaoVolumes 			
		,origem.cd_ordem_expedicaoVolumes 				
		,origem.dt_emissao_expedicaoVolumes 			
		,origem.cd_centroCusto_expedicaoVolumes	
		,origem.cd_filialDestino_expedicaoVolumes 	
		,origem.tp_documento_expedicaoVolumes 		
		,origem.nm_usuarioCriacao_expedicaoVolumes	
		,origem.cd_documento_expedicaoVolumes		
		,origem.cd_pedidoRemessa_expedicaoVolumes	
		,origem.cd_transp_expedicaoVolumes			
		,origem.[cd_recno_ZNM]
		,origem.dt_criacao
		,origem.dt_alteracao								
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas


GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_GestaoBotsRPA]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_tb_fat_GestaoBotsRPA]

as 

declare @linhas int;

merge [dbo].[tb_fat_GestaoBotsRPA] as destino

using (

	select
		[cd_ID]								= ID
      ,[dt_Data_do_Email]					= [Data do Email] 
      ,[ds_Arquivos_do_Email]				= [Arquivos do Email] 
	  ,[ds_Pasta_de_destino_do_email]		 = [Pasta de destino do email]
      ,[dt_Data_do_processamento]			= [Data de Processamento] 
	  ,[ds_Mover_para_processados]			 = [Mover para processados]
	  ,[ds_Remetente_do_Email]				 = [Remetente do Email]
	  ,[ds_Assunto_do_Email]				= [Assunto do Email]
	  ,[ds_Ocupação]						= [Ocupação]
	  ,[nm_Fluig]							 = [Fluig]
	  ,[dt_criacao]					  	 = getdate()
      ,[dt_alteracao]						 = getdate()
	
	from [bi_rip_rawZone_bck].dbo.[Gestao de Bots] as GestaoBots


	



) origem on  
(		
	origem.cd_ID = destino.cd_ID
)

WHEN MATCHED THEN
	UPDATE SET 
	
				

	 destino.cd_ID									= origem.cd_ID				
	,destino.dt_Data_do_Email						= origem.dt_Data_do_Email				
	,destino.ds_Arquivos_do_Email					= origem.ds_Arquivos_do_Email
	,destino.ds_Pasta_de_destino_do_email			= origem.ds_Pasta_de_destino_do_email
	,destino.dt_Data_do_Processamento				= origem.dt_Data_do_Processamento
	,destino.ds_Mover_para_processados				= origem.ds_Mover_para_processados
	,destino.ds_Remetente_do_Email					= origem.ds_Remetente_do_Email
	,destino.ds_Assunto_do_Email					= origem.ds_Assunto_do_Email		
	,destino.ds_Ocupação							= origem.ds_Ocupação			
	,destino.nm_Fluig								= origem.nm_Fluig
	,destino.dt_alteracao							= getdate()

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
			
			origem.cd_ID				
			,origem.dt_Data_do_Email			
			,origem.ds_Arquivos_do_Email
			,origem.ds_Pasta_de_destino_do_email
			,origem.dt_Data_do_Processamento
			,origem.ds_Mover_para_processados
			,origem.ds_Remetente_do_Email
			,origem.ds_Assunto_do_Email		
			,origem.ds_Ocupação			
			,origem.nm_Fluig
			,origem.dt_criacao							
			,origem.dt_alteracao
		)			

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas


GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_horaextra]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





--DROP PROCEDURE [dbo].[sp_tb_fat_horaextra]
--GO

CREATE proc [dbo].[sp_tb_fat_horaextra]

as 

declare @linhas int;

WITH FILIAIS AS ( SELECT cod_filialStou, RIGHT('000' + cod_filialRIP, 2) AS cod_filialRIP  FROM bi_rip_trustedZone.dbo.tb_dim_depara_stouFilial) -- Adicionando grupo de +

merge [dbo].[tb_fat_horaextra] as destino

using (

	select
	-- sk_destino							= null
	 cd_filial_funcionarios					= (SELECT cod_filialRIP FROM FILIAIS WHERE stou.cod_empresa = FILIAIS.cod_filialStou) -- Fazendo de-para com campo empresa STOU e M0_FILIAL do SYS_COMPANY
	,cd_matricula_funcionarios				= stou.matricula
	,cd_filialMatricula_funcionarios		=concat((SELECT cod_filialRIP FROM FILIAIS WHERE stou.cod_empresa = FILIAIS.cod_filialStou), stou.matricula)
	,dt_pontoEspelho						=stou.[data]
	,ds_horas_normais						= stou.h_normais
	,ds_desconto							= stou.desconto
	,ds_horas_extras_total					= stou.h_extra
	,ds_extra_excessiva						= stou.extra_excessiva
	,ds_extra_normal						= stou.extra_normal
	,ds_total_calculado						= stou.total_calculado

	,qt_horas_normais						= (CAST(PARSENAME(REPLACE(stou.h_normais, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.h_normais, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_desconto							= (CAST(PARSENAME(REPLACE(stou.desconto, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.desconto, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_horas_extras_total					= (CAST(PARSENAME(REPLACE(stou.h_extra, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.h_extra, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_horas_extras_50						= (CAST(PARSENAME(REPLACE(stou.extrap50, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extrap50, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_horas_extras_55						= (CAST(PARSENAME(REPLACE(stou.extrap55, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extrap55, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_horas_extras_60						= (CAST(PARSENAME(REPLACE(stou.extrap60, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extrap60, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_horas_extras_70						= (CAST(PARSENAME(REPLACE(stou.extrap70, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extrap70, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_horas_extras_75						= (CAST(PARSENAME(REPLACE(stou.extrap75, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extrap75, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_horas_extras_80						= (CAST(PARSENAME(REPLACE(stou.extrap80, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extrap80, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_horas_extras_100						= (CAST(PARSENAME(REPLACE(stou.extrap100, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extrap100, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_horas_extras_120						= (CAST(PARSENAME(REPLACE(stou.extrap120, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extrap120, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_horas_extras_150						= (CAST(PARSENAME(REPLACE(stou.extrap150, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extrap150, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_extra_excessiva						= (CAST(PARSENAME(REPLACE(stou.extra_excessiva, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extra_excessiva, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_extra_normal						= (CAST(PARSENAME(REPLACE(stou.extra_normal, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extra_normal, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_total_calculado						= (CAST(PARSENAME(REPLACE(stou.total_calculado, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.total_calculado, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	
	,cd_id_unico_stou						= concat((SELECT cod_filialRIP FROM FILIAIS WHERE stou.empresa = FILIAIS.cod_filialStou), stou.codigo)/*identificador unico stou*/
	,dt_criacao								= getdate()
	,dt_alteracao							= getdate()
	,cd_deptoConta_funcionarios				= stou.depto_conta
	,cd_deptocc_funcionarios				= stou.depto_cc
	from [bi_rip_rawZone_bck].[dbo].[STOU_JSON_DATA_ponto_espelho] as stou


--Regra1: hora extra total
--extra_excessiva+extra_normal=h_extra 

--Regra2: total calculado
--h_extra+h_normais=total_calculado

) origem on  
(		
	origem.cd_id_unico_stou = destino.cd_id_unico_stou
)

WHEN MATCHED THEN
	UPDATE SET 

	 destino.[cd_filial_funcionarios]					= origem.[cd_filial_funcionarios]
	,destino.[cd_matricula_funcionarios]				= origem.[cd_matricula_funcionarios]
	,destino.[cd_filialMatricula_funcionarios]			= origem.[cd_filialMatricula_funcionarios]
	,destino.[dt_pontoEspelho]							= origem.[dt_pontoEspelho]

	,destino.[ds_horas_normais]							= origem.[ds_horas_normais]		 
	,destino.[ds_desconto]								= origem.[ds_desconto]			
	,destino.[ds_horas_extras_total]					= origem.[ds_horas_extras_total]
	,destino.[ds_extra_excessiva]						= origem.[ds_extra_excessiva]	
	,destino.[ds_extra_normal]							= origem.[ds_extra_normal]		
	,destino.[ds_total_calculado]						= origem.[ds_total_calculado]	
														
	,destino.[qt_horas_normais]							= origem.[qt_horas_normais]		
	,destino.[qt_desconto]								= origem.[qt_desconto]			
	,destino.[qt_horas_extras_total]					= origem.[qt_horas_extras_total]
	,destino.qt_horas_extras_50						   = origem.qt_horas_extras_50	
	,destino.qt_horas_extras_55						   = origem.qt_horas_extras_55	
	,destino.qt_horas_extras_60						   = origem.qt_horas_extras_60	
	,destino.qt_horas_extras_70						   = origem.qt_horas_extras_70	
	,destino.qt_horas_extras_75						   = origem.qt_horas_extras_75	
	,destino.qt_horas_extras_80						   = origem.qt_horas_extras_80	
	,destino.qt_horas_extras_100					   = origem.qt_horas_extras_100
	,destino.qt_horas_extras_120					   = origem.qt_horas_extras_120
	,destino.qt_horas_extras_150					   = origem.qt_horas_extras_150
	,destino.[qt_extra_excessiva]						= origem.[qt_extra_excessiva]	
	,destino.[qt_extra_normal]							= origem.[qt_extra_normal]		
	,destino.[qt_total_calculado]						= origem.[qt_total_calculado]	

	,destino.[cd_id_unico_stou]							= origem.[cd_id_unico_stou]
	,destino.[dt_criacao]								= origem.[dt_criacao]
	,destino.dt_alteracao								= getdate()
	,destino.cd_deptoConta_funcionarios					= origem.cd_deptoConta_funcionarios
	,destino.cd_deptocc_funcionarios					= origem.cd_deptocc_funcionarios
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
			 origem.[cd_filial_funcionarios]
			,origem.[cd_matricula_funcionarios]
			,origem.[cd_filialMatricula_funcionarios]
			,origem.[dt_pontoEspelho]
			,origem.[ds_horas_normais]		 
			,origem.[ds_desconto]			
			,origem.[ds_horas_extras_total]
			,origem.[ds_extra_excessiva]	
			,origem.[ds_extra_normal]		
			,origem.[ds_total_calculado]				
			,origem.[qt_horas_normais]		
			,origem.[qt_desconto]			
			,origem.[qt_horas_extras_total]
			,origem.qt_horas_extras_50	
			,origem.qt_horas_extras_55	
			,origem.qt_horas_extras_60	
			,origem.qt_horas_extras_70	
			,origem.qt_horas_extras_75	
			,origem.qt_horas_extras_80	
			,origem.qt_horas_extras_100
			,origem.qt_horas_extras_120
			,origem.qt_horas_extras_150
			,origem.[qt_extra_excessiva]	
			,origem.[qt_extra_normal]		
			,origem.[qt_total_calculado]
			,origem.[cd_id_unico_stou]			
			,origem.dt_criacao								
			,origem.dt_alteracao
			,origem.cd_deptoConta_funcionarios
			,origem.cd_deptocc_funcionarios
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas

GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_horaextra_diario]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






--DROP PROCEDURE [dbo].[sp_tb_fat_horaextra]
--GO

CREATE proc [dbo].[sp_tb_fat_horaextra_diario]

as 

declare @linhas int;

WITH FILIAIS AS ( SELECT cod_filialStou, RIGHT('000' + cod_filialRIP, 2) AS cod_filialRIP  FROM bi_rip_trustedZone.dbo.tb_dim_depara_stouFilial) -- Adicionando grupo de +

merge [dbo].[tb_fat_horaextra] as destino

using (

	select
	-- sk_destino							= null
	 cd_filial_funcionarios					= (SELECT cod_filialRIP FROM FILIAIS WHERE stou.cod_empresa = FILIAIS.cod_filialStou) -- Fazendo de-para com campo empresa STOU e M0_FILIAL do SYS_COMPANY
	,cd_matricula_funcionarios				= stou.matricula
	,cd_filialMatricula_funcionarios		=concat((SELECT cod_filialRIP FROM FILIAIS WHERE stou.cod_empresa = FILIAIS.cod_filialStou), stou.matricula)
	,dt_pontoEspelho						=stou.[data]
	,ds_horas_normais						= stou.h_normais
	,ds_desconto							= stou.desconto
	,ds_horas_extras_total					= stou.h_extra
	,ds_extra_excessiva						= stou.extra_excessiva
	,ds_extra_normal						= stou.extra_normal
	,ds_total_calculado						= stou.total_calculado

	,qt_horas_normais						= (CAST(PARSENAME(REPLACE(stou.h_normais, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.h_normais, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_desconto							= (CAST(PARSENAME(REPLACE(stou.desconto, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.desconto, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_horas_extras_total					= (CAST(PARSENAME(REPLACE(stou.h_extra, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.h_extra, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_horas_extras_50						= (CAST(PARSENAME(REPLACE(stou.extrap50, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extrap50, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_horas_extras_55						= (CAST(PARSENAME(REPLACE(stou.extrap55, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extrap55, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_horas_extras_60						= (CAST(PARSENAME(REPLACE(stou.extrap60, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extrap60, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_horas_extras_70						= (CAST(PARSENAME(REPLACE(stou.extrap70, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extrap70, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_horas_extras_75						= (CAST(PARSENAME(REPLACE(stou.extrap75, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extrap75, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_horas_extras_80						= (CAST(PARSENAME(REPLACE(stou.extrap80, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extrap80, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_horas_extras_100						= (CAST(PARSENAME(REPLACE(stou.extrap100, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extrap100, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_horas_extras_120						= (CAST(PARSENAME(REPLACE(stou.extrap120, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extrap120, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_horas_extras_150						= (CAST(PARSENAME(REPLACE(stou.extrap150, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extrap150, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_extra_excessiva						= (CAST(PARSENAME(REPLACE(stou.extra_excessiva, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extra_excessiva, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_extra_normal						= (CAST(PARSENAME(REPLACE(stou.extra_normal, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.extra_normal, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	,qt_total_calculado						= (CAST(PARSENAME(REPLACE(stou.total_calculado, ':', '.'), 2) AS DECIMAL(18, 2)) + CAST(PARSENAME(REPLACE(stou.total_calculado, ':', '.'), 1) AS DECIMAL(18, 2)) / 60.0 )
	
	,cd_id_unico_stou						= concat((SELECT cod_filialRIP FROM FILIAIS WHERE stou.empresa = FILIAIS.cod_filialStou), stou.codigo)/*identificador unico stou*/
	,dt_criacao								= getdate()
	,dt_alteracao							= getdate()
	,cd_deptoConta_funcionarios				= stou.depto_conta
	,cd_deptocc_funcionarios				= stou.depto_cc
	from [bi_rip_rawZone_bck].[dbo].[STOU_TEMP_DATA] as stou


--Regra1: hora extra total
--extra_excessiva+extra_normal=h_extra 

--Regra2: total calculado
--h_extra+h_normais=total_calculado

) origem on  
(		
	origem.cd_id_unico_stou = destino.cd_id_unico_stou
)

WHEN MATCHED THEN
	UPDATE SET 

	 destino.[cd_filial_funcionarios]					= origem.[cd_filial_funcionarios]
	,destino.[cd_matricula_funcionarios]				= origem.[cd_matricula_funcionarios]
	,destino.[cd_filialMatricula_funcionarios]			= origem.[cd_filialMatricula_funcionarios]
	,destino.[dt_pontoEspelho]							= origem.[dt_pontoEspelho]

	,destino.[ds_horas_normais]							= origem.[ds_horas_normais]		 
	,destino.[ds_desconto]								= origem.[ds_desconto]			
	,destino.[ds_horas_extras_total]					= origem.[ds_horas_extras_total]
	,destino.[ds_extra_excessiva]						= origem.[ds_extra_excessiva]	
	,destino.[ds_extra_normal]							= origem.[ds_extra_normal]		
	,destino.[ds_total_calculado]						= origem.[ds_total_calculado]	
														
	,destino.[qt_horas_normais]							= origem.[qt_horas_normais]		
	,destino.[qt_desconto]								= origem.[qt_desconto]			
	,destino.[qt_horas_extras_total]					= origem.[qt_horas_extras_total]
	,destino.qt_horas_extras_50						   = origem.qt_horas_extras_50	
	,destino.qt_horas_extras_55						   = origem.qt_horas_extras_55	
	,destino.qt_horas_extras_60						   = origem.qt_horas_extras_60	
	,destino.qt_horas_extras_70						   = origem.qt_horas_extras_70	
	,destino.qt_horas_extras_75						   = origem.qt_horas_extras_75	
	,destino.qt_horas_extras_80						   = origem.qt_horas_extras_80	
	,destino.qt_horas_extras_100					   = origem.qt_horas_extras_100
	,destino.qt_horas_extras_120					   = origem.qt_horas_extras_120
	,destino.qt_horas_extras_150					   = origem.qt_horas_extras_150
	,destino.[qt_extra_excessiva]						= origem.[qt_extra_excessiva]	
	,destino.[qt_extra_normal]							= origem.[qt_extra_normal]		
	,destino.[qt_total_calculado]						= origem.[qt_total_calculado]	

	,destino.[cd_id_unico_stou]							= origem.[cd_id_unico_stou]
	,destino.[dt_criacao]								= origem.[dt_criacao]
	,destino.dt_alteracao								= getdate()
	,destino.cd_deptoConta_funcionarios					= origem.cd_deptoConta_funcionarios
	,destino.cd_deptocc_funcionarios					= origem.cd_deptocc_funcionarios
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
			 origem.[cd_filial_funcionarios]
			,origem.[cd_matricula_funcionarios]
			,origem.[cd_filialMatricula_funcionarios]
			,origem.[dt_pontoEspelho]
			,origem.[ds_horas_normais]		 
			,origem.[ds_desconto]			
			,origem.[ds_horas_extras_total]
			,origem.[ds_extra_excessiva]	
			,origem.[ds_extra_normal]		
			,origem.[ds_total_calculado]				
			,origem.[qt_horas_normais]		
			,origem.[qt_desconto]			
			,origem.[qt_horas_extras_total]
			,origem.qt_horas_extras_50	
			,origem.qt_horas_extras_55	
			,origem.qt_horas_extras_60	
			,origem.qt_horas_extras_70	
			,origem.qt_horas_extras_75	
			,origem.qt_horas_extras_80	
			,origem.qt_horas_extras_100
			,origem.qt_horas_extras_120
			,origem.qt_horas_extras_150
			,origem.[qt_extra_excessiva]	
			,origem.[qt_extra_normal]		
			,origem.[qt_total_calculado]
			,origem.[cd_id_unico_stou]			
			,origem.dt_criacao								
			,origem.dt_alteracao
			,origem.cd_deptoConta_funcionarios
			,origem.cd_deptocc_funcionarios
		);

set @linhas = @@ROWCOUNT;

return @linhas

GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_inclusaomarcacao]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--DROP PROCEDURE [dbo].[sp_tb_fat_inclusaomarcacao]
--GO


CREATE proc [dbo].[sp_tb_fat_inclusaomarcacao]

as 

declare @linhas int;

WITH FILIAIS AS ( SELECT cod_filialStou, RIGHT('000' + cod_filialRIP, 2) AS cod_filialRIP FROM bi_rip_trustedZone.dbo.tb_dim_depara_stouFilial)

merge [dbo].[tb_fat_inclusaomarcacao] as destino

using (

	select
	-- sk_destino							= null			
	 cd_matricula_funcionarios				= stou.[matricula]
	,cd_filial_funcionarios				= (SELECT cod_filialRIP FROM FILIAIS WHERE stou.cod_empresa = FILIAIS.cod_filialStou)
	,dt_pontoEspelho						= CASE WHEN ISDATE(stou.[data]				) = 1 THEN CONVERT(DATETIME, stou.[data] ) ELSE NULL END	
	
	,dt_marcacao1							= CASE WHEN ISDATE(stou.[marcacao1]				) = 1 THEN CONVERT(DATETIME, stou.[marcacao1]			) ELSE NULL END			
	,dt_marcacao2							= CASE WHEN ISDATE(stou.[marcacao2]				) = 1 THEN CONVERT(DATETIME, stou.[marcacao2]			) ELSE NULL END				
	,dt_marcacao3							= CASE WHEN ISDATE(stou.[marcacao3]				) = 1 THEN CONVERT(DATETIME, stou.[marcacao3]			) ELSE NULL END				
	,dt_marcacao4							= CASE WHEN ISDATE(stou.[marcacao4]				) = 1 THEN CONVERT(DATETIME, stou.[marcacao4]			) ELSE NULL END				
	,dt_marcacao5							= CASE WHEN ISDATE(stou.[marcacao5]				) = 1 THEN CONVERT(DATETIME, stou.[marcacao5]			) ELSE NULL END				
	,dt_marcacao6							= CASE WHEN ISDATE(stou.[marcacao6]				) = 1 THEN CONVERT(DATETIME, stou.[marcacao6]			) ELSE NULL END				
	,dt_marcacao7							= CASE WHEN ISDATE(stou.[marcacao7]				) = 1 THEN CONVERT(DATETIME, stou.[marcacao7]			) ELSE NULL END				
	,dt_marcacao8							= CASE WHEN ISDATE(stou.[marcacao8]				) = 1 THEN CONVERT(DATETIME, stou.[marcacao8]			) ELSE NULL END				
	,dt_marcacao9							= CASE WHEN ISDATE(stou.[marcacao9]				) = 1 THEN CONVERT(DATETIME, stou.[marcacao9]			) ELSE NULL END				
	,dt_marcacao10							= CASE WHEN ISDATE(stou.[marcacao10]			) = 1 THEN CONVERT(DATETIME, stou.[marcacao10]			) ELSE NULL END			
	,dt_marcacao11							= CASE WHEN ISDATE(stou.[marcacao11]			) = 1 THEN CONVERT(DATETIME, stou.[marcacao11]			) ELSE NULL END			
	,dt_marcacao12							= CASE WHEN ISDATE(stou.[marcacao12]			) = 1 THEN CONVERT(DATETIME, stou.[marcacao12]			) ELSE NULL END			
	,dt_marcacao1_alterada					= CASE WHEN ISDATE(stou.[marcacao1_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao1_alterada]	) ELSE NULL END	
	,dt_marcacao2_alterada					= CASE WHEN ISDATE(stou.[marcacao2_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao2_alterada]	) ELSE NULL END	
	,dt_marcacao3_alterada					= CASE WHEN ISDATE(stou.[marcacao3_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao3_alterada]	) ELSE NULL END	
	,dt_marcacao4_alterada					= CASE WHEN ISDATE(stou.[marcacao4_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao4_alterada]	) ELSE NULL END	
	,dt_marcacao5_alterada					= CASE WHEN ISDATE(stou.[marcacao5_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao5_alterada]	) ELSE NULL END	
	,dt_marcacao6_alterada					= CASE WHEN ISDATE(stou.[marcacao6_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao6_alterada]	) ELSE NULL END	
	,dt_marcacao7_alterada					= CASE WHEN ISDATE(stou.[marcacao7_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao7_alterada]	) ELSE NULL END	
	,dt_marcacao8_alterada					= CASE WHEN ISDATE(stou.[marcacao8_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao8_alterada]	) ELSE NULL END	
	,dt_marcacao9_alterada					= CASE WHEN ISDATE(stou.[marcacao9_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao9_alterada]	) ELSE NULL END	
	,dt_marcacao10_alterada					= CASE WHEN ISDATE(stou.[marcacao10_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao10_alterada]	) ELSE NULL END	
	,dt_marcacao11_alterada					= CASE WHEN ISDATE(stou.[marcacao11_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao11_alterada]	) ELSE NULL END	  
	,dt_marcacao12_alterada					= CASE WHEN ISDATE(stou.[marcacao12_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao12_alterada]	) ELSE NULL END	

	,cd_id_unico_stou						= stou.codigo /*identificador unico stou*/
	,dt_criacao								= getdate()
	,dt_alteracao							= getdate()
	,cd_deptoConta_funcionarios				= stou.depto_conta
	,cd_deptocc_funcionarios				= stou.depto_cc
	from [bi_rip_rawZone_bck].[dbo].[STOU_JSON_DATA_ponto_espelho] as stou
	where (
		   ISDATE(stou.[marcacao1]			) = 1 
		or ISDATE(stou.[marcacao2]			) = 1 
		or ISDATE(stou.[marcacao3]			) = 1 
		or ISDATE(stou.[marcacao4]			) = 1 
		or ISDATE(stou.[marcacao5]			) = 1 
		or ISDATE(stou.[marcacao6]			) = 1 
		or ISDATE(stou.[marcacao7]			) = 1 
		or ISDATE(stou.[marcacao8]			) = 1 
		or ISDATE(stou.[marcacao9]			) = 1 
		or ISDATE(stou.[marcacao10]			) = 1 
		or ISDATE(stou.[marcacao11]			) = 1 
		or ISDATE(stou.[marcacao12]			) = 1 
		or ISDATE(stou.[marcacao1_alterada]	) = 1 
		or ISDATE(stou.[marcacao2_alterada]	) = 1 
		or ISDATE(stou.[marcacao3_alterada]	) = 1 
		or ISDATE(stou.[marcacao4_alterada]	) = 1 
		or ISDATE(stou.[marcacao5_alterada]	) = 1 
		or ISDATE(stou.[marcacao6_alterada]	) = 1 
		or ISDATE(stou.[marcacao7_alterada]	) = 1 
		or ISDATE(stou.[marcacao8_alterada]	) = 1 
		or ISDATE(stou.[marcacao9_alterada]	) = 1 
		or ISDATE(stou.[marcacao10_alterada]) = 1 
		or ISDATE(stou.[marcacao11_alterada]) = 1 
		or ISDATE(stou.[marcacao12_alterada]) = 1 
	)

) origem on  
(		
	origem.cd_id_unico_stou = destino.cd_id_unico_stou
)

WHEN MATCHED THEN
	UPDATE SET 

	 destino.[cd_matricula_funcionarios]			= origem.[cd_matricula_funcionarios]
	,destino.cd_filial_funcionarios					= origem.cd_filial_funcionarios
	,destino.[dt_pontoEspelho]						= origem.[dt_pontoEspelho]

	,destino.dt_marcacao1							= origem.dt_marcacao1			
	,destino.dt_marcacao2							= origem.dt_marcacao2			
	,destino.dt_marcacao3							= origem.dt_marcacao3			
	,destino.dt_marcacao4							= origem.dt_marcacao4			
	,destino.dt_marcacao5							= origem.dt_marcacao5			
	,destino.dt_marcacao6							= origem.dt_marcacao6			
	,destino.dt_marcacao7							= origem.dt_marcacao7			
	,destino.dt_marcacao8							= origem.dt_marcacao8			
	,destino.dt_marcacao9							= origem.dt_marcacao9			
	,destino.dt_marcacao10							= origem.dt_marcacao10			
	,destino.dt_marcacao11							= origem.dt_marcacao11			
	,destino.dt_marcacao12							= origem.dt_marcacao12			
	,destino.dt_marcacao1_alterada					= origem.dt_marcacao1_alterada	
	,destino.dt_marcacao2_alterada					= origem.dt_marcacao2_alterada	
	,destino.dt_marcacao3_alterada					= origem.dt_marcacao3_alterada	
	,destino.dt_marcacao4_alterada					= origem.dt_marcacao4_alterada	
	,destino.dt_marcacao5_alterada					= origem.dt_marcacao5_alterada	
	,destino.dt_marcacao6_alterada					= origem.dt_marcacao6_alterada	
	,destino.dt_marcacao7_alterada					= origem.dt_marcacao7_alterada	
	,destino.dt_marcacao8_alterada					= origem.dt_marcacao8_alterada	
	,destino.dt_marcacao9_alterada					= origem.dt_marcacao9_alterada	
	,destino.dt_marcacao10_alterada					= origem.dt_marcacao10_alterada	
	,destino.dt_marcacao11_alterada					= origem.dt_marcacao11_alterada	  
	,destino.dt_marcacao12_alterada					= origem.dt_marcacao12_alterada		

	,destino.[cd_id_unico_stou]							= origem.[cd_id_unico_stou]
	,destino.[dt_criacao]								= origem.[dt_criacao]
	,destino.[dt_alteracao]								= getdate()
	,destino.cd_deptoConta_funcionarios					= origem.cd_deptoConta_funcionarios
	,destino.cd_deptocc_funcionarios					= origem.cd_deptocc_funcionarios
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
			 origem.[cd_matricula_funcionarios]
			,origem.cd_filial_funcionarios	
			,origem.[dt_pontoEspelho]

			,origem.dt_marcacao1			
			,origem.dt_marcacao2			
			,origem.dt_marcacao3			
			,origem.dt_marcacao4			
			,origem.dt_marcacao5			
			,origem.dt_marcacao6			
			,origem.dt_marcacao7			
			,origem.dt_marcacao8			
			,origem.dt_marcacao9			
			,origem.dt_marcacao10			
			,origem.dt_marcacao11			
			,origem.dt_marcacao12			
			,origem.dt_marcacao1_alterada	
			,origem.dt_marcacao2_alterada	
			,origem.dt_marcacao3_alterada	
			,origem.dt_marcacao4_alterada	
			,origem.dt_marcacao5_alterada	
			,origem.dt_marcacao6_alterada	
			,origem.dt_marcacao7_alterada	
			,origem.dt_marcacao8_alterada	
			,origem.dt_marcacao9_alterada	
			,origem.dt_marcacao10_alterada	
			,origem.dt_marcacao11_alterada	
			,origem.dt_marcacao12_alterada	

			,origem.[cd_id_unico_stou]			
			,origem.dt_criacao								
			,origem.dt_alteracao
			,origem.cd_deptoConta_funcionarios
			,origem.cd_deptocc_funcionarios
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas

GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_inclusaomarcacao_diario]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--DROP PROCEDURE [dbo].[sp_tb_fat_inclusaomarcacao]
--GO


CREATE proc [dbo].[sp_tb_fat_inclusaomarcacao_diario]

as 

declare @linhas int;

WITH FILIAIS AS ( SELECT cod_filialStou, RIGHT('000' + cod_filialRIP, 2) AS cod_filialRIP FROM bi_rip_trustedZone.dbo.tb_dim_depara_stouFilial)

merge [dbo].[tb_fat_inclusaomarcacao] as destino

using (

	select
	-- sk_destino							= null			
	 cd_matricula_funcionarios				= stou.[matricula]
	,cd_filial_funcionarios				= (SELECT cod_filialRIP FROM FILIAIS WHERE stou.cod_empresa = FILIAIS.cod_filialStou)
	,dt_pontoEspelho						= CASE WHEN ISDATE(stou.[data]				) = 1 THEN CONVERT(DATETIME, stou.[data] ) ELSE NULL END	
	
	,dt_marcacao1							= CASE WHEN ISDATE(stou.[marcacao1]				) = 1 THEN CONVERT(DATETIME, stou.[marcacao1]			) ELSE NULL END			
	,dt_marcacao2							= CASE WHEN ISDATE(stou.[marcacao2]				) = 1 THEN CONVERT(DATETIME, stou.[marcacao2]			) ELSE NULL END				
	,dt_marcacao3							= CASE WHEN ISDATE(stou.[marcacao3]				) = 1 THEN CONVERT(DATETIME, stou.[marcacao3]			) ELSE NULL END				
	,dt_marcacao4							= CASE WHEN ISDATE(stou.[marcacao4]				) = 1 THEN CONVERT(DATETIME, stou.[marcacao4]			) ELSE NULL END				
	,dt_marcacao5							= CASE WHEN ISDATE(stou.[marcacao5]				) = 1 THEN CONVERT(DATETIME, stou.[marcacao5]			) ELSE NULL END				
	,dt_marcacao6							= CASE WHEN ISDATE(stou.[marcacao6]				) = 1 THEN CONVERT(DATETIME, stou.[marcacao6]			) ELSE NULL END				
	,dt_marcacao7							= CASE WHEN ISDATE(stou.[marcacao7]				) = 1 THEN CONVERT(DATETIME, stou.[marcacao7]			) ELSE NULL END				
	,dt_marcacao8							= CASE WHEN ISDATE(stou.[marcacao8]				) = 1 THEN CONVERT(DATETIME, stou.[marcacao8]			) ELSE NULL END				
	,dt_marcacao9							= CASE WHEN ISDATE(stou.[marcacao9]				) = 1 THEN CONVERT(DATETIME, stou.[marcacao9]			) ELSE NULL END				
	,dt_marcacao10							= CASE WHEN ISDATE(stou.[marcacao10]			) = 1 THEN CONVERT(DATETIME, stou.[marcacao10]			) ELSE NULL END			
	,dt_marcacao11							= CASE WHEN ISDATE(stou.[marcacao11]			) = 1 THEN CONVERT(DATETIME, stou.[marcacao11]			) ELSE NULL END			
	,dt_marcacao12							= CASE WHEN ISDATE(stou.[marcacao12]			) = 1 THEN CONVERT(DATETIME, stou.[marcacao12]			) ELSE NULL END			
	,dt_marcacao1_alterada					= CASE WHEN ISDATE(stou.[marcacao1_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao1_alterada]	) ELSE NULL END	
	,dt_marcacao2_alterada					= CASE WHEN ISDATE(stou.[marcacao2_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao2_alterada]	) ELSE NULL END	
	,dt_marcacao3_alterada					= CASE WHEN ISDATE(stou.[marcacao3_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao3_alterada]	) ELSE NULL END	
	,dt_marcacao4_alterada					= CASE WHEN ISDATE(stou.[marcacao4_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao4_alterada]	) ELSE NULL END	
	,dt_marcacao5_alterada					= CASE WHEN ISDATE(stou.[marcacao5_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao5_alterada]	) ELSE NULL END	
	,dt_marcacao6_alterada					= CASE WHEN ISDATE(stou.[marcacao6_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao6_alterada]	) ELSE NULL END	
	,dt_marcacao7_alterada					= CASE WHEN ISDATE(stou.[marcacao7_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao7_alterada]	) ELSE NULL END	
	,dt_marcacao8_alterada					= CASE WHEN ISDATE(stou.[marcacao8_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao8_alterada]	) ELSE NULL END	
	,dt_marcacao9_alterada					= CASE WHEN ISDATE(stou.[marcacao9_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao9_alterada]	) ELSE NULL END	
	,dt_marcacao10_alterada					= CASE WHEN ISDATE(stou.[marcacao10_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao10_alterada]	) ELSE NULL END	
	,dt_marcacao11_alterada					= CASE WHEN ISDATE(stou.[marcacao11_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao11_alterada]	) ELSE NULL END	  
	,dt_marcacao12_alterada					= CASE WHEN ISDATE(stou.[marcacao12_alterada]	) = 1 THEN CONVERT(DATETIME, stou.[marcacao12_alterada]	) ELSE NULL END	

	,cd_id_unico_stou						= stou.codigo /*identificador unico stou*/
	,dt_criacao								= getdate()
	,dt_alteracao							= getdate()
	,cd_deptoConta_funcionarios				= stou.depto_conta
	,cd_deptocc_funcionarios				= stou.depto_cc
	from [bi_rip_rawZone_bck].[dbo].[STOU_TEMP_DATA] as stou
	where (
		   ISDATE(stou.[marcacao1]			) = 1 
		or ISDATE(stou.[marcacao2]			) = 1 
		or ISDATE(stou.[marcacao3]			) = 1 
		or ISDATE(stou.[marcacao4]			) = 1 
		or ISDATE(stou.[marcacao5]			) = 1 
		or ISDATE(stou.[marcacao6]			) = 1 
		or ISDATE(stou.[marcacao7]			) = 1 
		or ISDATE(stou.[marcacao8]			) = 1 
		or ISDATE(stou.[marcacao9]			) = 1 
		or ISDATE(stou.[marcacao10]			) = 1 
		or ISDATE(stou.[marcacao11]			) = 1 
		or ISDATE(stou.[marcacao12]			) = 1 
		or ISDATE(stou.[marcacao1_alterada]	) = 1 
		or ISDATE(stou.[marcacao2_alterada]	) = 1 
		or ISDATE(stou.[marcacao3_alterada]	) = 1 
		or ISDATE(stou.[marcacao4_alterada]	) = 1 
		or ISDATE(stou.[marcacao5_alterada]	) = 1 
		or ISDATE(stou.[marcacao6_alterada]	) = 1 
		or ISDATE(stou.[marcacao7_alterada]	) = 1 
		or ISDATE(stou.[marcacao8_alterada]	) = 1 
		or ISDATE(stou.[marcacao9_alterada]	) = 1 
		or ISDATE(stou.[marcacao10_alterada]) = 1 
		or ISDATE(stou.[marcacao11_alterada]) = 1 
		or ISDATE(stou.[marcacao12_alterada]) = 1 
	)

) origem on  
(		
	origem.cd_id_unico_stou = destino.cd_id_unico_stou
)

WHEN MATCHED THEN
	UPDATE SET 

	 destino.[cd_matricula_funcionarios]			= origem.[cd_matricula_funcionarios]
	,destino.cd_filial_funcionarios					= origem.cd_filial_funcionarios
	,destino.[dt_pontoEspelho]						= origem.[dt_pontoEspelho]

	,destino.dt_marcacao1							= origem.dt_marcacao1			
	,destino.dt_marcacao2							= origem.dt_marcacao2			
	,destino.dt_marcacao3							= origem.dt_marcacao3			
	,destino.dt_marcacao4							= origem.dt_marcacao4			
	,destino.dt_marcacao5							= origem.dt_marcacao5			
	,destino.dt_marcacao6							= origem.dt_marcacao6			
	,destino.dt_marcacao7							= origem.dt_marcacao7			
	,destino.dt_marcacao8							= origem.dt_marcacao8			
	,destino.dt_marcacao9							= origem.dt_marcacao9			
	,destino.dt_marcacao10							= origem.dt_marcacao10			
	,destino.dt_marcacao11							= origem.dt_marcacao11			
	,destino.dt_marcacao12							= origem.dt_marcacao12			
	,destino.dt_marcacao1_alterada					= origem.dt_marcacao1_alterada	
	,destino.dt_marcacao2_alterada					= origem.dt_marcacao2_alterada	
	,destino.dt_marcacao3_alterada					= origem.dt_marcacao3_alterada	
	,destino.dt_marcacao4_alterada					= origem.dt_marcacao4_alterada	
	,destino.dt_marcacao5_alterada					= origem.dt_marcacao5_alterada	
	,destino.dt_marcacao6_alterada					= origem.dt_marcacao6_alterada	
	,destino.dt_marcacao7_alterada					= origem.dt_marcacao7_alterada	
	,destino.dt_marcacao8_alterada					= origem.dt_marcacao8_alterada	
	,destino.dt_marcacao9_alterada					= origem.dt_marcacao9_alterada	
	,destino.dt_marcacao10_alterada					= origem.dt_marcacao10_alterada	
	,destino.dt_marcacao11_alterada					= origem.dt_marcacao11_alterada	  
	,destino.dt_marcacao12_alterada					= origem.dt_marcacao12_alterada		

	,destino.[cd_id_unico_stou]							= origem.[cd_id_unico_stou]
	,destino.[dt_criacao]								= origem.[dt_criacao]
	,destino.[dt_alteracao]								= getdate()
	,destino.cd_deptoConta_funcionarios					= origem.cd_deptoConta_funcionarios
	,destino.cd_deptocc_funcionarios					= origem.cd_deptocc_funcionarios
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
			 origem.[cd_matricula_funcionarios]
			,origem.cd_filial_funcionarios	
			,origem.[dt_pontoEspelho]

			,origem.dt_marcacao1			
			,origem.dt_marcacao2			
			,origem.dt_marcacao3			
			,origem.dt_marcacao4			
			,origem.dt_marcacao5			
			,origem.dt_marcacao6			
			,origem.dt_marcacao7			
			,origem.dt_marcacao8			
			,origem.dt_marcacao9			
			,origem.dt_marcacao10			
			,origem.dt_marcacao11			
			,origem.dt_marcacao12			
			,origem.dt_marcacao1_alterada	
			,origem.dt_marcacao2_alterada	
			,origem.dt_marcacao3_alterada	
			,origem.dt_marcacao4_alterada	
			,origem.dt_marcacao5_alterada	
			,origem.dt_marcacao6_alterada	
			,origem.dt_marcacao7_alterada	
			,origem.dt_marcacao8_alterada	
			,origem.dt_marcacao9_alterada	
			,origem.dt_marcacao10_alterada	
			,origem.dt_marcacao11_alterada	
			,origem.dt_marcacao12_alterada	

			,origem.[cd_id_unico_stou]			
			,origem.dt_criacao								
			,origem.dt_alteracao
			,origem.cd_deptoConta_funcionarios
			,origem.cd_deptocc_funcionarios
		);

set @linhas = @@ROWCOUNT;

return @linhas

GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_itensMontagemVolume]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_tb_fat_itensMontagemVolume]

as

declare @linhas int;
merge tb_fat_itensMontagemVolume as destino

using (

select
	cd_filial_itensMontagemVolume			= ZNJ_FILIAL
	,cd_montagem_itensMonstagemVolume 		= ZNJ_CODMNT
	,cd_item_itensMontagemVolume 			= ZNJ_ITEM
	,cd_produto_itensMontagemVolume			= ZNJ_CODPRO
	,qt_origem_itensMontagemVolume 			= ZNJ_QTORIG
	,[cd_recno_ZNJ]							= R_E_C_N_O_
	,dt_criacao								= getdate()
	,dt_alteracao							= getdate()
from [bi_rip_rawZone_bck].dbo.ZNJ010
where D_E_L_E_T_ = ''

) origem on  
(		
	origem.cd_recno_ZNJ = destino.cd_recno_ZNJ
)


WHEN MATCHED THEN
	UPDATE SET 
	destino.cd_filial_itensMontagemVolume					= origem.cd_filial_itensMontagemVolume		
	,destino.cd_montagem_itensMonstagemVolume 				= origem.cd_montagem_itensMonstagemVolume 	
	,destino.cd_item_itensMontagemVolume 					= origem.cd_item_itensMontagemVolume 		
	,destino.cd_produto_itensMontagemVolume					= origem.cd_produto_itensMontagemVolume		
	,destino.qt_origem_itensMontagemVolume 					= origem.qt_origem_itensMontagemVolume 		
	,destino.dt_alteracao							= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
	    origem.cd_filial_itensMontagemVolume		
	    ,origem.cd_montagem_itensMonstagemVolume 	
	    ,origem.cd_item_itensMontagemVolume 		
	    ,origem.cd_produto_itensMontagemVolume		
	    ,origem.qt_origem_itensMontagemVolume
		,origem.[cd_recno_ZNJ]
		,origem.dt_criacao
		,origem.dt_alteracao								
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas


GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_LogRPA]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_tb_fat_LogRPA]

as 

declare @linhas int;

merge [dbo].[tb_fat_LogRPA] as destino

using (

	select
	

		[cd_ID]	= ID
      ,[ds_Nome_Pasta_Clinica] =  [Nome Pasta (Clinica)]
      ,[ds_Nome_Pasta_Funcionario] = [Nome Pasta (Funcionario)]
      ,[ds_Status_Tarefa_Executada] = [Status (Nome da Tarefa Executada)]
      ,[ds_Msg_Excecao] = [Mensagem (Detalhe da excecao)]
      ,[dt_Data_Hora] = [Data/Hora]
      ,[nm_Cod_Fluig] = [Codigo FLUIG]
      ,[dt_criacao] = getdate()
      ,[dt_alteracao]= getdate()
	
	from [bi_rip_rawZone_bck].dbo.LogRPA as LogRPA


) origem on  
(		
	origem.cd_ID = destino.cd_ID
)

WHEN MATCHED THEN
	UPDATE SET 
	
	 destino.cd_ID									= origem.cd_ID				
	,destino.ds_Nome_Pasta_Clinica					= origem.ds_Nome_Pasta_Clinica						
	,destino.ds_Nome_Pasta_Funcionario				= origem.ds_Nome_Pasta_Funcionario	
	,destino.ds_Status_Tarefa_Executada				= origem.ds_Status_Tarefa_Executada		
	,destino.ds_Msg_Excecao							= origem.ds_Msg_Excecao
	,destino.dt_Data_Hora							= origem.dt_Data_Hora
	,destino.nm_Cod_Fluig							= origem.nm_Cod_Fluig
	,destino.dt_alteracao							= getdate()

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
			
			origem.cd_ID				
			,origem.ds_Nome_Pasta_Clinica		
			,origem.ds_Nome_Pasta_Funcionario	
			,origem.ds_Status_Tarefa_Executada
			,origem.ds_Msg_Excecao
			,origem.dt_Data_Hora
			,origem.nm_Cod_Fluig
			,origem.dt_criacao							
			,origem.dt_alteracao
		)			

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas

GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_mestreInventario]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

CREATE proc [dbo].[sp_tb_fat_mestreInventario]

as

declare @linhas int;
merge tb_fat_mestreInventario as destino

using (

	SELECT
	sk_destino									= NULL
	,cd_filial_mestreInventario					= CBA_FILIAL 
	,cd_inventario_mestreInventario				= CBA_CODINV 
	,tp_analise_mestreInventario				= IIF(CBA_ANALIS = '1', 'Ok', 'Divergente')
	,dt_inventario_mestreInventario				= CBA_DATA   
	,qt_contagensArealizar_mestreInventario		= CBA_CONTS  
	,cd_almoxarifado_mestreInventario			= CBA_LOCAL  
	,tp_tipoInventario_mestreInventario			= IIF(CBA_TIPINV = '1', 'Produto', 'Endereco')
	,cd_endereco_mestreInventario				= CBA_LOCALI 
	,cd_produto_mestreInventario				= CBA_PROD   
	,qt_contagensRealizadas_mestreInventario	= CBA_CONTR  
	,tp_status_mestreInventario					= CASE CBA_STATUS 
		WHEN '0' THEN 'Não Iniciado' 
		WHEN '1' THEN 'Em Andamento' 
		WHEN '2' THEN 'Em Pausa' 
		WHEN '3' THEN 'Contado'
		WHEN '4' THEN 'Finalizado'
		WHEN '5' THEN 'Processado'
		WHEN '6' THEN 'Endereço S/ Saldo'
		WHEN '7' THEN 'Parcialmente Contado'
	ELSE '' END
	,tp_autorizacaoRecontagem_mestreInventario	= IIF(CBA_AUTREC = '1', 'Sim','Não') 
	,tp_curvaA_mestreInventario					= IIF(CBA_CLASSA = '1', 'Sim','Não') 
	,tp_curvaB_mestreInventario					= IIF(CBA_CLASSB = '1', 'Sim','Não') 
	,tp_curvaC_mestreInventario					= IIF(CBA_CLASSC = '1', 'Sim','Não') 
	,tp_inventarioGuiado_mestreInventario		= IIF(CBA_INVGUI = '1', 'Sim','Não') 
	,tp_inventarioEletronico_mestreInventario	= IIF(CBA_RECINV = '1', 'Sim','Não') 
	,tp_dispositivo_mestreInventario			= IIF(CBA_DISPOS = '1', 'Coletor','Celular') 
	,cd_recno_CBA								= R_E_C_N_O_
	,dt_criacao									= GETDATE()
	,dt_alteracao								= GETDATE()
	FROM [bi_rip_rawZone_bck].dbo.CBA010
	WHERE D_E_L_E_T_ = ''


) origem on  
(		
	origem.cd_recno_CBA	= destino.cd_recno_CBA
)

WHEN MATCHED THEN
	UPDATE SET
	destino.cd_filial_mestreInventario							 = origem.cd_filial_mestreInventario						
	,destino.cd_inventario_mestreInventario						 = origem.cd_inventario_mestreInventario					
	,destino.tp_analise_mestreInventario						 = origem.tp_analise_mestreInventario					
	,destino.dt_inventario_mestreInventario						 = origem.dt_inventario_mestreInventario					
	,destino.qt_contagensArealizar_mestreInventario				 = origem.qt_contagensArealizar_mestreInventario			
	,destino.cd_almoxarifado_mestreInventario					 = origem.cd_almoxarifado_mestreInventario				
	,destino.tp_tipoInventario_mestreInventario					 = origem.tp_tipoInventario_mestreInventario				
	,destino.cd_endereco_mestreInventario						 = origem.cd_endereco_mestreInventario					
	,destino.cd_produto_mestreInventario						 = origem.cd_produto_mestreInventario					
	,destino.qt_contagensRealizadas_mestreInventario			 = origem.qt_contagensRealizadas_mestreInventario		
	,destino.tp_status_mestreInventario							 = origem.tp_status_mestreInventario						
	,destino.tp_autorizacaoRecontagem_mestreInventario			 = origem.tp_autorizacaoRecontagem_mestreInventario		
	,destino.tp_curvaA_mestreInventario							 = origem.tp_curvaA_mestreInventario						
	,destino.tp_curvaB_mestreInventario							 = origem.tp_curvaB_mestreInventario						
	,destino.tp_curvaC_mestreInventario							 = origem.tp_curvaC_mestreInventario						
	,destino.tp_inventarioGuiado_mestreInventario				 = origem.tp_inventarioGuiado_mestreInventario			
	,destino.tp_inventarioEletronico_mestreInventario			 = origem.tp_inventarioEletronico_mestreInventario		
	,destino.tp_dispositivo_mestreInventario					 = origem.tp_dispositivo_mestreInventario																						
	,destino.dt_alteracao										 = getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		origem.cd_filial_mestreInventario
		,origem.cd_inventario_mestreInventario
		,origem.tp_analise_mestreInventario
		,origem.dt_inventario_mestreInventario
		,origem.qt_contagensArealizar_mestreInventario
		,origem.cd_almoxarifado_mestreInventario
		,origem.tp_tipoInventario_mestreInventario
		,origem.cd_endereco_mestreInventario
		,origem.cd_produto_mestreInventario
		,origem.qt_contagensRealizadas_mestreInventario
		,origem.tp_status_mestreInventario
		,origem.tp_autorizacaoRecontagem_mestreInventario
		,origem.tp_curvaA_mestreInventario
		,origem.tp_curvaB_mestreInventario
		,origem.tp_curvaC_mestreInventario
		,origem.tp_inventarioGuiado_mestreInventario
		,origem.tp_inventarioEletronico_mestreInventario
		,origem.tp_dispositivo_mestreInventario
		,origem.cd_recno_CBA
		,origem.dt_criacao
		,origem.dt_alteracao
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas
GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_movInterna]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_tb_fat_movInterna]

as

declare @linhas int;
merge tb_fat_movInterna as destino

using (

select										
	cd_filial_movInterna					= D3_FILIAL
	,tp_movimento_movInterna				= D3_TM
	,cd_produto_movInterna					= D3_COD
	,cd_unidade_movInterna					= D3_UM
	,qt_movimento_movInterna				= D3_QUANT
	,tp_reDe_movInterna						= D3_CF
	,cd_contabil_movInterna					= D3_CONTA
	,cd_ordemProducao_movInterna			= D3_OP
	,cd_armazem_movInterna					= D3_LOCAL
	,cd_documento_movInterna				= D3_DOC
	,dt_emissao_movInterna					= D3_EMISSAO
	,cd_grupo_movInterna					= D3_GRUPO
	,vl_custo1_movInterna					= D3_CUSTO1
	,vl_custo2_movInterna					= D3_CUSTO2
	,vl_custo3_movInterna					= D3_CUSTO3
	,vl_custo4_movInterna					= D3_CUSTO4
	,vl_custo5_movInterna					= D3_CUSTO5
	,cd_centroCusto_movInterna				= D3_CC
	,vf_parcialTotal_movInterna				= D3_PARCTOT
	,vf_estornardo_movInterna				= D3_ESTORNO
	,cd_sequencial_movInterna				= D3_NUMSEQ
	,cd_segundaUnidade_movInterna			= D3_SEGUM
	,qt_movimentoSegundaUnidade_movInterna	= D3_QTSEGUM
	,cd_tipo_movInterna						= D3_TIPO
	,cd_nivelEstrutura_movInterna			= D3_NIVEL
	,nm_usuario_movInterna					= D3_USUARIO
	,cd_regraWms_movInterna					= D3_REGWMS
	,vl_perda_movInterna					= D3_PERDA
	,dt_lancContabil_movInterna				= D3_DTLANC
	,cd_sequencia_movInterna				= D3_TRT
	,cd_chave_movInterna					= D3_CHAVE
	,cd_operacaoPai_movInterna				= D3_IDENT
	,cd_seqRecalc_movInterna				= D3_SEQCALC
	,vl_porcRateio_movInterna				= D3_RATEIO
	,cd_lote_movInterna						= D3_LOTECTL
	,cd_subLote_movInterna					= D3_NUMLOTE
	,cd_validLote_movInterna				= D3_DTVALID
	,cd_endereco_movInterna					= D3_LOCALIZ
	,cd_numSerie_movInterna					= D3_NUMSERI
	,vl_custoFifo1_movInterna				= D3_CUSFF1
	,vl_custoFIfo2_movInterna				= D3_CUSFF2
	,vl_custoFifo3_movInterna				= D3_CUSFF3
	,vl_custoFifo4_movInterna				= D3_CUSFF4
	,vl_custoFifo5_movInterna				= D3_CUSFF5
	,cd_itemRemito_movInterna				= D3_ITEM
	,cd_verificacao_movInterna				= D3_OK
	,cd_itemConta_movInterna				= D3_ITEMCTA
	,cd_clVal_movInterna					= D3_CLVL
	,cd_projeto_movInterna					= D3_PROJPMS
	,cd_tarefa_movInterna					= D3_TASKPMS
	,cd_ordemServico_movInterna				= D3_ORDEM
	,cd_servico_movInterna					= D3_SERVIC
	,cd_statusServico_movInterna			= D3_STSERV
	,cd_osAssinTec_movInterna				= D3_OSTEC
	,vl_potenciaLote_movInterna				= D3_POTENCI
	,cd_estrFisica_movInterna				= D3_TPESTR
	,cd_regAtendim_movInterna				= D3_REGATEN
	,cd_docSWN_movInterna					= D3_DOCSWN
	,cd_itemSWN_movInterna					= D3_ITEMSWN
	,cd_itemGrade_movInterna				= D3_ITEMGRD
	,tp_statusMov_movInterna				= D3_STATUS
	,vl_reposicao_movInterna				= D3_CUSRP1
	,vl_repos2am_movInterna					= D3_CUSRP2
	,vl_repos3am_movInterna					= D3_CUSRP3
	,vl_repos4am_movInterna					= D3_CUSRP4
	,vl_repos5am_movInterna					= D3_CUSRP5
	,vl_repUni_movInterna					= D3_CMRP
	,cd_moedaCrep_movInterna				= D3_MOEDRP
	,cd_revEstrutura_movInterna				= D3_REVISAO
	,cd_procImport_movInterna				= D3_HAWB
	,cd_emenhoOP_movInterna					= D3_EMPOP
	,vl_CSTFixo_movInterna					= D3_CMFIXO
	,vl_macroNutr_movInterna				= D3_PMACNUT
	,vl_microNutr_movInterna				= D3_PMICNUT
	,cd_moedaCfixo_movInterna				= D3_MOEDA
	,cd_diario_movInterna					= D3_DIACTB
	,vf_garantia_movInterna					= D3_GARANTI
	,cd_seqDiario_movInterna				= D3_NODIA
	,cd_boletim_movInterna					= D3_NRBPIMS
	,qt_ganho_movInterna					= D3_QTGANHO
	,qt_maior_movInterna					= D3_QTMAIOR
	,cd_SA_movInterna						= D3_NUMSA
	,cd_perImpo_movInterna					= D3_PERIMP
	,vl_valorVi_movInterna					= D3_VLRVI
	,cd_chaveNF_movInterna					= D3_CHAVEF1
	,cd_desconto_movInterna					= D3_NRABATE
	,cd_cat83_movInterna					= D3_CODLAN
	,cd_marca_movInterna					= D3_OKISS
	,cd_itemSA_movInterna					= D3_ITEMSA
	,vl_PD_movInterna						= D3_VLRPD
	,cd_tipoEntrada_movInterna				= D3_TEATF
	,cd_safra_movInterna					= D3_CODSAF
	,cd_mercadoDeb_movInterna				= D3_EC05DB
	,cd_mercadoCred_movInterna				= D3_EC05CR
	,cd_modalidadeDeb_movInterna			= D3_EC06DB
	,cd_modalidadeCred_movInterna			= D3_EC06CR
	,cd_localDeb_movInterna					= D3_EC07DB
	,cd_localCred_movInterna				= D3_EC07CR
	,cd_atividadeDeb_movInterna				= D3_EC08DB
	,cd_atividadeCred_movInterna			= D3_EC08CR
	,cd_letraDeb_movInterna					= D3_EC09DB
	,cd_letraCred_movInterna				= D3_EC09CR
	,cd_tanque_movInterna					= D3_TANQUE
	,vl_massaEsp_movInterna					= D3_MASSA
	,vl_tempAmostra_movInterna				= D3_TEMPAMO
	,vl_tempTanque_movInterna				= D3_TEMPTAQ
	,vl_densAmbient_movInterna				= D3_DENSAMB
	,qt_ambiente_movInterna					= D3_QTDAMB
	,vl_fatorCorrecao_movInterna			= D3_FATCORR
	,tp_movAjust_movInterna					= D3_TPMOVAJ
	,cd_fornecedor_movInterna				= D3_CODFOR
	,cd_lojaFornecedor_movInterna			= D3_LOJAFOR
	,cd_operacao_movInterna					= D3_NFORP
	,ds_observacao_movInterna				= D3_OBS
	,cd_chaveSF2_movInterna					= D3_CHAVEF2
	,cd_dcf_movInterna						= D3_IDDCF
	,ds_observ2_movInterna					= D3_OBSERVA
	,cd_fornecedorDoc_movInterna			= D3_FORNDOC
	,cd_lojaDoc_movInterna					= D3_LOJADOC
	,cd_perBlocoK_movInterna				= D3_PERBLK
	,cd_origem_movInterna					= D3_FATHER
	,nm_usuarioInclusao_movInterna			= D3_USERLGI
	,cd_estaMat_movInterna					= D3_ZESTMAT
	,vl_percCreditoObra_movInterna			= D3_ZCRDOBR
	,cd_centroCustoOrigem_movInterna		= D3_ZCRDORG
	,cd_chaveAcessoNF_movInterna			= D3_ZZCHVNF
	,vf_campoUUID_movInterna				= D3_MSUIDT
	,[cd_recno_SD3]							= R_E_C_N_O_
	,dt_criacao								= getdate()
	,dt_alteracao							= getdate()
from [bi_rip_rawZone_bck].dbo.SD3010
where D_E_L_E_T_ = ''


) origem on  
(		
	origem.cd_recno_SD3 = destino.cd_recno_SD3
)


WHEN MATCHED THEN
	UPDATE SET 
	destino.cd_filial_movInterna					= origem.cd_filial_movInterna
	,destino.tp_movimento_movInterna				= origem.tp_movimento_movInterna
	,destino.cd_produto_movInterna					= origem.cd_produto_movInterna
	,destino.cd_unidade_movInterna					= origem.cd_unidade_movInterna
	,destino.qt_movimento_movInterna				= origem.qt_movimento_movInterna
	,destino.tp_reDe_movInterna						= origem.tp_reDe_movInterna
	,destino.cd_contabil_movInterna					= origem.cd_contabil_movInterna
	,destino.cd_ordemProducao_movInterna			= origem.cd_ordemProducao_movInterna
	,destino.cd_armazem_movInterna					= origem.cd_armazem_movInterna
	,destino.cd_documento_movInterna				= origem.cd_documento_movInterna
	,destino.dt_emissao_movInterna					= origem.dt_emissao_movInterna
	,destino.cd_grupo_movInterna					= origem.cd_grupo_movInterna
	,destino.vl_custo1_movInterna					= origem.vl_custo1_movInterna
	,destino.vl_custo2_movInterna					= origem.vl_custo2_movInterna
	,destino.vl_custo3_movInterna					= origem.vl_custo3_movInterna
	,destino.vl_custo4_movInterna					= origem.vl_custo4_movInterna
	,destino.vl_custo5_movInterna					= origem.vl_custo5_movInterna
	,destino.cd_centroCusto_movInterna				= origem.cd_centroCusto_movInterna
	,destino.vf_parcialTotal_movInterna				= origem.vf_parcialTotal_movInterna
	,destino.vf_estornardo_movInterna				= origem.vf_estornardo_movInterna
	,destino.cd_sequencial_movInterna				= origem.cd_sequencial_movInterna
	,destino.cd_segundaUnidade_movInterna			= origem.cd_segundaUnidade_movInterna
	,destino.qt_movimentoSegundaUnidade_movInterna	= origem.qt_movimentoSegundaUnidade_movInterna
	,destino.cd_tipo_movInterna						= origem.cd_tipo_movInterna
	,destino.cd_nivelEstrutura_movInterna			= origem.cd_nivelEstrutura_movInterna
	,destino.nm_usuario_movInterna					= origem.nm_usuario_movInterna
	,destino.cd_regraWms_movInterna					= origem.cd_regraWms_movInterna
	,destino.vl_perda_movInterna					= origem.vl_perda_movInterna
	,destino.dt_lancContabil_movInterna				= origem.dt_lancContabil_movInterna
	,destino.cd_sequencia_movInterna				= origem.cd_sequencia_movInterna
	,destino.cd_chave_movInterna					= origem.cd_chave_movInterna
	,destino.cd_operacaoPai_movInterna				= origem.cd_operacaoPai_movInterna
	,destino.cd_seqRecalc_movInterna				= origem.cd_seqRecalc_movInterna
	,destino.vl_porcRateio_movInterna				= origem.vl_porcRateio_movInterna
	,destino.cd_lote_movInterna						= origem.cd_lote_movInterna
	,destino.cd_subLote_movInterna					= origem.cd_subLote_movInterna
	,destino.cd_validLote_movInterna				= origem.cd_validLote_movInterna
	,destino.cd_endereco_movInterna					= origem.cd_endereco_movInterna
	,destino.cd_numSerie_movInterna					= origem.cd_numSerie_movInterna
	,destino.vl_custoFifo1_movInterna				= origem.vl_custoFifo1_movInterna
	,destino.vl_custoFIfo2_movInterna				= origem.vl_custoFIfo2_movInterna
	,destino.vl_custoFifo3_movInterna				= origem.vl_custoFifo3_movInterna
	,destino.vl_custoFifo4_movInterna				= origem.vl_custoFifo4_movInterna
	,destino.vl_custoFifo5_movInterna				= origem.vl_custoFifo5_movInterna
	,destino.cd_itemRemito_movInterna				= origem.cd_itemRemito_movInterna
	,destino.cd_verificacao_movInterna				= origem.cd_verificacao_movInterna
	,destino.cd_itemConta_movInterna				= origem.cd_itemConta_movInterna
	,destino.cd_clVal_movInterna					= origem.cd_clVal_movInterna
	,destino.cd_projeto_movInterna					= origem.cd_projeto_movInterna
	,destino.cd_tarefa_movInterna					= origem.cd_tarefa_movInterna
	,destino.cd_ordemServico_movInterna				= origem.cd_ordemServico_movInterna
	,destino.cd_servico_movInterna					= origem.cd_servico_movInterna
	,destino.cd_statusServico_movInterna			= origem.cd_statusServico_movInterna
	,destino.cd_osAssinTec_movInterna				= origem.cd_osAssinTec_movInterna
	,destino.vl_potenciaLote_movInterna				= origem.vl_potenciaLote_movInterna
	,destino.cd_estrFisica_movInterna				= origem.cd_estrFisica_movInterna
	,destino.cd_regAtendim_movInterna				= origem.cd_regAtendim_movInterna
	,destino.cd_docSWN_movInterna					= origem.cd_docSWN_movInterna
	,destino.cd_itemSWN_movInterna					= origem.cd_itemSWN_movInterna
	,destino.cd_itemGrade_movInterna				= origem.cd_itemGrade_movInterna
	,destino.tp_statusMov_movInterna				= origem.tp_statusMov_movInterna
	,destino.vl_reposicao_movInterna				= origem.vl_reposicao_movInterna
	,destino.vl_repos2am_movInterna					= origem.vl_repos2am_movInterna
	,destino.vl_repos3am_movInterna					= origem.vl_repos3am_movInterna
	,destino.vl_repos4am_movInterna					= origem.vl_repos4am_movInterna
	,destino.vl_repos5am_movInterna					= origem.vl_repos5am_movInterna
	,destino.vl_repUni_movInterna					= origem.vl_repUni_movInterna
	,destino.cd_moedaCrep_movInterna				= origem.cd_moedaCrep_movInterna
	,destino.cd_revEstrutura_movInterna				= origem.cd_revEstrutura_movInterna
	,destino.cd_procImport_movInterna				= origem.cd_procImport_movInterna
	,destino.cd_emenhoOP_movInterna					= origem.cd_emenhoOP_movInterna
	,destino.vl_CSTFixo_movInterna					= origem.vl_CSTFixo_movInterna
	,destino.vl_macroNutr_movInterna				= origem.vl_macroNutr_movInterna
	,destino.vl_microNutr_movInterna				= origem.vl_microNutr_movInterna
	,destino.cd_moedaCfixo_movInterna				= origem.cd_moedaCfixo_movInterna
	,destino.cd_diario_movInterna					= origem.cd_diario_movInterna
	,destino.vf_garantia_movInterna					= origem.vf_garantia_movInterna
	,destino.cd_seqDiario_movInterna				= origem.cd_seqDiario_movInterna
	,destino.cd_boletim_movInterna					= origem.cd_boletim_movInterna
	,destino.qt_ganho_movInterna					= origem.qt_ganho_movInterna
	,destino.qt_maior_movInterna					= origem.qt_maior_movInterna
	,destino.cd_SA_movInterna						= origem.cd_SA_movInterna
	,destino.cd_perImpo_movInterna					= origem.cd_perImpo_movInterna
	,destino.vl_valorVi_movInterna					= origem.vl_valorVi_movInterna
	,destino.cd_chaveNF_movInterna					= origem.cd_chaveNF_movInterna
	,destino.cd_desconto_movInterna					= origem.cd_desconto_movInterna
	,destino.cd_cat83_movInterna					= origem.cd_cat83_movInterna
	,destino.cd_marca_movInterna					= origem.cd_marca_movInterna
	,destino.cd_itemSA_movInterna					= origem.cd_itemSA_movInterna
	,destino.vl_PD_movInterna						= origem.vl_PD_movInterna
	,destino.cd_tipoEntrada_movInterna				= origem.cd_tipoEntrada_movInterna
	,destino.cd_safra_movInterna					= origem.cd_safra_movInterna
	,destino.cd_mercadoDeb_movInterna				= origem.cd_mercadoDeb_movInterna
	,destino.cd_mercadoCred_movInterna				= origem.cd_mercadoCred_movInterna
	,destino.cd_modalidadeDeb_movInterna			= origem.cd_modalidadeDeb_movInterna
	,destino.cd_modalidadeCred_movInterna			= origem.cd_modalidadeCred_movInterna
	,destino.cd_localDeb_movInterna					= origem.cd_localDeb_movInterna
	,destino.cd_localCred_movInterna				= origem.cd_localCred_movInterna
	,destino.cd_atividadeDeb_movInterna				= origem.cd_atividadeDeb_movInterna
	,destino.cd_atividadeCred_movInterna			= origem.cd_atividadeCred_movInterna
	,destino.cd_letraDeb_movInterna					= origem.cd_letraDeb_movInterna
	,destino.cd_letraCred_movInterna				= origem.cd_letraCred_movInterna
	,destino.cd_tanque_movInterna					= origem.cd_tanque_movInterna
	,destino.vl_massaEsp_movInterna					= origem.vl_massaEsp_movInterna
	,destino.vl_tempAmostra_movInterna				= origem.vl_tempAmostra_movInterna
	,destino.vl_tempTanque_movInterna				= origem.vl_tempTanque_movInterna
	,destino.vl_densAmbient_movInterna				= origem.vl_densAmbient_movInterna
	,destino.qt_ambiente_movInterna					= origem.qt_ambiente_movInterna
	,destino.vl_fatorCorrecao_movInterna			= origem.vl_fatorCorrecao_movInterna
	,destino.tp_movAjust_movInterna					= origem.tp_movAjust_movInterna
	,destino.cd_fornecedor_movInterna				= origem.cd_fornecedor_movInterna
	,destino.cd_lojaFornecedor_movInterna			= origem.cd_lojaFornecedor_movInterna
	,destino.cd_operacao_movInterna					= origem.cd_operacao_movInterna
	,destino.ds_observacao_movInterna				= origem.ds_observacao_movInterna
	,destino.cd_chaveSF2_movInterna					= origem.cd_chaveSF2_movInterna
	,destino.cd_dcf_movInterna						= origem.cd_dcf_movInterna
	,destino.ds_observ2_movInterna					= origem.ds_observ2_movInterna
	,destino.cd_fornecedorDoc_movInterna			= origem.cd_fornecedorDoc_movInterna
	,destino.cd_lojaDoc_movInterna					= origem.cd_lojaDoc_movInterna
	,destino.cd_perBlocoK_movInterna				= origem.cd_perBlocoK_movInterna
	,destino.cd_origem_movInterna					= origem.cd_origem_movInterna
	,destino.nm_usuarioInclusao_movInterna			= origem.nm_usuarioInclusao_movInterna
	,destino.cd_estaMat_movInterna					= origem.cd_estaMat_movInterna
	,destino.vl_percCreditoObra_movInterna			= origem.vl_percCreditoObra_movInterna
	,destino.cd_centroCustoOrigem_movInterna		= origem.cd_centroCustoOrigem_movInterna
	,destino.cd_chaveAcessoNF_movInterna			= origem.cd_chaveAcessoNF_movInterna
	,destino.vf_campoUUID_movInterna				= origem.vf_campoUUID_movInterna
	,destino.dt_alteracao							= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
	    origem.cd_filial_movInterna
		,origem.tp_movimento_movInterna
		,origem.cd_produto_movInterna
		,origem.cd_unidade_movInterna
		,origem.qt_movimento_movInterna
		,origem.tp_reDe_movInterna
		,origem.cd_contabil_movInterna
		,origem.cd_ordemProducao_movInterna
		,origem.cd_armazem_movInterna
		,origem.cd_documento_movInterna
		,origem.dt_emissao_movInterna
		,origem.cd_grupo_movInterna
		,origem.vl_custo1_movInterna
		,origem.vl_custo2_movInterna
		,origem.vl_custo3_movInterna
		,origem.vl_custo4_movInterna
		,origem.vl_custo5_movInterna
		,origem.cd_centroCusto_movInterna
		,origem.vf_parcialTotal_movInterna
		,origem.vf_estornardo_movInterna
		,origem.cd_sequencial_movInterna
		,origem.cd_segundaUnidade_movInterna
		,origem.qt_movimentoSegundaUnidade_movInterna
		,origem.cd_tipo_movInterna
		,origem.cd_nivelEstrutura_movInterna
		,origem.nm_usuario_movInterna
		,origem.cd_regraWms_movInterna
		,origem.vl_perda_movInterna
		,origem.dt_lancContabil_movInterna
		,origem.cd_sequencia_movInterna
		,origem.cd_chave_movInterna
		,origem.cd_operacaoPai_movInterna
		,origem.cd_seqRecalc_movInterna
		,origem.vl_porcRateio_movInterna
		,origem.cd_lote_movInterna
		,origem.cd_subLote_movInterna
		,origem.cd_validLote_movInterna
		,origem.cd_endereco_movInterna
		,origem.cd_numSerie_movInterna
		,origem.vl_custoFifo1_movInterna
		,origem.vl_custoFIfo2_movInterna
		,origem.vl_custoFifo3_movInterna
		,origem.vl_custoFifo4_movInterna
		,origem.vl_custoFifo5_movInterna
		,origem.cd_itemRemito_movInterna
		,origem.cd_verificacao_movInterna
		,origem.cd_itemConta_movInterna
		,origem.cd_clVal_movInterna
		,origem.cd_projeto_movInterna
		,origem.cd_tarefa_movInterna
		,origem.cd_ordemServico_movInterna
		,origem.cd_servico_movInterna
		,origem.cd_statusServico_movInterna
		,origem.cd_osAssinTec_movInterna
		,origem.vl_potenciaLote_movInterna
		,origem.cd_estrFisica_movInterna
		,origem.cd_regAtendim_movInterna
		,origem.cd_docSWN_movInterna
		,origem.cd_itemSWN_movInterna
		,origem.cd_itemGrade_movInterna
		,origem.tp_statusMov_movInterna
		,origem.vl_reposicao_movInterna
		,origem.vl_repos2am_movInterna
		,origem.vl_repos3am_movInterna
		,origem.vl_repos4am_movInterna
		,origem.vl_repos5am_movInterna
		,origem.vl_repUni_movInterna
		,origem.cd_moedaCrep_movInterna
		,origem.cd_revEstrutura_movInterna
		,origem.cd_procImport_movInterna
		,origem.cd_emenhoOP_movInterna
		,origem.vl_CSTFixo_movInterna
		,origem.vl_macroNutr_movInterna
		,origem.vl_microNutr_movInterna
		,origem.cd_moedaCfixo_movInterna
		,origem.cd_diario_movInterna
		,origem.vf_garantia_movInterna
		,origem.cd_seqDiario_movInterna
		,origem.cd_boletim_movInterna
		,origem.qt_ganho_movInterna
		,origem.qt_maior_movInterna
		,origem.cd_SA_movInterna
		,origem.cd_perImpo_movInterna
		,origem.vl_valorVi_movInterna
		,origem.cd_chaveNF_movInterna
		,origem.cd_desconto_movInterna
		,origem.cd_cat83_movInterna
		,origem.cd_marca_movInterna
		,origem.cd_itemSA_movInterna
		,origem.vl_PD_movInterna
		,origem.cd_tipoEntrada_movInterna
		,origem.cd_safra_movInterna
		,origem.cd_mercadoDeb_movInterna
		,origem.cd_mercadoCred_movInterna
		,origem.cd_modalidadeDeb_movInterna
		,origem.cd_modalidadeCred_movInterna
		,origem.cd_localDeb_movInterna
		,origem.cd_localCred_movInterna
		,origem.cd_atividadeDeb_movInterna
		,origem.cd_atividadeCred_movInterna
		,origem.cd_letraDeb_movInterna
		,origem.cd_letraCred_movInterna
		,origem.cd_tanque_movInterna
		,origem.vl_massaEsp_movInterna
		,origem.vl_tempAmostra_movInterna
		,origem.vl_tempTanque_movInterna
		,origem.vl_densAmbient_movInterna
		,origem.qt_ambiente_movInterna
		,origem.vl_fatorCorrecao_movInterna
		,origem.tp_movAjust_movInterna
		,origem.cd_fornecedor_movInterna
		,origem.cd_lojaFornecedor_movInterna
		,origem.cd_operacao_movInterna
		,origem.ds_observacao_movInterna
		,origem.cd_chaveSF2_movInterna
		,origem.cd_dcf_movInterna
		,origem.ds_observ2_movInterna
		,origem.cd_fornecedorDoc_movInterna
		,origem.cd_lojaDoc_movInterna
		,origem.cd_perBlocoK_movInterna
		,origem.cd_origem_movInterna
		,origem.nm_usuarioInclusao_movInterna
		,origem.cd_estaMat_movInterna
		,origem.vl_percCreditoObra_movInterna
		,origem.cd_centroCustoOrigem_movInterna
		,origem.cd_chaveAcessoNF_movInterna
		,origem.vf_campoUUID_movInterna
		,origem.[cd_recno_SD3]
		,origem.dt_criacao
		,origem.dt_alteracao								
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas


GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_NaoProcessadosRPA]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_tb_fat_NaoProcessadosRPA]

as 

declare @linhas int;

merge [dbo].[tb_fat_NaoProcessadosRPA] as destino

using (

	select
		[cd_ID]							= ID
      ,[dt_Data_do_Email]				= [Data do Email] 
      ,[ds_Origem_do_Email]				= [Origem do Email] 
      ,[dt_Data_do_processamento]		= [Data do Processamento] 
      ,[ds_Status]						= [Status] 
      ,[ds_Mensagem_de_Erro]			= [Mensagem de Erro] 
      ,[dt_criacao]						= getdate()
      ,[dt_alteracao]					= getdate()
	
	from [bi_rip_rawZone_bck].dbo.[Nao Processados] as NaoProcessadosRPA


) origem on  
(		
	origem.cd_ID = destino.cd_ID
)

WHEN MATCHED THEN
	UPDATE SET 
	
	 destino.cd_ID									= origem.cd_ID				
	,destino.dt_Data_do_Email						= origem.dt_Data_do_Email				
	,destino.ds_Origem_do_Email						= origem.ds_Origem_do_Email
	,destino.dt_Data_do_processamento				= origem.dt_Data_do_processamento
	,destino.ds_Status								= origem.ds_Status
	,destino.ds_Mensagem_de_Erro					= origem.ds_Mensagem_de_Erro
	,destino.dt_alteracao							= getdate()

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
			
			origem.cd_ID				
			,origem.dt_Data_do_Email		
			,origem.ds_Origem_do_Email
			,origem.dt_Data_do_processamento
			,origem.ds_Status
			,origem.ds_Mensagem_de_Erro
			,origem.dt_criacao							
			,origem.dt_alteracao
		)			

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas

GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_notasFiscaisEntrada]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE proc [dbo].[sp_tb_fat_notasFiscaisEntrada]

as

declare @parametro_retorno varchar(100)
execute @parametro_retorno  = sp_retornaParametroParaVariavel 'SF1010'

declare @linhas int;

merge tb_fat_notasFiscaisEntrada as destino

using (



	select 
	--sk_destino												= null
	 cc_pedidosComprasXnotasFiscaisEntrada					= D1_FILIAL+'|'+D1_PEDIDO+'|'+D1_ITEMPC+'|'+D1_FORNECE+'|'+D1_LOJA
	,cd_filial_notasFiscaisEntrada							= F1_FILIAL
	,nr_documento_notasFiscaisEntrada						= F1_DOC
	,nr_serieDocumento_notasFiscaisEntrada					= F1_SERIE
	,cd_fornecedor_notasFiscaisEntrada						= F1_FORNECE
	,cd_lojaFornecedor_notasFiscaisEntrada					= F1_LOJA
	,cd_condicaoPagamento_notasFiscaisEntrada				= F1_COND
	,nr_titulo_notasFiscaisEntrada							= F1_DUPL
	,dt_emissao_notasFiscaisEntrada							= iif(F1_EMISSAO='',null,DATEFROMPARTS(left(F1_EMISSAO,4),right(left(F1_EMISSAO,6),2),right(F1_EMISSAO,2))) 
	,nm_UnidadeFederal_notasFiscaisEntrada					= F1_EST
	,vl_frete_notasFiscaisEntrada							= F1_FRETE
	,vl_despesas_notasFiscaisEntrada						= F1_DESPESA
	,vl_baseIcm_notasFiscaisEntrada							= F1_BASEICM
	,vl_icm_notasFiscaisEntrada								= F1_VALICM
	,vl_baseIpi_notasFiscaisEntrada							= F1_BASEIPI
	,vl_ipi_notasFiscaisEntrada								= F1_VALIPI
	,vl_mercadoria_notasFiscaisEntrada						= F1_VALMERC
	,vl_bruto_notasFiscaisEntrada							= F1_VALBRUT
	,dt_digitacao_notasFiscaisEntrada						= iif(F1_DTDIGIT='',null,DATEFROMPARTS(left(F1_DTDIGIT,4),right(left(F1_DTDIGIT,6),2),right(F1_DTDIGIT,2))) 
	,dt_lancamento_notasFiscaisEntrada						= iif(F1_DTLANC='',null,DATEFROMPARTS(left(F1_DTLANC,4),right(left(F1_DTLANC,6),2),right(F1_DTLANC,2))) 
	,fl_importacao_notasFiscaisEntrada						= F1_IMPORT
	,vl_impostoImportacao_notasFiscaisEntrada				= F1_II
	,vl_inss_notasFiscaisEntrada							= F1_INSS
	,vl_iss_notasFiscaisEntrada								= F1_ISS
	,vl_icms_notasFiscaisEntrada							= F1_ICMS
	,st_notaFiscal_notasFiscaisEntrada						= F1_STATUS
	,dt_recebimento_notasFiscaisEntrada						= iif(F1_RECBMTO='',null,DATEFROMPARTS(left(F1_RECBMTO,4),right(left(F1_RECBMTO,6),2),right(F1_RECBMTO,2))) 
	,cd_notaFiscalEletronica_notasFiscaisEntrada			= F1_NFELETR
	,cd_emissaoNotaFicalEletronica_notasFiscaisEntrada		= F1_EMINFE
	,cd_filialOrigem_notasFiscaisEntrada					= F1_FILORIG
	,cd_clienteDestino_notasFiscaisEntrada					= F1_CLIDEST
	,cd_lojaClienteDestino_notasFiscaisEntrada				= F1_LOJDEST
	,cd_lojaClienteOrigem_notasFiscaisEntrada				= F1_LOJAORI
	,cd_fornecedorEntrega_notasFiscaisEntrada				= F1_FORENT
	,cd_fluig_notasFiscaisEntrada							= F1_ZZFLUIG
	,cd_filial_notasFiscaisEntradaItens						= D1_FILIAL
	,cd_item_notasFiscaisEntradaItens						= D1_ITEM
	,cd_produto_notasFiscaisEntradaItens					= D1_COD
	,ds_unidadeMedida_notasFiscaisEntradaItens				= D1_UM
	,qt_produto_notasFiscaisEntradaItens					= D1_QUANT
	,vl_unitario_notasFiscaisEntradaItens					= D1_VUNIT
	,vl_total_notasFiscaisEntradaItens						= D1_TOTAL
	,vl_ipi_notasFiscaisEntradaItens						= D1_VALIPI
	,vl_icm_notasFiscaisEntradaItens						= D1_VALICM
	,tp_entrada_notasFiscaisEntradaItens					= D1_TES
	,cd_ficalOperacao_notasFiscaisEntradaItens				= D1_CF
	,vl_desconto_notasFiscaisEntradaItens					= D1_DESC
	,vl_aliquotaIpi_notasFiscaisEntradaItens				= D1_IPI
	,vl_aliquotaIcms_notasFiscaisEntradaItens				= D1_PICM
	,cd_contaContabil_notasFiscaisEntradaItens				= D1_CONTA
	,cd_itemContaContabil_notasFiscaisEntradaItens			= D1_ITEMCTA
	,cd_centroCusto_notasFiscaisEntradaItens				= D1_CC
	,cd_pedidoCompra_notasFiscaisEntradaItens				= D1_PEDIDO
	,cd_itemPedidoCompra_notasFiscaisEntradaItens			= D1_ITEMPC
	,cd_forncedor_notasFiscaisEntradaItens					= D1_FORNECE
	,cd_lojaFornecedor_notasFiscaisEntradaItens				= D1_LOJA
	,cd_armazem_notasFiscaisEntradaItens					= D1_LOCAL
	,nr_documento_notasFiscaisEntradaItens					= D1_DOC
	,dt_emissao_notasFiscaisEntradaItens					= iif(D1_EMISSAO='',null,DATEFROMPARTS(left(D1_EMISSAO,4),right(left(D1_EMISSAO,6),2),right(D1_EMISSAO,2))) 
	,dt_digitacao_notasFiscaisEntradaItens					= iif(D1_DTDIGIT='',null,DATEFROMPARTS(left(D1_DTDIGIT,4),right(left(D1_DTDIGIT,6),2),right(D1_DTDIGIT,2))) 
	,cd_grupoProduto_notasFiscaisEntradaItens				= D1_GRUPO
	,tp_documento_notasFiscaisEntradaItens					= D1_TIPO
	,nr_serieNotaFical_notasFiscaisEntradaItens				= D1_SERIE
	,nr_documentoOriginal_notasFiscaisEntradaItens			= D1_NFORI
	,nr_serieDocumentoOriginal_notasFiscaisEntradaItens		= D1_SERIORI
	,nr_itemDocumentoOriginal_notasFiscaisEntradaItens		= D1_ITEMORI
	,qt_devolvida_notasFiscaisEntradaItens					= D1_QTDEDEV
	,vl_devolvido_notasFiscaisEntradaItens					= D1_VALDEV
	,dt_emissaoOriginal_notasFiscaisEntradaItens			= iif(D1_DATORI='',null,DATEFROMPARTS(left(D1_DATORI,4),right(left(D1_DATORI,6),2),right(D1_DATORI,2))) 
	,nr_imobilizado_notasFiscaisEntradaItens				= D1_CBASEAF
	,nr_tesClassificacao_notasFiscaisEntradaItens			= D1_TESACLA
	,cd_itemXml_notasFiscaisEntradaItens					= D1_ZZITAUX
	,tp_tesSugerida_notasFiscaisEntradaItens				= D1_ZZTES
	,vl_percentualReducaoIcmsXml_notasFiscaisEntradaItens	= D1_ZPREDIC
	,cd_recno_SF1											= sf1.R_E_C_N_O_
	,cd_recno_SD1											= sd1.R_E_C_N_O_
	,dt_criacao 											= getdate()
	,dt_alteracao											= getdate()

	from [bi_rip_rawZone_bck].dbo.SF1010 as sf1
	left join [bi_rip_rawZone_bck].dbo.SD1010 AS sd1
	on 
	sf1.F1_FILIAL = sd1.D1_FILIAL AND
	sf1.F1_DOC = sd1.D1_DOC AND 
	sf1.F1_SERIE = sd1.D1_SERIE AND
	sf1.F1_FORNECE = sd1.D1_FORNECE AND
	sf1.F1_LOJA = sd1.D1_LOJA AND 
	sf1.F1_FORMUL = sd1.D1_FORMUL and sd1.D_E_L_E_T_ = ''
	where sf1.D_E_L_E_T_ = '' 
	and (sf1.F1_EMISSAO >= @parametro_retorno OR sf1.F1_EMISSAO = '')


) origem on  
(		
	origem.cd_recno_SF1 = destino.cd_recno_SF1 and
	origem.cd_recno_SD1 = destino.cd_recno_SD1
)

WHEN MATCHED THEN
	UPDATE SET 
	 destino.cc_pedidosComprasXnotasFiscaisEntrada					= origem.cc_pedidosComprasXnotasFiscaisEntrada					
	,destino.cd_filial_notasFiscaisEntrada							= origem.cd_filial_notasFiscaisEntrada							
	,destino.nr_documento_notasFiscaisEntrada						= origem.nr_documento_notasFiscaisEntrada						
	,destino.nr_serieDocumento_notasFiscaisEntrada					= origem.nr_serieDocumento_notasFiscaisEntrada					
	,destino.cd_fornecedor_notasFiscaisEntrada						= origem.cd_fornecedor_notasFiscaisEntrada						
	,destino.cd_lojaFornecedor_notasFiscaisEntrada					= origem.cd_lojaFornecedor_notasFiscaisEntrada					
	,destino.cd_condicaoPagamento_notasFiscaisEntrada				= origem.cd_condicaoPagamento_notasFiscaisEntrada				
	,destino.nr_titulo_notasFiscaisEntrada							= origem.nr_titulo_notasFiscaisEntrada							
	,destino.dt_emissao_notasFiscaisEntrada							= origem.dt_emissao_notasFiscaisEntrada							
	,destino.nm_UnidadeFederal_notasFiscaisEntrada					= origem.nm_UnidadeFederal_notasFiscaisEntrada					
	,destino.vl_frete_notasFiscaisEntrada							= origem.vl_frete_notasFiscaisEntrada							
	,destino.vl_despesas_notasFiscaisEntrada						= origem.vl_despesas_notasFiscaisEntrada						
	,destino.vl_baseIcm_notasFiscaisEntrada							= origem.vl_baseIcm_notasFiscaisEntrada							
	,destino.vl_icm_notasFiscaisEntrada								= origem.vl_icm_notasFiscaisEntrada								
	,destino.vl_baseIpi_notasFiscaisEntrada							= origem.vl_baseIpi_notasFiscaisEntrada							
	,destino.vl_ipi_notasFiscaisEntrada								= origem.vl_ipi_notasFiscaisEntrada								
	,destino.vl_mercadoria_notasFiscaisEntrada						= origem.vl_mercadoria_notasFiscaisEntrada						
	,destino.vl_bruto_notasFiscaisEntrada							= origem.vl_bruto_notasFiscaisEntrada							
	,destino.dt_digitacao_notasFiscaisEntrada						= origem.dt_digitacao_notasFiscaisEntrada						
	,destino.dt_lancamento_notasFiscaisEntrada						= origem.dt_lancamento_notasFiscaisEntrada						
	,destino.fl_importacao_notasFiscaisEntrada						= origem.fl_importacao_notasFiscaisEntrada						
	,destino.vl_impostoImportacao_notasFiscaisEntrada				= origem.vl_impostoImportacao_notasFiscaisEntrada				
	,destino.vl_inss_notasFiscaisEntrada							= origem.vl_inss_notasFiscaisEntrada							
	,destino.vl_iss_notasFiscaisEntrada								= origem.vl_iss_notasFiscaisEntrada								
	,destino.vl_icms_notasFiscaisEntrada							= origem.vl_icms_notasFiscaisEntrada							
	,destino.st_notaFiscal_notasFiscaisEntrada						= origem.st_notaFiscal_notasFiscaisEntrada						
	,destino.dt_recebimento_notasFiscaisEntrada						= origem.dt_recebimento_notasFiscaisEntrada						
	,destino.cd_notaFiscalEletronica_notasFiscaisEntrada			= origem.cd_notaFiscalEletronica_notasFiscaisEntrada			
	,destino.cd_emissaoNotaFicalEletronica_notasFiscaisEntrada		= origem.cd_emissaoNotaFicalEletronica_notasFiscaisEntrada		
	,destino.cd_filialOrigem_notasFiscaisEntrada					= origem.cd_filialOrigem_notasFiscaisEntrada					
	,destino.cd_clienteDestino_notasFiscaisEntrada					= origem.cd_clienteDestino_notasFiscaisEntrada					
	,destino.cd_lojaClienteDestino_notasFiscaisEntrada				= origem.cd_lojaClienteDestino_notasFiscaisEntrada				
	,destino.cd_lojaClienteOrigem_notasFiscaisEntrada				= origem.cd_lojaClienteOrigem_notasFiscaisEntrada				
	,destino.cd_fornecedorEntrega_notasFiscaisEntrada				= origem.cd_fornecedorEntrega_notasFiscaisEntrada				
	,destino.cd_fluig_notasFiscaisEntrada							= origem.cd_fluig_notasFiscaisEntrada							
	,destino.cd_filial_notasFiscaisEntradaItens						= origem.cd_filial_notasFiscaisEntradaItens						
	,destino.cd_item_notasFiscaisEntradaItens						= origem.cd_item_notasFiscaisEntradaItens						
	,destino.cd_produto_notasFiscaisEntradaItens					= origem.cd_produto_notasFiscaisEntradaItens					
	,destino.ds_unidadeMedida_notasFiscaisEntradaItens				= origem.ds_unidadeMedida_notasFiscaisEntradaItens				
	,destino.qt_produto_notasFiscaisEntradaItens					= origem.qt_produto_notasFiscaisEntradaItens					
	,destino.vl_unitario_notasFiscaisEntradaItens					= origem.vl_unitario_notasFiscaisEntradaItens					
	,destino.vl_total_notasFiscaisEntradaItens						= origem.vl_total_notasFiscaisEntradaItens						
	,destino.vl_ipi_notasFiscaisEntradaItens						= origem.vl_ipi_notasFiscaisEntradaItens						
	,destino.vl_icm_notasFiscaisEntradaItens						= origem.vl_icm_notasFiscaisEntradaItens						
	,destino.tp_entrada_notasFiscaisEntradaItens					= origem.tp_entrada_notasFiscaisEntradaItens					
	,destino.cd_ficalOperacao_notasFiscaisEntradaItens				= origem.cd_ficalOperacao_notasFiscaisEntradaItens				
	,destino.vl_desconto_notasFiscaisEntradaItens					= origem.vl_desconto_notasFiscaisEntradaItens					
	,destino.vl_aliquotaIpi_notasFiscaisEntradaItens				= origem.vl_aliquotaIpi_notasFiscaisEntradaItens				
	,destino.vl_aliquotaIcms_notasFiscaisEntradaItens				= origem.vl_aliquotaIcms_notasFiscaisEntradaItens				
	,destino.cd_contaContabil_notasFiscaisEntradaItens				= origem.cd_contaContabil_notasFiscaisEntradaItens				
	,destino.cd_itemContaContabil_notasFiscaisEntradaItens			= origem.cd_itemContaContabil_notasFiscaisEntradaItens			
	,destino.cd_centroCusto_notasFiscaisEntradaItens				= origem.cd_centroCusto_notasFiscaisEntradaItens				
	,destino.cd_pedidoCompra_notasFiscaisEntradaItens				= origem.cd_pedidoCompra_notasFiscaisEntradaItens				
	,destino.cd_itemPedidoCompra_notasFiscaisEntradaItens			= origem.cd_itemPedidoCompra_notasFiscaisEntradaItens			
	,destino.cd_forncedor_notasFiscaisEntradaItens					= origem.cd_forncedor_notasFiscaisEntradaItens					
	,destino.cd_lojaFornecedor_notasFiscaisEntradaItens				= origem.cd_lojaFornecedor_notasFiscaisEntradaItens				
	,destino.cd_armazem_notasFiscaisEntradaItens					= origem.cd_armazem_notasFiscaisEntradaItens					
	,destino.nr_documento_notasFiscaisEntradaItens					= origem.nr_documento_notasFiscaisEntradaItens					
	,destino.dt_emissao_notasFiscaisEntradaItens					= origem.dt_emissao_notasFiscaisEntradaItens					
	,destino.dt_digitacao_notasFiscaisEntradaItens					= origem.dt_digitacao_notasFiscaisEntradaItens					
	,destino.cd_grupoProduto_notasFiscaisEntradaItens				= origem.cd_grupoProduto_notasFiscaisEntradaItens				
	,destino.tp_documento_notasFiscaisEntradaItens					= origem.tp_documento_notasFiscaisEntradaItens					
	,destino.nr_serieNotaFical_notasFiscaisEntradaItens				= origem.nr_serieNotaFical_notasFiscaisEntradaItens				
	,destino.nr_documentoOriginal_notasFiscaisEntradaItens			= origem.nr_documentoOriginal_notasFiscaisEntradaItens			
	,destino.nr_serieDocumentoOriginal_notasFiscaisEntradaItens		= origem.nr_serieDocumentoOriginal_notasFiscaisEntradaItens		
	,destino.nr_itemDocumentoOriginal_notasFiscaisEntradaItens		= origem.nr_itemDocumentoOriginal_notasFiscaisEntradaItens		
	,destino.qt_devolvida_notasFiscaisEntradaItens					= origem.qt_devolvida_notasFiscaisEntradaItens					
	,destino.vl_devolvido_notasFiscaisEntradaItens					= origem.vl_devolvido_notasFiscaisEntradaItens					
	,destino.dt_emissaoOriginal_notasFiscaisEntradaItens			= origem.dt_emissaoOriginal_notasFiscaisEntradaItens			
	,destino.nr_imobilizado_notasFiscaisEntradaItens				= origem.nr_imobilizado_notasFiscaisEntradaItens				
	,destino.nr_tesClassificacao_notasFiscaisEntradaItens			= origem.nr_tesClassificacao_notasFiscaisEntradaItens			
	,destino.cd_itemXml_notasFiscaisEntradaItens					= origem.cd_itemXml_notasFiscaisEntradaItens					
	,destino.tp_tesSugerida_notasFiscaisEntradaItens				= origem.tp_tesSugerida_notasFiscaisEntradaItens				
	,destino.vl_percentualReducaoIcmsXml_notasFiscaisEntradaItens	= origem.vl_percentualReducaoIcmsXml_notasFiscaisEntradaItens
	,dt_alteracao													= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		 origem.cc_pedidosComprasXnotasFiscaisEntrada					
		,origem.cd_filial_notasFiscaisEntrada							
		,origem.nr_documento_notasFiscaisEntrada						
		,origem.nr_serieDocumento_notasFiscaisEntrada					
		,origem.cd_fornecedor_notasFiscaisEntrada						
		,origem.cd_lojaFornecedor_notasFiscaisEntrada					
		,origem.cd_condicaoPagamento_notasFiscaisEntrada				
		,origem.nr_titulo_notasFiscaisEntrada							
		,origem.dt_emissao_notasFiscaisEntrada							
		,origem.nm_UnidadeFederal_notasFiscaisEntrada					
		,origem.vl_frete_notasFiscaisEntrada							
		,origem.vl_despesas_notasFiscaisEntrada						
		,origem.vl_baseIcm_notasFiscaisEntrada							
		,origem.vl_icm_notasFiscaisEntrada								
		,origem.vl_baseIpi_notasFiscaisEntrada							
		,origem.vl_ipi_notasFiscaisEntrada								
		,origem.vl_mercadoria_notasFiscaisEntrada						
		,origem.vl_bruto_notasFiscaisEntrada							
		,origem.dt_digitacao_notasFiscaisEntrada						
		,origem.dt_lancamento_notasFiscaisEntrada						
		,origem.fl_importacao_notasFiscaisEntrada						
		,origem.vl_impostoImportacao_notasFiscaisEntrada				
		,origem.vl_inss_notasFiscaisEntrada							
		,origem.vl_iss_notasFiscaisEntrada								
		,origem.vl_icms_notasFiscaisEntrada							
		,origem.st_notaFiscal_notasFiscaisEntrada						
		,origem.dt_recebimento_notasFiscaisEntrada						
		,origem.cd_notaFiscalEletronica_notasFiscaisEntrada			
		,origem.cd_emissaoNotaFicalEletronica_notasFiscaisEntrada		
		,origem.cd_filialOrigem_notasFiscaisEntrada					
		,origem.cd_clienteDestino_notasFiscaisEntrada					
		,origem.cd_lojaClienteDestino_notasFiscaisEntrada				
		,origem.cd_lojaClienteOrigem_notasFiscaisEntrada				
		,origem.cd_fornecedorEntrega_notasFiscaisEntrada				
		,origem.cd_fluig_notasFiscaisEntrada							
		,origem.cd_filial_notasFiscaisEntradaItens						
		,origem.cd_item_notasFiscaisEntradaItens						
		,origem.cd_produto_notasFiscaisEntradaItens					
		,origem.ds_unidadeMedida_notasFiscaisEntradaItens				
		,origem.qt_produto_notasFiscaisEntradaItens					
		,origem.vl_unitario_notasFiscaisEntradaItens					
		,origem.vl_total_notasFiscaisEntradaItens						
		,origem.vl_ipi_notasFiscaisEntradaItens						
		,origem.vl_icm_notasFiscaisEntradaItens						
		,origem.tp_entrada_notasFiscaisEntradaItens					
		,origem.cd_ficalOperacao_notasFiscaisEntradaItens				
		,origem.vl_desconto_notasFiscaisEntradaItens					
		,origem.vl_aliquotaIpi_notasFiscaisEntradaItens				
		,origem.vl_aliquotaIcms_notasFiscaisEntradaItens				
		,origem.cd_contaContabil_notasFiscaisEntradaItens				
		,origem.cd_itemContaContabil_notasFiscaisEntradaItens			
		,origem.cd_centroCusto_notasFiscaisEntradaItens				
		,origem.cd_pedidoCompra_notasFiscaisEntradaItens				
		,origem.cd_itemPedidoCompra_notasFiscaisEntradaItens			
		,origem.cd_forncedor_notasFiscaisEntradaItens					
		,origem.cd_lojaFornecedor_notasFiscaisEntradaItens				
		,origem.cd_armazem_notasFiscaisEntradaItens					
		,origem.nr_documento_notasFiscaisEntradaItens					
		,origem.dt_emissao_notasFiscaisEntradaItens					
		,origem.dt_digitacao_notasFiscaisEntradaItens					
		,origem.cd_grupoProduto_notasFiscaisEntradaItens				
		,origem.tp_documento_notasFiscaisEntradaItens					
		,origem.nr_serieNotaFical_notasFiscaisEntradaItens				
		,origem.nr_documentoOriginal_notasFiscaisEntradaItens			
		,origem.nr_serieDocumentoOriginal_notasFiscaisEntradaItens		
		,origem.nr_itemDocumentoOriginal_notasFiscaisEntradaItens		
		,origem.qt_devolvida_notasFiscaisEntradaItens					
		,origem.vl_devolvido_notasFiscaisEntradaItens					
		,origem.dt_emissaoOriginal_notasFiscaisEntradaItens			
		,origem.nr_imobilizado_notasFiscaisEntradaItens				
		,origem.nr_tesClassificacao_notasFiscaisEntradaItens			
		,origem.cd_itemXml_notasFiscaisEntradaItens					
		,origem.tp_tesSugerida_notasFiscaisEntradaItens				
		,origem.vl_percentualReducaoIcmsXml_notasFiscaisEntradaItens	
		,origem.cd_recno_SF1											
		,origem.cd_recno_SD1											
		,origem.dt_criacao 											
		,origem.dt_alteracao																			
		)

WHEN NOT MATCHED BY SOURCE and 

	 (destino.dt_emissao_notasFiscaisEntrada >=
		 iif(@parametro_retorno=0
				,'1900-01-01'
					,DATEFROMPARTS(left(@parametro_retorno,4),right(left(@parametro_retorno,6),2),right(@parametro_retorno,2)))
		or destino.dt_emissao_notasFiscaisEntrada is null)

	THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas
GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_notasFiscaisSaida]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE proc [dbo].[sp_tb_fat_notasFiscaisSaida]

as

declare @parametro_retorno varchar(100)
execute @parametro_retorno  = sp_retornaParametroParaVariavel 'SF2010'
declare @linhas int


merge tb_fat_notasFiscaisSaida as destino

using (


	select 
	--sk_destino											= null
	cc_pedidosVendasXnotasFiscaisSaida						= F2_FILIAL+'|'+F2_DOC+'|'+F2_SERIE+'|'+F2_CLIENTE+'|'+F2_LOJA+'|'+D2_ITEMPV --- add 14/10 +D2_ITEMPV
	,cd_filial_notasFiscaisSaida							= F2_FILIAL 
	,nr_documento_notasFiscaisSaida							= F2_DOC
	,nr_serieDocumento_notasFiscaisSaida					= F2_SERIE
	,cd_cliente_notasFiscaisSaida							= F2_CLIENTE
	,cd_loja_notasFiscaisSaida								= F2_LOJA
	,cd_condicaoPagamento_notasFiscaisSaida					= F2_COND
	,dt_emissao_notasFiscaisSaida							= iif(F2_EMISSAO='',null,DATEFROMPARTS(left(F2_EMISSAO,4),right(left(F2_EMISSAO,6),2),right(F2_EMISSAO,2)))
	,cd_cpfCnpjCliente_notasFiscaisSaida					= F2_CGCCLI
	,st_notaFiscal_notasFiscaisSaida						= F2_STATUS
	,cd_localTrabalho_notasFiscaisSaida								= F2_ZLOCPAP
	,cd_mds_notasFiscaisSaida								= F2_PAFMD5
	,cd_municipio_notasFiscaisSaida							= F2_CMUNOR
	,cd_notaFiscal_notasFiscaisSaida						= F2_IDNF
	,cd_unidadeFederalDestino_notasFiscaisSaida				= F2_UFDEST
	,cd_unidadeFederalOrigem_notasFiscaisSaida				= F2_UFORIG
	,cd_clienteRemessa_notasFiscaisSaida					= F2_CLIREM
	,cd_lojaRemessa_notasFiscaisSaida						= F2_LOJAREM
	,cd_filial_notasFiscaisSaidaItens						= D2_FILIAL
	,cd_item_notasFiscaisSaidaItens							= D2_ITEM
	,cd_produto_notasFiscaisSaidaItens						= D2_COD
	,ds_unidadeMedida_notasFiscaisSaidaItens				= D2_UM
	,qt_produto_notasFiscaisSaidaItens						= D2_QUANT
	,vl_unitario_notasFiscaisSaidaItens						= D2_PRCVEN
	,vl_total_notasFiscaisSaidaItens						= D2_TOTAL
	,vl_ipi_notasFiscaisSaidaItens							= D2_VALIPI
	,vl_icm_notasFiscaisSaidaItens							= D2_VALICM
	,tp_saida_notasFiscaisSaidaItens						= D2_TES
	,cd_fiscal_notasFiscaisSaidaItens						= D2_CF
	,cd_pedidoCompra_notasFiscaisSaidaItens					= D2_PEDIDO  --- alterar para PedidoVenda
	,cd_itemPedidoVenda_notasFiscaisSaidaItens				= D2_ITEMPV
	,cd_cliente_notasFiscaisSaidaItens						= D2_CLIENTE
	,cd_lojaCliente_notasFiscaisSaidaItens					= D2_LOJA
	,cd_armazem_notasFiscaisSaidaItens						= D2_LOCAL
	,cd_notaFiscal_notasFiscaisSaidaItens					= D2_DOC
	,cd_serieNotaFiscal_notasFiscaisSaidaItens				= D2_SERIE
	,cd_grupoProduto_notasFiscaisSaidaItens					= D2_GRUPO
	,tp_produto_notasFiscaisSaidaItens						= D2_TP
	,dt_emissao_notasFiscaisSaidaItens						= iif(D2_EMISSAO='',null,DATEFROMPARTS(left(D2_EMISSAO,4),right(left(D2_EMISSAO,6),2),right(D2_EMISSAO,2)))
	,nr_sequencial_notasFiscaisSaidaItens					= D2_NUMSEQ
	,cd_notaFiscalOriginal_notasFiscaisSaidaItens			= D2_NFORI
	,nr_serieNotaFiscalOriginal_notasFiscaisSaidaItens		= D2_SERIORI
	,qt_devolvida_notasFiscaisSaidaItens					= D2_QTDEDEV
	,vl_devolvido_notasFiscaisSaidaItens					= D2_VALDEV
	,cd_identificadorPoder_notasFiscaisSaidaItens			= D2_IDENTB6
	,cd_centroCusto_notasFiscaisSaidaItens					= D2_CCUSTO
	,cd_servivo_notasFiscaisSaidaItens						= D2_SERVIC
	,st_servico_notasFiscaisSaidaItens						= D2_STSERV
	,dt_digitacao_notasFiscaisSaidaItens					= iif(D2_DTDIGIT='',null,DATEFROMPARTS(left(D2_DTDIGIT,4),right(left(D2_DTDIGIT,6),2),right(D2_DTDIGIT,2))) 
	,fl_movimentaEstoque_notasFiscaisSaidaItens				= D2_ESTOQUE
	,cd_md5_notasFiscaisSaidaItens							= D2_PAFMD5
	,cd_recno_SF2											= sf2.R_E_C_N_O_
	,cd_recno_SD2											= sd2.R_E_C_N_O_
	,dt_criacao												= getdate()
	,dt_alteracao 											= getdate()

	from bi_rip_rawZone_bck.dbo.SF2010 as sf2
	left join bi_rip_rawZone_bck.dbo.SD2010 as sd2 on
	sf2.F2_FILIAL = sd2.D2_FILIAL AND
	sf2.F2_DOC = sd2.D2_DOC AND 
	sf2.F2_SERIE = sd2.D2_SERIE AND
	sf2.F2_CLIENTE = sd2.D2_CLIENTE AND
	sf2.F2_LOJA = sd2.D2_LOJA and sd2.D_E_L_E_T_ = ''
	where 
		(sf2.F2_EMISSAO >= @parametro_retorno OR sf2.F2_EMISSAO = '')
	and (sf2.D_E_L_E_T_ = '')

) origem on  
(		
	origem.cd_recno_SF2 = destino.cd_recno_SF2 and
	origem.cd_recno_SD2 = destino.cd_recno_SD2
)

WHEN MATCHED THEN
	UPDATE SET 
	 destino.cc_pedidosVendasXnotasFiscaisSaida						= origem.cc_pedidosVendasXnotasFiscaisSaida						
	,destino.cd_filial_notasFiscaisSaida							= origem.cd_filial_notasFiscaisSaida							
	,destino.nr_documento_notasFiscaisSaida							= origem.nr_documento_notasFiscaisSaida							
	,destino.nr_serieDocumento_notasFiscaisSaida					= origem.nr_serieDocumento_notasFiscaisSaida					
	,destino.cd_cliente_notasFiscaisSaida							= origem.cd_cliente_notasFiscaisSaida							
	,destino.cd_loja_notasFiscaisSaida								= origem.cd_loja_notasFiscaisSaida								
	,destino.cd_condicaoPagamento_notasFiscaisSaida					= origem.cd_condicaoPagamento_notasFiscaisSaida					
	,destino.dt_emissao_notasFiscaisSaida							= origem.dt_emissao_notasFiscaisSaida							
	,destino.cd_cpfCnpjCliente_notasFiscaisSaida					= origem.cd_cpfCnpjCliente_notasFiscaisSaida					
	,destino.st_notaFiscal_notasFiscaisSaida						= origem.st_notaFiscal_notasFiscaisSaida						
	,destino.cd_localTrabalho_notasFiscaisSaida						= origem.cd_localTrabalho_notasFiscaisSaida								
	,destino.cd_mds_notasFiscaisSaida								= origem.cd_mds_notasFiscaisSaida								
	,destino.cd_municipio_notasFiscaisSaida							= origem.cd_municipio_notasFiscaisSaida							
	,destino.cd_notaFiscal_notasFiscaisSaida						= origem.cd_notaFiscal_notasFiscaisSaida						
	,destino.cd_unidadeFederalDestino_notasFiscaisSaida				= origem.cd_unidadeFederalDestino_notasFiscaisSaida				
	,destino.cd_unidadeFederalOrigem_notasFiscaisSaida				= origem.cd_unidadeFederalOrigem_notasFiscaisSaida				
	,destino.cd_clienteRemessa_notasFiscaisSaida					= origem.cd_clienteRemessa_notasFiscaisSaida					
	,destino.cd_lojaRemessa_notasFiscaisSaida						= origem.cd_lojaRemessa_notasFiscaisSaida						
	,destino.cd_filial_notasFiscaisSaidaItens						= origem.cd_filial_notasFiscaisSaidaItens						
	,destino.cd_item_notasFiscaisSaidaItens							= origem.cd_item_notasFiscaisSaidaItens							
	,destino.cd_produto_notasFiscaisSaidaItens						= origem.cd_produto_notasFiscaisSaidaItens						
	,destino.ds_unidadeMedida_notasFiscaisSaidaItens				= origem.ds_unidadeMedida_notasFiscaisSaidaItens				
	,destino.qt_produto_notasFiscaisSaidaItens						= origem.qt_produto_notasFiscaisSaidaItens						
	,destino.vl_unitario_notasFiscaisSaidaItens						= origem.vl_unitario_notasFiscaisSaidaItens						
	,destino.vl_total_notasFiscaisSaidaItens						= origem.vl_total_notasFiscaisSaidaItens						
	,destino.vl_ipi_notasFiscaisSaidaItens							= origem.vl_ipi_notasFiscaisSaidaItens							
	,destino.vl_icm_notasFiscaisSaidaItens							= origem.vl_icm_notasFiscaisSaidaItens							
	,destino.tp_saida_notasFiscaisSaidaItens						= origem.tp_saida_notasFiscaisSaidaItens						
	,destino.cd_fiscal_notasFiscaisSaidaItens						= origem.cd_fiscal_notasFiscaisSaidaItens						
	,destino.cd_pedidoCompra_notasFiscaisSaidaItens					= origem.cd_pedidoCompra_notasFiscaisSaidaItens					
	,destino.cd_itemPedidoVenda_notasFiscaisSaidaItens				= origem.cd_itemPedidoVenda_notasFiscaisSaidaItens				
	,destino.cd_cliente_notasFiscaisSaidaItens						= origem.cd_cliente_notasFiscaisSaidaItens						
	,destino.cd_lojaCliente_notasFiscaisSaidaItens					= origem.cd_lojaCliente_notasFiscaisSaidaItens					
	,destino.cd_armazem_notasFiscaisSaidaItens						= origem.cd_armazem_notasFiscaisSaidaItens						
	,destino.cd_notaFiscal_notasFiscaisSaidaItens					= origem.cd_notaFiscal_notasFiscaisSaidaItens					
	,destino.cd_serieNotaFiscal_notasFiscaisSaidaItens				= origem.cd_serieNotaFiscal_notasFiscaisSaidaItens				
	,destino.cd_grupoProduto_notasFiscaisSaidaItens					= origem.cd_grupoProduto_notasFiscaisSaidaItens					
	,destino.tp_produto_notasFiscaisSaidaItens						= origem.tp_produto_notasFiscaisSaidaItens						
	,destino.dt_emissao_notasFiscaisSaidaItens						= origem.dt_emissao_notasFiscaisSaidaItens						
	,destino.nr_sequencial_notasFiscaisSaidaItens					= origem.nr_sequencial_notasFiscaisSaidaItens					
	,destino.cd_notaFiscalOriginal_notasFiscaisSaidaItens			= origem.cd_notaFiscalOriginal_notasFiscaisSaidaItens			
	,destino.nr_serieNotaFiscalOriginal_notasFiscaisSaidaItens		= origem.nr_serieNotaFiscalOriginal_notasFiscaisSaidaItens		
	,destino.qt_devolvida_notasFiscaisSaidaItens					= origem.qt_devolvida_notasFiscaisSaidaItens					
	,destino.vl_devolvido_notasFiscaisSaidaItens					= origem.vl_devolvido_notasFiscaisSaidaItens					
	,destino.cd_identificadorPoder_notasFiscaisSaidaItens			= origem.cd_identificadorPoder_notasFiscaisSaidaItens			
	,destino.cd_centroCusto_notasFiscaisSaidaItens					= origem.cd_centroCusto_notasFiscaisSaidaItens					
	,destino.cd_servivo_notasFiscaisSaidaItens						= origem.cd_servivo_notasFiscaisSaidaItens						
	,destino.st_servico_notasFiscaisSaidaItens						= origem.st_servico_notasFiscaisSaidaItens						
	,destino.dt_digitacao_notasFiscaisSaidaItens					= origem.dt_digitacao_notasFiscaisSaidaItens					
	,destino.fl_movimentaEstoque_notasFiscaisSaidaItens				= origem.fl_movimentaEstoque_notasFiscaisSaidaItens				
	,destino.cd_md5_notasFiscaisSaidaItens							= origem.cd_md5_notasFiscaisSaidaItens							
	,destino.dt_alteracao											= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		 origem.cc_pedidosVendasXnotasFiscaisSaida						
		,origem.cd_filial_notasFiscaisSaida							
		,origem.nr_documento_notasFiscaisSaida							
		,origem.nr_serieDocumento_notasFiscaisSaida					
		,origem.cd_cliente_notasFiscaisSaida							
		,origem.cd_loja_notasFiscaisSaida								
		,origem.cd_condicaoPagamento_notasFiscaisSaida					
		,origem.dt_emissao_notasFiscaisSaida							
		,origem.cd_cpfCnpjCliente_notasFiscaisSaida					
		,origem.st_notaFiscal_notasFiscaisSaida						
		,origem.cd_localTrabalho_notasFiscaisSaida								
		,origem.cd_mds_notasFiscaisSaida								
		,origem.cd_municipio_notasFiscaisSaida							
		,origem.cd_notaFiscal_notasFiscaisSaida						
		,origem.cd_unidadeFederalDestino_notasFiscaisSaida				
		,origem.cd_unidadeFederalOrigem_notasFiscaisSaida				
		,origem.cd_clienteRemessa_notasFiscaisSaida					
		,origem.cd_lojaRemessa_notasFiscaisSaida						
		,origem.cd_filial_notasFiscaisSaidaItens						
		,origem.cd_item_notasFiscaisSaidaItens							
		,origem.cd_produto_notasFiscaisSaidaItens						
		,origem.ds_unidadeMedida_notasFiscaisSaidaItens				
		,origem.qt_produto_notasFiscaisSaidaItens						
		,origem.vl_unitario_notasFiscaisSaidaItens						
		,origem.vl_total_notasFiscaisSaidaItens						
		,origem.vl_ipi_notasFiscaisSaidaItens							
		,origem.vl_icm_notasFiscaisSaidaItens							
		,origem.tp_saida_notasFiscaisSaidaItens						
		,origem.cd_fiscal_notasFiscaisSaidaItens						
		,origem.cd_pedidoCompra_notasFiscaisSaidaItens					
		,origem.cd_itemPedidoVenda_notasFiscaisSaidaItens				
		,origem.cd_cliente_notasFiscaisSaidaItens						
		,origem.cd_lojaCliente_notasFiscaisSaidaItens					
		,origem.cd_armazem_notasFiscaisSaidaItens						
		,origem.cd_notaFiscal_notasFiscaisSaidaItens					
		,origem.cd_serieNotaFiscal_notasFiscaisSaidaItens				
		,origem.cd_grupoProduto_notasFiscaisSaidaItens					
		,origem.tp_produto_notasFiscaisSaidaItens						
		,origem.dt_emissao_notasFiscaisSaidaItens						
		,origem.nr_sequencial_notasFiscaisSaidaItens					
		,origem.cd_notaFiscalOriginal_notasFiscaisSaidaItens			
		,origem.nr_serieNotaFiscalOriginal_notasFiscaisSaidaItens		
		,origem.qt_devolvida_notasFiscaisSaidaItens					
		,origem.vl_devolvido_notasFiscaisSaidaItens					
		,origem.cd_identificadorPoder_notasFiscaisSaidaItens			
		,origem.cd_centroCusto_notasFiscaisSaidaItens					
		,origem.cd_servivo_notasFiscaisSaidaItens						
		,origem.st_servico_notasFiscaisSaidaItens						
		,origem.dt_digitacao_notasFiscaisSaidaItens					
		,origem.fl_movimentaEstoque_notasFiscaisSaidaItens				
		,origem.cd_md5_notasFiscaisSaidaItens							
		,origem.cd_recno_SF2											
		,origem.cd_recno_SD2											
		,origem.dt_criacao												
		,origem.dt_alteracao 																										
		)

WHEN NOT MATCHED BY SOURCE and


	 (destino.dt_emissao_notasFiscaisSaida >=
		 iif(@parametro_retorno=0
				,'1900-01-01'
					,DATEFROMPARTS(left(@parametro_retorno,4),right(left(@parametro_retorno,6),2),right(@parametro_retorno,2)))
		or destino.dt_emissao_notasFiscaisSaida is null)


	 THEN
	
	DELETE;

set @linhas = @@ROWCOUNT;

return @linhas
GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_pedidosCompras]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







--- exec [dbo].[sp_tb_fat_pedidosCompras]

CREATE proc [dbo].[sp_tb_fat_pedidosCompras]

as

begin


declare @parametro_retorno varchar(100)
execute @parametro_retorno  = sp_retornaParametroParaVariavel 'SC7010'

declare @linhas int 

merge tb_fat_pedidosCompras as destino

using (

	SELECT 

	 cc_solicitacoesComprasXpedidosCompras					= C7_FILIAL+'|'+C7_NUM+'|'+C7_ITEM+'|'+C7_PRODUTO --- C7_FILIAL+'|'+C7_NUMSC+'|'+C7_ITEMSC mudando 20/12/21
	,cc_pedidosComprasXnotasFiscaisEntrada					= C7_FILIAL+'|'+C7_NUM+'|'+C7_ITEM+'|'+C7_FORNECE+'|'+C7_LOJA
	,cd_filial_pedidosCompras								= C7_FILIAL
	,cd_item_pedidosCompras									= C7_ITEM
	,cd_produto_pedidosCompras								= C7_PRODUTO
	,ds_unidadeMedida_pedidosCompras						= C7_UM
	,qt_pedido_pedidosCompras								= C7_QUANT
	,cd_tabelaPreco_pedidosCompras							= C7_CODTAB
	,vl_unitario_pedidosCompras								= C7_PRECO
	,vl_total_pedidosCompras								= C7_TOTAL
	,nr_solicitacao_pedidosCompras							= C7_NUMSC
	,cd_itemSolicitacao_pedidosCompras						= C7_ITEMSC
	,dt_inicioCompra_pedidosCompras							= iif(C7_DINICOM='',null,DATEFROMPARTS(left(C7_DINICOM,4),right(left(C7_DINICOM,6),2),right(C7_DINICOM,2)))  
	,dt_entrega_pedidosCompras								= iif(C7_DATPRF='',null,DATEFROMPARTS(left(C7_DATPRF,4),right(left(C7_DATPRF,6),2),right(C7_DATPRF,2)))  
	,cd_armazem_pedidosCompras								= C7_LOCAL
	,ds_observacao_pedidosCompras							= C7_OBS
	,cd_fornecedor_pedidosCompras							= C7_FORNECE
	,cd_centroCusto_pedidosCompras							= C7_CC
	,cd_contaContabil_pedidosCompras						= C7_CONTA
	,cd_itemContaContabil_pedidosCompras					= C7_ITEMCTA
	,cd_lojaForncedor_pedidosCompras						= C7_LOJA
	,cd_condicaoPagamento_pedidosCompras					= C7_COND
	,cd_contato_pedidosCompras								= C7_CONTATO
	,cd_filialEntrega_pedidosCompras						= C7_FILENT
	,dt_emissao_pedidosCompras								= iif(C7_EMISSAO='',null,DATEFROMPARTS(left(C7_EMISSAO,4),right(left(C7_EMISSAO,6),2),right(C7_EMISSAO,2))) 
	,nr_pedidoCompra_pedidosCompras							= C7_NUM
	,qtd_jaEntregue_pedidosCompras							= C7_QUJE
	,ds_produto_pedidosCompras								= C7_DESCRI
	,fl_residuoEliminado_pedidosCompras						= C7_RESIDUO
	,nr_cotacao_pedidosCompras								= C7_NUMCOT
	,ds_mensagem_pedidosCompras								= C7_MSG
	,fl_transmissao_pedidosCompras							= C7_TX
	,fl_pedidoEncerrado_pedidosCompras						= C7_ENCER
	,cd_grupoAprovacao_pedidosCompras						= C7_APROV
	,fl_controleAprovacao_pedidosCompras					= C7_CONAPRO
	,cd_grupoCopradores_pedidosCompras						= C7_GRUPCOM
	,cd_usuario_pedidosCompras								= C7_USER
	,fl_eliminadoRemanescente_pedidosCompras				= C7_RESREM
	,qt_solicitada_pedidosCompras							= C7_QTDSOL
	,vl_ipi_pedidosCompras									= C7_VALIPI
	,vl_icms_pedidosCompras									= C7_VALICM
	,tp_entradaNota_pedidosCompras							= C7_TES
	,fl_atualizaEstoque_pedidosCompras						= C7_ESTOQUE
	,nm_solicitante_pedidosCompras							= C7_SOLICIT
	,dt_contabilizacao_pedidosCompras						= iif(C7_DTLANC='',null,DATEFROMPARTS(left(C7_DTLANC,4),right(left(C7_DTLANC,6),2),right(C7_DTLANC,2))) 
	,cd_origem_pedidosCompras								= C7_ORIGIMP
	,cd_destino_pedidosCompras								= C7_DEST
	,cd_comprador_pedidosCompras							= C7_COMPRA
	,dt_conferencia_pedidosCompras							= iif(C7_CONF_PE='',null,DATEFROMPARTS(left(C7_CONF_PE,4),right(left(C7_CONF_PE,6),2),right(C7_CONF_PE,2))) 
	,tp_compra_pedidosCompras								= C7_TIPCOM
	,cd_filialOrigem_pedidosCompras							= C7_FISCORI
	,nr_fluig_pedidosCompras								= C7_ZZFLUIG
	,cd_natureza_pedidosCompras								= C7_ZNATURE
	,fl_faturamentoDireto_pedidosCompras					= C7_FATDIRE
	,cd_recno_SC7											= R_E_C_N_O_
	,dt_criacao												= getdate()
	,dt_alteracao											= getdate()

	FROM [bi_rip_rawZone_bck].dbo.SC7010 as sc7
	WHERE (C7_EMISSAO >= @parametro_retorno OR C7_EMISSAO ='')
	and D_E_L_E_T_ = ''

) origem on  
(		
	origem.cd_recno_SC7 = destino.cd_recno_SC7
)

WHEN MATCHED THEN
	UPDATE SET 
	 destino.cc_solicitacoesComprasXpedidosCompras						= origem.cc_solicitacoesComprasXpedidosCompras					
	,destino.cc_pedidosComprasXnotasFiscaisEntrada						= origem.cc_pedidosComprasXnotasFiscaisEntrada					
	,destino.cd_filial_pedidosCompras									= origem.cd_filial_pedidosCompras								
	,destino.cd_item_pedidosCompras										= origem.cd_item_pedidosCompras									
	,destino.cd_produto_pedidosCompras									= origem.cd_produto_pedidosCompras								
	,destino.ds_unidadeMedida_pedidosCompras							= origem.ds_unidadeMedida_pedidosCompras						
	,destino.qt_pedido_pedidosCompras									= origem.qt_pedido_pedidosCompras								
	,destino.cd_tabelaPreco_pedidosCompras								= origem.cd_tabelaPreco_pedidosCompras							
	,destino.vl_unitario_pedidosCompras									= origem.vl_unitario_pedidosCompras								
	,destino.vl_total_pedidosCompras									= origem.vl_total_pedidosCompras								
	,destino.nr_solicitacao_pedidosCompras								= origem.nr_solicitacao_pedidosCompras							
	,destino.cd_itemSolicitacao_pedidosCompras							= origem.cd_itemSolicitacao_pedidosCompras						
	,destino.dt_inicioCompra_pedidosCompras								= origem.dt_inicioCompra_pedidosCompras							
	,destino.dt_entrega_pedidosCompras									= origem.dt_entrega_pedidosCompras								
	,destino.cd_armazem_pedidosCompras									= origem.cd_armazem_pedidosCompras								
	,destino.ds_observacao_pedidosCompras								= origem.ds_observacao_pedidosCompras							
	,destino.cd_fornecedor_pedidosCompras								= origem.cd_fornecedor_pedidosCompras							
	,destino.cd_centroCusto_pedidosCompras								= origem.cd_centroCusto_pedidosCompras							
	,destino.cd_contaContabil_pedidosCompras							= origem.cd_contaContabil_pedidosCompras						
	,destino.cd_itemContaContabil_pedidosCompras						= origem.cd_itemContaContabil_pedidosCompras					
	,destino.cd_lojaForncedor_pedidosCompras							= origem.cd_lojaForncedor_pedidosCompras						
	,destino.cd_condicaoPagamento_pedidosCompras						= origem.cd_condicaoPagamento_pedidosCompras					
	,destino.cd_contato_pedidosCompras									= origem.cd_contato_pedidosCompras								
	,destino.cd_filialEntrega_pedidosCompras							= origem.cd_filialEntrega_pedidosCompras						
	,destino.dt_emissao_pedidosCompras									= origem.dt_emissao_pedidosCompras								
	,destino.nr_pedidoCompra_pedidosCompras								= origem.nr_pedidoCompra_pedidosCompras							
	,destino.qtd_jaEntregue_pedidosCompras								= origem.qtd_jaEntregue_pedidosCompras							
	,destino.ds_produto_pedidosCompras									= origem.ds_produto_pedidosCompras								
	,destino.fl_residuoEliminado_pedidosCompras							= origem.fl_residuoEliminado_pedidosCompras						
	,destino.nr_cotacao_pedidosCompras									= origem.nr_cotacao_pedidosCompras								
	,destino.ds_mensagem_pedidosCompras									= origem.ds_mensagem_pedidosCompras								
	,destino.fl_transmissao_pedidosCompras								= origem.fl_transmissao_pedidosCompras							
	,destino.fl_pedidoEncerrado_pedidosCompras							= origem.fl_pedidoEncerrado_pedidosCompras						
	,destino.cd_grupoAprovacao_pedidosCompras							= origem.cd_grupoAprovacao_pedidosCompras						
	,destino.fl_controleAprovacao_pedidosCompras						= origem.fl_controleAprovacao_pedidosCompras					
	,destino.cd_grupoCopradores_pedidosCompras							= origem.cd_grupoCopradores_pedidosCompras						
	,destino.cd_usuario_pedidosCompras									= origem.cd_usuario_pedidosCompras								
	,destino.fl_eliminadoRemanescente_pedidosCompras					= origem.fl_eliminadoRemanescente_pedidosCompras				
	,destino.qt_solicitada_pedidosCompras								= origem.qt_solicitada_pedidosCompras							
	,destino.vl_ipi_pedidosCompras										= origem.vl_ipi_pedidosCompras									
	,destino.vl_icms_pedidosCompras										= origem.vl_icms_pedidosCompras									
	,destino.tp_entradaNota_pedidosCompras								= origem.tp_entradaNota_pedidosCompras							
	,destino.fl_atualizaEstoque_pedidosCompras							= origem.fl_atualizaEstoque_pedidosCompras						
	,destino.nm_solicitante_pedidosCompras								= origem.nm_solicitante_pedidosCompras							
	,destino.dt_contabilizacao_pedidosCompras							= origem.dt_contabilizacao_pedidosCompras						
	,destino.cd_origem_pedidosCompras									= origem.cd_origem_pedidosCompras								
	,destino.cd_destino_pedidosCompras									= origem.cd_destino_pedidosCompras								
	,destino.cd_comprador_pedidosCompras								= origem.cd_comprador_pedidosCompras							
	,destino.dt_conferencia_pedidosCompras								= origem.dt_conferencia_pedidosCompras							
	,destino.tp_compra_pedidosCompras									= origem.tp_compra_pedidosCompras								
	,destino.cd_filialOrigem_pedidosCompras								= origem.cd_filialOrigem_pedidosCompras							
	,destino.nr_fluig_pedidosCompras									= origem.nr_fluig_pedidosCompras								
	,destino.cd_natureza_pedidosCompras									= origem.cd_natureza_pedidosCompras								
	,destino.fl_faturamentoDireto_pedidosCompras						= origem.fl_faturamentoDireto_pedidosCompras					
	,dt_alteracao														= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		 origem.cc_solicitacoesComprasXpedidosCompras					
		,origem.cc_pedidosComprasXnotasFiscaisEntrada					
		,origem.cd_filial_pedidosCompras											
		,origem.cd_item_pedidosCompras											
		,origem.cd_produto_pedidosCompras											
		,origem.ds_unidadeMedida_pedidosCompras									
		,origem.qt_pedido_pedidosCompras											
		,origem.cd_tabelaPreco_pedidosCompras										
		,origem.vl_unitario_pedidosCompras										
		,origem.vl_total_pedidosCompras											
		,origem.nr_solicitacao_pedidosCompras										
		,origem.cd_itemSolicitacao_pedidosCompras									
		,origem.dt_inicioCompra_pedidosCompras									
		,origem.dt_entrega_pedidosCompras											
		,origem.cd_armazem_pedidosCompras											
		,origem.ds_observacao_pedidosCompras										
		,origem.cd_fornecedor_pedidosCompras										
		,origem.cd_centroCusto_pedidosCompras										
		,origem.cd_contaContabil_pedidosCompras									
		,origem.cd_itemContaContabil_pedidosCompras								
		,origem.cd_lojaForncedor_pedidosCompras									
		,origem.cd_condicaoPagamento_pedidosCompras								
		,origem.cd_contato_pedidosCompras											
		,origem.cd_filialEntrega_pedidosCompras									
		,origem.dt_emissao_pedidosCompras											
		,origem.nr_pedidoCompra_pedidosCompras									
		,origem.qtd_jaEntregue_pedidosCompras										
		,origem.ds_produto_pedidosCompras											
		,origem.fl_residuoEliminado_pedidosCompras								
		,origem.nr_cotacao_pedidosCompras											
		,origem.ds_mensagem_pedidosCompras										
		,origem.fl_transmissao_pedidosCompras										
		,origem.fl_pedidoEncerrado_pedidosCompras									
		,origem.cd_grupoAprovacao_pedidosCompras									
		,origem.fl_controleAprovacao_pedidosCompras								
		,origem.cd_grupoCopradores_pedidosCompras									
		,origem.cd_usuario_pedidosCompras											
		,origem.fl_eliminadoRemanescente_pedidosCompras							
		,origem.qt_solicitada_pedidosCompras										
		,origem.vl_ipi_pedidosCompras												
		,origem.vl_icms_pedidosCompras											
		,origem.tp_entradaNota_pedidosCompras										
		,origem.fl_atualizaEstoque_pedidosCompras									
		,origem.nm_solicitante_pedidosCompras										
		,origem.dt_contabilizacao_pedidosCompras									
		,origem.cd_origem_pedidosCompras											
		,origem.cd_destino_pedidosCompras											
		,origem.cd_comprador_pedidosCompras										
		,origem.dt_conferencia_pedidosCompras										
		,origem.tp_compra_pedidosCompras											
		,origem.cd_filialOrigem_pedidosCompras									
		,origem.nr_fluig_pedidosCompras											
		,origem.cd_natureza_pedidosCompras										
		,origem.fl_faturamentoDireto_pedidosCompras								
		,origem.cd_recno_SC7							
		,origem.dt_criacao								
		,origem.dt_alteracao										
		)

WHEN NOT MATCHED BY SOURCE and

	 (destino.dt_emissao_pedidosCompras >=
		 iif(@parametro_retorno=0
				,'1900-01-01'
					,DATEFROMPARTS(left(@parametro_retorno,4),right(left(@parametro_retorno,6),2),right(@parametro_retorno,2)))
		or destino.dt_emissao_pedidosCompras is null)	

	THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas

end
GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_pedidosEmitidos]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










--- exec [dbo].[sp_tb_fat_pedidosEmitidos] 


CREATE proc [dbo].[sp_tb_fat_pedidosEmitidos] 

as

begin

declare @linhas int;

declare @parametro_retorno varchar(100)
execute @parametro_retorno  = sp_retornaParametroParaVariavel 'ZE1010'

merge tb_fat_pedidosEmitidos as destino

using (

select
	--sk_destino														= null
	 cc_pedidosEmitidosXsolicitacoesSeparacoes							= ZE1_FILORI+'|'+ZE1_CODIGO+'|'+ZE1_ITEM+'|'+ZE1_PRODUT
	,cc_pedidosEmitidosXsolicitacoesCompras								= convert(varchar,rtrim(ZE1_FILORI))+'|'+convert(varchar,rtrim(ZE1_CODIGO))+'|'+convert(varchar,rtrim(ZE1_ITEM))+'|'+convert(varchar,rtrim(ZE1_PRODUT))+'|'+iif(rtrim(ZE1_FLUIG)='','0',convert(varchar,rtrim(ZE1_FLUIG)))
	,cd_filialOrigem_pedidosEmitidos									= ZE1_FILORI
	,cd_centroCusto_pedidosEmitidos										= ZE1_CC
	,cd_filialDestino_pedidosEmitidos									= ZE1_FILDES
	,cd_pedido_pedidosEmitidos											= ZE1_CODIGO
	,cd_itemEmissao_pedidosEmitidos										= ZE1_ITEM
	,cd_fluigEmissao_pedidosEmitidos									= ZE1_FLUIG
	,dt_emissao_pedidosEmitidos											= iif(ZE1_EMISSA='',null,DATEFROMPARTS(left(ZE1_EMISSA,4),right(left(ZE1_EMISSA,6),2),right(ZE1_EMISSA,2)))	 
	,cd_produto_pedidosEmitidos											= ZE1_PRODUT
	,qt_solicitada_pedidosEmitidos										= ZE1_QUANT
	,tp_atendimento_pedidosEmitidos										= ZE1_ATENDI
	,tp_emergencia_pedidosEmitidos										= ZE1_EMERGE
	,dt_necessidade_pedidosEmitidos										= iif(ZE1_NECESS='',null,DATEFROMPARTS(left(ZE1_NECESS,4),right(left(ZE1_NECESS,6),2),right(ZE1_NECESS,2))) 
	,qt_entregue_pedidosEmitidos										= ZE1_QUJE
	,nm_local_pedidosEmitidos											= ZE1_LOCAL
	,qt_aSeparar_pedidosEmitidos										= ZE1_QDTZE2
	,qt_aComprar_pedidosEmitidos										= ZE1_QDTSC1
	,ds_observacaoASeparar_pedidosEmitidos								= ZE1_OBSZE2
	,ds_observacaoAComprar_pedidosEmitidos								= ZE1_OBSSC1
	,st_emissao_pedidosEmitidos											= ZE1_STATUS
	,cd_solicitante_pedidosEmitidos										= ZE1_SOLICI
	,nm_solicitante_pedidosEmitidos										= ZE1_NOMESO
	,cd_localDestino_pedidosEmitidos									= ZE1_LOCALD
	,ds_complementoEimssao_pedidosEmitidos								= ZE1_COMPL
	,nr_ordemServico_pedidosEmitidos									= ZE1_NOS
	,tp_usoMaterial_pedidosEmitidos										= ZE1_TPUSO
	,st_wms_pedidosEmitidos												= ZE1_STSWMS
	,st_rm_pedidosEmitidos												= ZE1_STSRM
	,qt_emSolicitacaoDeCompras_pedidosEmitidos							= ZE1_SC1QTD
	,qt_emPedidoDeCompras_pedidosEmitidos								= ZE1_SC7QTD
	,qt_recebidaEmNotaFiscalDoFornecedor_pedidosEmitidos				= ZE1_SD1QCO
	,qt_paraSeparacaoDeEstoque_pedidosEmitidos							= ZE1_ZE3QTD
	,qt_jaSeparadaNoEstoque_pedidosEmitidos								= ZE1_ZE3QSE
	,qt_emSolicitacaoDeTransferencia_pedidosEmitidos					= ZE1_NNTQTD
	,qt_emNotaFiscalDeTransferenciaDeSaida_pedidosEmitidos				= ZE1_SD2QTD
	,qt_emNotaFiscalDeEntradaTransferenciaEmTransito_pedidosEmitidos	= ZE1_SD1QPE
	,qt_emNotaFiscalDeEntradaTransferenciaClassificada_pedidosEmitidos	= ZE1_SD1QTR
	,qt_emPedidoDeVenda_pedidosEmitidos									= ZE1_SC6QTD
	,qt_emMovimentoInternoDeEstoque_pedidosEmitidos						= ZE1_SD3QTD
	,cd_recno_ZE1														= R_E_C_N_O_
	,dt_criacao															= getdate()
	,dt_alteracao														= getdate()
	,cd_legendaEmissaoMicro_pedidosEmitidos												= [dbo].fn_pedidosEmitidos_geraLegendaEmissaoMicro(ZE1_FILORI,ZE1_FILDES,ZE1_QUANT,ZE1_ATENDI,ZE1_STATUS,ZE1_SC1QTD,ZE1_SC7QTD,ZE1_SD1QCO,ZE1_ZE3QTD,ZE1_ZE3QSE,ZE1_NNTQTD,ZE1_SD2QTD,ZE1_SD1QPE,ZE1_SD1QTR,ZE1_SC6QTD,ZE1_SD3QTD)
from bi_rip_rawZone_bck.dbo.ZE1010
where D_E_L_E_T_ = '' and (ZE1_EMISSA>= @parametro_retorno or ZE1_EMISSA>='') 

) origem on  
(		
	origem.cd_recno_ZE1 = destino.cd_recno_ZE1
)

WHEN MATCHED THEN
	UPDATE SET 
	destino.cc_pedidosEmitidosXsolicitacoesSeparacoes							= origem.cc_pedidosEmitidosXsolicitacoesSeparacoes	
	,destino.cc_pedidosEmitidosXsolicitacoesCompras								= origem.cc_pedidosEmitidosXsolicitacoesCompras		
	,destino.cd_filialOrigem_pedidosEmitidos									= origem.cd_filialOrigem_pedidosEmitidos			
	,destino.cd_centroCusto_pedidosEmitidos										= origem.cd_centroCusto_pedidosEmitidos				
	,destino.cd_filialDestino_pedidosEmitidos									= origem.cd_filialDestino_pedidosEmitidos			
	,destino.cd_pedido_pedidosEmitidos											= origem.cd_pedido_pedidosEmitidos					
	,destino.cd_itemEmissao_pedidosEmitidos										= origem.cd_itemEmissao_pedidosEmitidos				
	,destino.cd_fluigEmissao_pedidosEmitidos									= origem.cd_fluigEmissao_pedidosEmitidos			
	,destino.dt_emissao_pedidosEmitidos											= origem.dt_emissao_pedidosEmitidos					
	,destino.cd_produto_pedidosEmitidos											= origem.cd_produto_pedidosEmitidos					
	,destino.qt_solicitada_pedidosEmitidos										= origem.qt_solicitada_pedidosEmitidos				
	,destino.tp_atendimento_pedidosEmitidos										= origem.tp_atendimento_pedidosEmitidos				
	,destino.tp_emergencia_pedidosEmitidos										= origem.tp_emergencia_pedidosEmitidos				
	,destino.dt_necessidade_pedidosEmitidos										= origem.dt_necessidade_pedidosEmitidos				
	,destino.qt_entregue_pedidosEmitidos										= origem.qt_entregue_pedidosEmitidos				
	,destino.nm_local_pedidosEmitidos											= origem.nm_local_pedidosEmitidos					
	,destino.qt_aSeparar_pedidosEmitidos										= origem.qt_aSeparar_pedidosEmitidos				
	,destino.qt_aComprar_pedidosEmitidos										= origem.qt_aComprar_pedidosEmitidos				
	,destino.ds_observacaoASeparar_pedidosEmitidos								= origem.ds_observacaoASeparar_pedidosEmitidos		
	,destino.ds_observacaoAComprar_pedidosEmitidos								= origem.ds_observacaoAComprar_pedidosEmitidos		
	,destino.st_emissao_pedidosEmitidos											= origem.st_emissao_pedidosEmitidos					
	,destino.cd_solicitante_pedidosEmitidos										= origem.cd_solicitante_pedidosEmitidos				
	,destino.nm_solicitante_pedidosEmitidos										= origem.nm_solicitante_pedidosEmitidos				
	,destino.cd_localDestino_pedidosEmitidos									= origem.cd_localDestino_pedidosEmitidos			
	,destino.ds_complementoEimssao_pedidosEmitidos								= origem.ds_complementoEimssao_pedidosEmitidos		
	,destino.nr_ordemServico_pedidosEmitidos									= origem.nr_ordemServico_pedidosEmitidos			
	,destino.tp_usoMaterial_pedidosEmitidos										= origem.tp_usoMaterial_pedidosEmitidos				
	,destino.st_wms_pedidosEmitidos												= origem.st_wms_pedidosEmitidos		
	,destino.st_rm_pedidosEmitidos												= origem.st_rm_pedidosEmitidos			
	,destino.qt_emSolicitacaoDeCompras_pedidosEmitidos							= origem.qt_emSolicitacaoDeCompras_pedidosEmitidos		
	,destino.qt_emPedidoDeCompras_pedidosEmitidos								= origem.qt_emPedidoDeCompras_pedidosEmitidos		
	,destino.qt_recebidaEmNotaFiscalDoFornecedor_pedidosEmitidos				= origem.qt_recebidaEmNotaFiscalDoFornecedor_pedidosEmitidos	
	,destino.qt_paraSeparacaoDeEstoque_pedidosEmitidos							= origem.qt_paraSeparacaoDeEstoque_pedidosEmitidos		
	,destino.qt_jaSeparadaNoEstoque_pedidosEmitidos								= origem.qt_jaSeparadaNoEstoque_pedidosEmitidos	
	,destino.qt_emSolicitacaoDeTransferencia_pedidosEmitidos					= origem.qt_emSolicitacaoDeTransferencia_pedidosEmitidos		
	,destino.qt_emNotaFiscalDeTransferenciaDeSaida_pedidosEmitidos				= origem.qt_emNotaFiscalDeTransferenciaDeSaida_pedidosEmitidos		
	,destino.qt_emNotaFiscalDeEntradaTransferenciaEmTransito_pedidosEmitidos	= origem.qt_emNotaFiscalDeEntradaTransferenciaEmTransito_pedidosEmitidos	
	,destino.qt_emNotaFiscalDeEntradaTransferenciaClassificada_pedidosEmitidos	= origem.qt_emNotaFiscalDeEntradaTransferenciaClassificada_pedidosEmitidos	
	,destino.qt_emPedidoDeVenda_pedidosEmitidos									= origem.qt_emPedidoDeVenda_pedidosEmitidos		
	,destino.qt_emMovimentoInternoDeEstoque_pedidosEmitidos						= origem.qt_emMovimentoInternoDeEstoque_pedidosEmitidos		
	,destino.dt_alteracao														= getdate()
	,destino.cd_legendaEmissaoMicro_pedidosEmitidos												= origem.cd_legendaEmissaoMicro_pedidosEmitidos

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		origem.cc_pedidosEmitidosXsolicitacoesSeparacoes	
		,origem.cc_pedidosEmitidosXsolicitacoesCompras		
		,origem.cd_filialOrigem_pedidosEmitidos			
		,origem.cd_centroCusto_pedidosEmitidos				
		,origem.cd_filialDestino_pedidosEmitidos			
		,origem.cd_pedido_pedidosEmitidos					
		,origem.cd_itemEmissao_pedidosEmitidos				
		,origem.cd_fluigEmissao_pedidosEmitidos			
		,origem.dt_emissao_pedidosEmitidos					
		,origem.cd_produto_pedidosEmitidos					
		,origem.qt_solicitada_pedidosEmitidos				
		,origem.tp_atendimento_pedidosEmitidos				
		,origem.tp_emergencia_pedidosEmitidos				
		,origem.dt_necessidade_pedidosEmitidos				
		,origem.qt_entregue_pedidosEmitidos				
		,origem.nm_local_pedidosEmitidos					
		,origem.qt_aSeparar_pedidosEmitidos				
		,origem.qt_aComprar_pedidosEmitidos				
		,origem.ds_observacaoASeparar_pedidosEmitidos		
		,origem.ds_observacaoAComprar_pedidosEmitidos		
		,origem.st_emissao_pedidosEmitidos					
		,origem.cd_solicitante_pedidosEmitidos				
		,origem.nm_solicitante_pedidosEmitidos				
		,origem.cd_localDestino_pedidosEmitidos			
		,origem.ds_complementoEimssao_pedidosEmitidos		
		,origem.nr_ordemServico_pedidosEmitidos			
		,origem.tp_usoMaterial_pedidosEmitidos				
		,origem.st_wms_pedidosEmitidos		
		,origem.st_rm_pedidosEmitidos
		,origem.cd_recno_ZE1												
		,origem.dt_criacao												
		,origem.dt_alteracao												
		,origem.qt_emSolicitacaoDeCompras_pedidosEmitidos		
		,origem.qt_emPedidoDeCompras_pedidosEmitidos		
		,origem.qt_recebidaEmNotaFiscalDoFornecedor_pedidosEmitidos	
		,origem.qt_paraSeparacaoDeEstoque_pedidosEmitidos		
		,origem.qt_jaSeparadaNoEstoque_pedidosEmitidos	
		,origem.qt_emSolicitacaoDeTransferencia_pedidosEmitidos		
		,origem.qt_emNotaFiscalDeTransferenciaDeSaida_pedidosEmitidos		
		,origem.qt_emNotaFiscalDeEntradaTransferenciaEmTransito_pedidosEmitidos	
		,origem.qt_emNotaFiscalDeEntradaTransferenciaClassificada_pedidosEmitidos	
		,origem.qt_emPedidoDeVenda_pedidosEmitidos		
		,origem.qt_emMovimentoInternoDeEstoque_pedidosEmitidos		
		,origem.cd_legendaEmissaoMicro_pedidosEmitidos
	)

WHEN NOT MATCHED BY SOURCE and

	 (destino.dt_emissao_pedidosEmitidos >=
		 iif(@parametro_retorno=0
				,'1900-01-01'
					,DATEFROMPARTS(left(@parametro_retorno,4),right(left(@parametro_retorno,6),2),right(@parametro_retorno,2)))
		or destino.dt_emissao_pedidosEmitidos is null)

	THEN
	
	DELETE;

	set @linhas = @@ROWCOUNT;

	return @linhas

end


GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_pedidosTransferencias]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






---- exec [dbo].[sp_tb_fat_pedidosTransferencias]

CREATE proc [dbo].[sp_tb_fat_pedidosTransferencias]

as

begin



declare @linhas int;


declare @parametro_retorno varchar(100)
execute @parametro_retorno  = sp_retornaParametroParaVariavel 'NNS010'

merge tb_fat_pedidosTransferencias as destino

using (

		select 
			--top 1000
			--sk_destino										= null ---- chave substituta
			 cc_pedidosTransferenciasXpedidosVendas				= NNT_FILIAL+'|'+NNT_FILDES+'|'+NNT_SERIE+'|'+NNT_DOC+'|'+NNT_PROD
			,cc_solicitacoesSeparacoesXpedidosTransferencias	= NNT_FILIAL+'|'+NNT_COD+'|'+NNT_PROD
			,cd_pedido_pedidosTransferencias					= NNS_COD		
			,cd_filial_pedidosTransferencias					= NNS_FILIAL		
			,dt_emissao_pedidosTransferencias					= iif(NNS_DATA='',null,DATEFROMPARTS(left(NNS_DATA,4),right(left(NNS_DATA,6),2),right(NNS_DATA,2))	)	
			,cd_solicitante_pedidosTransferencias				= NNS_SOLICT		
			,st_pedido_pedidosTransferencias					= NNS_STATUS		
			,ds_justificativa_pedidosTransferencias				= NNS_JUSTIF		
			,tp_documentoEntrada_pedidosTransferencias			= NNS_CLASS		
			,tp_notaFiscal_pedidosTransferencias				= NNS_ESPECI		
			,nr_fluig_pedidosTransferencias						= NNS_ZZFLUI		
			,fl_emercial_pedidosTransferencias					= NNS_ZZEMER		
			,dt_digitacao_pedidosTransferencias					= iif(NNS_ZDTDIG='',null,DATEFROMPARTS(left(NNS_ZDTDIG,4),right(left(NNS_ZDTDIG,6),2),right(NNS_ZDTDIG,2))	)
			,cd_centroCusto_pedidosTransferencias				= NNS_ZZCC		
			,ds_mensagemPadrao_pedidosTransferencias			= NNS_ZMENPA		
			,cd_transporte_pedidosTransferencias				= NNS_ZTRANS
			,cd_filial_pedidosTransferenciasItens				= NNT_FILIAL
			,cd_pedido_pedidosTransferenciasItens				= NNT_COD
			,cd_filialOrigem_pedidosTransferenciasItens			= NNT_FILORI
			,cd_produto_pedidosTransferenciasItens				= NNT_PROD
			,ds_unidadeMedidaOrigem_pedidosTransferenciasItens	= NNT_UM
			,cd_armazemOrigem_pedidosTransferenciasItens		= NNT_LOCAL
			,cd_endereco_pedidosTransferenciasItens				= NNT_LOCALI
			,dt_validadeLote_pedidosTransferenciasItens			= iif(NNT_DTVALI='',null,DATEFROMPARTS(left(NNT_DTVALI,4),right(left(NNT_DTVALI,6),2),right(NNT_DTVALI,2)) )
			,qt_pedido_pedidosTransferenciasItens				= NNT_QUANT
			,cd_filialDestino_pedidosTransferenciasItens		= NNT_FILDES
			,cd_produtoDestino_pedidosTransferenciasItens		= NNT_PRODD
			,ds_unidadeMedidaDestino_pedidosTransferenciasItens	= NNT_UMD
			,cd_armazemDestino_pedidosTransferenciasItens		= NNT_LOCLD
			,cd_TESSaida_pedidosTransferenciasItens				= NNT_TS
			,cd_TESEntrada_pedidosTransferenciasItens			= NNT_TE
			,nr_documento_pedidosTransferenciasItens			= NNT_DOC
			,nr_serieDocumento_pedidosTransferenciasItens		= NNT_SERIE
			,ds_obervacao_pedidosTransferenciasItens			= NNT_OBS
			,vl_precoVenda_pedidosTransferenciasItens			= NNT_ZPRCVE
			,cd_recno_NNS										= nns.R_E_C_N_O_
			,cd_recno_NNT										= nnt.R_E_C_N_O_
			,dt_criacao											= getdate()
			,dt_alteracao										= getdate()
		from bi_rip_rawZone_bck.dbo.NNS010 as nns
		left join bi_rip_rawZone_bck.dbo.NNT010 as nnt
		on	nns.NNS_FILIAL = nnt.NNT_FILIAL
		and nns.NNS_COD = nnt.NNT_COD and nnt.D_E_L_E_T_ = ''
		where
			nns.D_E_L_E_T_ = ''
		and (nns.NNS_DATA >= @parametro_retorno or nns.NNS_DATA = '')

) origem on  
(		origem.cd_recno_NNS = destino.cd_recno_NNS
	and origem.cd_recno_NNT = destino.cd_recno_NNT
)

WHEN MATCHED THEN
	UPDATE SET 
	 destino.cc_pedidosTransferenciasXpedidosVendas				= origem.cc_pedidosTransferenciasXpedidosVendas			
	,destino.cc_solicitacoesSeparacoesXpedidosTransferencias	= origem.cc_solicitacoesSeparacoesXpedidosTransferencias			
	,destino.cd_pedido_pedidosTransferencias					= origem.cd_pedido_pedidosTransferencias					
	,destino.cd_filial_pedidosTransferencias					= origem.cd_filial_pedidosTransferencias					
	,destino.dt_emissao_pedidosTransferencias					= origem.dt_emissao_pedidosTransferencias					
	,destino.cd_solicitante_pedidosTransferencias				= origem.cd_solicitante_pedidosTransferencias				
	,destino.st_pedido_pedidosTransferencias					= origem.st_pedido_pedidosTransferencias							
	,destino.ds_justificativa_pedidosTransferencias				= origem.ds_justificativa_pedidosTransferencias				
	,destino.tp_documentoEntrada_pedidosTransferencias			= origem.tp_documentoEntrada_pedidosTransferencias			
	,destino.tp_notaFiscal_pedidosTransferencias				= origem.tp_notaFiscal_pedidosTransferencias				
	,destino.nr_fluig_pedidosTransferencias						= origem.nr_fluig_pedidosTransferencias						
	,destino.fl_emercial_pedidosTransferencias					= origem.fl_emercial_pedidosTransferencias					
	,destino.dt_digitacao_pedidosTransferencias					= origem.dt_digitacao_pedidosTransferencias					
	,destino.cd_centroCusto_pedidosTransferencias				= origem.cd_centroCusto_pedidosTransferencias				
	,destino.ds_mensagemPadrao_pedidosTransferencias			= origem.ds_mensagemPadrao_pedidosTransferencias			
	,destino.cd_transporte_pedidosTransferencias				= origem.cd_transporte_pedidosTransferencias				
	,destino.cd_filial_pedidosTransferenciasItens				= origem.cd_filial_pedidosTransferenciasItens				
	,destino.cd_pedido_pedidosTransferenciasItens				= origem.cd_pedido_pedidosTransferenciasItens				
	,destino.cd_filialOrigem_pedidosTransferenciasItens			= origem.cd_filialOrigem_pedidosTransferenciasItens			
	,destino.cd_produto_pedidosTransferenciasItens				= origem.cd_produto_pedidosTransferenciasItens				
	,destino.ds_unidadeMedidaOrigem_pedidosTransferenciasItens	= origem.ds_unidadeMedidaOrigem_pedidosTransferenciasItens	
	,destino.cd_armazemOrigem_pedidosTransferenciasItens		= origem.cd_armazemOrigem_pedidosTransferenciasItens		
	,destino.cd_endereco_pedidosTransferenciasItens				= origem.cd_endereco_pedidosTransferenciasItens				
	,destino.dt_validadeLote_pedidosTransferenciasItens			= origem.dt_validadeLote_pedidosTransferenciasItens			
	,destino.qt_pedido_pedidosTransferenciasItens				= origem.qt_pedido_pedidosTransferenciasItens				
	,destino.cd_filialDestino_pedidosTransferenciasItens		= origem.cd_filialDestino_pedidosTransferenciasItens		
	,destino.cd_produtoDestino_pedidosTransferenciasItens		= origem.cd_produtoDestino_pedidosTransferenciasItens		
	,destino.ds_unidadeMedidaDestino_pedidosTransferenciasItens	= origem.ds_unidadeMedidaDestino_pedidosTransferenciasItens	
	,destino.cd_armazemDestino_pedidosTransferenciasItens		= origem.cd_armazemDestino_pedidosTransferenciasItens		
	,destino.cd_TESSaida_pedidosTransferenciasItens				= origem.cd_TESSaida_pedidosTransferenciasItens				
	,destino.cd_TESEntrada_pedidosTransferenciasItens			= origem.cd_TESEntrada_pedidosTransferenciasItens			
	,destino.nr_documento_pedidosTransferenciasItens			= origem.nr_documento_pedidosTransferenciasItens			
	,destino.nr_serieDocumento_pedidosTransferenciasItens		= origem.nr_serieDocumento_pedidosTransferenciasItens		
	,destino.ds_obervacao_pedidosTransferenciasItens			= origem.ds_obervacao_pedidosTransferenciasItens			
	,destino.vl_precoVenda_pedidosTransferenciasItens			= origem.vl_precoVenda_pedidosTransferenciasItens			
	,dt_alteracao													= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		 origem.cc_pedidosTransferenciasXpedidosVendas			
		,origem.cc_solicitacoesSeparacoesXpedidosTransferencias			
		,origem.cd_pedido_pedidosTransferencias					
		,origem.cd_filial_pedidosTransferencias					
		,origem.dt_emissao_pedidosTransferencias					
		,origem.cd_solicitante_pedidosTransferencias				
		,origem.st_pedido_pedidosTransferencias							
		,origem.ds_justificativa_pedidosTransferencias				
		,origem.tp_documentoEntrada_pedidosTransferencias			
		,origem.tp_notaFiscal_pedidosTransferencias				
		,origem.nr_fluig_pedidosTransferencias						
		,origem.fl_emercial_pedidosTransferencias					
		,origem.dt_digitacao_pedidosTransferencias					
		,origem.cd_centroCusto_pedidosTransferencias				
		,origem.ds_mensagemPadrao_pedidosTransferencias			
		,origem.cd_transporte_pedidosTransferencias				
		,origem.cd_filial_pedidosTransferenciasItens				
		,origem.cd_pedido_pedidosTransferenciasItens				
		,origem.cd_filialOrigem_pedidosTransferenciasItens			
		,origem.cd_produto_pedidosTransferenciasItens				
		,origem.ds_unidadeMedidaOrigem_pedidosTransferenciasItens	
		,origem.cd_armazemOrigem_pedidosTransferenciasItens		
		,origem.cd_endereco_pedidosTransferenciasItens				
		,origem.dt_validadeLote_pedidosTransferenciasItens			
		,origem.qt_pedido_pedidosTransferenciasItens				
		,origem.cd_filialDestino_pedidosTransferenciasItens		
		,origem.cd_produtoDestino_pedidosTransferenciasItens		
		,origem.ds_unidadeMedidaDestino_pedidosTransferenciasItens	
		,origem.cd_armazemDestino_pedidosTransferenciasItens		
		,origem.cd_TESSaida_pedidosTransferenciasItens				
		,origem.cd_TESEntrada_pedidosTransferenciasItens			
		,origem.nr_documento_pedidosTransferenciasItens			
		,origem.nr_serieDocumento_pedidosTransferenciasItens		
		,origem.ds_obervacao_pedidosTransferenciasItens			
		,origem.vl_precoVenda_pedidosTransferenciasItens			
		,origem.cd_recno_NNS										
		,origem.cd_recno_NNT										
		,getdate()											
		,getdate()										
		)

WHEN NOT MATCHED BY SOURCE and 

	 (destino.dt_emissao_pedidosTransferencias >=
		 iif(@parametro_retorno=0
				,'1900-01-01'
					,DATEFROMPARTS(left(@parametro_retorno,4),right(left(@parametro_retorno,6),2),right(@parametro_retorno,2)))
		or destino.dt_emissao_pedidosTransferencias is null)

	THEN
	
	DELETE;

set @linhas = @@ROWCOUNT;

return @linhas

end
GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_pedidosVendas]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
















--- exec [dbo].[sp_tb_fat_pedidosVendas]


CREATE proc [dbo].[sp_tb_fat_pedidosVendas]


AS

declare @parametro_retorno varchar(100)
execute @parametro_retorno  = sp_retornaParametroParaVariavel 'SC5010'
declare @linhas int

merge tb_fat_pedidosVendas as destino

using (


select
--sk_destino										= null
 cc_pedidosVendasXnotasFiscaisSaida				= C5_FILIAL+'|'+C5_NOTA+'|'+C5_SERIE+'|'+C5_CLIENTE+'|'+C5_LOJACLI+'|'+C6_ITEM --- add 14/10 +C6_ITEMSC
,cc_solicitacoesSeparacoesXpedidosVendas		= C5_FILIAL+sc5.C5_NUM+'|'+C6_ITEM --- add 14/10 +C6_ITEMSC
,cc_pedidosTransferenciasXpedidosVendas			= C5_FILIAL+'|'+C5_LOJAENT+'|'+C5_SERIE+'|'+C5_NOTA+'|'+C6_PRODUTO
,cd_filial_pedidosVendas						= C5_FILIAL
,nr_pedido_pedidosVendas						= C5_NUM
,tp_pedido_pedidosVendas						= C5_TIPO
,cd_cliente_pedidosVendas						= C5_CLIENTE
,cd_lojaCliente_pedidosVendas					= C5_LOJACLI
,cd_clienteEntrega_pedidosVendas				= C5_CLIENT
,cd_lojaEntrega_pedidosVendas					= C5_LOJAENT
,cd_transportadora_pedidosVendas				= C5_TRANSP
,st_registro_pedidosVendas						= C5_MSBLQL
,dt_emissao_pedidosVendas						= iif(C5_EMISSAO='',null,DATEFROMPARTS(left(C5_EMISSAO,4),right(left(C5_EMISSAO,6),2),right(C5_EMISSAO,2)))	
,nr_notaFiscal_pedidosVendas					= C5_NOTA
,nr_serieNotaFiscal_pedidosVendas				= C5_SERIE
,nr_contrato_pedidosVendas						= C5_CONTRA
,nr_geraWms_pedidosVendas						= C5_GERAWMS
,dt_entrega_pedidosVendas						= iif(C5_FECENT='',null,DATEFROMPARTS(left(C5_FECENT,4),right(left(C5_FECENT,6),2),right(C5_FECENT,2)))	 
,cd_obra_pedidosVendas							= C5_OBRA
,cd_natureza_pedidosVendas						= C5_NATUREZ
,nr_fluig_pedidosVendas							= C5_IDFLUIG
,cd_centroCustoDestino_pedidosVendas			= C5_ZZCC
,nm_municipioOrigem_pedidosVendas				= C5_CMUNOR
,nm_unidadeFederalOrigem_pedidosVendas			= C5_UFDEST
,nm_municipioDestino_pedidosVendas				= C5_CMUNDE
,nm_unidadeFederalDestino_pedidosVendas			= C5_UFORIG
,cd_filial_pedidosVendasItens					= C6_FILIAL
,cd_item_pedidosVendasItens						= C6_ITEM
,cd_produto_pedidosVendasItens					= C6_PRODUTO
,ds_unidadeMedidaPrimaria_pedidosVendasItens	= C6_UM
,qt_vendida_pedidosVendasItens					= C6_QTDVEN
,vl_unidadeVendida_pedidosVendasItens			= C6_PRCVEN
,vl_totalItem_pedidosVendasItens				= C6_VALOR
,qt_liberada_pedidosVendasItens					= C6_QTDLIB
,cd_armazem_pedidosVendasItens					= C6_LOCAL
,cd_ficalOperacao_pedidosVendasItens			= C6_CF
,qt_entregue_pedidosVendasItens					= C6_QTDENT
,cd_cliente_pedidosVendasItens					= C6_CLI
,dt_entrega_pedidosVendasItens					= iif(C6_ENTREG='',null,DATEFROMPARTS(left(C6_ENTREG,4),right(left(C6_ENTREG,6),2),right(C6_ENTREG,2)))	
,cd_lojaCliente_pedidosVendasItens				= C6_LOJA
,nr_notaFiscal_pedidosVendasItens				= C6_NOTA
,nr_serieNotaFiscal_pedidosVendasItens			= C6_SERIE
,dt_faturamento_pedidosVendasItens				= iif(C6_DATFAT='',null,DATEFROMPARTS(left(C6_DATFAT,4),right(left(C6_DATFAT,6),2),right(C6_DATFAT,2)))	 
,nr_pedido_pedidosVendasItens					= C6_NUM
,nr_pedidoCliente_pedidosVendasItens			= C6_PEDCLI
,ds_auxiliar_pedidosVendasItens					= C6_DESCRI
,vl_unitarioTabela_pedidosVendasItens			= C6_PRUNIT
,fl_bloqueio_pedidosVendasItens					= C6_BLOQUEI
,cd_situacaoTributaria_pedidosVendasItens		= C6_CLASFIS
,qt_empenhada_pedidosVendasItens				= C6_QTDEMP
,nr_solicitacaoCompra_pedidosVendasItens		= C6_NUMSC
,nr_itemSolicitacaoCompra_pedidosVendasItens	= C6_ITEMSC
,dt_entregaSugeridaAPS_pedidosVendasItens		= iif(C6_SUGENTR='',null,DATEFROMPARTS(left(C6_SUGENTR,4),right(left(C6_SUGENTR,6),2),right(C6_SUGENTR,2)))	 
,cd_centroCusto_pedidosVendasItens				= C6_CC
,cd_contaContabil_pedidosVendasItens			= C6_CONTA
,tp_produto_pedidosVendasItens					= C6_TPPROD
,dt_integracao_pedidosVendasItens				= iif(C6_DATCPL='',null,DATEFROMPARTS(left(C6_DATCPL,4),right(left(C6_DATCPL,6),2),right(C6_DATCPL,2)))	 
,fl_integracaoRoteirizador_pedidosVendasItens	= C6_INTROT
,fl_saldoFluig_pedidosVendasItens				= C6_ZCTBRES
,cd_recno_SC5010								= sc5.R_E_C_N_O_ 
,cd_recno_SC6010								= sc6.R_E_C_N_O_
,dt_criacao										= getdate()
,dt_alteracao									= getdate()
from [bi_rip_rawZone_bck].dbo.SC5010 as sc5
left join  [bi_rip_rawZone_bck].dbo.SC6010 AS sc6
ON sc5.C5_FILIAL = sc6.C6_FILIAL 
AND sc5.C5_NUM = sc6.C6_NUM and sc6.D_E_L_E_T_ = ''
where sc5.D_E_L_E_T_ = '' 
AND (C5_EMISSAO >=@parametro_retorno OR C5_EMISSAO = '')

) origem on  
(		
	origem.cd_recno_SC5010 = destino.cd_recno_SC5010 and 
	origem.cd_recno_SC6010 = destino.cd_recno_SC6010 
)

WHEN MATCHED THEN
	UPDATE SET 

	 destino.cc_pedidosVendasXnotasFiscaisSaida						= origem.cc_pedidosVendasXnotasFiscaisSaida				
	,destino.cc_solicitacoesSeparacoesXpedidosVendas				= origem.cc_solicitacoesSeparacoesXpedidosVendas		
	,destino.cc_pedidosTransferenciasXpedidosVendas					= origem.cc_pedidosTransferenciasXpedidosVendas			
	,destino.cd_filial_pedidosVendas								= origem.cd_filial_pedidosVendas						
	,destino.nr_pedido_pedidosVendas								= origem.nr_pedido_pedidosVendas						
	,destino.tp_pedido_pedidosVendas								= origem.tp_pedido_pedidosVendas						
	,destino.cd_cliente_pedidosVendas								= origem.cd_cliente_pedidosVendas						
	,destino.cd_lojaCliente_pedidosVendas							= origem.cd_lojaCliente_pedidosVendas					
	,destino.cd_clienteEntrega_pedidosVendas						= origem.cd_clienteEntrega_pedidosVendas				
	,destino.cd_lojaEntrega_pedidosVendas							= origem.cd_lojaEntrega_pedidosVendas					
	,destino.cd_transportadora_pedidosVendas						= origem.cd_transportadora_pedidosVendas				
	,destino.st_registro_pedidosVendas								= origem.st_registro_pedidosVendas						
	,destino.dt_emissao_pedidosVendas								= origem.dt_emissao_pedidosVendas						
	,destino.nr_notaFiscal_pedidosVendas							= origem.nr_notaFiscal_pedidosVendas					
	,destino.nr_serieNotaFiscal_pedidosVendas						= origem.nr_serieNotaFiscal_pedidosVendas				
	,destino.nr_contrato_pedidosVendas								= origem.nr_contrato_pedidosVendas						
	,destino.nr_geraWms_pedidosVendas								= origem.nr_geraWms_pedidosVendas						
	,destino.dt_entrega_pedidosVendas								= origem.dt_entrega_pedidosVendas						
	,destino.cd_obra_pedidosVendas									= origem.cd_obra_pedidosVendas							
	,destino.cd_natureza_pedidosVendas								= origem.cd_natureza_pedidosVendas						
	,destino.nr_fluig_pedidosVendas									= origem.nr_fluig_pedidosVendas							
	,destino.cd_centroCustoDestino_pedidosVendas					= origem.cd_centroCustoDestino_pedidosVendas			
	,destino.nm_municipioOrigem_pedidosVendas						= origem.nm_municipioOrigem_pedidosVendas				
	,destino.nm_unidadeFederalOrigem_pedidosVendas					= origem.nm_unidadeFederalOrigem_pedidosVendas			
	,destino.nm_municipioDestino_pedidosVendas						= origem.nm_municipioDestino_pedidosVendas			
	,destino.nm_unidadeFederalDestino_pedidosVendas					= origem.nm_unidadeFederalDestino_pedidosVendas			
	,destino.cd_filial_pedidosVendasItens							= origem.cd_filial_pedidosVendasItens					
	,destino.cd_item_pedidosVendasItens								= origem.cd_item_pedidosVendasItens						
	,destino.cd_produto_pedidosVendasItens							= origem.cd_produto_pedidosVendasItens					
	,destino.ds_unidadeMedidaPrimaria_pedidosVendasItens			= origem.ds_unidadeMedidaPrimaria_pedidosVendasItens	
	,destino.qt_vendida_pedidosVendasItens							= origem.qt_vendida_pedidosVendasItens					
	,destino.vl_unidadeVendida_pedidosVendasItens					= origem.vl_unidadeVendida_pedidosVendasItens			
	,destino.vl_totalItem_pedidosVendasItens						= origem.vl_totalItem_pedidosVendasItens				
	,destino.qt_liberada_pedidosVendasItens							= origem.qt_liberada_pedidosVendasItens					
	,destino.cd_armazem_pedidosVendasItens							= origem.cd_armazem_pedidosVendasItens					
	,destino.cd_ficalOperacao_pedidosVendasItens					= origem.cd_ficalOperacao_pedidosVendasItens			
	,destino.qt_entregue_pedidosVendasItens							= origem.qt_entregue_pedidosVendasItens					
	,destino.cd_cliente_pedidosVendasItens							= origem.cd_cliente_pedidosVendasItens					
	,destino.dt_entrega_pedidosVendasItens							= origem.dt_entrega_pedidosVendasItens					
	,destino.cd_lojaCliente_pedidosVendasItens						= origem.cd_lojaCliente_pedidosVendasItens				
	,destino.nr_notaFiscal_pedidosVendasItens						= origem.nr_notaFiscal_pedidosVendasItens				
	,destino.nr_serieNotaFiscal_pedidosVendasItens					= origem.nr_serieNotaFiscal_pedidosVendasItens			
	,destino.dt_faturamento_pedidosVendasItens						= origem.dt_faturamento_pedidosVendasItens				
	,destino.nr_pedido_pedidosVendasItens							= origem.nr_pedido_pedidosVendasItens					
	,destino.nr_pedidoCliente_pedidosVendasItens					= origem.nr_pedidoCliente_pedidosVendasItens			
	,destino.ds_auxiliar_pedidosVendasItens							= origem.ds_auxiliar_pedidosVendasItens					
	,destino.vl_unitarioTabela_pedidosVendasItens					= origem.vl_unitarioTabela_pedidosVendasItens			
	,destino.fl_bloqueio_pedidosVendasItens							= origem.fl_bloqueio_pedidosVendasItens					
	,destino.cd_situacaoTributaria_pedidosVendasItens				= origem.cd_situacaoTributaria_pedidosVendasItens		
	,destino.qt_empenhada_pedidosVendasItens						= origem.qt_empenhada_pedidosVendasItens				
	,destino.nr_solicitacaoCompra_pedidosVendasItens				= origem.nr_solicitacaoCompra_pedidosVendasItens		
	,destino.nr_itemSolicitacaoCompra_pedidosVendasItens			= origem.nr_itemSolicitacaoCompra_pedidosVendasItens	
	,destino.dt_entregaSugeridaAPS_pedidosVendasItens				= origem.dt_entregaSugeridaAPS_pedidosVendasItens		
	,destino.cd_centroCusto_pedidosVendasItens						= origem.cd_centroCusto_pedidosVendasItens				
	,destino.cd_contaContabil_pedidosVendasItens					= origem.cd_contaContabil_pedidosVendasItens			
	,destino.tp_produto_pedidosVendasItens							= origem.tp_produto_pedidosVendasItens					
	,destino.dt_integracao_pedidosVendasItens						= origem.dt_integracao_pedidosVendasItens				
	,destino.fl_integracaoRoteirizador_pedidosVendasItens			= origem.fl_integracaoRoteirizador_pedidosVendasItens	
	,destino.fl_saldoFluig_pedidosVendasItens				        = origem.fl_saldoFluig_pedidosVendasItens				
	,dt_alteracao													= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		 cc_pedidosVendasXnotasFiscaisSaida				
		,cc_solicitacoesSeparacoesXpedidosVendas		
		,cc_pedidosTransferenciasXpedidosVendas			
		,cd_filial_pedidosVendas						
		,nr_pedido_pedidosVendas						
		,tp_pedido_pedidosVendas						
		,cd_cliente_pedidosVendas						
		,cd_lojaCliente_pedidosVendas					
		,cd_clienteEntrega_pedidosVendas				
		,cd_lojaEntrega_pedidosVendas					
		,cd_transportadora_pedidosVendas				
		,st_registro_pedidosVendas						
		,dt_emissao_pedidosVendas						
		,nr_notaFiscal_pedidosVendas					
		,nr_serieNotaFiscal_pedidosVendas				
		,nr_contrato_pedidosVendas						
		,nr_geraWms_pedidosVendas						
		,dt_entrega_pedidosVendas						
		,cd_obra_pedidosVendas							
		,cd_natureza_pedidosVendas						
		,nr_fluig_pedidosVendas							
		,cd_centroCustoDestino_pedidosVendas			
		,nm_municipioOrigem_pedidosVendas				
		,nm_unidadeFederalOrigem_pedidosVendas			
		,nm_municipioDestino_pedidosVendas			
		,nm_unidadeFederalDestino_pedidosVendas			
		,cd_filial_pedidosVendasItens					
		,cd_item_pedidosVendasItens						
		,cd_produto_pedidosVendasItens					
		,ds_unidadeMedidaPrimaria_pedidosVendasItens	
		,qt_vendida_pedidosVendasItens					
		,vl_unidadeVendida_pedidosVendasItens			
		,vl_totalItem_pedidosVendasItens				
		,qt_liberada_pedidosVendasItens					
		,cd_armazem_pedidosVendasItens					
		,cd_ficalOperacao_pedidosVendasItens			
		,qt_entregue_pedidosVendasItens					
		,cd_cliente_pedidosVendasItens					
		,dt_entrega_pedidosVendasItens					
		,cd_lojaCliente_pedidosVendasItens				
		,nr_notaFiscal_pedidosVendasItens				
		,nr_serieNotaFiscal_pedidosVendasItens			
		,dt_faturamento_pedidosVendasItens				
		,nr_pedido_pedidosVendasItens					
		,nr_pedidoCliente_pedidosVendasItens			
		,ds_auxiliar_pedidosVendasItens					
		,vl_unitarioTabela_pedidosVendasItens			
		,fl_bloqueio_pedidosVendasItens					
		,cd_situacaoTributaria_pedidosVendasItens		
		,qt_empenhada_pedidosVendasItens				
		,nr_solicitacaoCompra_pedidosVendasItens		
		,nr_itemSolicitacaoCompra_pedidosVendasItens	
		,dt_entregaSugeridaAPS_pedidosVendasItens		
		,cd_centroCusto_pedidosVendasItens				
		,cd_contaContabil_pedidosVendasItens			
		,tp_produto_pedidosVendasItens					
		,dt_integracao_pedidosVendasItens				
		,fl_integracaoRoteirizador_pedidosVendasItens	
		,fl_saldoFluig_pedidosVendasItens				
		,cd_recno_SC5010								
		,cd_recno_SC6010								
		,dt_criacao										
		,dt_alteracao									
		)

WHEN NOT MATCHED BY SOURCE AND

	
		 (destino.dt_emissao_pedidosVendas >=
		 iif(@parametro_retorno=0
				,'1900-01-01'
					,DATEFROMPARTS(left(@parametro_retorno,4),right(left(@parametro_retorno,6),2),right(@parametro_retorno,2)))
		 or destino.dt_emissao_pedidosVendas is null)

	THEN
	
	DELETE;

set @linhas = @@ROWCOUNT;

return @linhas

GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_pickListMontagemVolume]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_tb_fat_pickListMontagemVolume]

as

declare @linhas int;
merge tb_fat_pickListMontagemVolume as destino

using (

select
	[cd_filial_pickListMontagemVolume]		= ZNL_FILIAL
	,[cd_montagem_pickListMontagemVolume]	= ZNL_CODMNT
	,[cd_item_pickListMontagemVolume] 		= ZNL_ITEM
	,[cd_produto_pickListMontagemVolume]	= ZNL_CODPRO
	,[cd_local_pickListMontagemVolume] 		= ZNL_LOCAL
	,[cd_endereco_pickListMontagemVolume]	= ZNL_ENDERE
	,[qt_separar_pickListMontagemVolume]	= ZNL_QTSEPA
	,[cd_reserva_pickListMontagemVolume]	= ZNL_RESERV
	,[cd_recno_ZNL]							= R_E_C_N_O_
	,dt_criacao								= getdate()
	,dt_alteracao							= getdate()
from [bi_rip_rawZone_bck].dbo.ZNL010
where D_E_L_E_T_ = ''

) origem on  
(		
	origem.cd_recno_ZNL = destino.cd_recno_ZNL
)


WHEN MATCHED THEN
	UPDATE SET 
	destino.[cd_filial_pickListMontagemVolume] 	    = origem.[cd_filial_pickListMontagemVolume] 
	,destino.[cd_montagem_pickListMontagemVolume]	= origem.[cd_montagem_pickListMontagemVolume]
	,destino.[cd_item_pickListMontagemVolume] 		= origem.[cd_item_pickListMontagemVolume] 	
	,destino.[cd_produto_pickListMontagemVolume]	= origem.[cd_produto_pickListMontagemVolume]
	,destino.[cd_local_pickListMontagemVolume]		= origem.[cd_local_pickListMontagemVolume]	
	,destino.[cd_endereco_pickListMontagemVolume]	= origem.[cd_endereco_pickListMontagemVolume]
	,destino.[qt_separar_pickListMontagemVolume]	= origem.[qt_separar_pickListMontagemVolume]
	,destino.[cd_reserva_pickListMontagemVolume]	= origem.[cd_reserva_pickListMontagemVolume]
	,destino.dt_alteracao							= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		origem.[cd_filial_pickListMontagemVolume] 
		,origem.[cd_montagem_pickListMontagemVolume]
		,origem.[cd_item_pickListMontagemVolume] 	
		,origem.[cd_produto_pickListMontagemVolume]
		,origem.[cd_local_pickListMontagemVolume]	
		,origem.[cd_endereco_pickListMontagemVolume]
		,origem.[qt_separar_pickListMontagemVolume]
		,origem.[cd_reserva_pickListMontagemVolume]
		,origem.[cd_recno_ZNL]
		,origem.dt_criacao
		,origem.dt_alteracao								
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas


GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_ProcessadosRPA]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_tb_fat_ProcessadosRPA]

as 

declare @linhas int;

merge [dbo].[tb_fat_ProcessadosRPA] as destino

using (


	select
		[cd_ID]							= ID
      ,[dt_Data_do_Email]				= [Data do Email] 
      ,[ds_Origem_do_Email]				= [Origem do Email] 
      ,[dt_Data_do_processamento]		= [Data do Processamento] 
      ,[ds_Status]						= [Status] 
	  ,[ds_Arquivo_PDF]					= [Arquivo PDF]
	  ,[ds_CPF]							= [CPF]	
	  ,[ds_Funcionario]					= [Funcionario]
      ,[dt_criacao]						= getdate()
      ,[dt_alteracao]					= getdate()
	
	from [bi_rip_rawZone_bck].dbo.[Processados] as ProcessadosRPA


) origem on  
(		
	origem.cd_ID = destino.cd_ID
)

WHEN MATCHED THEN
	UPDATE SET 
	
	 destino.cd_ID									= origem.cd_ID				
	,destino.dt_Data_do_Email						= origem.dt_Data_do_Email				
	,destino.ds_Origem_do_Email						= origem.ds_Origem_do_Email
	,destino.dt_Data_do_processamento				= origem.dt_Data_do_processamento
	,destino.ds_Status								= origem.ds_Status
	,destino.ds_Arquivo_PDF							= origem.ds_Arquivo_PDF
	,destino.ds_CPF									= origem.ds_CPF
	,destino.ds_Funcionario							= origem.ds_Funcionario
	,destino.dt_alteracao							= getdate()

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
			
			origem.cd_ID				
			,origem.dt_Data_do_Email		
			,origem.ds_Origem_do_Email
			,origem.dt_Data_do_processamento
			,origem.ds_Status
			,origem.ds_Arquivo_PDF
			,origem.ds_CPF
			,origem.ds_Funcionario
			,origem.dt_criacao							
			,origem.dt_alteracao
		)			

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas


GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_requisicoesArmazem]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






create proc [dbo].[sp_tb_fat_requisicoesArmazem]

as
begin

declare @parametro_retorno varchar(100)
execute @parametro_retorno  = sp_retornaParametroParaVariavel 'SCP010'

declare @linhas int;

merge tb_fat_requisicoesArmazem as destino

using (


SELECT 

       [cd_filial_requisicoesArmazem]									= [CP_FILIAL]
      ,[nr_requisicao_requisicoesArmazem]								= [CP_NUM]
      ,[nr_item_requisicoesArmazem]										= [CP_ITEM]
      ,[cd_produto_requisicoesArmazem]									= [CP_PRODUTO]
      ,[ds_unidadeMedida_requisicoesArmazem]							= [CP_UM]
      ,[qt_requisicao_requisicoesArmazem]								= [CP_QUANT]
      ,[ds_segundaUnidadeMedida_requisicoesArmazem]						= [CP_SEGUM]
      ,[qt_segundaRequisicao_requisicoesArmazem]						= [CP_QTSEGUM]
      ,[dt_necessidade_requisicoesArmazem]								= [CP_DATPRF]
      ,[cd_armazem_requisicoesArmazem]									= [CP_LOCAL]
      ,[ds_observacao_requisicoesArmazem]								= [CP_OBS]
      ,[cd_ordemProducao_requisicoesArmazem]							= [CP_OP]
      ,[cd_centroCusto_requisicoesArmazem]								= [CP_CC]
      ,[cd_contaContabil_requisicoesArmazem]							= [CP_CONTA]
      ,[dt_emissao_requisicoesArmazem]									= [CP_EMISSAO]
      ,[ds_requisicao_requisicoesArmazem]								= [CP_DESCRI]
      ,[cd_solicitacao_requisicoesArmazem]								= [CP_CODSOLI]
      ,[cd_solicitante_requisicoesArmazem]								= [CP_SOLICIT]
      ,[qt_atendida_requisicoesArmazem]									= [CP_QUJE]
      ,[fl_saMarcada_requisicoesArmazem]								= [CP_OK]
      ,[fl_preRequisicao_requisicoesArmazem]							= [CP_PREREQU]
      ,[st_requisicao_requisicoesArmazem]								= [CP_STATUS]
      ,[nr_os_requisicoesArmazem]										= [CP_NUMOS]
      ,[cd_SequenciaRepairCenter_requisicoesArmazem]					= [CP_SEQRC]
      ,[nr_itemContabil_requisicoesArmazem]								= [CP_ITEMCTA]
      ,[cd_classeValor_requisicoesArmazem]								= [CP_CLVL]
      ,[fl_utilizaGerencProjeto_requisicoesArmazem]						= [CP_PROJETO]
      ,[cd_usuario_requisicoesArmazem]									= [CP_USER]
      ,[nr_solicitacaoCompra_requisicoesArmazem]						= [CP_NUMSC]
      ,[cd_itemSolicitacaoCompra_requisicoesArmazem]					= [CP_ITSC]
      ,[st_solicitacaoArmazem_requisicoesArmazem]						= [CP_STATSA]
      ,[vl_saldoBloqueio_requisicoesArmazem]							= [CP_SALBLQ]
      ,[cd_medidaPneu_requisicoesArmazem]								= [CP_MEDIDA]
      ,[vl_sulcoMinimoDesejado_requisicoesArmazem]						= [CP_SULCMI]
      ,[vl_sulcoMaximoDesejado_requisicoesArmazem]						= [CP_SULCMA]
      ,[cd_tipoModelo_requisicoesArmazem]								= [CP_TIPMOD]
      ,[nr_loteTransferencia_requisicoesArmazem]						= [CP_LOTE]
      ,[cd_rateio_requisicoesArmazem]									= [CP_RATEIO]
      ,[fl_consomeEstoque_requisicoesArmazem]							= [CP_CONSEST]
      ,[nr_boletim_requisicoesArmazem]									= [CP_NRBPIMS]
      ,[vl_unitario_requisicoesArmazem]									= [CP_VUNIT]
      ,[cd_EC05DB_requisicoesArmazem]									= [CP_EC05DB]
      ,[cd_EC05CR_requisicoesArmazem]									= [CP_EC05CR]
      ,[cd_EC06DB_requisicoesArmazem]									= [CP_EC06DB]
      ,[cd_EC06CR_requisicoesArmazem]									= [CP_EC06CR]
      ,[cd_EC07DB_requisicoesArmazem]									= [CP_EC07DB]
      ,[cd_EC07CR_requisicoesArmazem]									= [CP_EC07CR]
      ,[cd_EC08DB_requisicoesArmazem]									= [CP_EC08DB]
      ,[cd_EC08CR_requisicoesArmazem]									= [CP_EC08CR]
      ,[cd_EC09DB_requisicoesArmazem]									= [CP_EC09DB]
      ,[cd_EC09CR_requisicoesArmazem]									= [CP_EC09CR]
      ,[nr_fluig_requisicoesArmazem]									= [CP_ZZFLUIG]
      ,[fl_emergencia_requisicoesArmazem]								= [CP_ZZEMERG]
      ,[tp_usoRip_requisicoesArmazem]									= [CP_ZZUSO]
      ,[dt_digitacao_requisicoesArmazem]								= [CP_ZZDTDIG]
      ,[cd_subFluig_requisicoesArmazem]									= [CP_ZSUBFLU]
      ,[cd_recno_SCP]													= [R_E_C_N_O_]
      ,[dt_criacao]														= getdate()
      ,[dt_alteracao]													= getdate()
from [bi_rip_rawZone_bck].dbo.SCP010 AS scp
where (CP_EMISSAO >=@parametro_retorno OR CP_EMISSAO = '') AND D_E_L_E_T_ = ''

) origem on  
(		
origem.cd_recno_SCP = destino.cd_recno_SCP
)

WHEN MATCHED THEN
	UPDATE SET 
	 destino.[cd_filial_requisicoesArmazem]					= origem.[cd_filial_requisicoesArmazem]						
	,destino.[nr_requisicao_requisicoesArmazem]				= origem.[nr_requisicao_requisicoesArmazem]					
	,destino.[nr_item_requisicoesArmazem]					= origem.[nr_item_requisicoesArmazem]						
	,destino.[cd_produto_requisicoesArmazem]				= origem.[cd_produto_requisicoesArmazem]						
	,destino.[ds_unidadeMedida_requisicoesArmazem]			= origem.[ds_unidadeMedida_requisicoesArmazem]			
	,destino.[qt_requisicao_requisicoesArmazem]				= origem.[qt_requisicao_requisicoesArmazem]					
	,destino.[ds_segundaUnidadeMedida_requisicoesArmazem]	= origem.[ds_segundaUnidadeMedida_requisicoesArmazem]		
	,destino.[qt_segundaRequisicao_requisicoesArmazem]		= origem.[qt_segundaRequisicao_requisicoesArmazem]		
	,destino.[dt_necessidade_requisicoesArmazem]			= origem.[dt_necessidade_requisicoesArmazem]					
	,destino.[cd_armazem_requisicoesArmazem]				= origem.[cd_armazem_requisicoesArmazem]						
	,destino.[ds_observacao_requisicoesArmazem]				= origem.[ds_observacao_requisicoesArmazem]					
	,destino.[cd_ordemProducao_requisicoesArmazem]			= origem.[cd_ordemProducao_requisicoesArmazem]			
	,destino.[cd_centroCusto_requisicoesArmazem]			= origem.[cd_centroCusto_requisicoesArmazem]					
	,destino.[cd_contaContabil_requisicoesArmazem]			= origem.[cd_contaContabil_requisicoesArmazem]			
	,destino.[dt_emissao_requisicoesArmazem]				= origem.[dt_emissao_requisicoesArmazem]						
	,destino.[ds_requisicao_requisicoesArmazem]				= origem.[ds_requisicao_requisicoesArmazem]					
	,destino.[cd_solicitacao_requisicoesArmazem]			= origem.[cd_solicitacao_requisicoesArmazem]					
	,destino.[cd_solicitante_requisicoesArmazem]			= origem.[cd_solicitante_requisicoesArmazem]					
	,destino.[qt_atendida_requisicoesArmazem]				= origem.[qt_atendida_requisicoesArmazem]					
	,destino.[fl_saMarcada_requisicoesArmazem]				= origem.[fl_saMarcada_requisicoesArmazem]				
	,destino.[fl_preRequisicao_requisicoesArmazem]			= origem.[fl_preRequisicao_requisicoesArmazem]			
	,destino.[st_requisicao_requisicoesArmazem]				= origem.[st_requisicao_requisicoesArmazem]					
	,destino.[nr_os_requisicoesArmazem]						= origem.[nr_os_requisicoesArmazem]							
	,destino.[cd_SequenciaRepairCenter_requisicoesArmazem]	= origem.[cd_SequenciaRepairCenter_requisicoesArmazem]	
	,destino.[nr_itemContabil_requisicoesArmazem]			= origem.[nr_itemContabil_requisicoesArmazem]				
	,destino.[cd_classeValor_requisicoesArmazem]			= origem.[cd_classeValor_requisicoesArmazem]					
	,destino.[fl_utilizaGerencProjeto_requisicoesArmazem]	= origem.[fl_utilizaGerencProjeto_requisicoesArmazem]		
	,destino.[cd_usuario_requisicoesArmazem]				= origem.[cd_usuario_requisicoesArmazem]						
	,destino.[nr_solicitacaoCompra_requisicoesArmazem]		= origem.[nr_solicitacaoCompra_requisicoesArmazem]		
	,destino.[cd_itemSolicitacaoCompra_requisicoesArmazem]	= origem.[cd_itemSolicitacaoCompra_requisicoesArmazem]	
	,destino.[st_solicitacaoArmazem_requisicoesArmazem]		= origem.[st_solicitacaoArmazem_requisicoesArmazem]			
	,destino.[vl_saldoBloqueio_requisicoesArmazem]			= origem.[vl_saldoBloqueio_requisicoesArmazem]			
	,destino.[cd_medidaPneu_requisicoesArmazem]				= origem.[cd_medidaPneu_requisicoesArmazem]					
	,destino.[vl_sulcoMinimoDesejado_requisicoesArmazem]	= origem.[vl_sulcoMinimoDesejado_requisicoesArmazem]			
	,destino.[vl_sulcoMaximoDesejado_requisicoesArmazem]	= origem.[vl_sulcoMaximoDesejado_requisicoesArmazem]			
	,destino.[cd_tipoModelo_requisicoesArmazem]				= origem.[cd_tipoModelo_requisicoesArmazem]					
	,destino.[nr_loteTransferencia_requisicoesArmazem]		= origem.[nr_loteTransferencia_requisicoesArmazem]		
	,destino.[cd_rateio_requisicoesArmazem]					= origem.[cd_rateio_requisicoesArmazem]						
	,destino.[fl_consomeEstoque_requisicoesArmazem]			= origem.[fl_consomeEstoque_requisicoesArmazem]				
	,destino.[nr_boletim_requisicoesArmazem]				= origem.[nr_boletim_requisicoesArmazem]						
	,destino.[vl_unitario_requisicoesArmazem]				= origem.[vl_unitario_requisicoesArmazem]					
	,destino.[cd_EC05DB_requisicoesArmazem]					= origem.[cd_EC05DB_requisicoesArmazem]						
	,destino.[cd_EC05CR_requisicoesArmazem]					= origem.[cd_EC05CR_requisicoesArmazem]						
	,destino.[cd_EC06DB_requisicoesArmazem]					= origem.[cd_EC06DB_requisicoesArmazem]						
	,destino.[cd_EC06CR_requisicoesArmazem]					= origem.[cd_EC06CR_requisicoesArmazem]						
	,destino.[cd_EC07DB_requisicoesArmazem]					= origem.[cd_EC07DB_requisicoesArmazem]						
	,destino.[cd_EC07CR_requisicoesArmazem]					= origem.[cd_EC07CR_requisicoesArmazem]						
	,destino.[cd_EC08DB_requisicoesArmazem]					= origem.[cd_EC08DB_requisicoesArmazem]						
	,destino.[cd_EC08CR_requisicoesArmazem]					= origem.[cd_EC08CR_requisicoesArmazem]						
	,destino.[cd_EC09DB_requisicoesArmazem]					= origem.[cd_EC09DB_requisicoesArmazem]						
	,destino.[cd_EC09CR_requisicoesArmazem]					= origem.[cd_EC09CR_requisicoesArmazem]						
	,destino.[nr_fluig_requisicoesArmazem]					= origem.[nr_fluig_requisicoesArmazem]					
	,destino.[fl_emergencia_requisicoesArmazem]				= origem.[fl_emergencia_requisicoesArmazem]					
	,destino.[tp_usoRip_requisicoesArmazem]					= origem.[tp_usoRip_requisicoesArmazem]						
	,destino.[dt_digitacao_requisicoesArmazem]				= origem.[dt_digitacao_requisicoesArmazem]				
	,destino.[cd_subFluig_requisicoesArmazem]				= origem.[cd_subFluig_requisicoesArmazem]					
	,destino.[cd_recno_SCP]									= origem.[cd_recno_SCP]																	
	,dt_alteracao											= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		  origem.[cd_filial_requisicoesArmazem]					
		 ,origem.[nr_requisicao_requisicoesArmazem]				
		 ,origem.[nr_item_requisicoesArmazem]						
		 ,origem.[cd_produto_requisicoesArmazem]					
		 ,origem.[ds_unidadeMedida_requisicoesArmazem]			
		 ,origem.[qt_requisicao_requisicoesArmazem]				
		 ,origem.[ds_segundaUnidadeMedida_requisicoesArmazem]		
		 ,origem.[qt_segundaRequisicao_requisicoesArmazem]		
		 ,origem.[dt_necessidade_requisicoesArmazem]				
		 ,origem.[cd_armazem_requisicoesArmazem]					
		 ,origem.[ds_observacao_requisicoesArmazem]				
		 ,origem.[cd_ordemProducao_requisicoesArmazem]			
		 ,origem.[cd_centroCusto_requisicoesArmazem]				
		 ,origem.[cd_contaContabil_requisicoesArmazem]			
		 ,origem.[dt_emissao_requisicoesArmazem]					
		 ,origem.[ds_requisicao_requisicoesArmazem]				
		 ,origem.[cd_solicitacao_requisicoesArmazem]				
		 ,origem.[cd_solicitante_requisicoesArmazem]				
		 ,origem.[qt_atendida_requisicoesArmazem]					
		 ,origem.[fl_saMarcada_requisicoesArmazem]				
		 ,origem.[fl_preRequisicao_requisicoesArmazem]			
		 ,origem.[st_requisicao_requisicoesArmazem]				
		 ,origem.[nr_os_requisicoesArmazem]						
		 ,origem.[cd_SequenciaRepairCenter_requisicoesArmazem]	
		 ,origem.[nr_itemContabil_requisicoesArmazem]				
		 ,origem.[cd_classeValor_requisicoesArmazem]				
		 ,origem.[fl_utilizaGerencProjeto_requisicoesArmazem]		
		 ,origem.[cd_usuario_requisicoesArmazem]					
		 ,origem.[nr_solicitacaoCompra_requisicoesArmazem]		
		 ,origem.[cd_itemSolicitacaoCompra_requisicoesArmazem]	
		 ,origem.[st_solicitacaoArmazem_requisicoesArmazem]		
		 ,origem.[vl_saldoBloqueio_requisicoesArmazem]			
		 ,origem.[cd_medidaPneu_requisicoesArmazem]				
		 ,origem.[vl_sulcoMinimoDesejado_requisicoesArmazem]		
		 ,origem.[vl_sulcoMaximoDesejado_requisicoesArmazem]		
		 ,origem.[cd_tipoModelo_requisicoesArmazem]				
		 ,origem.[nr_loteTransferencia_requisicoesArmazem]		
		 ,origem.[cd_rateio_requisicoesArmazem]					
		 ,origem.[fl_consomeEstoque_requisicoesArmazem]			
		 ,origem.[nr_boletim_requisicoesArmazem]					
		 ,origem.[vl_unitario_requisicoesArmazem]					
		 ,origem.[cd_EC05DB_requisicoesArmazem]					
		 ,origem.[cd_EC05CR_requisicoesArmazem]					
		 ,origem.[cd_EC06DB_requisicoesArmazem]					
		 ,origem.[cd_EC06CR_requisicoesArmazem]					
		 ,origem.[cd_EC07DB_requisicoesArmazem]					
		 ,origem.[cd_EC07CR_requisicoesArmazem]					
		 ,origem.[cd_EC08DB_requisicoesArmazem]					
		 ,origem.[cd_EC08CR_requisicoesArmazem]					
		 ,origem.[cd_EC09DB_requisicoesArmazem]					
		 ,origem.[cd_EC09CR_requisicoesArmazem]					
		 ,origem.[nr_fluig_requisicoesArmazem]					
		 ,origem.[fl_emergencia_requisicoesArmazem]				
		 ,origem.[tp_usoRip_requisicoesArmazem]					
		 ,origem.[dt_digitacao_requisicoesArmazem]				
		 ,origem.[cd_subFluig_requisicoesArmazem]					
		 ,origem.[cd_recno_SCP]									
		 ,origem.[dt_criacao]							
		 ,origem.[dt_alteracao]																								
		)

WHEN NOT MATCHED BY SOURCE and
	
	 (destino.dt_emissao_requisicoesArmazem >=
		 iif(@parametro_retorno=0
				,'1900-01-01'
					,DATEFROMPARTS(left(@parametro_retorno,4),right(left(@parametro_retorno,6),2),right(@parametro_retorno,2)))
		or destino.dt_emissao_requisicoesArmazem is null)

	THEN

	DELETE;

set @linhas = @@ROWCOUNT;

return @linhas

end

GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_reservaFaturamento]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[sp_tb_fat_reservaFaturamento]

as

declare @linhas int;
merge [tb_fat_reservaFaturamento] as destino

using (

select										
	cd_filial_reservaFaturamento        = [C0_FILIAL]		 
	,cd_reserva_reservaFaturamento       = [C0_NUM]			 
	,tp_reserva_reservaFaturamento       = [C0_TIPO]			 
	,cd_docReserva_reservaFaturamento    = [C0_DOCRES]		 
	,nm_solicit_reservaFaturamento       = [C0_SOLICIT]		 
	,cd_filialReserva_reservaFaturamento = [C0_FILRES]		 
	,cd_produto_reservaFaturamento       = [C0_PRODUTO]		 
	,cd_armazem_reservaFaturamento       = [C0_LOCAL]		 
	,qt_reserva_reservaFaturamento       = [C0_QUANT]		 
	,dt_validade_reservaFaturamento      = [C0_VALIDA]		 
	,dt_emissao_reservaFaturamento       = [C0_EMISSAO]		 
	,cd_subLote_reservaFaturamento       = [C0_NUMLOTE]		 
	,cd_lote_reservaFaturamento          = [C0_LOTECTL]		 
	,cd_endereco_reservaFaturamento      = [C0_LOCALIZ]		 
	,cd_numSerie_reservaFaturamento      = [C0_NUMSERI]		 
	,cd_qtdOriginal_reservaFaturamento   = [C0_QTDORIG]		 
	,qt_pedido_reservaFaturamento        = [C0_QTDPED]		 
	,ds_observacao_reservaFaturamento    = [C0_OBS]			 
	,qt_eliminacao_reservaFaturamento    = [C0_QTDELIM]		 
	,cd_recno_SC0						 = [R_E_C_N_O_]		 
	,cd_origem_reservaFaturamento        = [C0_ORIGEM]		  
	,dt_criacao								= getdate()
	,dt_alteracao							= getdate()
from [bi_rip_rawZone_bck].dbo.SC0010
where D_E_L_E_T_ = ''


) origem on  
(		
	origem.cd_recno_SC0 = destino.cd_recno_SC0
)


WHEN MATCHED THEN
	UPDATE SET 
	destino.cd_filial_reservaFaturamento       	    = origem.cd_filial_reservaFaturamento       
	,destino.cd_reserva_reservaFaturamento      	= origem.cd_reserva_reservaFaturamento      
	,destino.tp_reserva_reservaFaturamento      	= origem.tp_reserva_reservaFaturamento      
	,destino.cd_docReserva_reservaFaturamento   	= origem.cd_docReserva_reservaFaturamento   
	,destino.nm_solicit_reservaFaturamento      	= origem.nm_solicit_reservaFaturamento      
	,destino.cd_filialReserva_reservaFaturamento	= origem.cd_filialReserva_reservaFaturamento
	,destino.cd_produto_reservaFaturamento      	= origem.cd_produto_reservaFaturamento      
	,destino.cd_armazem_reservaFaturamento      	= origem.cd_armazem_reservaFaturamento      
	,destino.qt_reserva_reservaFaturamento      	= origem.qt_reserva_reservaFaturamento      
	,destino.dt_validade_reservaFaturamento     	= origem.dt_validade_reservaFaturamento     
	,destino.dt_emissao_reservaFaturamento      	= origem.dt_emissao_reservaFaturamento      
	,destino.cd_subLote_reservaFaturamento      	= origem.cd_subLote_reservaFaturamento      
	,destino.cd_lote_reservaFaturamento         	= origem.cd_lote_reservaFaturamento         
	,destino.cd_endereco_reservaFaturamento     	= origem.cd_endereco_reservaFaturamento     
	,destino.cd_numSerie_reservaFaturamento     	= origem.cd_numSerie_reservaFaturamento     
	,destino.cd_qtdOriginal_reservaFaturamento  	= origem.cd_qtdOriginal_reservaFaturamento  
	,destino.qt_pedido_reservaFaturamento       	= origem.qt_pedido_reservaFaturamento       
	,destino.ds_observacao_reservaFaturamento   	= origem.ds_observacao_reservaFaturamento   
	,destino.qt_eliminacao_reservaFaturamento   	= origem.qt_eliminacao_reservaFaturamento   
	,destino.cd_recno_SC0							= origem.cd_recno_SC0						
	,destino.cd_origem_reservaFaturamento       	= origem.cd_origem_reservaFaturamento       
	,destino.dt_alteracao							= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		origem.cd_filial_reservaFaturamento       
		,origem.cd_reserva_reservaFaturamento      
		,origem.tp_reserva_reservaFaturamento      
		,origem.cd_docReserva_reservaFaturamento   
		,origem.nm_solicit_reservaFaturamento      
		,origem.cd_filialReserva_reservaFaturamento
		,origem.cd_produto_reservaFaturamento      
		,origem.cd_armazem_reservaFaturamento      
		,origem.qt_reserva_reservaFaturamento      
		,origem.dt_validade_reservaFaturamento     
		,origem.dt_emissao_reservaFaturamento      
		,origem.cd_subLote_reservaFaturamento      
		,origem.cd_lote_reservaFaturamento         
		,origem.cd_endereco_reservaFaturamento     
		,origem.cd_numSerie_reservaFaturamento     
		,origem.cd_qtdOriginal_reservaFaturamento  
		,origem.qt_pedido_reservaFaturamento       
		,origem.ds_observacao_reservaFaturamento   
		,origem.qt_eliminacao_reservaFaturamento   
		,origem.cd_recno_SC0						
		,origem.cd_origem_reservaFaturamento
		,origem.dt_criacao
		,origem.dt_alteracao
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas


GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_solicitacoesCompras]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










---- exec [dbo].[sp_tb_fat_solicitacoesCompras]



CREATE proc [dbo].[sp_tb_fat_solicitacoesCompras]

as
begin

declare @parametro_retorno varchar(100)
execute @parametro_retorno  = sp_retornaParametroParaVariavel 'SC1010'

declare @linhas int;

merge tb_fat_solicitacoesCompras as destino

using (


select distinct
 cc_pedidosEmitidosXsolicitacoesCompras			= convert(varchar,rtrim(C1_FILIAL))+'|'+convert(varchar,rtrim(C1_ZCODZE1))+'|'+convert(varchar,rtrim(C1_ZITEZE1))+'|'+convert(varchar,rtrim(C1_PRODUTO))+'|'+convert(varchar,rtrim(C1_ZNSCFLU))
,cc_solicitacoesComprasXpedidosCompras			= C1_FILIAL+'|'+C1_PEDIDO+'|'+C1_ITEMPED+'|'+C1_PRODUTO --- C1_FILIAL+'|'+C1_NUM+'|'+C1_ITEM alterado 20/12/21
,cd_filial_solicitacoesCompras					= C1_FILIAL
,cd_solicitacao_solicitacoesCompras				= C1_NUM
,cd_item_solicitacoesCompras					= C1_ITEM
,cd_produto_solicitacoesCompras					= C1_PRODUTO
,ds_unidadeMedida_solicitacoesCompras			= C1_UM
,ds_produto_solicitacoesCompras					= C1_DESCRI
,qt_solicitada_solicitacoesCompras				= C1_QUANT
,vl_unitario_solicitacoesCompras				= C1_PRECO
,vl_total_solicitacoesCompras					= C1_TOTAL
,dt_previsaoNecessidade_solicitacoesCompras		= iif(C1_DATPRF='',null,DATEFROMPARTS(left(C1_DATPRF,4),right(left(C1_DATPRF,6),2),right(C1_DATPRF,2))) 
,ds_observacao_solicitacoesCompras				= C1_OBS
,cd_armazem_solicitacoesCompras					= C1_LOCAL
,cd_centroCusto_solicitacoesCompras				= C1_CC
,cd_contaContabil_solicitacoesCompras			= C1_CONTA
,cd_itemContaContabil_solicitacoesCompras		= C1_ITEMCTA
,dt_emissao_solicitacoesCompras					= iif(C1_EMISSAO='',null,DATEFROMPARTS(left(C1_EMISSAO,4),right(left(C1_EMISSAO,6),2),right(C1_EMISSAO,2))) 
,nr_cotacaoGerada_solicitacoesCompras			= C1_COTACAO
,cd_fornecedor_solicitacoesCompras				= C1_FORNECE
,cd_lojaForncedor_solicitacoesCompras			= C1_LOJA
,nr_pedidoCompra_solicitacoesCompras			= C1_PEDIDO
,cd_itemPedidoCompra_solicitacoesCompras		= C1_ITEMPED
,nm_solicitante_solicitacoesCompras				= C1_SOLICIT
,qt_emPedido_solicitacoesCompras				= C1_QUJE
,cd_comprador_solicitacoesCompras				= C1_CODCOMP
,cd_grupoCopradores_solicitacoesCompras			= C1_GRUPCOM
,cd_usuario_solicitacoesCompras					= C1_USER
,cd_filialEntrega_solicitacoesCompras			= C1_FILENT
,vl_unitarioEstimado_solicitacoesCompras		= C1_VUNIT
,cd_condicaoPagamento_solicitacoesCompras		= C1_CONDPAG
,fl_eliminarResiduo_solicitacoesCompras			= C1_RESIDUO
,qt_ooriginal_solicitacoesCompras				= C1_QTDORIG
,fl_aprovacao_solicitacoesCompras				= C1_APROV
,tp_solicitacao_solicitacoesCompras				= C1_TPSC
,fl_atualizaEstoque_solicitacoesCompras			= C1_ESTOQUE
,cd_filialOrigem_solicitacoesCompras			= C1_FISCORI
,cd_itemSolicitacaOrigem_solicitacoesCompras	= C1_ITSCORI
,cd_solicitacaoCompraOrigem_solicitacoesCompras = C1_SCORI
,tp_compra_solicitacoesCompras					= C1_TIPCOM
,nr_pedidoVenda_solicitacoesCompras				= C1_PEDRES
,nr_SubFluig_solicitacoesCompras				= C1_ZNSCFLU
,fl_emergencial_solicitacoesCompras				= C1_ZZEMERG
,cd_ze1_solicitacoesCompras						= C1_ZCODZE1
,cd_itemZe1_solicitacoesCompras					= C1_ZITEZE1
,cd_recno_SC1									= sc1.R_E_C_N_O_
,dt_criacao										= getdate()
,dt_alteracao									= getdate()
,dt_aprovacao_fluig_solicitacoesCompras			= iif(ZE1_DTINT='        ',null,DATEFROMPARTS(left(ZE1_DTINT,4),right(left(ZE1_DTINT,6),2),right(ZE1_DTINT,2))) 
from [bi_rip_rawZone_bck].dbo.SC1010 AS sc1
left join [bi_rip_rawZone_bck].dbo.ZE1010 AS ze1
	on C1_ZCODZE1 = ZE1_CODIGO and C1_ZITEZE1 = ZE1_ITEM and C1_ZNSCFLU = ZE1_FLUIG and C1_Filial = ZE1_FILORI and ze1.D_E_L_E_T_ = ''
where (C1_EMISSAO >=@parametro_retorno OR C1_EMISSAO = '') AND SC1.D_E_L_E_T_ = ''

) origem on  
(		
origem.cd_recno_SC1 = destino.cd_recno_SC1
)

WHEN MATCHED THEN
	UPDATE SET 
	 destino.cc_pedidosEmitidosXsolicitacoesCompras					= origem.cc_pedidosEmitidosXsolicitacoesCompras				
	,destino.cc_solicitacoesComprasXpedidosCompras					= origem.cc_solicitacoesComprasXpedidosCompras			
	,destino.cd_filial_solicitacoesCompras							= origem.cd_filial_solicitacoesCompras					
	,destino.cd_solicitacao_solicitacoesCompras						= origem.cd_solicitacao_solicitacoesCompras				
	,destino.cd_item_solicitacoesCompras							= origem.cd_item_solicitacoesCompras					
	,destino.cd_produto_solicitacoesCompras							= origem.cd_produto_solicitacoesCompras					
	,destino.ds_unidadeMedida_solicitacoesCompras					= origem.ds_unidadeMedida_solicitacoesCompras			
	,destino.ds_produto_solicitacoesCompras							= origem.ds_produto_solicitacoesCompras					
	,destino.qt_solicitada_solicitacoesCompras						= origem.qt_solicitada_solicitacoesCompras				
	,destino.vl_unitario_solicitacoesCompras						= origem.vl_unitario_solicitacoesCompras				
	,destino.vl_total_solicitacoesCompras							= origem.vl_total_solicitacoesCompras					
	,destino.dt_previsaoNecessidade_solicitacoesCompras				= origem.dt_previsaoNecessidade_solicitacoesCompras		
	,destino.ds_observacao_solicitacoesCompras						= origem.ds_observacao_solicitacoesCompras				
	,destino.cd_armazem_solicitacoesCompras							= origem.cd_armazem_solicitacoesCompras					
	,destino.cd_centroCusto_solicitacoesCompras						= origem.cd_centroCusto_solicitacoesCompras				
	,destino.cd_contaContabil_solicitacoesCompras					= origem.cd_contaContabil_solicitacoesCompras			
	,destino.cd_itemContaContabil_solicitacoesCompras				= origem.cd_itemContaContabil_solicitacoesCompras		
	,destino.dt_emissao_solicitacoesCompras							= origem.dt_emissao_solicitacoesCompras					
	,destino.nr_cotacaoGerada_solicitacoesCompras					= origem.nr_cotacaoGerada_solicitacoesCompras			
	,destino.cd_fornecedor_solicitacoesCompras						= origem.cd_fornecedor_solicitacoesCompras				
	,destino.cd_lojaForncedor_solicitacoesCompras					= origem.cd_lojaForncedor_solicitacoesCompras			
	,destino.nr_pedidoCompra_solicitacoesCompras					= origem.nr_pedidoCompra_solicitacoesCompras			
	,destino.cd_itemPedidoCompra_solicitacoesCompras				= origem.cd_itemPedidoCompra_solicitacoesCompras		
	,destino.nm_solicitante_solicitacoesCompras						= origem.nm_solicitante_solicitacoesCompras				
	,destino.qt_emPedido_solicitacoesCompras						= origem.qt_emPedido_solicitacoesCompras				
	,destino.cd_comprador_solicitacoesCompras						= origem.cd_comprador_solicitacoesCompras				
	,destino.cd_grupoCopradores_solicitacoesCompras					= origem.cd_grupoCopradores_solicitacoesCompras			
	,destino.cd_usuario_solicitacoesCompras							= origem.cd_usuario_solicitacoesCompras					
	,destino.cd_filialEntrega_solicitacoesCompras					= origem.cd_filialEntrega_solicitacoesCompras			
	,destino.vl_unitarioEstimado_solicitacoesCompras				= origem.vl_unitarioEstimado_solicitacoesCompras		
	,destino.cd_condicaoPagamento_solicitacoesCompras				= origem.cd_condicaoPagamento_solicitacoesCompras		
	,destino.fl_eliminarResiduo_solicitacoesCompras					= origem.fl_eliminarResiduo_solicitacoesCompras			
	,destino.qt_ooriginal_solicitacoesCompras						= origem.qt_ooriginal_solicitacoesCompras				
	,destino.fl_aprovacao_solicitacoesCompras						= origem.fl_aprovacao_solicitacoesCompras				
	,destino.tp_solicitacao_solicitacoesCompras						= origem.tp_solicitacao_solicitacoesCompras				
	,destino.fl_atualizaEstoque_solicitacoesCompras					= origem.fl_atualizaEstoque_solicitacoesCompras			
	,destino.cd_filialOrigem_solicitacoesCompras					= origem.cd_filialOrigem_solicitacoesCompras			
	,destino.cd_itemSolicitacaOrigem_solicitacoesCompras			= origem.cd_itemSolicitacaOrigem_solicitacoesCompras	
	,destino.cd_solicitacaoCompraOrigem_solicitacoesCompras 		= origem.cd_solicitacaoCompraOrigem_solicitacoesCompras 
	,destino.tp_compra_solicitacoesCompras							= origem.tp_compra_solicitacoesCompras					
	,destino.nr_pedidoVenda_solicitacoesCompras						= origem.nr_pedidoVenda_solicitacoesCompras				
	,destino.nr_SubFluig_solicitacoesCompras						= origem.nr_SubFluig_solicitacoesCompras				
	,destino.fl_emergencial_solicitacoesCompras						= origem.fl_emergencial_solicitacoesCompras				
	,destino.cd_ze1_solicitacoesCompras								= origem.cd_ze1_solicitacoesCompras						
	,destino.cd_itemZe1_solicitacoesCompras							= origem.cd_itemZe1_solicitacoesCompras		
	,destino.cd_recno_SC1											= origem.cd_recno_SC1											
	,dt_alteracao													= getdate()
	,destino.dt_aprovacao_fluig_solicitacoesCompras					= origem.dt_aprovacao_fluig_solicitacoesCompras

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		 origem.cc_pedidosEmitidosXsolicitacoesCompras				
		,origem.cc_solicitacoesComprasXpedidosCompras			
		,origem.cd_filial_solicitacoesCompras					
		,origem.cd_solicitacao_solicitacoesCompras				
		,origem.cd_item_solicitacoesCompras					
		,origem.cd_produto_solicitacoesCompras					
		,origem.ds_unidadeMedida_solicitacoesCompras			
		,origem.ds_produto_solicitacoesCompras					
		,origem.qt_solicitada_solicitacoesCompras				
		,origem.vl_unitario_solicitacoesCompras				
		,origem.vl_total_solicitacoesCompras					
		,origem.dt_previsaoNecessidade_solicitacoesCompras		
		,origem.ds_observacao_solicitacoesCompras				
		,origem.cd_armazem_solicitacoesCompras					
		,origem.cd_centroCusto_solicitacoesCompras				
		,origem.cd_contaContabil_solicitacoesCompras			
		,origem.cd_itemContaContabil_solicitacoesCompras		
		,origem.dt_emissao_solicitacoesCompras					
		,origem.nr_cotacaoGerada_solicitacoesCompras			
		,origem.cd_fornecedor_solicitacoesCompras				
		,origem.cd_lojaForncedor_solicitacoesCompras			
		,origem.nr_pedidoCompra_solicitacoesCompras			
		,origem.cd_itemPedidoCompra_solicitacoesCompras		
		,origem.nm_solicitante_solicitacoesCompras				
		,origem.qt_emPedido_solicitacoesCompras				
		,origem.cd_comprador_solicitacoesCompras				
		,origem.cd_grupoCopradores_solicitacoesCompras			
		,origem.cd_usuario_solicitacoesCompras					
		,origem.cd_filialEntrega_solicitacoesCompras			
		,origem.vl_unitarioEstimado_solicitacoesCompras		
		,origem.cd_condicaoPagamento_solicitacoesCompras		
		,origem.fl_eliminarResiduo_solicitacoesCompras			
		,origem.qt_ooriginal_solicitacoesCompras				
		,origem.fl_aprovacao_solicitacoesCompras				
		,origem.tp_solicitacao_solicitacoesCompras				
		,origem.fl_atualizaEstoque_solicitacoesCompras			
		,origem.cd_filialOrigem_solicitacoesCompras			
		,origem.cd_itemSolicitacaOrigem_solicitacoesCompras	
		,origem.cd_solicitacaoCompraOrigem_solicitacoesCompras 
		,origem.tp_compra_solicitacoesCompras					
		,origem.nr_pedidoVenda_solicitacoesCompras				
		,origem.nr_SubFluig_solicitacoesCompras				
		,origem.fl_emergencial_solicitacoesCompras				
		,origem.cd_ze1_solicitacoesCompras						
		,origem.cd_itemZe1_solicitacoesCompras		
		,origem.cd_recno_SC1									
		,origem.dt_criacao										
		,origem.dt_alteracao	
		,origem.dt_aprovacao_fluig_solicitacoesCompras																					
		)

WHEN NOT MATCHED BY SOURCE and
	
	 (destino.dt_emissao_solicitacoesCompras >=
		 iif(@parametro_retorno=0
				,'1900-01-01'
					,DATEFROMPARTS(left(@parametro_retorno,4),right(left(@parametro_retorno,6),2),right(@parametro_retorno,2)))
		or destino.dt_emissao_solicitacoesCompras is null)

	THEN

	DELETE;

set @linhas = @@ROWCOUNT;

return @linhas

end


GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_solicitacoesSeparacoes]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

















--- exec [dbo].[sp_tb_fat_solicitacoesSeparacoes] 


CREATE proc [dbo].[sp_tb_fat_solicitacoesSeparacoes] 

as 

declare @linhas int;

declare @parametro_retorno varchar(100)
execute @parametro_retorno  = sp_retornaParametroParaVariavel 'ZE3010'

merge tb_fat_solicitacoesSeparacoes as destino

using (

select

	--sk_destino									= null 
	 cc_solicitacoesSeparacoesXpedidosVendas								= substring(ZE3_IDPEDI,1,8)+'|'+right(rtrim(ZE3_IDPEDI),2) -- add 14/10 +right(ZE3_IDPEDI,2)
	,cc_pedidosEmitidosXsolicitacoesSeparacoes								= ZE3_FILIAL+'|'+ZE3_CODRQ+'|'+ZE3_ITEMRQ+'|'+ZE3_PRODUT
	,cc_solicitacoesSeparacoesXpedidosTransferencias						= SUBSTRING(ZE3_IDSOLT,1,2)+'|'+SUBSTRING(ZE3_IDSOLT,3,10)+'|'+ZE3_PRODUT -- add. 14/10 +ZE3_PRODUT 
	,cd_filial_solicitacoesSeparacoes										= ZE3_FILIAL			
	,cd_item_solicitacoesSeparacoes											= ZE3_ITEM			
	,cd_requisicao_solicitacoesSeparacoes									= ZE3_CODRQ			
	,cd_itemRequisicao_solicitacoesSeparacoes								= ZE3_ITEMRQ			
	,cd_produto_solicitacoesSeparacoes										= ZE3_PRODUT			
	,qt_produto_solicitacoesSeparacoes										= ZE3_QUANT			
	,qt_separada_solicitacoesSeparacoes										= ZE3_QDESEP			
	,nm_enderecoOrigem_solicitacoesSeparacoes								= ZE3_ORIGEM			
	,nm_enderecoDestino_solicitacoesSeparacoes								= ZE3_DESTIN			
	,dt_separacao_solicitacoesSeparacoes									= iif(ZE3_DTSEPA='',null,DATEFROMPARTS(left(ZE3_DTSEPA,4),right(left(ZE3_DTSEPA,6),2),right(ZE3_DTSEPA,2)))				
	,cd_usuarioSeparador_solicitacoesSeparacoes								= ZE3_USERSE			
	,ds_observacao_solicitacoesSeparacoes									= ZE3_OBS			
	,nm_local_solicitacoesSeparacoes										= ZE3_LOCAL			
	,st_separacao_solicitacoesSeparacoes									= ZE3_STATUS			
	,cd_usuarioOrdemServico_solicitacoesSeparacoes							= ZE3_USER			
	,nr_solicitacaoTransferencia_solicitacoesSeparacoes						= ZE3_NUMST			
	,st_emPedidoVenda_solicitacoesSeparacoes								= ZE3_EMPEDI			
	,st_emRequisicao_solicitacoesSeparacoes									= ZE3_EMREQU			
	,st_emTransferencia_solicitacoesSeparacoes								= ZE3_EMTRAN			
	,nr_pedidoVenda_solicitacoesSeparacoes									= ZE3_IDPEDI			
	,nr_soliciatacaoTransferencia_solicitacoesSeparacoes					= ZE3_IDSOLT			
	,nr_requisicao_solicitacoesSeparacoes									= ZE3_IDREQU			
	,dt_atendimento_solicitacoesSeparacoes									= iif(ZE3_DTATEN='',null,DATEFROMPARTS(left(ZE3_DTATEN,4),right(left(ZE3_DTATEN,6),2),right(ZE3_DTATEN,2)))	
	,hr_atendimento_solicitacoesSeparacoes									= ZE3_HORAAT			
	,nm_uruarioAtendimento_solicitacoesSeparacoes							= ZE3_USUATE			
	,cd_transferencia_solicitacoesSeparacoes								= ZE3_IDTRAN			
	,cd_centroCusto_solicitacoesSeparacoes									= ZE3_CC				
	,dt_emissao_solicitacoesSeparacoes										= iif(ZE3_EMISSA='',null,DATEFROMPARTS(left(ZE3_EMISSA,4),right(left(ZE3_EMISSA,6),2),right(ZE3_EMISSA,2)))
	,nm_armarioDestino_solicitacoesSeparacoes								= ZE3_LOCALD
	,nm_ControleEndereco_solicitacoesSeparacoes							=	 ZE3_CTLREN
	,cd_recno_ZE3									= R_E_C_N_O_
	,dt_criacao										= getdate()
	,dt_alteracao									= getdate()
from [bi_rip_rawZone_bck].dbo.ZE3010
where D_E_L_E_T_ = '' and (ZE3_EMISSA>=@parametro_retorno OR ZE3_EMISSA = '')

) origem on  
(		
origem.cd_recno_ZE3 = destino.cd_recno_ZE3
)

WHEN MATCHED THEN
	UPDATE SET
	 cc_solicitacoesSeparacoesXpedidosVendas						= origem.cc_solicitacoesSeparacoesXpedidosVendas					
	,cc_pedidosEmitidosXsolicitacoesSeparacoes						= origem.cc_pedidosEmitidosXsolicitacoesSeparacoes					
	,cc_solicitacoesSeparacoesXpedidosTransferencias				= origem.cc_solicitacoesSeparacoesXpedidosTransferencias			
	,cd_filial_solicitacoesSeparacoes								= origem.cd_filial_solicitacoesSeparacoes							
	,cd_item_solicitacoesSeparacoes									= origem.cd_item_solicitacoesSeparacoes								
	,cd_requisicao_solicitacoesSeparacoes							= origem.cd_requisicao_solicitacoesSeparacoes						
	,cd_itemRequisicao_solicitacoesSeparacoes						= origem.cd_itemRequisicao_solicitacoesSeparacoes					
	,cd_produto_solicitacoesSeparacoes								= origem.cd_produto_solicitacoesSeparacoes							
	,qt_produto_solicitacoesSeparacoes								= origem.qt_produto_solicitacoesSeparacoes							
	,qt_separada_solicitacoesSeparacoes								= origem.qt_separada_solicitacoesSeparacoes							
	,nm_enderecoOrigem_solicitacoesSeparacoes						= origem.nm_enderecoOrigem_solicitacoesSeparacoes					
	,nm_enderecoDestino_solicitacoesSeparacoes						= origem.nm_enderecoDestino_solicitacoesSeparacoes					
	,dt_separacao_solicitacoesSeparacoes							= origem.dt_separacao_solicitacoesSeparacoes						
	,cd_usuarioSeparador_solicitacoesSeparacoes						= origem.cd_usuarioSeparador_solicitacoesSeparacoes					
	,ds_observacao_solicitacoesSeparacoes							= origem.ds_observacao_solicitacoesSeparacoes						
	,nm_local_solicitacoesSeparacoes								= origem.nm_local_solicitacoesSeparacoes							
	,st_separacao_solicitacoesSeparacoes							= origem.st_separacao_solicitacoesSeparacoes						
	,cd_usuarioOrdemServico_solicitacoesSeparacoes					= origem.cd_usuarioOrdemServico_solicitacoesSeparacoes				
	,nr_solicitacaoTransferencia_solicitacoesSeparacoes				= origem.nr_solicitacaoTransferencia_solicitacoesSeparacoes			
	,st_emPedidoVenda_solicitacoesSeparacoes						= origem.st_emPedidoVenda_solicitacoesSeparacoes					
	,st_emRequisicao_solicitacoesSeparacoes							= origem.st_emRequisicao_solicitacoesSeparacoes						
	,st_emTransferencia_solicitacoesSeparacoes						= origem.st_emTransferencia_solicitacoesSeparacoes					
	,nr_pedidoVenda_solicitacoesSeparacoes							= origem.nr_pedidoVenda_solicitacoesSeparacoes						
	,nr_soliciatacaoTransferencia_solicitacoesSeparacoes			= origem.nr_soliciatacaoTransferencia_solicitacoesSeparacoes		
	,nr_requisicao_solicitacoesSeparacoes							= origem.nr_requisicao_solicitacoesSeparacoes						
	,dt_atendimento_solicitacoesSeparacoes							= origem.dt_atendimento_solicitacoesSeparacoes						
	,hr_atendimento_solicitacoesSeparacoes							= origem.hr_atendimento_solicitacoesSeparacoes						
	,nm_uruarioAtendimento_solicitacoesSeparacoes					= origem.nm_uruarioAtendimento_solicitacoesSeparacoes				
	,cd_transferencia_solicitacoesSeparacoes						= origem.cd_transferencia_solicitacoesSeparacoes					
	,cd_centroCusto_solicitacoesSeparacoes							= origem.cd_centroCusto_solicitacoesSeparacoes						
	,dt_emissao_solicitacoesSeparacoes								= origem.dt_emissao_solicitacoesSeparacoes							
	,nm_armarioDestino_solicitacoesSeparacoes						= origem.nm_armarioDestino_solicitacoesSeparacoes					
	,nm_ControleEndereco_solicitacoesSeparacoes						= origem.nm_ControleEndereco_solicitacoesSeparacoes					
	,dt_alteracao													= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		 origem.cc_solicitacoesSeparacoesXpedidosVendas					
		,origem.cc_pedidosEmitidosXsolicitacoesSeparacoes					
		,origem.cc_solicitacoesSeparacoesXpedidosTransferencias			
		,origem.cd_filial_solicitacoesSeparacoes							
		,origem.cd_item_solicitacoesSeparacoes								
		,origem.cd_requisicao_solicitacoesSeparacoes						
		,origem.cd_itemRequisicao_solicitacoesSeparacoes					
		,origem.cd_produto_solicitacoesSeparacoes							
		,origem.qt_produto_solicitacoesSeparacoes							
		,origem.qt_separada_solicitacoesSeparacoes							
		,origem.nm_enderecoOrigem_solicitacoesSeparacoes					
		,origem.nm_enderecoDestino_solicitacoesSeparacoes					
		,origem.dt_separacao_solicitacoesSeparacoes						
		,origem.cd_usuarioSeparador_solicitacoesSeparacoes					
		,origem.ds_observacao_solicitacoesSeparacoes						
		,origem.nm_local_solicitacoesSeparacoes							
		,origem.st_separacao_solicitacoesSeparacoes						
		,origem.cd_usuarioOrdemServico_solicitacoesSeparacoes				
		,origem.nr_solicitacaoTransferencia_solicitacoesSeparacoes			
		,origem.st_emPedidoVenda_solicitacoesSeparacoes					
		,origem.st_emRequisicao_solicitacoesSeparacoes						
		,origem.st_emTransferencia_solicitacoesSeparacoes					
		,origem.nr_pedidoVenda_solicitacoesSeparacoes						
		,origem.nr_soliciatacaoTransferencia_solicitacoesSeparacoes		
		,origem.nr_requisicao_solicitacoesSeparacoes						
		,origem.dt_atendimento_solicitacoesSeparacoes						
		,origem.hr_atendimento_solicitacoesSeparacoes						
		,origem.nm_uruarioAtendimento_solicitacoesSeparacoes				
		,origem.cd_transferencia_solicitacoesSeparacoes					
		,origem.cd_centroCusto_solicitacoesSeparacoes						
		,origem.dt_emissao_solicitacoesSeparacoes							
		,origem.nm_armarioDestino_solicitacoesSeparacoes					
		,origem.nm_ControleEndereco_solicitacoesSeparacoes					
		,origem.cd_recno_ZE3						
		,origem.dt_criacao							
		,origem.dt_alteracao										
		)

WHEN NOT MATCHED BY SOURCE and 

	 (destino.dt_emissao_solicitacoesSeparacoes >=
		 iif(@parametro_retorno=0
				,'1900-01-01'
					,DATEFROMPARTS(left(@parametro_retorno,4),right(left(@parametro_retorno,6),2),right(@parametro_retorno,2)))
		or destino.dt_emissao_solicitacoesSeparacoes is null)

	THEN
	
	DELETE;

set @linhas = @@ROWCOUNT;
return @linhas


GO
/****** Object:  StoredProcedure [dbo].[sp_tb_fat_tarefaSeparacaoOT]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[sp_tb_fat_tarefaSeparacaoOT]

as

declare @linhas int
merge tb_fat_tarefaSeparacaoOT as destino

using (

select
	cd_filial_tarefaSeparacaoOT				= ZNQ_FILIAL
	,cd_montagem_tarefaSeparacaoOT 			= ZNQ_CODMNT
	,cd_itemVolume_tarefaSeparacaoOT		= ZNQ_ITEM
	,cd_produto_tarefaSeparacaoOT 			= ZNQ_CODPRO
	,cd_armazem_tarefaSeparacaoOT 			= ZNQ_LOCAL
	,cd_endereco_tarefaSeparacaoOT 			= ZNQ_ENDERE
	,cd_tarefa_tarefaSeparacaoOT 			= ZNQ_TAROFT
	,cd_requisicao_tarefaSeparacaoOT 		= ZNQ_REQSEP
	,cd_itemRequisicao_tarefaSeparacaoOT 	= ZNQ_ITREQ
	,qt_separado_tarefaSeparacaoOT 			= ZNQ_QTSEPA
	,[cd_recno_ZNQ]							= R_E_C_N_O_
	,dt_criacao								= getdate()
	,dt_alteracao							= getdate()
from [bi_rip_rawZone_bck].dbo.ZNQ010
where D_E_L_E_T_ = ''

) origem on  
(		
	origem.cd_recno_ZNQ = destino.cd_recno_ZNQ
)


WHEN MATCHED THEN
	UPDATE SET 
	destino.cd_filial_tarefaSeparacaoOT			= origem.cd_filial_tarefaSeparacaoOT		
	,destino.cd_montagem_tarefaSeparacaoOT 			= origem.cd_montagem_tarefaSeparacaoOT 		
	,destino.cd_itemVolume_tarefaSeparacaoOT		= origem.cd_itemVolume_tarefaSeparacaoOT	
	,destino.cd_produto_tarefaSeparacaoOT 			= origem.cd_produto_tarefaSeparacaoOT 		
	,destino.cd_armazem_tarefaSeparacaoOT 			= origem.cd_armazem_tarefaSeparacaoOT 		
	,destino.cd_endereco_tarefaSeparacaoOT 			= origem.cd_endereco_tarefaSeparacaoOT 		
	,destino.cd_tarefa_tarefaSeparacaoOT 			= origem.cd_tarefa_tarefaSeparacaoOT 		
	,destino.cd_requisicao_tarefaSeparacaoOT 		= origem.cd_requisicao_tarefaSeparacaoOT 	
	,destino.cd_itemRequisicao_tarefaSeparacaoOT	= origem.cd_itemRequisicao_tarefaSeparacaoOT
	,destino.qt_separado_tarefaSeparacaoOT 			= origem.qt_separado_tarefaSeparacaoOT 					
	,destino.dt_alteracao							= getdate()
	

WHEN NOT MATCHED THEN
	INSERT VALUES
		(
		origem.cd_filial_tarefaSeparacaoOT		
		,origem.cd_montagem_tarefaSeparacaoOT 		
		,origem.cd_itemVolume_tarefaSeparacaoOT	
		,origem.cd_produto_tarefaSeparacaoOT 		
		,origem.cd_armazem_tarefaSeparacaoOT 		
		,origem.cd_endereco_tarefaSeparacaoOT 		
		,origem.cd_tarefa_tarefaSeparacaoOT 		
		,origem.cd_requisicao_tarefaSeparacaoOT 	
		,origem.cd_itemRequisicao_tarefaSeparacaoOT
		,origem.qt_separado_tarefaSeparacaoOT
		,origem.cd_recno_ZNQ
		,origem.dt_criacao
		,origem.dt_alteracao
		)

WHEN NOT MATCHED BY SOURCE THEN
	
	DELETE;
set @linhas = @@ROWCOUNT;

return @linhas


GO
/****** Object:  StoredProcedure [dbo].[sp_tb_rel_distribuicaoWms]    Script Date: 24/01/2024 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROC [dbo].[sp_tb_rel_distribuicaoWms]
AS
DECLARE @linhas INT;
MERGE [tb_rel_distribuicaoWms] AS destino
using
(
SELECT ID_DISTRIBUTION_ITEM AS ID_DISTRIBUICAO,
           DT_DIS_REFERENCE_DATE AS DT_RETIRADA,
           NR_EMP_NUMBER AS CD_FUNCIONARIO,
           TX_EMP_NAME AS NM_FUNCIONARIO,
           TX_PRO_CODE AS CD_PRODUTO,
           B5_CEME AS NM_PRODUTO,
           B1_UM AS CD_UNIDADEMED,
           TX_BUU_CODE AS CD_FILIAL,
           TX_BUU_NAME AS NM_FILIAL,
           TX_WAR_CODE AS CD_ARMAZEM,
           TX_WAR_NAME AS NM_ARMAZEM,
           TX_WHA_ADDRESS AS CD_ENDERECO,
           VL_DIT_QUANTITY AS QT_DISTRIBUICAO,
           TX_USR_NAME AS NM_USUARIO,
           NR_DIT_ASSET AS DS_ATIVO,
           (
               SELECT TOP 1
                      TX_DIS_DESCRIPTION
               FROM bi_rip_rawZone_bck.dbo.TB_TSK_DISTRIBUTION_ITEM_STATUS
               WHERE ID_DISTRIBUTION_ITEM_STATUS =
               (
                   SELECT DISTRIBUTION_TASK_SENT_ERP_STATUS
                   FROM bi_rip_rawZone_bck.dbo.TB_DSH_DISTRIBUTION
                   WHERE DISTRIBUTION_TASK_ID = ID_DISTRIBUTION
               )
           ) AS DS_ENVIOERP,
           (
               SELECT TOP 1
                      TX_DIS_DESCRIPTION
               FROM bi_rip_rawZone_bck.dbo.TB_TSK_DISTRIBUTION_ITEM_STATUS
               WHERE ID_DISTRIBUTION_ITEM_STATUS =
               (
                   SELECT DISTRIBUTION_TASK_RECEIVED_ERP_STATUS
                   FROM bi_rip_rawZone_bck.dbo.TB_DSH_DISTRIBUTION
                   WHERE DISTRIBUTION_TASK_ID = ID_DISTRIBUTION
               )
           ) AS DS_RETORNOERP,
           [MESSAGE] AS DS_MSG,
           dt_criacao = GETDATE(),
           dt_alteracao = GETDATE()
    -- TABELAS
    FROM bi_rip_rawZone_bck.dbo.TB_TSK_DISTRIBUTION_ITEM
        INNER JOIN bi_rip_rawZone_bck.dbo.TB_TSK_DISTRIBUTION
            ON ID_DISTRIBUTION = ID_DIT_DISTRIBUTION
        LEFT OUTER JOIN bi_rip_rawZone_bck.dbo.TB_REG_BUSINESS_UNIT
            ON ID_DIS_BUSINESS_UNIT = ID_BUSINESS_UNIT
        LEFT OUTER JOIN bi_rip_rawZone_bck.dbo.TB_REG_PRODUCT
            ON ID_DIT_PRODUCT = ID_PRODUCT
        LEFT OUTER JOIN bi_rip_rawZone_bck.dbo.TB_REG_EMPLOYEE
            ON ID_DIS_EMPLOYEE = ID_EMPLOYEE
        LEFT OUTER JOIN bi_rip_rawZone_bck.dbo.SB5010
            ON B5_COD = TX_PRO_CODE
               AND SB5010.D_E_L_E_T_ = ''
        LEFT OUTER JOIN bi_rip_rawZone_bck.dbo.SB1010
            ON B1_COD = B5_COD
        LEFT OUTER JOIN bi_rip_rawZone_bck.dbo.TB_ACC_USER
            ON ID_DIS_OWNER = ID_USER
        LEFT OUTER JOIN bi_rip_rawZone_bck.dbo.TB_REG_WAREHOUSE
            ON ID_DIT_WAREHOUSE = ID_WAREHOUSE
        LEFT OUTER JOIN bi_rip_rawZone_bck.dbo.TB_REG_WAREHOUSE_ADDRESS
            ON ID_DIT_WAREHOUSE_ADDRESS = ID_WAREHOUSE_ADDRESS
        LEFT OUTER JOIN bi_rip_rawZone_bck.dbo.TB_TSK_DISTRIBUTION_ITEM_STATUS
            ON ID_DIT_STATUS = ID_DISTRIBUTION_ITEM_STATUS
        LEFT OUTER JOIN bi_rip_rawZone_bck.dbo.TB_DSH_DISTRIBUTION
            ON ID_DISTRIBUTION = DISTRIBUTION_TASK_ID
) origem
ON (origem.ID_DISTRIBUICAO = destino.ID_DISTRIBUICAO)
WHEN MATCHED THEN
    UPDATE SET DESTINO.DT_RETIRADA = ORIGEM.DT_RETIRADA,
               DESTINO.CD_FUNCIONARIO = ORIGEM.CD_FUNCIONARIO,
               DESTINO.NM_FUNCIONARIO = ORIGEM.NM_FUNCIONARIO,
               DESTINO.CD_PRODUTO = ORIGEM.CD_PRODUTO,
               DESTINO.NM_PRODUTO = ORIGEM.NM_PRODUTO,
               DESTINO.CD_UNIDADEMED = ORIGEM.CD_UNIDADEMED,
               DESTINO.CD_FILIAL = ORIGEM.CD_FILIAL,
               DESTINO.NM_FILIAL = ORIGEM.NM_FILIAL,
               DESTINO.CD_ARMAZEM = ORIGEM.CD_ARMAZEM,
               DESTINO.NM_ARMAZEM = ORIGEM.NM_ARMAZEM,
               DESTINO.CD_ENDERECO = ORIGEM.CD_ENDERECO,
               DESTINO.QT_DISTRIBUICAO = ORIGEM.QT_DISTRIBUICAO,
               DESTINO.NM_USUARIO = ORIGEM.NM_USUARIO,
               DESTINO.DS_ATIVO = ORIGEM.DS_ATIVO,
               DESTINO.DS_ENVIOERP = ORIGEM.DS_ENVIOERP,
               DESTINO.DS_RETORNOERP = ORIGEM.DS_RETORNOERP,
               DESTINO.DS_MSG = ORIGEM.DS_MSG,
               destino.dt_alteracao = GETDATE()
WHEN NOT MATCHED THEN
    INSERT VALUES
           (ORIGEM.ID_DISTRIBUICAO, ORIGEM.DT_RETIRADA, ORIGEM.CD_FUNCIONARIO, ORIGEM.NM_FUNCIONARIO,
            ORIGEM.CD_PRODUTO, ORIGEM.NM_PRODUTO, ORIGEM.CD_UNIDADEMED, ORIGEM.CD_FILIAL, ORIGEM.NM_FILIAL,
            ORIGEM.CD_ARMAZEM, ORIGEM.NM_ARMAZEM, ORIGEM.CD_ENDERECO, ORIGEM.QT_DISTRIBUICAO, ORIGEM.NM_USUARIO,
            ORIGEM.DS_ATIVO, ORIGEM.DS_ENVIOERP, ORIGEM.DS_RETORNOERP, ORIGEM.DS_MSG, origem.dt_criacao,
            origem.dt_alteracao)
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;
SET @linhas = @@ROWCOUNT;

RETURN @linhas

GO
