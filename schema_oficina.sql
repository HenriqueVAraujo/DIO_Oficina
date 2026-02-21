CREATE DATABASE IF NOT EXISTS oficina_mecanica;
USE oficina_mecanica;

-- Definição das Entidades Base
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(150) NOT NULL,
    Identificacao CHAR(11) UNIQUE NOT NULL,
    Endereco VARCHAR(255)
);

CREATE TABLE Veiculo (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    Placa CHAR(7) UNIQUE NOT NULL,
    Modelo VARCHAR(45),
    Marca VARCHAR(45),
    idCliente INT,
    CONSTRAINT fk_veiculo_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Equipe (
    idEquipe INT AUTO_INCREMENT PRIMARY KEY,
    NomeEquipe VARCHAR(45) NOT NULL
);

CREATE TABLE Mecanico (
    idMecanico INT AUTO_INCREMENT PRIMARY KEY,
    Codigo VARCHAR(10) UNIQUE NOT NULL,
    Nome VARCHAR(150) NOT NULL,
    Especialidade VARCHAR(45),
    idEquipe INT,
    CONSTRAINT fk_mecanico_equipe FOREIGN KEY (idEquipe) REFERENCES Equipe(idEquipe)
);

-- Definição da Ordem de Serviço (OS)
CREATE TABLE OrdemServico (
    idOS INT AUTO_INCREMENT PRIMARY KEY,
    Numero VARCHAR(20) UNIQUE NOT NULL,
    DataEmissao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataConclusao DATE,
    ValorTotal DECIMAL(10,2) DEFAULT 0,
    StatusOS ENUM('Análise', 'Aguardando Aprovação', 'Em Execução', 'Concluída', 'Cancelada') DEFAULT 'Análise',
    idVeiculo INT,
    idEquipe INT,
    CONSTRAINT fk_os_veiculo FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo),
    CONSTRAINT fk_os_equipe FOREIGN KEY (idEquipe) REFERENCES Equipe(idEquipe)
);

-- Tabelas de Referência de Custos
CREATE TABLE TabelaServico (
    idServico INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(255) NOT NULL,
    ValorMaoDeObra DECIMAL(10,2) NOT NULL
);

CREATE TABLE Peca (
    idPeca INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(100) NOT NULL,
    ValorUnitario DECIMAL(10,2) NOT NULL
);

-- Itens da Ordem de Serviço
CREATE TABLE OS_Servicos (
    idOS INT,
    idServico INT,
    Quantidade INT DEFAULT 1,
    PRIMARY KEY (idOS, idServico),
    CONSTRAINT fk_os_servico_os FOREIGN KEY (idOS) REFERENCES OrdemServico(idOS),
    CONSTRAINT fk_os_servico_tab FOREIGN KEY (idServico) REFERENCES TabelaServico(idServico)
);

CREATE TABLE OS_Pecas (
    idOS INT,
    idPeca INT,
    Quantidade INT NOT NULL,
    PRIMARY KEY (idOS, idPeca),
    CONSTRAINT fk_os_peca_os FOREIGN KEY (idOS) REFERENCES OrdemServico(idOS),
    CONSTRAINT fk_os_peca_tab FOREIGN KEY (idPeca) REFERENCES Peca(idPeca)
);
