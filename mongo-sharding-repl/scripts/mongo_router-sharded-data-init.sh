#!/bin/bash

# Привязываем реплицированные шарды к роутеру и через роутер инициализируем коллекцию helloDoc
# Проверяем общее кол-во документов
docker compose exec -T mongos_router mongosh --port 27020 <<EOF
sh.addShard( "rs-shard1/shard1-a:27018");
sh.addShard( "rs-shard1/shard1-b:27018");
sh.addShard( "rs-shard1/shard1-c:27018");
sh.addShard( "rs-shard2/shard2-a:27019");
sh.addShard( "rs-shard2/shard2-b:27019");
sh.addShard( "rs-shard2/shard2-c:27019");
sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } )
use somedb
for(var i = 0; i < 1000; i++) db.helloDoc.insertOne({age:i, name:"ly"+i})
db.helloDoc.countDocuments()
EOF
