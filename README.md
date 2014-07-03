docker-serf-wrapper
===================

Wrap [Docker](http://www.docker.io) container with [Serf](http://serfdom.io) agent


Run any serf container e.g.:
```
docker run -d --name serf ctlc/serf
```
Run your service in a container (this service has no serf agent included/running)
```
docker run -d -p 6379:6379 --name redis redis
```
Expose your service to serf
```
docker run -d --link serf:serf --link redis:redis bivas/serf-wrapper
```

The wrapper will use the link information and publish your service (in the above example: role=redis_6379)

*Note*: If multiple containers are linked, only the first (non-serf) container will count as service container
