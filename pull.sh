#!/bin/bash

# Check if tag argument is provided
if [ -z "$1" ]
    then
        echo "Please provide a tag string as an argument"
        exit 1
fi

# Construct download URL
tag=$1
mxlurl="https://get.median-xl.com/get.php?type=mxl_beta&tag=$tag&file=MXL.mpq"
langurl="https://github.com/Zahariel1942/MedianXL-Chinese/releases/latest/download/Release.zip"
tmp=$(mktemp -d)

# Download files
echo "Downloading $mxlurl"
curl -L -o "$tmp/MXL.mpq" $mxlurl
echo "Downloading $langurl"
curl -L -o "$tmp/Release.zip" "$langurl"
echo "Extracting..."
unzip -o "$tmp/Release.zip" -d "$tmp"

# Move files to origin directory
mkdir -p origin
mv "$tmp/MXL.mpq" "$tmp/lang-zh.mpq" origin/
echo "Files moved to origin directory"

# Clean up temporary directory
rm -rf "$tmp"
echo "Temporary directory removed"