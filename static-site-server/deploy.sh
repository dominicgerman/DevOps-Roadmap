#!/bin/bash

# Load variables from .env file if it exists
if [ -f .env ]; then
    echo "Loading environment variables from .env file..."
    source .env
fi

# Configuration
LOCAL_DIR="./html"
REMOTE_USER="ec2-user"
REMOTE_DIR="/var/www/html"

# Ensure the script exits on errors
set -e

# Ensure the existence of environment variables
if [ -z "$SSH_KEY_PATH" ]; then
    echo "Error: SSH_KEY_PATH is not set. Please provide the path to your SSH private key."
    exit 1
fi

if [ -z "$REMOTE_HOST" ]; then
    echo "Error: REMOTE_HOST is not set. Please provide the remote host (IP or DNS) of the EC2 instance."
    exit 1
fi

echo "Starting deployment..."

rsync -avz --delete \
    -e "ssh -i $SSH_KEY_PATH" \
    "$LOCAL_DIR/" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/"

echo "Restarting httpd on the remote server..."
ssh -i $SSH_KEY_PATH "$REMOTE_USER@$REMOTE_HOST" "sudo systemctl restart httpd"

echo "Deployment complete!"

