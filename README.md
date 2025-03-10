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

1. Clone this repository:
   ```bash
   git clone https://github.com/MiguelTolino/log-archive.git
   ```

2. Change to the project directory:
   ```bash
   cd log-archive
   ```

3. Rename the script and make it executable:
   ```bash
   mv log-archive.sh log-archive
   chmod +x log-archive
   ```

4. Move to a directory in your PATH (e.g., `/usr/local/bin/`):
   ```bash
   sudo mv log-archive /usr/local/bin/
   ```

5. Verify it's in your PATH:
   ```bash
   which log-archive
   ```

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

## Project URL
[Project Subject](https://roadmap.sh/projects/log-archive-tool)
