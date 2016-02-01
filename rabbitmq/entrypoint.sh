#!/usr/bin/env bash

echo "Starting rabbitmq server"
/usr/lib/rabbitmq/bin/rabbitmq-server &

#ugly hack to wait for rabbitmq to initialize
sleep 10

echo "Creating exchange"
python /tmp/rabbitmqadmin.py declare exchange name=logstash-rabbitmq type=direct &

# don't exit the container
while true; do sleep 1000; done
