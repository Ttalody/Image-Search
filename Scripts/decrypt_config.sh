#!/bin/bash

if [ ! -f Config.plist ]; then
    echo "Decrypting Config.plist..."
    openssl enc -aes-256-cbc -d -in Config.plist.enc -out Config.plist -k 12345
else
    echo "Config.plist already exists."
fi