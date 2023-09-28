#!/bin/bash

# Verifique se a unidade está montada
if ! mount | grep -q "GDrive"; then
    # A unidade não está montada, então monte-a
    rclone mount google-drive: ~/GDrive --daemon
else
    echo "A unidade já está montada."
fi