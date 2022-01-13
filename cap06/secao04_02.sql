# DQL

SELECT * FROM tipos_produto;

# DTL

-- Transaction
START TRANSACTION;
	INSERT INTO tipos_produto (descricao) VALUES ('chair');
    INSERT INTO tipos_produto (descricao) VALUES ('desk');

-- Commit
COMMIT;

-- Rollback
ROLLBACK;

# DQL

SELECT * FROM tipos_produto;