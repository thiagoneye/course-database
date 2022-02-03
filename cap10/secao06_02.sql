-- Funções de Agregação

SELECT MAX(preco_venda) AS 'Valor Máximo de Venda'
	FROM produtos;
	
SELECT MIN(preco_venda) AS 'Valor Mínimo de Venda'
	FROM produtos;
	
SELECT AVG(preco_venda) AS 'Média do Preço de Venda'
	FROM produtos;

SELECT ROUND(AVG(preco_venda), 2) AS 'Média do Preço de Venda'
	FROM produtos;

SELECT COUNT(preco_venda)
	FROM produtos
	WHERE id_categoria = 1;

SELECT categorias.nome AS 'Categoria', MAX(produtos.preco_venda) 'Maior Valor de Venda'
	FROM produtos
		INNER JOIN categorias
			ON categorias.id = produtos.id_categoria
	GROUP BY categorias.id;

SELECT id_categoria, MAX(preco_venda)
	FROM produtos
	GROUP BY id_categoria
	HAVING MAX(preco_venda) > 10;