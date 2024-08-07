#!/bin/bash
# install.sh

sudo apt-get update
sudo apt-get install -y nginx git wget
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
git clone https://github.com/devopsinsiders/ReactTodoUIMonolith.git
cd ReactTodoUIMonolith
sudo sed -i "s|const API_BASE_URL = .*|const API_BASE_URL = \"http://${frontend_ip}:80/api\";|" src/config.js
npm install
npm run build
sudo cp -r build/* /var/www/html/
sudo sed -i "/root \/var\/www\/html;/i \\
location /api {\\n\
    proxy_pass http://${backend_ip}:8000;\\n\
    proxy_set_header Host \$host;\\n\
    proxy_set_header X-Real-IP \$remote_addr;\\n\
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;\\n\
    proxy_set_header X-Forwarded-Proto \$scheme;\\n\
}" /etc/nginx/sites-available/default
sudo systemctl restart nginx
