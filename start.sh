set -e

echo "[*] Starting SSH agent..."
eval $(ssh-agent -s)
chmod 600 /root/.ssh/id_rsa
ssh-add /root/.ssh/id_rsa

# Ensure GitHub host key is known
mkdir -p /root/.ssh
ssh-keyscan github.com >> /root/.ssh/known_hosts

echo "[*] Cloning repo..."
git clone --depth=1 --branch main git@github.com:Ruben2163/portfolio.git hugo-site

cd hugo-site

echo "[*] Building Hugo site..."
hugo

echo "[*] Moving public files to Nginx root..."
rm -rf /var/lib/nginx/html
mkdir -p /var/lib/nginx/html
cp -r public/* /var/lib/nginx/html/

echo "[*] Starting Nginx..."
nginx -g "daemon off;"