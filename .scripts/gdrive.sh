#!/bin/bash

# Verifique se a unidade está montada
if ! mount | grep -q "GDrive"; then
    rclone mount google-drive: $HOME/GDrive --daemon
fi