DROP DATABASE IF EXISTS biblioteca;

CREATE DATABASE biblioteca;

USE biblioteca;

-- categoria é nx1, pois a categoria tem vários livros
CREATE TABLE categorias (
    id INT PRIMARY KEY AUTO_INCREMENT, -- chave primária(PK) da tabela de categorias
    nome VARCHAR(50) NOT NULL
);

-- livro é 1xn, pois o livro tem uma categoria
CREATE TABLE livros(
    id INT PRIMARY KEY AUTO_INCREMENT, -- chave primaria (PK)
    nome VARCHAR(100) NOT NULL,
    id_categoria INT NOT NULL,
    -- chave estrangeira (FK): relacionamento com chave primaria (PK) de outra tabela
    FOREIGN KEY(id_categoria) references categorias(id)
);

INSERT INTO categorias (nome) VALUES
("Crítica"), -- 1
("Comédia"), -- 2
("Aventura"); -- 3

SELECT id, nome FROM categorias;
SELECT id, nome, id_categoria FROM livros;

INSERT INTO categorias (nome) VALUES ("Motivação");

INSERT INTO livros (nome, id_categoria) VALUES
("Revolução dos bichos", 1),
("Big brother e a mentira", 1),
("Diário de um banana", 2),
("Monica", 2),
("Percy Jackson 1", 3),
("Hábitos Atômicos", 4);

SELECT id, nome FROM categorias;

SELECT
    livros.id
    livros.nome AS 'Livro',
    categorias.nome AS 'Categoria'
FROM livros
INNER JOIN categorias ON (livros.id_categoria = categorias.id);