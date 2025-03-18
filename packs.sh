#!/bin/bash

# Define the backup destination
BACKUP_DEST="/usr/local/share"

# Get the current date for the backup filename
DATE=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DEST/home_backup_$DATE.tar.gz"
FLATPAK_BACKUP_FILE="$BACKUP_DEST/flatpak_apps_$DATE.txt"
PACMAN_BACKUP_FILE="$BACKUP_DEST/pacman_packages_$DATE.txt"

# Backup installed packages
PACMAN_BACKUP_FILE="$BACKUP_DEST/pacman_packages_$DATE.txt"
pacman -Qqe > "$PACMAN_BACKUP_FILE"

# Backup installed Flatpak applications
FLATPAK_BACKUP_FILE="$BACKUP_DEST/flatpak_apps_$DATE.txt"
flatpak list --app | awk '{print $1}' > "$FLATPAK_BACKUP_FILE"