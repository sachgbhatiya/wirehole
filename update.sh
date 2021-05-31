#!/bin/bash
docker-compose down
docker images | grep -v REPOSITORY|awk '{print $1}' | xargs -L1 docker pull
docker-compose up -d
docker image prune -a -f
