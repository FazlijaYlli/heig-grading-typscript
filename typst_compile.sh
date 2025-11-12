#!/bin/bash

mkdir feedbacks
mkdir feedbacks/pdf

python generate_reports.py

cd feedbacks
# Loop through all files matching the pattern
for file in *.typ; do
  # Check if file exists to avoid errors when no match is found
  if [[ -f "$file" ]]; then
    basename="${file%.*}"
    echo "Compiling $file..."
    typst compile --root .. -f pdf "$file" "pdf/$basename.pdf"
  fi
done

echo "All reports files have been compiled."