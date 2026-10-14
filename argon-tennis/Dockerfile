FROM python:3.11-slim

WORKDIR /app

COPY index.html companion.html join.html styles.css server.py ./
COPY src/ ./src/
COPY assets/ ./assets/

ENV PORT=8080
EXPOSE 8080

# PORT is set by most hosts; TUNNEL_URL (or Render's RENDER_EXTERNAL_URL) makes the
# phone-controller QR code point at the public https address instead of localhost.
CMD ["sh", "-c", "exec python3 server.py --host 0.0.0.0 --port \"${PORT:-8080}\" --tunnel-url \"${TUNNEL_URL:-${RENDER_EXTERNAL_URL:-}}\""]
