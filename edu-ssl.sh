#!/bin/bash
# Proxy For Edukasi & Imclass
# ==============================

# Getting Proxy Template
wget -q -O /usr/local/bin/edu-ssl https://raw.githubusercontent.com/andrasurya/aliratuqvpn/main/edussl.py
chmod +x /usr/local/bin/edu-ssl

# Installing Service
cat > /etc/systemd/system/edu-ssl.service << END
[Unit]
Description=Python Edu ssl By AliratuqVPN
Documentation=https://aliratuqvpn.xyz
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/edu-ssl 2086
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable edu-ssl
systemctl restart edu-ssl

clear
