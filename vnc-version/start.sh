#!/bin/bash

# Start virtual display
Xvfb :1 -screen 0 1024x768x16 &> /tmp/xvfb.log &
export DISPLAY=:1.0

# Start window manager + Chromium
fluxbox &> /tmp/fluxbox.log &
chromium-browser --no-sandbox --disable-gpu &> /tmp/chromium.log &

# Start VNC + noVNC
x11vnc -forever -usepw -display :1.0 -rfbport 5900 -passwd 1234 &> /tmp/x11vnc.log &
/opt/novnc/utils/novnc_proxy --vnc localhost:5900 --listen 8080 &> /tmp/novnc.log
