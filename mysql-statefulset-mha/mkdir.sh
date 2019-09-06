ssh root@192.168.10.129 
ssh root@okd-node-3 "rm -rf /mysql-data ;mkdir -p /mysql-data"
ssh root@okd-node-4 "rm -rf /mysql-data ;mkdir -p /mysql-data"
ssh root@okd-node-6 "rm -rf /mysql-data ;mkdir -p /mysql-data"


 mysql -h 127.0.0.1 -e  "CHANGE MASTER TO MASTER_HOST='mysql-0.mysql',  MASTER_USER='root', MASTER_PASSWORD='', MASTER_CONNECT_RETRY=10,  master_auto_position=1; reset slave;  start slave IO_THREAD; stop slave IO_THREAD; reset slave; START SLAVE; "
