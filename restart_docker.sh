#!/bin/bash
docker-compose down
docker stop nginx && stop rm ocserv
docker rm nginx && docker rm ocserv
git fetch && git stash && git pull
docker-compose up -d