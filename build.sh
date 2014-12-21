#!/usr/bin/env bash

#expose 8000-9000 tcp/udp ports
for i in {8000..9000}; do
  VBoxManage controlvm "boot2docker-vm" natpf1 "tcp-port$i,tcp,,$i,,$i";
  VBoxManage controlvm "boot2docker-vm" natpf1 "udp-port$i,udp,,$i,,$i";
done

#build only argument otherwise all directories
if [ -z "$1" ]; then
  images=`ls -d */ | sed 's/\///g'`
else 
  images=$1
fi

function error_exit {
	echo "$1" 1>&2
	exit 1
}

#must run from boot2docker
if [ -z DOCKER_HOST ]; then
  error_exit "not in boot2docker"
fi

echo "Starting builds"
for i in $images; do
  docker build -t "$i" "$i"/.
done
