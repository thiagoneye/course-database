# DML - Data Manipulation Language
# Realizando consultas simples

USE project;

-- Clientes
SELECT * FROM clientes;

-- Fabricantes
SELECT * FROM fabricantes;

-- Medicos
SELECT * FROM medicos;

-- Produtos
SELECT * FROM produtos;
SELECT * FROM produtos WHERE preco > '10';

-- Receitas Médicas
SELECT * FROM receitas_medicas;

-- Registro Produto
SELECT * FROM registro_produto;

-- Registros
SELECT * FROM registros;

-- Tipos Produtos
SELECT * FROM tipos_de_produtos;
SELECT id, descricao FROM tipos_de_produtos;
SELECT descricao, id FROM tipos_de_produtos;
SELECT * FROM tipos_de_produtos ORDER BY id DESC;