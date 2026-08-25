#!/bin/bash

find /var/backups/company -type f -mtime +60 -delete
