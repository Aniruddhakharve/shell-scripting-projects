# Apache Virtual Hosts Setup on CentOS 9

This project demonstrates how to automate the setup of multiple virtual hosts using Apache on a CentOS 9 system. It uses a Bash script to configure two local websites (`site1.local` and `site2.local`) with custom document roots, logs, and local DNS mappings.

## 🧰 Tech Stack

- CentOS 9 Stream
- Apache HTTP Server (`httpd`)
- Bash Scripting
- Firewalld (optional)

---

## 📂 Project Structure
```bash
├── setup_virtual_hosts.sh # Main automation script
└── /var/www/
├── site1.local/public_html/index.html
└── site2.local/public_html/index.html
```

---

## 🚀 Features

- Installs and starts Apache (`httpd`)
- Creates document roots for each site
- Sets file permissions and ownership
- Generates simple `index.html` files
- Creates virtual host configuration files in `/etc/httpd/conf.d/`
- Adds entries to `/etc/hosts` for local domain resolution
- Opens HTTP port in the firewall
- Restarts Apache to apply changes

---

## ⚙️ How to Use

### 1. Clone the Repository

```bash
git clone https://github.com/<your-username>/apache-virtualhost-centos9.git
cd apache-virtualhost-centos9
```
### 2. Make the Script Executable
```bash
chmod +x setup_virtual_hosts.sh
```
### 3. Run the Script as Root or with Sudo
```bash
sudo ./setup_virtual_hosts.sh
```
### 🔎 Test the Setup
After running the script, you can verify the virtual hosts by running:
```bash
curl http://site1.local
curl http://site2.local
```
### Expected output:
```bash
<h1>Welcome to site1.local</h1>
<h1>Welcome to site2.local</h1>
```
You can also test them via a browser if this is set up in a desktop environment with GUI and a working /etc/hosts mapping.

---
### 🔐 Notes
---
- This setup is intended for local testing and learning only.

- Domain mappings are added to /etc/hosts and will only work on the local machine.

- The script assumes the use of default CentOS 9 firewall (firewalld).

---
🙋‍♂️ Author

Aniruddha Kharve

Linux System Administration & DevOps Enthusiast

- LinkedIn :- https://www.linkedin.com/in/aniruddhakharve/
---
