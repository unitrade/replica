STOP SLAVE;
CHANGE MASTER TO MASTER_HOST='10.194.238.2', MASTER_USER='repl', MASTER_PASSWORD='repl', MASTER_AUTO_POSITION=1;
START SLAVE;
