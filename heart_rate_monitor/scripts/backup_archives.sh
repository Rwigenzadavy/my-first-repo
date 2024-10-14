#!/bin/bash

# Variables
group_number="group12"  # Replace with your group number
archive_dir="archived_logs_group$group_number"
remote_user="YOUR_USERNAME"  # Replace with your username
remote_host="YOUR_HOST"  # Replace with your host
remote_dir="/home/"

# Create the archive directory if it doesn't exist
mkdir -p "$archive_dir"

# Move archived log files to the new directory
mv heart_rate_log.txt_* "$archive_dir/"
echo "Moved archived log files to: $archive_dir"

# Backup the contents to the remote server
scp -r "$archive_dir/" "$remote_user@$remote_host:$remote_dir"
if [ $? -eq 0 ]; then
    echo "Backup successful."
else
    echo "Backup failed."
fi

