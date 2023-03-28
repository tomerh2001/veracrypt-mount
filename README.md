# veracrypt-mount

## Example

```
docker run -it --rm \
  -e VERACRYPT_PASSWORD=my_password \
  -e SUBFOLDERS=nextcloud,mariadb,nginx \
  -v /path/to/encrypted-file:/encrypted-file \
  -v encrypted_mount:/encrypted-mount \
  my_dockerhub_username/veracrypt-mount
```
