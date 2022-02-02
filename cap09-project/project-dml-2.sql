-- Consulta de filmes com a atuação de determinado ator

SELECT f.titulo, g.nome, af.personagem
	FROM filmes AS f, generos AS g, atores_filmes AS af, atores AS a
	WHERE f.id_genero = g.id AND f.id = af.id_filme AND a.id = af.id_ator
		AND a.nome = 'Brad Pitt';

-- Consulta de filmes e atores por gênero

SELECT f.titulo, af.personagem, a.nome
	FROM filmes AS f, generos AS g, atores_filmes AS af, atores AS a
	WHERE f.id_genero = g.id AND f.id = af.id_filme AND a.id = af.id_ator
		AND g.nome = 'Ação'
	ORDER BY a.nome;

-- Consultar os filmes que cada cliente alugou

SELECT clientes.nome || ' ' || clientes.sobrenome AS "cliente", filmes.titulo AS filme, 
		generos.nome AS genero, emprestimos.data
	FROM clientes, filmes, generos, emprestimos, dvds, dvds_emprestimos
	WHERE generos.id = filmes.id_genero AND filmes.id = dvds.id_filme
		AND dvds.id = dvds_emprestimos.id_dvds AND dvds_emprestimos.id_emprestimo = emprestimos.id
		AND emprestimos.id_cliente = clientes.id
	ORDER BY clientes.nome, emprestimos.data, filmes.titulo;

-- Consultar os empréstimos e as devoluções de cada cliente

SELECT clientes.nome || ' ' || clientes.sobrenome AS "cliente", filmes.titulo, generos.nome,
		emprestimos.data AS emprestimo, devolucoes.data AS devolucao
	FROM clientes, filmes, generos, emprestimos, dvds, dvds_emprestimos, devolucoes
	WHERE generos.id = filmes.id_genero AND filmes.id = dvds.id_filme
		AND dvds.id = dvds_emprestimos.id_dvds AND dvds_emprestimos.id_emprestimo = emprestimos.id
		AND emprestimos.id_cliente = clientes.id AND emprestimos.id = devolucoes.id_emprestimo
	ORDER BY clientes.nome, emprestimos.data, filmes.titulo;

-- Consultar o valor por cliente (sem o juros de atraso)

SELECT clientes.nome || ' ' || clientes.sobrenome AS "cliente", SUM(dvds.valor) AS valor
	FROM clientes, emprestimos, dvds, dvds_emprestimos
	WHERE dvds.id = dvds_emprestimos.id_dvds AND dvds_emprestimos.id_emprestimo = emprestimos.id
		AND emprestimos.id_cliente = clientes.id
	GROUP BY clientes.id
	ORDER BY clientes.nome;