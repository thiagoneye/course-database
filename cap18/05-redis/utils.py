"""
Banco de Dados SQL e NoSQL do Básico ao Avançado
Geek University

Capítulo 18
Aplicação CRUD com Python e Redis
"""

# Imports

import redis

# Functions

def conectar():
    """
    Função para conectar ao servidor.
    """
    conn = redis.Redis(host='localhost', port=6379)

    return conn

def desconectar(conn):
    """ 
    Função para desconectar do servidor.
    """
    conn.connection_pool.disconnect()

def listar(conn):
    """
    Função para listar os produtos.
    """
    try:
        dados = conn.keys(pattern='produtos:*')

        if len(dados) > 0:
            print('Listando produtos ...')
            for chave in dados:
                print('---------------------')
                produto = conn.hgetall(chave)
                print(f"ID: {str(chave, 'utf-8', 'ignore')}")
                print(f"Nome: {str(produto[b'nome'], 'utf-8', 'ignore')}")
                print(f"Preço: {str(produto[b'preco'], 'utf-8', 'ignore')}")
                print(f"Estoque: {str(produto[b'estoque'], 'utf-8', 'ignore')}")
        else:
            print('Não existem produtos cadastrados.')
    except redis.exceptions.ConnectionError as err:
        print(f'Não foi possível listar os produtos: {err}')

def gera_id(conn):
    """
    Gera o ID do novo produto.
    """
    try:
        chave = conn.get('chave')

        if chave:
            chave = conn.incr('chave')
            return chave
        else:
            conn.set('chave', 1)
            return 1
    except redis.exceptions.ConnectionError as err:
        print(f'Não foi possível gerar o ID do novo produto: {err}')

def inserir(conn):
    """
    Função para inserir um produto.
    """
    nome = input('Informe o nome do produto: ')
    preco = float(input('Informe o preço do produto: '))
    estoque = int(input('Informe o estoque do produto: '))

    produto = {'nome': nome, 'preco': preco, 'estoque': estoque}
    chave = f'produtos: {gera_id(conn)}'

    try:
        res = conn.hmset(chave, produto)

        if res:
            print(f'O produto {nome} foi inserido com sucesso.')
    except redis.exceptions.ConnectionError as err:
        print(f'Não foi possível inserir o produto: {err}')

def atualizar(conn):
    """
    Função para atualizar um produto.
    """
    chave = int(input('Informe a chave do produto a ser atualizado: '))
    nome = input('Informe o novo nome do produto: ')
    preco = float(input('Informe o novo preço do produto: '))
    estoque = int(input('Informe o novo estoque do produto: '))

    produto = {'nome': nome, 'preco': preco, 'estoque': estoque}

    try:
        res = conn.hmset(chave, produto)

        if res:
            print(f'O produto {nome} foi atualizado com sucesso.')
    except redis.exceptions.ConnectionError as err:
        print(f'Não foi possível inserir o produto: {err}')


def deletar(conn):
    """
    Função para deletar um produto.
    """
    chave = input('Informe a chave do produto: ')

    try:
        res = conn.delete(chave)

        if res == 1:
            print('O produto foi deletado com sucesso.')

    except redis.exceptions.ConnectionError as err:
        print(f'Erro ao conectar o Redis: {err}')

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

        desconectar(conn)
    else:
        print('Opção inválida')
