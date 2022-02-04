# MongoDB

O MongoDB é um software de banco de dados orientado a documentos livre (NoSQL), de código aberto e com estrutura do tipo chave-valor (semelhante a um arquivo JSON).

## Comandos 

- **mongo** - Inicializa o software.
- **show dbs** - Mostra os banco de dados disponíveis.
- **use *databaseName*** - Caso exista, acessa o banco de dados *databaseName*; caso não exista, cria o banco de dados.
- **show collections** - Mostra as coleções(equivalente a tabela em um banco de dados relacional) disponíveis.
- **db.*collectionName*.find()** - Mostra os registros da coleção *collectionName*.
- **db.*collectionName*.find({*attributeName*: *value*})** - Consulta registro que possui o valor *value* para o atributo *AtributeName* na coleção *collectionName*.
- **db.*collectionName*.insert({*attributeName*: *Value*})** - Insere o valor *value* para o atributo *AtributeName* na coleção *collectionName*.
- **db.createCollection(*collectionName*)** - Cria a colleção *collectionName*.