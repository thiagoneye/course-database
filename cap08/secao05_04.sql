CREATE TABLE tipos(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(60) NOT NULL
);

CREATE TABLE fabricantes(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(60) NOT NULL
);

CREATE TABLE produtos(
	id SERIAL PRIMARY KEY, 
	nome VARCHAR(60) NOT NULL,
	id_fabricante INT REFERENCES fabricantes(id) NOT NULL,
	quantidade INT NOT NULL,
	id_tipo INT REFERENCES tipos(id) NOT NULL
);

INSERT INTO tipos (nome)
	VALUES ('Console'), ('Notebook'), ('Celular'), ('Smartphone'),
		('Sofá'), ('Armário'), ('Refrigerador');

INSERT INTO fabricantes (nome)
	VALUES ('Sony'), ('Dell'), ('Microsoft'), ('Samsung'), ('Apple'),
		('Beline'), ('Magno'), ('CCE'), ('Nintendo');

INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo)
	VALUES ('Playstation 3', 1, 100, 1), ('Core 2 Duo 4GB RAM 500GB HD', 2, 200, 2),
		('Xbox 360 120GB', 3, 350, 1), ('GT-I6220 Quad band', 4, 300, 3),
		('iPhone 4 32GB', 5, 50, 4), ('Playstation 2', 1, 100, 1), ('Sofá Estofado', 6, 200, 5),
		('Armário de Serviço', 7, 50, 6), ('Refrigerador 420L', 8, 200, 7),
		('Wii 120GB', 8, 250, 1);

SELECT t.nome AS "Tipo de Produto", f.nome AS "Fabricante",
	SUM(p.quantidade) AS "Quantidade em Estoque"
		FROM tipos AS t, fabricantes AS f, produtos AS p
		WHERE t.id = p.id_tipo AND f.id = p.id_fabricante
		GROUP BY t.nome, f.nome;

SELECT t.nome AS "Tipo de Produto", f.nome AS "Fabricante",
	SUM(p.quantidade) AS "Quantidade em Estoque"
		FROM tipos AS t, fabricantes AS f, produtos AS p
		WHERE t.id = p.id_tipo AND f.id = p.id_fabricante
		GROUP BY t.nome, f.nome
		HAVING SUM(p.quantidade) > 200;

SELECT * FROM produtos ORDER BY id DESC LIMIT 3;