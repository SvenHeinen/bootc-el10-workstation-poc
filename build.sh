#!/bin/bash -x

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

mkdir -p output
rm -rf output/*

podman build -t localhost/bootc-el10-workstation:latest .
podman run \
  --rm \
  -it \
  --privileged \
  --pull=newer \
  --security-opt label=type:unconfined_t \
  -v ./config.toml:/config.toml:ro \
  -v ./output:/output \
  -v /var/lib/containers/storage:/var/lib/containers/storage \
  quay.io/centos-bootc/bootc-image-builder:latest \
  --type qcow2 \
  --local \
  localhost/bootc-el10-workstation:latest
