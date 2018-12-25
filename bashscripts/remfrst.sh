#! /bin/bash
for f in input*; do
    tail -n +2 "$f" > "${f}".tmp && mv "${f}".tmp "$f"
    echo "Processing $f"
done

for f in output*; do
    tail -n +2 "$f" > "${f}".tmp && mv "${f}".tmp "$f"
    echo "Processing $f"
done

for file in input*; do
  [ -f "$file" ] &&
    length=$(tail -n 1 "$file" | wc -c) &&
    [ "$length" -gt 0 ] &&
    truncate -s "-$length" "$file"
done

for file in output*; do
  [ -f "$file" ] &&
    length=$(tail -n 1 "$file" | wc -c) &&
    [ "$length" -gt 0 ] &&
    truncate -s "-$length" "$file"
done

