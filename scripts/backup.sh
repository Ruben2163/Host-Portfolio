#!/bin/bash

# Define backup directory and timestamp
BACKUP_DIR="/path/to/backup/directory"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Create a backup of the Hugo site
tar -czf "$BACKUP_DIR/hugo_backup_$TIMESTAMP.tar.gz" -C /path/to/hugo-site .

# Optionally, backup the configuration files
tar -czf "$BACKUP_DIR/nginx_backup_$TIMESTAMP.tar.gz" -C /path/to/config .

# Print completion message
echo "Backup completed successfully at $TIMESTAMP"