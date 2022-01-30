/*
CREATE TABLE categorias(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(60) NOT NULL
);

CREATE TABLE produtos(
	id SERIAL PRIMARY KEY, 
	descricao VARCHAR(60) NOT NULL,
	preco_venda DECIMAL(8,2) NOT NULL,
	preco_custo MONEY NOT NULL,
	id_categoria INT REFERENCES categorias(id) NOT NULL
);

INSERT INTO categorias (nome)
	VALUES ('Material Escolar'), ('Acessório Informática'), ('Material Escritório'), ('Game');

INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria)
	VALUES ('Caderno', 5.45, 2.30, 1), ('Caneta', 1.20, 0.45, 1),
		('Pendrive 32GB', 120.54, 32.55, 2), ('Mouse', 17.00, 4.30, 2);
*/

SELECT * FROM produtos;

SELECT MAX(preco_venda) FROM produtos;

SELECT MIN(preco_venda) FROM produtos;

SELECT ROUND(AVG(preco_custo::NUMERIC), 2) FROM produtos;

SELECT ROUND(AVG(preco_venda), 2) FROM produtos;

SELECT COUNT(id) FROM produtos
	WHERE id_categoria = 1;

SELECT id_categoria, MAX(preco_venda)
	FROM produtos
	GROUP BY id_categoria;
