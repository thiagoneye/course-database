CREATE TABLE tipos_produtos (
	codigo INTEGER PRIMARY KEY AUTOINCREMENT,
	descricao TEXT NOT NULL
);

CREATE TABLE produtos (
	codigo INTEGER PRIMARY KEY AUTOINCREMENT,
	descricao TEXT NOT NULL,
	preco REAL NOT NULL,
	codigo_tipo INTEGER REFERENCES tipos_produtos (codigo) NOT NULL
);

INSERT INTO tipos_produtos (descricao) VALUES ('Computador'), ('Impressora');

INSERT INTO produtos (descricao, preco, codigo_tipo)
	VALUES ('Desktop', 1200, 1), ('Laptop', 1000, 1),
		('Impressora Jato de Tinta', 300, 2), ('Impressora Laser', 500, 2);
