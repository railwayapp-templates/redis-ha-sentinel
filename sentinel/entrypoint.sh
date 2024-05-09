#!/bin/bash

SENTINEL_PORT="${REDIS_PORT:-26379}"
REDIS_PRIMARY_PORT="${REDIS_PRIMARY_PORT:-6379}"
SENTINEL_QUORUM="${SENTINEL_QUORUM:-2}"
REDIS_PRIMARY_NAME="${REDIS_PRIMARY_NAME:-myprimary}"
REDIS_DOWN_AFTER_MS="${REDIS_DOWN_AFTER_MS:-5000}"
REDIS_FAILOVER_TIMEOUT_MS="${REDIS_FAILOVER_TIMEOUT_MS:-180000}"
SENTINEL_PARALLEL_SYNCS="${SENTINEL_PARALLEL_SYNCS:-1}"

sed -i "s/__PRIMARYHOSTNAME__/$REDIS_PRIMARY_PRIVATE_DOMAIN/g" /usr/local/etc/sentinel.conf
sed -i "s/__PRIMARYAUTH__/$REDIS_PRIMARY_PASSWORD/g" /usr/local/etc/sentinel.conf

sed -i "s/__PORT__/$SENTINEL_PORT/g" /usr/local/etc/sentinel.conf
sed -i "s/__PRIMARYPORT__/$REDIS_PRIMARY_PORT/g" /usr/local/etc/sentinel.conf
sed -i "s/__QUORUM__/$SENTINEL_QUORUM/g" /usr/local/etc/sentinel.conf
sed -i "s/__PRIMARYNAME__/$REDIS_PRIMARY_NAME/g" /usr/local/etc/sentinel.conf
sed -i "s/__DOWNAFTERMS__/$REDIS_DOWN_AFTER_MS/g" /usr/local/etc/sentinel.conf
sed -i "s/__FAILOVERTIMEOUTMS__/$REDIS_FAILOVER_TIMEOUT_MS/g" /usr/local/etc/sentinel.conf
sed -i "s/__PARALLELSYNCS__/$SENTINEL_PARALLEL_SYNCS/g" /usr/local/etc/sentinel.conf

exec "$@"
