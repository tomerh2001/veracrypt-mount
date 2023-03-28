# VeraCrypt-Mount

This Docker image allows you to mount VeraCrypt encrypted volumes in Docker containers. It supports mounting both single and multiple subdirectories within the encrypted volume. This image can be used in combination with other containers to secure their data using VeraCrypt encryption.

Feeling excited? Let's dive in! 🚀

## Usage

### Prerequisites

- Install [Docker](https://www.docker.com/)
- Create a VeraCrypt encrypted volume (file container or disk partition)

### Pull the Image

Pull the `veracrypt-mount` image from Docker Hub:

```
docker pull tomerh2001/veracrypt-mount:latest
```

### Docker Example

In this example, we will mount a VeraCrypt encrypted file container and bind mount the decrypted content to a local directory on the host. It's as simple as a walk in the park! 🌳

1. Create a local directory for the decrypted content:

```
mkdir /path/to/decrypted
```

2. Run the `veracrypt-mount` container:

```
docker run --rm
-e VERACRYPT_PASSWORD=<your_veracrypt_password>
-e VERACRYPT_SUBDIRECTORIES="subdir1,subdir2,subdir3"
-v /path/to/encrypted-file:/encrypted-file
-v /path/to/decrypted:/decrypted
tomerh2001/veracrypt-mount:latest
```

Replace `<your_veracrypt_password>` with the password for your VeraCrypt volume. Set `VERACRYPT_SUBDIRECTORIES` to a comma-separated list of subdirectories inside the encrypted volume that you want to mount. Adjust the volume paths as needed.

### Docker Compose Example

In this example, we will use a `docker-compose.yml` file to mount a VeraCrypt encrypted file container and share the decrypted content with other containers. Trust us, it's easier than it sounds! 🎉

1. Create a `docker-compose.yml` file:

```yaml
version: '3.8'

services:
  veracrypt:
    image: tomerh2001/veracrypt-mount:latest
    environment:
      - VERACRYPT_PASSWORD=<your_veracrypt_password>
      - VERACRYPT_SUBDIRECTORIES=subdir1,subdir2,subdir3
    volumes:
      - /path/to/encrypted-file:/encrypted-file
      - decrypted:/decrypted

  other-service:
    image: your/other-service
    volumes:
      - decrypted:/path/in/other-service
    depends_on:
      - veracrypt

volumes:
  decrypted:
```

Replace `<your_veracrypt_password>` with the password for your VeraCrypt volume. Set `VERACRYPT_SUBDIRECTORIES` to a comma-separated list of subdirectories inside the encrypted volume that you want to mount. Adjust the volume paths and other service details as needed.

2. Run docker-compose up to start the containers:

```
docker-compose up -d
```

## Additional Configuration

You can customize the behavior of the veracrypt-mount container by setting environment variables:

- `VERACRYPT_PASSWORD`: The password for the VeraCrypt volume (required)
- `VERACRYPT_SUBDIRECTORIES`: A comma-separated list of subdirectories inside the encrypted volume to mount (optional, default is to mount the entire volume)

## Contributing

If you have any questions, suggestions, or improvements, please feel free to submit an issue or pull request on the GitHub repository. Your contributions are welcome!

We hope this Docker image helps make your data more secure and your life a little bit easier. Happy encrypting! 🛡️

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/tomerh2001/veracrypt-mount/blob/main/LICENSE) file for details.
