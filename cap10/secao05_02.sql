-- Produto Cartesiano

SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
	FROM clientes AS c, profissoes AS p
	WHERE c.id_profissao = p.id;

-- Junção Inner Join

SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
	FROM clientes AS c
		INNER JOIN profissoes AS p
		ON c.id_profissao = p.id;

-- Junção Left Outer Join

SELECT *
	FROM clientes
		LEFT OUTER JOIN profissoes
		ON clientes.id_profissao = profissoes.id;
		
/*
Junção Right Outer Join
Não é suportada pelo SQLite

A seguinte consulta demonstra o erro ao utilizar a função RIGHT OUTER JOIN:

SELECT *
	FROM clientes
		RIGHT OUTER JOIN profissoes
		ON clientes.id_profissao = profissoes.id;

Junção Full Outer Join
Não é suportada pelo SQLite
*/

-- Junção Cross Join

SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
	FROM clientes AS c
		CROSS JOIN profissoes AS p;