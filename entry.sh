#!/bin/sh
set -e

export GATSBY_DIR="/site"
export PATH="$PATH:/usr/local/bin/gatsby"

# Initialize Gatsby or run NPM install if needed
if [ ! -f "$GATSBY_DIR/package.json" ]
then
  echo "Initializing Gatsby..."
  gatsby new $GATSBY_DIR

else
  if [ ! -e "$GATSBY_DIR/node_modules/" ]
  then
    echo "Node modules is empty. Running npm install..."
    npm install

  fi

fi

# Decide what to do
if  [ "$1" == "develop" ]
then
  gatsby clean
  gatsby develop --host 0.0.0.0

elif  [ "$1" == "build" ]
then
  gatsby clean
  gatsby build

elif  [ "$1" == "stage" ]
then
  gatsby clean
  gatsby build
  gatsby serve --port 8000

else
  exec $@

fi
