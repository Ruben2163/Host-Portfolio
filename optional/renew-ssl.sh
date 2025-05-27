#!/bin/bash

# This script automates the renewal process for SSL certificates using Certbot.

# Define the domains for which the SSL certificates need to be renewed
DOMAINS=("example.com" "www.example.com")

# Renew the SSL certificates
certbot renew --quiet

# Reload the web server to apply the renewed certificates
systemctl reload nginx

echo "SSL certificates renewed and Nginx reloaded."