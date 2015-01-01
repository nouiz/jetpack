#!/usr/bin/env bash

function mac_build_prerequisite {
    #nat 8000-9000 tcp/udp ports from virtualbox
    if [ ! -f ".nat" ]; then 
	for i in {8000..9000}; do
	    VBoxManage controlvm "boot2docker-vm" natpf1 "tcp-port$i,tcp,,$i,,$i";
	    VBoxManage controlvm "boot2docker-vm" natpf1 "udp-port$i,udp,,$i,,$i";
	    touch .nat
	done
    fi 
}

function get_host {
    local __resultvar=$1
    #local myresult="$(expr substr $(uname -s) 1 5)"
    local myresult="$(uname -s)"
    eval $__resultvar="'$myresult'"
}

if [ "$(uname)" == "Darwin"]; then
    echo -n "Preparing to build Macintosh prerequisites..."    
    mac_build_prerequisite
    echo "done!"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo -n "Preparing to build Linux prerequisites..."
    echo "done!"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    echo -n "Preparing to build Windows prerequisites..."
    echo "done!"
fi

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

get_host result
#must run from boot2docker
if [ -z DOCKER_HOST ] && [ $result="Darwin" ]; then
  error_exit "not in boot2docker"
fi

if [ "$(id -u)" -ne 0 ] && [ $result="Linux"  ]; then
    echo  "We need a sudoer password to add you to the docker group."
    sudo usermod -a -G docker $USER
fi

echo "Starting builds"
for i in $images; do
  docker build -t "$i" "$i"/.
done
