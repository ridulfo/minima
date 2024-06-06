#! /bin/bash
set -o errexit

sudo docker build -t builder .
docker run -it -v $(pwd):/mnt/shared builder
mv Image ../build

