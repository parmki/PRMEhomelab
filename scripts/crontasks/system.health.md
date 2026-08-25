#!/bin/bash

LOG="/var/log/system-health/health_log.txt"


echo "===== SYSTEM HEALTH REPORT =====" >> "$LOG"
date >> "$LOG"
hostnamectl >> "$LOG"
uptime >> "$LOG"
df -h | head >> "$LOG"
free -h >> "$LOG"
echo "====================" >> "$LOG"
echo "" >> "$LOG"
