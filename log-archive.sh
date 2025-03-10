#!/bin/bash

# log-archive: A tool to archive log files into .tar.gz format
# Usage: log-archive <log-directory> [archive-directory]

# Check if required parameters are provided
if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    echo "Usage: $0 <log-directory> [archive-directory]"
    exit 1
fi

LOG_DIR="$1"

# Set default archive directory or use provided parameter
DEFAULT_ARCHIVE_DIR="/var/archives/logs"
if [ $# -eq 2 ]; then
    ARCHIVE_DIR="$2"
else
    # Check if ARCHIVE_DIR environment variable is set
    if [ -n "$ARCHIVE_DIR" ]; then
        # Use the environment variable
        echo "Using archive directory from environment variable: $ARCHIVE_DIR"
    else
        # Use default
        ARCHIVE_DIR="$DEFAULT_ARCHIVE_DIR"
    fi
fi

# Set log file path based on archive directory
LOG_FILE="$ARCHIVE_DIR/archive_history.log"

# Check if the provided log directory exists
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
