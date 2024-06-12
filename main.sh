#!/usr/bin/env bash
# The negpod 10 Task 1
# File where student records are stored
STUDENT_FILE="students-list_0524.txt"

# Function to create a new student record
create_student() {
  echo "Enter student email:"
  read email
  echo "Enter student age:"
  read age
  echo "Enter student ID:"
  read student_id

  # Save the student record to the file
  echo "$student_id,$email,$age" >> $STUDENT_FILE
  echo "Student record added successfully!"
}

# Function to view all student records
view_students() {
  if [ -f $STUDENT_FILE ]; then
    cat $STUDENT_FILE
  else
    echo "No student records found."
  fi
}
