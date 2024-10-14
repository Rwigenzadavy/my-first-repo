#!/bin/bash

# Prompt for device name
read -p "Enter device name (e.g., Monitor_A): " device_name

# Log file
log_file="heart_rate_log.txt"

# Function to simulate heart rate
generate_heart_rate() {
    echo $(( RANDOM % 100 + 50 ))  # Simulates a heart rate between 50 and 150
}

# Start logging in the background
{
    while true; do
        timestamp=$(date +"%Y-%m-%d %H:%M:%S")
        heart_rate=$(generate_heart_rate)
        echo "$timestamp $device_name $heart_rate" >> $log_file
        sleep 1
    done
} &

# Capture PID and display it
pid=$!
echo "Heart rate monitoring started with PID: $pid"

