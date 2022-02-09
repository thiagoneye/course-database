# Redis

O Redis é um armazenamento de estrutura de dados de chave-valor de código aberto e na memória. O Redis oferece um conjunto de estruturas versáteis de dados na memória que permite a fácil criação de várias aplicações personalizadas. Os principais casos de uso do Redis incluem cache, gerenciamento de sessões, PUB/SUB e classificações. É o armazenamento de chave-valor mais conhecido atualmente. Ele tem a licença BSD, é escrito em código C otimizado e é compatível com várias linguagens de desenvolvimento. Redis é um acrônimo de REmote DIctionary Server (servidor de dicionário remoto).

Sua instalação só é realizada em sistemas baseados no Unix (no Windows é possível a utilização através do Windows Subsystem for Linux).

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

### Manipulações

- **SET *key* *value*** - Insere o valor *value* para a chave *key*.
- **DEL *key*** - Deleta o valor da chave *key*.

### Atalhos (Bash)

- **CTRL+L** - Limpa a tela do bash.
- **CTRL+C** - Finaliza o processo.
- **CTRL+D** - Encerra a aplicação.
