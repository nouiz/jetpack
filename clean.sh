docker ps | awk '{print $1 "\t"}' |grep -iv container | xargs docker kill
docker ps -a | awk '{print $1 "\t"}' |grep -iv container | xargs docker rm
docker images |grep -i none | awk '{print $3 "\t"}' | xargs docker rmi
