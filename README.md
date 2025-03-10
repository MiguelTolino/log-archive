# Log Archive Tool

A simple command-line utility for archiving log directories into timestamped `.tar.gz` files with operation logging.

## Overview

The Log Archive Tool (`log-archive`) automates the process of backing up log directories. Each execution creates a timestamped archive and records the operation in a history log file for tracking and auditing purposes.

## Features

- Creates compressed archives (`.tar.gz`) of specified log directories
- Automatically generates timestamped filenames
- Maintains a log of all archive operations with timestamps
- Performs validation checks on inputs and operations
- Simple command-line interface

## Installation

1. Save the script to a file named `log-archive`:
   ```bash
   sudo nano /usr/local/bin/log-archive
   ```

2. Make it executable:
   ```bash
   sudo chmod +x /usr/local/bin/log-archive
   ```

3. Ensure it's in your PATH (using `/usr/local/bin/` is recommended)

## Usage

```
log-archive <log-directory>
```

### Parameters

- `<log-directory>`: The directory containing logs to archive

### Examples

Archive system logs:
```bash
sudo log-archive /var/log
```

Archive application logs:
```bash
log-archive /path/to/app/logs
```

## Output

- Archives are stored in `/var/archives/logs/` with filenames like `logs_YYYYMMDD_HHMMSS.tar.gz`
- Archive operations are logged to `/var/archives/logs/archive_history.log`

## Log Format

Each log entry in the history file follows this format:
```
[YYYY-MM-DD HH:MM:SS] Archive created: /var/archives/logs/logs_YYYYMMDD_HHMMSS.tar.gz from /path/to/logs
```

## Permissions

The script may require elevated permissions (sudo) in these cases:
- When archiving system logs (e.g., `/var/log`)
- When writing to `/var/archives/logs/` (default location)
- When modifying the log history file

## Customization

To change the default archive location or log file, edit these variables in the script:
- `ARCHIVE_DIR`: Directory where archives are stored
- `LOG_FILE`: Path to the archive history log file

## Troubleshooting

- **"Directory does not exist"**: Verify the path to the log directory
- **"Failed to create archive directory"**: Check permissions for creating directories
- **"Failed to create log file"**: Check permissions for creating files
- **"Failed to create archive"**: Verify disk space and permissions

## License

This tool is provided under the MIT License.
