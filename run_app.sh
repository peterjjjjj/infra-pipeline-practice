#!/bin/bash

VENV_DIR="venv"
APP_FILE="app.py"

#Venv.
if [ -d venv ]; then
    echo "Venv exists"
else
  echo "Venv not found, creating one."
  python3 -m venv "$VENV_DIR"
fi

source venv/bin/activate

#pip show flask > /dev/null 2>&1
#if [ $? -ne 0 ]; then
#    echo "Flask not installed, installing."
#    pip install -r requirements.txt
#fi

#Dependencies check
MISSING=$(comm -23 <(sort requirements.txt) <(pip freeze | sort))
if [ -n "$MISSING" ]; then
  echo "Packages missing: $MISSING"
  pip install -r requirements.txt
else
  echo "Requirements installed."
fi

#Execution
echo "Starting app."
cd "$(dirname "$0")"
python3 $APP_FILE

deactivate