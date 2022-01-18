# DML - Data Manipulation Language
# Inserindo Dados de Teste

# OBS.: Todos os dados inseridos são fictícios, utilizados para fins de estudos

USE project;

-- Tipos de Produtos

INSERT INTO tipos_de_produtos (descricao) VALUES ('Remedios');
INSERT INTO tipos_de_produtos (descricao) VALUES ('Cosmeticos');
INSERT INTO tipos_de_produtos (descricao) VALUES ('Diversos');

-- Fabricantes

INSERT INTO fabricantes (razao_social) VALUES ('Roche');
INSERT INTO fabricantes (razao_social) VALUES ('Vitalis');
INSERT INTO fabricantes (razao_social) VALUES ('Palmolive');
INSERT INTO fabricantes (razao_social) VALUES ('Neo Quimica');

-- Medicos

INSERT INTO medicos (nome, crm) VALUES ('Alfredo Muniz', '9387-PB');
INSERT INTO medicos (nome, crm) VALUES ('Fernanda Silva', '9567-PE');
INSERT INTO medicos (nome, crm) VALUES ('Julietta Santana', '9094-PE');

-- Clientes

INSERT INTO clientes (nome, endereco, telefone, codigo_postal, localidade, cpf)
	VALUES ('Felicity Jones', 'Rua da Paz, 34', '(87) 99835-8578', '58.703-433', 'Recife', '948.743.324-89');
INSERT INTO clientes (nome, endereco, telefone, codigo_postal, localidade, cpf)
	VALUES ('Angelina do Carmo', 'Rua do Ipiranga, 67', '(87) 99845-9385', '52.543-452', 'Jaboatao dos Guararapes', '234.574.436-46');
INSERT INTO clientes (nome, endereco, telefone, codigo_postal, localidade, cpf)
	VALUES ('Ricardo Chaves', 'Rua Certa, 12', '(87) 99923-7482', '58.703-123', 'Recife', '832.352.449-23');

-- Produtos

INSERT INTO produtos (nome, designacao, composicao, preco, id_tipo_de_produto, id_fabricante)
	VALUES ('Dipirona Monoidratada', 'Dor e Febre', 'Dipirona Monoidratada', '18.00', 1, 4);
INSERT INTO produtos (nome, designacao, composicao, preco, id_tipo_de_produto, id_fabricante)
	VALUES ('Dorflex', 'Relaxante Muscular', 'Dipirona Monoidratada', '6.00', 1, 4);
INSERT INTO produtos (nome, designacao, composicao, preco, id_tipo_de_produto, id_fabricante)
	VALUES ('Cenevit', 'Suplemento Alimentar', 'Vitamina C', '7.50', 1, 4);
INSERT INTO produtos (nome, designacao, composicao, preco, id_tipo_de_produto, id_fabricante)
	VALUES ('Sabonete', 'Higiene Pessoal', 'Sodium Oleate', '4.00', 2, 3);
INSERT INTO produtos (nome, designacao, composicao, preco, id_tipo_de_produto, id_fabricante)
	VALUES ('Protetor Solar', 'Protecao Contra Radiacao UV', 'Oxibenzona', '39.99', 2, 2);

-- Registros

INSERT INTO registros (data, id_cliente) VALUE ('2020-04-03', 1);
INSERT INTO registros (data, id_cliente) VALUE ('2020-04-05', 2);
INSERT INTO registros (data, id_cliente) VALUE ('2020-04-05', 3);
INSERT INTO registros (data, id_cliente) VALUE ('2020-06-10', 1);
INSERT INTO registros (data, id_cliente) VALUE ('2020-07-11', 3);

-- Registros Produtos

INSERT INTO registro_produto (quantidade, id_registro, id_produto) VALUES (2, 1, 1);
INSERT INTO registro_produto (quantidade, id_registro, id_produto) VALUES (1, 1, 3);
INSERT INTO registro_produto (quantidade, id_registro, id_produto) VALUES (3, 2, 2);
INSERT INTO registro_produto (quantidade, id_registro, id_produto) VALUES (2, 2, 4);
INSERT INTO registro_produto (quantidade, id_registro, id_produto) VALUES (1, 3, 1);
INSERT INTO registro_produto (quantidade, id_registro, id_produto) VALUES (1, 4, 5);
INSERT INTO registro_produto (quantidade, id_registro, id_produto) VALUES (2, 5, 2);

-- Receitas Medicas

INSERT INTO receitas_medicas (descricao, id_medicos, id_registro_produto) VALUES ('receita1.pdf', 1, 1);
INSERT INTO receitas_medicas (descricao, id_medicos, id_registro_produto) VALUES ('receita2.pdf', 3, 5);
