#!/bin/bash
# deploy-to-remote-server.sh - Deploy files to a remote server using rsync.

# Usage: deploy-to-remote-server.sh CONFIG_FILE
# 
# CONFIG_FILE should contain the following variables:
#   REMOTE_HOST: Remote hostname or IP address.
#   REMOTE_DIR: Path to the remote directory where files will be deployed.
#   DEPLOY_DIR: Path to the local directory containing files to be deployed.
#
# Example:
#   ./deploy-to-remote-server.sh /path/to/deploy_configs/test1.cfg

# Check if configuration file is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 CONFIG_FILE"
  exit 1
fi

# Load configuration
source "$1"

# Check if required variables are set
if [ -z "$REMOTE_HOST" ] || [ -z "$REMOTE_DIR" ] || [ -z "$DEPLOY_DIR" ]; then
  echo "One or more required variables are not set in configuration file $1."
  echo "To set REMOTE_HOST, run the following command on the remote machine to get the hostname:"
  echo "hostname"
  echo "To set REMOTE_DIR, please set the path to the remote directory."
  echo "To set DEPLOY_DIR, please set the path to the directory of files to deploy."
  exit 1
fi

# Connect to remote server and deploy code
rsync -avz --exclude '.DS_Store' --exclude 'node_modules' --exclude '.git' --exclude '.gitignore' "${DEPLOY_DIR}" ${REMOTE_HOST}:${REMOTE_DIR}

