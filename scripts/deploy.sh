#!/bin/bash

# Navigate to the Hugo site directory
cd ../hugo-site || exit

# Build the Hugo site
hugo

# Copy the generated public files to the web server directory
sudo cp -r public/* /var/www/html/

# Restart the Nginx service to apply changes
sudo systemctl restart nginx

echo "Deployment completed successfully."