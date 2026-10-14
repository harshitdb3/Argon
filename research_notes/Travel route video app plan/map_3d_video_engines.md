# Map, 3D and video-export building blocks for a travel-route animation app (iOS first, then Android)

Research date: 14 October 2026. Method note for the report writer: in this research environment, direct page fetches to most vendor domains failed with DNS errors. That covered mapbox.com, docs.mapbox.com, maptiler.com, stadiamaps.com, developers.google.com, protomaps.com, openfreemap.org, remotion.dev and the Mapbox terms PDF CDN. Only GitHub-hosted pages could be fetched in full. Vendor pricing and terms below therefore come from (a) search-engine extracts of the official pages, (b) third-party 2026 pricing guides, or (c) GitHub-hosted primary sources (SDK changelogs, licenses, READMEs, issues). Each item says where it came from. Treat all prices as "as indexed around Oct 2026" and re-check them on the live pricing pages before committing to a budget.

## 1. Map engine capability comparison (Mapbox v11, MapLibre Native, Apple MapKit, Google Maps/3D Tiles, Cesium/deck.gl)

### Takeaway
Mapbox Maps SDK v11 is the only native mobile SDK found that ships all four 3D pieces this app needs, on both iOS and Android, as stable features: globe, 3D terrain, the Standard 3D style, and a glTF model layer. It also has elevated (z-offset) lines, which suit flight arcs. MapLibre Native is free and open, but as of Oct 2026 it has **no 3D terrain**, globe only in pre-release builds (Oct 8, 2026), and no built-in glTF model layer. Apple MapKit has good 3D imagery but is iOS-only, and its terms for recording or exporting video are unresolved. Google's mobile 3D SDK is still Experimental.

