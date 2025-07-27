#! /bin/bash
set -o errexit

echo "Building docker image"
echo "This step might require sudo permissions"
sudo docker build -t builder .

echo "Running docker image"
docker run -it -v $(pwd):/mnt/shared -v $(realpath ../build):/root/build builder
mv Image ../build

