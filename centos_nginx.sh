#!/usr/bin/env bash
NGINX_VERSION='nginx-1.14.2'\
&& CONFIG="\
	--sbin-path=/usr/bin/nginx \
	--conf-path=/etc/nginx/nginx.conf \
	--error-log-path=/var/log/nginx/error.log \
	--http-log-path=/var/log/nginx/access.log \
	--with-debug \
	--with-pcre \
	--with-http_ssl_module \
" \
&& yum update -y \
&& curl -O http://nginx.org/download/$NGINX_VERSION.tar.gz \
&& tar zxf $NGINX_VERSION.tar.gz \
&& rm -f $NGINX_VERSION.tar.gz \
&& yum install -y gcc \
	openssl-devel \
	pcre-devel \
	zlib-devel \
&& cd $NGINX_VERSION \
&& ./configure $CONFIG \
&& make \
&& make install \
&& nginx && echo "NGiNX it's work"