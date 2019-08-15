#!/bin/bash
cd
cd Desktop/mjpg-streamer/mjpg-streamer-experimental/

export LD_LIBRARY_PATH=.
./mjpg_streamer -o "output_http.so -p 9090 -w ./www" -i "input_raspicam.so -x 400 -y 480 -fps 20 -ex night"

echo "Stream from camera B is running."

