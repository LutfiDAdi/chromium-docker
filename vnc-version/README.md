# Chromium with VNC/noVNC

## Requirements
- Docker
- 2GB+ RAM (untuk Chromium + VNC)

## Cara Menjalankan
1. Build image:
   ```bash
   docker build -t chromium-vnc .

2. jalankan
   ```bash
   docker run -d -p 8080:8080 --name chromium-vnc-container chromium-vnc
   ```
