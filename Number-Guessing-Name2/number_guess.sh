#!/bin/bash

# Conectar a la base de datos
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generar un número secreto aleatorio entre 1 y 1000
SECRET_NUMBER=$((RANDOM % 1000 + 1))

# Contador de intentos
GUESS_COUNT=0

# Solicitar el nombre de usuario
echo "Enter your username:"
read USERNAME

# Verificar si el usuario ya existe en la base de datos
USER_EXISTS=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")

if [[ -z $USER_EXISTS ]]; then
  # Si el usuario no existe, crear uno nuevo
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_RESULT=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")
else
  # Si el usuario existe, mostrar información de sus juegos previos
  USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$USERNAME'")
  GAMES_PLAYED=$(echo $USER_INFO | cut -d '|' -f 1)
  BEST_GAME=$(echo $USER_INFO | cut -d '|' -f 2)
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Comenzar el juego
echo "Guess the secret number between 1 and 1000:"
while true; do
  read GUESS
  # Comprobar si la entrada es un número entero
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  # Incrementar el contador de intentos
  ((GUESS_COUNT++))

  # Verificar si la suposición es correcta
  if [[ $GUESS -eq $SECRET_NUMBER ]]; then
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
    
    # Actualizar el número de juegos y el mejor juego
    if [[ -z $USER_EXISTS ]]; then
      UPDATE_RESULT=$($PSQL "UPDATE users SET games_played = 1, best_game = $GUESS_COUNT WHERE username = '$USERNAME'")
    else
      if [[ -z $BEST_GAME ]] || [[ $GUESS_COUNT -lt $BEST_GAME ]]; then
        UPDATE_RESULT=$($PSQL "UPDATE users SET games_played = $((GAMES_PLAYED + 1)), best_game = $GUESS_COUNT WHERE username = '$USERNAME'")
      else
        UPDATE_RESULT=$($PSQL "UPDATE users SET games_played = $((GAMES_PLAYED + 1)) WHERE username = '$USERNAME'")
      fi
    fi

    # Salir del bucle y terminar el juego
    break
  elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
done
