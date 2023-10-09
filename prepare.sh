# /bin/bash

ongoing_str="## ongoing"
patch_str="x	MedianXL: Sigma 中文化补丁包  补丁版本 {{patch}} 适配版本: {{game}}\r"

sed -i "3i\\$ongoing_str\n" CHANGELOG.md
sed -i "1883c\\$patch_str" src/CHI/ExpansionString.txt