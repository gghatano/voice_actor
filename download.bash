#!/bin/bash

[ -d "result" ] || mkdir result

for profile in `cat ./va_link.txt`
do
  number=$(echo $profile | awk -F"/" '{print $4}')
  curl $profile > result/$number".html"
done
