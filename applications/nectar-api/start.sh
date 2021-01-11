#!/bin/bash

echo "start script got public address $PUBLIC_ADDRESS"
cd $ARTIFACTS_PATH
python3 nectar-api.py > /dev/null &
