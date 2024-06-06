#! /bin/bash
set -o errexit

echo "Building the image"
echo "This step might require sudo permissions"
sudo docker build -t builder .
docker run -it -v $(pwd):/mnt/shared builder
mv Image ../build

