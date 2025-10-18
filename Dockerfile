FROM debian:bookworm-slim

# Install core stuff
RUN apt-get update && apt-get install -y \
  xvfb \
  chromium \
  x11vnc \
  novnc \
  websockify \
  fluxbox \
  && apt-get clean

# Copy our start script and HTML
COPY start.sh /start.sh
COPY index.html /usr/share/novnc/index.html

# Make script executable
RUN chmod +x /start.sh

EXPOSE 8080
CMD ["/start.sh"]
