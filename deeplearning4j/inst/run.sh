
rm -rf /data/mapred/*
mkdir -p /data/mapred
chmod 777 /data/mapred

/etc/init.d/hadoop-0.20-mapreduce-tasktracker start

sleep 10
tail -F /var/log/hadoop-0.20-mapreduce/hadoop-hadoop-tasktracker*.out
