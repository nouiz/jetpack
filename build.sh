#!/usr/bin/env bash

if [ -z "$1" ]; then
  images=`ls -d */ | sed 's/\///g'`
else 
  images=$1
fi

function error_exit {
	echo "$1" 1>&2
	exit 1
}

if [ -z DOCKER_HOST ]; then
  error_exit "not in boot2docker"
fi

echo "Starting builds"
for i in $images; do
  docker build -t "$i" "$i"/.
done

#docker build -t jetpack/julia juila/.
#sudo docker run -i -v juliabox/juliabox:latest || error_exit "Could not run image"
