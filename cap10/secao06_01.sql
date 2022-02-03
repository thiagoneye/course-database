CREATE TABLE categorias(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	nome TEXT NOT NULL
);

CREATE TABLE produtos(
	id INTEGER PRIMARY KEY AUTOINCREMENT, 
	descricao TEXT NOT NULL,
	preco_venda REAL NOT NULL,
	preco_custo REAL NOT NULL,
	id_categoria INTEGER REFERENCES categorias(id) NOT NULL
);

INSERT INTO categorias (nome)
	VALUES ('Material Escolar'), ('Acessório Informática'), ('Material Escritório'), ('Game');

INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria)
	VALUES ('Caderno', 5.45, 2.3, 1), ('Caneta', 1.20, 0.45, 1),
		('Pendrive 32GB', 120.54, 32.55, 2), ('Mouse', 17.00, 4.30, 2);
