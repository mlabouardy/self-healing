# Checks

* Memory
* Disk
* CPU
* Ping
* HTTP
* Docker

```sh
docker run -d -p 8500:8500 -v /home/core/health/:/consul/scripts/ -v /home/core/conf/consul:/consul/config --name consul consul
```
