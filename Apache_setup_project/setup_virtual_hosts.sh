#!/bin/bash

# -------------------------------------------------------------------------
# Project : Apache Virtual Hosts Auto-Setup (CentOS 9)
# Author  : Aniruddha Kharve
# Version : 1.0
# -------------------------------------------------------------------------

# Variables
SITE1="site1.local"
SITE2="site2.local"

DOC_ROOT1="/var/www/${SITE1}/public_html"
DOC_ROOT2="/var/www/${SITE2}/public_html"

VHOST_CONF_DIR="/etc/httpd/conf.d"

# Check if script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "Please run this script as root or using sudo"
   exit 1
fi

echo "Starting Apache Virtual Host setup..."

# Step 1: Install Apache
echo "Installing Apache..."
dnf install httpd -y

# Step 2: Enable & Start Apache
echo "Enabling and starting Apache service..."
systemctl enable httpd
systemctl start httpd

# Step 3: Create website directories
echo "Creating website directories..."
mkdir -p ${DOC_ROOT1}
mkdir -p ${DOC_ROOT2}

# Step 4: Set permissions
echo "Setting permissions..."
chown -R $USER:$USER /var/www/${SITE1}
chown -R $USER:$USER /var/www/${SITE2}
chmod -R 755 /var/www

# Step 5: Create sample index pages
echo "Creating sample index.html files..."
echo "<h1>Welcome to ${SITE1}</h1>" > ${DOC_ROOT1}/index.html
echo "<h1>Welcome to ${SITE2}</h1>" > ${DOC_ROOT2}/index.html

# Step 6: Create Virtual Host config files
echo "Configuring Virtual Hosts..."

cat <<EOF > ${VHOST_CONF_DIR}/${SITE1}.conf
<VirtualHost *:80>
    ServerAdmin webmaster@${SITE1}
    ServerName ${SITE1}
    DocumentRoot ${DOC_ROOT1}
    ErrorLog /var/log/httpd/${SITE1}_error.log
    CustomLog /var/log/httpd/${SITE1}_access.log combined
</VirtualHost>
EOF

cat <<EOF > ${VHOST_CONF_DIR}/${SITE2}.conf
<VirtualHost *:80>
    ServerAdmin webmaster@${SITE2}
    ServerName ${SITE2}
    DocumentRoot ${DOC_ROOT2}
    ErrorLog /var/log/httpd/${SITE2}_error.log
    CustomLog /var/log/httpd/${SITE2}_access.log combined
</VirtualHost>
EOF

# Step 7: Add local DNS entries
echo "Updating /etc/hosts for local domain resolution..."
grep -q "${SITE1}" /etc/hosts || echo "127.0.0.1   ${SITE1}" >> /etc/hosts
grep -q "${SITE2}" /etc/hosts || echo "127.0.0.1   ${SITE2}" >> /etc/hosts

# Step 8: Restart Apache
echo "Restarting Apache service..."
systemctl restart httpd

# Step 9: (Optional) Open firewall port 80
echo "Opening HTTP port in firewall..."
firewall-cmd --permanent --add-service=http
firewall-cmd --reload

# Step 10: Done
echo "Virtual Hosts setup completed successfully."
echo "Test using: curl http://${SITE1} or http://${SITE2}"

