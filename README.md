# docker-nginx-rtmp
NGINX + nginx-rtmp-module + Fmpeg with default settings for HLS live streaming. Built on Latest ubuntu. 
* Nginx 1.13.6 (compiled from source)
* nginx-rtmp-module master (compiled from source)
* ffmpeg
* Default HLS settings (See: [nginx.conf](nginx.conf))

[![Docker Stars](https://img.shields.io/docker/stars/banian/nginx-rtmp.svg)](https://hub.docker.com/r/banianhost/nginx-rtmp/)
[![Docker Pulls](https://img.shields.io/docker/pulls/banian/nginx-rtmp.svg)](https://hub.docker.com/r/alfg/nginx-rtmp/)
[![Docker Automated build](https://img.shields.io/docker/automated/banian/nginx-rtmp.svg)](https://hub.docker.com/r/alfg/nginx-rtmp/builds/)

## Usage

### Server
* Pull docker image and run:

```
docker pull banian/nginx-rtmp
docker run -it -p 1935:1935 -p 8080:80 --rm banian/nginx-rtmp
```
or 

* Build and run container from source:

```
docker build -t nginx-rtmp .
docker run -it -p 1935:1935 -p 8080:80 --rm nginx-rtmp
```

* Stream live content to:

```
rtmp://<server ip>:1935/stream/$STREAM_NAME
```

### OBS Configuration
* Stream Type: `Custom Streaming Server`
* URL: `rtmp://localhost:1935/stream`
* Stream Key: `hello`

### Watch Stream
* In Safari, VLC or any HLS player, open:
```
http://<server ip>:8080/live/$STREAM_NAME.m3u8
```
* Example: `http://localhost:8080/live/hello`

## License 

MIT - Pooya Parsa - BanianHost

Source code based on [banian/docker-nginx-rtmp](https://github.com/banianhost/docker-nginx-rtmp) (MIT)

