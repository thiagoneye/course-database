INSERT INTO atores (nome) VALUES ('Brad Pitt'), ('Angelina Jolie'), ('Mark Hamill'), ('Terry Crews');

/*
UPDATE atores SET id = 1 where id = 13;
UPDATE atores SET id = 2 where id = 14;
UPDATE atores SET id = 3 where id = 15;
UPDATE atores SET id = 4 where id = 16;
*/

SELECT * FROM atores;

INSERT INTO generos (nome) VALUES ('Comédia'), ('Ação'), ('Drama');

/*
UPDATE generos SET id = 1 where id = 10;
UPDATE generos SET id = 2 where id = 11;
UPDATE generos SET id = 3 where id = 12;
*/

SELECT * FROM generos;

INSERT INTO filmes (titulo, id_genero)
	VALUES ('Eternos', 2), ('As Branquelas', 1), ('Star Wars', 2), ('Bastardos Inglórios', 2),
		('Era uma vez em ... Hollywood', 3), ('Sr. e Sra. Smith', 2);

/*
UPDATE filmes SET id = 1 where id = 25;
UPDATE filmes SET id = 2 where id = 26;
UPDATE filmes SET id = 3 where id = 27;
UPDATE filmes SET id = 4 where id = 28;
UPDATE filmes SET id = 5 where id = 29;
UPDATE filmes SET id = 6 where id = 30;
*/

SELECT * FROM filmes;

INSERT INTO atores_filmes (id_ator, id_filme, personagem)
	VALUES (2, 1, 'Thena'), (4, 2, 'Latrell Spencer'), (3, 3, 'Luke Skywalker'),
		(1, 4, 'Tenente Aldo Raine'), (1, 5, 'Cliff Booth'), (1, 6, 'John Smith'),
		(2, 6, 'Jane Smith');

SELECT * FROM atores_filmes;

-- Foi considerado que para filmes produzidos após 2008 é necessário uma quantidade de 2 DVDs,
-- por possuíem uma qualidade maior de imagem e, consequentemente, uma maior capacidade de
-- armazenamento.

INSERT INTO dvds (quantidade, valor, id_filme)
	VALUES (2, '5.00', 1), (1, '3.00', 2), (1, '2.00', 3), (2, '4.00', 4),
		(2, '5.00', 5), (1, '3.00', 6);

/*
UPDATE dvds SET id = 1 where id = 7;
UPDATE dvds SET id = 2 where id = 8;
UPDATE dvds SET id = 3 where id = 9;
UPDATE dvds SET id = 4 where id = 10;
UPDATE dvds SET id = 5 where id = 11;
UPDATE dvds SET id = 6 where id = 12;
*/

SELECT * FROM dvds;

INSERT INTO clientes (nome, sobrenome, telefone, endereco)
	VALUES ('Maria', 'José', '9 9367-2384', 'Avenida Epitácio Pessoa, 65'),
		('João', 'Paulo', '9 9423-6401', 'Avenida João Câncio da Silva, 23'),
		('Ana', 'Júlia', '9 9327-0024', 'Avenida Senador Ruy Barbosa, 101');

/*
UPDATE clientes SET id = 1 where id = 4;
UPDATE clientes SET id = 2 where id = 5;
UPDATE clientes SET id = 3 where id = 6;
*/

SELECT * FROM clientes;

INSERT INTO emprestimos (data, id_cliente)
	VALUES ('03-12-2021', 1), ('15-12-2021', 1),
		('01-12-2021', 2), ('02-01-2022', 2),
		('02-01-2022', 3), ('11-01-2022', 3);

SELECT * FROM emprestimos;

INSERT INTO dvds_emprestimos (id_emprestimo, id_dvds)
	VALUES (1, 2), (1, 5), (2, 1), (3, 6), (3, 3), (3, 4), (4, 2), (5, 6), (5, 4), (6, 5);

SELECT * FROM dvds_emprestimos;

-- O tempo para devolução é de 10 dias, com uma taxa de R$ 0.50 por dia de atraso.

INSERT INTO devolucoes (data, atraso, id_emprestimo)
	VALUES ('15-12-2021', 2, 1), ('02-01-2021', 18, 2),
		('10-12-2021', 0, 3), ('08-01-2022', 0, 5);

SELECT * FROM devolucoes;

