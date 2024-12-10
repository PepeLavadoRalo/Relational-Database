#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
# Extraer nombres de equipos únicos del archivo games.csv
cat games.csv | tail -n +2 | cut -d ',' -f 3,4 | tr ',' '\n' | sort | uniq | while read TEAM
do
  # Insertar cada equipo en la tabla teams
  echo "$($PSQL "INSERT INTO teams (name) VALUES ('$TEAM') ON CONFLICT (name) DO NOTHING")"
done
# Insertar los juegos en la tabla games
cat games.csv | tail -n +2 | while IFS=',' read year round winner opponent winner_goals opponent_goals
do
  # Obtener los team_id de los equipos
  winner_id=$($PSQL "SELECT team_id FROM teams WHERE name = '$winner'")
  opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name = '$opponent'")

  # Insertar el juego en la tabla games
  echo "$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
                 VALUES ($year, '$round', $winner_id, $opponent_id, $winner_goals, $opponent_goals)")"
done