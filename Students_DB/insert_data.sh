#!/bin/bash
#Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
cat courses_test.csv | while IFS="," read MAJOR COURSE
do
if [[ $MAJOR != 'major' ]]
then
  #get major_id
  MAJOR_ID=$($PSQL "SELECT major_id from majors where major='$MAJOR';")
  #if not found
  if [[ -z $MAJOR_ID ]]
  then
    #insert major
    INSERT_MAJOR_RESULT=$($PSQL "insert into majors(major) values('$MAJOR');")
    if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted into majors, $MAJOR"
    fi
    #get new major_id
    MAJOR_ID=$($PSQL "SELECT major_id from majors where major='$MAJOR';")
  fi
fi

#get course_id
COURSE_ID=$($PSQL "SELECT course_id from courses where course='$COURSE';")
#if not found
if [[ -z $COURSE_ID ]]
then
  #insert course
  INSERT_COURSE_RESULT=$($PSQL "insert into courses(course) values('$COURSE');")

  #get new course_id
fi
#insert into majors_courses
done