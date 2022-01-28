-- CREATE

CREATE TABLE tipos_produto (
	id SERIAL PRIMARY KEY,
	descricao CHARACTER VARYING (50) NOT NULL
);

CREATE TABLE produtos (
	id SERIAL PRIMARY KEY,
	descricao CHARACTER VARYING (50) NOT NULL,
	preco NUMERIC NOT NULL,
	id_tipo_produto INT NOT NULL,
	FOREIGN KEY (id_tipo_produto) REFERENCES tipos_produto (id)
);

CREATE TABLE pacientes (
	id SERIAL PRIMARY KEY,
	nome CHARACTER VARYING (50) NOT NULL,
	endereco CHARACTER VARYING (50) NOT NULL,
	bairro CHARACTER VARYING (50) NOT NULL,
	cidade CHARACTER VARYING (50) NOT NULL,
	estado CHAR(2) NOT NULL,
	cep CHARACTER VARYING (10) NOT NULL,
	data_nascimento DATE NOT NULL
);

-- INSERTS

-- Tipos produtos
INSERT INTO tipos_produto (descricao)
	VALUES ('Computadores'), ('Impressoras'), ('Diversos');

-- INSERT INTO tipos_produto (descricao)
--	VALUES ('Outros');
-- UPDATE tipos_produto set descricao = 'Nobreak' WHERE descricao = 'Outros';

-- Produtos
INSERT INTO produtos (descricao, preco, id_tipo_produto)
	VALUES ('Notebook Dell', '2300.00', 1), ('Impressora Jato de Tinta', '450.00', 2),
		('Mouse sem fio', '45', 3);

-- Pacientes
INSERT INTO pacientes (nome, endereco, bairro, cidade, estado, cep, data_nascimento)
	VALUES ('Angelina Jolie', 'Rua da Paz, 44', 'Nova Lima', 'Santos', 'SP', '55.986-374', '1978-04-24');

-- SELECT

SELECT * FROM tipos_produto;
SELECT * FROM produtos;
SELECT * FROM pacientes;
