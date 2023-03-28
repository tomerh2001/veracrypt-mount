#!/bin/bash

# Mount the encrypted volume to the temporary mount point
veracrypt --text --non-interactive --password="$VERACRYPT_PASSWORD" /encrypted-file /encrypted-mount

# Check if the SUBFOLDERS environment variable is set
if [ -n "$SUBFOLDERS" ]; then
  # Split the SUBFOLDERS variable into an array using a comma as the delimiter
  IFS=',' read -ra SUBFOLDER_ARRAY <<< "$SUBFOLDERS"

  # Iterate over the subfolders and bind mount them
  for SUBFOLDER in "${SUBFOLDER_ARRAY[@]}"; do
    echo "Mounting subfolder: $SUBFOLDER"
    mkdir -p "/encrypted-volume/$SUBFOLDER"
    mount --bind "/encrypted-mount/$SUBFOLDER" "/encrypted-volume/$SUBFOLDER"
  done
fi

# Keep the container running
tail -f /dev/null