apache-php
===================================

A Docker image based on Ubuntu 12.04, serving the old PHP 5.3 running as Apache Module. Useful for applications stuck on an old php version.

Tags
-----

* latest: Ubuntu 12.04 (LTS), Apache 2.2, PHP 5.3.10 with support for setting `error_reporting`

Usage
------

```
$ docker run -d -p 80:80 --net=host -v /mnt/persist/:/mnt/persist -v /var/log/docker:/var/log cloudnet/apache22-php53
```

This is made to work like a backport of php 5.3 in ubuntu 14.04 and run on port 80 on the host. The --net=host option allows you to connect to mysql over the host network rather than the container running it's own network stack.

CAVEAT
If you have applications configured to use localhost as db host they will need to be configured to use 127.0.0.1 instead.

```bash
$ docker run -d -p 8080:80 \
    -v /home/user/webroot:/var/www \
    -e PHP_ERROR_REPORTING='E_ALL & ~E_STRICT'
```

* `-v [local path]:/var/www` maps the container's webroot to a local path
* `-p [local port]:80` maps a local port to the container's HTTP port 80
* `-e PHP_ERROR_REPORTING=[php error_reporting settings]` sets the value of `error_reporting` in the php.ini files.

### Access apache logs

Apache is configured to log both access and error log to STDOUT. So you can simply use `docker logs` to get the log output:

`docker logs -f container-id`


Installed packages
-------------------
* Ubuntu Server 12.04, based on ubuntu docker image
* apache2
* php5
* php5-cli
* libapache2-mod-php5
* php5-gd
* php5-ldap
* php5-mysql
* php5-pgsql

Configurations
----------------

* Apache: .htaccess-Enabled in webroot (mod_rewrite with AllowOverride all)
* php.ini:
  * display_errors = On
  * error_reporting = E_ALL & ~E_DEPRECATED & ~E_NOTICE (default, overridable per env variable)
