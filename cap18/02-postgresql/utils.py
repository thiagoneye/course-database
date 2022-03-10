"""
Banco de Dados SQL e NoSQL do Básico ao Avançado
Geek University

Capítulo 18
Aplicação CRUD com Python e PostgreSQL
"""

# Imports

import psycopg2
import getpass

# Functions

def conectar():
    """
    Função para conectar ao servidor.
    """
    try:
        conn = psycopg2.connect(
            user='thiago',
            password=getpass.getpass(),
            host='localhost',
            database='ppostgresql'
        )
        return conn
    except psycopg2.Error as err:
        print('Something went wrong: {}'.format(err))

def desconectar(conn):
    """
    Função para desconectar do servidor.
    """
    conn.close()

def listar(conn):
    """
    Função para listar os produtos.
    """
    cur = conn.cursor()
    cur.execute('SELECT * FROM produtos')
    produtos = cur.fetchall()

    if len(produtos) > 0:
        print('Listando produtos ...')
        for produto in produtos:
            print('---------------------')
            print(f'ID: {produto[0]}')
            print(f'Nome: {produto[1]}')
            print(f'Preço {produto[2]}')
            print(f'Quantidade: {produto[3]}')
    else:
        print('Não existem produtos cadastrados.')

def inserir(conn):
    """
    Função para inserir um produto.
    """
    nome = input('Informe o nome do produto: ')
    preco = float(input('Informe o preço do produto: '))
    estoque = int(input('Informe a quantidade do produto: '))

    cur = conn.cursor()
    cur.execute(f"INSERT INTO produtos (nome, preco, estoque) VALUES ('{nome}', {preco}, {estoque})")

def submeter(conn):
    """
    Função para enviar as alterações do banco de dados.
    """
    conn.commit()

def atualizar(conn):
    """
    Função para atualizar um produto.
    """
    codigo = int(input('Informe o código do produto a ser atualizado: '))
    nome = input('Informe o novo nome do produto: ')
    preco = float(input('Informe o novo preço do produto: '))
    estoque = int(input('Informe a nova quantidade do produto: '))

    cur = conn.cursor()
    cur.execute(f"UPDATE produtos SET nome='{nome}', preco ={preco}, estoque={estoque} WHERE id={codigo}")

def deletar(conn):
    """
    Função para deletar um produto.
    """  
    codigo = int(input('Informe o código do produto a ser deletado: '))

    cur = conn.cursor()
    cur.execute(f"DELETE FROM produtos WHERE id={codigo}")

def menu():
    """
    Função para gerar o menu inicial
    """
    conn = conectar()

    print('=========Gerenciamento de Produtos==============')
    print('Selecione uma opção: ')
    print('1 - Listar produtos.')
    print('2 - Inserir produtos.')
    print('3 - Atualizar produto.')
    print('4 - Deletar produto.')

    opcao = int(input())

    if opcao in [1, 2, 3, 4]:
        if opcao == 1:
            listar(conn)
        elif opcao == 2:
            inserir(conn)
        elif opcao == 3:
            atualizar(conn)
        else:
            deletar(conn)

        submeter(conn)
        desconectar(conn)
    else:
        print('Opção inválida')
