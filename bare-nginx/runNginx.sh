#!/bin/sh
NGINX=/opt/nginx-20131029/nginx/sbin/nginx
$NGINX -p . -c conf/nginx.conf $@ 
