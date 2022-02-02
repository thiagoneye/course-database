# DML - Data Manipulation Language
# Consultas Complexas

USE project;

-- Passo 1 - Trazer os registros
SELECT * FROM registros;
SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM registro_produto;

-- Passo 2 - Colocar o nome dos clientes nos registros de compras
-- Junção Cartesiana
SELECT registros.id, clientes.nome, registros.data
	FROM registros, clientes
	WHERE registros.id_cliente = clientes.id
	ORDER BY registros.id;
-- Junção Inner Join
SELECT registros.id, clientes.nome, registros.data
	FROM registros
	INNER JOIN clientes
	ON registros.id_cliente = clientes.id
	ORDER BY registros.id;

-- Passo 3 - Valor total da compra por cliente
SELECT clientes.nome AS 'Cliente', registros.data AS 'Data da Compra',
	(produtos.preco*registro_produto.quantidade) AS 'Preco Total'
		FROM clientes, registros, produtos, registro_produto
        WHERE clientes.id = registros.id_cliente AND registro_produto.id_registro = registros.id
			AND registro_produto.id_produto = produtos.id;

SELECT clientes.nome AS 'Cliente', SUM(produtos.preco*registro_produto.quantidade) AS 'Preco Total'
	FROM clientes, registros, produtos, registro_produto
    WHERE clientes.id = registros.id_cliente AND registro_produto.id_registro = registros.id
		AND registro_produto.id_produto = produtos.id
			GROUP BY clientes.nome;