#!/bin/bash

# Инициализация редис кластера
docker exec -it redis_1 sh -c 'echo "yes" | redis-cli --cluster create 173.17.3.1:6379 173.17.3.2:6379 173.17.3.3:6379 173.17.3.4:6379 173.17.3.5:6379 173.17.3.6:6379 --cluster-replicas 1'