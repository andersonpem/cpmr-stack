#!/usr/bin/env bash
echo "Copying the .env file..."
cp .env.example .env
echo "Creating the redis-secret file..."
cp redis-secret.example.txt redis-secret.txt
DIR="./code"
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "The code directory exists. Skipping"
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "Making the code directory..."
  mkdir code
fi
echo "Startup files copied. Edit what's necessary. Happy coding!"