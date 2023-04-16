#!/bin/bash
# copy-from-remote-server.sh - Copy files from a remote server using rsync.

# Usage: copy-from-remote-server.sh CONFIG_FILE FILTER_FILE
#
# CONFIG_FILE should contain the following variables:
#   REMOTE_SERVER: Remote hostname or IP address.
#   REMOTE_PATH: Path to the remote directory containing files to copy.
#   LOCAL_PATH: Path to the local directory where files will be copied.
#
# FILTER_FILE should contain the filters to be used for the rsync command.
#
# Example:
#   ./copy-from-remote-server.sh /path/to/copy_configs/test1.cfg /path/to/filter_file.txt

# Check if configuration file and filter file are provided
if [ $# -lt 2 ]; then
  echo "Usage: $0 CONFIG_FILE FILTER_FILE"
  exit 1
fi

# Load configuration
source "$1"

# Check if required variables are set
if [ -z "$REMOTE_SERVER" ] || [ -z "$REMOTE_PATH" ] || [ -z "$LOCAL_PATH" ]; then
  echo "One or more required variables are not set in configuration file $1."
  echo "To set REMOTE_SERVER, please set the remote server's address."
  echo "To set REMOTE_PATH, please set the path to the remote directory containing files to copy."
  echo "To set LOCAL_PATH, please set the path to the local directory where files will be copied."
  exit 1
fi

# Check if filter file exists
if [ ! -f "$2" ]; then
  echo "Filter file $2 does not exist."
  exit 1
fi

# Copy files from remote server
rsync -avh --filter="merge $2" "$REMOTE_SERVER:$REMOTE_PATH" "$LOCAL_PATH"

