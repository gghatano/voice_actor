#!/bin/bash

for profile in `cat ./va_link.txt`
do
  curl $profile | 
  grep -A 6 "名前" |  
  tr -d "\n"  | 
  sed -e 's/<[^>]*>/;/g' -e 's/\s\s*/\s/g' |
  awk -F ";" -v OFS=";" '{print $4, $8, $12,$16,$20,$24,$28,$32,$40}' >> res.txt
done
