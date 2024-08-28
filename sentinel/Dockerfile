FROM redis:7.2.5

COPY sentinel.conf /usr/local/etc/sentinel.conf

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /usr/local/etc

ARG REDIS_PRIMARY_PRIVATE_DOMAIN
ARG REDIS_PRIMARY_PASSWORD

ARG SENTINEL_PORT
ARG REDIS_PRIMARY_PORT
ARG SENTINEL_QUORUM
ARG REDIS_PRIMARY_NAME
ARG REDIS_DOWN_AFTER_MS
ARG REDIS_FAILOVER_TIMEOUT_MS
ARG SENTINEL_PARALLEL_SYNCS

ENTRYPOINT ["entrypoint.sh"]
CMD ["redis-server", "/usr/local/etc/sentinel.conf", "--sentinel"]
