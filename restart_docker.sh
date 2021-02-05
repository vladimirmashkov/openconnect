#!/bin/bash
docker-compose down
docker stop nginx && stop rm ocserv
docker rm nginx && docker rm ocserv
git fetch && git stash && git pull
sh 02.prepare_scripts.sh
docker-compose up -d