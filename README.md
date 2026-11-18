# Log-Archive-Tool

A simple Bash command-line tool that compresses `.log` files from a specified directory into a timestamped `.tar.gz` archive and stores it in a custom destination folder.

This project is a solution to the [Log Archive Tool](https://roadmap.sh/projects/log-archive-tool) challenge from **roadmap.sh**.

## Features
* **CLI Argument Support:** Accepts the target log directory directly as a command-line argument.
* **Interactive Prompts:** Allows you to choose the destination folder and custom archive name at runtime.
* **Timestamped Compression:** Bundles all `.log` files into a `.tar.gz` archive named with the exact date and time (`YYYY-MM-DD--HH-MM-SS`).
* **Audit Logging:** Records the date and time of the archive creation inside a `date_and_time_archive.txt` file in the destination folder.

## Prerequisites
* A Unix-like environment (Linux, macOS, or WSL on Windows)
* **Bash** shell
* Standard utilities: `tar` and `date`

## Installation
1. Clone this repository:
   ```bash
   git clone https://github.com
   ```
2. Navigate to the project directory:
   ```bash
   cd YOUR-REPO-NAME
   ```
3. Make the script executable:
   ```bash
   chmod +x log-archive.sh
   ```

## Usage
Run the script from the terminal by passing the path to the directory containing your `.log` files as an argument:

```bash
./log-archive.sh /path/to/logs
```

### Example
```bash
\$ ./log-archive.sh /var/log
Insert New Directory for the '.tar' file: /home/user/archived_logs
Insert the name for the new '.tar' file: system_backup
```

### Output
After execution, your destination directory (`/home/user/archived_logs`) will contain:
* `system_backup_2026-11-18--16-30-00.tar.gz` — The compressed archive containing all `.log` files.
* `date_and_time_archive.txt` — A text file logging the timestamp of the operation.
