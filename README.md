# ElastAlert docker image

Unofficial ElastAlert docker image.

## Usage

```
docker run -it --rm \
     -v "$(pwd)/config.yaml:/opt/elastalert/config.yaml" \
     -v "$(pwd)/rules:/opt/elastalert/rules" \
     uphy/elastalert:0.1.32
```
