#!/bin/bash
WORKER_NODES=("10.10.10.41" "10.10.10.42")

# Function to check if sshpass is installed
check_sshpass() {
    if ! command -v sshpass &> /dev/null; then
        echo "sshpass is not installed. Do you want to install it? (y/n)"
        read -r response
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
            sudo apt-get update && sudo apt-get install -y sshpass
        else
            echo "sshpass is required for password-based authentication. Exiting."
            exit 1
        fi
    fi
}

if [ $# -eq 0 ]; then
    echo "Error: No script specified."
    echo "Usage: $0 <path_to_script> [password]"
    exit 1
fi

SCRIPT_TO_EXECUTE=$1
PASSWORD=$2

# Check if password is provided, and if so, check for sshpass
if [ -n "$PASSWORD" ]; then
    check_sshpass
fi

execute_command() {
    if [ -n "$PASSWORD" ]; then
        sshpass -p "$PASSWORD" $@
    else
        $@
    fi
}

for node in "${WORKER_NODES[@]}"
do
    echo "Executing on $node"
    execute_command scp $SCRIPT_TO_EXECUTE nigaash@$node:/tmp/
    if [ -n "$PASSWORD" ]; then
        execute_command ssh nigaash@$node "echo '$PASSWORD' | sudo -S bash /tmp/$(basename $SCRIPT_TO_EXECUTE)"
    else
        execute_command ssh nigaash@$node "sudo -S bash /tmp/$(basename $SCRIPT_TO_EXECUTE)"
    fi
done
