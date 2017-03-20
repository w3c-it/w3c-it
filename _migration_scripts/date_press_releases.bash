#!/bin/bash

for file in */*.html; do
    echo "Processing ${file}"

    DATE="$(egrep "^date:" $file | cut -f 2 -d " ")"
    echo "  D: ${DATE}"

    BASENAME="$(basename ${file})"
    echo "  B: ${BASENAME}"

    NEW_FILENAME="${DATE}-${BASENAME}"
    echo "  N: ${NEW_FILENAME}"

    cp $file $NEW_FILENAME
    echo "  C: ${file} --> ${NEW_FILENAME}"
done
