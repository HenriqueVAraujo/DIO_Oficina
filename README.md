# Sistema de Controle e Gerenciamento de Ordens de Serviço (Oficina)

Este repositório contém o projeto lógico de banco de dados para um sistema de gestão de oficinas mecânicas. O foco da implementação é o controle rigoroso da execução de Ordens de Serviço (OS), gestão de custos (peças e serviços) e alocação de equipes técnicas.

## Definição do Escopo e Regras de Negócio

A modelagem foi desenvolvida para suportar o fluxo operacional completo de uma oficina:
- **Fluxo de Atendimento**: Um cliente vincula seus veículos ao sistema; cada entrada gera uma análise técnica por uma equipe especializada.
- **Ordem de Serviço (OS)**: Centraliza o status da manutenção, datas de emissão/entrega e o cálculo financeiro final.
- **Composição de Custos**: O valor da OS é derivado da soma dos serviços (mão de obra baseada em tabela de referência) e das peças substituídas.
- **Especialização**: Mecânicos são organizados em equipes para otimizar o atendimento de acordo com a especialidade técnica requisitada.

## Arquitetura de Dados

O esquema lógico foi projetado visando a integridade referencial e a normalização de dados (3ª Forma Normal). Os artefatos técnicos incluídos são:

- **Esquema Relacional**: Diagrama detalhando chaves primárias (PK), chaves estrangeiras (FK) e cardinalidades.
- **Scripts DDL**: Criação de tabelas com constrangimentos (Constraints) adequados.
- **Scripts DML**: Persistência de dados para validação de cenários de teste.
- **Consultas Analíticas**: Queries complexas para extração de métricas de desempenho da oficina.

## Tecnologias Utilizadas
- **Banco de Dados**: MySQL / MariaDB
- **Modelagem**: dbdiagram.io / MySQL Workbench
- **Linguagem**: SQL (ANSI)
