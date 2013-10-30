openresty
======

1. Download by command `wget http://openresty.org/download/ngx_openresty-1.4.3.1.tar.gz` 
2. Install OpenSSL if needed:
`sudo apt-get install openssl`
`sudo apt-get install libssl-dev`
3. Open archive `tar xvzf ngx_openresty-1.4.3.1.tar.gz` and go inside `cd ngx_openresty-1.4.3.1.tar.gz`
4. Run `sudo ./configure --with-luajit --prefix=/opt/nginx-20131029`
5. Finish installation `sudo make`, then `sudo make install`


redis
=======
1. Install w/ commands:
```bash
wget http://download.redis.io/releases/redis-2.6.16.tar.gz
tar xzf redis-2.6.16.tar.gz
cd redis-2.6.16
make
```
2. Run builded Redis `src/redis-server --port 6164`

possible issues
==============
1) Can't reload Nginx
`nginx: [alert] could not open error log file: open() "/opt/nginx-20131029/nginx/logs/error.log" failed (13: Permission denied)`
to fix this message link must be created, find actual file location `find / -name nginx.pid 2>/dev/null`  then create required dir `mkdir -p /opt/nginx-20131029/nginx/logs/`, after that create link `ln -s /actual/location/nginx.pid /opt/nginx-20131029/nginx/logs/nginx.pid`
2) not enough open file descriptors
to increase them w/ `ulimit -n 25000`
