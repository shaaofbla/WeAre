#!/bin/bash

export LD_LIBRARY_PATH=.
./mjpg_streamer -o "output_http.so -p 8080 -w ./www" -i "input_raspicam.so -x 400 -y 480 -fps 20 -ex night"

echo "Stream from camera A is running."
