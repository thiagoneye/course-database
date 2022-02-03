CREATE TABLE tipos(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	nome TEXT NOT NULL
);

CREATE TABLE fabricantes(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	nome TEXT NOT NULL
);

CREATE TABLE produtos(
	id INTEGER PRIMARY KEY AUTOINCREMENT, 
	nome TEXT NOT NULL,
	id_fabricante INTEGER REFERENCES fabricantes(id) NOT NULL,
	quantidade INTEGER NOT NULL,
	id_tipo INTEGER REFERENCES tipos(id) NOT NULL
);

INSERT INTO tipos (nome)
	VALUES ('Console'), ('Notebook'), ('Celular'), ('Smartphone'), ('Sofá'), ('Armário'), ('Refrigerador');

INSERT INTO fabricantes (nome)
	VALUES ('Sony'), ('Dell'), ('Microsoft'), ('Samsung'), ('Apple'),
		('Beline'), ('Magno'), ('CCE'), ('Nintendo');

INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo)
	VALUES ('Playstation 3', 1, 100, 1), ('Core 2 Duo 4GB RAM 500GB HD', 2, 200, 2),
		('Xbox 360 120GB', 3, 350, 1), ('GT-I6220 Quad band', 4, 300, 3),
		('iPhone 4 32GB', 5, 50, 4), ('Playstation 2', 1, 100, 1),
		('Sofá Estofado', 6, 200, 5), ('Armário de Serviço', 7, 50, 6),
		('Refrigerador 420L', 8, 200, 7), ('Wii 120GB', 8, 250, 1);
