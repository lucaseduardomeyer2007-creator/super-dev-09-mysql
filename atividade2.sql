CREATE DATABASE pet_shop;

USE pet_shop;

CREATE TABLE clientes(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40),
observacao VARCHAR(30)
);

INSERT INTO clientes(nome, observacao) VALUE("Lucas", "Cliente vip");
INSERT INTO clientes(nome, observacao) VALUE("Elias", "Cliente novo");
INSERT INTO clientes(nome, observacao) VALUE("Erick", "Cliente frequente");
INSERT INTO clientes(nome, observacao) VALUE("Batman", "Cliente premium");

SELECT nome, observacao FROM clientes;


ALTER TABLE clientes ADD COLUMN sobrenome VARCHAR(30);

UPDATE clientes SET sobrenome = "Eduardo" WHERE id = 1;
UPDATE clientes SET sobrenome = "Monstrão" WHERE id = 2;
UPDATE clientes SET sobrenome = "Turbo" WHERE id = 3;
UPDATE clientes SET sobrenome = "Coringadas" WHERE id = 4;

ALTER TABLE clientes ADD COLUMN telefone VARCHAR(10);

UPDATE clientes SET telefone = "9727179267" WHERE id = 1;
UPDATE clientes SET telefone = "8127100480" WHERE id = 2;
UPDATE clientes SET telefone = "1923564149" WHERE id = 3;
UPDATE clientes SET telefone = "2233126628" WHERE id = 4;

SELECT nome, observacao, sobrenome, telefone FROM clientes;


CREATE TABLE especies(

id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40)
);


INSERT INTO especies(nome) VALUE("Gato");
INSERT INTO especies(nome) VALUE("Cachorro");
INSERT INTO especies(nome) VALUE("Coelho");
INSERT INTO especies(nome) VALUE("Ave");

SELECT nome FROM especies;


CREATE TABLE racas(
    id INT PRIMARY KEY AUTO_INCREMENT,
        
    id_especie INT NOT NULL,
    nome VARCHAR(30),
    FOREIGN KEY(id_especie) REFERENCES especies(id)
);

INSERT INTO racas(nome, id_especie) VALUE("Persa", 1);
INSERT INTO racas(nome, id_especie) VALUE("Labrador", 2);
INSERT INTO racas(nome, id_especie) VALUE("Mini Coelho", 3);
INSERT INTO racas(nome, id_especie) VALUE("Calopsita", 4);


SELECT 
racas.nome,
racas.id_especie,
especies.nome
FROM racas
INNER JOIN especies ON (racas.id_especie = especies.id);

SELECT racas.nome, racas.id_especie FROM racas;


CREATE TABLE pets(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(30),
data_nascimento DATE,
id_cliente INT NOT NULL,
id_raca INT NOT NULL,

FOREIGN KEY(id_cliente) REFERENCES clientes(id),
FOREIGN KEY(id_raca) REFERENCES racas(id)
);

INSERT INTO pets(nome, data_nascimento, id_cliente, id_raca) VALUE("Gato","2011-08-01", 1, 1);
INSERT INTO pets(nome, data_nascimento, id_cliente, id_raca) VALUE("Cachorro","2020-03-22", 2, 2);
INSERT INTO pets(nome, data_nascimento, id_cliente, id_raca) VALUE("Coelho", "2015-09-13", 3, 3);
INSERT INTO pets(nome, data_nascimento, id_cliente, id_raca) VALUE("Ave", "2024-12-25", 4, 4);


ALTER TABLE pets ADD COLUMN sexo VARCHAR(2);
ALTER TABLE pets ADD COLUMN peso VARCHAR(10);

UPDATE pets SET sexo = "f" WHERE id = 1;
UPDATE pets SET sexo = "m" WHERE id = 3;
UPDATE pets SET sexo = "f" WHERE id = 4;

UPDATE pets SET peso = "2kg" WHERE id = 1;
UPDATE pets SET peso = "1kg" WHERE id = 3;
UPDATE pets SET peso = "500g" WHERE id = 4;

SELECT
    pets.nome,
    pets.data_nascimento,
    pets.id_cliente,
    pets.id_raca,
    pets.sexo,
    pets.peso,
    especies.nome
FROM pets
INNER JOIN clientes ON (pets.id_cliente = clientes.id)
INNER JOIN racas ON (pets.id_raca = racas.id)
INNER JOIN especies ON(racas.id_especie = especies.id);

-- Tabela de pets
SELECT
    id,
    nome,
    data_nascimento,
    id_cliente,
    id_raca,
    sexo,
    peso
FROM pets;

--Tabela de pets e raças
SELECT
    pets.id,
    pets.nome,
    pets.data_nascimento,
    pets.sexo,
    pets.peso,
    racas.id AS id_raca,
    racas.nome AS nome_raca
FROM pets
INNER JOIN racas ON(pets.id_raca = racas.id);


--Tabela de pets e espécies
SELECT
    pets.id,
    pets.nome,
    pets.data_nascimento,
    pets.sexo,
    pets.peso,
    especies.id AS id_especie,
    especies.nome AS nome_especie
FROM pets
INNER JOIN racas ON(pets.id_raca = racas.id)
INNER JOIN especies ON(racas.id_especie = especies.id);

--Tabela de Clientes
SELECT
    pets.id,
    pets.nome,
    pets.data_nascimento,
    pets.sexo,
    pets.peso,
    clientes.id AS id_cliente,
    clientes.nome AS nome_cliente
FROM pets
INNER JOIN clientes ON (pets.id_cliente = clientes.id);


--Tabela que abrange todas as 4 tables
SELECT
    pets.id,
    pets.nome,
    pets.data_nascimento,
    pets.sexo,
    pets.peso,
    clientes.id AS id_cliente,
    clientes.nome AS nome_cliente,
    racas.id AS id_raca,
    racas.nome AS nome_raca,
    especies.id AS id_especie,
    especies.nome AS nome_especie
FROM pets
INNER JOIN clientes ON (p.id_cliente = clientes.id)
INNER JOIN racas ON (p.id_raca = racas.id)
INNER JOIN especies ON (racas.id_especie = especies.id);


--Tabela de qual pet não tem peso nem sexo nenhum
SELECT
    pets.id,
    pets.nome,
    pets.data_nascimento,
    pets.sexo,
    pets.peso
FROM pets
WHERE pets.peso IS NULL;





