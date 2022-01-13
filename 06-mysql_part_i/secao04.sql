# DDL

CREATE DATABASE secao04;

USE secao04;

CREATE TABLE tipos_produto (
codigo INT NOT NULL AUTO_INCREMENT,
descricao VARCHAR(50) NOT NULL,
PRIMARY KEY (codigo)
);

CREATE TABLE produtos (
codigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
descricao VARCHAR(50) NOT NULL,
preco DECIMAL(8,2),
codigo_tipo INT NOT NULL,
FOREIGN KEY (codigo_tipo) REFERENCES tipos_produto (codigo)
);

DROP TABLE produtos;

CREATE TABLE produtos (
codigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
descricao VARCHAR(50) NOT NULL,
preco DECIMAL(8,2),
codigo_tipo INT NOT NULL,
FOREIGN KEY (codigo_tipo) REFERENCES tipos_produto (codigo)
);

# DML

INSERT INTO tipos_produto (descricao) VALUES ('computadores');
INSERT INTO tipos_produto (descricao) VALUES ('nobreak');
INSERT INTO tipos_produto (descricao) VALUES ('impressoras');
INSERT INTO tipos_produto (descricao) VALUES ('tables');

UPDATE tipos_produto
SET descricao = 'nobreaks'
WHERE codigo = 2;

INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Desktop', '1200', 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Laptop', '1800', 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impressora Jato de Tinta', '300', 3);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impressora Laser', '500', 3);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Notebook', '1200', 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('MacBook Air', '5200', 1);
INSERT INTO produtos VALUES (NULL, 'iPad Pro', '3200', 4);

UPDATE produtos
SET preco = '700'
WHERE codigo = 4;

# DQL

SELECT * FROM tipos_produto;
SELECT * FROM produtos;

SELECT SUM(preco) AS value_total FROM produtos;