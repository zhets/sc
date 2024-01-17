#!/bin/bash

TOKEN="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"
cd /sdcard/BUAT_DEC/scku-main
git config --global user.email "Mfvstore1@gmail.com" &> /dev/null
git config --global user.name "zhets" &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
git add * &> /dev/null
git commit -m "Add files via upload" &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/zhets/izinsc
git push -f https://${TOKEN}@github.com/zhets/izinsc.git &> /dev/null
cd