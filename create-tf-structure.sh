#!/bin/bash

# Create root directory and files
mkdir -p terraform
touch terraform/{main.tf,variables.tf,outputs.tf,versions.tf}

# Create modules/network directory and files
mkdir -p terraform/modules/network
touch terraform/modules/network/{main.tf,variables.tf,outputs.tf}

# Create modules/vm directory and files
mkdir -p terraform/modules/vm
touch terraform/modules/vm/{main.tf,variables.tf,outputs.tf}

# Add execute permission to the script (optional)
chmod +x "$0"

echo "Terraform directory structure created successfully!"