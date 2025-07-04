#!/bin/bash

db="MongoDB"
Backup_time=$(date +"%Y%m%d_%H%M%S")

folder="${db}_${Backup_time}"
mkdir "$folder"

mongodump --uri="mongodb+srv://AdminUser:55chai%%1001@vtex2025-prod.ycmrama.mongodb.net/" --out "$folder"
