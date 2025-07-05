#!/bin/bash

db="MongoDB"
Backup_time=$(date +"%Y%m%d_%H%M%S")

folder="${db}_${Backup_time}"
mkdir "$folder"

# Run mongodump
mongodump --uri="mongodb+srv://Adminuser:vFa4GYtmHnpLZQQK@vtexai-prod.carxbxj.mongodb.net/?retryWrites=true&w=majority&appName=VtexAI-Prod" --out "$folder"

# Upload to Google Drive 'DB_BACKUPS' folder
rclone copy -v "$folder" gdrive:/DB_BACKUPS/
