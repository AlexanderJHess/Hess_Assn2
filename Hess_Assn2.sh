#! /bin/bash
#note that this script operates on the assumption that you are currently in a 
#working directory with BTS_data.txt

#create child script
touch childscript.sh

#provide appropriate permissions for child script
chmod u+x childscript.sh

#write commands to child script to manipulate BTS_data.txt
echo "grep -E BTS0[1-8] BTS_data.txt | cut -f1,2,4 | sort -k3rg > sorted.txt" >> childscript.sh
echo "head -1 BTS_data.txt | cut -f1,2,4 > header.txt" >> childscript.sh
echo "cat header.txt sorted.txt > Hess_Final.txt" >> childscript.sh
echo "head Hess_Final.txt" >> childscript.sh

#Compress final file
echo "gzip Hess_Final.txt" >> childscript.sh

#remove intermediate files
echo "rm header.txt" >> childscript.sh
echo "rm sorted.txt" >> childscript.sh

#execute child script
./childscript.sh