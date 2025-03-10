#!/bin/bash

# log-archive: A tool to archive log files into .tar.gz format
# Usage: log-archive <log-directory>

# Check if directory parameter is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

LOG_DIR="$1"
ARCHIVE_DIR="/var/archives/logs"
LOG_FILE="/var/archives/logs/archive_history.log"

# Check if the provided directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory '$LOG_DIR' does not exist."
    exit 1
fi

# Create archive directory if it doesn't exist
if [ ! -d "$ARCHIVE_DIR" ]; then
    mkdir -p "$ARCHIVE_DIR"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create archive directory '$ARCHIVE_DIR'"
        exit 1
    fi
fi

# Create the log file if it doesn't exist
if [ ! -f "$LOG_FILE" ]; then
    touch "$LOG_FILE"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create log file '$LOG_FILE'"
        exit 1
    fi
fi

# Generate timestamp for the archive filename
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="$ARCHIVE_DIR/$ARCHIVE_NAME"

# Create the archive
tar -czf "$ARCHIVE_PATH" -C "$(dirname "$LOG_DIR")" "$(basename "$LOG_DIR")"
if [ $? -eq 0 ]; then
    # Log the archive operation with date and time
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] Archive created: $ARCHIVE_PATH from $LOG_DIR" >> "$LOG_FILE"
    echo "Archive created successfully: $ARCHIVE_PATH"
    echo "Archive operation logged to: $LOG_FILE"
else
    echo "Error: Failed to create archive."
    exit 1
fi

exit 0
