#!/bin/bash

set -e

# create replication user

mysql_net=$(hostname -i | sed "s/\.[0-9]\+$/.%/g")

MYSQL_PWD=${MYSQL_ROOT_PASSWORD} mysql -u root \
-e "CREATE USER '${MYSQL_SLAVE_USER}'@'${mysql_net}' IDENTIFIED BY '${MYSQL_SLAVE_PASSWORD}'; \
GRANT REPLICATION SLAVE ON *.* TO '${MYSQL_SLAVE_USER}'@'${mysql_net}';"