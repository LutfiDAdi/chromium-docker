#!/bin/bash

# Start virtual display
Xvfb :1 -screen 0 1024x768x16 &> /tmp/xvfb.log &
export DISPLAY=:1.0
sleep 2  # Tunggu inisialisasi Xvfb

# Start window manager
fluxbox &> /tmp/fluxbox.log &

# Start Chromium dengan opsi aman
chromium-browser \
  --no-sandbox \
  --disable-dev-shm-usage \
  --disable-gpu \
  --remote-debugging-port=9222 \
  &> /tmp/chromium.log &

# Start VNC server
x11vnc -forever -usepw -display :1.0 -rfbport 5900 -passwd 1234 &> /tmp/x11vnc.log &

# Start noVNC
/opt/novnc/utils/novnc_proxy --vnc localhost:5900 --listen 8080 &> /tmp/novnc.log

# Keep container running
tail -f /dev/null
