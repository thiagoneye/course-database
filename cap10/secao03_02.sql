-- DDL

INSERT INTO tipos_produtos (descricao) VALUES ('Computadores'), ('Impressoras'), ('Diversos');

INSERT INTO produtos (descricao, preco, id_tipo)
	VALUES ('Notebook Dell', 2345.67, 1), ('Impressora Jato de Tinta', 456.00, 2), ('Mouse Sem Fio', 45, 3);

-- DML
	
SELECT * FROM tipos_produtos;

SELECT * FROM produtos;