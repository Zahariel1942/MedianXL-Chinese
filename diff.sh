# /bin/bash

diffFile() {
echo $1 >> output.txt
awk '{print $1}' src/ENG/$1.txt > .tmp/eng.txt
awk '{print $1}' src/CHI/$1.txt > .tmp/chi.txt
sdiff -l .tmp/eng.txt .tmp/chi.txt | cat -n| grep -v -e '($' >> output.txt
rm -rf .tmp/eng.txt
rm -rf .tmp/chi.txt
echo "------------------------------------------------------" >> output.txt
}

rm -rf output.txt
touch output.txt
diffFile String
diffFile ExpansionString
diffFile PatchString