#!/bin/bash

BACKUP_DIR="/var/backups/company"
SOURCE_DIR="/home/company"
DATE=$(date +%f)

tar -czf "$BACKUP_DIR/company_$DATE.tar.gz" "$SOURCE_DIR"
