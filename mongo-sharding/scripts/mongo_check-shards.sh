#!/bin/bash

# Проверяем кол-во документов на шарде 1
echo "check shard2";
docker compose exec -T shard1 mongosh --port 27018 <<EOF
use somedb;
db.helloDoc.countDocuments()
EOF

echo "check shard2";
# Проверяем кол-во документов на шарде 2
docker compose exec -T shard2 mongosh --port 27019 <<EOF
use somedb;
db.helloDoc.countDocuments()
EOF
