"""
Banco de Dados SQL e NoSQL do Básico ao Avançado
Geek University

Capítulo 18
Aplicação CRUD com Python e MongoDB
"""

# Imports

import getpass
from pymongo import MongoClient, errors
from bson.objectid import ObjectId

# Functions

def conectar():
    """
    Função para conectar ao servidor.
    """
    client = MongoClient('localhost', 27017)

    return client

def desconectar(client):
    """ 
    Função para desconectar do servidor.
    """
    client.close()

def listar(client):
    """
    Função para listar os produtos
    """
    db = client.pmongo

    try:
        if db.produtos.count_documents({}) > 0:
            produtos = db.produtos.find()
            print('Listando produtos ...')

            for produto in produtos:
                print('---------------------')
                print(f"ID: {produto['_id']}")
                print(f"Produto: {produto['nome']}")
                print(f"Preço: {produto['preco']}")
                print(f"Estoque: {produto['estoque']}")
        else:
            print('Não existem produtos cadastrados.')
    except errors.PyMongoError as err:
        print(f'Erro ao acessar o banco de dados: {err}')

def inserir(client):
    """
    Função para inserir um produto.
    """
    nome = input('Informe o nome do produto: ')
    preco = float(input('Informe o preço do produto: '))
    estoque = int(input('Informe o estoque do produto: '))

    db = client.pmongo

    try:
        db.produtos.insert_one(
            {
                'nome': nome,
                'preco': preco,
                'estoque': estoque
            }
        )
        print('O produto foi inserido com sucesso.')
    except errors.PyMongoError as err:
        print(f'Não foi possível inserir o produto: {err}')

def atualizar(client):
    """
    Função para atualizar um produto.
    """
    codigo = input('Informe o ID do produto a ser atualizado: ')
    nome = input('Informe o novo nome do produto: ')
    preco = float(input('Informe o novo preço do produto: '))
    estoque = int(input('Informe o novo estoque do produto: '))

    db = client.pmongo

    try:
        res = db.produtos.update_one(
            {'_id': ObjectId(codigo)}, {
                    '$set': {
                        'nome': nome,
                        'preco': preco,
                        'estoque': estoque
                    }
                }
        )
        if res.modified_count == 1:
            print(f'O produto {nome} foi atualizado com sucesso.')
    except errors.PyMongoError as err:
        print(f'Não foi possível atualizar o banco de dados: {err}')

def deletar(client):
    """
    Função para deletar um produto.
    """  
    codigo = input('Informe o ID do produto a ser deletado: ')

    db = client.pmongo

    try:
        res = db.produtos.delete_one({'_id': ObjectId(codigo)})
    except errors.PyMongoError as err:
        print(f'Não foi possível deletar o produto: {err}')

def menu():
    """
    Função para gerar o menu inicial.
    """
    client = conectar()

    print('=========Gerenciamento de Produtos==============')
    print('Selecione uma opção: ')
    print('1 - Listar produtos.')
    print('2 - Inserir produtos.')
    print('3 - Atualizar produto.')
    print('4 - Deletar produto.')

    opcao = int(input())

    if opcao in [1, 2, 3, 4]:
        if opcao == 1:
            listar(client)
        elif opcao == 2:
            inserir(client)
        elif opcao == 3:
            atualizar(client)
        else:
            deletar(client)
    else:
        print('Opção inválida')
