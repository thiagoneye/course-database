CREATE TABLE profissoes(
	id SERIAL PRIMARY KEY,
	cargo VARCHAR(60) NOT NULL
);

CREATE TABLE clientes(
	id SERIAL PRIMARY KEY, 
	nome VARCHAR(60) NOT NULL,
	data_nascimento DATE NOT NULL,
	telefone VARCHAR(10) NOT NULL,
	id_profissao INT  REFERENCES profissoes(id) NOT NULL
);

CREATE TABLE consumidor(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    contato VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    cep VARCHAR(20) NOT NULL,
    pais VARCHAR(50) NOT NULL
);

INSERT INTO profissoes (cargo) VALUES ('Programador');
INSERT INTO profissoes (cargo) VALUES ('Analista de Sistemas');
INSERT INTO profissoes (cargo) VALUES ('Suporte');
INSERT INTO profissoes (cargo) VALUES ('Gerente');

INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('João Pereira', '1981-06-15', '1234-5688', 1);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('Ricardo da Silva', '1973-10-10', '2234-5669', 2);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('Felipe Oliveira', '1987-08-01', '4234-5640', 3);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('Mário Pirez', '1991-02-05', '5234-5621', 1);

INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ('Alfredo Nunes', 'Maria Nunes', 'Rua da paz, 47', 'São Paulo', '123.456-87', 'Brasil');
INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ('Ana Trujillo', 'Guilherme Souza', 'Rua Dourada, 452', 'Goiânia', '232.984-23', 'Brasil');
INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ('Leandro Veloz', 'Pedro Siqueira', 'Rua Vazia, 72', 'São Paulo', '936.738-23', 'Brasil');

SELECT * FROM profissoes;
SELECT * FROM clientes;
SELECT * FROM consumidor;

-- Produto Cartesiano

SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
	FROM clientes AS c, profissoes AS p
	WHERE c.id_profissao = p.id;

-- Junção Inner Join

SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
	FROM clientes AS c
	INNER JOIN profissoes AS p
		ON c.id_profissao = p.id;

-- Junção Left Outer Join

SELECT * FROM clientes AS c
	LEFT OUTER JOIN profissoes AS p
		ON c.id_profissao = p.id;

-- Junção Right Outer Join

SELECT * FROM clientes AS c
	RIGHT OUTER JOIN profissoes AS p
		ON c.id_profissao = p.id;

-- Junção Full Outer Join

SELECT * FROM clientes AS c
	FULL OUTER JOIN profissoes AS p
		ON c.id_profissao = p.id;

-- Junção Cross Join

SELECT * FROM clientes AS c
	CROSS JOIN profissoes AS p;

-- Junção Self Join

SELECT a.nome AS "Consumidor 1", b.nome AS "Consumidor 2", a.cidade AS "Cidade"
	FROM consumidor AS a
	INNER JOIN consumidor AS b
		ON a.id <> b.id
			AND a.cidade = b.cidade
	ORDER BY a.cidade;
