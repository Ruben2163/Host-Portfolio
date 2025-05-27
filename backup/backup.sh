BACKUP_DIR="/home/pi/backup-portfolio"

HUGO_SITE_DIR="/home/pi/portfolio"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Backup Hugo site files
rsync -av --delete "$HUGO_SITE_DIR/" "$BACKUP_DIR/hugo-site-backup/"

# Backup configuration files
rsync -av --delete "/path/to/config/" "$BACKUP_DIR/config-backup/"

# Log backup completion
echo "Backup completed successfully on $(date)" >> "$BACKUP_DIR/backup.log"