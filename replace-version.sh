# /bin/bash

version=$1
game=`echo $version | cut -d \_ -f 1`
patch=`echo $version | cut -d \_ -f 2`
buildTime=$(date +"%Y-%m-%d %T")

echo "Version: ${game}_${patch}"
echo "Time: "$buildTime

sed -i -e "s/## ongoing/## ${version} (${buildTime})/g" ./CHANGELOG.md

sed -i -e "s/{{patch}}/${patch}/g" ./src/CHI/ExpansionString.txt
sed -i -e "s/{{game}}/${game}/g" ./src/CHI/ExpansionString.txt

sed -i -e "s/{{patch}}/${patch}/g" ./public/index.html
sed -i -e "s/{{game}}/${game}/g" ./public/index.html
sed -i -e "s/{{buildTime}}/${buildTime}/g" ./public/index.html

