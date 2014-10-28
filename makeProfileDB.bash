#!/bin/bash

[ -f "res.txt" ] && rm res.txt

for file in `ls ./result`
do
  cat result/$file | 
  grep -A 10 'id="db"' | 
  grep -B 10 '/div' | 
  gsed -e 's;</dd>[^<]\+<dt>;\n;g' -e 's:</dt><dd>:;:g' -e 's:</dt>[^<]\+:;:g' | 
  awk -F ";" -v OFS=";" '{if(NF>1)print $1, $2}'  |
  sed -e 's/<[^>]*>//g' | 
  sed -e 's/名前/NAME/' -e 's/よみ/YOMI/' -e 's/ローマ字/ROME/' -e 's/ニックネーム/NICKNAME/' -e 's/誕生日/BIRTHDAY/' -e 's/年齢/AGE/' -e 's/出身地/PLACE/' -e 's/星座/STAR/' -e 's/趣味/HOBBY/' -e 's/特技/SPECIAL/' -e 's/好きなもの/LIKE/' -e 's/嫌いなもの/DISLIKE/' -e 's/血液型/BLOOD/' -e 's/身長/HEIGHT/' -e 's/別名/OTHER/'|
  grep -E '(NAME|YOMI|ROME|NICKNAME|BIRTHDAY|AGE|PLACE|STAR|HOBBY|SPECIAL|LIKE|DISLIKE|BLOOD|HEIGHT|OTHER)' | 
  sed -e 's/^[^A-Z]*\([A-Z]\)/\1/' > tmp.txt
  NAME=$(cat ./tmp.txt | awk -F";" '{if(NR==1)print $2}')
  cat ./tmp.txt | 
  sed "s/^/$NAME;/" >> res.txt
done
