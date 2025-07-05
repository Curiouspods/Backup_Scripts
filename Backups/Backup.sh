#!/bin/bash

db="MongoDB"
Backup_time=$(date +"%Y%m%d_%H%M%S")

folder="${db}_${Backup_time}"
mkdir "$folder"

mongodump --uri="mongodb+srv://Adminuser:vFa4GYtmHnpLZQQK@vtexai-prod.carxbxj.mongodb.net/?retryWrites=true&w=majority&appName=VtexAI-Prod" --out "$folder"

rclone copy $folder gdrive:/Backups/
