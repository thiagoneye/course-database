"""
Banco de Dados SQL e NoSQL do Básico ao Avançado
Geek University

Capítulo 18
Aplicação CRUD com Python e MySQL
"""

# Imports

import getpass
import mysql.connector

# Functions

def conectar():
    """
    Função para conectar ao servidor.
    """
    try:
        cnx = mysql.connector.connect(
            user='root',
            password=getpass.getpass(),
            host='127.0.0.1',
            database='pmysql'
        )
        return cnx
    except mysql.connector.Error as err:
        print("Something went wrong: {}".format(err))

def desconectar(cnx):
    """ 
    Função para desconectar do servidor.
    """
    cnx.close()

def listar(cnx):
    """
    Função para listar os produtos.
    """
    cursor = cnx.cursor()
    cursor.execute('SELECT * FROM produtos')
    produtos = cursor.fetchall()

    if len(produtos) > 0:
        print('Listando produtos ...')
        print('---------------------')
        for produto in produtos:
            print(f'ID: {produto[0]}')
            print(f'Produto: {produto[1]}')
            print(f'Preço: {produto[2]}')
            print(f'Quantidade de Estoque: {produto[3]}')
    else:
        print('Não existem produtos cadastrados.')

def inserir(cnx):
    """
    Função para inserir um produto.
    """
    nome = input('Informe o nome do produto: ')
    preco = float(input('Informe o preço do produto: '))
    estoque = int(input('Informe a quantidade do produto: '))

    cursor = cnx.cursor()
    cursor.execute(f'INSERT INTO produtos (nome, preco, estoque) VALUE ("{nome}", "{preco}", "{estoque}")')

def submeter(cnx):
    """
    Função para enviar as alterações do banco de dados.
    """
    cnx.commit()

def atualizar(cnx):
    """
    Função para atualizar um produto.
    """
    codigo = int(input('Informe o código do produto: '))
    nome = input('Informe o novo nome do produto: ')
    preco = float(input('Informe o novo preço do produto: '))
    estoque = int(input('Informe a nova quantidade do produto: '))

    cursor = cnx.cursor()
    cursor.execute(f'UPDATE produtos SET nome="{nome}", preco="{preco}", estoque="{estoque}" WHERE id="{codigo}"')

def deletar(cnx):
    """
    Função para deletar um produto.
    """
    codigo = int(input('Informe o código do produto: '))

    cursor = cnx.cursor()
    cursor.execute(f'DELETE FROM produtos WHERE id="{codigo}"')

def menu():
    """
    Função para gerar o menu inicial.
    """
    cnx = conectar()

    print('========= Gerenciamento de Produtos ==============')
    print('Selecione uma opção: ')
    print('1 - Listar produtos.')
    print('2 - Inserir produtos.')
    print('3 - Atualizar produto.')
    print('4 - Deletar produto.')

    opcao = int(input())

    if opcao in [1, 2, 3, 4]:
        if opcao == 1:
            listar(cnx)
        elif opcao == 2:
            inserir(cnx)
        elif opcao == 3:
            atualizar(cnx)
        else:
            deletar(cnx)

        submeter(cnx)
        desconectar(cnx)
    else:
        print('Opção inválida')
