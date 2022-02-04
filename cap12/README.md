# MongoDB

O MongoDB é um software de banco de dados orientado a documentos livre (NoSQL), de código aberto e com estrutura do tipo JSON (chave-valor) denominada BSON (binary JSON).

## Comandos

### Básicos

- **mongo** - Inicializa o software.
- **show dbs** - Mostra os banco de dados disponíveis.
- **use *databaseName*** - Caso exista, acessa o banco de dados *databaseName*; caso não exista, cria o banco de dados.
- **show collections** - Mostra as coleções(equivalente a tabela em um banco de dados relacional) disponíveis.

### Consultas

- **db.*collectionName*.find()** - Mostra os registros da coleção *collectionName*.
- **db.*collectionName*.find().pretty()** - Mostra os registro (identados/formatados).
- **db.*collectionName*.find({*attributeName*: *value*})** - Consulta registro que possui o valor *value* para o atributo *attributeName* na coleção *collectionName*.
- **db.*collectionName*.find().sort({*attributeName*: 1})** - Consulta registro e ordena de acordo com *attributeName*; 1 para ordem **Ascendente** e -1 para ordem **Descendente**.
- **db.*collectionName*.find().count()** - Conta os registros da coleção *collectionName*.

### Operadores

- **$or: {}** - Operador lógico OR, utilizado em combinação com db.*collectionName*.find().

### Manipulações

- **db.createCollection(*collectionName*)** - Cria a colleção *collectionName*.
- **db.*collectionName*.insert({*attributeName1*: *value1*, *attributeName2*: *value2*})** - Insere o valor *value* para o atributo *attributeName* na coleção *collectionName*.
- **db.*collectionName*.insertMany({*attributeName1*: *value1*, *attributeName2*: *value2*}, {*attributeName1*: *value3*, *attributeName2*: *value4*})** - Insere mais de um registro na coleção *collectionName*.
- **db.*collectionName*.update({*attributeName*: *value1*}, {*attributeName*: *value2*})** - Atualiza um registro; é composto por duas entradas, sendo a primeira um filtro e a segunda o resultado desejado.
- **db.*collectionName*.delete({*attributeName*: *value*})** - Delete um registro; possui como entrada um filtro de qual registro dele ver deletado.