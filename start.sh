#!/bin/bash
# virtual display
Xvfb :99 -screen 0 1280x720x24 &

export DISPLAY=:99

# lightweight window manager
fluxbox &

# give it a sec to boot
sleep 2

# start Chromium automatically (feel free to change homepage)
chromium --no-sandbox --start-maximized --disable-dev-shm-usage https://www.google.com &

# run x11vnc with proper flags for Render
x11vnc -display :99 -nopw -forever -shared -listen localhost -xkb &

# start websockify with novnc
websockify --web=/usr/share/novnc/ 8080 localhost:5900
