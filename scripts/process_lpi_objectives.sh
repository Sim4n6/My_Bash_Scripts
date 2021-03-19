#!/bin/bash

sqlite3 topics.db "DROP TABLE IF EXISTS topics;"
sqlite3 topics.db "CREATE TABLE IF NOT EXISTS topics (topicID INTEGER PRIMARY KEY AUTOINCREMENT, topic VARCHAR(255), weight INTEGER, desc VARCHAR(255) );"

declare -a topics;
declare -a weights;
declare -a descr;

cat weight_topics.txt | grep -E "^[0-9].[0-9]" > topics_title.txt
cat weight_topics.txt | grep "Weight:" | tr -d " " | cut -d ":" -f2  > weights.txt
cat weight_topics.txt | grep "Description:" | cut -d ":" -f2 > descriptions.txt

i=0
while read -r line; do 
topics[$i]=$line;
i=$(( $i+1 ))
done < topics_title.txt

i=0
while read -r line;
do 
    weights[$i]=$line
    i=$(( $i+1 ))
done < weights.txt;

i=0
while read -r line;
do
descr[$i]=$line
i=$(( $i+1 ))
done < descriptions.txt;


i=0
for e in "${topics[@]}";do 
    echo $e;
    sql="INSERT INTO topics (topic, weight, desc) VALUES (\"${topics[$i]}\",\"${weights[$i]}\", \"${descr[$i]}\" );"
    sqlite3 topics.db "$sql"
    i=$(( $i+1 ))
done;

rm topics_title.txt weights.txt descriptions.txt