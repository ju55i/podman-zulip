#!/bin/bash

# Export all variables in this shell
set -a

random_string() {
    openssl rand -hex 16
}

POSTGRES_PASSWORD=$(random_string)
MEMCACHED_PASSWORD=$(random_string)
REDIS_PASSWORD=$(random_string)
RABBITMQ_PASSWORD=$(random_string)
ZULIP_SECRET_KEY=$(random_string)

source zulip-vars.env

envsubst < templates/zulip-configmap-template-zulip.yaml > zulip-configmap-zulip.yaml
envsubst < templates/zulip-configmap-template-postgres.yaml > zulip-configmap-postgres.yaml
envsubst < templates/zulip-configmap-template-redis.yaml > zulip-configmap-redis.yaml
envsubst < templates/zulip-configmap-template-memcached.yaml > zulip-configmap-memcached.yaml
envsubst < templates/zulip-configmap-template-rabbitmq.yaml > zulip-configmap-rabbitmq.yaml