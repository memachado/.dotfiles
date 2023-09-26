#!/bin/bash

# [Unit]
# Description=Rclone Mount Service
# After=network.target

# [Service]
# ExecStart=/path/to/rclone-mount.sh
# Restart=always
# User=<seu_usuário>
# Group=<seu_grupo>

# [Install]
# WantedBy=default.target

# /usr/bin/rclone mount google-drive:KeePass /home/miguel/Documents/KeePass --daemon