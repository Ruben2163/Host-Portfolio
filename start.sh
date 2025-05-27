set -e

echo "[*] Starting SSH agent..."
eval $(ssh-agent -s)

chmod 600 /root/.ssh/id_rsa

ssh-add /root/.ssh/id_rsa

# Trust GitHub's host key
mkdir -p /root/.ssh
ssh-keyscan github.com >> /root/.ssh/known_hosts

# Clone your private Hugo repo
echo "[*] Cloning Hugo site..."
git clone --depth=1 --branch main git@github.com:ruben2163/portfolio.git hugo-site
cd hugo-site

echo "[*] Building site..."
hugo

echo "[*] Copying to Nginx html dir..."
rm -rf /var/lib/nginx/html
mkdir -p /var/lib/nginx/html
cp -r public/* /var/lib/nginx/html/

# Start the Nginx pid and instruct process

echo "[*] Launching Nginx..."
nginx -g "daemon off;"
