#!/bin/bash

# Проверяем кол-во документов на репликах шарда 1
echo "check shard1-a";
docker compose exec -T shard1-a mongosh --port 27018 <<EOF
use somedb;
db.helloDoc.countDocuments()
EOF

echo "check shard1-b";
docker compose exec -T shard1-b mongosh --port 27018 <<EOF
use somedb;
db.helloDoc.countDocuments()
EOF

echo "check shard1-c";
docker compose exec -T shard1-c mongosh --port 27018 <<EOF
use somedb;
db.helloDoc.countDocuments()
EOF

# Проверяем кол-во документов на репликах шарда 2
echo "check shard2-a";
docker compose exec -T shard2-a mongosh --port 27019 <<EOF
use somedb;
db.helloDoc.countDocuments()
EOF

echo "check shard2-b";
docker compose exec -T shard2-b mongosh --port 27019 <<EOF
use somedb;
db.helloDoc.countDocuments()
EOF

echo "check shard2-c";
docker compose exec -T shard2-c mongosh --port 27019 <<EOF
use somedb;
db.helloDoc.countDocuments()
EOF
