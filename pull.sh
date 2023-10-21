#!/bin/bash

# Check if tag argument is provided
if [ -z "$1" ]
    then
        echo "Please provide a tag string as an argument"
        exit 1
fi

# Check if type argument is provided
if [ -z "$2" ]
    then
        echo "Please provide a type string as an argument"
        exit 1
fi


# Construct download URL
tag=$1
type=$2
mxlurl="https://get.median-xl.com/get.php?type=mxl_$type&tag=$tag&file=MXL.mpq"
langurl="https://github.com/Zahariel1942/MedianXL-Chinese/releases/latest/download/Release.zip"
tmp=".tmp"

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