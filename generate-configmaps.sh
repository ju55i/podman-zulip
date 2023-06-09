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

envsubst < zulip-configmap-template.yaml > zulip-configmaps.yaml