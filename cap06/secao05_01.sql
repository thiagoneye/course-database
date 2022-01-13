CREATE DATABASE secao05;

USE secao05;

CREATE TABLE tipos_produto (
	id INT NOT NULL AUTO_INCREMENT,
	descricao VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE produtos (
	id INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(50) NOT NULL,
    preco DECIMAL(8,2) NOT NULL,
    id_tipo INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_tipo) REFERENCES tipos_produto (id)
);

INSERT INTO tipos_produto (descricao) VALUES ('computador');
INSERT INTO tipos_produto (descricao) VALUES ('impressora');

INSERT INTO produtos (descricao, preco, id_tipo) VALUES ('desktop', '1200', 1);
INSERT INTO produtos (descricao, preco, id_tipo) VALUES ('laptop', '1800', 1);
INSERT INTO produtos (descricao, preco, id_tipo) VALUES ('impressora jato de tinta', '300', 2);
INSERT INTO produtos (descricao, preco, id_tipo) VALUES ('impressora laser', '500', 2);

SELECT * FROM tipos_produto;
SELECT * FROM produtos;

SELECT * FROM produtos WHERE id_tipo = 2;
SELECT count(id) AS amount FROM produtos WHERE id_tipo = 2;
SELECT SUM(preco) AS total_2 FROM produtos WHERE id_tipo = 2;
SELECT * FROM produtos WHERE id_tipo = 2 AND preco > 400;

SELECT produtos.id, produtos.descricao, produtos.preco, tipos_produto.descricao AS tipo
	FROM produtos
	INNER JOIN tipos_produto
	ON produtos.id_tipo = tipos_produto.id;