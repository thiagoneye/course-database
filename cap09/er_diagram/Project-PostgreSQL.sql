CREATE TABLE "generos" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "nome" VARCHAR(50) NOT NULL
);

CREATE TABLE "filmes" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "titulo" VARCHAR(50) NOT NULL,
  "id_genero" INT NOT NULL
);

CREATE TABLE "dvds" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "quantidade" INT NOT NULL,
  "valor" DECIMAL(8,2) NOT NULL,
  "id_filme" INT NOT NULL
);

CREATE TABLE "atores" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "nome" VARCHAR(50) NOT NULL
);

CREATE TABLE "clientes" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "nome" VARCHAR(50) NOT NULL,
  "sobrenome" VARCHAR(50) NOT NULL,
  "telefone" VARCHAR(16) NOT NULL,
  "endereco" VARCHAR(100) NOT NULL
);

CREATE TABLE "atores_filmes" (
  "id_ator" INT NOT NULL,
  "id_filme" INT NOT NULL,
  "personagem" VARCHAR(50) NOT NULL,
  PRIMARY KEY ("id_ator", "id_filme")
);

CREATE TABLE "emprestimos" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "data" DATE NOT NULL,
  "id_cliente" INT NOT NULL
);

CREATE TABLE "devolucoes" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "data" DATE NOT NULL,
  "atraso" INT NOT NULL,
  "id_emprestimo" INT NOT NULL
);

CREATE TABLE "dvds_emprestimos" (
  "id_emprestimo" INT NOT NULL,
  "id_dvds" INT NOT NULL,
  PRIMARY KEY ("id_emprestimo", "id_dvds")
);

ALTER TABLE "filmes" ADD FOREIGN KEY ("id_genero") REFERENCES "generos" ("id");

ALTER TABLE "dvds" ADD FOREIGN KEY ("id_filme") REFERENCES "filmes" ("id");

ALTER TABLE "atores_filmes" ADD FOREIGN KEY ("id_ator") REFERENCES "atores" ("id");

ALTER TABLE "atores_filmes" ADD FOREIGN KEY ("id_filme") REFERENCES "filmes" ("id");

ALTER TABLE "emprestimos" ADD FOREIGN KEY ("id_cliente") REFERENCES "clientes" ("id");

ALTER TABLE "devolucoes" ADD FOREIGN KEY ("id_emprestimo") REFERENCES "emprestimos" ("id");

ALTER TABLE "dvds_emprestimos" ADD FOREIGN KEY ("id_emprestimo") REFERENCES "emprestimos" ("id");

ALTER TABLE "dvds_emprestimos" ADD FOREIGN KEY ("id_dvds") REFERENCES "dvds" ("id");

