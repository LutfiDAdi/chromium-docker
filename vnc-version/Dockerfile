FROM ubuntu:22.04

# Install Chromium (fallback ke Snap jika tidak ada di APT)
RUN apt-get update && apt-get install -y \
    wget \
    x11vnc \
    xvfb \
    fluxbox \
    chromium-browser || { \
        echo "Chromium not in APT, installing from Snap..." \
        && apt-get install -y snapd \
        && snap install chromium \
        && ln -s /snap/bin/chromium /usr/bin/chromium-browser; \
    }

# Setup noVNC
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.3.0.tar.gz -O /tmp/novnc.tar.gz \
    && tar -xvf /tmp/novnc.tar.gz -C /opt \
    && mv /opt/noVNC-1.3.0 /opt/novnc \
    && rm /tmp/novnc.tar.gz

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080
CMD ["/start.sh"]
