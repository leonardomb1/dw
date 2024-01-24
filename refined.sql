USE [bi_rip_refinedZone]
GO
/****** Object:  Schema [dpp]    Script Date: 24/01/2024 14:45:17 ******/
CREATE SCHEMA [dpp]
GO
/****** Object:  Schema [rpa]    Script Date: 24/01/2024 14:45:17 ******/
CREATE SCHEMA [rpa]
GO
/****** Object:  Schema [sau]    Script Date: 24/01/2024 14:45:17 ******/
CREATE SCHEMA [sau]
GO
/****** Object:  Schema [sup]    Script Date: 24/01/2024 14:45:17 ******/
CREATE SCHEMA [sup]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_pedidosEmitidosLegendas]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE function [dbo].[fn_pedidosEmitidosLegendas] (

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
/* 1  */(@fl_filialIgual+@fl_sede+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada),
/* 2  */(@fl_filialIgual+@fl_sede+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada),
/* 3  */(@fl_filialIgual+@fl_sede+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada),
/* 4  */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada),
/* 5  */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 6  */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada),
/* 7  */('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 8  */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+@fl_emPedidoDeCompras_menor_solicitada+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 9  */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+'X'+'X'+@fl_emPedidoDeCompras_menor_solicitada+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 10 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+@fl_emPedidoDeCompras_menor_emSolicitacaoDeCompras+'X'+@fl_emPedidoDeCompras_menor_solicitada+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada),
/* 11 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada),
/* 12 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada),
/* 13 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada),
/* 14 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'),
/* 15 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'),
/* 16 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emSolicitacaoDeTransferencia_menor_solicitada+'X'+'X'+'X'+'X'+'X'),
/* 17 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emSolicitacaoDeTransferencia_menor_solicitada+'X'+'X'+'X'+'X'+'X'),
/* 18 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_jaSeparadaNoEstoque_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'),
/* 19 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_jaSeparadaNoEstoque_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'),
/* 20 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_paraSeparacaoDeEstoque_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 21 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_paraSeparacaoDeEstoque_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 22 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 23 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 24 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+@fl_emPedidoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 25 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+@fl_emPedidoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 26 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+@fl_emPedidoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 27 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+'X'+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+@fl_emPedidoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 28 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 29 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 30 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 31 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 32 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 33 */(@fl_filialIgual+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 51 */('X'+@fl_sede+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada),
/* 52 */('X'+@fl_sede+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada),
/* 53 */('X'+@fl_sede+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada),
/* 54 */('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada),
/* 55 */('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'),
/* 56 */('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada),
/* 57 */('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada),
/* 58 */('X'+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada),
/* 59 */('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada),
/* 60 */('X'+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+'X'+'X'+'X'+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada),
/* 61 */('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'),
/* 62 */('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'),
/* 63 */('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'),
/* 64 */('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'),
/* 65 */('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'),
/* 66 */('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+'X'+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'),
/* 67 */('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_paraSeparacaoDeEstoque_menor_solicitada+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'),
/* 68 */('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+'X'+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_paraSeparacaoDeEstoque_menor_solicitada+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'),
/* 69 */('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+@fl_paraSeparacaoDeEstoque_menor_solicitada+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'),
/* 70 */('X'+@fl_sede+@fl_elimResiduo+'X'+'X'+'X'+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+@fl_paraSeparacaoDeEstoque_menor_solicitada+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+'X'),
/* 71 */('X'+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+'X'+'X'+@fl_difZero_paraSeparacaoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+'X'+'X'+@fl_emPedidoDeCompras_menor_solicitada+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+@fl_paraSeparacaoDeEstoque_menor_solicitada+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada),
/* 72 */('X'+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+'X'+'X'+'X'+'X'+'X'+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+'X'+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+'X'+'X'+@fl_emPedidoDeCompras_menor_solicitada+@fl_recebidaEmNotaFiscalDoFornecedor_menor_solicitada+@fl_paraSeparacaoDeEstoque_menor_solicitada+@fl_jaSeparadaNoEstoque_menor_solicitada+@fl_emSolicitacaoDeTransferencia_menor_solicitada+@fl_emNotaFiscalDeTransferenciaDeSaida_menor_solicitada+'X'+'X'+'X'+@fl_emMovimentoInternoDeEstoque_menor_solicitada),
/* 73 */('X'+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+@fl_difZero_emPedidoDeVenda+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+@fl_emPedidoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 74 */('X'+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+@fl_difZero_emPedidoDeVenda+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+@fl_emPedidoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 75 */('X'+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+@fl_difZero_emPedidoDeVenda+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 76 */('X'+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+@fl_difZero_emPedidoDeVenda+@fl_difZero_emMovimentoInternoDeEstoque+@fl_emSolicitacaoDeCompras_menor_solicitada+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'),
/* 77 */('X'+@fl_sede+@fl_elimResiduo+'X'+@fl_difZero_emSolicitacaoDeCompras+@fl_difZero_emPedidoDeCompras+@fl_difZero_recebidaEmNotaFiscalDoFornecedor+@fl_difZero_paraSeparacaoDeEstoque+@fl_difZero_jaSeparadaNoEstoque+@fl_difZero_emSolicitacaoDeTransferencia+@fl_difZero_emNotaFiscalDeTransferenciaDeSaida+'X'+'X'+@fl_difZero_emPedidoDeVenda+@fl_difZero_emMovimentoInternoDeEstoque+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X'+'X')


declare  @legendas table (cd_legendaMicro int , cd_condicionalLegenda varchar(150))


------ legendas e codigo indicador

insert into @legendas values
(1 ,'10XXXXXXXXXXXXXXXXX1XXXXXXX0' ),
(2 , '10XXXXXXXXXXXXXXXXX0XXXXXXX1' ),
(3 , '10XXXXXXXXXXXXXXXXX0XXXXXXX0' ),
(4 , '101XXX0XXXXXXX1XXXXXXXXXXXX1' ),
(5 , '101XXX1XXXXXXX0XXXX1XXXXXXXX' ),
(6 , '101XXX1XXXXXXX1XXXX1XXXXXXX1' ),
(7 , 'X01XXX0XXXXXXX0XXXXXXXXXXXXX' ),
(8 , '100XXX1XXXXXXX1XXX01XXXXXXXX' ),
(9 , '100XXX1XXXXXXX00XX01XXXXXXXX' ),
(10, '100XX11XXXXXXX001X11XXXXXXX1' ),
(11, '100XX10XXXXXXX1XXXX1XXXXXXX1' ),
(12, '100XXX1XXXXXXX01XXX1XXXXXXX1' ),
(13, '100X0X0XXXXXXX1XXXXXXXXXXXX1' ),
(14, '000XXXXXXXXXXXXXXXXXXXX0XXXX' ),
(15, '000XXXXXXX1XXXXXXXXXXXX1XXXX' ),
(16, '000XXXXXX10XXXXXXXXXXX0XXXXX' ),
(17, '000XXXXXX10XXXXXXXXXXX1XXXXX' ),
(18, '000XXXXX100XXXXXXXXXX0XXXXXX' ),
(19, '000XXXXX100XXXXXXXXXX1XXXXXX' ),
(20, '000XXXX1000XXXXXXXXX0XXXXXXX' ),
(21, '000XXXX1000XXXXXXXXX1XXXXXXX' ),
(22, '000XXX10000XXXXXXXX0XXXXXXXX' ),
(23, '000XXX10000XXXXXXXX1XXXXXXXX' ),
(24, '100XX10XXXXXXX0XXX0XXXXXXXXX' ),
(25, '100XX10XXXXXXX0XXX1XXXXXXXXX' ),
(26, '000XX10XXXXXXX0XXX1XXXXXXXXX' ),
(27, '000XX10XXXXXXX0XXX0XXXXXXXXX' ),
(28, '100X100XXXXXXX00XXXXXXXXXXXX' ),
(29, '000X100XXXXXXX00XXXXXXXXXXXX' ),
(30, '100X100XXXXXXX01XXXXXXXXXXXX' ),
(31, '000X100XXXXXXX01XXXXXXXXXXXX' ),
(32, '100X000XXXXXXX0XXXXXXXXXXXXX' ),
(33, '000X0000000XXX0XXXX1XXXXXXXX' ),
(51, 'X1XXXXXXXXXXXX1XXXXXXXX1XXX0' ),
(52, 'X1XXXXXXXXXXXXXXXXXXXXX0XXX1' ),
(53, 'X1XXXXXXXX1XXX1XXXXXXXX0XXX0' ),
(54, 'X11XXXXXXX0XXX1XXXXXXXXXXXX1' ),
(55, 'X11XXXXXXX1XXX0XXXXXXXX1XXXX' ),
(56, 'X11XXXXXXX1XXX1XXXXXXXX1XXX1' ),
(57, 'X11XXXXXXX0XXX0XXXXXXXX1XXX1' ),
(58, 'X10X1XXXXX1XXX1XXXXXX111XXX1' ),
(59, 'X10XXXXXXX1XXX0XXXXXX111XXX1' ),
(60, 'X10X1XXX000XXX1XXXXXXXXXXXX1' ),
(61, 'X10XXXXXX11XXXXXXXXXXX01XXXX' ),
(62, 'X10XXXXX111XXXXXXXXXX011XXXX' ),
(63, 'X10XXXXXX10XXXXXXXXXXX01XXXX' ),
(64, 'X10XXXXXX10XXXXXXXXXXX11XXXX' ),
(65, 'X10XXXXX100XXX0XXXXXX011XXXX' ),
(66, 'X10XXXXX100XXXXXXXXXX111XXXX' ),
(67, 'X10XXXX1000XXXXXXXXX0111XXXX' ),
(68, 'X10XXXX1000XXXXXXXXX1111XXXX' ),
(69, 'X10XXX10000XXXXXXXX01111XXXX' ),
(70, 'X10XXX10000XXXXXXXX11111XXXX' ),
(71, 'X10X0XX0XXXXXX11XX111111XXX1' ),
(72, 'X10X0XXXXX1XXX11XX111111XXX1' ),
(73, 'X10X1100000XX00XXX0XXXXXXXXX' ),
(74, 'X10X1100000XX00XXX1XXXXXXXXX' ),
(75, 'X10X1000000XX000XXXXXXXXXXXX' ),
(76, 'X10X1000000XX001XXXXXXXXXXXX' ),
(77, 'X10X0000000XX00XXXXXXXXXXXXX' )

--- se o codigo construido estiver dentro dos codigos mapeados, então retorna o primeiro
return (
	select top 1 cd_legendaMicro
	from @legendas 
	where convert(varchar,cd_condicionalLegenda) in (select convert(varchar,cd_condicionalLegenda) from @legendasCalculadas)
)

end
GO
/****** Object:  View [sup].[vw_dim_pedidosEmitidoslegendas]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE view  [sup].[vw_dim_pedidosEmitidoslegendas]

as

select 8 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entregue Parcial pelo SD3 e SD1 - Aguardando saldo chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 9 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entregue Parcial pelo SD1- Aguardando saldo chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 10 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entregue Parcial peo SD1 - Aguardando Comprar saldo' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 11 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entregue Parcial pelo SD3 - Aguardando saldo chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 12 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entregue Parcial pelo SD1 Forn -Saldo em Análise' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 13 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entregue Parcial pelo SD3 -Saldo em Análise' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 24 cd_legendaEmissaoMicro_pedidosEmitidos, 3 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Comprado Total Aguardando Chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando receber do fornecedor' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 25 cd_legendaEmissaoMicro_pedidosEmitidos, 3 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Comprado Parcial - Aguardando Chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando receber do fornecedor' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 28 cd_legendaEmissaoMicro_pedidosEmitidos, 2 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Em compras Total' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Compras' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 30 cd_legendaEmissaoMicro_pedidosEmitidos, 2 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Em compras Parcial' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Compras' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 32 cd_legendaEmissaoMicro_pedidosEmitidos, 1 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Em análise' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Análise' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 4 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Finalizado atendido parcial pelo SD3 - Res. Elim' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 5 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Finalizado atendido parcial pelo SD1 Forn - Res. Elim.' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 6 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Finalizado atendido parcial pelo SD3 e SD1 Forn - Res. Elim.' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 1 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Finalizado pelo SD3' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 2 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Finalizado pelo SD1 Forn' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 3 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Finalizado Pelo SD3 e Sd1 Forn' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 14 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais  - Finalizado - Entregue total pelo SD2' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 15 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais  - Entregue parcial pelo SD2 - Saldo em Análise' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 16 cd_legendaEmissaoMicro_pedidosEmitidos, 5 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais - Aguardando Transporte' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando Transporte' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 17 cd_legendaEmissaoMicro_pedidosEmitidos, 5 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais - Aguardando Transporte Parcial' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando Transporte' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 18 cd_legendaEmissaoMicro_pedidosEmitidos, 5 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais - Aguardando Transporte' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando Transporte' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 19 cd_legendaEmissaoMicro_pedidosEmitidos, 5 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais - Aguardando Transporte Parcial' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando Transporte' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 20 cd_legendaEmissaoMicro_pedidosEmitidos, 4 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais - Em Separação' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Separação' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 21 cd_legendaEmissaoMicro_pedidosEmitidos, 4 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais - Em Separação Parcial' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Separação' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 22 cd_legendaEmissaoMicro_pedidosEmitidos, 4 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais - Em Separação' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Separação' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 23 cd_legendaEmissaoMicro_pedidosEmitidos, 4 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais - Em Separação Parcial' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Separação' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 26 cd_legendaEmissaoMicro_pedidosEmitidos, 3 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais -  Comprado Parcial Aguardando Chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando receber do fornecedor' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 27 cd_legendaEmissaoMicro_pedidosEmitidos, 3 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais -  Comprado Total Aguardando Chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando receber do fornecedor' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 29 cd_legendaEmissaoMicro_pedidosEmitidos, 2 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Em compras Total - Entre Filiais' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Compras' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 31 cd_legendaEmissaoMicro_pedidosEmitidos, 2 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Em compras Parcial - Entre Filiais' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Compras' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 33 cd_legendaEmissaoMicro_pedidosEmitidos, 1 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais - Em Análise' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Análise' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 7 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Cancelada' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 58 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Entregue Parcial pelo SD3 e SD2- Aguardando saldo chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 59 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Entregue Parcial pelo SD2 - Aguardando saldo chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 60 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Entregue Parcial pelo SD3 - Aguardando saldo chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 61 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Entregue Parcial - Saldo Aguardando Transporte' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 62 cd_legendaEmissaoMicro_pedidosEmitidos, 5 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - AguardandoTrasnsporte do Saldo' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando Transporte' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 63 cd_legendaEmissaoMicro_pedidosEmitidos, 5 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Aguardando Tansporte' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando Transporte' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 64 cd_legendaEmissaoMicro_pedidosEmitidos, 5 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Aguardando Transporte Parcial' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando Transporte' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 65 cd_legendaEmissaoMicro_pedidosEmitidos, 5 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Aguardando Transporte' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando Transporte' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 66 cd_legendaEmissaoMicro_pedidosEmitidos, 5 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Aguardando Transporte Parcial' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando Transporte' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 67 cd_legendaEmissaoMicro_pedidosEmitidos, 4 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Em separação' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Separação' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 68 cd_legendaEmissaoMicro_pedidosEmitidos, 4 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Em separação Parcial' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Separação' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 69 cd_legendaEmissaoMicro_pedidosEmitidos, 4 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Aguardando Separação' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Separação' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 70 cd_legendaEmissaoMicro_pedidosEmitidos, 4 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Aguardando Separação Parcial' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Separação' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 71 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Entregue Parcial pelo SD3 -Saldo em Análise' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 72 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Entregue Parcial pelo SD3 e SD2 - Saldo em análise' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 73 cd_legendaEmissaoMicro_pedidosEmitidos, 3 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Comprado Aguardando Chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando receber do fornecedor' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 74 cd_legendaEmissaoMicro_pedidosEmitidos, 3 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Comprado Parcial - Aguardando Chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando receber do fornecedor' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 75 cd_legendaEmissaoMicro_pedidosEmitidos, 2 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Em compras Total' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Compras' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 76 cd_legendaEmissaoMicro_pedidosEmitidos, 2 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Em compras Parcial' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Compras' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 77 cd_legendaEmissaoMicro_pedidosEmitidos, 1 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Em análise' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Análise' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 54 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Finalizado atendido parcial pelo SD3 - Res. Elim' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 55 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Finalizado atendido parcial pelo SD2' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 56 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Finalizado atendido parcial pelo SD3 e SD2 Forn - Res. Elim.' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 57 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Cancelada' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 51 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Finalizado pelo SD3' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 52 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Finalizado pelo SD2' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 53 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Finalizado Pelo SD3 e SD2' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 34 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Finalizado Sem amarração' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 78 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Finalizado Sem amarração' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos 


GO
/****** Object:  View [sup].[vw_fat_pedidosEmitidos]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








--- select * from [sup].[vw_fat_pedidosEmitidos]




CREATE view [sup].[vw_fat_pedidosEmitidos]

as

select
 cd_pedido_pedidosEmitidos+'|'+cd_fluigEmissao_pedidosEmitidos+'|'+cd_produto_pedidosEmitidos+'|'+cd_itemEmissao_pedidosEmitidos as sk_emissao
,tp_emergencia_pedidosEmitidos = 
	iif(tp_emergencia_pedidosEmitidos='0','Não',
		iif(tp_emergencia_pedidosEmitidos='1','Mobilização Obra',
			iif(tp_emergencia_pedidosEmitidos='2','Aumento Escopo',
				iif(tp_emergencia_pedidosEmitidos='3','Aumento Efetivo',
					iif(tp_emergencia_pedidosEmitidos='4','Aceleração Obra',
						iif(tp_emergencia_pedidosEmitidos='5','Serviços Extras',
							iif(tp_emergencia_pedidosEmitidos='6','Solicitação Cliente','Não Definido / Não')))))))


,fl_cancelado_pedidosEmitidos = iif(st_emissao_pedidosEmitidos='P' and qt_entregue_pedidosEmitidos = 0,1,0)
,st_atendimento_pedidosEmitidos = iif(st_emissao_pedidosEmitidos in ('P','O'),'Finalizado','Aberto')
,lc_atendimento_pedidosEmitidos =
	iif(tp_atendimento_pedidosEmitidos='S','Sede',
		iif(tp_atendimento_pedidosEmitidos='L','Local','Indefinido'))
--,fl_existeSolicitacaoSeparacao = isnull((select count(*) from bi_rip_trustedZone.dbo.tb_fat_solicitacoesSeparacoes s where s.cc_pedidosEmitidosXsolicitacoesSeparacoes = emi.cc_pedidosEmitidosXsolicitacoesSeparacoes),0)
--,fl_existeSolicitacaoCompra = isnull((select count(*) from bi_rip_trustedZone.dbo.tb_fat_solicitacoesCompras s where s.cc_pedidosEmitidosXsolicitacoesCompras = emi.cc_pedidosEmitidosXsolicitacoesCompras),0)
,l.ds_legendaEmissaoMicro_pedidosEmitidos
,l.cd_legendaEmissaoMacro_pedidosEmitidos
,l.ds_legendaEmissaoMacro_pedidosEmitidos
,emi.[cc_pedidosEmitidosXsolicitacoesSeparacoes]
,emi.[cc_pedidosEmitidosXsolicitacoesCompras]
,emi.[cd_filialOrigem_pedidosEmitidos]
,emi.[cd_centroCusto_pedidosEmitidos]
,emi.[cd_filialDestino_pedidosEmitidos]
,emi.[cd_pedido_pedidosEmitidos]
,emi.[cd_itemEmissao_pedidosEmitidos]
,emi.[cd_fluigEmissao_pedidosEmitidos]
,emi.[dt_emissao_pedidosEmitidos]
,emi.[cd_produto_pedidosEmitidos]
,emi.[qt_solicitada_pedidosEmitidos]
,emi.[tp_atendimento_pedidosEmitidos]
,emi.[dt_necessidade_pedidosEmitidos]
,emi.[qt_entregue_pedidosEmitidos]
,emi.[nm_local_pedidosEmitidos]
,emi.[qt_aSeparar_pedidosEmitidos]
,emi.[qt_aComprar_pedidosEmitidos]
,emi.[ds_observacaoASeparar_pedidosEmitidos]
,emi.[ds_observacaoAComprar_pedidosEmitidos]
,emi.[st_emissao_pedidosEmitidos]
,emi.[cd_solicitante_pedidosEmitidos]
,emi.[nm_solicitante_pedidosEmitidos]
,emi.[cd_localDestino_pedidosEmitidos]
,emi.[ds_complementoEimssao_pedidosEmitidos]
,emi.[nr_ordemServico_pedidosEmitidos]
,emi.[tp_usoMaterial_pedidosEmitidos]
,emi.[st_wms_pedidosEmitidos]
,emi.[st_rm_pedidosEmitidos]
,emi.[cd_recno_ZE1]
,emi.[dt_criacao]
,emi.[dt_alteracao]
,emi.[qt_emSolicitacaoDeCompras_pedidosEmitidos]
,emi.[qt_emPedidoDeCompras_pedidosEmitidos]
,emi.[qt_recebidaEmNotaFiscalDoFornecedor_pedidosEmitidos]
,emi.[qt_paraSeparacaoDeEstoque_pedidosEmitidos]
,emi.[qt_jaSeparadaNoEstoque_pedidosEmitidos]
,emi.[qt_emSolicitacaoDeTransferencia_pedidosEmitidos]
,emi.[qt_emNotaFiscalDeTransferenciaDeSaida_pedidosEmitidos]
,emi.[qt_emNotaFiscalDeEntradaTransferenciaEmTransito_pedidosEmitidos]
,emi.[qt_emNotaFiscalDeEntradaTransferenciaClassificada_pedidosEmitidos]
,emi.[qt_emPedidoDeVenda_pedidosEmitidos]
,emi.[qt_emMovimentoInternoDeEstoque_pedidosEmitidos]
,emi.[cd_legendaEmissaoMicro_pedidosEmitidos]
--,ds_pedidoEmitido_statusPedidosEmitidos
from bi_rip_trustedZone.dbo.tb_fat_pedidosEmitidos as emi with (nolock)

--left join bi_rip_trustedZone.dbo.tb_dim_statusPedidosEmitidos as st with (nolock)
--on st.st_pedidoEmitido_statusPedidosEmitidos = emi.st_rm_pedidosEmitidos

left join bi_rip_refinedZone.sup.vw_dim_pedidosEmitidosLegendas as l with (nolock)
on l.cd_legendaEmissaoMicro_pedidosEmitidos = emi.cd_legendaEmissaoMicro_pedidosEmitidos

--where dt_emissao_pedidosEmitidos >= '2021-01-01'


GO
/****** Object:  View [sup].[vw_dim_grupoProdutosEmergenciais]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [sup].[vw_dim_grupoProdutosEmergenciais]

as

select cd_grupoEmergencial = '315'   union
select cd_grupoEmergencial = '340'   union
select cd_grupoEmergencial = '360'   union
select cd_grupoEmergencial = '810'   union
select cd_grupoEmergencial = '820'   union
select cd_grupoEmergencial = '840'   union
select cd_grupoEmergencial = '910'   union
select cd_grupoEmergencial = '920'   union
select cd_grupoEmergencial = '0315'  union
select cd_grupoEmergencial = '0340'  union
select cd_grupoEmergencial = '0360'  union
select cd_grupoEmergencial = '0810'  union
select cd_grupoEmergencial = '0820'  union
select cd_grupoEmergencial = '0840'  union
select cd_grupoEmergencial = '0910'  union
select cd_grupoEmergencial = '0920'  union
select cd_grupoEmergencial = '1210'  union
select cd_grupoEmergencial = '1220'  union
select cd_grupoEmergencial = '1230'  union
select cd_grupoEmergencial = '1240'  union
select cd_grupoEmergencial = '1310'  union
select cd_grupoEmergencial = '1320'  union
select cd_grupoEmergencial = '1410'  union
select cd_grupoEmergencial = '1420'  union
select cd_grupoEmergencial = '8710'
GO
/****** Object:  View [sup].[vw_dim_calendarioBolao]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE view [sup].[vw_dim_calendarioBolao]

as



with base1 as (  
	select
		 d.dt_referencia 
		,dt_proximoDiaUtil
		,d.nr_ano
		,nr_mes
		,nr_dia
		,tp_feriado
		,nr_diaSemana
	from  bi_rip_trustedZone.dbo.tb_dim_calendario d
	left join bi_rip_trustedZone.dbo.tb_dim_calendarioFeriados f
	on d.dt_referencia = f.dt_referencia
	and tp_feriado = 'Nacional'
),

base2 as (

	select
		 b2.*
		,dt_emergencial = iif(b2.nr_diaSemana not in (1,7) and b2.tp_feriado is null,b2.dt_referencia,b2.dt_proximoDiaUtil)
		,tipo1 = (select min(b1.dt_referencia) from base1 b1 where b1.nr_diaSemana not in (1,7) and b1.tp_feriado is null and b1.nr_dia >= 6 and b1.nr_ano = b2.nr_ano and b1.nr_mes = b2.nr_mes)
		,tipo2 = (select min(b1.dt_referencia) from base1 b1 where b1.nr_diaSemana not in (1,7) and b1.tp_feriado is null and b1.nr_dia >= 21 and b1.nr_ano = b2.nr_ano and b1.nr_mes = b2.nr_mes)
		,tipo3 = (select min(b1.dt_referencia) from base1 b1 where b1.nr_diaSemana not in (1,7) and b1.tp_feriado is null and b1.nr_dia >= 6 and b1.nr_ano = year(DATEADD(MONTH,1,b2.dt_referencia)) and b1.nr_mes = month(DATEADD(MONTH,1,b2.dt_referencia)))
	from base1 as b2

),
base3 as ( 
select 
distinct 
	 dt_referencia
	 ,dt_emergencial
	,dt_bolao = 
		iif(nr_dia = day(tipo1),tipo1,
			iif(nr_dia = day(tipo2),tipo2,
				iif(nr_dia < day(tipo1), tipo1
					,iif(nr_dia > day(tipo1) and nr_dia <= day(tipo2), tipo2, tipo3))))
from base2
)

select distinct 
	convert(date,dt_referencia) dt_referencia,
	convert(date,dt_emergencial) dt_emergencial,
	nr_diasEmergencial = DATEDIFF(day,dt_referencia,dt_emergencial),
	convert(date,dt_bolao) dt_bolao,
	nr_diasBolao = DATEDIFF(day,dt_referencia,dt_bolao)
from base3



GO
/****** Object:  Table [sup].[tb_dim_prazoTransporte]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sup].[tb_dim_prazoTransporte](
	[dt_competencia] [date] NULL,
	[nr_ano] [int] NULL,
	[nr_mes] [int] NULL,
	[sg_unidadeFederal] [varchar](2) NOT NULL,
	[nr_dias] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [sup].[tb_dim_prazoEntregaCompra]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sup].[tb_dim_prazoEntregaCompra](
	[dt_competencia] [date] NULL,
	[nr_ano] [int] NULL,
	[nr_mes] [int] NULL,
	[cd_produto] [varchar](15) NULL,
	[tp_local] [varchar](6) NOT NULL,
	[cd_empresaFilial] [varchar](60) NULL,
	[nm_filial] [varchar](41) NULL,
	[nm_empresa] [varchar](40) NULL,
	[nr_diasCalculado] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  View [sup].[vw_fat_solicitacoesCompras]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










---- select * from [sup].[vw_fat_solicitacoesCompras]


CREATE view [sup].[vw_fat_solicitacoesCompras]

as

	--- sol compras

	with compras as (
		select

			 sol_comp.cc_pedidosEmitidosXsolicitacoesCompras
			,sol_comp.cc_solicitacoesComprasXpedidosCompras
			,dt_emissao_solicitacoesCompras
			,sol_comp.nr_pedidoCompra_solicitacoesCompras
			,sol_comp.cd_solicitacao_solicitacoesCompras
			,cd_item_solicitacoesCompras
			,fl_eliminarResiduo_solicitacoesCompras
			,cd_centroCusto_solicitacoesCompras = isnull(e2.cd_centroCusto_pedidosEmitidos,cd_centroCusto_solicitacoesCompras)
			,cd_empresaFilial_centroCusto
			,cd_filial_solicitacoesCompras
			,cd_filialEntrega_solicitacoesCompras
			,cd_filialOrigem_solicitacoesCompras
			,nm_solicitante_solicitacoesCompras
			,cd_fornecedor_solicitacoesCompras
			,cd_produto_solicitacoesCompras
			,ds_unidadeMedida_solicitacoesCompras
			,qt_solicitada_solicitacoesCompras
			,qt_emPedido_solicitacoesCompras
			,cd_emergencial_solicitacoesCompras = fl_emergencial_solicitacoesCompras
			,fl_emergencial_solicitacoesCompras = iif(e.cc_pedidosEmitidosXsolicitacoesCompras is not null or (fl_emergencial_solicitacoesCompras not in ('','0','N')),1,0) 
			,fl_grupoEmergencial_solicitacoesCompras  = iif(pe.cd_produto_produtos is null,0,1) 
			,fl_semPedido_solicitacoesCompras = iif(c.cc_solicitacoesComprasXpedidosCompras is null or sol_comp.nr_pedidoCompra_solicitacoesCompras = '      ' or sol_comp.nr_pedidoCompra_solicitacoesCompras = '' or sol_comp.nr_pedidoCompra_solicitacoesCompras is null,1,0)
			,fl_atendida_solicitacoesCompras = iif(c.cc_solicitacoesComprasXpedidosCompras is not null or fl_eliminarResiduo_solicitacoesCompras = 'S' or (sol_comp.nr_pedidoCompra_solicitacoesCompras <> '      ' and sol_comp.nr_pedidoCompra_solicitacoesCompras <> '' and sol_comp.nr_pedidoCompra_solicitacoesCompras is not null),1,0)
			,fl_cancelada_solicitacoesCompras = iif(fl_eliminarResiduo_solicitacoesCompras = 'S' and c.cc_solicitacoesComprasXpedidosCompras is null,1,0)
			,c.dt_emissao_pedidosCompras
			,dt_necessidade_pedidosEmitidos
			,fl_semPedidoZE1_solicitacoesCompras = iif(e2.cc_pedidosEmitidosXsolicitacoesCompras is null,1,0)
			,e2.dt_emissao_pedidosEmitidos
			,cd_fluigEmissao_pedidosEmitidos = iif(nr_SubFluig_solicitacoesCompras='',e2.cd_fluigEmissao_pedidosEmitidos,nr_SubFluig_solicitacoesCompras)
			,e2.cd_pedido_pedidosEmitidos
			,tp_atendimento_pedidosEmitidos = iif(e3.tp_atendimento_pedidosEmitidos = 'S','Sede',iif(e3.tp_atendimento_pedidosEmitidos = 'L','Local','Indefinido'))
			,tp_atendimento_solicitacoesCompras = iif(cd_filial_solicitacoesCompras= '10','Sede','Local')
			,dt_ultimaCompra_solicitacoesCompras = (select top 1 dt_emissao_pedidosCompras from bi_rip_trustedZone.dbo.tb_fat_pedidosCompras as p where p.cd_produto_pedidosCompras = sol_comp.cd_produto_solicitacoesCompras and p.cd_filial_pedidosCompras = sol_comp.cd_filial_solicitacoesCompras and p.dt_emissao_pedidosCompras < sol_comp.dt_emissao_solicitacoesCompras order by p.dt_emissao_pedidosCompras desc)
			,vl_ultimaCompra_solicitacoesCompras = (select top 1 vl_unitario_pedidosCompras from bi_rip_trustedZone.dbo.tb_fat_pedidosCompras as p where p.cd_produto_pedidosCompras = sol_comp.cd_produto_solicitacoesCompras and p.cd_filial_pedidosCompras = sol_comp.cd_filial_solicitacoesCompras and p.dt_emissao_pedidosCompras < sol_comp.dt_emissao_solicitacoesCompras order by p.dt_emissao_pedidosCompras desc)
			,cd_fornecedorUltimaCompra_solicitacoesCompras = (select top 1 cd_fornecedor_pedidosCompras from bi_rip_trustedZone.dbo.tb_fat_pedidosCompras as p where p.cd_produto_pedidosCompras = sol_comp.cd_produto_solicitacoesCompras and p.cd_filial_pedidosCompras = sol_comp.cd_filial_solicitacoesCompras and p.dt_emissao_pedidosCompras < sol_comp.dt_emissao_solicitacoesCompras order by p.dt_emissao_pedidosCompras desc)
			,cd_lojaUltimaCompra_solicitacoesCompras = (select top 1 cd_lojaForncedor_pedidosCompras from bi_rip_trustedZone.dbo.tb_fat_pedidosCompras as p where p.cd_produto_pedidosCompras = sol_comp.cd_produto_solicitacoesCompras and p.cd_filial_pedidosCompras = sol_comp.cd_filial_solicitacoesCompras and p.dt_emissao_pedidosCompras < sol_comp.dt_emissao_solicitacoesCompras order by p.dt_emissao_pedidosCompras desc)
			,f.nm_fantasia_fornecedores
			,ds_moeda1_centroCusto
			,cc.nm_filial_empresasFiliais
			,p.ds_grupo_grupoProdutos
			,p.nm_cientifico_produtos
			,p.cd_grupo_produtos
			,p.tp_produto_produtos
			,sg_unidadeFederal_empresasFiliais

			-- adicionado 02.05.2022
			,[cd_itemSolicitacaOrigem_solicitacoesCompras]
			,ds_produto_solicitacoesCompras
			,ds_observacao_solicitacoesCompras
			,vl_unitario_solicitacoesCompras
			,vl_total_solicitacoesCompras
			,cd_armazem_solicitacoesCompras
			,cd_lojaForncedor_solicitacoesCompras
			,cd_itemPedidoCompra_solicitacoesCompras
			,cd_usuario_solicitacoesCompras
			,cd_grupoCopradores_solicitacoesCompras
			,fl_aprovacao_solicitacoesCompras
			,nr_SubFluig_solicitacoesCompras

			-- adicionado 31.01.2023
			,dt_aprovacao_fluig_solicitacoesCompras

		from bi_rip_trustedZone.dbo.tb_fat_solicitacoesCompras sol_comp with (nolock)
		
		left join (
			select distinct cc_solicitacoesComprasXpedidosCompras, min(dt_emissao_pedidosCompras) dt_emissao_pedidosCompras
			from bi_rip_trustedZone.dbo.tb_fat_pedidosCompras as c with (nolock)
			group by cc_solicitacoesComprasXpedidosCompras
		) as  c on
		c.cc_solicitacoesComprasXpedidosCompras = sol_comp.cc_solicitacoesComprasXpedidosCompras
		
		left join (
			select cd_produto_produtos from bi_rip_trustedZone.dbo.tb_dim_produtos as p  with (nolock)
			inner join bi_rip_refinedZone.sup.vw_dim_grupoProdutosEmergenciais as e with (nolock)
			on convert(varchar,e.cd_grupoEmergencial) = convert(varchar,p.cd_grupo_produtos)
		) as pe
		on pe.cd_produto_produtos = sol_comp.cd_produto_solicitacoesCompras
		
		left join (
			select distinct cc_pedidosEmitidosXsolicitacoesCompras from bi_rip_trustedZone.dbo.tb_fat_pedidosEmitidos with (nolock)
			where tp_emergencia_pedidosEmitidos not in ('0','N') and tp_emergencia_pedidosEmitidos is not null
		) as e
		on e.cc_pedidosEmitidosXsolicitacoesCompras = sol_comp.cc_pedidosEmitidosXsolicitacoesCompras
		
		left join (
			select cc_pedidosEmitidosXsolicitacoesCompras
			,min(dt_emissao_pedidosEmitidos) dt_emissao_pedidosEmitidos
			,min(cd_fluigEmissao_pedidosEmitidos) cd_fluigEmissao_pedidosEmitidos
			,min(cd_pedido_pedidosEmitidos) cd_pedido_pedidosEmitidos
			,min(cd_centroCusto_pedidosEmitidos) cd_centroCusto_pedidosEmitidos
			,min(dt_necessidade_pedidosEmitidos) as dt_necessidade_pedidosEmitidos
			from bi_rip_trustedZone.dbo.tb_fat_pedidosEmitidos with (nolock)
			group by cc_pedidosEmitidosXsolicitacoesCompras
		) as e2
		on e2.cc_pedidosEmitidosXsolicitacoesCompras = sol_comp.cc_pedidosEmitidosXsolicitacoesCompras
		
		left join (
			select distinct cc_pedidosEmitidosXsolicitacoesCompras, tp_atendimento_pedidosEmitidos from bi_rip_trustedZone.dbo.tb_fat_pedidosEmitidos with (nolock)
		) as e3
		on e3.cc_pedidosEmitidosXsolicitacoesCompras = sol_comp.cc_pedidosEmitidosXsolicitacoesCompras
		
		left join bi_rip_trustedZone.dbo.tb_dim_fornecedores as f with (nolock)
		on f.cd_loja_fornecedores = sol_comp.cd_lojaForncedor_solicitacoesCompras
		and f.cd_fornecedor_fornecedores = sol_comp.cd_fornecedor_solicitacoesCompras
		
		left join (
			select cd_centroCusto_centroCusto, cd_empresaFilial_centroCusto, nm_filial_empresasFiliais, ds_moeda1_centroCusto, sg_unidadeFederal_empresasFiliais
			from bi_rip_trustedZone.dbo.tb_dim_centroCusto as cc with (nolock)
			left join bi_rip_trustedZone.dbo.tb_dim_empresasFiliais ef with (nolock)
			on cc.cd_empresaFilial_centroCusto = ef.cd_empresaFilial_empresasFiliais
		) as cc
		on isnull(e2.cd_centroCusto_pedidosEmitidos,sol_comp.cd_centroCusto_solicitacoesCompras) = cc.cd_centroCusto_centroCusto
		--- se não tiver ze1, pegar centro de custo da propria solicitacao

		left join (
			select cd_produto_produtos, nm_cientifico_produtos, g.ds_grupo_grupoProdutos, p.cd_grupo_produtos, tp_produto_produtos from bi_rip_trustedZone.dbo.tb_dim_produtos as p with (nolock)
			left join bi_rip_trustedZone.dbo.tb_dim_grupoProdutos as g with (nolock)
			on g.cd_grupo_grupoProdutos = p.cd_grupo_produtos
		) as p on
		p.cd_produto_produtos = sol_comp.cd_produto_solicitacoesCompras

	--where dt_emissao_solicitacoesCompras >= '2021-01-01'

),

bolao as (

select 
dt_proximoBolao_solicitacoesCompras = (select min(dt_bolao) from bi_rip_refinedZone.sup.vw_dim_calendarioBolao with (nolock) where dt_referencia > convert(date,getdate())),
dt_atualBolao_solicitacoesCompras = (

	select max(dt_bolao) from bi_rip_refinedZone.sup.vw_dim_calendarioBolao with (nolock) where dt_bolao < 
	(select min(dt_bolao) from bi_rip_refinedZone.sup.vw_dim_calendarioBolao with (nolock) where dt_referencia > convert(date,getdate()))
	)

),

compras1 as (

	select c.*
	,dt_bolao_solicitacoesCompras =
		iif(fl_grupoEmergencial_solicitacoesCompras =1,b.dt_emergencial,
			iif(fl_emergencial_solicitacoesCompras =1,b.dt_emergencial,dt_bolao))
	,dt_proximoBolao_solicitacoesCompras
	,dt_atualBolao_solicitacoesCompras
	from compras as c  with (nolock)
	left join bi_rip_refinedZone.sup.vw_dim_calendarioBolao as b
	on b.dt_referencia = c.dt_emissao_solicitacoesCompras
	cross join bolao 

	),

compras2 as (

select *,
fl_bolaoAberto_solicitacoesCompras = iif(getdate()>=dt_bolao_solicitacoesCompras,1,0)
,ds_bolao_solicitacoesCompras = iif(dt_bolao_solicitacoesCompras<dt_atualBolao_solicitacoesCompras,'Passado',iif(dt_bolao_solicitacoesCompras<dt_proximoBolao_solicitacoesCompras,'Atual','Próximo'))
from compras1

),

atual_bolao as (

	select
		distinct
		cd_filial_solicitacoesCompras
		,cd_fornecedor_solicitacoesCompras
		,cd_produto_solicitacoesCompras
		,fl_bolaoAberto_solicitacoesCompras
	from compras2
	where ds_bolao_solicitacoesCompras = 'Atual'

),
base as (
select 
	c.*
	,fl_solicitacaoAtrasada_pedidosCompras = 
		iif( c.fl_bolaoAberto_solicitacoesCompras = 1 and fl_atendida_solicitacoesCompras = 0 and convert(date,getdate()) > dateadd(day,7,dt_bolao_solicitacoesCompras),1,0)
	,fl_solicitacaoImediata_solicitacoesCompras = iif(c.fl_semPedido_solicitacoesCompras = 1 and fl_eliminarResiduo_solicitacoesCompras <> 'S' and DATEDIFF(day,c.dt_ultimaCompra_solicitacoesCompras,c.dt_emissao_solicitacoesCompras)<=30,1,0)
	,fl_solicitacaoRepetida_solicitacoesCompras = iif(c.ds_bolao_solicitacoesCompras = 'Próximo' and b.fl_bolaoAberto_solicitacoesCompras = 1,1,0)
	,nm_fornecedorUltimaCompra_solicitacoesCompras = f.nm_fantasia_fornecedores
	from compras2 as c
left join atual_bolao b  with (nolock)
on b.cd_produto_solicitacoesCompras = c.cd_produto_solicitacoesCompras
and b.cd_fornecedor_solicitacoesCompras = c.cd_fornecedor_solicitacoesCompras
and b.cd_filial_solicitacoesCompras = c.cd_filial_solicitacoesCompras

left join bi_rip_trustedZone.dbo.tb_dim_fornecedores as f with (nolock)
on f.cd_loja_fornecedores = c.cd_lojaUltimaCompra_solicitacoesCompras
and f.cd_fornecedor_fornecedores = c.cd_fornecedorUltimaCompra_solicitacoesCompras

),

base_final as (
select b.*
	,nr_diasEntregaNormal = 
	(
		--- nr_diasBolao
			iif(
				(cd_filial_solicitacoesCompras = '10' and fl_emergencial_solicitacoesCompras=1) or cd_filial_solicitacoesCompras <> '10',0
					,datediff(day,dt_emissao_solicitacoesCompras,dt_bolao_solicitacoesCompras))+
	
		--- nr_diasAnalise
		iif(cd_filial_solicitacoesCompras = '10',1,0)+
	
		--- nr_diasCompra
		iif(cd_filial_solicitacoesCompras = '10' and fl_emergencial_solicitacoesCompras=1,3
			,iif(cd_filial_solicitacoesCompras = '10',7,
					2
				)
			)+
	
		--- nr_diasEntrega
		iif(cd_filial_solicitacoesCompras = '10',
					(
					select iif(isnull(max(nr_diasCalculado),7)<7,7,isnull(max(nr_diasCalculado),7)) from bi_rip_refinedZone.sup.tb_dim_prazoEntregaCompra with (nolock)
					where cd_produto = cd_produto_solicitacoesCompras
					and dt_competencia = iif(dt_emissao_solicitacoesCompras<'2022-01-01','2022-01-01',DATEADD(month,DATEDIFF(month,0,dt_emissao_solicitacoesCompras),0))
					and cd_empresaFilial = '0110'
					),
				
					(
					select isnull(max(nr_diasCalculado),1) from bi_rip_refinedZone.sup.tb_dim_prazoEntregaCompra with (nolock)
					where cd_produto = cd_produto_solicitacoesCompras
					and dt_competencia = iif(dt_emissao_solicitacoesCompras<'2022-01-01','2022-01-01',DATEADD(month,DATEDIFF(month,0,dt_emissao_solicitacoesCompras),0))
					and cd_empresaFilial = '01'+cd_filial_solicitacoesCompras
					)
			)+

		--- nr_diasSeparacao
		iif(cd_filial_solicitacoesCompras = '10',5,0)+

		--- nr_diasTransporte
		iif(cd_filial_solicitacoesCompras <> '10',0,
			iif(cd_empresaFilial_centroCusto = '01A4',3,
				iif(cd_empresaFilial_centroCusto = '0127',15,
					iif(cd_empresaFilial_centroCusto = '0119',2,
						iif(cd_empresaFilial_centroCusto = '0120',2,
			(select isnull(max(nr_dias),7) from bi_rip_refinedZone.sup.tb_dim_prazoTransporte with (nolock) where sg_unidadeFederal = sg_unidadeFederal_empresasFiliais and dt_competencia = iif(dt_emissao_solicitacoesCompras<'2022-01-01','2022-01-01',DATEADD(month,DATEDIFF(month,0,dt_emissao_solicitacoesCompras),0)))
			)))))
	)

from base as b

)


select *,
fl_urgente = iif(/*fl_emergencial_solicitacoesCompras=0 and */dateadd(day,nr_diasEntregaNormal,dt_emissao_solicitacoesCompras) >= dt_necessidade_pedidosEmitidos,1,0)
,tp_priorizacao_solicitacoesCompras = 
	iif(fl_atendida_solicitacoesCompras=0 and fl_solicitacaoAtrasada_pedidosCompras=1 and fl_emergencial_solicitacoesCompras=1,'0 - Sol. Emergêncial Atrasada',
		iif(fl_atendida_solicitacoesCompras=0 and fl_solicitacaoAtrasada_pedidosCompras=1 and fl_emergencial_solicitacoesCompras=0,'1 - Sol. Atrasada',
			iif(fl_atendida_solicitacoesCompras=0 and fl_solicitacaoAtrasada_pedidosCompras=0 and fl_emergencial_solicitacoesCompras=1 ,'2 - Sol. Emergêncial',
				iif(fl_atendida_solicitacoesCompras=0 and fl_grupoEmergencial_solicitacoesCompras = 1 ,'3 - Aplicação',
					iif(fl_atendida_solicitacoesCompras=0 and fl_solicitacaoAtrasada_pedidosCompras=0 and fl_emergencial_solicitacoesCompras= 0 and ds_unidadeMedida_solicitacoesCompras <> 'VB' and  dt_ultimaCompra_solicitacoesCompras > DATEADD(DAY,-90,convert(date,getdate())),'4 - Sol. Com Referência < 90',
						iif(fl_atendida_solicitacoesCompras=0 and fl_solicitacaoAtrasada_pedidosCompras=0 and fl_emergencial_solicitacoesCompras=0 and (tp_produto_produtos in ('AI','AF') or cd_grupo_produtos = '9010'),'5 - Ativos',
							iif(fl_atendida_solicitacoesCompras=0 and fl_solicitacaoAtrasada_pedidosCompras=0,'6 - Demais Itens',
								iif(fl_atendida_solicitacoesCompras=1,null,
								'Indefinido'
									)
								)
							)
						)
					)
				)
			)
	)
,nr_diasPrazoObra = DATEDIFF(day,dt_emissao_pedidosEmitidos,dt_necessidade_pedidosEmitidos)
,nr_diasDefinicaoCompras = DATEDIFF(day,dt_emissao_pedidosEmitidos,dt_emissao_solicitacoesCompras)
from base_final
where fl_aprovacao_solicitacoesCompras <> 'B'

GO
/****** Object:  View [sup].[vw_dim_produtos]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE view [sup].[vw_dim_produtos]

as 

select
	p.*,
	g.ds_grupo_grupoProdutos,
	fl_emergencial  = iif(e.cd_grupoEmergencial is not null,1,0),
	qt_caracteresCodigo = len(cd_produto_produtos)

	-- adicionado 02.05.2022
	,cd_contaContabilConsumo_grupoProdutos
	,cd_contaContabilDespesa_grupoProdutos


from [bi_rip_trustedZone].[dbo].[tb_dim_produtos] as p with (nolock)
inner join [bi_rip_trustedZone].[dbo].[tb_dim_grupoProdutos] g with (nolock)
on p.cd_grupo_produtos = g.cd_grupo_grupoProdutos
left join bi_rip_refinedZone.[sup].[vw_dim_grupoProdutosEmergenciais] as e with (nolock)
on convert(varchar,e.cd_grupoEmergencial) = convert(varchar,p.cd_grupo_produtos)

GO
/****** Object:  View [sup].[vw_dim_prazoTransporte]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create view [sup].[vw_dim_prazoTransporte] 

as

select 'AL' sg_unidadeFederal , 4    nr_dias union 
select 'AM' sg_unidadeFederal , 15	 nr_dias union 
select 'AP' sg_unidadeFederal , 15	 nr_dias union 
select 'BA' sg_unidadeFederal , 3	 nr_dias union 
select 'CE' sg_unidadeFederal , 5	 nr_dias union 
select 'DF' sg_unidadeFederal , 3	 nr_dias union 
select 'ES' sg_unidadeFederal , 2	 nr_dias union 
select 'EX' sg_unidadeFederal , 180	 nr_dias union 
select 'GO' sg_unidadeFederal , 3	 nr_dias union 
select 'MA' sg_unidadeFederal , 5	 nr_dias union 
select 'MG' sg_unidadeFederal , 3	 nr_dias union 
select 'MS' sg_unidadeFederal , 2	 nr_dias union 
select 'MT' sg_unidadeFederal , 3	 nr_dias union 
select 'PA' sg_unidadeFederal , 5	 nr_dias union 
select 'PB' sg_unidadeFederal , 5	 nr_dias union 
select 'PE' sg_unidadeFederal , 4	 nr_dias union 
select 'PR' sg_unidadeFederal , 2	 nr_dias union 
select 'RJ' sg_unidadeFederal , 1	 nr_dias union 
select 'RN' sg_unidadeFederal , 5	 nr_dias union 
select 'RO' sg_unidadeFederal , 4	 nr_dias union 
select 'RR' sg_unidadeFederal , 15	 nr_dias union 
select 'RS' sg_unidadeFederal , 3	 nr_dias union 
select 'SC' sg_unidadeFederal , 2	 nr_dias union 
select 'SE' sg_unidadeFederal , 4	 nr_dias union 
select 'SP' sg_unidadeFederal , 1	 nr_dias union 
select 'TO' sg_unidadeFederal , 4	 nr_dias
GO
/****** Object:  View [sup].[vw_dim_empresasFiliais]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE view [sup].[vw_dim_empresasFiliais]

as 

select
	cd_empresaFilial_empresasFiliais,
	cd_empresa_empresasFiliais,
	nm_filial_empresasFiliais,
	nm_empresa_empresasFiliais,
	sg_unidadeFederal_empresasFiliais,
	tp_local_empresasFiliais = iif(cd_empresaFilial_empresasFiliais = '0110','SEDE','LOCAL'),
	t.nr_dias as nr_diasTransporteCarga
	,ds_filialCodigoNome = rtrim(ltrim(nm_filial_empresasFiliais))+' ('+rtrim(ltrim(cd_filial_empresasFiliais))+')'
from [bi_rip_trustedZone].[dbo].[tb_dim_empresasFiliais] as ef with (nolock)
left join [sup].[vw_dim_prazoTransporte] as t with (nolock)
on t.sg_unidadeFederal = ef.sg_unidadeFederal_empresasFiliais

GO
/****** Object:  View [dbo].[vw_dim_pedidosEmitidosLegendas]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE view [dbo].[vw_dim_pedidosEmitidosLegendas]

as

select 8 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entregue Parcial pelo SD3 e SD1 - Aguardando saldo chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 9 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entregue Parcial pelo SD1- Aguardando saldo chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 10 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entregue Parcial peo SD1 - Aguardando Comprar saldo' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 11 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entregue Parcial pelo SD3 - Aguardando saldo chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 12 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entregue Parcial pelo SD1 Forn -Saldo em Análise' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 13 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entregue Parcial pelo SD3 -Saldo em Análise' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 24 cd_legendaEmissaoMicro_pedidosEmitidos, 3 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Comprado Total Aguardando Chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando receber do fornecedor' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 25 cd_legendaEmissaoMicro_pedidosEmitidos, 3 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Comprado Parcial - Aguardando Chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando receber do fornecedor' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 28 cd_legendaEmissaoMicro_pedidosEmitidos, 2 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Em compras Total' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Compras' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 30 cd_legendaEmissaoMicro_pedidosEmitidos, 2 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Em compras Parcial' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Compras' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 32 cd_legendaEmissaoMicro_pedidosEmitidos, 1 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Em análise' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Análise' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 4 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Finalizado atendido parcial pelo SD3 - Res. Elim' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 5 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Finalizado atendido parcial pelo SD1 Forn - Res. Elim.' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 6 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Finalizado atendido parcial pelo SD3 e SD1 Forn - Res. Elim.' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 1 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Finalizado pelo SD3' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 2 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Finalizado pelo SD1 Forn' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 3 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Finalizado Pelo SD3 e Sd1 Forn' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 14 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais  - Finalizado - Entregue total pelo SD2' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 15 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais  - Entregue parcial pelo SD2 - Saldo em Análise' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 16 cd_legendaEmissaoMicro_pedidosEmitidos, 5 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais - Aguardando Transporte' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando Transporte' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 17 cd_legendaEmissaoMicro_pedidosEmitidos, 5 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais - Aguardando Transporte Parcial' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando Transporte' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 18 cd_legendaEmissaoMicro_pedidosEmitidos, 5 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais - Aguardando Transporte' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando Transporte' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 19 cd_legendaEmissaoMicro_pedidosEmitidos, 5 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais - Aguardando Transporte Parcial' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando Transporte' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 20 cd_legendaEmissaoMicro_pedidosEmitidos, 4 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais - Em Separação' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Separação' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 21 cd_legendaEmissaoMicro_pedidosEmitidos, 4 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais - Em Separação Parcial' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Separação' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 22 cd_legendaEmissaoMicro_pedidosEmitidos, 4 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais - Em Separação' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Separação' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 23 cd_legendaEmissaoMicro_pedidosEmitidos, 4 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais - Em Separação Parcial' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Separação' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 26 cd_legendaEmissaoMicro_pedidosEmitidos, 3 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais -  Comprado Parcial Aguardando Chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando receber do fornecedor' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 27 cd_legendaEmissaoMicro_pedidosEmitidos, 3 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais -  Comprado Total Aguardando Chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando receber do fornecedor' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 29 cd_legendaEmissaoMicro_pedidosEmitidos, 2 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Em compras Total - Entre Filiais' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Compras' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 31 cd_legendaEmissaoMicro_pedidosEmitidos, 2 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Em compras Parcial - Entre Filiais' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Compras' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 33 cd_legendaEmissaoMicro_pedidosEmitidos, 1 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Entre filiais - Em Análise' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Análise' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 7 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Cancelada' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 58 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Entregue Parcial pelo SD3 e SD2- Aguardando saldo chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 59 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Entregue Parcial pelo SD2 - Aguardando saldo chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 60 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Entregue Parcial pelo SD3 - Aguardando saldo chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 61 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Entregue Parcial - Saldo Aguardando Transporte' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 62 cd_legendaEmissaoMicro_pedidosEmitidos, 5 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - AguardandoTrasnsporte do Saldo' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando Transporte' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 63 cd_legendaEmissaoMicro_pedidosEmitidos, 5 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Aguardando Tansporte' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando Transporte' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 64 cd_legendaEmissaoMicro_pedidosEmitidos, 5 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Aguardando Transporte Parcial' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando Transporte' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 65 cd_legendaEmissaoMicro_pedidosEmitidos, 5 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Aguardando Transporte' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando Transporte' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 66 cd_legendaEmissaoMicro_pedidosEmitidos, 5 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Aguardando Transporte Parcial' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando Transporte' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 67 cd_legendaEmissaoMicro_pedidosEmitidos, 4 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Em separação' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Separação' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 68 cd_legendaEmissaoMicro_pedidosEmitidos, 4 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Em separação Parcial' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Separação' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 69 cd_legendaEmissaoMicro_pedidosEmitidos, 4 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Aguardando Separação' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Separação' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 70 cd_legendaEmissaoMicro_pedidosEmitidos, 4 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Aguardando Separação Parcial' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Separação' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 71 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Entregue Parcial pelo SD3 -Saldo em Análise' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 72 cd_legendaEmissaoMicro_pedidosEmitidos, 6 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Entregue Parcial pelo SD3 e SD2 - Saldo em análise' ds_legendaEmissaoMicro_pedidosEmitidos, 'Entregue Parcial - Saldo Pendente' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 73 cd_legendaEmissaoMicro_pedidosEmitidos, 3 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Comprado Aguardando Chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando receber do fornecedor' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 74 cd_legendaEmissaoMicro_pedidosEmitidos, 3 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Comprado Parcial - Aguardando Chegar' ds_legendaEmissaoMicro_pedidosEmitidos, 'Aguardando receber do fornecedor' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 75 cd_legendaEmissaoMicro_pedidosEmitidos, 2 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Em compras Total' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Compras' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 76 cd_legendaEmissaoMicro_pedidosEmitidos, 2 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Em compras Parcial' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Compras' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 77 cd_legendaEmissaoMicro_pedidosEmitidos, 1 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Em análise' ds_legendaEmissaoMicro_pedidosEmitidos, 'Em Análise' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 54 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Finalizado atendido parcial pelo SD3 - Res. Elim' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 55 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Finalizado atendido parcial pelo SD2' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 56 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Finalizado atendido parcial pelo SD3 e SD2 Forn - Res. Elim.' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 57 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Cancelada' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 51 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Finalizado pelo SD3' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 52 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Finalizado pelo SD2' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 53 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Finalizado Pelo SD3 e SD2' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 34 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Local - Finalizado Sem amarração' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos union all 
select 78 cd_legendaEmissaoMicro_pedidosEmitidos, 7 cd_legendaEmissaoMacro_pedidosEmitidos, 'Sede - Finalizado Sem amarração' ds_legendaEmissaoMicro_pedidosEmitidos, 'Finalizado' ds_legendaEmissaoMacro_pedidosEmitidos 


GO
/****** Object:  View [dpp].[vw_dim_cadastroEntidades]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dpp].[vw_dim_cadastroEntidades]

as 

select
	cd_planoContabil,
	cd_item_planoContabil,
	cd_entidade,
	ds_entidade,
	tp_classe,
	cd_condicaoNormal,
	cd_entidadeSuperior,
	cd_bloqueia_entidade,
	cd_filial_gerencialEntidade
from [bi_rip_trustedZone].[dbo].[tb_dim_cadastroEntidades] with (nolock)

GO
/****** Object:  View [dpp].[vw_dim_cargoNiveis]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dpp].[vw_dim_cargoNiveis]

as 

select
	ds_cargo,
	tp_nivel_cargo
from [bi_rip_trustedZone].[dbo].[tb_dim_niveisCargo]

GO
/****** Object:  View [dpp].[vw_dim_cargos]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dpp].[vw_dim_cargos]
as


WITH X AS (
	SELECT
		ds_cargo as ds_cargo_pk,
		tp_nivel_cargo
	FROM bi_rip_trustedZone.dbo.tb_dim_niveisCargo
)

SELECT
	cd_cargo,
	tp_maoObra_cargo = IIF(tp_maoObra_cargo = 'I', 'Indireta', 'Direta'),
	ds_cargo,
	tp_nivel_cargo
  FROM [bi_rip_trustedZone].[dbo].[tb_dim_cargos] a 
  LEFT JOIN X
  ON a.ds_cargo = X.ds_cargo_pk

GO
/****** Object:  View [dpp].[vw_dim_centroCusto]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dpp].[vw_dim_centroCusto]

as 

select
	cd_centroCusto_centroCusto,
	cd_filial_centroCusto,
	cd_filialArmazem_centroCusto,
	cd_armazemFilial_centroCusto,
	cd_empresaFilial_centroCusto,
	nm_unidadeFederal_centroCusto,
	ds_moeda1_centroCusto
	,dt_inicioExistencia_centroCusto
	,dt_finalExistencia_centroCusto
	,cd_localDebito_centroCusto
	,cd_localCredito_centroCusto
	,nm_municipio_centroCusto
	,cd_mercadoDebito_centroCusto
	,cd_mercadoCredito_centroCusto
	,cd_atividadeDebito_centroCusto
	,cd_atividadeCredito_centroCusto
from [bi_rip_trustedZone].[dbo].[tb_dim_centroCusto] with (nolock)
WHERE cd_localDebito_centroCusto <> ''

GO
/****** Object:  View [dpp].[vw_dim_competencia_ponto]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dpp].[vw_dim_competencia_ponto]
AS

SELECT
	dt_referencia,
	mes,
	ano,
	mes_desc
FROM bi_rip_trustedZone.dbo.tb_dim_competencia_ponto
GO
/****** Object:  View [dpp].[vw_dim_dependentes]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dpp].[vw_dim_dependentes]

as

select 
	cd_filial_funcionarios as cd_filialFuncionarios_dependente,
	cd_matricula_funcionarios as cd_matriculaFuncionarios_dependente,
	cd_filial_funcionarios+cd_matricula_funcionarios AS cd_filialMatricula_dependente,
	cd_dependente,
	nm_dependente,
	cd_tpDependente,
	FORMAT(CONVERT(date, dt_nascimentoDependente), 'd', 'pt-br') as dt_nascimentoDependente,
	tp_sexoDependente,
	tp_grauParentesco,
	tp_dependenteImpostoRenda,
	tp_dependenteSalarioFamilia,
	vl_idadeDependente
	from bi_rip_trustedZone.dbo.tb_dim_dependentes
GO
/****** Object:  View [dpp].[vw_dim_empresasFiliais]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dpp].[vw_dim_empresasFiliais]

as 

select
	cd_filial_empresasFiliais,
	nm_filial_empresasFiliais,
	sg_unidadeFederal_empresasFiliais
from [bi_rip_trustedZone].[dbo].[tb_dim_empresasFiliais]
	where cd_empresa_empresasFiliais = '01'

GO
/****** Object:  View [dpp].[vw_dim_esocial_tpDependentes]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dpp].[vw_dim_esocial_tpDependentes]

as 

select
	cd_tpDependente,
	ds_tpDependente
from [bi_rip_trustedZone].[dbo].[tb_dim_esocial_tpDependentes] with (nolock)

GO
/****** Object:  View [dpp].[vw_dim_funcionarios]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dpp].[vw_dim_funcionarios]
as
SELECT 
      [cd_filial_funcionarios]
      ,[nm_funcionario_funcionarios]
      ,[cd_matricula_funcionarios]
	  ,[ds_escolaridade_funcionarios]
	  ,[ds_estadoCivil_funcionarios]
      ,tp_defic_funcionarios
	  ,[ds_faixaEtaria_funcionarios]
	  ,[vl_salario_funcionarios]
      ,vl_idade_funcionarios
      ,[dt_admissao_funcionarios]
      ,dt_demissao_funcionario
      ,[cd_centroCusto_funcionarios]
      ,[cd_funcao_funcionarios]
      ,[ds_funcao_funcionarios]
      ,[tp_maoObra_funcionarios]
      ,[tp_sexo_funcionario]
	  ,concat([cd_filial_funcionarios], [cd_matricula_funcionarios]) as [cd_filialMatricula_funcionarios]
	  ,tp_situacao_folha
      ,tp_raca_funcionario
  FROM [bi_rip_trustedZone].[dbo].[tb_dim_funcionarios]

GO
/****** Object:  View [dpp].[vw_dim_tipoNegocio]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dpp].[vw_dim_tipoNegocio]
AS

	WITH CONTAS AS (
		SELECT
			cd_entidade, ds_entidade
		FROM bi_rip_trustedZone.dbo.tb_dim_cadastroEntidades
	),

	CENTRO_CUSTO AS (
		SELECT
			cd_centroCusto_centroCusto,
			cd_atividadeDebito_centroCusto,
			cd_mercadoDebito_centroCusto,
			cd_modalidadeDebito_centroCusto
		FROM bi_rip_trustedZone.dbo.tb_dim_centroCusto
	),

	ATIV_DEB AS (
		SELECT
			cd_centroCusto_centroCusto,
			cd_atividadeDebito_centroCusto,
			ds_entidade
		FROM CENTRO_CUSTO
		LEFT OUTER JOIN CONTAS
		ON cd_atividadeDebito_centroCusto = CONTAS.cd_entidade
		WHERE cd_atividadeDebito_centroCusto <> ''
	),

	MERCADO_DEB AS (
		SELECT
			cd_centroCusto_centroCusto,
			cd_mercadoDebito_centroCusto,
			ds_entidade
		FROM CENTRO_CUSTO
		LEFT OUTER JOIN CONTAS
		ON cd_mercadoDebito_centroCusto = CONTAS.cd_entidade
		WHERE cd_modalidadeDebito_centroCusto <> ''
	),

	MODALIDADE_DEB AS (
		SELECT
			cd_centroCusto_centroCusto,
			cd_modalidadeDebito_centroCusto,
			ds_entidade
		FROM CENTRO_CUSTO
		LEFT OUTER JOIN CONTAS
		ON cd_modalidadeDebito_centroCusto = CONTAS.cd_entidade
		WHERE cd_modalidadeDebito_centroCusto <> ''
	)

	SELECT
		CENTRO_CUSTO.cd_centroCusto_centroCusto,
		ATIV_DEB.ds_entidade AS ds_ativDeb,
		MERCADO_DEB.ds_entidade AS ds_mercadoDeb,
		MODALIDADE_DEB.ds_entidade AS ds_modalidadeDeb
	FROM CENTRO_CUSTO
	LEFT OUTER JOIN ATIV_DEB
	ON CENTRO_CUSTO.cd_centroCusto_centroCusto = ATIV_DEB.cd_centroCusto_centroCusto
	LEFT OUTER JOIN MERCADO_DEB
	ON CENTRO_CUSTO.cd_centroCusto_centroCusto = MERCADO_DEB.cd_centroCusto_centroCusto
	LEFT OUTER JOIN MODALIDADE_DEB
	ON CENTRO_CUSTO.cd_centroCusto_centroCusto = MODALIDADE_DEB.cd_centroCusto_centroCusto
	WHERE ATIV_DEB.ds_entidade <> '' OR MERCADO_DEB.ds_entidade <> '' OR MODALIDADE_DEB.ds_entidade <> ''

GO
/****** Object:  View [dpp].[vw_fat_horaextra]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE view [dpp].[vw_fat_horaextra]
as

select 
	   RIGHT('000' + [cd_filial_funcionarios], 2) AS cd_filial_funcionarios
      ,[cd_matricula_funcionarios]
      ,[cd_filialMatricula_funcionarios]
	  ,cd_deptoConta_funcionarios
	  ,cd_deptocc_funcionarios
	  ,cd_id_unico_stou
      ,[dt_pontoEspelho]
      ,[ds_horas_normais]
      ,[ds_desconto]
      ,[ds_horas_extras_total]
      ,[ds_extra_excessiva]
      ,[ds_extra_normal]
      ,[ds_total_calculado]
      ,coalesce([qt_horas_normais], 0)		as [qt_horas_normais]
      ,coalesce([qt_desconto], 0)			as [qt_desconto]
      ,coalesce([qt_horas_extras_total], 0)	as [qt_horas_extras_total]
	  ,coalesce(qt_horas_extras_50, 0)		as qt_horas_extras_50
	  ,coalesce(qt_horas_extras_55,	0)		as qt_horas_extras_55
	  ,coalesce(qt_horas_extras_60,	0)		as qt_horas_extras_60
	  ,coalesce(qt_horas_extras_70,	0)		as qt_horas_extras_70
	  ,coalesce(qt_horas_extras_75,	0)		as qt_horas_extras_75
	  ,coalesce(qt_horas_extras_80,	0)		as qt_horas_extras_80
	  ,coalesce(qt_horas_extras_100, 0)		as qt_horas_extras_100
	  ,coalesce(qt_horas_extras_120, 0)		as qt_horas_extras_120
	  ,coalesce(qt_horas_extras_150, 0)		as qt_horas_extras_150
      ,coalesce([qt_extra_excessiva], 0)	as [qt_extra_excessiva]
      ,coalesce([qt_extra_normal], 0)		as [qt_extra_normal]
      ,coalesce([qt_total_calculado], 0)	as [qt_total_calculado]
	  ,iif(coalesce([qt_desconto], 0) > 1, 'SIM', 'NÃO') as fl_absenteismo
	  ,dt_alteracao

from [bi_rip_trustedZone].[dbo].[tb_fat_horaextra] as tb with (nolock)

GO
/****** Object:  View [dpp].[vw_fat_inclusaomarcacao]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE view [dpp].[vw_fat_inclusaomarcacao]

as

WITH MenorGranularidade as
(
	select
		 fat.[dt_pontoEspelho]
		,fat.[cd_matricula_funcionarios]
		,fat.cd_filial_funcionarios
		,fat.cd_deptoConta_funcionarios
		,fat.cd_deptocc_funcionarios
		,COALESCE(fat.[dt_marcacao1_alterada], fat.[dt_marcacao1]) as marcacao
		,1 as ordem
		,case when fat.[dt_marcacao1_alterada] is null then 'NÃO' else 'SIM' end as fl_alteracao_inclusaomarcacao
	from [bi_rip_trustedZone].[dbo].[tb_fat_inclusaomarcacao] as fat with (nolock)
	where COALESCE(fat.[dt_marcacao1_alterada], fat.[dt_marcacao1]) is not null
union all
	select
		 fat.[dt_pontoEspelho]
		,fat.[cd_matricula_funcionarios]
		,fat.cd_filial_funcionarios
		,fat.cd_deptoConta_funcionarios
		,fat.cd_deptocc_funcionarios
		,COALESCE(fat.[dt_marcacao2_alterada], fat.[dt_marcacao2]) as marcacao
		,2 as ordem
		,case when fat.[dt_marcacao2_alterada] is null then 'NÃO' else 'SIM' end as fl_alteracao_inclusaomarcacao
	from [bi_rip_trustedZone].[dbo].[tb_fat_inclusaomarcacao] as fat with (nolock)
	where COALESCE(fat.[dt_marcacao2_alterada], fat.[dt_marcacao2]) is not null
union all
	select
		 fat.[dt_pontoEspelho]
		,fat.[cd_matricula_funcionarios]
		,fat.cd_filial_funcionarios
		,fat.cd_deptoConta_funcionarios
		,fat.cd_deptocc_funcionarios
		,COALESCE(fat.[dt_marcacao3_alterada], fat.[dt_marcacao3]) as marcacao
		,3 as ordem
		,case when fat.[dt_marcacao3_alterada] is null then 'NÃO' else 'SIM' end as fl_alteracao_inclusaomarcacao
	from [bi_rip_trustedZone].[dbo].[tb_fat_inclusaomarcacao] as fat with (nolock)
	where COALESCE(fat.[dt_marcacao3_alterada], fat.[dt_marcacao3]) is not null
union all
	select
		 fat.[dt_pontoEspelho]
		,fat.[cd_matricula_funcionarios]
		,fat.cd_filial_funcionarios
		,fat.cd_deptoConta_funcionarios
		,fat.cd_deptocc_funcionarios
		,COALESCE(fat.[dt_marcacao4_alterada], fat.[dt_marcacao4]) as marcacao
		,4 as ordem
		,case when fat.[dt_marcacao4_alterada] is null then 'NÃO' else 'SIM' end as fl_alteracao_inclusaomarcacao
	from [bi_rip_trustedZone].[dbo].[tb_fat_inclusaomarcacao] as fat with (nolock)
	where COALESCE(fat.[dt_marcacao4_alterada], fat.[dt_marcacao4]) is not null

), MaxMinMarcacoes as
(
	select
		 [dt_pontoEspelho]
		,[cd_matricula_funcionarios]
		,cd_filial_funcionarios
		,cd_deptoConta_funcionarios
		,cd_deptocc_funcionarios
		,min(marcacao) as [dt_primeiraMarcacao_inclusaomarcacao]
		,max(marcacao) as [dt_ultimaMarcacao_inclusaomarcacao]
		,count(marcacao) as [qt_inclusaomarcacao]
		,count(CASE WHEN fl_alteracao_inclusaomarcacao = 'S' THEN 1 ELSE NULL END) AS fl_alteracao_inclusaomarcacao_S
		,count(CASE WHEN fl_alteracao_inclusaomarcacao = 'N' THEN 1 ELSE NULL END) AS fl_alteracao_inclusaomarcacaot_N
	from MenorGranularidade
	group by [dt_pontoEspelho]
		,[cd_matricula_funcionarios]
		,cd_filial_funcionarios
		,cd_deptoConta_funcionarios
		,cd_deptocc_funcionarios
)
select
	   fat.[cd_matricula_funcionarios]
	  ,RIGHT('000' + fat.cd_filial_funcionarios, 2) as cd_filial_funcionarios
	  ,fat.[dt_pontoEspelho]
	  ,concat('01', fat.cd_filial_funcionarios)  as [cd_empresaFilial_funcionarios]
	  ,fat.cd_deptoConta_funcionarios
	  ,fat.cd_deptocc_funcionarios
	  ,concat(fat.cd_filial_funcionarios, fat.cd_matricula_funcionarios) as [cd_filialMatricula_funcionarios]

      ,[dt_primeiraMarcacao_inclusaomarcacao]
      ,[dt_ultimaMarcacao_inclusaomarcacao]
	  ,coalesce([qt_inclusaomarcacao], 0)	as qt_inclusaomarcacao
	  ,fl_alteracao_inclusaomarcacao_S
	  ,fl_alteracao_inclusaomarcacaot_N

from [bi_rip_trustedZone].[dbo].[tb_fat_inclusaomarcacao] as fat with (nolock)
Left Join MaxMinMarcacoes mm on mm.[cd_matricula_funcionarios] = fat.[cd_matricula_funcionarios]
							and mm.[dt_pontoEspelho] = fat.[dt_pontoEspelho]


GO
/****** Object:  View [rpa].[vw_fat_ArqNaoProcessadosRPA]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE view [rpa].[vw_fat_ArqNaoProcessadosRPA]

as 

select *

from [bi_rip_trustedZone].[dbo].[tb_fat_ArqNaoProcessadosRPA] as  ArqNaoProcessadosRPA
--inner join 
--	(
--		select distinct cc_pedidosComprasXnotasFiscaisEntrada from [bi_rip_trustedZone].[sup].[vw_fat_pedidosCompras]
--	) 
--
--as ped_compras
--on ped_compras.cc_pedidosComprasXnotasFiscaisEntrada = nfs_saida.cc_pedidosComprasXnotasFiscaisEntrada
where dt_Data_do_Email >= '2021-01-01'



GO
/****** Object:  View [rpa].[vw_fat_ArqProcessadosRPA]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE view [rpa].[vw_fat_ArqProcessadosRPA]

as 

select *

from [bi_rip_trustedZone].[dbo].[tb_fat_ArqProcessadosRPA] as  ArqProcessadosRPA
--inner join 
--	(
--		select distinct cc_pedidosComprasXnotasFiscaisEntrada from [bi_rip_trustedZone].[sup].[vw_fat_pedidosCompras]
--	) 
--
--as ped_compras
--on ped_compras.cc_pedidosComprasXnotasFiscaisEntrada = nfs_saida.cc_pedidosComprasXnotasFiscaisEntrada
where dt_Data_do_Email >= '2021-01-01'




GO
/****** Object:  View [rpa].[vw_fat_ErrosRPA]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE view [rpa].[vw_fat_ErrosRPA]

as 

select *

from [bi_rip_trustedZone].[dbo].[tb_fat_ErrosRPA] as  ErrosRPA
--inner join 
--	(
--		select distinct cc_pedidosComprasXnotasFiscaisEntrada from [bi_rip_trustedZone].[sup].[vw_fat_pedidosCompras]
--	) 
--
--as ped_compras
--on ped_compras.cc_pedidosComprasXnotasFiscaisEntrada = nfs_saida.cc_pedidosComprasXnotasFiscaisEntrada
--where dt_Data_do_Email >= '2021-01-01'


GO
/****** Object:  View [rpa].[vw_fat_GestaoBotsRPA]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE view [rpa].[vw_fat_GestaoBotsRPA]

as 

select *

from [bi_rip_trustedZone].[dbo].[tb_fat_GestaoBotsRPA] as  GestaoBotsRPA
--inner join 
--	(
--		select distinct cc_pedidosComprasXnotasFiscaisEntrada from [bi_rip_trustedZone].[sup].[vw_fat_pedidosCompras]
--	) 
--
--as ped_compras
--on ped_compras.cc_pedidosComprasXnotasFiscaisEntrada = nfs_saida.cc_pedidosComprasXnotasFiscaisEntrada
where dt_Data_do_Email >= '2021-01-01'




GO
/****** Object:  View [rpa].[vw_fat_LogRPA]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE view [rpa].[vw_fat_LogRPA]

as 

select *

from [bi_rip_trustedZone].[dbo].[tb_fat_LogRPA] as  LogRPA
--inner join 
--	(
--		select distinct cc_pedidosComprasXnotasFiscaisEntrada from [bi_rip_trustedZone].[sup].[vw_fat_pedidosCompras]
--	) 
--
--as ped_compras
--on ped_compras.cc_pedidosComprasXnotasFiscaisEntrada = nfs_saida.cc_pedidosComprasXnotasFiscaisEntrada
where dt_Data_Hora >= '2021-01-01'

GO
/****** Object:  View [rpa].[vw_fat_NaoProcessadosRPA]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE view [rpa].[vw_fat_NaoProcessadosRPA]

as 

select *

from [bi_rip_trustedZone].[dbo].[tb_fat_NaoProcessadosRPA] as  NaoProcessadosRPA
--inner join 
--	(
--		select distinct cc_pedidosComprasXnotasFiscaisEntrada from [bi_rip_trustedZone].[sup].[vw_fat_pedidosCompras]
--	) 
--
--as ped_compras
--on ped_compras.cc_pedidosComprasXnotasFiscaisEntrada = nfs_saida.cc_pedidosComprasXnotasFiscaisEntrada
where dt_Data_do_Email >= '2021-01-01'


GO
/****** Object:  View [rpa].[vw_fat_ProcessadosRPA]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE view [rpa].[vw_fat_ProcessadosRPA]

as 

select *

from [bi_rip_trustedZone].[dbo].[tb_fat_ProcessadosRPA] as  ProcessadosRPA
--inner join 
--	(
--		select distinct cc_pedidosComprasXnotasFiscaisEntrada from [bi_rip_trustedZone].[sup].[vw_fat_pedidosCompras]
--	) 
--
--as ped_compras
--on ped_compras.cc_pedidosComprasXnotasFiscaisEntrada = nfs_saida.cc_pedidosComprasXnotasFiscaisEntrada
where dt_Data_do_Email >= '2021-01-01'



GO
/****** Object:  View [sau].[vw_dim_cid]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [sau].[vw_dim_cid]
as

SELECT
	cd_cid, cd_subCat, ds_cid
FROM bi_rip_trustedZone.dbo.tb_dim_cid

GO
/****** Object:  View [sau].[vw_dim_cid_capitulo]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [sau].[vw_dim_cid_capitulo]
as

SELECT
	cd_subCat, ds_capitulo
FROM bi_rip_trustedZone.dbo.tb_dim_cid_capitulo

GO
/****** Object:  View [sau].[vw_dim_cid_categoria]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [sau].[vw_dim_cid_categoria]
as

SELECT
	cd_categoria_cid, ds_categoria_cid
FROM bi_rip_trustedZone.dbo.tb_dim_cid_categoria

GO
/****** Object:  View [sau].[vw_fat_atestados]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [sau].[vw_fat_atestados]
as
SELECT
	cd_filialMatricula_funcionario = CONCAT(cd_filial_funcionario, cd_matricula_funcionario),
	cd_filial_funcionario,
	cd_matricula_funcionario,
	cd_atestado,
	cd_abono,
	tp_atestado =
		CASE tp_atestado
			WHEN 'A' THEN 'Autorização Saída'
			WHEN 'I' THEN 'Indireta'
			WHEN 'D' THEN 'Direta'
			ELSE ''
		END,
	cd_afastamento,
	cd_CID,
	dt_dataInicio_afastamento = CONVERT(date, dt_dataInicio_afastamento),
	dt_dataFim_afastamento = CONVERT(date, dt_dataFim_afastamento),
	tp_medicoEmitente = 
		CASE tp_medicoEmitente
			WHEN '1' THEN 'Interno'
			WHEN '2' THEN 'Externo'
			WHEN '3' THEN 'Empresa'
			WHEN '4' THEN 'SUS'
			WHEN '5' THEN 'Particular'
			WHEN '6' THEN 'Convênio'
			ELSE ''
		END,
	cd_acidenteTrabalho,
	vl_qtdeDias
  FROM bi_rip_trustedZone.dbo.tb_fat_atestados
  LEFT OUTER JOIN bi_rip_trustedZone.dbo.tb_dim_fichaMedica
  on cd_fichaMedica = cd_fichaFuncionario
  WHERE cd_matricula_funcionario <> ''

GO
/****** Object:  View [sup].[vw_dim_armazensEstoque]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


  CREATE view [sup].[vw_dim_armazensEstoque] as


 SELECT 
      [cd_filialArmazem_locaisEstoque] = [cd_filialArmazem_locaisEstoque]
      ,[cd_filial_armazensEstoque] = [cd_filial_locaisEstoque]
      ,[cd_armazem_armazensEstoque] = [cd_local_locaisEstoque]
      ,[ds_armazem_armazensEstoque] = [ds_local_locaisEstoque]
      ,[tp_armazem_armazensEstoque] = [tp_armazem_locaisEstoque]
      --,[fl_integracaoPims_locaisEstoque]
      --,[fl_entraCalculo_locaisEstoque]
      --,[fl_verificaSaldoAlternativo_locaisEstoque]
      --,[fl_anp45_locaisEstoque]
      --,[fl_amrmazemVendaDms_locaisEstoque]
      --,[fl_armazenagemUnitizada_locaisEstoque]
  FROM [bi_rip_trustedZone].[dbo].[tb_dim_locaisEstoque]



GO
/****** Object:  View [sup].[vw_dim_centroCusto]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [sup].[vw_dim_centroCusto]

as 

select
	cd_centroCusto_centroCusto,
	cd_filial_centroCusto,
	cd_filialArmazem_centroCusto,
	cd_armazemFilial_centroCusto,
	cd_empresaFilial_centroCusto,
	nm_unidadeFederal_centroCusto,
	ds_moeda1_centroCusto
	,dt_inicioExistencia_centroCusto
	,dt_finalExistencia_centroCusto
	,cd_localDebito_centroCusto
	,cd_localCredito_centroCusto
	,nm_municipio_centroCusto
	,cd_mercadoDebito_centroCusto
	,cd_mercadoCredito_centroCusto
	,cd_atividadeDebito_centroCusto
	,cd_atividadeCredito_centroCusto
from [bi_rip_trustedZone].[dbo].[tb_dim_centroCusto] with (nolock)

GO
/****** Object:  View [sup].[vw_dim_centroCustoFiliais]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












CREATE view [sup].[vw_dim_centroCustoFiliais]

as 

select cd_centroCusto_centroCusto, cd_empresaFilial_centroCusto, nm_filial_empresasFiliais, ds_moeda1_centroCusto, sg_unidadeFederal_empresasFiliais
from bi_rip_trustedZone.dbo.tb_dim_centroCusto as cc with (nolock)
left join bi_rip_trustedZone.dbo.tb_dim_empresasFiliais ef with (nolock)
on cc.cd_empresaFilial_centroCusto = ef.cd_empresaFilial_empresasFiliais

GO
/****** Object:  View [sup].[vw_dim_compradores]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create view [sup].[vw_dim_compradores]
as

SELECT 
      [cd_filial_compradores]
      ,[cd_comprador_compradores]
      ,[nm_usuario_compradores]
      ,[cd_usuario_compradores]
      ,[nr_telefone_compradores]
      ,[nr_fax_compradores]
      ,[nm_email_compradores]
      ,[cd_grupoAprovacao_compradores]
      ,[fl_incluiPedidoSemSC_compradores]
      ,[cd_grupoComprasPadrao_compradores]
      ,[cd_grupoAprovacaoContrato_compradores]
      ,[cd_perfilAcc_compradores]
      ,[cd_usuarioBloqueado_compradores]
      ,[cd_recno_SY1]

  FROM [bi_rip_trustedZone].[dbo].[tb_dim_compradores]
GO
/****** Object:  View [sup].[vw_dim_condicoesPagamento]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [sup].[vw_dim_condicoesPagamento]
as
SELECT 
      [cd_filial_condicoesPagamento]
      ,[cd_condicao_condicoesPagamento]
      ,[tp_condicao_condicoesPagamento]
      ,[nm_condicao_condicoesPagamento]
      ,[ds_condicao_condicoesPagamento]
      ,[ds_dias_condicoesPagamento]
      ,[st_registro_condicoesPagamento]
      ,[fl_permiteAdiantamento_condicoesPagamento]
      ,[cd_recno_CTT]
  FROM [bi_rip_trustedZone].[dbo].[tb_dim_condicoesPagamento]
GO
/****** Object:  View [sup].[vw_dim_fornecedores]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE view [sup].[vw_dim_fornecedores]

as 

select
	cd_fornecedor_fornecedores,
	cd_loja_fornecedores,
	nm_filial_fornecedores,
	nm_fantasia_fornecedores,
	sg_unidadeFederal_fornecedores,
	nm_municipioFornecedor_fornecedores

	-- adicionado 03.05.2022
	,cnr_cpfCnpj_fornecedores
	,nr_maiorAtrasoEmDias_fornecedores
	,nr_mediaAtrasoEmDias_fornecedores
	,dt_ultimaCompra_fornecedores
	,vl_maiorCompra_fornecedores
	,nr_telefone_fornecedores
	,nr_contatoEmpresa_fornecedores
	,cd_condicaoPagamento_fornecedores
from [bi_rip_trustedZone].[dbo].[tb_dim_fornecedores] with (nolock)
GO
/****** Object:  View [sup].[vw_dim_grupoProdutos]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE view [sup].[vw_dim_grupoProdutos]

as 

select
	   [cd_filial_grupoProdutos]
      ,[cd_grupo_grupoProdutos]
      ,[ds_grupo_grupoProdutos]
      ,[st_grupo_grupoProdutos]
      ,[cd_grupoRelacionado_grupoProdutos]
      ,[cd_grupoProdutos_grupoProdutos]
      ,[cd_familiaRip_grupoProdutos]
      ,[cd_contaContabilConsumo_grupoProdutos]
      ,[cd_contaContabilDespesa_grupoProdutos]
      ,[tp_produto_grupoProdutos]
      ,[cd_categoriaOrex_grupoProdutos]
      ,[nr_diasEntrega_grupoProdutos]
      ,[cd_naturezaConsumo_grupoProdutos]
      ,[cd_naturezaAplicacao_grupoProdutos]
	  ,IIF(fl_bloqueado_grupoProdutos = '1', 'S', 'N') as fl_bloqueado_grupoProdutos
      ,[cd_recno_SBM]
from [bi_rip_trustedZone].[dbo].[tb_dim_grupoProdutos] with (nolock)

GO
/****** Object:  View [sup].[vw_dim_prazoEntregaCompra]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE view [sup].[vw_dim_prazoEntregaCompra]

as


with base as (
	
	select
		--c.cd_filial_pedidosCompras
		 cd_produto_pedidosCompras cd_produto
		,s.nm_filial_empresasFiliais  nm_filial
		,s.nm_empresa_empresasFiliais nm_empresa
		,dt_emissao_pedidosCompras dt_emissao
		,min(dt_digitacao_notasFiscaisEntradaItens) dt_digitacao
		,cd_empresaFilial_empresasFiliais
	from bi_rip_trustedZone.dbo.tb_fat_pedidosCompras as c with (nolock)
	
		inner join (
			select distinct sc.cc_solicitacoesComprasXpedidosCompras, f.nm_filial_empresasFiliais, nm_empresa_empresasFiliais, cd_empresaFilial_empresasFiliais
			from bi_rip_trustedZone.dbo.tb_fat_pedidosEmitidos as p with (nolock)
			inner join bi_rip_trustedZone.dbo.tb_fat_solicitacoesCompras as sc
			on sc.cc_pedidosEmitidosXsolicitacoesCompras = p.cc_pedidosEmitidosXsolicitacoesCompras
			inner join bi_rip_trustedZone.dbo.tb_dim_centroCusto as cc with (nolock)
			on cc.cd_centroCusto_centroCusto = p.cd_centroCusto_pedidosEmitidos
			inner join bi_rip_trustedZone.dbo.tb_dim_empresasFiliais as f with (nolock)
			on f.cd_empresaFilial_empresasFiliais = cc.cd_empresaFilial_centroCusto
		)  as s
		on s.cc_solicitacoesComprasXpedidosCompras= c.cc_solicitacoesComprasXpedidosCompras
	
		inner join bi_rip_trustedZone.dbo.tb_fat_notasFiscaisEntrada as n with (nolock)
		on c.cc_pedidosComprasXnotasFiscaisEntrada = n.cc_pedidosComprasXnotasFiscaisEntrada
	
	where
		dt_emissao_pedidosCompras >= dateadd(month,-12,GETDATE())
		--and cd_produto_pedidosCompras = '100776500'
	group by
		--c.cd_filial_pedidosCompras
		 cd_produto_pedidosCompras 
		,cd_empresaFilial_empresasFiliais
		,s.nm_filial_empresasFiliais
		,s.nm_empresa_empresasFiliais
		,dt_emissao_pedidosCompras 
),
historico_entrega as (
	select
		cd_produto
		,cd_empresaFilial_empresasFiliais
		,nm_filial
		,nm_empresa
		,dt_emissao
		,convert(float,datediff(day,dt_emissao,dt_digitacao)) nr_dias
	from base
),
historico_calculado as  (
	select 
		 cd_produto
		,cd_empresaFilial_empresasFiliais
		,nm_filial
		,nm_empresa
		,nr_medDias12Meses = avg(nr_dias)
		,nr_maxDias12Meses = max(nr_dias)
		,nr_minDias12Meses = min(nr_dias)
		,nr_medDias9meses = (select avg(h2.nr_dias) from historico_entrega h2 with (nolock) where h2.dt_emissao>=dateadd(month,-9,GETDATE()) and h2.cd_produto=h.cd_produto and h2.cd_empresaFilial_empresasFiliais=h.cd_empresaFilial_empresasFiliais and h2.nm_filial=h.nm_filial and h2.nm_empresa=h.nm_empresa)
		,nr_maxDias9meses = (select max(h2.nr_dias) from historico_entrega h2 with (nolock) where h2.dt_emissao>=dateadd(month,-9,GETDATE()) and h2.cd_produto=h.cd_produto and h2.cd_empresaFilial_empresasFiliais=h.cd_empresaFilial_empresasFiliais and h2.nm_filial=h.nm_filial and h2.nm_empresa=h.nm_empresa)
		,nr_minDias9meses = (select min(h2.nr_dias) from historico_entrega h2 with (nolock) where h2.dt_emissao>=dateadd(month,-9,GETDATE()) and h2.cd_produto=h.cd_produto and h2.cd_empresaFilial_empresasFiliais=h.cd_empresaFilial_empresasFiliais and h2.nm_filial=h.nm_filial and h2.nm_empresa=h.nm_empresa)
		,nr_medDias6meses = (select avg(h2.nr_dias) from historico_entrega h2 with (nolock) where h2.dt_emissao>=dateadd(month,-6,GETDATE()) and h2.cd_produto=h.cd_produto and h2.cd_empresaFilial_empresasFiliais=h.cd_empresaFilial_empresasFiliais and h2.nm_filial=h.nm_filial and h2.nm_empresa=h.nm_empresa)
		,nr_maxDias6meses = (select max(h2.nr_dias) from historico_entrega h2 with (nolock) where h2.dt_emissao>=dateadd(month,-6,GETDATE()) and h2.cd_produto=h.cd_produto and h2.cd_empresaFilial_empresasFiliais=h.cd_empresaFilial_empresasFiliais and h2.nm_filial=h.nm_filial and h2.nm_empresa=h.nm_empresa)
		,nr_minDias6meses = (select min(h2.nr_dias) from historico_entrega h2 with (nolock) where h2.dt_emissao>=dateadd(month,-6,GETDATE()) and h2.cd_produto=h.cd_produto and h2.cd_empresaFilial_empresasFiliais=h.cd_empresaFilial_empresasFiliais and h2.nm_filial=h.nm_filial and h2.nm_empresa=h.nm_empresa)
		,nr_medDias3meses = (select avg(h2.nr_dias) from historico_entrega h2 with (nolock) where h2.dt_emissao>=dateadd(month,-3,GETDATE()) and h2.cd_produto=h.cd_produto and h2.cd_empresaFilial_empresasFiliais=h.cd_empresaFilial_empresasFiliais and h2.nm_filial=h.nm_filial and h2.nm_empresa=h.nm_empresa)
		,nr_maxDias3meses = (select max(h2.nr_dias) from historico_entrega h2 with (nolock) where h2.dt_emissao>=dateadd(month,-3,GETDATE()) and h2.cd_produto=h.cd_produto and h2.cd_empresaFilial_empresasFiliais=h.cd_empresaFilial_empresasFiliais and h2.nm_filial=h.nm_filial and h2.nm_empresa=h.nm_empresa)
		,nr_minDias3meses = (select min(h2.nr_dias) from historico_entrega h2 with (nolock) where h2.dt_emissao>=dateadd(month,-3,GETDATE()) and h2.cd_produto=h.cd_produto and h2.cd_empresaFilial_empresasFiliais=h.cd_empresaFilial_empresasFiliais and h2.nm_filial=h.nm_filial and h2.nm_empresa=h.nm_empresa)
	from historico_entrega as h
	group by 
		cd_produto
		,nm_filial
		,cd_empresaFilial_empresasFiliais
		,nm_empresa
),
regra_final as (
select
	cd_produto
	,tp_local = iif(cd_empresaFilial_empresasFiliais = '0110','SEDE','FILIAL')
	,cd_empresaFilial_empresasFiliais as cd_empresaFilial
	,nm_filial
	,nm_empresa
	,nr_diasCalculado12Meses =  ROUND((nr_maxDias12Meses+(nr_medDias12Meses*2))/3,0)
	,nr_diasCalculado9Meses =  ROUND((nr_maxDias9meses+(nr_medDias9meses*2))/3,0)
	,nr_diasCalculado6Meses =  ROUND((nr_maxDias6meses+(nr_medDias6meses*2))/3,0)
	,nr_diasCalculado3Meses =  ROUND((nr_maxDias3meses+(nr_medDias3meses*2))/3,0)
from historico_calculado
)
select
	cd_produto,
	tp_local,
	cd_empresaFilial,
	nm_filial,
	nm_empresa,
	nr_diasCalculado = iif(nr_diasCalculado3Meses is not null,nr_diasCalculado3Meses, 
							iif(nr_diasCalculado6Meses is not null,nr_diasCalculado6Meses,
								iif(nr_diasCalculado9Meses is not null,nr_diasCalculado9Meses,
									iif(nr_diasCalculado12Meses is not null,nr_diasCalculado12Meses,null))))
from regra_final

GO
/****** Object:  View [sup].[vw_dim_prazoPedidoCompra]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [sup].[vw_dim_prazoPedidoCompra]

as 

with base as  (
	select
		 cd_produto_pedidosCompras cd_produto
		--,s.nm_filial_empresasFiliais  nm_filial
		--,s.nm_empresa_empresasFiliais nm_empresa
		,min(dt_emissao_solicitacoesCompras) dt_solicitacao
		,dt_emissao_pedidosCompras dt_pedido
		--,cd_empresaFilial_empresasFiliais 
		,tp_atendimento_pedidosEmitidos tp_atendimento
	from bi_rip_trustedZone.dbo.tb_fat_pedidosCompras as c with (nolock)
	
		inner join (
			select distinct sc.cc_solicitacoesComprasXpedidosCompras,  dt_emissao_solicitacoesCompras, tp_atendimento_pedidosEmitidos --f.nm_filial_empresasFiliais, nm_empresa_empresasFiliais, cd_empresaFilial_empresasFiliais,
			from bi_rip_trustedZone.dbo.tb_fat_pedidosEmitidos as p with (nolock)
			inner join bi_rip_trustedZone.dbo.tb_fat_solicitacoesCompras as sc with (nolock)
			on sc.cc_pedidosEmitidosXsolicitacoesCompras = p.cc_pedidosEmitidosXsolicitacoesCompras
			inner join bi_rip_trustedZone.dbo.tb_dim_centroCusto as cc with (nolock)
			on cc.cd_centroCusto_centroCusto = p.cd_centroCusto_pedidosEmitidos
			inner join bi_rip_trustedZone.dbo.tb_dim_empresasFiliais as f with (nolock)
			on f.cd_empresaFilial_empresasFiliais = cc.cd_empresaFilial_centroCusto
			where f.cd_empresa_empresasFiliais = '01'
		)  as s
		on s.cc_solicitacoesComprasXpedidosCompras= c.cc_solicitacoesComprasXpedidosCompras

	where
		dt_emissao_pedidosCompras >= dateadd(month,-12,GETDATE())
		
	group by
		 cd_produto_pedidosCompras
		--,cd_empresaFilial_empresasFiliais
		--,s.nm_filial_empresasFiliais
		--,s.nm_empresa_empresasFiliais
		,dt_emissao_pedidosCompras
		,tp_atendimento_pedidosEmitidos

),

historico_entrega as (
	select
		cd_produto
		,tp_atendimento
		,dt_solicitacao
		,convert(float,datediff(day,dt_solicitacao,dt_pedido)) nr_dias
	from base
),
historico_calculado as  (
	select 
		 cd_produto
		,tp_atendimento
		,nr_medDias12Meses = avg(nr_dias)
		,nr_maxDias12Meses = max(nr_dias)
		--,nr_minDias12Meses = min(nr_dias)
		,nr_medDias9meses = (select avg(h2.nr_dias) from historico_entrega h2 where h2.dt_solicitacao>=dateadd(month,-9,GETDATE()) and h2.cd_produto=h.cd_produto and h2.tp_atendimento=h.tp_atendimento)
		,nr_maxDias9meses = (select max(h2.nr_dias) from historico_entrega h2 where h2.dt_solicitacao>=dateadd(month,-9,GETDATE()) and h2.cd_produto=h.cd_produto and h2.tp_atendimento=h.tp_atendimento)
		--,nr_minDias9meses = (select min(h2.nr_dias) from historico_entrega h2 where h2.dt_solicitacao>=dateadd(month,-9,GETDATE()) and h2.cd_produto=h.cd_produto and h2.tp_atendimento=h.tp_atendimento)
		,nr_medDias6meses = (select avg(h2.nr_dias) from historico_entrega h2 where h2.dt_solicitacao>=dateadd(month,-6,GETDATE()) and h2.cd_produto=h.cd_produto and h2.tp_atendimento=h.tp_atendimento)
		,nr_maxDias6meses = (select max(h2.nr_dias) from historico_entrega h2 where h2.dt_solicitacao>=dateadd(month,-6,GETDATE()) and h2.cd_produto=h.cd_produto and h2.tp_atendimento=h.tp_atendimento)
		--,nr_minDias6meses = (select min(h2.nr_dias) from historico_entrega h2 where h2.dt_solicitacao>=dateadd(month,-6,GETDATE()) and h2.cd_produto=h.cd_produto and h2.tp_atendimento=h.tp_atendimento)
		,nr_medDias3meses = (select avg(h2.nr_dias) from historico_entrega h2 where h2.dt_solicitacao>=dateadd(month,-3,GETDATE()) and h2.cd_produto=h.cd_produto and h2.tp_atendimento=h.tp_atendimento)
		,nr_maxDias3meses = (select max(h2.nr_dias) from historico_entrega h2 where h2.dt_solicitacao>=dateadd(month,-3,GETDATE()) and h2.cd_produto=h.cd_produto and h2.tp_atendimento=h.tp_atendimento)
		--,nr_minDias3meses = (select min(h2.nr_dias) from historico_entrega h2 where h2.dt_solicitacao>=dateadd(month,-3,GETDATE()) and h2.cd_produto=h.cd_produto and h2.tp_atendimento=h.tp_atendimento)
	from historico_entrega as h
	group by 
		cd_produto
		,tp_atendimento
),

regra_final as (
select
	cd_produto
	,tp_atendimento
	,nr_diasCalculado12Meses =  ROUND((nr_maxDias12Meses+(nr_medDias12Meses*2))/3,0)
	,nr_diasCalculado9Meses =  ROUND((nr_maxDias9meses+(nr_medDias9meses*2))/3,0)
	,nr_diasCalculado6Meses =  ROUND((nr_maxDias6meses+(nr_medDias6meses*2))/3,0)
	,nr_diasCalculado3Meses =  ROUND((nr_maxDias3meses+(nr_medDias3meses*2))/3,0)
from historico_calculado
)

select
	cd_produto,
	tp_atendimento,
	nr_diasCalculado = iif(nr_diasCalculado3Meses is not null,nr_diasCalculado3Meses, 
							iif(nr_diasCalculado6Meses is not null,nr_diasCalculado6Meses,
								iif(nr_diasCalculado9Meses is not null,nr_diasCalculado9Meses,
									iif(nr_diasCalculado12Meses is not null,nr_diasCalculado12Meses,null))))
from regra_final
GO
/****** Object:  View [sup].[vw_dim_tipoAtendimento]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [sup].[vw_dim_tipoAtendimento]

as

select 'SEDE' tp_atendimento union 
select 'LOCAL' tp_atendimento union 
select 'SEDE - EMERGÊNCIAL' tp_atendimento 
GO
/****** Object:  View [sup].[vw_fat_docMontagemVolume]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [sup].[vw_fat_docMontagemVolume]

as 

select
	[cd_filial_docMontagemVolume],
	[cd_centroCusto_docMontagemVolume],
	[cd_endereco_docMontagemVolume],
	[cd_carga_docMontagemVolume],
	[cd_montagem_docMontagemVolume]
	,FORMAT(CONVERT(date, [dt_montagem_docMontagemVolume]), 'd', 'pt-br') AS [dt_montagem_docMontagemVolume]
	,IIF([tp_status_docMontagemVolume] = '1', 'Pendente', 'Concluído') AS [tp_status_docMontagemVolume]
	,[cd_ordemExpedicao_docMontagemVolume]
	,[cd_filialDestino_docMontagemVolume]
from [bi_rip_trustedZone].[dbo].[tb_fat_docMontagemVolume] with (nolock)

GO
/****** Object:  View [sup].[vw_fat_estoque]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE view [sup].[vw_fat_estoque]

as

with EstoqueEnderecos as
(
select
	[cc_estoqueXestoqueEnderecos]
	,sum([qt_endereco_estoqueEnderecos])			as [qt_endereco_estoqueEnderecos]
	,sum([qt_empenhadaPrevista_estoqueEnderecos])	as [qt_empenhadaPrevista_estoqueEnderecos]
	,sum([qt_empenhoEndereco_estoqueEnderecos])		as [qt_empenhoEndereco_estoqueEnderecos]
from bi_rip_trustedZone.dbo.tb_fat_estoqueEndereco as en with (nolock)
	group by [cc_estoqueXestoqueEnderecos]	 
)
select
	  es.[cc_estoqueXestoqueEnderecos]
	  ,concat('01', [cd_filial_estoque])  as [cd_empresaFilial_estoque]
	  ,concat([cd_filial_estoque], [cd_armazem_estoque]) as [cd_filialArmazem_estoque]
      ,[cd_filial_estoque]
      ,[cd_produto_estoque]
      ,[cd_armazem_estoque]
      ,[qt_saldoFimMes_estoque]
      ,[qt_saldoAtual_estoque]
      ,[vl_saldoAtual_estoque]
      ,[vl_custoUnitario_estoque]
      ,[qt_empenhada_estoque]
      ,[dt_ultimaSaida_estoque]
      ,[qt_reservada_estoque]
      ,[qt_pedidoVendas_estoque]
      ,[qt_naoEnderecada_estoque]
      ,[qt_previstaParaEntrar_estoque]
      ,[dt_ultimoInventario_estoque]
      ,[dt_bloqueioInventarioFinal_estoque]
      ,[qt_saldoPoder3_estoque]
      ,[qt_aEnderecar_estoque]
      ,[dt_bloqueioInventarioInicial_estoque]
      ,[qt_saldoFimMes2_estoque]
      ,[tp_armazem_estoque]
      ,[vl_custoUnitarioReposicao_estoque]
      ,[qt_ultimoSaldoEmEstoque_estoque]
      ,[dt_ultimoEnvio_estoque]
      ,[tp_bloqueio_estoque]
      ,[ds_fechamentoInicial_estoque]
      ,[ds_fechamentoFinal_estoque]
      ,[hr_ultimoMovimento_estoque]
      ,[hr_ultimoEnvio_estoque]
      ,[dt_ultimoMovimento_estoque]
      ,[cd_recno_SB2]
	  ,coalesce([qt_endereco_estoqueEnderecos], 0)	as qt_endereco_estoque
      ,coalesce([qt_empenhoEndereco_estoqueEnderecos], 0)	as qt_empenhoEndereco_estoque
      ,coalesce([qt_empenhadaPrevista_estoqueEnderecos], 0)	as qt_empenhadaPrevista_estoque
	  ,iif(coalesce([qt_endereco_estoqueEnderecos], 0) <> [qt_saldoAtual_estoque], 'SIM', 'NÃO') as fl_saldoDesnivelado_estoque

from bi_rip_trustedZone.dbo.tb_fat_estoque as es with (nolock)
left join EstoqueEnderecos as en
on es.cc_estoqueXestoqueEnderecos = en.cc_estoqueXestoqueEnderecos





GO
/****** Object:  View [sup].[vw_fat_estoqueMinimo]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [sup].[vw_fat_estoqueMinimo] AS


WITH 

ProdutosRecorrentes AS (
SELECT
      [cd_filial_notasFiscaisEntradaItens]
	  ,[cd_armazem_notasFiscaisEntradaItens]
      ,[cd_produto_notasFiscaisEntradaItens]
      --,[cd_centroCusto_notasFiscaisEntradaItens]
	  ,COUNT(DISTINCT MONTH([dt_emissao_notasFiscaisEntradaItens])) + 
	   COUNT(DISTINCT IIF([dt_emissao_notasFiscaisEntradaItens] >= DATEADD(month, -3, GETDATE()), MONTH([dt_emissao_notasFiscaisEntradaItens]), NULL)) as qtd_meses
FROM [bi_rip_trustedZone].[dbo].[tb_fat_notasFiscaisEntrada]
	WHERE [dt_emissao_notasFiscaisEntradaItens] >= DATEADD(MONTH, -6, DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)) AND [dt_emissao_notasFiscaisEntradaItens] < DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)
	--AND tp_documento_notasFiscaisEntradaItens IN ('N')
	GROUP BY
	   [cd_filial_notasFiscaisEntradaItens]
	  ,[cd_armazem_notasFiscaisEntradaItens]
      ,[cd_produto_notasFiscaisEntradaItens]
      --,[cd_centroCusto_notasFiscaisEntradaItens]
),

Solicitacoes AS (
SELECT
       cd_filial = [cd_filial_notasFiscaisEntradaItens]
      ,cd_produto = [cd_produto_notasFiscaisEntradaItens]
	  ,cd_armazem = [cd_armazem_notasFiscaisEntradaItens]
	  ,periodo = MONTH([dt_emissao_notasFiscaisEntradaItens])
      --,cd_centroCusto = [cd_centroCusto_notasFiscaisEntradaItens]
	  ,qt_solicitado = SUM([qt_produto_notasFiscaisEntradaItens])
FROM [bi_rip_trustedZone].[dbo].[tb_fat_notasFiscaisEntrada] nfe
	WHERE [cd_filial_notasFiscaisEntradaItens] +'|'+ [cd_produto_notasFiscaisEntradaItens] +'|'+ [cd_armazem_notasFiscaisEntradaItens] IN 
	(SELECT	[cd_filial_notasFiscaisEntradaItens] +'|'+ [cd_produto_notasFiscaisEntradaItens] +'|'+ [cd_armazem_notasFiscaisEntradaItens] FROM ProdutosRecorrentes WHERE qtd_meses >= 7)
	AND [dt_emissao_notasFiscaisEntradaItens] >= DATEADD(MONTH, -6, DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)) AND [dt_emissao_notasFiscaisEntradaItens] < DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)
	GROUP BY
	   [cd_filial_notasFiscaisEntradaItens]
      ,[cd_produto_notasFiscaisEntradaItens]
      ,[cd_armazem_notasFiscaisEntradaItens]
	  ,MONTH([dt_emissao_notasFiscaisEntradaItens])
),

PedidosEmitidos AS (
SELECT
	cd_filialOrigem_pedidosEmitidos,
	cd_produto_pedidosEmitidos,
	cd_armazem_pedidosEmitidos = [cd_armazemFilial_centroCusto],
	qt_emSolicitacaoDeCompras_pedidosEmitidos,
	qt_emPedidoDeCompras_pedidosEmitidos,
	qt_emNotaFiscalDeTransferenciaDeSaida_pedidosEmitidos
FROM [bi_rip_trustedZone].dbo.tb_fat_pedidosEmitidos
INNER JOIN [bi_rip_trustedZone].dbo.tb_dim_centroCusto ON cd_filialOrigem_pedidosEmitidos = RIGHT(cd_empresaFilial_centroCusto, 2) AND cd_centroCusto_pedidosEmitidos = cd_centroCusto_centroCusto
),

EstoqueMinimo AS (
SELECT 
	 cd_filial
	,cd_produto
	,cd_armazem
	,qt_estoque_minimo = ROUND( ( MAX(qt_solicitado) + (AVG(qt_solicitado) * 4) + MIN(qt_solicitado)) /6, 0) * 2 
	,qt_saldo_estoque = SUM(qt_saldoAtual_estoque)
	,qt_em_processo_compras = COALESCE(SUM(qt_emSolicitacaoDeCompras_pedidosEmitidos), 0)
	,qt_em_pedido_compras = COALESCE(SUM(qt_emPedidoDeCompras_pedidosEmitidos), 0)
	,qt_em_transferencia_saida = COALESCE(SUM(qt_emNotaFiscalDeTransferenciaDeSaida_pedidosEmitidos), 0)
FROM Solicitacoes 
LEFT JOIN [bi_rip_trustedZone].dbo.tb_fat_estoque est ON cd_filial_estoque = cd_filial AND cd_produto_estoque = cd_produto AND cd_armazem_estoque = cd_armazem
LEFT JOIN PedidosEmitidos ped ON cd_filialOrigem_pedidosEmitidos = cd_filial AND cd_produto_pedidosEmitidos = cd_produto AND cd_armazem_pedidosEmitidos = cd_armazem
	GROUP BY [cd_filial], [cd_armazem], [cd_produto]
) 
	  
SELECT
	  cc_estoque_minimo = cd_filial +'|'+ cd_armazem +'|'+ cd_produto
      ,cd_filial = cd_filial
      ,cd_produto = cd_produto
      ,cd_armazem = cd_armazem
	  ,qt_estoque_minimo
	  ,qt_saldo_estoque
	  ,qt_em_processo_compras
	  ,qt_em_pedido_compras
	  ,qt_em_transferencia_saida
	  ,qt_total_a_chegar = qt_saldo_estoque + qt_em_processo_compras + qt_em_pedido_compras + qt_em_transferencia_saida
	  ,qt_sugestao_fluig = IIF(qt_estoque_minimo - (qt_saldo_estoque + qt_em_processo_compras + qt_em_pedido_compras + qt_em_transferencia_saida) > 0,
			qt_estoque_minimo - (qt_saldo_estoque + qt_em_processo_compras + qt_em_pedido_compras + qt_em_transferencia_saida), 0)
	  ,vl_estoque_minimo = qt_estoque_minimo * vl_ultimoPrecoCompra_produtos
	  ,vl_sugestao_fluig = IIF(qt_estoque_minimo - (qt_saldo_estoque + qt_em_processo_compras + qt_em_pedido_compras + qt_em_transferencia_saida) > 0,
			(qt_estoque_minimo - (qt_saldo_estoque + qt_em_processo_compras + qt_em_pedido_compras + qt_em_transferencia_saida)) * vl_ultimoPrecoCompra_produtos, 0)
FROM EstoqueMinimo
LEFT JOIN bi_rip_trustedZone.dbo.tb_dim_produtos ON cd_produto = cd_produto_produtos;

GO
/****** Object:  View [sup].[vw_fat_expedicaoVolumes]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [sup].[vw_fat_expedicaoVolumes]
AS

SELECT
	cd_filial_expedicaoVolumes,
	cd_ordem_expedicaoVolumes,
	IIF(dt_emissao_expedicaoVolumes = '', '', FORMAT(CONVERT(date, dt_emissao_expedicaoVolumes), 'd', 'pt-br')) AS dt_emissao_expedicaoVolumes,
	cd_centroCusto_expedicaoVolumes,
	cd_filialDestino_expedicaoVolumes,
	tp_documento_expedicaoVolumes,
	nm_usuarioCriacao_expedicaoVolumes,
	cd_documento_expedicaoVolumes,
	cd_pedidoRemessa_expedicaoVolumes,
	cd_transp_expedicaoVolumes
FROM bi_rip_trustedZone.dbo.tb_fat_expedicaoVolumes
GO
/****** Object:  View [sup].[vw_fat_itensMontagemVolume]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [sup].[vw_fat_itensMontagemVolume]

as 

select
	cd_filial_itensMontagemVolume		
	,cd_montagem_itensMonstagemVolume 	
	,cd_item_itensMontagemVolume 		
	,cd_produto_itensMontagemVolume		
	,qt_origem_itensMontagemVolume
from [bi_rip_trustedZone].[dbo].[tb_fat_itensMontagemVolume] with (nolock)

GO
/****** Object:  View [sup].[vw_fat_Legendas]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




--- select * from [sup].[vw_fat_pedidosEmitidos]




create view [sup].[vw_fat_Legendas]

as

select
 cd_pedido_pedidosEmitidos+'|'+cd_fluigEmissao_pedidosEmitidos+'|'+cd_produto_pedidosEmitidos+'|'+cd_itemEmissao_pedidosEmitidos as sk_emissao
,cc_pedidosEmitidosXsolicitacoesCompras
,cd_pedido_pedidosEmitidos
,cc_pedidosEmitidosXsolicitacoesSeparacoes
,dt_emissao_pedidosEmitidos
,cd_itemEmissao_pedidosEmitidos
,cd_fluigEmissao_pedidosEmitidos
,cd_centroCusto_pedidosEmitidos
,cd_produto_pedidosEmitidos
,dt_necessidade_pedidosEmitidos
,nm_solicitante_pedidosEmitidos
,tp_atendimento_pedidosEmitidos
,qt_solicitada_pedidosEmitidos
,qt_aSeparar_pedidosEmitidos
,qt_aComprar_pedidosEmitidos
,qt_entregue_pedidosEmitidos
,st_emissao_pedidosEmitidos
,st_rm_pedidosEmitidos
,st.ds_pedidoEmitido_statusPedidosEmitidos 
,nr_ordemServico_pedidosEmitidos
,tp_emergencia_pedidosEmitidos = 
	iif(tp_emergencia_pedidosEmitidos='0','Não',
		iif(tp_emergencia_pedidosEmitidos='1','Mobilização Obra',
			iif(tp_emergencia_pedidosEmitidos='2','Aumento Escopo',
				iif(tp_emergencia_pedidosEmitidos='3','Aumento Efetivo',
					iif(tp_emergencia_pedidosEmitidos='4','Aceleração Obra',
						iif(tp_emergencia_pedidosEmitidos='5','Serviços Extras',
							iif(tp_emergencia_pedidosEmitidos='6','Solicitação Cliente','Não Definido / Não')))))))


,fl_cancelado_pedidosEmitidos = iif(st_emissao_pedidosEmitidos='P' and qt_entregue_pedidosEmitidos = 0,1,0)
,st_atendimento_pedidosEmitidos = iif(st_emissao_pedidosEmitidos in ('P','O'),'Finalizado','Aberto')
,lc_atendimento_pedidosEmitidos =
	iif(tp_atendimento_pedidosEmitidos='S','Sede',
		iif(tp_atendimento_pedidosEmitidos='L','Local','Indefinido'))
--,fl_existeSolicitacaoSeparacao = isnull((select count(*) from bi_rip_trustedZone.dbo.tb_fat_solicitacoesSeparacoes s where s.cc_pedidosEmitidosXsolicitacoesSeparacoes = emi.cc_pedidosEmitidosXsolicitacoesSeparacoes),0)
--,fl_existeSolicitacaoCompra = isnull((select count(*) from bi_rip_trustedZone.dbo.tb_fat_solicitacoesCompras s where s.cc_pedidosEmitidosXsolicitacoesCompras = emi.cc_pedidosEmitidosXsolicitacoesCompras),0)

from bi_rip_trustedZone.dbo.tb_fat_pedidosEmitidos as emi
left join bi_rip_trustedZone.dbo.tb_dim_statusPedidosEmitidos as st
on st.st_pedidoEmitido_statusPedidosEmitidos = emi.st_rm_pedidosEmitidos

--where dt_emissao_pedidosEmitidos >= '2021-01-01'


GO
/****** Object:  View [sup].[vw_fat_mestreInventario]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [sup].[vw_fat_mestreInventario]

AS

SELECT 
      [cd_filial_mestreInventario]
      ,[cd_inventario_mestreInventario]
      ,[tp_analise_mestreInventario]
      ,CONVERT(DATE,[dt_inventario_mestreInventario], 103) AS [dt_inventario_mestreInventario]
      ,[qt_contagensArealizar_mestreInventario]
      ,[cd_almoxarifado_mestreInventario]
      ,[tp_tipoInventario_mestreInventario]
      ,[cd_endereco_mestreInventario]
      ,[cd_produto_mestreInventario]
      ,[qt_contagensRealizadas_mestreInventario]
      ,[tp_status_mestreInventario]
      ,[tp_autorizacaoRecontagem_mestreInventario]
      ,[tp_curvaA_mestreInventario]
      ,[tp_curvaB_mestreInventario]
      ,[tp_curvaC_mestreInventario]
      ,[tp_inventarioGuiado_mestreInventario]
      ,[tp_inventarioEletronico_mestreInventario]
      ,[tp_dispositivo_mestreInventario]
  FROM bi_rip_trustedZone.dbo.[tb_fat_mestreInventario]

GO
/****** Object:  View [sup].[vw_fat_movInterna]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [sup].[vw_fat_movInterna]
AS

SELECT
	cd_filial_movInterna
	,tp_movimento_movInterna
	,cd_produto_movInterna
	,cd_unidade_movInterna
	,qt_movimento_movInterna
	,tp_reDe_movInterna
	,cd_contabil_movInterna
	,cd_ordemProducao_movInterna
	,cd_armazem_movInterna
	,cd_documento_movInterna
	,FORMAT(CONVERT(date, dt_emissao_movInterna, 103), 'd', 'pt-br') AS dt_emissao_movInterna
	,cd_grupo_movInterna
	,vl_custo1_movInterna
	,vl_custo2_movInterna
	,vl_custo3_movInterna
	,vl_custo4_movInterna
	,vl_custo5_movInterna
	,cd_centroCusto_movInterna
	,vf_parcialTotal_movInterna
	,vf_estornardo_movInterna
	,cd_sequencial_movInterna
	,cd_segundaUnidade_movInterna
	,qt_movimentoSegundaUnidade_movInterna
	,cd_tipo_movInterna
	,cd_nivelEstrutura_movInterna
	,nm_usuario_movInterna
	,cd_regraWms_movInterna
	,vl_perda_movInterna
	,FORMAT(CONVERT(date, dt_lancContabil_movInterna, 103), 'd', 'pt-br') AS dt_lancContabil_movInterna
	,cd_chave_movInterna
	,cd_operacaoPai_movInterna
	,vl_porcRateio_movInterna
	,cd_lote_movInterna
	,cd_subLote_movInterna
	,cd_validLote_movInterna
	,cd_endereco_movInterna
	,cd_numSerie_movInterna
	,vl_custoFifo1_movInterna
	,vl_custoFIfo2_movInterna
	,vl_custoFifo3_movInterna
	,vl_custoFifo4_movInterna
	,vl_custoFifo5_movInterna
	,cd_itemRemito_movInterna
	,cd_verificacao_movInterna
	,cd_itemConta_movInterna
	,cd_clVal_movInterna
	,cd_projeto_movInterna
	,cd_tarefa_movInterna
	,cd_ordemServico_movInterna
	,cd_servico_movInterna
	,cd_statusServico_movInterna
	,cd_osAssinTec_movInterna
	,vl_potenciaLote_movInterna
	,cd_estrFisica_movInterna
	,cd_regAtendim_movInterna
	,cd_docSWN_movInterna
	,cd_itemSWN_movInterna
	,cd_itemGrade_movInterna
	,tp_statusMov_movInterna
	,vl_reposicao_movInterna
	,vl_repos2am_movInterna
	,vl_repos3am_movInterna
	,vl_repos4am_movInterna
	,vl_repos5am_movInterna
	,vl_repUni_movInterna
	,cd_moedaCrep_movInterna
	,cd_revEstrutura_movInterna
	,cd_procImport_movInterna
	,cd_emenhoOP_movInterna
	,vl_CSTFixo_movInterna
	,vl_macroNutr_movInterna
	,vl_microNutr_movInterna
	,cd_moedaCfixo_movInterna
	,cd_diario_movInterna
	,vf_garantia_movInterna
	,cd_seqDiario_movInterna
	,cd_boletim_movInterna
	,qt_ganho_movInterna
	,qt_maior_movInterna
	,cd_SA_movInterna
	,cd_perImpo_movInterna
	,vl_valorVi_movInterna
	,cd_chaveNF_movInterna
	,cd_desconto_movInterna
	,cd_cat83_movInterna
	,cd_marca_movInterna
	,cd_itemSA_movInterna
	,vl_PD_movInterna
	,cd_tipoEntrada_movInterna
	,cd_safra_movInterna
	,cd_mercadoDeb_movInterna
	,cd_mercadoCred_movInterna
	,cd_modalidadeDeb_movInterna
	,cd_modalidadeCred_movInterna
	,cd_localDeb_movInterna
	,cd_localCred_movInterna
	,cd_atividadeDeb_movInterna
	,cd_atividadeCred_movInterna
	,cd_letraDeb_movInterna
	,cd_letraCred_movInterna
	,cd_tanque_movInterna
	,vl_massaEsp_movInterna
	,vl_tempAmostra_movInterna
	,vl_tempTanque_movInterna
	,vl_densAmbient_movInterna
	,qt_ambiente_movInterna
	,vl_fatorCorrecao_movInterna
	,tp_movAjust_movInterna
	,cd_fornecedor_movInterna
	,cd_lojaFornecedor_movInterna
	,cd_operacao_movInterna
	,ds_observacao_movInterna
	,cd_chaveSF2_movInterna
	,cd_dcf_movInterna
	,cd_fornecedorDoc_movInterna
	,cd_lojaDoc_movInterna
	,cd_perBlocoK_movInterna
	,cd_origem_movInterna
	,cd_estaMat_movInterna
	,vl_percCreditoObra_movInterna
	,cd_centroCustoOrigem_movInterna
	,cd_chaveAcessoNF_movInterna
FROM bi_rip_trustedZone.dbo.tb_fat_movInterna
GO
/****** Object:  View [sup].[vw_fat_notasFiscaisEntrada]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE view [sup].[vw_fat_notasFiscaisEntrada]

as 

select
	nfs_saida.cc_pedidosComprasXnotasFiscaisEntrada
	,dt_emissao_notasFiscaisEntrada
	,nr_documento_notasFiscaisEntrada
	,nr_documento_notasFiscaisEntradaItens
	,nr_titulo_notasFiscaisEntrada
	,dt_digitacao_notasFiscaisEntrada
	,dt_digitacao_notasFiscaisEntradaItens
	,qt_produto_notasFiscaisEntradaItens
	,vl_total_notasFiscaisEntradaItens
	,vl_unitario_notasFiscaisEntradaItens
	
	--- adicionado 02.05.2022
	,cd_produto_notasFiscaisEntradaItens
	,cd_armazem_notasFiscaisEntradaItens
	,nm_UnidadeFederal_notasFiscaisEntrada
	,ds_unidadeMedida_notasFiscaisEntradaItens
	,tp_entrada_notasFiscaisEntradaItens
	,cd_notaFiscalEletronica_notasFiscaisEntrada
	,cd_centroCusto_notasFiscaisEntradaItens
	,cd_clienteDestino_notasFiscaisEntrada
	,cd_lojaClienteDestino_notasFiscaisEntrada
	,cd_lojaClienteOrigem_notasFiscaisEntrada
	,cd_grupoProduto_notasFiscaisEntradaItens
	,cd_itemPedidoCompra_notasFiscaisEntradaItens
	,cd_pedidoCompra_notasFiscaisEntradaItens
from [bi_rip_trustedZone].[dbo].[tb_fat_notasFiscaisEntrada] nfs_saida with (nolock)
--inner join 
--	(
--		select distinct cc_pedidosComprasXnotasFiscaisEntrada from [bi_rip_trustedZone].[sup].[vw_fat_pedidosCompras]
--	) 
--
--as ped_compras
--on ped_compras.cc_pedidosComprasXnotasFiscaisEntrada = nfs_saida.cc_pedidosComprasXnotasFiscaisEntrada
--where dt_emissao_notasFiscaisEntrada >= '2021-01-01'
GO
/****** Object:  View [sup].[vw_fat_notasFiscaisSaida]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE view [sup].[vw_fat_notasFiscaisSaida]

as

select 
	nfs_saida.cc_pedidosVendasXnotasFiscaisSaida
	,dt_emissao_notasFiscaisSaida
	,nr_documento_notasFiscaisSaida
	,cd_notaFiscal_notasFiscaisSaida
	,cd_notaFiscal_notasFiscaisSaidaItens
	,qt_produto_notasFiscaisSaidaItens
	,dt_digitacao_notasFiscaisSaidaItens
	,vl_total_notasFiscaisSaidaItens
	,vl_unitario_notasFiscaisSaidaItens
	,cd_item_notasFiscaisSaidaItens
	,cd_produto_notasFiscaisSaidaItens
	,ds_unidadeMedida_notasFiscaisSaidaItens
	,tp_saida_notasFiscaisSaidaItens
	,cd_fiscal_notasFiscaisSaidaItens
	,cd_itemPedidoVenda_notasFiscaisSaidaItens
	,cd_cliente_notasFiscaisSaida
	,cd_loja_notasFiscaisSaida
	,cd_armazem_notasFiscaisSaidaItens
	,cd_grupoProduto_notasFiscaisSaidaItens
	,tp_produto_notasFiscaisSaidaItens
	,nr_sequencial_notasFiscaisSaidaItens
	,cd_notaFiscalOriginal_notasFiscaisSaidaItens
	,cd_centroCusto_notasFiscaisSaidaItens
	,cd_md5_notasFiscaisSaidaItens
	,cd_mds_notasFiscaisSaida
from bi_rip_trustedZone.dbo.tb_fat_notasFiscaisSaida as nfs_saida with (nolock)
--inner join (
--
--select distinct cc_pedidosVendasXnotasFiscaisSaida from bi_rip_trustedZone.sup.[vw_fat_pedidosVendas]
--
--) ped_vend 
--on ped_vend.cc_pedidosVendasXnotasFiscaisSaida = nfs_saida.cc_pedidosVendasXnotasFiscaisSaida 
--where dt_emissao_notasFiscaisSaida >= '2021-01-01'

 
GO
/****** Object:  View [sup].[vw_fat_pedidosCompras]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE view [sup].[vw_fat_pedidosCompras]

as 

with base as (

	select
		ped_compras.cc_pedidosComprasXnotasFiscaisEntrada
		,ped_compras.cc_solicitacoesComprasXpedidosCompras
		,ped_compras.dt_emissao_pedidosCompras
		,ped_compras.dt_entrega_pedidosCompras
		,ped_compras.cd_item_pedidosCompras
		,ped_compras.nr_pedidoCompra_pedidosCompras
		,ds_unidadeMedida_pedidosCompras
		,dt_contabilizacao_pedidosCompras
		,qt_pedido_pedidosCompras
		,qtd_jaEntregue_pedidosCompras
		,dt_conferencia_pedidosCompras
		,cd_produto_pedidosCompras
		,dt_inicioCompra_pedidosCompras
		,nm_solicitante_pedidosCompras
		,cd_filial_pedidosCompras
		,cd_filialEntrega_pedidosCompras
		,cd_filialOrigem_pedidosCompras
		,cd_centroCusto_pedidosCompras = isnull(c.cd_centroCusto_centroCusto,cd_centroCusto_pedidosCompras)
		,CR_ZE1 = c.cd_centroCusto_centroCusto
		,CR_SC7 = cd_centroCusto_pedidosCompras
		,cd_fornecedor_pedidosCompras
		,cd_usuario_pedidosCompras
		,cd_lojaForncedor_pedidosCompras
		,nm_usuario_compradores = (select top 1 nm_usuario_compradores from bi_rip_trustedZone.dbo.tb_dim_compradores as c where c.cd_usuario_compradores = ped_compras.cd_usuario_pedidosCompras)
		,f.nm_fantasia_fornecedores
		--,fl_pedidoAtendido_pedidosCompras = iif(fl_pedidoEncerrado_pedidosCompras = 'E' or fl_residuoEliminado_pedidosCompras = 'S',1,0)
	
		,fl_pedidoEntregueAtrasado_pedidosCompras =
			iif((fl_pedidoEncerrado_pedidosCompras = 'E' or fl_residuoEliminado_pedidosCompras = 'S') and dt_entrega_pedidosCompras<dt_emissao_notasFiscaisEntrada,1,0)
			--iif(dt_emissao_notasFiscaisEntrada is null,0,iif(dt_entrega_pedidosCompras<dt_emissao_notasFiscaisEntrada,1,0))
	
		,fl_pedidoNaoEntregueAtrasado_pedidosCompras =
			iif((fl_pedidoEncerrado_pedidosCompras <> 'E' and fl_residuoEliminado_pedidosCompras <> 'S') and convert(date,getdate())>dateadd(day,3,dt_entrega_pedidosCompras),1,0)
			--iif(dt_emissao_notasFiscaisEntrada is null and getdate()>dt_entrega_pedidosCompras,1,0)
	
		,fl_pedidoEntregue_pedidosCompras =
			iif(fl_pedidoEncerrado_pedidosCompras = 'E' or fl_residuoEliminado_pedidosCompras = 'S',1,0)
			--iif(fl_pedidoEncerrado_pedidosCompras = 'E' and dt_emissao_notasFiscaisEntrada is not null,1,0)
	
		,fl_pedidoNaoEntregue_pedidosCompras =
			iif(fl_pedidoEncerrado_pedidosCompras <> 'E' and fl_residuoEliminado_pedidosCompras <> 'S',1,0)
			--iif(dt_emissao_notasFiscaisEntrada is null,1,0)
	
		,fl_semSolicitacaoCompras_pedidosCompras = iif(s.cc_solicitacoesComprasXpedidosCompras is null,1,0)
		,tp_atendimento_pedidosEmitidos = iif(z.tp_atendimento_pedidosEmitidos = 'S','Sede',iif(z.tp_atendimento_pedidosEmitidos = 'L','Local','Indefinido'))
		,tp_atendimento_pedidosCompras = iif(cd_filial_pedidosCompras='10','Sede','Local')
		,fl_semPedidoZE1_pedidosCompras = iif(z.tp_atendimento_pedidosEmitidos is null,1,0)
		,c.nm_filial_empresasFiliais
		,c.cd_empresaFilial_centroCusto
		,ds_moeda1_centroCusto
		,p.ds_grupo_grupoProdutos
		,p.nm_cientifico_produtos

		--- adicionado 02.05.2022
		,nr_solicitacao_pedidosCompras
		,cd_itemSolicitacao_pedidosCompras
		,cd_condicaoPagamento_pedidosCompras
		,fl_residuoEliminado_pedidosCompras
		,ds_produto_pedidosCompras
		,vl_unitario_pedidosCompras
		,vl_total_pedidosCompras
		,ds_observacao_pedidosCompras
		,nr_cotacao_pedidosCompras
		,qt_solicitada_pedidosCompras
		,tp_entradaNota_pedidosCompras
		,nr_fluig_pedidosCompras
		,cd_grupoAprovacao_pedidosCompras
		,cd_grupoCopradores_pedidosCompras
		,tp_compra_pedidosCompras
		,cd_armazem_pedidosCompras
		,fl_pedidoEncerrado_pedidosCompras

	from bi_rip_trustedZone.dbo.tb_fat_pedidosCompras as ped_compras with (nolock)
	left join (
		select min(dt_emissao_notasFiscaisEntrada) dt_emissao_notasFiscaisEntrada, cc_pedidosComprasXnotasFiscaisEntrada
		from bi_rip_trustedZone.dbo.tb_fat_notasFiscaisEntrada with (nolock)
		group by cc_pedidosComprasXnotasFiscaisEntrada
	) as n 
	on n.cc_pedidosComprasXnotasFiscaisEntrada = ped_compras.cc_pedidosComprasXnotasFiscaisEntrada

	left join bi_rip_trustedZone.dbo.tb_dim_fornecedores as f with (nolock)
	on f.cd_loja_fornecedores = ped_compras.cd_lojaForncedor_pedidosCompras
	and f.cd_fornecedor_fornecedores = ped_compras.cd_fornecedor_pedidosCompras

	left join (
		select cd_produto_produtos, nm_cientifico_produtos, g.ds_grupo_grupoProdutos from bi_rip_trustedZone.dbo.tb_dim_produtos as p
		left join bi_rip_trustedZone.dbo.tb_dim_grupoProdutos as g with (nolock)
		on g.cd_grupo_grupoProdutos = p.cd_grupo_produtos
	) as p on
	p.cd_produto_produtos = ped_compras.cd_produto_pedidosCompras

	left join (
		select distinct cc_solicitacoesComprasXpedidosCompras from bi_rip_trustedZone.dbo.tb_fat_solicitacoesCompras with (nolock)
	) as s
	on s.cc_solicitacoesComprasXpedidosCompras = ped_compras.cc_solicitacoesComprasXpedidosCompras

	left join (
		select distinct cc_solicitacoesComprasXpedidosCompras, max(p.tp_atendimento_pedidosEmitidos) tp_atendimento_pedidosEmitidos, max(p.cd_centroCusto_pedidosEmitidos) as cd_centroCusto_pedidosEmitidos
		from bi_rip_trustedZone.dbo.tb_fat_solicitacoesCompras as s with (nolock)
		inner join bi_rip_trustedZone.dbo.tb_fat_pedidosEmitidos as p with (nolock) on  
		p.cc_pedidosEmitidosXsolicitacoesCompras = s.cc_pedidosEmitidosXsolicitacoesCompras
		group by cc_solicitacoesComprasXpedidosCompras
	) as z
	on z.cc_solicitacoesComprasXpedidosCompras = ped_compras.cc_solicitacoesComprasXpedidosCompras

	left join (

	select cd_centroCusto_centroCusto, cd_empresaFilial_centroCusto, nm_filial_empresasFiliais, ds_moeda1_centroCusto
	from bi_rip_trustedZone.dbo.tb_dim_centroCusto as cc with (nolock)
	left join bi_rip_trustedZone.dbo.tb_dim_empresasFiliais ef with (nolock)
	on cc.cd_empresaFilial_centroCusto = ef.cd_empresaFilial_empresasFiliais

	) as c
	on isnull(cd_centroCusto_pedidosEmitidos,ped_compras.cd_centroCusto_pedidosCompras) = c.cd_centroCusto_centroCusto

	--where dt_emissao_pedidosCompras >= '2021-01-01' and dt_emissao_pedidosCompras <=getdate()
)

select distinct
	*,
	st_pedido =
		iif(fl_pedidoEntregueAtrasado_pedidosCompras=1,'Entregue com Atraso',
			iif(fl_pedidoEntregue_pedidosCompras=1 and fl_pedidoEntregueAtrasado_pedidosCompras=0,'Entregue sem Atraso',
				iif(fl_pedidoNaoEntregueAtrasado_pedidosCompras=1,'Ñ Entregue com Atraso',
					iif(fl_pedidoNaoEntregue_pedidosCompras=1 and fl_pedidoNaoEntregueAtrasado_pedidosCompras=0,'Ñ Entregue sem Atraso','Indefinido')
					)
				)
			)
					
		
from base



GO
/****** Object:  View [sup].[vw_fat_pedidosTransferencias]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE view [sup].[vw_fat_pedidosTransferencias]

as

select 
sk_destino as sk_pedidosTransferencias
,cc_pedidosTransferenciasXpedidosVendas
,cc_solicitacoesSeparacoesXpedidosTransferencias
,dt_emissao_pedidosTransferencias
,st_pedido_pedidosTransferencias
,qt_pedido_pedidosTransferenciasItens

-- adicionado 02.05.2022
,cd_filial_pedidosTransferencias
,cd_pedido_pedidosTransferencias
,cd_filialOrigem_pedidosTransferenciasItens
,cd_produto_pedidosTransferenciasItens
,ds_unidadeMedidaDestino_pedidosTransferenciasItens
,ds_unidadeMedidaOrigem_pedidosTransferenciasItens
,cd_endereco_pedidosTransferenciasItens
,dt_validadeLote_pedidosTransferenciasItens
,cd_filialDestino_pedidosTransferenciasItens
,cd_produtoDestino_pedidosTransferenciasItens
,cd_armazemDestino_pedidosTransferenciasItens
,cd_armazemOrigem_pedidosTransferenciasItens
,cd_TESEntrada_pedidosTransferenciasItens
,cd_TESSaida_pedidosTransferenciasItens
,nr_documento_pedidosTransferenciasItens
,nr_serieDocumento_pedidosTransferenciasItens
,ds_obervacao_pedidosTransferenciasItens
,vl_precoVenda_pedidosTransferenciasItens

from [bi_rip_trustedZone].[dbo].[tb_fat_pedidosTransferencias] with (nolock)
--where dt_emissao_pedidosTransferencias >= '2021-01-01'
GO
/****** Object:  View [sup].[vw_fat_pedidosVendas]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE view [sup].[vw_fat_pedidosVendas]

as

select
	sk_destino as sk_pedidosVendas
	,ped_vend.cc_pedidosVendasXnotasFiscaisSaida
	,ped_vend.cc_solicitacoesSeparacoesXpedidosVendas
	,ped_vend.cc_pedidosTransferenciasXpedidosVendas
	,ped_vend.dt_emissao_pedidosVendas
	,qt_vendida_pedidosVendasItens
	,qt_empenhada_pedidosVendasItens
	,qt_entregue_pedidosVendasItens
	,qt_liberada_pedidosVendasItens
	,dt_entrega_pedidosVendas
	,dt_entregaSugeridaAPS_pedidosVendasItens
	,dt_entrega_pedidosVendasItens
	,dt_faturamento_pedidosVendasItens
	,dt_integracao_pedidosVendasItens
	
	-- adicionado 02.05.2022
	,cd_filial_pedidosVendas
	,cd_item_pedidosVendasItens
	,cd_produto_pedidosVendasItens
	,ds_auxiliar_pedidosVendasItens
	,ds_unidadeMedidaPrimaria_pedidosVendasItens
	,vl_unitarioTabela_pedidosVendasItens
	,vl_totalItem_pedidosVendasItens
	,tp_pedido_pedidosVendas
	,cd_armazem_pedidosVendasItens
	,cd_ficalOperacao_pedidosVendasItens
	,cd_cliente_pedidosVendas
	,cd_lojaCliente_pedidosVendas
	,nr_notaFiscal_pedidosVendas
	,nr_pedido_pedidosVendas
	,nr_serieNotaFiscal_pedidosVendas
	,fl_bloqueio_pedidosVendasItens
	,cd_situacaoTributaria_pedidosVendasItens
	,cd_centroCusto_pedidosVendasItens
	,cd_contaContabil_pedidosVendasItens
	,tp_produto_pedidosVendasItens

	from bi_rip_trustedZone.dbo.tb_fat_pedidosVendas as ped_vend with (nolock)
--inner join 
--	(select distinct cc_solicitacoesSeparacoesXpedidosVendas
--	 from bi_rip_trustedZone.sup.vw_fat_solicitacoesSeparacoes) sol_trans
--on sol_trans.cc_solicitacoesSeparacoesXpedidosVendas = ped_vend.cc_solicitacoesSeparacoesXpedidosVendas
--where dt_emissao_pedidosVendas >= '2021-01-01'
GO
/****** Object:  View [sup].[vw_fat_pickListMontagemVolume]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [sup].[vw_fat_pickListMontagemVolume]
AS

SELECT 
	[cd_filial_pickListMontagemVolume]
	,[cd_montagem_pickListMontagemVolume]
	,[cd_item_pickListMontagemVolume] 
	,[cd_produto_pickListMontagemVolume]
	,[cd_local_pickListMontagemVolume] 
	,[cd_endereco_pickListMontagemVolume]
	,[qt_separar_pickListMontagemVolume]
	,[cd_reserva_pickListMontagemVolume]
FROM bi_rip_trustedZone.dbo.tb_fat_pickListMontagemVolume
GO
/****** Object:  View [sup].[vw_fat_reservaFaturamento]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [sup].[vw_fat_reservaFaturamento]
AS

SELECT 
      [cd_filial_reservaFaturamento]
      ,[cd_reserva_reservaFaturamento]
      ,[tp_reserva_reservaFaturamento]
      ,[cd_docReserva_reservaFaturamento]
      ,[nm_solicit_reservaFaturamento]
      ,[cd_filialReserva_reservaFaturamento]
      ,[cd_produto_reservaFaturamento]
      ,[cd_armazem_reservaFaturamento]
      ,[qt_reserva_reservaFaturamento]
      ,CONVERT(date,[dt_validade_reservaFaturamento], 103) AS [dt_validade_reservaFaturamento]
      ,CONVERT(date,[dt_emissao_reservaFaturamento], 103) AS [dt_emissao_reservaFaturamento]
      ,[cd_subLote_reservaFaturamento]
      ,[cd_lote_reservaFaturamento]
      ,[cd_endereco_reservaFaturamento]
      ,[cd_numSerie_reservaFaturamento]
      ,[cd_qtdOriginal_reservaFaturamento]
      ,[qt_pedido_reservaFaturamento]
      ,[ds_observacao_reservaFaturamento]
      ,[qt_eliminacao_reservaFaturamento]
      ,[cd_origem_reservaFaturamento]
FROM bi_rip_trustedZone.dbo.tb_fat_reservaFaturamento
GO
/****** Object:  View [sup].[vw_fat_solicitacoesSeparacoes]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO














CREATE view [sup].[vw_fat_solicitacoesSeparacoes]

as

select
sk_destino sk_solicitacaoSeparacao
,sol_sep.cc_pedidosEmitidosXsolicitacoesSeparacoes
,sol_sep.cc_solicitacoesSeparacoesXpedidosTransferencias
,sol_sep.cc_solicitacoesSeparacoesXpedidosVendas
,dt_emissao_solicitacoesSeparacoes
,dt_atendimento_solicitacoesSeparacoes
,dt_separacao_solicitacoesSeparacoes
,qt_produto_solicitacoesSeparacoes
,qt_separada_solicitacoesSeparacoes
,nr_requisicao_solicitacoesSeparacoes

-- adicionado 02.05.2022
,cd_filial_solicitacoesSeparacoes
,cd_itemRequisicao_solicitacoesSeparacoes
,cd_requisicao_solicitacoesSeparacoes
,cd_usuarioOrdemServico_solicitacoesSeparacoes
,cd_produto_solicitacoesSeparacoes
,nm_enderecoOrigem_solicitacoesSeparacoes
,nm_enderecoDestino_solicitacoesSeparacoes
,cd_usuarioSeparador_solicitacoesSeparacoes
,nm_local_solicitacoesSeparacoes
,st_separacao_solicitacoesSeparacoes
,nr_soliciatacaoTransferencia_solicitacoesSeparacoes
,st_emPedidoVenda_solicitacoesSeparacoes
,st_emRequisicao_solicitacoesSeparacoes
,st_emTransferencia_solicitacoesSeparacoes
,nr_pedidoVenda_solicitacoesSeparacoes
,nr_solicitacaoTransferencia_solicitacoesSeparacoes
,hr_atendimento_solicitacoesSeparacoes
,nm_uruarioAtendimento_solicitacoesSeparacoes
,cd_centroCusto_solicitacoesSeparacoes
,nm_armarioDestino_solicitacoesSeparacoes
,nm_ControleEndereco_solicitacoesSeparacoes
,cd_transferencia_solicitacoesSeparacoes
from bi_rip_trustedZone.dbo.tb_fat_solicitacoesSeparacoes sol_sep with (nolock)
--inner join 
--	(
--		select distinct cc_pedidosEmitidosXsolicitacoesSeparacoes
--		from sup.vw_fat_pedidosEmitidos
--	) ped_emi
--on sol_sep.cc_pedidosEmitidosXsolicitacoesSeparacoes = ped_emi.cc_pedidosEmitidosXsolicitacoesSeparacoes
---where dt_emissao_solicitacoesSeparacoes >= '2021-01-01'
GO
/****** Object:  View [sup].[vw_fat_tarefaSeparacaoOT]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [sup].[vw_fat_tarefaSeparacaoOT]
AS

SELECT
	cd_filial_tarefaSeparacaoOT			
	,cd_montagem_tarefaSeparacaoOT 		
	,cd_itemVolume_tarefaSeparacaoOT	
	,cd_produto_tarefaSeparacaoOT 		
	,cd_armazem_tarefaSeparacaoOT 		
	,cd_endereco_tarefaSeparacaoOT 		
	,cd_tarefa_tarefaSeparacaoOT 		
	,cd_requisicao_tarefaSeparacaoOT 	
	,cd_itemRequisicao_tarefaSeparacaoOT
	,qt_separado_tarefaSeparacaoOT
FROM bi_rip_trustedZone.dbo.tb_fat_tarefaSeparacaoOT
GO
/****** Object:  View [sup].[vw_lkt_solicitacaoSeparacao]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE view [sup].[vw_lkt_solicitacaoSeparacao]

as

with linktable as (

select
	distinct
	 ped_venda.cc_solicitacoesSeparacoesXpedidosVendas
	,ped_trans.cc_solicitacoesSeparacoesXpedidosTransferencias
from bi_rip_trustedZone.dbo.tb_fat_pedidosVendas as ped_venda with (nolock)
left join bi_rip_trustedZone.dbo.tb_fat_pedidosTransferencias as ped_trans  with (nolock)
on ped_trans.cc_pedidosTransferenciasXpedidosVendas = ped_venda.cc_pedidosTransferenciasXpedidosVendas

union

select
	distinct
	 ped_venda.cc_solicitacoesSeparacoesXpedidosVendas
	,ped_trans.cc_solicitacoesSeparacoesXpedidosTransferencias
from bi_rip_trustedZone.dbo.tb_fat_pedidosTransferencias as ped_trans  with (nolock)
left join bi_rip_trustedZone.dbo.tb_fat_pedidosVendas as ped_venda with (nolock)
on ped_trans.cc_pedidosTransferenciasXpedidosVendas = ped_venda.cc_pedidosTransferenciasXpedidosVendas

),
linktable_tratada as (
select 
	distinct 
	iif(sol_sepa.sk_destino is null,sol_sepa2.sk_destino,sol_sepa.sk_destino) sk_solicitacaoSeparacao
	,lkt.*
from linktable as lkt with (nolock)
left join bi_rip_trustedZone.dbo.tb_fat_solicitacoesSeparacoes as sol_sepa with (nolock)
on sol_sepa.cc_solicitacoesSeparacoesXpedidosTransferencias = lkt.cc_solicitacoesSeparacoesXpedidosTransferencias
left join bi_rip_trustedZone.dbo.tb_fat_solicitacoesSeparacoes as sol_sepa2 with (nolock)
on sol_sepa2.cc_solicitacoesSeparacoesXpedidosVendas = lkt.cc_solicitacoesSeparacoesXpedidosVendas

)
select * from linktable_tratada
where sk_solicitacaoSeparacao is not null

GO
/****** Object:  View [sup].[vw_rel_distribuicaoWms]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [sup].[vw_rel_distribuicaoWms]

AS

SELECT [ID_DISTRIBUICAO]
      ,[DT_RETIRADA]
      ,[CD_FUNCIONARIO]
      ,[NM_FUNCIONARIO]
      ,[CD_PRODUTO]
      ,[NM_PRODUTO]
      ,[CD_UNIDADEMED]
      ,[CD_FILIAL]
      ,[NM_FILIAL]
      ,[CD_ARMAZEM]
      ,[NM_ARMAZEM]
      ,[CD_ENDERECO]
      ,[QT_DISTRIBUICAO]
      ,[NM_USUARIO]
      ,[DS_ATIVO]
      ,[DS_ENVIOERP]
      ,[DS_RETORNOERP]
      ,[DS_MSG]
  FROM [bi_rip_trustedZone].dbo.[tb_rel_distribuicaoWms]

GO
/****** Object:  View [sup].[vw_rel_itemEntradaNota]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [sup].[vw_rel_itemEntradaNota]

AS

SELECT
	D1_FILIAL AS [Filial],
	D1_COD AS [Cod Produto],
	B5_CEME AS [Desc Produto],
	D1_UM AS [Unidade Medida],
	D1_QUANT AS [Quantidade],
	D1_VUNIT AS [Valor Unit],
	D1_TOTAL AS [Valor Total],
	D1_TES AS [TES],
	F4_TEXTO AS [Desc TES],
	CASE F4_ESTOQUE WHEN 'S' THEN 'Sim' WHEN 'N' THEN 'Não' ELSE '' END AS [Atu Estoque],
	D1_ITEM AS [Item NF],
	D1_DOC AS [Doc NF],
	A2_NOME AS [Razão Social],
	CONVERT(date,D1_DTDIGIT) AS [Dt Digit],
	CONVERT(date,C7_DATPRF) AS [Dt Prev Entrega],
	C7_OBS AS [Obs PC],
	D1_CC AS [CR Nota Fiscal],
	D1_PEDIDO AS [Ped Compra],
	D1_ITEMPC AS [Item PC],
	Y1_NOME AS [Comprador]
--TABELAS
FROM [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SD1010 D1 WITH(NOLOCK)
INNER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SB5010 B5 WITH(NOLOCK)
ON B5_COD = D1_COD AND B5.D_E_L_E_T_ = ''
INNER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SF4010 F4 WITH(NOLOCK)
ON F4_CODIGO = D1_TES AND F4.D_E_L_E_T_ = ''
LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SA2010 A2 WITH(NOLOCK)
ON (D1_FORNECE + D1_LOJA) = (A2_COD + A2_LOJA) AND A2.D_E_L_E_T_ = ''
LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SC7010 C7 WITH(NOLOCK)
ON (C7_NUM + C7_ITEM + C7_FILENT) = (D1_PEDIDO + D1_ITEMPC + D1_FILIAL) AND C7.D_E_L_E_T_ = ''
LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SY1010 SY WITH(NOLOCK)
ON (C7_USER + C7_FILIAL) = (Y1_USER + Y1_FILIAL) AND SY.D_E_L_E_T_ = ''
-- CONDIÇÕES
WHERE D1.D_E_L_E_T_ = '' AND CONVERT(DATE, D1_DTDIGIT) > GETDATE() - 60
GO
/****** Object:  View [sup].[vw_rel_recebimento]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [sup].[vw_rel_recebimento]
AS
WITH CONS 
AS
(
SELECT
	ZNH_FILIAL AS [Filial],
	ZNH_LOCDES AS [Armazem],
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
		ELSE NULL END AS [Tipo Emergência],
	CASE 
		WHEN ZE1_QDTZE2 = 0 AND ZE1_QDTSC1 = 0 AND ZE1_STATUS NOT IN ('O', 'P') THEN 'Em Aberto'
		WHEN ZE1_QDTZE2 > 0 AND ZE1_QDTSC1 = 0 AND ZE1_STATUS NOT IN ('O', 'P') THEN 'Em Atendimento Estoque'
		WHEN ZE1_QDTZE2 = 0 AND ZE1_QDTSC1 > 0 AND ZE1_STATUS NOT IN ('O', 'P') THEN 'Em Atendimento Compras'
		WHEN ZE1_QDTZE2 > 0 AND ZE1_QDTSC1 > 0 AND ZE1_STATUS NOT IN ('O', 'P') THEN 'Em Atendimento Estoque/Compras'
		WHEN ZE1_STATUS = 'O' THEN 'Encerrada'
		WHEN ZE1_STATUS = 'P' THEN 'Eliminado Resíduo'
		ELSE NULL END AS [Sts RM],
	CASE
		WHEN ZE1_QDTSC1 = 0 AND ZE1_SC7QTD = 0 AND ZE1_SD1QCO = 0 THEN NULL
		WHEN ZE1_QDTSC1 > 0 AND ZE1_SC7QTD = 0 AND ZE1_SD1QCO = 0 AND (ZE1_QDTSC1 < ZE1_QUANT) THEN 'Solicitado p/ Compra Parcial'
		WHEN ZE1_QDTSC1 > 0 AND ZE1_SC7QTD = 0 AND ZE1_SD1QCO = 0 AND (ZE1_QDTSC1 >= ZE1_QUANT) THEN 'Solicitado p/ Compra Total'
		WHEN ZE1_QDTSC1 > 0 AND ZE1_SC7QTD > 0 AND ZE1_SD1QCO = 0 AND (ZE1_SC7QTD < ZE1_QUANT) THEN 'Ped Compra Emitido Parcial'
		WHEN ZE1_QDTSC1 > 0 AND ZE1_SC7QTD > 0 AND ZE1_SD1QCO = 0 AND (ZE1_SC7QTD >= ZE1_QUANT) THEN 'Ped Compra Emitido Total'
		WHEN ZE1_QDTSC1 > 0 AND ZE1_SC7QTD > 0 AND ZE1_SD1QCO > 0 AND (ZE1_SD1QCO < ZE1_QUANT) THEN 'Nota Fiscal Recebida Parcial'
		WHEN ZE1_QDTSC1 > 0 AND ZE1_SC7QTD > 0 AND ZE1_SD1QCO > 0 AND (ZE1_SD1QCO >= ZE1_QUANT) THEN 'Nota Fiscal Recebida Total'
		ELSE NULL END AS [Sts Entrada],
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
		ELSE NULL END AS [Sts Envio],
	ZE1_CC AS [Centro Custo],
	CTT_DESC01 AS [Desc CR],
	C1_LOJA AS [Loja],
	C1_FORNECE AS [Cod Forn],
	C1_SOLICIT AS [Nm Solic],
	CASE ZNF_DTEMIS WHEN '' THEN NULL ELSE CONVERT(DATE,ZNF_DTEMIS, 103) END AS [Dt Emissao],
	CASE ZNF_DTDIG  WHEN '' THEN NULL ELSE CONVERT(DATE,ZNF_DTDIG, 103)  END AS [Dt Digit],
	CASE ZE1_EMISSA WHEN '' THEN NULL ELSE CONVERT(DATE,ZE1_EMISSA, 103) END AS [Dt Emi Fluig],
	CASE ZE1_DTINT  WHEN '' THEN NULL ELSE CONVERT(DATE,ZE1_DTINT, 103)  END AS [Dt Int Fluig],
	CASE ZNG_DTEWMS WHEN '' THEN NULL ELSE CONVERT(DATE, ZNG_DTEWMS, 103) END AS [Dt Envio WMS],
	C1_CC AS [CR SC],
	CASE ZNF_SITNFE 
		WHEN '3' THEN 'NF Cancelada' 
		WHEN '9' THEN 'NF Verificar SEFAZ'
		WHEN '1' THEN 'Uso Autorizado' 
		ELSE 'Uso Denegado' END AS [Sit NF],
	CASE C1_OBS WHEN '' THEN NULL ELSE C1_OBS END AS [Obs SC],
	CASE ZNG_ZZUSER WHEN '' THEN NULL ELSE ZNG_ZZUSER END AS [Usr Conferencia],
	CASE ZNG_IDTKF WHEN '' THEN NULL ELSE ZNG_IDTKF END AS [Tkt Fiscal],
	CASE ZNG_MSGFIS WHEN '' THEN NULL ELSE ZNG_MSGFIS END AS [Msg Tkt],
	CASE ZNF_ZZPRO WHEN '' THEN NULL ELSE ZNF_ZZPRO END AS [Bipe NF],
	CASE ZNF_USR WHEN '' THEN NULL ELSE ZNF_USR END AS [Bipe Usr],
	CASE ZNF_OBS WHEN '' THEN NULL ELSE ZNF_OBS END AS [Obs Fiscal],
	CASE 
		WHEN C7_NUMSC = '' AND C1_ZCODZE1 = '' THEN 'Inclusão PC'
		WHEN C7_NUMSC <> '' AND C1_ZCODZE1 = '' THEN 'Inclusão SC'
		ELSE NULL END AS [Verif SC],
	ZNH_QUANT AS [Qtd Pre Nota],
	ZNH_VUNIT AS [Vlr Unit Pre Nota],
	ZE1_QUANT AS [Qtd Solic],
	ZE1_QDTZE2 AS [Qtd Separado],
	ZNQ_QTSEPA AS [Qtd Separ WMS],
	B2_QATU AS [Qtd Estoq],
	CASE B2_USAI WHEN '' THEN NULL ELSE CONVERT(DATE, B2_USAI, 103) END AS [Dt Ult Saida Estoque]
--TABELAS
FROM 
--NOTAS FISCAIS--
	[142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.ZNH010 ZH WITH(NOLOCK)
	INNER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.ZNF010 ZF WITH(NOLOCK)
	ON ZNH_CHVNFE = ZNF_CHAVE AND ZF.D_E_L_E_T_ = '' AND ZNF_TPDOC = 'NF-e'
	LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.ZNG010 ZG WITH(NOLOCK)
	ON ZNG_CHVNFE = ZNH_CHVNFE AND ZG.D_E_L_E_T_ = ''
--PEDIDOS--
	LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SC7010 C7 WITH(NOLOCK)
	ON (C7_NUM + C7_ITEM + C7_FILENT) = (ZNH_PEDIDO + ZNH_ITEMPC + ZNH_FILIAL) AND C7.D_E_L_E_T_ = ''
	LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SC1010 C1 WITH(NOLOCK)
	ON (C7_NUMSC + C7_ITEMSC + C7_FILENT) = (C1_NUM + C1_ITEM + C1_FILIAL) AND C1.D_E_L_E_T_ = ''
--SEPARAÇÕES--
	LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.ZE1010 Z1 WITH(NOLOCK)
	ON (C1_ZCODZE1 + C1_ZITEZE1 + C1_FILIAL) = (ZE1_CODIGO + ZE1_ITEM + ZE1_FILORI) AND Z1.D_E_L_E_T_ = ''
	LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.ZNQ010 ZN WITH(NOLOCK)
	ON (ZE1_CODIGO + ZE1_ITEM + ZE1_FILORI) = (ZNQ_REQSEP + ZNQ_ITREQ + ZNQ_FILIAL) AND ZN.D_E_L_E_T_ = ''
	LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.ZE3010 ZE3 WITH(NOLOCK)
	ON (ZE3_CODRQ + ZE3_ITEMRQ + ZE3_FILIAL) = (ZE1_CODIGO + ZE1_ITEM + ZE1_FILORI) AND ZE3.D_E_L_E_T_ = ''
--CADASTROS--
	LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SB2010 B2 WITH(NOLOCK)
	ON (ZNH_COD + ZNH_FILIAL + ZNH_LOCDES) = (B2_COD + B2_FILIAL + B2_LOCAL) AND B2.D_E_L_E_T_ = ''
	LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.CTT010 CT WITH(NOLOCK)
	ON CTT_CUSTO = ZE1_CC AND CT.D_E_L_E_T_ = ''
	LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SF4010 F4 WITH(NOLOCK)
	ON ZNH_TES = F4_CODIGO AND F4.D_E_L_E_T_ = ''
	LEFT OUTER JOIN [142.0.65.89,37000].[CF9JAO_148172_PR_PD].dbo.SB1010 B1 WITH(NOLOCK)
	ON ZNH_COD = B1_COD AND B1.D_E_L_E_T_= ''
--CONDIÇÕES
WHERE ZH.D_E_L_E_T_ = '' AND ZNH_PEDIDO <> '' AND ZNH_ITEMPC <> '' AND CONVERT(DATE, ZNF_DTEMIS, 103) > GETDATE() - 180
),

AGGR AS
(
SELECT
	[Filial]
	,[Armazem]
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
	,[Sts RM]
	,[Sts Entrada]
	,[Sts Envio]
	,[Centro Custo]
	,[Desc CR]
	,[Loja]
	,[Cod Forn]
	,[Nm Solic]
	,[Dt Emissao]
	,[Dt Digit]
	,[Dt Emi Fluig]
	,[Dt Int Fluig]
	,[Dt Envio WMS]
	,[CR SC]
	,[Sit NF]
	,[Obs SC]
	,[Usr Conferencia]
	,[Tkt Fiscal]
	,[Msg Tkt]
	,[Bipe NF]
	,[Bipe Usr]
	,[Obs Fiscal]
	,[Verif SC]
	,SUM([Qtd Pre Nota]) AS [Qtd Pre Nota]
	,[Vlr Unit Pre Nota]
	,[Qtd Solic]
	,[Qtd Separado]
	,[Qtd Separ WMS]
	,[Qtd Estoq]
	,[Dt Ult Saida Estoque]
FROM CONS
--GRUPAMENTO
GROUP BY
	[Filial]
	,[Armazem]
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
	,[Sts RM]
	,[Sts Entrada]
	,[Sts Envio]
	,[Centro Custo]
	,[Desc CR]
	,[Loja]
	,[Cod Forn]
	,[Nm Solic]
	,[Dt Emissao]
	,[Dt Digit]
	,[Dt Emi Fluig]
	,[Dt Int Fluig]
	,[Dt Envio WMS]
	,[CR SC]
	,[Sit NF]
	,[Obs SC]
	,[Usr Conferencia]
	,[Tkt Fiscal]
	,[Msg Tkt]
	,[Bipe NF]
	,[Bipe Usr]
	,[Obs Fiscal]
	,[Verif SC]
	,[Vlr Unit Pre Nota]
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
/****** Object:  View [sup].[vw_rel_separacao]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [sup].[vw_rel_separacao]

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
ON (C7_FORNECE + C7_LOJA) = (A2_COD + A2_LOJA) AND A2.D_E_L_E_T_ = ''
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
/****** Object:  Table [sup].[tb_dim_prazoPedidoCompra]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sup].[tb_dim_prazoPedidoCompra](
	[dt_competencia] [date] NULL,
	[nr_ano] [int] NULL,
	[nr_mes] [int] NULL,
	[cd_produto] [varchar](15) NULL,
	[tp_atendimento] [varchar](1) NULL,
	[nr_diasCalculado] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_agenda]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_agenda]

as


if DATEPART(HOUR,getdate()) >=0 and DATEPART(HOUR,getdate())<=5

exec bi_rip_refinedZone.[dbo].[sp_dim_prazoEntregaCompra]
exec bi_rip_refinedZone.[dbo].[sp_dim_prazoPedidoCompra]
exec bi_rip_refinedZone.[dbo].[sp_dim_prazoTransporte]


GO
/****** Object:  StoredProcedure [dbo].[sp_dim_prazoEntregaCompra]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_dim_prazoEntregaCompra]

as

delete from bi_rip_refinedZone.sup.tb_dim_prazoEntregaCompra
where dt_competencia = DATEADD(month,DATEDIFF(month,0,getdate()),0)

insert into bi_rip_refinedZone.sup.tb_dim_prazoEntregaCompra
select 
	DATEADD(month,DATEDIFF(month,0,getdate()),0) as dt_competencia
	,year(getdate()) as nr_ano
	,month(getdate()) nr_mes
	,*
from bi_rip_refinedZone.sup.vw_dim_prazoEntregaCompra







GO
/****** Object:  StoredProcedure [dbo].[sp_dim_prazoPedidoCompra]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_dim_prazoPedidoCompra]

as

delete from bi_rip_refinedZone.sup.tb_dim_prazoPedidoCompra
where dt_competencia = DATEADD(month,DATEDIFF(month,0,getdate()),0)

insert into sup.tb_dim_prazoPedidoCompra
select
	DATEADD(month,DATEDIFF(month,0,getdate()),0) as dt_competencia
	,year(getdate()) as nr_ano
	,month(getdate()) nr_mes
	,*
from bi_rip_refinedZone.sup.vw_dim_prazoPedidoCompra


GO
/****** Object:  StoredProcedure [dbo].[sp_dim_prazoTransporte]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[sp_dim_prazoTransporte]

as

delete from bi_rip_refinedZone.sup.tb_dim_prazoTransporte
where dt_competencia = DATEADD(month,DATEDIFF(month,0,getdate()),0)

insert into bi_rip_refinedZone.sup.tb_dim_prazoTransporte
select
	DATEADD(month,DATEDIFF(month,0,getdate()),0) as dt_competencia
	,year(getdate()) as nr_ano
	,month(getdate()) nr_mes
	,*
from bi_rip_refinedZone.sup.vw_dim_prazoTransporte

GO
/****** Object:  StoredProcedure [dbo].[sp_retornaDtAlteraHoraExtra]    Script Date: 24/01/2024 14:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_retornaDtAlteraHoraExtra]
AS
SELECT TOP 1 dt_alteracao FROM dpp.vw_fat_horaextra ORDER BY dt_alteracao DESC;
GO
