# Replica
Using Docker (Docker Compose), configure sandboxes based on the standard official MySQL Percona 5.7 image, containing 4 database servers that perform replication:

1. GTID Replication:
    Master and Slave
#----------------------------------------------#
#                        S                     #
#                        |                     #
#                   S -- M -- S                #
#                                              #
#----------------------------------------------#

2. Default Replication:
    Master and Slave
#---------------------------------------------------------#
#                 Replica A -> B -> C -> D                #
#---------------------------------------------------------#

Inside each container, provide MySQL login as root without having to enter a password on localhost (not an empty password).
On the database servers, a replicated database schema with a test label and information in it should be created.
