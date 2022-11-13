# /bin/bash

diffFile() {
echo $1"\n" >> output.txt
awk '{print $1}' src/ENG/$1.txt > .tmp/eng
awk '{print $1}' src/CHI/$1.txt > .tmp/chi
sdiff -l .tmp/eng .tmp/chi | cat -n| grep -v -e '($' >> output.txt
rm -rf .tmp/eng
rm -rf .tmp/chi
echo "------------------------------------------------------" >> output.txt
}

rm -rf output.txt
touch output.txt
diffFile String
diffFile ExpansionString
diffFile PatchString