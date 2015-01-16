#!/usr/bin/env bash

usage="$(basename "$0") [package] -- run the selected package and have it connect to the outside

where:
    package - one of
                deeplearning4j
                graphlab
                h2o
                julia
                theano
                vw
                mllib
"

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "$usage"
    exit 1
fi

get_host() {
    local __resultvar=$1
    #local myresult="$(expr substr $(uname -s) 1 5)"
    local myresult_s="$(uname -s)"
    if [ $myresult_s = "Darwin" ]; then
	eval $__resultvar="'$myresult_s'"
    else
	local myresult="$(uname -o)"
	eval $__resultvar="'$myresult'"
    fi
}
run_as_sudo() {
    get_host host_result

    if [ $host_result = "GNU/Linux" ]; then
	echo -n "We need sudoer password for this command: "
	echo $@
	sudo $@
    elif [ $host_result = "Darwin" ]; then
	$@
    elif [ $host_result = "MINGW32_NT" ] || [ $host_result = "Cygwin" ]; then
	$@
    fi
}
linux_build_prerequisite() {
    echo  "We need a sudoer password to add you to the docker group."
    sudo usermod -a -G docker $USER
}
windows_build_prerequisite() {
    echo -n ""
}

mac_build_prerequisite() {

    #must run from boot2docker
    if [ -z DOCKER_HOST ]; then
        error_exit "not in boot2docker"
    fi

    if [ ! -f ".nat" ]; then 
        echo  "Giving the VM more memory."
        boot2docker info
        boot2docker poweroff
        VBoxManage modifyvm boot2docker-vm --memory 4096
        boot2docker up

        echo  "Adding NAT ports 8000-9000."
    	for i in {8000..9000}; do
    	    VBoxManage controlvm "boot2docker-vm" natpf1 "tcp-port$i,tcp,,$i,,$i";
    	    VBoxManage controlvm "boot2docker-vm" natpf1 "udp-port$i,udp,,$i,,$i";
    	    touch .nat
    	done
    fi
}
error_exit() {
	echo "$1" 1>&2
	exit 1
}

get_host host_result

if [ $host_result == "Darwin" ]; then
    echo -n "Preparing to build Macintosh prerequisites..."    
    mac_build_prerequisite
    echo "done!"
elif [ $host_result = "GNU/Linux" ]; then
    echo -n "Preparing to build Linux prerequisites..."
    linux_build_prerequisite
    echo "done!"
elif [ "$(expr substr $(uname -s) 1 10)" = "MINGW32_NT" ]; then
    echo -n "Preparing to build Windows prerequisites..."
    windows_build_prerequisite
    echo "done!"
fi

#build only argument otherwise all directories
if [ -z "$1" ]; then
  images=`ls -d */ | sed 's/\///g' |grep -iv torch |grep -iv vowpal |grep -iv deeplearning4j`
  echo $images
else 
  images=$1
fi


echo "Starting builds"
for i in $images; do
    run_as_sudo docker build -t startupml/"$i" "$i"/.
done
