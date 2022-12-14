# /bin/bash

rm -rf .tmp
mkdir .tmp
rm -rf dest
mkdir dest

collectOutput() {
mv d2tbl_ouput.tbl .tmp/$1.tbl
}

tools/d2tbl.exe -import src/CHI/String.txt -ansi -always-insert
collectOutput String
tools/d2tbl.exe -import src/CHI/PatchString.txt -ansi -always-insert
collectOutput PatchString
tools/d2tbl.exe -import src/CHI/ExpansionString.txt -ansi -always-insert
collectOutput ExpansionString

cp origin/lang-zh.mpq .tmp

tools/MPQEditor.exe delete .tmp/lang-zh.mpq "data\local\LNG\CHI\String.tbl"
tools/MPQEditor.exe delete .tmp/lang-zh.mpq "data\local\LNG\CHI\PatchString.tbl"
tools/MPQEditor.exe delete .tmp/lang-zh.mpq "data\local\LNG\CHI\ExpansionString.tbl"
tools/MPQEditor.exe add .tmp/lang-zh.mpq ".tmp/*.tbl" "data\local\LNG\CHI" /auto

mv .tmp/lang-zh.mpq dest