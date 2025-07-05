#!/bin/bash

db="MongoDB"
Backup_time=$(date +"%Y%m%d_%H%M%S")

folder="${db}_${Backup_time}"
tar_file="${folder}.tar.gz"

# Create backup folder and run mongodump
mkdir "$folder"
mongodump --uri="$MONGO_URI" --out "$folder"

# Archive and compress with tar
tar -czvf "$tar_file" "$folder"

# Upload the tar.gz to Google Drive 'DB_BACKUPS'
rclone copy -v "$tar_file" gdrive:/DB_BACKUPS/

# Clean up local dump folder and tar.gz file
rm -rf "$folder" "$tar_file"

echo "Backup and upload complete at $Backup_time"
