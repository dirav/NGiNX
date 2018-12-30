#!/usr/bin/env bash
CONFIG="\
	--sbin-path=/usr/bin/nginx \
	--conf-path=/etc/nginx/nginx.conf \
	--error-log-path=/var/log/nginx/error.log \
	--http-log-path=/var/log/nginx/access.log \
	--with-debug --with-pcre \
	--with-http_ssl_module \
" \
&& nginxzip='nginx-1.14.2'\
&& yum update -y \
&& yum install epel-release -y \
&& yum update -y \
&& yum -y install libpcre3 libpcre3-dev libpcrecpp0 libssl-dev zlib1g-dev \
#&& yum install gcc -y \
&& curl -O http://nginx.org/download/$nginxzip.tar.gz \
&& tar zxf $nginxzip.tar.gz \
&& rm -f $nginxzip.tar.gz \
&& cd $nginxzip \
&& ./configure $CONFIG \
&& make \
&& make install \
&& nginx \
&& echo "NGiNX it's work"