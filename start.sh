#!/bin/bash
# Start virtual display
Xvfb :99 -screen 0 1280x720x24 &

# Export display
export DISPLAY=:99

# Start lightweight desktop
fluxbox &

# Start VNC server on display
x11vnc -display :99 -nopw -forever -shared -rfbport 5900 &

# Start noVNC on port 8080
chromium --no-sandbox --start-maximized &

websockify --web=/usr/share/novnc/ 8080 localhost:5900
