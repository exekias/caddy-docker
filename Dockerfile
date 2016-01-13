FROM debian

MAINTAINER Carlos Pérez-Aradros Herce <exekias@gmail.com>

RUN apt-get install -y curl

RUN mkdir /caddy \
&& curl -sL -o /caddy/caddy.tar.gz "http://caddyserver.com/download/build?os=linux&arch=amd64" \
&& tar -xf /caddy/caddy.tar.gz -C /caddy \
&& mv /caddy/caddy /usr/bin/caddy \
&& chmod 755 /usr/bin/caddy \
&& rm -rf /caddy

ADD Caddyfile /

EXPOSE 2015
EXPOSE 443
EXPOSE 80

VOLUME /var/www

WORKDIR /var/www
CMD /usr/bin/caddy --conf /Caddyfile
