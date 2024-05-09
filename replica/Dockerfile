FROM redis:latest

COPY replica.conf /usr/local/etc/redis.conf

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /usr/local/etc

ARG REDIS_PORT
ARG REDIS_PASSWORD
ARG REDIS_PRIMARY_PRIVATE_DOMAIN
ARG REDIS_PRIMARY_PORT
ARG REDIS_PRIMARY_PASSWORD


ENTRYPOINT ["entrypoint.sh"]
CMD ["redis-server", "/usr/local/etc/redis.conf"]