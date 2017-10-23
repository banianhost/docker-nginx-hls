# Docker Nginx HLS

[![Docker Stars](https://img.shields.io/docker/stars/banian/nginx-hls.svg?style=flat-square)](https://hub.docker.com/r/banianhost/nginx-rtmp/)
[![Docker Pulls](https://img.shields.io/docker/pulls/banian/nginx-hls.svg?style=flat-square)](https://hub.docker.com/r/alfg/nginx-rtmp/)
[![Docker Automated build](https://img.shields.io/docker/automated/banian/nginx-hls.svg?style=flat-square)](https://hub.docker.com/r/alfg/nginx-rtmp/builds/)

NGINX + nginx-hls-module + ffmpeg with default settings for HLS live streaming. 

- Based on ubuntu
- Nginx 1.13.6 (compiled from source)
- nginx-hls-module master (compiled from source)
- ffmpeg
- Default HLS settings (See: [nginx.conf](nginx.conf))

## Usage

### Server
* Pull docker image and run:

```
docker pull banian/nginx-hls
docker run -it -p 1935:1935 -p 8080:80 --rm banian/nginx-hls
```
or 

* Build and run container from source:

```
docker build -t nginx-hls .
docker run -it -p 1935:1935 -p 8080:80 --rm nginx-hls
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

MIT - Pooya Parsa - BanianHost - source code based on [alfg/docker-nginx-rtmp](https://github.com/alfg/docker-nginx-rtmp) (MIT)

