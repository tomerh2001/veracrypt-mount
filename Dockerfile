# Use the appropriate base image for your container
FROM debian:bullseye-slim

# Install necessary packages and VeraCrypt
RUN apt-get update && \
    apt-get install -y wget gnupg && \
    wget -q https://launchpad.net/veracrypt/trunk/1.24-update7/+download/veracrypt-1.24-Update7-Debian-11-amd64.deb -O veracrypt.deb && \
    wget -q https://www.idrix.fr/VeraCrypt/VeraCrypt_PGP_public_key.asc -O veracrypt.asc && \
    gpg --import veracrypt.asc && \
    gpg --verify veracrypt.deb && \
    dpkg -i veracrypt.deb || true && \
    apt-get -f install -y && \
    rm -f veracrypt.deb veracrypt.asc && \
    apt-get autoremove --purge -y wget gnupg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a folder to mount the encrypted volume inside the container and create a folder for the encrypted volume
RUN mkdir /encrypted-mount
RUN mkdir -p /encrypted-volume

# Add the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable and set it as the entrypoint
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]