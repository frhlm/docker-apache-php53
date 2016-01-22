apache-php
===================================

A Docker image based on Ubuntu 12.04, serving the old PHP 5.3 running as Apache Module. Useful for applications stuck on an old php version.

Tags
-----

* latest: Ubuntu 12.04 (LTS), Apache 2.2, PHP 5.3.10 with support for setting `error_reporting`

Usage
------

```
docker run -d --name=apache_php_docker -p 80:80 --net=host -e "TZ=Europe/Stockholm" -v /mnt/persist/:/mnt/persist -v /var/log/docker:/var/log cloudnet/apache22-php53
```

This is made to work like a backport of php 5.3 in ubuntu 14.04 and run on port 80 on the host. The --net=host option allows you to connect to mysql over the host network rather than the container running it's own network stack.

CAVEAT
If you have applications configured to use localhost as db host they will need to be configured to use 127.0.0.1 instead.

