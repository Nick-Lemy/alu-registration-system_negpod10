#!/bin/bash
# Define variables
NEGPOD_ID="1"  # Replace with your specific negpod ID
DIRECTORY="negpod_${NEGPOD_ID}-q1"
REMOTE_USER="15f4a6008116"
REMOTE_HOST="15f4a6008116.7b3ea1d9.alu-cod.online"
REMOTE_PASSWORD="e4256437b4f77fd2feb8"
REMOTE_PATH="/summative/0524-2024m"
# Check if the local directory exists
if [ ! -d "$LOCAL_DIR" ]; then
    echo "Directory $LOCAL_DIR does not exist."
    exit 1
fi

# Use expect to automate the password entry for scp
expect <<EOF
spawn scp -r $LOCAL_DIR ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}
expect {
    "password:" {
        send "$REMOTE_PASS\r"
        exp_continue
    }
    eof
}
EOF

# Check if the scp command was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
else
    echo "Backup failed."
fi
