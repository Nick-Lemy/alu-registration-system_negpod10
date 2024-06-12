#!/bin/bash

# File where student records are stored
STUDENT_FILE="students-list_0524.txt"
# File to store the student emails
EMAIL_FILE="student-emails.txt"

if [ -f $STUDENT_FILE ]; then
  cut -d ',' -f 2 $STUDENT_FILE > $EMAIL_FILE
  echo "Emails extracted successfully to $EMAIL_FILE"
else
  echo "No student records found."
fi
