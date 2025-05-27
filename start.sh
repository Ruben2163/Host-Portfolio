#!/bin/bash

set -e

echo "[*] Cloning Hugo site..."
git clone --branch "$BRANCH" "$HUGO_REPO" hugo-site

cd hugo-site

echo "[*] Building with Hugo..."
hugo

echo "[*] Moving public files to Nginx root..."
rm -rf /var/lib/nginx/html
mkdir -p /var/lib/nginx/html
cp -r public/* /var/lib/nginx/html/

echo "[*] Starting Nginx..."
nginx -g "daemon off;"
