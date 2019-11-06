#!/bin/bash

echo "Waiting for mysql to get up"
# Give 9 seconds for master and slave to come up
sleep 12

echo "Create MySQL Servers (master / slave replica)"
echo "-----------------"

Master_Position=$( mysql -h 10.194.238.9 -uroot -p$MYSQL_MASTER_PASSWORD -e 'show master status\G' | grep Position | sed -n -e 's/^.*: //p' )

Master_File=$( mysql -h 10.194.238.9 -uroot -p$MYSQL_MASTER_PASSWORD -e 'show master status\G' | grep File | sed -n -e 's/^.*: //p' )

mysql -uroot -p$MYSQL_SLAVE_PASSWORD -e 'STOP SLAVE;';

mysql -u root -p$MYSQL_SLAVE_PASSWORD -e "CHANGE MASTER TO master_host='10.194.238.9', master_port=3306, master_user='$MYSQL_REPLICATION_USER', master_password='$MYSQL_REPLICATION_PASSWORD', master_log_file='$Master_File', master_log_pos=$Master_Position;"

mysql -uroot -p$MYSQL_SLAVE_PASSWORD -e 'START SLAVE;';

