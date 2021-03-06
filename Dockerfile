FROM ubuntu:12.04
MAINTAINER Fredrik Holm <majingas@gmail.com>
RUN mkdir -p /mnt/persist
VOLUME ["/mnt/persist"]
VOLUME ["/var/log]

RUN apt-get update && \
    apt-get install -y \
      apache2 \
      php5 \
      php5-cli \
      libapache2-mod-php5 \
      php5-gd \
      php5-ldap \
      php5-mysql \
      php5-pgsql \
      php5-common \
      php5-curl \
      php5-dev \
      php5-geoip \
      php5-imagick \
      php5-imap \
      php5-mcrypt \
      php5-memcache \
      php-pear \
      php-console-table \
      php-apc \
      imagemagick \
      ssmtp

COPY apache2.conf-precise /etc/apache2/apache2.conf
ADD apache-conf.d /etc/apache2/conf.d/
COPY run /usr/local/bin/run
RUN ln -s /mnt/persist/etc/php5.ini /etc/php5/conf.d/zz_cloudnet.ini
#RUN ln -s 
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite proxy proxy_http
RUN sed -i -e 's/mailhub=mail/mailhub=127.0.0.1/g' /etc/ssmtp/ssmtp.conf
RUN sed -i -e 's/#FromLineOverride=YES/FromLineOverride=YES/g' /etc/ssmtp/ssmtp.conf

EXPOSE 80
CMD ["/usr/local/bin/run"]
