#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
# add winning or opponent team name if it doesn't already exist
if [[ $WINNER != 'winner' ]]
then

# INSERT NEW TEAM NAMES INTO games.csv
  #get team names
  team_id=$($PSQL "SELECT team_id from teams where name='$WINNER';")
  #if not found
  if [[ -z $team_id ]]
  then
    #insert new team name
    insert_team_name=$($PSQL "insert into teams(name) values('$WINNER');")
    if [[ $insert_team_name == "INSERT 0 1" ]]
    then
      echo "Inserted into team names, $WINNER"
    fi
  fi
  #get team names
  team_id=$($PSQL "SELECT team_id from teams where name='$OPPONENT';")
  #if not found
  if [[ -z $team_id ]]
  then
    #insert new team name
    insert_team_name=$($PSQL "insert into teams(name) values('$OPPONENT');")
    if [[ $insert_team_name == "INSERT 0 1" ]]
    then
      echo "Inserted into team names, $OPPONENT"
    fi
  fi
  
# INSERT ROWS INTO games database
 # get winner and opponent ids
  winner_id=$($PSQL "SELECT team_id from teams where name='$WINNER';")
  opponent_id=$($PSQL "SELECT team_id from teams where name='$OPPONENT';")

# insert year, round, winner_goals, opponent_goals directly from csv
  result=$($PSQL "insert into games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) values('$YEAR', '$ROUND','$WINNER_GOALS','$OPPONENT_GOALS',$winner_id, $opponent_id);") 
 # echo $result
  
fi

done