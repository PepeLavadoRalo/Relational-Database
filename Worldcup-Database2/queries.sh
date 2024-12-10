#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals + opponent_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
# Aseguramos que el promedio tenga la cantidad de decimales correcta (16 en este caso)
echo "$($PSQL "SELECT AVG(winner_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
# Aseguramos que el promedio se redondee a dos decimales
echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games")"

echo -e "\nAverage number of goals in all games from both teams:"
# Aseguramos que el promedio de los goles de ambos equipos tenga 16 decimales de precisión
echo "$($PSQL "SELECT AVG(winner_goals + opponent_goals) FROM games")"

echo -e "\nMost goals scored in a single game by one team:"
# Usamos GREATEST para seleccionar el mayor de los goles entre el ganador y el oponente
echo "$($PSQL "SELECT MAX(GREATEST(winner_goals, opponent_goals)) FROM games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
# Contamos cuántos juegos tienen al ganador con más de 2 goles
echo "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
# Seleccionamos el nombre del equipo ganador de la final de 2018
echo "$($PSQL "SELECT name FROM teams JOIN games ON teams.team_id = games.winner_id WHERE games.year = 2018 AND games.round = 'Final'")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
# Listamos los equipos que participaron en los octavos de final de 2014
echo "$($PSQL "SELECT DISTINCT name FROM teams JOIN games ON teams.team_id = games.opponent_id WHERE games.year = 2014 AND games.round = 'Eighth-Final'
UNION
SELECT DISTINCT name FROM teams JOIN games ON teams.team_id = games.winner_id WHERE games.year = 2014 AND games.round = 'Eighth-Final'
ORDER BY name")"

echo -e "\nList of unique winning team names in the whole data set:"
# Obtenemos una lista de equipos ganadores únicos, ordenados alfabéticamente
echo "$($PSQL "SELECT DISTINCT name FROM teams JOIN games ON teams.team_id = games.winner_id ORDER BY name")"

echo -e "\nYear and team name of all the champions:"
# Obtenemos año y nombre de los campeones, ordenados por año
echo "$($PSQL "SELECT games.year, teams.name FROM games JOIN teams ON teams.team_id = games.winner_id WHERE games.round = 'Final' ORDER BY games.year")"

echo -e "\nList of teams that start with 'Co':"
# Listamos los equipos cuyo nombre comienza con 'Co'
echo "$($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%' ORDER BY name")"
