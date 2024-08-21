#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo -e "$($PSQL "SELECT SUM(winner_goals + opponent_goals) FROM games;")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo -e "$($PSQL "SELECT AVG(winner_goals) FROM games;")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo -e "$($PSQL "SELECT ROUND(AVG(winner_goals),2) FROM games;")"

echo -e "\nAverage number of goals in all games from both teams:"
echo -e "$($PSQL "SELECT round(AVG(winner_goals)+AVG(opponent_goals),16) FROM games;")"

echo -e "\nMost goals scored in a single game by one team:"
echo -e "$($PSQL "SELECT MAX(winner_goals) FROM games;")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo -e "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2;")"

echo -e "\nWinner of the 2018 tournament team name:"
echo -e "$($PSQL "SELECT T.name from teams T full join games G on T.team_id=G.winner_id where (G.year = 2018 AND G.round = 'Final');")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo -e "$($PSQL "SELECT T.name from teams T full join games G on T.team_id=G.winner_id OR T.team_id=G.opponent_id where (G.year=2014 AND G.round='Eighth-Final') ORDER BY T.name ASC;")"

echo -e "\nList of unique winning team names in the whole data set:"
echo -e "$($PSQL "SELECT D.name FROM (teams T right join (SELECT DISTINCT winner_id FROM games) G on T.team_id=G.winner_id) D ORDER BY D.name ASC;")"

echo -e "\nYear and team name of all the champions:"
echo -e "$($PSQL "SELECT G.year, T.name FROM teams T full join games G on T.team_id=G.winner_id WHERE G.round='Final' ORDER BY G.year ASC;")"
echo -e "\nList of teams that start with 'Co':"
echo -e "$($PSQL "SELECT name FROM teams WHERE name ILIKE 'Co%';")"
