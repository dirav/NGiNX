# Script for install and configure NGINX on CentOS 7
=================

## Status

## Info

## Support

## Last tested with:

1. CentOS 7.xx
2. [nginx-1.14.2](http://nginx.org/download/nginx-1.14.2.tar.gz)

## Notes ##

## Basic Install ##
Basic install instructions, use sudo if necessary for the below (depends on your setup/security).

		#!/usr/bin/env bash

		# varable for nginx version and config
		# you can add modules and path directori
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
		# update system
		&& yum update -y \
	
		# download/curl/wget nginx
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
		&& nginx \
		&& echo "NGiNX it's work"