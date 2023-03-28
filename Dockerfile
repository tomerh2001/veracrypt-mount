# Use the appropriate base image for your container
FROM debian:bullseye-slim

# Install VeraCrypt
RUN apt-get update && \
    apt-get install -y veracrypt

# Create a folder to mount the encrypted volume inside the container and create a folder for the encrypted volume
RUN mkdir /encrypted-mount
RUN mkdir -p /encrypted-volume

# Add the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable and set it as the entrypoint
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]