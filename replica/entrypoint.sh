#!/bin/bash

REDIS_PORT="${REDIS_PORT:-6379}"
REDIS_PRIMARY_PORT="${REDIS_PRIMARY_PORT:-6379}"

sed -i "s/__PORT__/$REDIS_PORT/g" /usr/local/etc/redis.conf
sed -i "s/__REQUIREPASS__/$REDIS_PASSWORD/g" /usr/local/etc/redis.conf
sed -i "s/__PRIMARYHOSTNAME__/$REDIS_PRIMARY_PRIVATE_DOMAIN/g" /usr/local/etc/redis.conf
sed -i "s/__PRIMARYPORT__/$REDIS_PRIMARY_PORT/g" /usr/local/etc/redis.conf
sed -i "s/__PRIMARYAUTH__/$REDIS_PRIMARY_PASSWORD/g" /usr/local/etc/redis.conf

exec "$@"
