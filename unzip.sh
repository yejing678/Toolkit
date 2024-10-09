#!/bin/bash

folder="/home/jye/huggingface/datasets/legalbench/"
cd "$folder"

for file in *.zip *.tar.gz *.tar.bz2 *.tar.xz; do
    if [ -e "$file" ]; then
        echo "Extracting $file..."
        case "$file" in
            *.zip) unzip -q "$file" ;;
            *.tar.gz) tar -xzf "$file" ;;
            *.tar.bz2) tar -xjf "$file" ;;
            *.tar.xz) tar -xJf "$file" ;;
        esac
        echo "Done."
    else
        echo "No $file found."
    fi
done
