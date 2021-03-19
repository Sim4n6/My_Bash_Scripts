#!/bin/bash

dbname="objectives.db"
sqlite3 "$dbname" "DROP TABLE IF EXISTS topics;"
sqlite3 "$dbname" "CREATE TABLE IF NOT EXISTS topics (topicID INTEGER PRIMARY KEY AUTOINCREMENT, topic VARCHAR(255), weight INTEGER, desc VARCHAR(255) );"

declare -a topics;
declare -a weights;
declare -a descr;

tmpdir=$(mktemp -d)

grep -E "^[0-9].[0-9]" weight_topics.txt  > "$tmpdir"/topics_title.txt
grep "Weight:" weight_topics.txt  | tr -d " " | cut -d ":" -f2  > "$tmpdir"/weights.txt
grep "Description:" weight_topics.txt  | cut -d ":" -f2 > "$tmpdir"/descriptions.txt

i=0
while read -r line; do 
topics[$i]=$line;
i=$(( i+1 ))
done < "$tmpdir"/topics_title.txt

i=0
while read -r line;
do 
    weights[$i]=$line
    i=$(( i+1 ))
done < "$tmpdir"/weights.txt;

i=0
while read -r line;
do
descr[$i]=$line
i=$(( i+1 ))
done < "$tmpdir"/descriptions.txt;


i=0
for e in "${topics[@]}"; do 
    echo "$e";
    sql="INSERT INTO topics (topic, weight, desc) VALUES (\"${topics[$i]}\",\"${weights[$i]}\", \"${descr[$i]}\" );"
    sqlite3 "$dbname" "$sql"
    i=$(( i+1 ))
done;

echo "Results :"
sql="SELECT * FROM topics ORDER BY topics.weight DESC;"
sqlite3 $dbname "$sql"

rm "$tmpdir"/topics_title.txt "$tmpdir"/weights.txt "$tmpdir"/descriptions.txt