### Cited Findings
**Mapbox Maps SDK v11 (iOS), from the official changelog on GitHub**
- The latest release line is 11.33.0-rc.1 (5 Oct 2026). It added `showHdRoads`/`colorHdRoads` options to the Standard style. 11.32.0-rc.1 (21 Sep 2026) fixed camera latitude/longitude bounds under globe projection. 11.31.1 and 11.32.0 (Sep/Oct 2026) fixed terrain occlusion of the puck and raster tiles flashing under terrain — [mapbox-maps-ios CHANGELOG](https://github.com/mapbox/mapbox-maps-ios/blob/main/CHANGELOG.md)
- `ModelLayer` (3D models) was promoted to stable in 11.17.0-beta.2 (14 Nov 2025). 11.19.0-rc.1 (12 Feb 2026) added a new `ModelSource` with `Model`, `ModelMaterialOverride` and `ModelNodeOverride`. These support color/emissive/opacity overrides and **node transforms "e.g., doors, propellers"**, driven by the source or by feature state. 11.18.0-beta.1 added `ModelLayer.modelAllowDensityReduction` — [mapbox-maps-ios CHANGELOG](https://github.com/mapbox/mapbox-maps-ios/blob/main/CHANGELOG.md)
- Elevated lines: 11.19.0-rc.1 promoted `lineZOffset` and `lineElevationReference` to stable and added `lineElevationGroundScale`. 11.12.0 (May 2025) shipped an "elevated spiral line" example — [mapbox-maps-ios CHANGELOG](https://github.com/mapbox/mapbox-maps-ios/blob/main/CHANGELOG.md)
- Standard style configuration options added in 2025–26 include `colorBuildings`, `show3dTrees`, landmark icons (`showLandmarkIcons`, `LandmarkIcons` featureset), and indoor labels (11.25, Jun 2026). Since 11.26.0 (Jul 2026), `verticalFov` animates together with the other camera parameters — [mapbox-maps-ios CHANGELOG](https://github.com/mapbox/mapbox-maps-ios/blob/main/CHANGELOG.md)
- The minimum iOS deployment target was raised to iOS 14.0 in 11.10.0-beta.1 (Jan 2025) — [mapbox-maps-ios CHANGELOG](https://github.com/mapbox/mapbox-maps-ios/blob/main/CHANGELOG.md)
- 3D model support is based on glTF 2.0. Self-contained `.glb` is supported. The iOS "3D model layer" example loads one model from a remote URL and one from a local bundle file, positioned by a runtime GeoJSON source, with model scale, translation, rotation and opacity. The example page still imports it via `@_spi(Experimental)`, which conflicts with the changelog's "promoted to stable" note; the example page is probably older — [Mapbox 3D model layer example](https://docs.mapbox.com/ios/maps/examples/3D-model-layer/); [Mapbox style spec: using 3D models](https://docs.mapbox.com/style-spec/guides/using-3d-models)
- When globe projection or terrain is active, the SDK batches layers for performance, which can rearrange the layer order — [Mapbox troubleshooting: layer rendering order](https://docs.mapbox.com/help/troubleshooting/layer-rendering-order/)
- The SDK is **not open source**. It is licensed under the Mapbox TOS "for use only with the relevant Mapbox product(s)", requires an active Mapbox account in good standing, and prohibits modifications to billing, accounting or data-collection code — [mapbox-maps-ios LICENSE.md](https://github.com/mapbox/mapbox-maps-ios/blob/main/LICENSE.md)

**MapLibre Native (open source, BSD-family)**
- Globe rendering is in **pre-release only**: `ios-v7.0.0-pre-globe.0` (Oct 8, 2026; raises minimum iOS to 15.5) and `android-v13.7.0-pre-globe.0` (Oct 8, 2026). The latest stable Android release is 13.5.3. Android ships OpenGL, Vulkan and multi-backend builds — [MapLibre Native releases](https://github.com/maplibre/maplibre-native/releases)
- iOS v6.31.0 (Sep 11, 2026) **removed the CustomDrawableLayer API** — [MapLibre Native releases](https://github.com/maplibre/maplibre-native/releases). Release notes also mention changes to the "custom Metal layer to allow more flexible rendering (#4446)" — [maplibre-gl-native-distribution releases](https://github.com/maplibre/maplibre-gl-native-distribution/releases)
- **3D terrain is not supported** in MapLibre Native on iOS or Android; the style-spec compatibility table marks it ❌ and points to issue #252 — [MapLibre Style Spec: terrain](https://maplibre.org/maplibre-style-spec/terrain/). A maplibre-compose issue opened Oct 10, 2026 is blocked on the same upstream work and notes that hillshade and color-relief layers do work — [maplibre-compose #1772](https://github.com/maplibre/maplibre-compose/issues/1772). A Terrain 3D implementation was described as "cooking" in Dec 2025 — [MapLibre Newsletter Dec 2025](https://maplibre.org/news/2026-01-03-maplibre-newsletter-december-2025/)
- One reported iOS performance problem: hillshade drops to about 5 FPS after repeated zooming on 6.31.0 — [maplibre-native #4684](https://github.com/maplibre/maplibre-native/issues/4684)
- PMTiles support shipped in Android 11.8.0 and iOS 6.10.0. The `pmtiles://` protocol is handled natively — [MapLibre Newsletter Jan 2025](https://maplibre.org/news/2025-02-03-maplibre-newsletter-january-2025/); [MapLibre Flutter PMTiles docs](https://maplibre.org/flutter-maplibre-gl/advanced/pmtiles/). Later releases added an ambient cache for PMTiles sources — [maplibre-gl-native-distribution releases](https://github.com/maplibre/maplibre-gl-native-distribution/releases)
- No glTF/3D model layer was found for MapLibre Native — [search result summary; no source confirms one exists] (see Gaps)

**Apple MapKit**
- On a real iPhone 13 (iOS 26.6), the live satellite map's maximum tilt depends on camera distance: 500 m → 70°, 1,500 m → 60°, 3,000 m and above → 35°. The Simulator caps at about 35°. At 60° there is real terrain relief but "no 3D trees or buildings", and a grey grid can appear at the horizon — [OpenBikeComputer issue #2081 (device spike)](https://github.com/timohueser/OpenBikeComputer/issues/2081)
- High pitch (80°) works only where Flyover-level 3D data exists (e.g., Chicago) and collapses in rural areas. `pitchEnabled` does not tell you whether a given pitch will work at a given place — [Apple Developer Forums 719471](https://developer.apple.com/forums/thread/719471)
- SwiftUI `mapCameraKeyframeAnimator` drifted "up to 340 m off the trail", and a SwiftUI `MapPolyline` trail lagged the camera by "hundreds of ms" — [OpenBikeComputer #2081](https://github.com/timohueser/OpenBikeComputer/issues/2081)
- That project ultimately shipped its ride replay with a bundled CesiumJS runtime in WKWebView rather than MapKit, and split video export into a separate investigation — [OpenBikeComputer #2083](https://github.com/timohueser/OpenBikeComputer/issues/2083)

**Google Maps Platform**
- Maps 3D SDKs for Android and iOS launched as **Experimental** at I/O 2025. Google's 3D Maps page says the mobile SDKs are "currently in experimental at no cost" and that pricing comes at GA — [Google 3D Maps product page](https://mapsplatform.google.com/maps-products/3d-maps/); [Google blog: 3D Maps on mobile](https://mapsplatform.google.com/resources/blog/introducing-3d-maps-on-mobile-build-immersive-experiences-for-android-and-ios/)
- Photorealistic 3D Tiles must be rendered with a 3D Tiles renderer that can display copyright attribution, e.g., CesiumJS 1.91+ or Cesium for Unreal 1.12+ — [Google Photorealistic 3D Tiles docs](https://developers.google.com/maps/documentation/tile/3d-tiles); [Map Tiles API policies](https://developers.google.com/maps/documentation/tile/policies)
- Google says the tiles are "not survey-grade" and are intended for immersive visualization — [Google 3D Tiles FAQ blog](https://mapsplatform.google.com/resources/blog/commonly-asked-questions-about-our-recently-launched-photorealistic-3d-tiles/)

**Cesium / deck.gl**
- Cesium for Unity officially supports iOS and Android (ARM64 and x86-64; no 32-bit ARMv7) — [Cesium for Unity supported platforms](https://cesium.com/learn/cesium-unity/ref-doc/supported-platforms.html); [cesium-unity releases](https://github.com/CesiumGS/cesium-unity/releases)
- Cesium for Unreal added Android and iOS support in 2022 — [Cesium releases June 2022](https://cesium.com/blog/2022/06/01/cesium-releases-in-june-2022/)
- No official native-Android integration exists for CesiumJS (older Cesium dev statement). CesiumJS in mobile browsers or WebViews is reported to work — [cesium-dev group](https://groups.google.com/g/cesium-dev/c/cikKJ73Ao1c); [OpenBikeComputer #2083 (CesiumJS in WKWebView)](https://github.com/timohueser/OpenBikeComputer/issues/2083)

**Competitor reference points**
- Travel Animator (iOS and Android) offers 30+ map styles, 300+ 3D vehicle models, and HD/4K export. 4K and 3D maps are Pro-only, and free exports are watermarked — [Travel Animator](https://www.travelanimator.com/)
- Mult.dev exports 9:16 video at 640×640 to 1920×1920, 30 or 60 FPS. The free tier is capped at 768×768 at 30 FPS with a watermark, and road-following routing is Pro-only (vendor comparison pages) — [Mult.dev article](https://mult.dev/articles/best-travel-map-animation-tools-in-2026); [Travel Animator vs TravelBoast](https://www.travelanimator.com/hub/compare-travel-animator-and-travelboast)

### Inferences
- For "3D globe → zoom to city → vehicle model along route over terrain", Mapbox v11 covers the whole scene in one renderer. That matters for export, because one renderer means one frame to capture and no compositing of separately projected layers. MapLibre would need custom Metal/Vulkan work for models and would still lack terrain.
- MapKit is attractive for its free imagery and look, but it is iOS-only, has no model layer, its camera animator drifts, and its terms for exported footage are unresolved (section 7). Treat it as a non-starter for a cross-platform video exporter.
- Google Photorealistic 3D Tiles could give the most striking "cinematic" look, but on mobile they need a Cesium-class renderer (Unity/Unreal or a WebView). The native Maps 3D SDK is still Experimental with unknown GA pricing. Treat this as a later premium experiment, not the base engine.
- deck.gl is a web (WebGL/WebGPU) library. On mobile it would only matter inside a WebView or for server-side rendering (background knowledge; not verified in this session).

### Gaps
- I could not read Mapbox's v11 Android changelog. Android feature parity (ModelLayer stable, elevated lines) is assumed to match iOS but was not verified.
- I found no source confirming any glTF model layer or plugin for MapLibre Native in 2026.
- I found no 2024–2026 source on deck.gl mobile or React Native support.
- I could not verify Apple's iOS 18/26 MapKit 3D changes (e.g., new 3D city coverage) from Apple docs, because developer.apple.com could not be fetched.

## 2. Pricing, licensing and estimated running costs at 1k / 10k / 100k MAU

### Takeaway
Mapbox's MAU-based mobile pricing (first 25,000 MAU free, then about $4.00 per 1,000 MAU) suits a tile-heavy video exporter well: on-device snapshot and export rendering adds no per-tile cost. Estimated Mapbox maps cost is about $0 at 1k and 10k MAU and about $300/month at 100k MAU, plus Directions overage if road routing is not cached. Per-tile or per-request providers (Stadia, MapTiler) grow with how many frames and tiles each export pulls, and can cost more than Mapbox at 100k MAU. Self-hosted PMTiles on Cloudflare R2 is the cheapest at roughly $2–$180/month, but it sits on MapLibre (no 3D terrain).

### Cited Findings
**Mapbox (official pricing page unreachable; figures from search extracts and 2026 third-party guides, Oct 2026)**
- Maps SDK for mobile pricing per 1,000 MAU: 0–25,000 MAU free; 25,001–125,000 at $4.00; 125,001–250,000 at $3.20; 250,001–1,250,000 at $2.40; above that, contact sales — [Woosmap: Mapbox pricing 2026](https://www.woosmap.com/blog/mapbox-pricing); [StoreRocket: Mapbox pricing 2026](https://storerocket.io/learn/mapbox-pricing). These are third-party figures; the official page could not be retrieved — [mapbox.com/pricing](https://www.mapbox.com/pricing)
- An MAU is counted "as soon as they use your app in a way that employs Maps SDK functionality", **including creating a map snapshot**. Deleting and reinstalling the app creates an additional MAU. The month follows the billing cycle, not the calendar month — [Mapbox Android pricing guide](https://docs.mapbox.com/android/maps/guides/pricing/). An older Android page says MAUs align to calendar months, which conflicts — [Mapbox legacy Android pricing](https://docs.mapbox.com/android/legacy/maps/guides/pricing/)
- Directions API: 100,000 requests/month free, then about $2.00 / $1.60 / $1.20 per 1,000 across volume bands. Some third-party pages list $5/1k, which looks outdated — [StoreRocket](https://storerocket.io/learn/mapbox-pricing); [Woosmap](https://www.woosmap.com/blog/mapbox-pricing)
- Static Images API: free up to 50k requests/month, then from $1.00 per 1,000 — [Mapbox static maps page](https://www.mapbox.com/static-maps)

**MapTiler Cloud (third-party extracts; official page snapshot was stale)**
- Free: $0, **non-commercial only**, 5,000 sessions and 100,000 requests/month; service halts at the quota.
- Flex: $25/month (one source says $30), 25,000 sessions and 500,000 requests; overage $2.00 per 1k sessions and $0.10 per 1k requests.
- Unlimited: $295/month, 300,000 sessions and 5,000,000 requests, with an SLA; overage $1.50 per 1k sessions and $0.08 per 1k requests.
- Custom: quote-only.
- Sources: [Frontdesk Review: MapTiler pricing 2026](https://frontdeskreview.com/software/maps-api/maptiler/); [FreeTier: MapTiler](https://freetier.co/directory/products/maptiler); [G2: MapTiler pricing](https://www.g2.com/products/maptiler/pricing); [MapTiler pricing page](https://www.maptiler.com/cloud/pricing/)

**Stadia Maps (official pricing page via search extract)**
- Free: $0, 200k credits/month, **non-commercial only**.
- Starter: $20, 1M credits, commercial use allowed, overage $0.03 per 1k.
- Standard: $80, 7.5M credits, overage $0.02 per 1k.
- Professional: $250, 25M credits, overage $0.015 per 1k.
- Overage is opt-in. A vector or raster basemap tile costs 1 credit, a satellite tile 4 credits, and a static map 20 credits.
- Sources: [Stadia Maps pricing](https://stadiamaps.com/pricing/); [Stadia Maps products](https://stadiamaps.com/products/maps/)

**Self-hosted / free OSM tiles**
- The Protomaps full planet basemap PMTiles file is about 120 GB (zoom 0–15) — [Protomaps basemap downloads](https://docs.protomaps.com/basemaps/downloads)
- Cloudflare R2 pricing: $0.015/GB-month storage; free tier of 10 GB-month, 1M Class A and 10M Class B operations; **no egress fees**; Class B reads cost $0.36 per million — [Cloudflare R2 pricing](https://developers.cloudflare.com/r2/pricing)
- OpenFreeMap: free, no API keys, "no limits on the number of map views or requests", donation-funded, no SLA (two servers with round-robin DNS). Attribution is required. MIT-licensed and self-hostable. It does not provide routing, satellite imagery or elevation — [OpenFreeMap README](https://github.com/hyperknot/openfreemap)

**Google Maps Platform**
- Photorealistic 3D Tiles (Map Tiles API, Enterprise SKU): 1,000 free root-tile requests/month, then $6.00 per 1,000, stepping down through $5.10, $4.20, $3.30 and $2.40 across volume tiers. The flat $200 monthly credit was replaced by per-SKU free caps — [Google Maps Platform pricing list](https://developers.google.com/maps/billing-and-pricing/pricing); [Woosmap: Google Maps API pricing 2026](https://www.woosmap.com/blog/google-maps-api-pricing-breakdown)
- One root request opens a session of up to 3 hours. Reloading starts a new billable root request — [Google preview/quota blog](https://mapsplatform.google.com/resources/blog/photorealistic-3d-tiles-now-preview-updated-daily-quotas/); [AFI blog on 3D Tiles](https://blog.afi.io/blog/what-is-the-google-photorealistic-3d-tiles-api/). The quota was listed as a maximum of 10,000 root tileset queries/day; that page is dated — [Map Tiles API usage and billing](https://developers.google.com/maps/documentation/tile/usage-and-billing)
- The standard Maps SDK for iOS/Android (2D dynamic maps) is described as unlimited and free on mobile — [Google Maps SDK for iOS usage and billing](https://developers.google.com/maps/documentation/ios-sdk/usage-and-billing); [StoreRocket: Google Maps API pricing](https://storerocket.io/learn/google-maps-api-pricing). The Maps 3D SDKs are Experimental and free for now, with pricing due at GA — [Google 3D Maps page](https://mapsplatform.google.com/maps-products/3d-maps/)

**Routing**
- GraphHopper Directions API: Free 0€ (500 credits/day); Basic 69€/month (5,000/day); Standard 199€ (15,000/day); Premium 479€ (50,000/day). A route with 2–10 points costs 1 credit. Going over the daily credits only triggers an email warning — [GraphHopper pricing](https://www.graphhopper.com/pricing/); [GraphHopper: what is one credit](https://support.graphhopper.com/support/solutions/articles/44000718211-what-is-one-credit-)
- Self-hosting OSRM for the whole planet needed about 64 GB RAM to serve the car profile and about 175 GB RAM to preprocess (2017). A 2021 operator reported 130 GB for car and 165 GB for foot/bike. These figures are dated — [osrm-talk 2017](https://lists.openstreetmap.org/pipermail/osrm-talk/2017-July/001462.html); [osrm-talk 2021](https://lists.openstreetmap.org/pipermail/osrm-talk/2021-May/001997.html)

### Inferences
**Usage model behind the cost table (all assumptions are mine; adjust them):**
- Per MAU per month: 6 interactive map sessions and 2 video exports.
- About 4 road-routing requests (car/train legs; flights need none because they are computed great circles).
- About 5,000 tile fetches. The split is roughly 300 per interactive session and roughly 1,500 per 30–60 s export that zooms from globe to street level with terrain DEM. On-device tile caching would lower this.
- About 8 "sessions" (map loads).

| Stack (maps + routing) | 1k MAU / month | 10k MAU / month | 100k MAU / month | Notes |
|---|---|---|---|---|
| **Mapbox SDK + Mapbox Directions** | ~$0 (under both free tiers) | ~$0 (10k < 25k MAU free; 40k < 100k directions free) | Maps: (100k − 25k) × $4/1k = **$300**. Directions: 400k − 100k free = 300k × $2/1k = **$600**. Total **~$900** | Exports add no tile cost, because snapshots count only toward MAU. Caching routes per trip could cut Directions to near $0. |
| Mapbox SDK + GraphHopper | ~$0 (free 500/day ≈ 15k/month) | €69 (Basic, 5k/day) | $300 + €199 (Standard, 15k/day ≈ 450k/month) ≈ **$515** | GraphHopper overage only triggers warnings. |
| MapLibre + Stadia (credits = tiles) | 5M credits → Standard **$80** | 50M → $250 + 25M × $0.015/1k = **~$625** | 500M → $250 + 475M × $0.015/1k = **~$7,375** (would negotiate enterprise) | Per-tile pricing scales with export frames and zoom range. |
| MapLibre + MapTiler, if billed by sessions | 8k sessions → Flex **$25** | 80k → $25 + 55k × $2/1k = **$135** | 800k → $295 + 500k × $1.5/1k = **~$1,045** | Unverified whether native MapLibre usage is billed by sessions or by requests (see Gaps). |
| MapLibre + MapTiler, if billed by requests | 5M requests → Unlimited **$295** | 50M → $295 + 45M × $0.08/1k = **~$3,900** | 500M → **~$40k** (would require a custom contract) | Worst case. |
| MapLibre + self-hosted Protomaps PMTiles on R2 | ~$2 (storage; reads inside the free 10M) | ~$16 (40M reads × $0.36/M + storage) | ~$180 (490M × $0.36/M + storage) | No 3D terrain in MapLibre Native. Excludes terrain DEM, satellite imagery and the engineering cost of styles. A CDN cache in front would cut R2 reads further. |
| Google Photorealistic 3D Tiles (premium add-on) | 8k roots − 1k free = 7k × $6/1k ≈ **$42** | 79k × $6/1k ≈ **$474** | 800k roots ≈ **≤$4,800** (lower in volume tiers; tier thresholds not retrieved) | Also exceeds the dated 10k/day root quota at 100k MAU, and video terms are unclear. Not recommended for the MVP. |

- Mapbox's free tier (25k MAU) probably covers the whole MVP and early growth. The main cost driver at 100k MAU is road routing, not maps. So: compute flight arcs locally, call Directions once per road leg, and store the geometry with the trip.
- MAU is counted per install. Reinstalls inflate MAU, which matters for a creator app with high churn.

### Gaps
- The official Mapbox, MapTiler, Stadia and Google pricing pages could not be fetched directly (DNS failure in the research environment). Re-verify all numbers on the live pages.
- I could not confirm whether Mapbox mobile MAU pricing includes the vector/raster/DEM tile requests made by the SDK. My understanding is that it does, but this is unverified.
- I could not confirm how MapTiler bills MapLibre Native (sessions vs requests).
- I could not find Google 3D Tiles volume-tier thresholds, Stadia routing credit costs, or Valhalla's hardware requirements.
- Apple MapKit native usage is believed to be free for iOS apps, but I did not verify that in this session.

## 3. Deterministic frame-by-frame route rendering and video encoding (iOS, Android, Mapbox-specific, server-side)

### Takeaway
Do not use screen recording. The reliable pattern is a **timeline-driven render loop**:
1. Compute camera and route state for frame *n*.
2. Set the camera synchronously.
3. Wait until the map is fully loaded and idle.
4. Capture the frame (Mapbox `Snapshotter`, or a map view snapshot of an export-sized map view).
5. Append the frame with presentation time *n/fps* to AVAssetWriter (iOS) or to a MediaCodec/Media3 encoder (Android), running not-in-real-time.

Remotion's MapLibre recipe documents this exact "jumpTo per frame → wait for `idle` → capture" loop. Mapbox's MapRecorder is a debugging tool, not a video exporter.

### Cited Findings
**Deterministic loop (web reference implementations that carry over to native)**
- Remotion's maps guide:
  - Create the map with `interactive: false` and `fadeDuration: 0` so the map runs no animations of its own, and set `preserveDrawingBuffer: true` so frames can be captured.
  - Per frame, compute progress with `interpolate()` and easing, find camera and route points with `turf.along()`, and call `map.jumpTo(map.calculateCameraOptionsFromTo(...))`.
  - Update the GeoJSON source with `turf.lineSliceAlong(route, 0, currentDistance)` (using `Math.max(0.001, …)` because Turf errors on zero-length slices).
  - Hold each frame with `delayRender` until `map.once('idle')`, calling `map.triggerRepaint()` so `idle` fires even when nothing changed.
  - Render with `--gl=angle --concurrency=1`.
  - Source: [Remotion maps docs (GitHub source)](https://github.com/remotion-dev/remotion/blob/main/packages/docs/docs/maps.mdx)
- The `maplibre-gl-video-export` plugin (BSD-3-Clause):
  - Drives MapLibre's clock with `setNow()` for "deterministic frame-by-frame rendering" and reads the WebGL canvas at fixed intervals.
  - Encodes WebM VP9 via WebCodecs, or MP4 H.264 via WASM; the README flags possible MPEG LA/VIA patent licensing for commercial MP4.
  - Supports HD, Full HD, 4K or custom sizes, with configurable fps.
  - Requires MapLibre GL JS ≥ 5.11.0.
  - Source: [maplibre-gl-video-export](https://github.com/bjperson/maplibre-gl-video-export)
- Mapbox has a blog post on cinematic route animations with Mapbox GL JS (title only; content not retrieved) — [Mapbox blog](https://www.mapbox.com/blog/building-cinematic-route-animations-with-mapboxgl)

**Mapbox native capture primitives**
- `Snapshotter` renders a static map image with custom size, scale (pixel ratio) and style. It has an `overlayHandler` for Core Graphics drawing after the base map draws, and returns a `UIImage` — [Mapbox iOS: snapshot with Core Graphics](https://docs.mapbox.com/ios/maps/examples/static-map-snapshot-core-graphics/); [Mapbox iOS: static map snapshot](https://docs.mapbox.com/ios/maps/examples/static-map-snapshot/)
- "If there is a pending snapshot request, it is cancelled automatically." Frames must therefore be requested one at a time, never pipelined — [Mapbox Snapshotter API](https://docs.mapbox.com/ios/maps/api/10.16.1/Classes/Snapshotter.html)
- The snapshotter adds Mapbox attribution to snapshots (10.0.0-rc.6), with `showsLogo` and `showsAttribution` flags (10.0.0-rc.5). `Snapshotter.camera(for:padding:bearing:pitch:)` and `coordinateBounds(for:)` exist (10.0.0-beta.21). The changelog also mentions an "experimental snapshot API" for `MapView` (fixed for iOS 15 in 10.1.0-beta.1) and `presentsWithTransaction` (10.0.0-beta.13) — [mapbox-maps-ios CHANGELOG](https://github.com/mapbox/mapbox-maps-ios/blob/main/CHANGELOG.md). 11.16.0-beta.1 (Sep 2025) added an experimental `scaleFactor` to `MapSnapshotOptions` — [same changelog](https://github.com/mapbox/mapbox-maps-ios/blob/main/CHANGELOG.md)
- The `RenderFrameFinished` event says "the map finished rendering a frame". It is emitted asynchronously, so it is a signal rather than a synchronous capture hook — [Mapbox MBMRenderFrameFinished](https://docs.mapbox.com/ios/maps/api/11.0.0-beta.5/core/Classes/MBMRenderFrameFinished.html)
- The snapshotter must wait for the style to load (`onStyleLoaded`) before generating a snapshot — [Mapbox declarative styling](https://docs.mapbox.com/ios/maps/guides/styles/declarative-map-styling/); [snapshot example](https://docs.mapbox.com/ios/maps/examples/static-map-snapshot/)
- `MapRecorder` (iOS) and `MapboxMapRecorder` (Android) are **experimental debugging/profiling tools**. They record and replay API calls (as compressed JSON), not pixels. Replays are reliable only on the same SDK version, and the tools are not meant for production — [Mapbox iOS MapRecorder guide](https://docs.mapbox.com/ios/maps/guides/debugging-and-profiling/map-recorder/); [Mapbox Android MapRecorder guide](https://docs.mapbox.com/android/maps/guides/debugging-and-profiling/map-recorder/)
- Android: Mapbox has an example of animating a map rendered into a `TextureView` (`ObjectAnimator` and `flyTo`) — [Mapbox Android animated TextureView](https://docs.mapbox.com/android/maps/examples/android-view/animated-textureview/)

**iOS encoding (AVAssetWriter / Metal)**
- The standard pattern is to take a buffer from the `AVAssetWriterInputPixelBufferAdaptor.pixelBufferPool`, draw into it, and append it with a presentation time. One forum report gives about 70 ms per 720p frame, dominated by the image-to-bitmap conversion — [Apple Developer Forums 51928](https://developer.apple.com/forums/thread/51928)
- Writing BGRA instead of RGBA cut 500 frames at 720p from about 3 minutes to under 30 s (old iPhone 4-era benchmark; directional only) — [MSImageMovieEncoder](https://github.com/meslater/MSImageMovieEncoder)
- One project found that about 94% of export time was spent compressing throwaway PNG frames. The fix is to render or blit straight into an IOSurface-backed `CVPixelBuffer` from the adaptor's pool — [RayMol #601](https://github.com/javierbq/RayMol/issues/601); [RayMol #630](https://github.com/javierbq/RayMol/issues/630)
- Keep compositing on the GPU (Metal) and reuse buffers from a `CVPixelBufferPool` — [DEV: memory-safe mobile video editing engine](https://dev.to/beefedai/memory-safe-mobile-video-editing-engine-timeline-design-optimizations-4em0)
- Known pitfall: Metal → adaptor → **HEVC** output played frames out of order in one report, while H.264 did not — [Apple Developer Forums 729382](https://developer.apple.com/forums/thread/729382)

**ReplayKit (screen recording): limits**
- It shows a system permission modal whose wording cannot be customized. It doesn't work during AirPlay or video playback, doesn't work in the Simulator, and recordings are discarded if interrupted by system screen recording or broadcast — [IMG.LY ReplayKit guide](https://img.ly/blog/record-screen-with-swift-replaykit/); [WWDC 2017 session 606 PDF](https://devstreaming-cdn.apple.com/videos/wwdc/2017/606n77zpcxs5ir2/606/606_whats_new_with_screen_recording_and_live_broadcast.pdf)
- One developer reports the prompt now appears on every start on iOS 18.5 and 26 — [Apple Developer Forums 651099](https://developer.apple.com/forums/thread/651099)
- MapKit test on iPhone 13: ReplayKit produced 888×1920 at about 59 fps (15 s = 37 MB) but **recorded the UI overlays too**. `stopRecording(withOutput:)` must write to the temp directory (Documents fails with -5835). The same spike's snapshot renderer took "about 3.7 min" to render a full ride on iPhone 13. `snapshot.point(for:)` ignores terrain height and lands about 100 px off at 70° pitch — [OpenBikeComputer #2081](https://github.com/timohueser/OpenBikeComputer/issues/2081)

**Android encoding (MediaCodec / Media3)**
- Media3 Transformer is built on MediaCodec for hardware encode/decode and OpenGL for effects. Custom per-frame GL work goes through `GlShaderProgram.queueInputFrame()`, and media3-muxer writes the MP4 — [Media3 Transformer guide](https://developer.android.com/guide/topics/media/transformer)
- A MediaCodec input `Surface` (API 18+) lets OpenGL ES rendering feed the encoder directly. Some encoders historically did not accept Surface input (2016 note) — [bigflake MediaCodec](https://www.bigflake.com/mediacodec/)
- `RawAssetLoader` lets an app feed OpenGL texture IDs via `queueInputTexture(textureId, presentationTimeUs)` and PCM via `queueAudioData(...)` into Transformer, attached through `RawAssetLoaderFactory`. The app must keep audio and video in sync itself — [monday8am: exporting a Lottie animation to video with Media3 (Aug 2025)](https://monday8am.com/blog/2025/08/21/exporting-lottie-and-audio-to-video.html)
- The current Media3 release listed is 1.11.1 — [Media3 releases](https://developer.android.com/jetpack/androidx/releases/media3)
- LiTr is an alternative MediaCodec + OpenGL library that can build video from images — [LiTr README](https://github.com/halfaHalfawy/LiTr/blob/main/README.md)

### Inferences
**Recommended iOS export pipeline (Mapbox)**
- Precompute a timeline of per-frame camera states (center, zoom/altitude, bearing, pitch) and route progress from eased keyframes.
- Use an export-sized `MapView` that is never shown on screen, or `Snapshotter` with `MapSnapshotOptions(size:pixelRatio:)`.
- For each frame: set the camera, update the route-line source (slice along) and the vehicle model feature (position and bearing), wait for the map-idle or "fully rendered" signal, capture, convert to BGRA, and append with `CMTime(value: n, timescale: fps)`. Set `expectsMediaDataInRealTime = false`.
- Prefer a `MapView` snapshot over `Snapshotter` if `Snapshotter` turns out not to render model layers or view annotations (unverified; see Gaps).
- This yields identical output regardless of device speed. Slow tile loads only lengthen export time; they never drop frames.

**Android**
- Use the same timeline. Render Mapbox into a `TextureView` or `SurfaceView` of the export size, capture with `MapView.snapshot()` or `PixelCopy` (API 24+; background knowledge), and either draw into a MediaCodec input Surface or use Media3 `RawAssetLoader` with a GL texture.
- Media3 Transformer then handles the music mix and MP4 muxing.

**Server-side alternative**
- Render the same timeline with MapLibre GL JS or Mapbox GL JS in headless Chrome (Remotion-style) on GPU workers. This gives consistent output on low-end phones at the cost of GPU servers and web map-load billing. It is worth keeping as a fallback for 4K exports.
- ReplayKit is suitable only for a "quick share" preview: real-time, at screen resolution, it captures overlays and drops frames whenever tiles stall.

### Gaps
- I found no Mapbox document or sample that combines Snapshotter or MapView snapshots with AVAssetWriter, and no published per-frame throughput numbers for Mapbox snapshots on mid-range devices.
- I could not confirm whether Mapbox `Snapshotter` renders `ModelLayer` 3D models, globe and terrain identically to `MapView`. This needs a spike.
- I did not verify the exact v11 API for a synchronous "fully rendered" check (`isIdle` / `onMapIdle`, `renderMode == .full`).
- I did not verify the Mapbox Android `MapView.snapshot()` API, or PixelCopy specifics, from sources in this session.

## 4. Route geometry: great-circle arcs, smoothing, and road routing for car/train legs

### Takeaway
Compute flight legs locally as great-circle arcs. Turf.js has `greatCircle`; turf-swift does **not**, so write roughly 30 lines of spherical interpolation in Swift (and Kotlin) or port it. For elevated flight arcs, Mapbox's stable `lineZOffset` can lift them off the ground. Use turf-swift's `bezier` and `simplify` for smoothing. Call a routing API only for road legs and cache the result. Mapbox Directions is free up to 100k requests/month; GraphHopper costs €69–199/month. Self-hosting OSRM for the planet needs a 64–130 GB RAM server.

### Cited Findings
- `turf.greatCircle(from, to, {npoints: 100})` builds a geodesic path for flight routes, animated with `turf.lineSliceAlong` — [Remotion maps docs](https://github.com/remotion-dev/remotion/blob/main/packages/docs/docs/maps.mdx)
- turf-swift's parity table **has no greatCircle**. It provides:
  - `LineString.coordinateFromStart(distance:)` (along)
  - `LineString.trimmed(from:to:)` (lineSliceAlong)
  - `LineString.bezier(resolution:sharpness:)` (bezierSpline)
  - `LineString.simplify(tolerance:highestQuality:)`
  - `distance(to:)` and `direction(to:)` (bearing)
- Supported platforms are iOS 11+ and visionOS. SPM is the supported channel, and CocoaPods distribution ends by December 2026 — [turf-swift README](https://github.com/mapbox/turf-swift)
- Mapbox elevated lines: `lineZOffset` and `lineElevationReference` became stable in 11.19.0 (Feb 2026), with `lineElevationGroundScale` added — [mapbox-maps-ios CHANGELOG](https://github.com/mapbox/mapbox-maps-ios/blob/main/CHANGELOG.md)
- Mapbox Directions: 100k free per month, then about $2.00/1k — [StoreRocket](https://storerocket.io/learn/mapbox-pricing). GraphHopper: 1 credit per 2–10-point route, with plans from 0€ to 479€/month — [GraphHopper pricing](https://www.graphhopper.com/pricing/)
- OSRM planet self-hosting: about 64 GB RAM to serve car routing and 130 GB reported in 2021; foot/bike is heavier — [osrm-talk 2017](https://lists.openstreetmap.org/pipermail/osrm-talk/2017-July/001462.html); [osrm-talk 2021](https://lists.openstreetmap.org/pipermail/osrm-talk/2021-May/001997.html)
- Competitors gate road-following routing as a paid feature (Mult.dev Pro: "Realistic Road Routing") — [Travel Animator hub comparison of Mult.dev](https://www.travelanimator.com/hub/which-is-the-free-alternative-to-mult-dev)

### Inferences
- Flight legs: slerp between unit vectors (100–300 points), handle the antimeridian by splitting or unwrapping longitudes, then optionally raise the middle of the arc with `lineZOffset` for a 3D "arc in the sky" look.
- Train legs: OSM rail routing is not offered by Mapbox Directions profiles (driving, walking, cycling) as far as I know. Options are a straight geodesic with smoothing, a rail-capable custom profile in GraphHopper, Valhalla or OSRM, or letting users draw or import a GPX file. This needs checking.
- Store the routed geometry with the trip, so repeated previews and exports never re-query the API. That keeps Directions within the free tier up to tens of thousands of MAU.

### Gaps
- I did not verify whether turf-java (Android) includes greatCircle.
- I could not find Valhalla hardware requirements, Stadia routing credit costs, or a rail-routing option in Mapbox, Valhalla or GraphHopper hosted APIs.
- The OSRM RAM figures are 2017–2021 and probably understate today's planet size.

## 5. 3D vehicle models: sources, licensing, and how to render them on the map

### Takeaway
Use Mapbox's `ModelLayer` (glTF 2.0/.glb, stable since 11.17) so vehicles are rendered inside the map's own depth buffer and terrain. Since 11.19 it can also animate nodes such as propellers. That avoids a SceneKit/RealityKit overlay, which would need its own camera matching and terrain-aware projection (MapKit tests show about 100 px error when terrain is ignored). Start with CC0 assets (Quaternius cars and trains via Poly Pizza). Sketchfab and Fab assets are licensed per model, and CC-BY ones require attribution.

### Cited Findings
- Mapbox `ModelLayer` loads `.glb` from the app bundle or a URL, placed by a GeoJSON source, with scale, rotation and translation — [Mapbox 3D model layer example](https://docs.mapbox.com/ios/maps/examples/3D-model-layer/); [Mapbox using 3D models](https://docs.mapbox.com/style-spec/guides/using-3d-models). Since 11.19 there are `ModelNodeOverride` node transforms (e.g., propellers) and material overrides — [mapbox-maps-ios CHANGELOG](https://github.com/mapbox/mapbox-maps-ios/blob/main/CHANGELOG.md)
- Projection error when overlaying on a 3D map: MapKit's `snapshot.point(for:)` ignores terrain height and is about 100 px off at 70°. A fitted camera plus GPX elevations reduced this to 5–15 pt — [OpenBikeComputer #2081](https://github.com/timohueser/OpenBikeComputer/issues/2081)
- Quaternius Cars Bundle (8 cars) is CC0 / public domain — [Poly Pizza Cars Bundle](https://poly.pizza/bundle/Cars-Bundle-FE5IWe6OMk); [Quaternius cars pack](https://quaternius.com/packs/cars.html)
- Quaternius Modular Train Pack is CC0, available as FBX and GLB on Poly Pizza (the Quaternius page lists FBX, OBJ and Blend) — [Poly Pizza Modular Train Pack](https://poly.pizza/bundle/Modular-Train-Pack-jYEybkFVr1); [Quaternius modular train](https://quaternius.com/packs/modulartrain.html)
- Only CC BY or Standard-licensed Sketchfab models could migrate to Fab. CC0, BY-SA, BY-NC and BY-ND models stayed on Sketchfab — [Sketchfab blog: Fab migration](https://sketchfab.com/blogs/community/fab-publishing-portal-open-for-sketchfab-migration/)
- CC-BY allows commercial use with credit, a license link, and an indication of changes — [Cinevva: game asset licenses](https://app.cinevva.com/guides/game-asset-licenses)
- Fab free-asset terms vary by seller — [LicenseOrg: Fab guide](https://www.licenseorg.com/guide/3d-assets/fab)
- An unverified third-party claim says Epic sold Sketchfab to KitBash in Aug 2026; I could not corroborate it — [Cinevva guide](https://app.cinevva.com/guides/game-assets-guide)
- Travel Animator markets 300+ 3D vehicle models, so model variety is a competitive feature — [Travel Animator](https://www.travelanimator.com/)

### Inferences
- An MVP set of about 6–10 vehicles (plane, car, train, bus, ferry, bike, walking marker) from CC0 sources avoids attribution in videos. Shipping a CC-BY model would add a credit obligation, which is awkward for exported videos.
- Keep the models low-poly (a few thousand triangles, compressed textures) so `ModelLayer` and per-frame snapshots stay fast. `modelAllowDensityReduction` exists for many instances, but this app shows only one vehicle.
- On Android, Filament or SceneView would be the overlay route if `ModelLayer` were unusable. With Mapbox on both platforms, `ModelLayer` keeps one asset pipeline (background knowledge).

### Gaps
- I found no Quaternius airplane pack in the results; plane models need another source (Poly Pizza CC0 or CC-BY, or a commission).
- I found no data on commission costs for custom low-poly vehicle models.
- Sketchfab's current ownership and license terms in 2026 are unverified.

## 6. Audio muxing, aspect ratios (9:16, 1:1, 16:9), 1080p60/4K, and export time on mid-range phones

### Takeaway
Aspect ratio and resolution are just the size of the offscreen map or snapshot (1080×1920, 1080×1080, 1920×1080, or 2160×3840 for 4K). Music is muxed natively (AVAssetWriter audio input or an AVMutableComposition pass on iOS; a looping audio `EditedMediaItemSequence` in Media3 on Android). Export time is dominated by map rendering and tile waits, not encoding. The only real on-device datapoint is a MapKit snapshot render of a full ride taking about 3.7 min on an iPhone 13. Expect minutes for a 30–60 s 1080p60 clip, and treat 4K60 as a premium, slow option or a server-side job.

### Cited Findings
- Media3 Transformer has supported mixing concurrent audio streams (a background track) since 1.2. The background music is added as a separate looping `EditedMediaItemSequence` in the `Composition` — [Media3 multi-asset editing](https://developer.android.com/media/media3/transformer/multi-asset); [Media3 editing guide (Medium)](https://medium.com/google-exoplayer/trim-transcode-concatenate-your-guide-to-media3-editing-libraries-668b4e4c2f97)
- Known crash: mixing 48 kHz video audio with a 44.1 kHz background track on Media3 1.9.0 — [androidx/media #2963](https://github.com/androidx/media/issues/2963)
- `RawAssetLoader` can accept PCM via `queueAudioData` alongside GL textures — [monday8am blog](https://monday8am.com/blog/2025/08/21/exporting-lottie-and-audio-to-video.html)
- Competitor export specs: Mult.dev 640×640 to 1920×1920 at 30/60 fps, including 9:16 — [Mult.dev article](https://mult.dev/articles/best-travel-map-animation-tools-in-2026). Travel Animator offers HD and 4K, with 4K Pro-only — [Travel Animator](https://www.travelanimator.com/)
- Measured render times:
  - MapKit snapshot renderer, full ride on iPhone 13: about 3.7 min — [OpenBikeComputer #2081](https://github.com/timohueser/OpenBikeComputer/issues/2081)
  - About 70 ms per 720p frame for image-to-buffer conversion in a naive AVAssetWriter pipeline — [Apple Developer Forums 51928](https://developer.apple.com/forums/thread/51928)
  - Another spike summary (search extract) cited about 124 ms per frame, or about 3 min for a 45 s flyover at 30 fps — [OpenBikeComputer issues via search](https://github.com/timohueser/OpenBikeComputer/issues/2081). This figure did not appear when I fetched the issue page directly, so treat it as unconfirmed.
- The maplibre-gl-video-export README advises 24–30 fps and lower resolutions for long or large animations — [maplibre-gl-video-export](https://github.com/bjperson/maplibre-gl-video-export)
- MP4/H.264 may need patent licensing for commercial distribution (per that README) — [maplibre-gl-video-export](https://github.com/bjperson/maplibre-gl-video-export)

### Inferences
- **Rough on-device budget:** a 30 s 1080p clip at 30 fps is 900 frames. At 100–250 ms per frame (camera set, idle wait, readback, encode), that is about 1.5–4 min. At 60 fps (1,800 frames) it is about 3–7.5 min. 4K has 4× the pixels, so expect roughly 2–4× longer and much higher memory use. These are extrapolations, not measurements.
- Practical defaults:
  - 1080p30 for free users.
  - 1080p60 and 4K for Pro.
  - Render at 30 fps and encode at 60 only if motion blur or frame interpolation is added.
  - Use HEVC where supported, with an H.264 fallback (watch the HEVC frame-ordering pitfall).
- Pre-warm tiles before export by running a fast, low-resolution pass along the camera path, so the full-resolution pass rarely waits on the network. Mapbox tile caching also cuts repeated network use.
- On iOS, the simplest way to add music is a second AVAssetWriter audio input fed from an AVAssetReader of the music file (trimmed and faded). Alternatively, write silent video first and then run AVMutableComposition + AVAssetExportSession (background knowledge; not verified in this session).
- On iOS 13+, background exports need `BGProcessingTask` or must stay in the foreground; long exports should show progress and be resumable (background knowledge).

### Gaps
- I found no published Mapbox-on-mobile frame-render benchmarks, and no iPhone or mid-range Android numbers for HEVC or H.264 4K encode throughput.
- I found no data on thermal throttling during long exports on mid-range Android devices.

## 7. Attribution and terms-of-service constraints on exported videos

### Takeaway
Every provider requires attribution inside the video frame: the Mapbox logo plus © Mapbox © OpenStreetMap; OpenMapTiles/OSM credit for OpenFreeMap; Google's logo plus data-provider strings. The biggest legal risk is **Mapbox's video clause**. The Oct 2025 Product Terms restrict Licensed Map Content in video media unless expressly permitted. They allow video distributed via Internet, cable and satellite, and allow promotional video of your own app. Broader video rights can be bought in an Order. For an app whose core output is user-exported map videos posted to Instagram or TikTok, get written confirmation or an Order addendum from Mapbox sales before launch. Google 3D Tiles and Apple MapKit have no clear basis for exporting user videos.

### Cited Findings
**Mapbox**
- Per search extracts of the Mapbox Product Terms (Oct 1, 2025 PDF; promotional clause renumbered to §1.7.1):
  - Customers may not use Licensed Map Content in printed or video media unless expressly permitted.
  - Video media are limited to video distributed by Internet, cable and satellite.
  - Promotional use for the Customer's Licensed Application is allowed.
  - Broader video rights can be purchased in an Order.
  - The customer must meet all attribution requirements "except for the requirement to include the URL links where that is not feasible".
  - Source: [Mapbox Product Terms Oct 2025 (PDF)](https://cdn.prod.website-files.com/609ed46055e27a02ffc0749b/68dddd2815cb3d82685f0096_Mapbox%20Product%20Terms%20(October%201,%202025).pdf); [Mapbox Product Terms Aug 2023 (PDF)](https://uploads-ssl.webflow.com/5d4296d7a839ea49599adba1/64dcfbaf8b0b4e80b42d5c40_Mapbox%20Product%20Terms%20(August,%202023).pdf). I could not open the PDFs directly (DNS failure), so this is the search tool's reading of them.
- The 2020 Service Terms were narrower. They allowed video only to promote your Licensed Applications, "so long as the Licensed Map Content is shown incidentally in the context of the Licensed Applications" — [Mapbox Service Terms 04/2020 (PDF)](https://assets.website-files.com/5d4296d7a839ea49599adba1/5ea348f6b72add6c63b8d0aa_Mapbox%20Service%20Terms.pdf). A 2023–24 version also contained the "shown only incidentally" language — [Mapbox Product Terms Aug 2023](https://uploads-ssl.webflow.com/5d4296d7a839ea49599adba1/64dcfbaf8b0b4e80b42d5c40_Mapbox%20Product%20Terms%20(August,%202023).pdf)
- Required attribution is the Mapbox logo, "© Mapbox" and "© OpenStreetMap", "prominent and can be easily viewed by End Users" — [Mapbox Product Terms (search extract)](https://cdn.prod.website-files.com/609ed46055e27a02ffc0749b/68dddd2815cb3d82685f0096_Mapbox%20Product%20Terms%20(October%201,%202025).pdf)
- The snapshotter can burn in attribution and the logo (`showsAttribution`, `showsLogo`) — [mapbox-maps-ios CHANGELOG](https://github.com/mapbox/mapbox-maps-ios/blob/main/CHANGELOG.md)

**OpenFreeMap / OSM**
- "Alternative clients, printed media, and video must credit OpenMapTiles and OpenStreetMap" — [OpenFreeMap README](https://github.com/hyperknot/openfreemap)

**Google**
- Map Tiles policies were updated to allow **promotional videos** of experiences you build, with the UI and brand attribution policies still applying — [Google preview blog](https://mapsplatform.google.com/resources/blog/photorealistic-3d-tiles-now-preview-updated-daily-quotas/)
- The Google logo and data-attribution strings must be shown in full and unaltered. Caching, data extraction and offline use are prohibited. Hybrid scenes must indicate which parts come from Google — [Map Tiles API policies](https://developers.google.com/maps/documentation/tile/policies)

**Apple**
- The Apple Maps service content "cannot be used in any way whatsoever, except as agreed by Apple in writing" (consumer terms) — [Apple Maps Terms of Use](https://www.apple.com/legal/internet-services/maps/terms-en.html)
- Apple partner marketing guidance requires written Apple approval for marketing materials using Maps imagery — [Apple Business image best practices (PDF)](https://business.apple.com/partners/assets/image-best-practices.pdf)
- The OpenBikeComputer spike left "MapKit imagery recording/sharing terms" as an open question — [OpenBikeComputer #2081](https://github.com/timohueser/OpenBikeComputer/issues/2081)

**Third-party vehicle models**
- CC-BY models require credit — [Cinevva license guide](https://app.cinevva.com/guides/game-asset-licenses)

### Inferences
- An exported video made by an end user and posted on social media is arguably neither "promotional video of the Customer's application" nor clearly covered by Internet video distribution for the end user's own purposes. That reading is ambiguous, so this is a **launch-blocking item to clear with Mapbox in writing**.
- Many existing apps appear to do this, though I could not confirm which map provider they use.
- Whatever the provider, burn the logo and attribution into every exported frame (a bottom corner that stays clear in 9:16 safe areas) and do not allow users to remove it. Keep the app's own watermark separate from the map attribution.
- MapLibre with self-hosted OSM data (ODbL) has the clearest rights position: credit "© OpenStreetMap contributors" (plus OpenMapTiles or Protomaps as applicable), and there is no vendor video clause. That makes it the legal fallback if Mapbox will not grant end-user video rights at reasonable cost.
- Google 3D Tiles terms allow promotional videos, but user-generated video export is not clearly covered and caching is banned. Avoid it until Google confirms in writing.

### Gaps
- I could not read the full current Mapbox Product Terms PDF or the Mapbox attribution documentation directly. There is no direct quote of the exact §1.7 text and no confirmation of end-user video rights.
- I found no Google Maps Platform statement on end-user-generated video export, and no current Apple MapKit developer-license text on recording or exporting map imagery.
- I found no evidence of which map provider Travel Animator, Mult.dev or TravelBoast use, or what licenses they hold.

## 8. Recommended stack (iOS first, then Android)

### Takeaway
**Recommendation:**
- Mapbox Maps SDK v11 on both platforms, using the Standard style with globe and terrain, `ModelLayer` vehicles and elevated flight arcs.
- A custom deterministic render loop (export-sized MapView or Snapshotter → AVAssetWriter on iOS; MediaCodec or Media3 `RawAssetLoader` on Android).
- Flight arcs computed locally; Mapbox Directions called once per road leg and cached.
- Quaternius/Poly Pizza CC0 vehicles.

Estimated map and routing cost is about $0/month at 1k and 10k MAU and about $300–900/month at 100k MAU. Before writing code, run two spikes: (1) whether Snapshotter or MapView capture renders model layers, globe and terrain at acceptable ms per frame on an iPhone 12–13-class device, and (2) written confirmation of Mapbox terms for end-user video export. Keep MapLibre plus self-hosted PMTiles as the cost and legal fallback, accepting that it has no 3D terrain until MapLibre ships it.

### Cited Findings
- Mapbox v11 provides stable ModelLayer, node overrides, elevated lines, globe and terrain fixes, and Standard style options through Oct 2026 — [mapbox-maps-ios CHANGELOG](https://github.com/mapbox/mapbox-maps-ios/blob/main/CHANGELOG.md)
- Mapbox mobile pricing: 25k MAU free, then $4.00/1k (25k–125k). Snapshots count toward MAU — [Woosmap Mapbox pricing](https://www.woosmap.com/blog/mapbox-pricing); [Mapbox Android pricing guide](https://docs.mapbox.com/android/maps/guides/pricing/)
- MapLibre Native lacks 3D terrain, and globe is only in an Oct 2026 pre-release — [MapLibre Style Spec terrain](https://maplibre.org/maplibre-style-spec/terrain/); [MapLibre Native releases](https://github.com/maplibre/maplibre-native/releases)
- Self-hosted planet PMTiles is about 120 GB; R2 storage costs $0.015/GB-month with no egress fees — [Protomaps downloads](https://docs.protomaps.com/basemaps/downloads); [Cloudflare R2 pricing](https://developers.cloudflare.com/r2/pricing)
- The deterministic per-frame "set camera → wait idle → capture" loop is proven in Remotion and MapLibre tooling — [Remotion maps docs](https://github.com/remotion-dev/remotion/blob/main/packages/docs/docs/maps.mdx); [maplibre-gl-video-export](https://github.com/bjperson/maplibre-gl-video-export)
- Mapbox's video clause restricts video use except where expressly allowed, and extra rights can be purchased — [Mapbox Product Terms Oct 2025](https://cdn.prod.website-files.com/609ed46055e27a02ffc0749b/68dddd2815cb3d82685f0096_Mapbox%20Product%20Terms%20(October%201,%202025).pdf)

### Inferences
- **Phase 1 (iOS MVP):**
  - Mapbox v11 with Swift and UIKit/SwiftUI.
  - A timeline engine: keyframes → eased camera; route slicing with turf-swift; a Swift great-circle helper.
  - ModelLayer vehicles; an export-sized MapView capture loop into AVAssetWriter (BGRA pixel buffer pool, H.264/HEVC, audio input for music).
  - Presets for 9:16, 1:1 and 16:9; 1080p30 free, 1080p60 and 4K Pro.
  - Burned-in Mapbox attribution.
- **Phase 2 (Android):** Mapbox Android v11 with the same timeline logic (shared through Kotlin Multiplatform or a ported module), a TextureView/snapshot capture loop, and Media3 Transformer with `RawAssetLoader` or Surface-input MediaCodec plus a looping background music sequence.
- **Hedge / server path:** if on-device export is too slow on mid-range Android, or if Mapbox will not license user video export, move rendering to headless MapLibre GL JS or Mapbox GL JS on GPU workers. Mapbox GL JS would need its own web pricing and terms review; MapLibre with self-hosted PMTiles avoids both but has no terrain unless using GL JS terrain, which MapLibre GL JS supports per its examples.
- **Premium later:** a Google Photorealistic 3D "city flyover" intro rendered with Cesium, only after Google confirms user-video terms. Budget about $6 per 1,000 sessions.

### Gaps
- I did not cost the server-side rendering option: GPU instance price, Remotion licensing for companies, and Mapbox GL JS web map-load pricing were not researched.
- I could not verify Mapbox Android v11 feature parity or the exact snapshot API.
- I have no measured on-device export throughput for Mapbox with terrain and models. A spike is needed before committing to on-device 4K60.
