-- Agrupamento e Ordenação

SELECT t.nome AS 'Tipo', f.nome AS 'Fabricante', SUM(p.quantidade) AS 'Quantidade em Estoque'
	FROM tipos AS t, fabricantes AS f, produtos AS p
	WHERE t.id = p.id_tipo AND f.id = p.id_fabricante
	GROUP BY t.nome, f.nome;

SELECT t.nome AS 'Tipo', f.nome AS 'Fabricante', SUM(p.quantidade) AS 'Quantidade em Estoque'
	FROM tipos AS t, fabricantes AS f, produtos AS p
	WHERE t.id = p.id_tipo AND f.id = p.id_fabricante
	GROUP BY t.nome, f.nome
	HAVING SUM(p.quantidade) > 200;

SELECT *
	FROM produtos
	ORDER BY quantidade DESC;