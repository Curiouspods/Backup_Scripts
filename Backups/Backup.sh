#!/bin/bash

db="MongoDB"
Backup_time=$(date +"%Y%m%d_%H%M%S")

folder="${db}_${Backup_time}"
zip_file="${folder}.zip"

# Create folder and run mongodump
mkdir "$folder"
mongodump --uri="mongodb+srv://Adminuser:vFa4GYtmHnpLZQQK@vtexai-prod.carxbxj.mongodb.net/?retryWrites=true&w=majority&appName=VtexAI-Prod" --out "$folder"

# Zip the dump folder
zip -r "$zip_file" "$folder"

# Upload the zip to Google Drive 'DB_BACKUPS'
rclone copy -v "$zip_file" gdrive:/DB_BACKUPS/

# Clean up local dump and zip file
rm -rf "$folder" "$zip_file"

echo "Backup and upload complete at $Backup_time"
