-- 1. Recuperação do Histórico de Manutenção por Cliente (Joins Complexos e Order By)
-- Pergunta: Quais serviços foram realizados, em quais veículos e quem foi o cliente?
SELECT 
    c.Nome AS Cliente, 
    v.Placa, 
    v.Modelo, 
    os.Numero AS OS_Numero, 
    os.DataEmissao
FROM Cliente c
INNER JOIN Veiculo v ON c.idCliente = v.idCliente
INNER JOIN OrdemServico os ON v.idVeiculo = os.idVeiculo
ORDER BY os.DataEmissao DESC;

-- 2. Cálculo de Faturamento de Mão de Obra por Equipe (Atributo Derivado e Group By)
-- Pergunta: Qual o valor total gerado em mão de obra por cada equipe técnica?
SELECT 
    e.NomeEquipe, 
    COUNT(os.idOS) AS Qtd_Servicos,
    SUM(ts.ValorMaoDeObra * oss.Quantidade) AS Total_Mao_Obra
FROM Equipe e
JOIN OrdemServico os ON e.idEquipe = os.idEquipe
JOIN OS_Servicos oss ON os.idOS = oss.idOS
JOIN TabelaServico ts ON oss.idServico = ts.idServico
GROUP BY e.NomeEquipe;

-- 3. Identificação de Equipes com Alta Demanda (Having Statement)
-- Pergunta: Quais equipes possuem mais de 5 ordens de serviço concluídas?
SELECT 
    e.NomeEquipe, 
    COUNT(os.idOS) AS Total_Concluidas
FROM Equipe e
JOIN OrdemServico os ON e.idEquipe = os.idEquipe
WHERE os.StatusOS = 'Concluída'
GROUP BY e.NomeEquipe
HAVING Total_Concluidas > 5;

-- 4. Levantamento de Custo Médio de Peças por Tipo de Veículo (Where e Filtros)
-- Pergunta: Qual o custo médio de peças para veículos de uma marca específica?
SELECT 
    v.Marca, 
    AVG(p.ValorUnitario * osp.Quantidade) AS Media_Custo_Pecas
FROM Veiculo v
JOIN OrdemServico os ON v.idVeiculo = os.idVeiculo
JOIN OS_Pecas osp ON os.idOS = osp.idOS
JOIN Peca p ON osp.idPeca = p.idPeca
WHERE v.Marca = 'Toyota'
GROUP BY v.Marca;
