-- DML

SELECT * FROM tipos_produtos;

SELECT * FROM produtos;

-- DDL

INSERT INTO tipos_produtos (descricao)
	VALUES ('Nobreak');

-- DML

SELECT * FROM tipos_produtos;

UPDATE produtos
	SET descricao = 'Notebook', preco = '2800'
	WHERE codigo = 2;

DELETE FROM tipos_produtos
	WHERE codigo = 3;
