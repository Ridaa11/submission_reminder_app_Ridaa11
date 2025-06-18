#!/bin/bash

# Prompt for the new assignment name
read -p "Enter the new assignment name: " new_assignment

# Prompt for the username (to match the existing environment name)
read -p "Enter your name (used during environment setup): " yourname

# Use the same variable name style as in create_environment.sh
var_rida="submission_reminder_${yourname}"

# Check if the directory exists
if [ ! -d "$var_rida" ]; then
    echo "Error: Directory '$var_rida' not found!"
    exit 1
fi

# Path to the config.env file
config_file="${var_rida}/config/config.env"

# Check if config.env exists
if [ ! -f "$config_file" ]; then
    echo "Error: config.env not found in $var_rida/config/"
    exit 1
fi

# Replace the ASSIGNMENT line with the new assignment name
sed -i  "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" "$config_file"

# Confirm update
echo " Assignment updated to \"$new_assignment\" in $config_file"

