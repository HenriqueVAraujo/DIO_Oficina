# DIO_Oficina
Sistema de Gerenciamento de Ordens de Serviço - Oficina Mecânica
Este repositório contém a modelagem conceitual de um sistema de controle e execução de Ordens de Serviço (OS) para uma oficina mecânica, desenvolvido como desafio de projeto para fortalecimento de portfólio em arquitetura de dados.

Escopo do Projeto
A solução foi projetada para cobrir todo o ciclo de vida do atendimento em uma oficina, desde a entrada do veículo até a execução final dos serviços.

Componentes Principais:
Gestão de Clientes e Veículos: Relacionamento 1:N garantindo que um cliente possa possuir diversos veículos cadastrados.

Equipes de Trabalho: Agrupamento de mecânicos por equipes para otimização da divisão de tarefas e especialidades.

Ordem de Serviço (OS): Documento centralizador que armazena datas de emissão, previsão de entrega, status de autorização e o valor total calculado.

Composição de Custos: Separação clara entre Mão-de-obra (tabela de referência de serviços) e Peças, permitindo que o valor total da OS seja a somatória exata de todos os itens e horas técnicas aplicadas.

Decisões Técnicas
Normalização: Os serviços e peças foram isolados em tabelas de referência para evitar redundância e facilitar a atualização de preços.

Tabelas Associativas: Utilizadas (OS_Servico e OS_Peca) para suportar a relação N:M entre a Ordem de Serviço e os itens consumidos nela.

Status de Fluxo: O campo status na OS permite o controle de workflow (Aguardando autorização, Em execução, Concluído).

Documentação Técnica
A modelagem detalhada pode ser consultada no arquivo técnico anexado:

Modelo_Conceitual_Oficina.pdf: Contém o diagrama de Entidade-Relacionamento (ER) com todos os atributos e cardinalidades.

Ferramentas Utilizadas
Modelagem: dbdiagram.io

Notação: DBML / Relacional
