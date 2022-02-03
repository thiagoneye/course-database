BEGIN TRANSACTION;

	INSERT INTO tipos_produtos (descricao)
		VALUES ('Nobreak');

COMMIT;

ROLLBACK;

SELECT * FROM tipos_produtos;

SELECT * FROM produtos;

-- UPDATE tipos_produtos SET codigo = 3 WHERE codigo = 4;

BEGIN TRANSACTION;

	INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Interactive Intelbras', 550.00,3);

ROLLBACK;