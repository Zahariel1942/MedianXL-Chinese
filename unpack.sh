# /bin/bash

rm -rf .tmp
mkdir .tmp .tmp/CHI .tmp/ENG

tools/MPQEditor.exe extract origin/lang-zh.mpq "data\local\LNG\CHI\*.tbl" .tmp/CHI
tools/MPQEditor.exe extract origin/MXL.mpq  "data\local\LNG\ENG\*.tbl" .tmp/ENG
tools/d2tbl.exe -export .tmp/CHI/String.tbl -o src/CHI/String.txt
tools/d2tbl.exe -export .tmp/CHI/PatchString.tbl -o src/CHI/PatchString.txt
tools/d2tbl.exe -export .tmp/CHI/ExpansionString.tbl -o src/CHI/ExpansionString.txt
tools/d2tbl.exe -export .tmp/ENG/string.tbl -o src/ENG/String.txt
tools/d2tbl.exe -export .tmp/ENG/patchstring.tbl -o src/ENG/PatchString.txt
tools/d2tbl.exe -export .tmp/ENG/expansionstring.tbl -o src/ENG/ExpansionString.txt