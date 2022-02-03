SELECT *
	FROM tipos_produtos
	WHERE descricao = 'Computador';

SELECT *
	FROM produtos
	WHERE preco <= 300;

SELECT p.codigo AS 'Código', p.descricao AS 'Descrição', p.preco AS 'Preço',
		tp.descricao AS 'Tipo de Produto'
	FROM produtos AS p, tipos_produtos AS tp
	WHERE p.codigo_tipo = tp.codigo;
