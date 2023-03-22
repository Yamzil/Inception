#!/bin/bash
echo "maxmemory 100mb" >> /etc/redis.conf
echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf
echo "timeout 0" >> /etc/redis.conf
redis-server --daemonize yes