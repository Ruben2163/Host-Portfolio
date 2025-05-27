#!/bin/bash

# Update the package list
sudo apt update

# Install Hugo
sudo apt install -y hugo

# Install Nginx
sudo apt install -y nginx

# Enable and start Nginx service
sudo systemctl enable nginx
sudo systemctl start nginx

# Create necessary directories for the Hugo site
mkdir -p ~/hugo-site

# Set permissions
sudo chown -R $USER:$USER ~/hugo-site

echo "Setup completed. Hugo and Nginx have been installed and configured."