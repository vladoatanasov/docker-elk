FROM rabbitmq:3-management

RUN apt-get update && apt-get install -y python

COPY rabbitmqadmin.py /tmp/rabbitmqadmin.py
COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

CMD ["/bin/bash", "/tmp/entrypoint.sh"]
