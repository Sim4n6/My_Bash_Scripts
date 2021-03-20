#!/bin/bash

if [ $# -eq 1 ]; then 
    notes_fichier="$1"
else
    read -r -p "Merci de fournir le nom du fichier contenant les notes des élèves : " notes_fichier
fi

if [ ! -f "$notes_fichier" ]; then
    echo "Erreur, fichier $notes_fichier non trouvable."
    exit 1
fi

while read -r ligne; do
    student=$(echo "$ligne"| cut -d" " -f1)
    A=$(echo "$ligne"| cut -d" " -f2)
    B=$(echo "$ligne"| cut -d" " -f3)
    C=$(echo "$ligne"| cut -d" " -f4)
    echo "la moyenne de $student est $(( (A+B+C)/3 ))";
done < "$notes_fichier";

