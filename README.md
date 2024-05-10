# Redis High Availability with Sentinel

Deploy a Redis replica set with Sentinel for automated failover with the click of a button.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/q589Jl)

# About this Repo

This repository contains the Dockerfiles and configuration files to deploy a [Redis replica set](https://redis.io/docs/latest/operate/oss_and_stack/management/replication/) and set of [Redis Sentinel](https://redis.io/docs/latest/operate/oss_and_stack/management/sentinel/) services.

It also contains an example node app which implements [ioredis](https://www.npmjs.com/package/ioredis) to connect to the set of Sentinel services.

# Details

### Primary

The [primary folder](/primary/) contains the Dockerfile and conf file to deploy the primary node in the Redis replica set.

### Replica

The [replica folder](/replica/) contains the Dockerfile and conf file to deploy the replica nodes.

### Sentinel

The [sentinel folder](/sentinel/) contains the Dockerfile and conf file to deploy the Sentinel services.

### Entrypoint script

All folders mentioned above contain an [entrypoint.sh](/primary/entrypoint.sh) script, which is used to replace the templated variables in the conf file, with values set in environment variables when the image is run.

# Resources

### Configuration options

The [redis-example.conf](/redis-example.conf) and [sentinel-example.conf](/sentinel-example.conf) files can be used to understand the various configuration options available and how to tune the services to meet specific requirements.

### Documentation

- [Redis replication](https://redis.io/docs/latest/operate/oss_and_stack/management/replication/)
- [High availability with Sentinel](https://redis.io/docs/latest/operate/oss_and_stack/management/sentinel/)
