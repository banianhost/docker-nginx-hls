FROM ubuntu

RUN true && \
# Install packages
apt update && \
apt install -fy \
 ffmpeg \
 wget \
 build-essential \
 libpcre3 \
 libpcre3-dev \
 libssl-dev && \

# Compile nginx from source with nginx-rtmp-module
cd /tmp && \
wget -qO- https://github.com/arut/nginx-rtmp-module/archive/master.tar.gz | tar -xvzf- && \
wget -qO- http://nginx.org/download/nginx-1.13.6.tar.gz | tar -xvzf- && \
cd nginx-1.13.6 && \
./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-master && \
make && make install && \
apt purge -y build-essential && \
apt auto-remove -y && \
rm -rf /var/cache/apt /var/lib/apt

EXPOSE 80 1935

ADD nginx.conf /opt/nginx/nginx.conf
ADD static /www/static

