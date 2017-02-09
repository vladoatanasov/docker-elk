#!/usr/bin/env bash

echo "Starting rabbitmq server"
/usr/lib/rabbitmq/bin/rabbitmq-server &

printf "Waiting for server to start\n"
httpstatus="0"
while [ $httpstatus -ne "200" ]; do
  httpstatus=$(curl -s -o /dev/null -I -w "%{http_code}" http://localhost:15672)
done


echo "Creating exchange"
python /tmp/rabbitmqadmin.py declare exchange name=logstash-rabbitmq type=direct &

# don't exit the container
while true; do sleep 1000; done
