
DOCKERID=XXXXXXXXX

docker run \
--net="none" \
--lxc-conf="lxc.network.type = veth" \
--lxc-conf="lxc.network.ipv4 = 10.1.1.xxx/24" \
--lxc-conf="lxc.network.link = br0" \
--lxc-conf="lxc.network.name = eth0" \
--lxc-conf="lxc.network.flags = up" \
-h docker-xxx \
-p 10.102.10.xx:50060:50060 \
-v /var/docker/mapred-xxx/data:/data \
-v /var/docker/mapred-xxx/log:/var/log/hadoop-0.20-mapreduce \
-v /var/docker/mapred-xxx/hosts:/etc/hosts \
-v /var/docker/mapred-xxx/hadoop-conf:/etc/hadoop/conf \
-d $DOCKERID
