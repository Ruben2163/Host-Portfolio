set -e

echo "[*] Setting up SSH..."
mkdir -p /root/.ssh
chmod 600 /root/.ssh/id_rsa
eval $(ssh-agent -s)
ssh-add /root/.ssh/id_rsa

echo "[*] Adding GitHub to known_hosts..."
ssh-keyscan github.com >> /root/.ssh/known_hosts

echo "[*] Cloning Hugo repo..."
git clone --depth=1 --branch main git@github.com:ruben2163/portfolio.git hugo-site

cd hugo-site
echo "[*] Building site..."
hugo

echo "[*] Serving via Nginx..."
rm -rf /var/lib/nginx/html
mkdir -p /var/lib/nginx/html
cp -r public/* /var/lib/nginx/html/

nginx -g "daemon off;"
