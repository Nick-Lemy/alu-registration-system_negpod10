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
# Function to delete a student record by ID
delete_student() {
  echo "Enter student ID to delete:"
  read student_id

  if [ -f "$STUDENT_FILE" ]; then
    # Display the student record that will be deleted for debugging
    echo "Deleting student record:"
    grep "^$student_id," "$STUDENT_FILE"

    # Use grep to filter out the student record and save the output to a temporary file
    grep -v "^$student_id," "$STUDENT_FILE" > temp.txt

    # Check if the temp file was created and is not empty before moving it
    if [ -s temp.txt ]; then
      mv temp.txt "$STUDENT_FILE"
      echo "Student record deleted successfully!"
    else
      echo "No matching student record found or temporary file is empty. No changes made."
    fi
  else
    echo "No student records found."
  fi
}
# Function to update a student record by ID
update_student() {
  echo "Enter student ID to update:"
  read student_id

  if [ -f $STUDENT_FILE ]; then
    echo "Enter new student email:"
    read new_email
    echo "Enter new student age:"
    read new_age

    grep -v "^$student_id," $STUDENT_FILE > temp.txt
    echo "$student_id,$new_email,$new_age" >> temp.txt
    mv temp.txt $STUDENT_FILE
    echo "Student record updated successfully!"
  else
    echo "No student records found."
  fi
}
# Function to save sorted emails 
save_sorted_emails() {
  if [ -f $STUDENT_FILE ]; then
    cut -d',' -f2 $STUDENT_FILE | sort > $SORTED_EMAILS_FILE
    echo "Student emails saved in sorted order to $SORTED_EMAILS_FILE"
  else
    echo "No student records found."
  fi
}

menu() {
  while true; do
    clear
    echo "************************************************"
    echo "***************Welcome to our App***************"
    echo "************************************************"
    echo ""
    echo "What would you like to do today?"
    echo ""
    echo "               Main Menu"
    echo "----------------------------------"
    echo "1. Add New Student"
    echo "2. View ALL Students"
    echo "3. Update Student"
    echo "4. Delete Student"
    echo "5. Save Student Email Sorted in ASC"
    echo "6. Exit"
    echo "----------------------------------"
    echo "Enter your choice (1-6):"
    read choice

    case $choice in
      1) create_student ;;
      2) view_students ;;
      3) update_student ;;
      4) delete_student ;;
      5) save_sorted_emails ;;
      6) exit 0 ;;
      *) echo "Invalid choice! Please enter a number between 1 and 6." ;;
    esac
    echo "Press Enter to continue..."
    read
  done
}

# Start the application right now!
menu
