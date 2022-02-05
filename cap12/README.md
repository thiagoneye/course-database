# MongoDB

O MongoDB é um software de banco de dados orientado a documentos livre (NoSQL), de código aberto e com estrutura do tipo JSON (chave-valor) denominada BSON (binary JSON).

## Comandos

### Básicos

- **mongo** - Inicializa o software.
- **show dbs** - Mostra os banco de dados disponíveis.
- **use *databaseName*** - Caso exista, acessa o banco de dados *databaseName*; caso não exista, cria o banco de dados.
- **show collections** - Mostra as coleções (equivalente a tabela em um banco de dados relacional) disponíveis.

### Consultas

- **db.*collectionName*.find()** - Mostra os registros da coleção *collectionName*.
- **db.*collectionName*.find().pretty()** - Mostra os registro (identados/formatados).
- **db.*collectionName*.find({*attributeName*: *value*})** - Consulta registro que possui o valor *value* para o atributo *attributeName*.
- **db.*collectionName*.findOne({*attributeName*: *value*})** - Consulta o primeiro registro que possui o valor *value* para o atributo *attributeName*.
- **db.*collectionName*.find().limit(*limitation*)** - Consulta registro e limita de acordo com o valor *limitation*.
- **db.*collectionName*.find().sort({*attributeName*: 1})** - Consulta registro e ordena de acordo com *attributeName*; 1 para ordem **Ascendente** e -1 para ordem **Descendente**.
- **db.*collectionName*.find().count()** - Conta os registros da coleção *collectionName*.

### Manipulações

- **db.createCollection(*collectionName*)** - Cria a colleção *collectionName*.
- **db.*collectionName*.insert({*attributeName1*: *value1*, *attributeName2*: *value2*})** - Insere o valor *value* para o atributo *attributeName* na coleção *collectionName*.
- **db.*collectionName*.insertMany({*attributeName1*: *value1*, *attributeName2*: *value2*}, {*attributeName1*: *value3*, *attributeName2*: *value4*})** - Insere mais de um registro na coleção *collectionName*.
- **db.*collectionName*.update({*firstInput*}, {*secondInput*})** - Atualiza um registro; é composto por duas entradas, sendo a primeira (chave-valor) um filtro e a segunda (chave-valor) o resultado desejado.
- **db.*collectionName*.delete({*attributeName*: *value*})** - Deleta um registro, possui como entrada um filtro de qual registro dele ver deletado; possui como parametro o termo **multi**, para realizar a atualização em mais de um registro. 
- **mongoimport -d *databaseName* -c *collectionName* --*dataType* < *fileName*** - Importa um registro de um arquivo externo para o banco de dados; o comando deve ser executado no terminal; o caminho do terminal deve estar no local de armazenamento do arquivo.

### Operadores

- **$or: {}** - Operador lógico OR, utilizado em combinação com db.*collectionName*.find().
- **$gt: {}** - Operador lógico GREATER THAN (>), utilizado em combinação com db.*collectionName*.find().
- **$gte: {}** - Operador lógico GREATER THAN OR EQUAL TO (>=), utilizado em combinação com db.*collectionName*.find().
- **$lt: {}** - Operador lógico LESS THAN (<), utilizado em combinação com db.*collectionName*.find().
- **$lte: {}** - Operador lógico LESS THAN OR EQUAL TO (<=), utilizado em combinação com db.*collectionName*.find().
- **$set: {}** - Operador de agregação SER, substitui o valor de um campo por o valor especificado; utilizado em combinação com db.*collectionName*.update().
- **$push: {}** - Operador de agregação PUSH, adiciona um novo valor; utilizado em combinação com db.*collectionName*.update(), para adicionar valores em um array.
- **$each: {}** - Operador de agregação EACH, adiciona vários valores; utilizado em combinação com db.*collectionName*.update() e com o operador *$push: {}*.
