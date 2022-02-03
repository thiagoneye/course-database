-- DDL

CREATE TABLE profissoes (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	cargo TEXT NOT NULL
);

-- O SQLite não possui formato DATE

CREATE TABLE clientes (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	nome TEXT NOT NULL,
	data_nascimento TEXT NOT NULL,
	telefone TEXT NOT NULL,
	id_profissao INTEGER REFERENCES profissoes (id) NOT NULL
);

CREATE TABLE consumidor (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	nome TEXT NOT NULL,
	contato TEXT NOT NULL,
	endereco TEXT NOT NULL,
	cidade TEXT NOT NULL,
	cep TEXT NOT NULL,
	pais TEXT NOT NULL
);

-- DDL

INSERT INTO profissoes (cargo)
	VALUES ('Programador'), ('Analista de Sistemas'), ('Suporte'), ('Gerente');

INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao)
	VALUES ('João Pereira', '1981-06-15', '1234-5688', 1),
		('Ricardo da Silva', '1973-10-10', '2234-5669', 2),
		('Felipe Oliveira', '1987-08-01', '4234-5640', 3),
		('Mário Pirez', '1991-02-05', '5234-5621', 1);

INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais)
	VALUES ('Alfredo Nunes', 'Maria Nunes', 'Rua da Paz, 47', 'São Paulo', '123.456-87', 'Brasil'),
		('Ana Trujillo', 'Guilherme Souza', 'Rua Dourada, 452', 'Goiânia', '232.984-23', 'Brasil');
