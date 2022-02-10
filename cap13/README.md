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

- **GET *key*** - Consulta o valor da chave *key*.
- **KEYS \*** - Consulta todas as chaves armazenadas.
- **KEYS *expression*\*** - Consulta todas as chaves armazenadas que iniciam com *expression*.
- **KEYS *expression1*\**expression2*\*** - Consulta todas as chaves armazenadas que iniciam com *expression1* e contêm *expression2*.
- **KEYS *expression*\*???** - Consulta todas as chaves armazenadas que iniciam com *expression* e encerrem com a quantidade de caracteres igual a quantidade de ?.
- **KEYS *expression1*\*[*expression2* expression3]\*** - Consulta todas as chaves armazenadas que iniciam com *expression1* e contêm *expression2* ou *expression3*.
- **HGET *hash* *key*** - Consulta o valor da chave *key* para a hash *hash*.
- **HKEYS *hash*** - Consulta todas as chaves armazenadas para a hash *hash*.
- **HGETALL *hash*** - Consulta todos os registros (chave-valor) para a hash *hash*.
- **LINDEX *listName* *index*** - Consulta o elemento de índice *index* da lista *listName*.
- **LRANGE *listName* *index0* *indexN*** - Consulta os elementos no intervalo de *index0* a *indexN*.
- **LLEN *listName*** - Consulta o tamanho da lista.

### Manipulações

- **SET *key* *value*** - Insere o valor *value* para a chave *key*.
- **DEL *key*** - Deleta o valor da chave *key*.
- **MSET *key1* *value1* *key2* *value2* *key3* *value3*** - Insere múltiplos registros (chave-valor).
- **HSET *hash* *key* *value*** - Insere o valor *value* para a chave *key* para a hash (estrutura contendo vários registros chave-valor) *hash*.
- **HMSET *hash* *key1* *value1* *key2* *value2* *key3* *value3*** - Insere múltiplos registros (chave-valor) na hash *hash*.
- **LPUSH *listName* *element*** - Insere o elemento *element* à esquerda da lista *listName*.
- **RPUSH *listName* *element*** - Insere o elemento *element* à direita da lista *listName*.
- **LTRIM *listName* *index0* *indexN*** - Trunca os elementos no intervalo de *index0* a *indexN*.

## Atalhos (Bash)

- **CTRL+L** - Limpa a tela do bash.
- **CTRL+C** - Finaliza o processo.
- **CTRL+D** - Encerra a aplicação.

## Sites Úteis

- [Try Redis](https://try.redis.io/) - Site para testar/estudar os comandos do Redis.
