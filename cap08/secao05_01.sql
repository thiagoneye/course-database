CREATE TABLE tipos_produto (
	codigo SERIAL PRIMARY KEY,
	descricao VARCHAR(50) NOT NULL
);

CREATE TABLE produtos (
	codigo SERIAL PRIMARY KEY,
	descricao VARCHAR(50) NOT NULL,
	preco MONEY NOT NULL,
	codigo_tipo INT REFERENCES tipos_produto (codigo) NOT NULL
);

INSERT INTO tipos_produto (descricao) VALUES ('Computador'), ('Impressora');
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Desktop', '1200', 1), ('Laptop', '1800', 1), ('Impressora Laser', '500', 2), ('Impressora Jato de Tinta', '300', 2);

SELECT * FROM tipos_produto;
SELECT * FROM produtos;

SELECT * FROM produtos WHERE codigo_tipo = 2;
SELECT * FROM produtos WHERE preco <= '500';

SELECT produtos.codigo AS "Código"
	FROM produtos;