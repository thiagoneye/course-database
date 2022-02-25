# Redis

O Redis é um armazenamento de estrutura de dados de chave-valor de código aberto e na memória. O Redis oferece um conjunto de estruturas versáteis de dados na memória que permite a fácil criação de várias aplicações personalizadas. Os principais casos de uso do Redis incluem cache, gerenciamento de sessões, PUB/SUB e classificações. Redis é um acrônimo de REmote DIctionary Server (servidor de dicionário remoto).

Sua principal aplicação é o uso em conjunto com algum banco de dados, servindo como ferramenta intermediária (fazendo uma consulta inicial ao banco de dados, armazenando os dados em uma lista em memória, utilizá-lo para acesso otimizado aos dados e, posteriormente, fazer a injestão dos dados modificados/criados no banco de dados).

Possui suporte apenas em sistemas baseados no Unix (no Windows é possível a utilização através do Windows Subsystem for Linux).

## Comandos

### Básicos

- **redis-server** - Inicializa o software.
- **redis-server --daemonize yes** - Conecta o servidor.
- **redis-cli** - Inicializa a interface de linha de comando.
- **redis-cli shutdown** - Encerra o servidor.
- **ECHO *message*** - Retorna uma mensagem enviada ao servidor.

### Consultas

#### Geral

- **TYPE *expression*** - Consulta o tipo da expressão *expression*.

#### Chave-valor

- **GET *keyName*** - Consulta o valor da chave *keyName*.
- **KEYS \*** - Consulta todas as chaves armazenadas.
- **KEYS *expression*\*** - Consulta todas as chaves armazenadas que iniciam com *expression*.
- **KEYS *expression1*\**expression2*\*** - Consulta todas as chaves armazenadas que iniciam com *expression1* e contêm *expression2*.
- **KEYS *expression*\*???** - Consulta todas as chaves armazenadas que iniciam com *expression* e encerrem com a quantidade de caracteres igual a quantidade de ?.
- **KEYS *expression1*\*[*expression2* expression3]\*** - Consulta todas as chaves armazenadas que iniciam com *expression1* e contêm *expression2* ou *expression3*.

#### Hash

- **HGET *hashName* *keyName*** - Consulta o valor da chave *keyName* para a hash *hashName*.
- **HKEYS *hashName*** - Consulta todas as chaves armazenadas para a hash *hashName*.
- **HGETALL *hash*** - Consulta todos os registros (chave-valor) para a hash *hash*.

#### Lista

- **LINDEX *listName* *index*** - Consulta o elemento de índice *index* da lista *listName*.
- **LRANGE *listName* *index0* *indexN*** - Consulta os elementos no intervalo de *index0* a *indexN*.
- **LLEN *listName*** - Consulta o tamanho da lista.

#### Lista Ordenada

- **ZCARD *sortedListName*** - Consulta a cardinalidade (o tamanho) da lista.
- **ZRANGE *listName* *index0* *indexN*** - Consulta os elementos no intervalo de *index0* a *indexN*.
- **ZREVRANGE *listName* *index0* *indexN*** - Ordena do maior para o menor e consulta os elementos no intervalo de *index0* a *indexN*.
- **ZSCORE *sortedListName* *keyName*** - Consulta o valor da chave *keyName* para a lista *sortedListName*.
- **ZRANK *sortedListName* *keyName*** - Consulta a posição da chave *keyName* para a lista *sortedListName*.

### Manipulações

#### Chave-Valor

- **SET *keyName* *value*** - Insere o valor *value* para a chave *keyName*.
- **DEL *keyName*** - Deleta o valor da chave *keyName*.
- **MSET *key1* *value1* *key2* *value2* *key3* *value3*** - Insere múltiplos registros (chave-valor).
- **INCRBY *keyName* *value*** - Incrementa em *value* a chave *keyName*.
- **INCRBYFLOAT *keyName* *valueFloat*** - Incrementa o float *valueFloat* a chave *keyName*.

#### Hash

- **HSET *hashName* *keyName* *value*** - Insere o valor *value* para a chave *keyName* para a hash (estrutura contendo vários registros chave-valor) *hashName*.
- **HMSET *hashName* *key1* *value1* *key2* *value2* *key3* *value3*** - Insere múltiplos registros (chave-valor) na hash *hashName*.
- **HINCRBY *hashName* *keyName* *value*** - Incrementa em *value* a chave *keyName* da hash *hashName*.

#### Lista

- **LPUSH *listName* *element*** - Insere o elemento *element* à esquerda da lista *listName*.
- **RPUSH *listName* *element*** - Insere o elemento *element* à direita da lista *listName*.
- **LTRIM *listName* *index0* *indexN*** - Trunca os elementos no intervalo de *index0* a *indexN*.
- **LPOP *listName*** - Consulta e remove o primeiro elemento.
- **BLPOP *listName* *time*** - Consulta e remove o primeiro elemento. Caso não haja nenhum elemento na lista, aguarda até um tempo de *time* segundos; se necessário, um valor 0 para *time* pode ser utilizado para que o tempo se indeterminado, ou seja, infinito.

#### Lista Ordenada

- **ZADD *sortedListName* *value* *keyName*** - Insere o valor *value* para a chave *keyName* para a lista *sortedListName*, de modo que a lista (**sorted list**) será ordenada pelos valores.

## Atalhos (Bash)

- **CTRL+L** - Limpa a tela do bash.
- **CTRL+C** - Finaliza o processo.
- **CTRL+D** - Encerra a aplicação.

## Sites Úteis

- [Try Redis](https://try.redis.io/) - Site para testar/estudar os comandos do Redis.
