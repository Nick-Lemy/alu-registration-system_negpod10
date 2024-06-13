# Define the files to be moved
FILES=("students-list_0524.txt" "student-emails.txt" "main.sh" "select-emails.sh" "backup-Negpod_10.sh")

# Move each file to the target directory
for FILE in "${FILES[@]}"; do
  if [ -f $FILE ]; then
    mv $FILE $TARGET_DIR/
    echo "Moved $FILE to $TARGET_DIR"
  else
    echo "File $FILE d
