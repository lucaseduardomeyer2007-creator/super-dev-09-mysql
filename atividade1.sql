CREATE DATABASE estados;

CREATE TABLE estado(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    sigla VARCHAR(2)
);

INSERT INTO estado(nome, sigla) VALUE("Santa Catarina", "SC");
INSERT INTO estado(nome, sigla) VALUE("Rio de Janeiro", "RJ");

SHOW TABLES;

SELECT id, nome, sigla FROM estado;


CREATE TABLE cidades(
    id INT PRIMARY KEY AUTO_INCREMENT,
    
    id_estado INT NOT NULL,
    nome VARCHAR(30),
    habitantes INT NOT NULL,
    FOREIGN KEY(id_estado) REFERENCES estado(id)

);

INSERT INTO cidades(nome, habitantes, id_estado) VALUE("Blumenau", 385558, 1);
INSERT INTO cidades(nome, habitantes, id_estado) VALUE("São gonçalo", 896744, 2);

SELECT id_estado, nome, habitantes FROM cidades;


CREATE TABLE bairros(
    id INT PRIMARY KEY AUTO_INCREMENT,
    
    id_cidades INT NOT NULL,
    nome VARCHAR(30),
    FOREIGN KEY(id_cidades) REFERENCES cidades(id)

);


INSERT INTO bairros(nome, id_cidades) VALUE("Garcia", 1);
INSERT INTO bairros(nome, id_cidades) VALUE("Zé Garoto", 2);

SELECT nome, id_cidades  FROM bairros;


CREATE TABLE endereco(
    id INT PRIMARY KEY AUTO_INCREMENT,
    
    id_bairros INT NOT NULL, 
    cep INT NOT NULL,
    logradouro VARCHAR(50),
    numero INT NOT NULL,
    complemento VARCHAR(50),
    FOREIGN KEY(id_bairros) REFERENCES bairros(id)

);

INSERT INTO endereco(id_bairros, cep, logradouro, numero, complemento) VALUE(1, 89050620, "Rua Bento Coelho Gomes", 30, "Sem complemento");
INSERT INTO endereco(id_bairros, cep, logradouro, numero, complemento) VALUE(2, 24715493, "Rua Olegário do Nascimento", 57, "Sem complemento");

SELECT id_bairros, cep, logradouro, numero, complemento FROM endereco;