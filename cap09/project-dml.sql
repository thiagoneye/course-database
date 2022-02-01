SELECT f.titulo, g.nome, d.valor
	FROM filmes AS f, generos AS g, dvds AS d
	WHERE f.id_genero = g.id AND d.id_filme = f.id;

SELECT a.nome, f.titulo, af.personagem
	FROM atores AS a, filmes AS f, atores_filmes AS af
	WHERE af.id_ator = a.id AND af.id_filme = f.id;

SELECT filmes.titulo
	FROM filmes, generos
	WHERE filmes.id_genero = generos.id
		AND generos.nome = 'Ação';

SELECT SUM(valor) AS soma FROM dvds;

SELECT filmes.titulo, generos.nome
	FROM filmes, generos, dvds
	WHERE filmes.id_genero = generos.id
		AND dvds.id_filme = filmes.id
		AND valor IN (SELECT MAX(valor) FROM dvds);