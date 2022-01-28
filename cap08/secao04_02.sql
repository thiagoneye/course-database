/*
Comentários sobre o PostgreSQL

- Não possui a função USE database;
- Possui o tipo de dado SERIAL, que é o equivalente a INT AUTO_INCREMENT.
*/

/*
CREATE USER estagiario WITH PASSWORD 'mypassword123';
*/

CREATE TABLE empresas (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	funcionarios INT NOT NULL,
	cidade VARCHAR(50) NOT NULL
);

/*
GRANT ALL ON empresas TO estagiario;
GRANT USAGE, SELECT ON SEQUENCE empresas_id_seq TO estagiario;

REVOKE ALL ON empresas FROM estagiario;
REVOKE USAGE, SELECT ON SEQUENCE empresas_id_seq FROM estagiario;

DROP USER estagiario;
*/


