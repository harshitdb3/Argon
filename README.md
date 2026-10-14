# Argon

## Argon Tennis

![Argon Tennis](./docs/screenshots/argon-tennis.png)

A 3D arcade tennis game built with Three.js. It has phone gyro and webcam motion controls and 1v1 multiplayer.
Imported from [ammaarreshi/argon-games](https://github.com/ammaarreshi/argon-games/tree/main/argon-tennis) at commit `3dc689d`.

### Run it

You only need Python 3. No `npm install` is required: `server.py` uses only the standard library and serves the game and assets directly.

```bash
cd argon-tennis
./start.sh            # or: python3 server.py --port 8080
```

Open http://localhost:8080.

### Controls
- **Mouse/trackpad:** move to aim; swipe or click to swing when the ball reaches your strike zone.
- **Keyboard:** `WASD`/arrow keys to move, `Space` to toss and serve, `1`/`2`/`3` for topspin/slice/lob.
- **Webcam:** click **Webcam Motion** (this needs camera permission).
- **Phone as racket:** see below.

### Phone as racket (gyro controller)

How it works:
1. In the game, click **Pocket Racket**. A QR code appears that links to `<server>/companion.html?room=<ID>&role=p1`. The image comes from `api.qrserver.com`.
2. On the phone, open the companion page and tap **Enable Gyro**. The page listens to `deviceorientation` and `devicemotion` events. On iOS you also get a permission prompt.
3. The phone sends `POST /api/racket/telemetry` (tilt and acceleration, about 15 Hz). When it detects a swing or toss flick, it sends `POST /api/racket/swing`.
4. The game in the desktop browser polls `GET /api/match/state` about every 45 ms and turns new swings into shots. Hit feedback goes back through `/api/racket/feedback`, which makes the phone vibrate.

`server.py` is just an in-memory relay, so the phone and the desktop only need to reach the **same server**.

Requirements:
- **The phone must be able to reach the server.** `localhost` on your computer is not reachable from your phone.
- **The page must be served over HTTPS.** Browsers only expose the motion sensors on secure pages, so `http://192.168.x.x:8080` loads but the gyro won't work.

The easiest setup is an HTTPS tunnel from the computer running the game:

```bash
# terminal 1: get a public https URL for port 8080 (either one)
cloudflared tunnel --url http://localhost:8080      # prints https://<random>.trycloudflare.com
ngrok http 8080                                     # prints https://<random>.ngrok-free.app

# terminal 2: start the server with that URL, so the QR code points at it
cd argon-tennis && TUNNEL_URL=https://<random>.trycloudflare.com ./start.sh
```

Then open the game (`http://localhost:8080` works on the desktop), click **Pocket Racket**, and scan the QR code. The server's QR link defaults to `http://localhost:8080`. You can also set it while the server is running: `curl -X POST localhost:8080/api/tunnel/url -d '{"tunnelUrl":"https://<random>.trycloudflare.com"}'`.

### Deploy (permanent HTTPS link, works for phones)

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy?repo=https://github.com/harshitdb3/Argon)

`render.yaml` deploys `argon-tennis/` as a free Docker web service. The container picks up Render's
`RENDER_EXTERNAL_URL` by itself, so the Pocket Racket QR code already points at the `https://….onrender.com` address.
Open that address on your computer, click **Pocket Racket**, and scan the code with your phone.

Other container hosts (Cloud Run, Fly.io, ...) work too: deploy `argon-tennis/Dockerfile` and set `TUNNEL_URL` to the
service's public https URL. The server keeps rooms in memory, so they reset whenever the service restarts or sleeps.

### 1v1 multiplayer
Each player opens `/?room=<ID>&role=p1` or `/?room=<ID>&role=p2` on the same (reachable) server, or uses `/join.html?room=<ID>`. Each player can pair a phone with `role=p1` or `role=p2`.

### Other ways to run
- **Docker:** `cd argon-tennis && docker build -t argon-tennis . && docker run -p 8080:8080 argon-tennis`
- **Vite dev server (optional):** `cd argon-tennis && npm install && npm run dev` serves on port 3000. Its relay redirects `/assets/models` and `/assets/audio` to `localhost:8080`, so run `server.py` alongside it.
