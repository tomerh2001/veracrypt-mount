# VeraCrypt Mount
This repository provides a Docker image for mounting VeraCrypt encrypted volumes within Docker containers. It supports both single directories and multiple subdirectories within the encrypted volume.

## Usage
1. Pull the Docker image:

```
docker pull tomerh2001/veracrypt-mount:latest
```

2. Run the container with the necessary environment variables and volumes:
```
docker run -it \
  -e VERACRYPT_PASSWORD=my_password \
  -v /path/to/veracrypt/file:/encrypted-file \
  -v /path/to/output/directory:/encrypted \
  tomerh2001/veracrypt-mount:latest
```

Replace my_password with your VeraCrypt password, /path/to/veracrypt/file with the path to your encrypted VeraCrypt file, and /path/to/output/directory with the path where you want the mounted volume to be accessible.

## Docker Compose Example
Here's an example docker-compose.yml file using the VeraCrypt Mount image:

```
version: "3.8"

services:
  veracrypt:
    image: tomerh2001/veracrypt-mount:latest
    environment:
      - VERACRYPT_PASSWORD=${VERACRYPT_PASSWORD}
    volumes:
      - ./veracrypt-file:/encrypted-file
      - encrypted:/encrypted

volumes:
  encrypted:
```

Replace ./veracrypt-file with the path to your encrypted VeraCrypt file.
