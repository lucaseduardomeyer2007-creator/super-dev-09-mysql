-- Criar o banco
CREATE DATABASE RESTAU_CALABREZA;

-- DEFINIR QUAL O BANCO DE DADOS QUE UTILIZAREMOS
USE RESTAU_CALABREZA;

-- CRIAR TABELA
CREATE TABLE funcionarios(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50)
);

--PARA MOSTRAR AS TABELAS
SHOW TABLES;

-- VISUALIZAR A TABELA COMO ELA É
DESCRIBE funcionarios;

--CADASTRAR UM REGISTRO
-- INSERT INTO <nome-tabela> (<colunas>) VALUE (<valores>)
INSERT INTO funcionarios (nome) VALUE ("Justin bieber");

--CONSULTAR OS REGISTROS(LINHAS) 
--SELECT <colunas> FROM <tabela>; 
SELECT id, nome FROM funcionarios

--ADICIONAR UMA COLUNA EM UM ATABELA EXISTENTE
--ALTER TABLE <nome_tabela> ADD COLUMN <nome_coluna>  <tipo_coluna>
ALTER TABLE funcionarios ADD COLUMN cargo VARCHAR(30);

--CONSULTAR OS REGISTROS
SELECT id, nome, cargo FROM funcionarios;

--ADICIONAR OUTRA COLUNA
ALTER TABLE funcionarios ADD COLUMN data_nascimento DATE

--Atualizar dados de um regidtro
UPDATE funcionarios SET cargo = "Garçom" WHERE id = 1;

-- ATUALIZAR MAIS DE UMA COLUNA POR VEZ
UPDATE funcionarios SET 
    data_nascimento = "1998-01-09",
    salario = 2500.20
    WHERE id = 1;

INSERT INTO funcionarios (nome, cargo, data_nascimento, salario)
    VALUE ("Elias da silva", "Caixa", "2000-07-12", 1996.50);
INSERT INTO funcionarios (nome, cargo, data_nascimento, salario)
    VALUE ("Victor sem C", "Manobrista", "2012-09-29", 300.00);
INSERT INTO funcionarios (nome, cargo, data_nascimento, salario)
    VALUE ("Peter Souza", "Cozinheiro", 1995-02-28, 6795.30):