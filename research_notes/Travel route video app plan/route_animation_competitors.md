# Mobile Travel Route Animation Apps: Competitor Features, Pricing and User Pain Points (as of 14 Oct 2026)

Method note for the report writer: `WebFetch` could not resolve DNS in this session, so pages were downloaded with curl and read as text. Sources were public store listings, developer sites, help centres, press articles, the public App Store review RSS feed, and the public review data that the Google Play web listing loads. No APKs were downloaded, nothing was decompiled, and no mod sites were used.

Review corpus: 5,516 reviews in total.
- App Store RSS (US, GB, IN and AU storefronts):
  - Travel Animator: 148 reviews (Oct 2023 to Oct 2026)
  - TravelBoast: 825 (2019 to Oct 2026)
  - Mult.dev: 88 (2022 to Jun 2026)
  - Relive: 971
- Google Play, newest reviews:
  - Travel Animator: 1,000 (16 Jun 2025 to 11 Oct 2026)
  - TravelBoast: 1,000 (Feb 2025 to Oct 2026)
  - Mult.dev: 334 (Oct 2023 to Sep 2026)
  - MapAnim: 150
  - Relive: 1,000

Complaint themes were tagged with keyword regexes. One review can carry more than one tag, so the counts are approximate and should be read as relative weights, not exact shares. Reddit search was blocked by a bot wall and `site:reddit.com` searches returned no threads, so Reddit is a gap. YouTube comments were not reachable either.

## Q1. App-by-app feature inventory, and the feature matrix

### Takeaway
There are three tiers:
- **Mobile 3D-vehicle animators.** Travel Animator (Lascade), TravelBoast, and a 2026 wave of clones led by MapAnim. They compete on vehicle library size, map styles and 4K export.
- **Browser or credit-based tools.** Mult.dev, AvoMap, Anim8map, Mapimator and AnimateMyTravel. They compete on real-road and sea routing, timeline and camera control, music, and paying per video instead of subscribing.
- **Auto-generated recaps inside bigger apps.** Relive, Strava Flyover and Polarsteps Trip Reels make a video automatically from recorded GPS. None of them offers vehicle and stop storytelling.

AvoMap (web) currently has the deepest toolset: per-leg camera keyframes, a timeline, elevation charts and 3D vehicles built from photos. Travel Animator has the broadest mobile toolset. Its 2025–26 additions are AI routing (Journey AI), an MCP server, country-flag highlights and custom models.

### Cited Findings

**Travel Animator (Lascade LLC; Android package `com.travelanimator.routemap`; iOS id6462844561)**
- **Platforms.** iOS (also runs on iPad and Apple-silicon Macs) and Android. The iOS app is 372.4 MB, needs iOS 16.4+, and supports 30 languages. — [App Store](https://apps.apple.com/us/app/travelanimator-journey-route/id6462844561)
- **Release cadence.** Version 4.0.9 shipped in early Oct 2026, and nearly weekly builds ran through Aug–Oct 2026. — [App Store](https://apps.apple.com/us/app/travelanimator-journey-route/id6462844561)
- **Basic workflow.** Add a start, a destination and "+" stops. Drag the line between points to make curves; double-tap a point to remove it. Long-press a point to assign a 3D vehicle, photos, text or elements. Preview, then export in HD or 4K. — [travelanimator.com](https://www.travelanimator.com/)
- **Route input** — [How-to guide, Aug 2026](https://travelanimator.com/hub/how-to-use-the-travel-animator-app/):
  - Search by city or place, by latitude/longitude, or by airport IATA code (e.g. DXB).
  - Drag stops to reorder them.
  - Paste a Google Maps directions link.
  - Upload a GPX file.
  - Turn on "Real Route" per stop, so that leg follows roads instead of a straight line.
  - Undo and redo.
- **Journey AI.** A chat assistant that plots a route from plain text such as "Fly from London to Tokyo, then take the train to Kyoto." — [Journey AI guide, 8 Oct 2026](https://www.travelanimator.com/hub/how-to-plan-a-trip-with-the-journey-ai-route-assistant). It shipped in v4.0.0 on 11 Sep 2026. — [App Store version history](https://apps.apple.com/us/app/travelanimator-journey-route/id6462844561)
- **Google Maps link import (Product Hunt, Jan 2026).** Only a single link was supported, and imported Google Maps routes could not be edited. The team said support for multiple links depended on demand. — [Product Hunt launch via hunted.space](https://www.hunted.space/product/travel-animator/launches/travelanimator)
- **Vehicles and objects.** 300+ 3D vehicle models (cars, planes, trains, boats, horses and more) — [travelanimator.com](https://www.travelanimator.com/). Also:
  - 80+ 3D landmark models that pop up along the route (Eiffel Tower, Taj Mahal and others).
  - An "Avatar": upload your photo and "your face travels the whole journey".
  - A custom 3D model service. — [travelanimator.com](https://www.travelanimator.com/)
- **Custom model service details.** The user uploads front, back and side photos. The model is either shared with the community or private to the account. Influencers with 1M+ followers get models for free. — [model.travelanimator.com](https://model.travelanimator.com/)
- **Model file format (verified from public web data).** The model pages reference `.glb` (glTF binary) files hosted at dashboard.lascade.com, each with "premium" and "type: land" flags. — [model page](https://www.travelanimator.com/models/577-tuk-tuk)
- **Map styles.** 30+ styles, including:
  - Terrain, Satellite, a 3D Globe, Topo and Watercolor.
  - Pixel, Comic, Military, "Spiderman" and "Green Screen".
  - Seasonal Winter and Christmas themes.

  Every style can be shown flat (2D) or tilted (3D). — [Maps page](https://www.travelanimator.com/maps)
- **Editing and export controls** — [How-to guide](https://travelanimator.com/hub/how-to-use-the-travel-animator-app/):
  - Resolution and aspect ratio.
  - 2D or 3D map.
  - Model size.
  - Path-line customization.
  - Place labels.
  - Highlight a region or stop.
  - Video duration.
  - "SceneStyle", which offers cinematic camera and zoom presets.
  - Distance unit (km or miles).
  - Country flags.
  - Cover image.
  - Photos or videos plus text at each point.
  - In-app chat support and a tutorial.
- **Feature additions in 2026.** "New Country Flag Highlights" (v3.9.4, Aug 2026) and "More styles to display distance" (v3.8.5, Jun 2026). — [App Store](https://apps.apple.com/us/app/travelanimator-journey-route/id6462844561)
- **Export specs.** HD is 1920×1080 on the free plan; 4K (3840×2160) needs Pro. The company's own guide admits that "even a 4K export can look blurry or pixelated": tile sharpness depends on tuning Duration together with Scene Style zoom (1×, 2× or 3×). — [TA high-quality guide](https://www.travelanimator.com/hub/how-to-generate-high-quality-map-animation-using-travelanimator)
- **Branding and camera.** A custom logo is part of Pro. Camera control is "manual scene & zoom styles". Watermark-free export, place labels and a cover image are listed. — [TA vs Mult.dev](https://www.travelanimator.com/compare/travelanimator-vs-multdev)
- **Missing integrations.** No live GPS tracking and no Strava or Garmin account connection; GPX import only. — [TA vs AvoMap](https://www.travelanimator.com/compare/travelanimator-vs-avomap); [TA vs Polarsteps](https://www.travelanimator.com/compare/travelanimator-vs-polarsteps)
- **MCP server for AI assistants.** A Python package, v1.3.0 (reviewed 29 Sep 2026). It needs Python 3.12+, runs as a local stdio process, and requires an account. Each export costs one purchased credit, plus premium access and internet. — [TA MCP docs](https://www.travelanimator.com/mcp)
- **GPX library.** Travel Animator hosts a free GPX route library (four routes at the time of reading) as an SEO and onboarding funnel. — [TA GPX page](https://www.travelanimator.com/gpx)
- **Tech stack verification (only partly confirmed from public sources):**
  - Models are glTF/.glb (confirmed above).
  - The website uses PostHog analytics. — [TA privacy policy](https://www.travelanimator.com/privacy-policy)
  - Sign-in is with a Google account. — [How-to guide](https://travelanimator.com/hub/how-to-use-the-travel-animator-app/)
  - The iOS privacy label declares usage and advertising data for third-party advertising. — [App Store](https://apps.apple.com/us/app/travelanimator-journey-route/id6462844561)
  - Mapbox, Firebase and Adapty were **not** confirmed from any public page I could read (see Gaps).

**TravelBoast (iOS seller Alexsandr Kuznetsov, id1476504378; Android Urobots GmbH, `io.urobots.travelboast`; site lists DOJO MEDIA)**
- **Workflow.** Pin a route manually, or import GPX or Google Maps. Pick a vehicle, add your own photos or videos, change the map style, and export for social media. — [travelboast.com](https://travelboast.com/)
- **Long-press menu.** Transport can be changed at any point. Long-press also opens "Annotation", which adds a description, photo or video to a point. — [TravelBoast FAQ](https://travelboast.com/faq)
- **Cloud sync and custom models.** Routes sync to the cloud after a Google or Apple login. Custom 3D models are made on request "in some cases". — [TravelBoast FAQ](https://travelboast.com/faq)
- **Line styling and media.** Colour, thickness and animation are adjustable, and photos and short clips are supported. — [TravelBoast tutorials](https://travelboast.com/tutorials)
- **Vehicle count claims differ by source:**
  - "300 unique means of transport" — [App Store](https://apps.apple.com/us/app/id1476504378)
  - "160 unique means of transport" — [Google Play](https://play.google.com/store/apps/details?id=io.urobots.travelboast)
  - "250+" — [travelboast.com](https://travelboast.com/)
  - "100+ transport options" — [tutorials](https://travelboast.com/tutorials)
- **Positioning claims** — [TravelBoast "Why users choose us"](https://travelboast.com/advantages):
  - "We don't use AI… every model is handcrafted… genuinely suitable for 4K video."
  - Combining two 3D models (for example a person and a vehicle).
  - Works on older devices.
  - Lists OpenStreetMap, Google Maps, Apple Maps, GPX and Mapbox as map and data partners.
  - Claims smooth animation that "follows roads and GPS tracks".
- **Release cadence.** Frequent "Added new models" updates; v2.55 shipped in Oct 2026. — [App Store](https://apps.apple.com/us/app/id1476504378)
- **Analytics.** Uses Google Analytics for Firebase. — [TravelBoast privacy policy](https://travelboast.com/privacy-policy)

**Mult.dev (Sergey Nikitin; web, iOS id1606800134, Android `dev.mult`)**
- **Platforms.** Web, iOS and Android, with projects synced across them. — [Mult.dev first-video tutorial](https://mult.dev/articles/how-to-create-your-first-video-in-multdev)
- **Route input** — [Mult.dev first-video tutorial](https://mult.dev/articles/how-to-create-your-first-video-in-multdev):
  - Type city names, addresses or GPS coordinates.
  - Start from a ready-made route template.
  - Import GPX, KML or GeoJSON (Pro).
  - Drag to reorder stops.
  - Set how long the animation lingers on each stop.
- **Styling options:**
  - Route title.
  - Country-flag toggle.
  - Emojis and stickers, and custom flags.
  - Background: solid, gradient or map.
  - Line style and thickness.
  - Label behaviour.
  - Camera: follow closely or wide.
  - Frame rate.
- **Music.** Dozens of pre-cleared tracks (ambient, synthwave, folk, pop, electronic, cinematic).
- **Aspect ratios.** 16:9, 9:16 or 1:1.
- **Rendering and sharing.** Rendering takes 30 s to 2 min. Output is an MP4 download or a shareable view link.
- **AI and extra formats.** An AI assistant builds routes, and IGC import plus HEIC and WebP photos were added in v2.2.0 (Jun 2026). — [App Store](https://apps.apple.com/us/app/id1606800134)
- **Routing.** Free accounts get only straight-line air routes. Pro adds real land routing (via Google Maps) and sea routing (via NAVAPI). — [Mult.dev packages article](https://mult.dev/articles/packages-sizes-and-subscriptions)
- **Resolutions.** Square outputs of 640×640, 1280×1280 and 1920×1920 are offered. — [Mult.dev "Best tools" article](https://mult.dev/articles/best-travel-map-animation-tools-in-2026). This is a vendor-written article.
- **Mult.dev free vs Pro:**

  | | Free | Pro |
  |---|---|---|
  | Videos | 5 | 5 / 25 / 100 |
  | Map nodes | 10 | 100 |
  | Resolution | 768p | 1920p |
  | Frame rate | 30 fps | 60 fps |
  | Mult.dev logo | Required | Optional |
  | Images | 10 | 100 |
  | GPX/KML/GeoJSON, custom colours, land and sea routes, music | — | Pro only |

  — [Mult.dev pricing](https://mult.dev/pricing)

  The tutorial says up to 150 locations on Pro, which conflicts with the 100 nodes in the pricing table. — [tutorial](https://mult.dev/articles/how-to-create-your-first-video-in-multdev)
- **Transport visuals.** Mult.dev added 3D-rendered transport models alongside its 2D icons. Camera control is an automatic path with start and end zoom. — [TA vs Mult.dev](https://www.travelanimator.com/compare/travelanimator-vs-multdev). This is a competitor's page.
- **Backend evidence (cloud rendering).**
  - Play reviews mention a render queue ("Keeps saying I'm >10 in queue").
  - A Dec 2025 error message quotes a Firestore document-size limit (`/createVideo … documents/renders/… maximum allowed size of 1,048,576 bytes`), which suggests a Firebase/Firestore backend with server-side rendering. — [Google Play listing, reviews](https://play.google.com/store/apps/details?id=dev.mult)
- **Retention.** The terms of service say generated videos are stored for 24 hours. — [Mult.dev terms](https://mult.dev/terms)
- **Commercial use.** Allowed; the logo is removed on Pro. — [Mult.dev tutorial FAQ](https://mult.dev/articles/how-to-create-your-first-video-in-multdev)

**Relive (Relive B.V.)**
- **What it is.** Records GPS on the phone or Apple Watch, or imports from Garmin, Suunto, Apple Health and others, then auto-generates a 3D landscape flyover.
- **Free tier.** One video per activity with no edits, horizontal or vertical; highlights such as max speed; tagging friends; an interactive memory map.
- **Relive Plus.** Up to 100 photos, music, unlimited edits, activities over 12 h, title and type changes, speed control, longer photo display, 12 colour themes, no end credits, and HD.

  — [App Store](https://apps.apple.com/us/app/id1201703657); [Relive Plus page](https://www.relive.com/plus)
- **Imports and missing features.** Imports GPX, FIT and TCX. Has no 3D vehicles. 4K is not advertised. — [TA vs Relive](https://www.travelanimator.com/compare/travelanimator-vs-relive). This is a competitor's page.
- **Clip limits.** Reviewers report that video clips are limited to 60 s in total and 10 s each. — [App Store reviews via RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1201703657/sortby=mostrecent/json)

**Strava Flyover, and Fatmap**
- **Strava Flyover** — [Strava support](https://support.strava.com/en-us/articles/15401641):
  - For subscribers only, in the app only (not on the web).
  - Works on activities, routes and segments.
  - Play, pause, speed control and scrubbing; pinch to zoom; re-centre.
  - Overlays show the title, real-time speed, distance and elevation.
  - Can be shared to an Instagram story.
  - Respects privacy zones.
  - Long activities are rendered asynchronously, with a push notification when ready.
- **Fatmap.** Shut down on 1 Oct 2024. Flyover had already been built from Fatmap technology, and Strava said it would port Fatmap's 3D satellite maps. — [TechCrunch, Jun 2024](https://techcrunch.com/2024/06/26/strava-to-shutter-3d-mapping-platform-fatmap-18-months-after-acquisition). Pre-2025, so possibly outdated.

**Polarsteps (Trip Reels)**
- **Launch.** Trip Reel launched in summer 2025. It automatically turns photos, videos and visited places into short reels, and the CEO cited a growing short-video sharing trend among younger travellers. — [Polarsteps summer 2025 release](https://news.polarsteps.com/news/polarsteps-summer-2025-release-is-here)
- **2026 update.** Reels now include "dynamic map flyovers that reflect the actual terrain". Polarsteps says it has 20M+ travellers. — [Polarsteps summer 2026 release](https://news.polarsteps.com/news/polarsteps-launches-summer-2026-release-new-tools-for-planning-privacy-and-sharing)

**Flight apps (Flighty, Flightradar24)**
- **Flighty Passport.** Shows lifetime flight stats (distance, hours, airports, aircraft, delays) on a global map, shareable in several formats. — [Flighty help](https://flighty.com/help/passport). I found no evidence of an animated route video.
- **Flightradar24 3D view.** Free users get limited sessions, unlocked by watching an ad or subscribing. — [FR24 support](https://support.fr24.com/support/solutions/articles/3000123424-the-flightradar24-3d-view)
- **Flightradar24 playback.** Seven days free; Gold covers 365 days and Business 3 years. — [FR24 blog](https://www.flightradar24.com/blog/inside-flightradar24/playback-is-now-available-in-the-flightradar24-app/)
- **Flightradar24 exports.** CSV and KML exports are available to subscribers. — [FR24 redesign blog](https://www.flightradar24.com/blog/inside-flightradar24/introducing-the-new-flightradar24/)
- I found no source showing that either app exports an animated flight-path video.
- **Dedicated logbook apps exist but are small.** For example, "FlightLog – My Flight Diary" has 10 ratings. — [iTunes Search API "flight log map"](https://itunes.apple.com/search?term=flight+log+map&entity=software&country=us)

**AvoMap (web; credits)** — [AvoMap features](https://avomap.com/features); [AvoMap pricing](https://avomap.com/pricing)
- **Route legs:**
  - Leg-by-leg routes: drives follow roads, bike legs avoid highways, flights go between 7,695 airports, and trains follow the railway; river legs too.
  - Draw your own path where needed.
  - Import GPX, FIT, KML, KMZ or TCX, or connect Strava.
  - Trim or reroute an imported track.
- **Timeline.** Leg blocks with pauses.
- **Camera.** Per-leg zoom, tilt and heading; six presets (follow, flyover, scout, parallel, orbit, fixed); custom keyframes; fly-in and fly-out.
- **Route line and vehicles.** Colour, width and opacity for the line. 3D vehicles that bank, sit on the road or turn with the water. Users can photograph their own vehicle from four sides and AvoMap builds the model.
- **Overlays and markers:**
  - Titles, photos, clips and animated counters for distance, elevation and time.
  - 100+ marker presets and an icon creator.
  - An elevation chart.
  - Photos are auto-placed from their GPS EXIF data.
- **Map styles.** Seven styles, each with dawn, day, dusk and night lighting.
- **Output.** Landscape, portrait or square; 1080p or 4K, always at 60 fps; cloud rendering.

**MapAnim (Shenzhen Tapyin; iOS id6778246890, launched 16 Jun 2026)**
- **Features:**
  - Google Maps link import and GPX import.
  - Vehicles, photos, and videos played picture-in-picture during the animation.
  - "Flyover mode" (v1.0.8).
  - Real route navigation, avatars, and viewing-angle and zoom controls (v1.1.0, Sep 2026).

  — [App Store](https://apps.apple.com/us/app/id6778246890)
- **Free tier.** A Play reviewer says most features are free. — [Google Play](https://play.google.com/store/apps/details?id=mapanim.travelmapanimation.routemap)

**Waymotion (Vadym Drahanov; iOS, launched 8 Jul 2026)**
- An AI route builder from plain text ("New York, then Amsterdam, then a train to Berlin").
- Globe and satellite styles.
- HD or 4K export.
- Photos at waypoints.
- Speed, camera-angle and animation-style controls.
- Frequent model drops, such as caravans.

— [App Store](https://apps.apple.com/us/app/id6767525852)

**Smaller or niche entrants found in store searches**
- **SkyGlide** (on-device rendering) — [App Store](https://apps.apple.com/us/app/id6758352711):
  - GPX flyover, landmark orbit and custom paths.
  - Per-waypoint camera angle, altitude, heading and distance.
  - Standard, Satellite or Hybrid maps.
  - 9:16, 16:9, 1:1 and 4:5.
  - Fully on-device rendering ("routes never uploaded").
  - Elevation-profile overlay, live trip stats from GPX and Health, and 60 fps.
- **TripReel** — [App Store](https://apps.apple.com/us/app/id6757102726):
  - Auto-detects trips from photo geotags.
  - Fully offline, on-device processing.
  - Animated globe timeline.
  - 4K export.
  - "Hundreds of new vehicles" in v2.0 (May 2026).
- **Cinemaly** (Android) — [Google Play](https://play.google.com/store/apps/details?id=com.veulerv.cinemaly):
  - The camera flies between cities, with a story mode.
  - Nothing is uploaded to a server (per a reviewer).
- **Clone apps with credits plus subscriptions.**
  - "Travel Route Animation Video" (Ruby Lakhani): pick start and destination, drag points, choose vehicles and map styles. — [App Store](https://apps.apple.com/us/app/id6743530581)
  - "Travel Animator Journey Video" (AppziBrain): day, night, satellite and terrain themes; photos at stops; 3D zooms and pans; HD; contains ads. — [App Store](https://apps.apple.com/us/app/id6748111417)
- **Other 2026 iOS route-animator names** surfaced by App Store search and "You might also like" lists:
  - TourVision, TravelMotion, AeroAnimate, TripScene and "Travel Animator – TripMap".
  - Routeclip, Roamotion, RouteMova, MapReel, ReelTrip and MapVibe.

  — [iTunes Search API "travel map animation"](https://itunes.apple.com/search?term=travel+map+animation&entity=software&country=us); [Waymotion App Store page](https://apps.apple.com/us/app/id6767525852)
- **Web tools:**
  - **AnimateMyTravel**: free, no signup, up to 4K, no watermark. It renders in the browser and has an AI/MCP "Studio" that also does war, empire and data maps. — [animatemytravel.com](https://animatemytravel.com/)
  - **Anim8map**: claims 100,000+ users. Per-leg transport, photos per leg and background music, using OpenStreetMap routes. — [anim8map.com](https://anim8map.com/)
  - **Mapimator**: MapLibre-based, up to 4K, AI that handles camera, routes and regional highlights, MP4 or GIF. — [mapimator.com](https://mapimator.com/)

### Feature matrix (feature × app)

Legend: ✓ = documented; ✕ = documented as absent; P = paid tier only; ? = not documented or could not be verified. Sources for each column are listed under the table. The "Clones" column covers the low-end clones (Ruby Lakhani, AppziBrain, Flowmatic).

| Feature | Travel Animator | TravelBoast | Mult.dev | MapAnim | Waymotion | AvoMap (web) | Relive | Strava Flyover | Polarsteps Reels | SkyGlide | TripReel | Clones |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Platforms | iOS/Android (+Mac M1) + MCP | iOS/Android | Web+iOS+Android (synced) | iOS/Android | iOS/Android | Desktop web | iOS/Android | iOS/Android app | iOS/Android/web | iOS | iOS | iOS/Android |
| Manual stop search | ✓ (city, lat/long, IATA) | ✓ (Apple Maps search on iOS per reviews) | ✓ (city, address, coordinates) | ✓ | ✓ | ✓ (+7,695 airports) | ✕ (GPS-recorded) | ✕ | ✕ (tracked) | ✓ (drop waypoints) | ✕ (auto) | ✓ |
| Google Maps link import | ✓ (single link; alternate routes P) | ✓ | ✓ (10 free) | ✓ | ? | ✕ | ✕ | ✕ | ✕ | ✕ | ✕ | ? |
| GPX import | ✓ free (1 file) | ✓ | P (+KML, GeoJSON, IGC) | ✓ | ? | ✓ (+FIT, KML, KMZ, TCX) | ✓ (+FIT, TCX) | n/a (native) | n/a | ✓ | ✕ | ? |
| Fitness account sync | ✕ | ✕ | ✕ | ? | ? | ✓ Strava | ✓ Garmin, Suunto, Apple Health | native | native | ✓ Health stats | ✕ | ✕ |
| AI text-to-route | ✓ Journey AI (Sep 2026) | ✕ | ✓ AI assistant | ? | ✓ | ✕ | ✕ | ✕ | AI itineraries (planning) | ✕ | ✕ | ✕ |
| Auto-route from photo geotags | ✕ (requested) | ✕ | ✕ | ✕ | ✕ | Photo auto-placement only | Photos placed on track | ✕ | ✓ (tracked trip) | ✕ | ✓ | ✕ |
| Live GPS recording | ✕ | ✕ | ✕ | ✕ | ✕ | ✕ | ✓ | ✓ | ✓ | ✕ | ✕ | ✕ |
| Real-road routing | ✓ per stop | Claimed; reviews say manual dragging | P (Google Directions) | ✓ (Sep 2026) | ? | ✓ road, rail, bike | n/a | n/a | n/a | n/a | ? | ✕ (reviews: "straight line") |
| Sea routing | ? | ? | P (NAVAPI) | ? | ? | ✓ river/boat | n/a | n/a | n/a | ? | ? | ✕ |
| Mixed transport per leg | ✓ | ✓ | ✓ (P for non-plane) | ✓ | ✓ | ✓ | ✕ | ✕ | ✕ | ✕ | ? | ? |
| 3D vehicle library | 300+ (.glb) | 160–300 (inconsistent claims) | 3D models + 2D icons | ✓ | ✓ | ✓ 3D vehicles | ✕ (marker) | ✕ | ✕ | ✕ | ✓ "hundreds" | ✓ "cute vehicles" |
| Custom vehicle from photos | ✓ service | On request | ✕ | ✕ | ✕ | ✓ (4-side photos) | ✕ | ✕ | ✕ | ✕ | ✕ | ✕ |
| Face avatar | ✓ | ✕ | ✕ | ✓ | ? | ✕ | ✕ | ✕ | ✕ | ✕ | ✕ | ✕ |
| 3D landmarks | ✓ 80+ | ✕ | Emojis/stickers | ✕ | ✕ | 100+ marker presets | ✕ | ✕ | ✕ | ✕ | ✕ | ✕ |
| Map styles | 30+ (P for most) | "Multiple" | Several (bg colours, gradients, maps) | ✓ | Globe, satellite, flat | 7 × 4 lightings | 12 colour themes (P) | 3D satellite | Terrain flyover | 3 | Globe | Day/night/satellite/terrain |
| 3D globe / terrain | ✓ / ✓ | ✓ globe | ✓ globe | ✓ flyover | ✓ globe | ✓ terrain | ✓ terrain | ✓ | ✓ terrain | ✓ | ✓ globe | "3D effect" |
| Camera control | Scene Style presets, zoom 1×/2×/3× | Limited (reviews ask for zoom) | Follow/wide, start/end zoom | Angle + zoom | Camera angle | Presets + keyframes per leg | Auto | Pinch, speed, scrub (viewer) | Auto | Per-waypoint camera | Perspective style | "3D zooms/pans" |
| Photos at stops | ✓ | ✓ | 10 free / 100 P | ✓ | ✓ | ✓ | Up to 100 (P) | ✕ | ✓ | ✕ | ✓ (from roll) | ✓ |
| Video clips at stops | ✓ | ✓ | ? | ✓ (PiP) | ? | ✓ (trim) | ✓ (60 s total cap) | ✕ | ✓ | ✕ | ? | ? |
| Place labels / text | ✓ | ✓ annotations | ✓ + emoji + title | ? | ? | ✓ (3 lines, fonts) | Title (P) | Title overlay | ? | ? | Timeline | ? |
| Country flags | ✓ (Aug 2026) | ? | ✓ toggle + custom | ? | ? | ? | ✕ | ✕ | ? | ✕ | ? | ? |
| Distance counter / stats | ✓ distance styles | ✓ ("3,587 km" shown on site) | ? | ? | ? | ✓ animated counters + elevation chart | ✓ stats | ✓ speed, distance, elevation | Stats in app | ✓ elevation + stats | ? | ? |
| Music | ? (not documented) | ? | P (dozens of cleared tracks) | ? | ? | ? | P | ✕ | ? | ✕ | ? | ? |
| Aspect ratios | Customizable (9:16, 16:9) | Reviewers say non-1:1 cropped (2025) | 9:16, 16:9, 1:1 | ✓ "video format" | Reels/TikTok/Shorts | Landscape, portrait, square | Horizontal/vertical | IG story | Reel | 9:16, 16:9, 1:1, 4:5 | ? | ? |
| Max resolution / fps | 4K (P); HD free; fps ? | 4K (P) | 1080p @ 60 fps (P); 768p @ 30 fps free | ? | 4K | 4K @ 60 fps (+1 credit) | HD (P) | ? | ? | 60 fps | 4K | HD |
| Watermark on free | ✓ watermark | ✓ watermark + ads | Logo required | ? | ? | Logo (removal +1 credit) | End credits | Strava branding | ? | ? | ? | ? |
| Saved projects / cloud | 1 free / unlimited P | Device + cloud (P), login sync | Account sync | ? | ? | Autosave + history | Cloud | Cloud | Cloud | "My Videos" | Export trip files | Reviews: no saving |
| Render location | Not verified ("priority rendering" P) | ? | Cloud queue | ? | ? | Cloud | Cloud | Cloud (push when ready) | ? | On-device | On-device | ? |
| Templates | ? | ? | Route templates | ? | ? | Style presets, saved templates | ✕ | ✕ | Auto | ✕ | ✕ | ✕ |
| Share link / direct social | Direct share | Save + share | MP4 + view link | ✓ | ✓ | MP4 | Social + memory map | IG story + links | ✓ | Save/share | ✓ | ✓ |
| Collaboration | ✕ | ✕ | ✕ | ✕ | ✕ | ✕ (Mapimator offers team tools) | Tag friends | Social | Followers / live sharing | ✕ | ✕ | ✕ |
| Custom logo / white-label | P | ? | Logo removal | ? | ? | ✓ (+1 credit) | ✕ | ✕ | ✕ | ✕ | ✕ | ✕ |
| API / MCP | ✓ MCP (credits) | ✕ | ✕ | ✕ | ✕ | ✕ | ✕ | ✕ | ✕ | ✕ | ✕ | ✕ |

Matrix sources by column:
- **Travel Animator:** [site](https://www.travelanimator.com/), [how-to](https://travelanimator.com/hub/how-to-use-the-travel-animator-app/), [plans](https://www.travelanimator.com/plans), [maps](https://www.travelanimator.com/maps), [MCP](https://www.travelanimator.com/mcp), [App Store](https://apps.apple.com/us/app/travelanimator-journey-route/id6462844561)
- **TravelBoast:** [site](https://travelboast.com/), [FAQ](https://travelboast.com/faq), [tutorials](https://travelboast.com/tutorials), [App Store](https://apps.apple.com/us/app/id1476504378)
- **Mult.dev:** [pricing](https://mult.dev/pricing), [packages](https://mult.dev/articles/packages-sizes-and-subscriptions), [tutorial](https://mult.dev/articles/how-to-create-your-first-video-in-multdev)
- **MapAnim:** [App Store](https://apps.apple.com/us/app/id6778246890)
- **Waymotion:** [App Store](https://apps.apple.com/us/app/id6767525852)
- **AvoMap:** [features](https://avomap.com/features)
- **Relive:** [App Store](https://apps.apple.com/us/app/id1201703657)
- **Strava:** [Strava help](https://support.strava.com/en-us/articles/15401641)
- **Polarsteps:** [2026 release](https://news.polarsteps.com/news/polarsteps-launches-summer-2026-release-new-tools-for-planning-privacy-and-sharing), [TA vs Polarsteps](https://www.travelanimator.com/compare/travelanimator-vs-polarsteps)
- **SkyGlide:** [App Store](https://apps.apple.com/us/app/id6758352711)
- **TripReel:** [App Store](https://apps.apple.com/us/app/id6757102726)
- **Clones:** [Ruby Lakhani app](https://apps.apple.com/us/app/id6743530581), [AppziBrain app](https://apps.apple.com/us/app/id6748111417), [Flowmatic app](https://apps.apple.com/us/app/id1617762821)

### Inferences
- **Feature parity is crowded.** The core feature set is now table stakes for any new entrant: manual stops, a 3D vehicle per leg, photos at stops, map style choice, 9:16 export and GPX/Google Maps import. More than 15 near-identical iOS apps launched in 2025–26. Differentiation is moving to:
  1. Route input automation (AI text, photo geotags, Google Maps, Strava).
  2. Cinematic control (camera keyframes, timeline, terrain).
  3. Output quality (sharp tiles at 4K, 60 fps).
  4. Pricing model (credits or lifetime instead of weekly subscriptions).
- **AvoMap is the strongest feature benchmark but is web-only.** A mobile app with AvoMap-level timeline and camera control, plus Travel Animator-level vehicles, would be differentiated.
- **On-device rendering is a privacy selling point.** SkyGlide, TripReel and Cinemaly all use it, and it answers Relive's complaints about uploading and photo-library access.
- **Travel Animator's admitted blurry-tile problem is an opening.** Even 4K exports depend on Duration and zoom tuning, so a competitor that guarantees crisp vector or high-DPI tiles at any zoom has a concrete quality edge.

### Gaps
- **Travel Animator stack claims are not verified.** I found no public page confirming Mapbox as the map SDK, Firebase as the backend, Adapty as the paywall, or on-device rendering. Its privacy policy names only PostHog. The glTF/.glb models are confirmed. Its "Priority Video Rendering" Pro perk and the MCP's "rendering environment" wording leave unclear whether rendering is on-device or in the cloud.
- **Exact frame rate, music support and maximum video length** are undocumented for Travel Animator and TravelBoast.
- **TravelBoast's current map-style count and aspect-ratio support** were not published.
- **Hands-on testing was not possible**, so all feature claims come from documentation, listings or reviews.
- **Waymotion, MapAnim and the other new clones** have thin documentation (camera, music, resolution).

## Q2. Pricing: free tiers, subscription prices, what is paywalled

### Takeaway
- **Subscriptions dominate mobile.** Typical prices are about $3–7 a week, $4–10 a month and $18–45 a year, with lifetime options from $20 to $52.
- **Browser tools favour per-video credits.** Mult.dev sells packs and AvoMap sells credits.
- **What gets paywalled:** most vehicles (often everything except a plane), most map styles, 4K, watermark removal, saved projects, music, real-road routing and file import. The most-resented paywalls are transport type, saving, and features that used to be free.

### Cited Findings
- **Travel Animator, web price.** Pro is $5.99/month or $24.99/year. The free plan is advertised with no time limit and no credit card, and includes:
  - Unlimited HD exports.
  - GPX and Google Maps import.
  - Photos and videos, animated vehicle models and some map styles.

  Pro adds 300+ models, 30+ styles, 4K, watermark removal, unlimited saved routes, alternate Google Maps routes and priority rendering. — [TA plans](https://www.travelanimator.com/plans)
- **Travel Animator, free-plan specifics.** 10+ free models, the default map only, a watermark, and one saved route. — [TA how-to](https://travelanimator.com/hub/how-to-use-the-travel-animator-app/)
- **Travel Animator, iOS in-app purchases as listed** (the labels are inconsistent; reviewers report lifetime activation problems) — [App Store](https://apps.apple.com/us/app/travelanimator-journey-route/id6462844561):
  - Monthly $6.99
  - Yearly $24.99
  - "One Week Subscription" $24.99
  - "One Year Subscription" $22.00
  - Lifetime $52.00
- **Travel Animator, Google Play.** In-app purchase range $2.99–$99.99 per item. — [Google Play](https://play.google.com/store/apps/details?id=com.travelanimator.routemap). This is the first price range on the listing page; attribution to Travel Animator is assumed.
- **Travel Animator, other monetization:**
  - MCP exports cost one credit each. — [TA MCP](https://www.travelanimator.com/mcp)
  - 50% promo code for the Product Hunt launch (PH50). — [hunted.space](https://www.hunted.space/product/travel-animator/launches/travelanimator)
  - Affiliate programme run through insertaffiliate. — [travelanimator.com](https://www.travelanimator.com/)
- **TravelBoast, iOS in-app purchases** — [App Store](https://apps.apple.com/us/app/id1476504378):
  - One-week $2.99, one-month $5.99.
  - One-year $29.99 and $17.99 (two separate SKUs).
  - Individual vehicles at $1.99 each (Airplane, Car, Backpacker, Big Rig and others).
- **TravelBoast, Google Play.** $5.99–$24.99 per item. — [Google Play](https://play.google.com/store/apps/details?id=io.urobots.travelboast)
- **TravelBoast, subscription benefits.** All models and effects, no watermark, 4K, routes saved on device and in the cloud, and no ads. — [TravelBoast FAQ](https://travelboast.com/faq)
- **Mult.dev, one-time video packs** valid for 3 years — [Mult.dev packages](https://mult.dev/articles/packages-sizes-and-subscriptions):
  - Free: air routes only, 10 photos, no customization, no GPX, 768×432.
  - Pro: 5, 25 or 100 videos.
- **Mult.dev, web prices** per its own article (Mar 2026): Pro 5 $5.99, Pro 25 $24.99, Pro 100 $34.99. — [Mult.dev article](https://mult.dev/articles/best-travel-map-animation-tools-in-2026)
- **Mult.dev, iOS in-app purchases** (different from the web prices) — [App Store](https://apps.apple.com/us/app/id1606800134):
  - Pro Trial $8.99
  - Pro 5 $7.99
  - Pro 25 $19.99
  - Pro 100 $44.99
  - "Pro Base Plan" $39.99
  - "Pro" $49.99
- **Mult.dev, Google Play.** $6.99–$99.99 per item. — [Google Play](https://play.google.com/store/apps/details?id=dev.mult)
- **Mult.dev, conflicting signals on pricing model:**
  - Reviewers in 2024–25 describe "€39 subscription" and "$40/month" options. — [Google Play reviews](https://play.google.com/store/apps/details?id=dev.mult); [App Store reviews](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1606800134/sortby=mostrecent/json)
  - The terms of service describe recurring 1-month and 1-year billing. — [Mult.dev terms](https://mult.dev/terms)
  - A reviewer alleged that pack validity was hidden in the terms. — [mwm.ai listing](https://mwm.ai/apps/id/1606800134)

  These conflict with the "no subscription, valid 3 years" messaging.
- **Relive.** iOS in-app purchases are "Relive Plus" at $6.99 and $38.99 (apparently monthly and yearly). — [App Store](https://apps.apple.com/us/app/id1201703657). Google Play: $6.99–$59.99. — [Google Play](https://play.google.com/store/apps/details?id=cc.relive.reliveapp)
- **Relive moved free features behind Plus.** The developer told a reviewer: "Some customization features that used to be free are now part of Relive Plus." — [App Store](https://apps.apple.com/us/app/id1201703657)
- **Strava.** Flyover is subscriber-only. — [Strava help](https://support.strava.com/en-us/articles/15401641). In 2026, prices vary by country with no figures given. — [Runner's World SA](https://www.runnersworld.co.za/news/strava-clarifies-subscription-price-changes-in-formal-statement). The last concrete figures I found were from 2023: UK £8.99/month and £54.99/year (outdated). — [road.cc](https://road.cc/content/news/strava-criticised-after-monthly-price-rises-30-percent-298449)
- **AvoMap credits.** The editor is free. A 1080p export costs 1 credit; 4K, logo removal, and using 10 or more custom symbols each add 1 credit. There is no subscription. — [AvoMap pricing](https://avomap.com/pricing). Bundle size conflicts across AvoMap's own pages ("$9 for 5 videos" vs "$9 for 3 videos"), and one help article says 4K costs 2 credits. — [AppSumo Q&A](https://appsumo.com/products/avomap/questions/credits-to-render-a-video-1511906/)
- **MapAnim.** Pro Annual $19.99, Pro Lifetime $29.99. — [App Store](https://apps.apple.com/us/app/id6778246890)
- **Waymotion.** Pro Monthly $3.99, Annual $17.99, Lifetime $39.99. — [App Store](https://apps.apple.com/us/app/id6767525852)
- **SkyGlide tokens.** 1 for $1.99, 5 for $3.99, 12 for $7.99, 40 for $14.99. — [App Store](https://apps.apple.com/us/app/id6758352711)
- **MapVibe.** $0.99/month, $6.99/year. — [App Store](https://apps.apple.com/us/app/id6758549951)
- **Low-end clones mix subscriptions with credits:**
  - Ruby Lakhani: $6.99/week, $29.99/year, 300 credits for $12.99. — [App Store](https://apps.apple.com/us/app/id6743530581)
  - AppziBrain: $3.99/week, $9.99/month, $29.99/year, $39.99 lifetime, 200 credits for $17.99; contains ads. — [App Store](https://apps.apple.com/us/app/id6748111417)
  - Flowmatic: weekly $1.99–$2.99, monthly $5.99, lifetime $19.99–$29.99, single models $1.99. — [App Store](https://apps.apple.com/us/app/id1617762821)
- **Mapimator.** $12/month or $99/year; free is 720p with a watermark. — [Mult.dev comparison article](https://mult.dev/articles/best-travel-map-animation-tools-in-2026). This is a competitor's article and unverified.
- **AnimateMyTravel.** Free: no signup, up to 4K, no watermark. — [animatemytravel.com](https://animatemytravel.com/)

### Inferences
- **The best-received pricing is lifetime or one-time.** Users repeatedly say they would "happily pay for a lifetime license" for an app used once or twice a year (see Q4). Mult.dev reviewers praised "Buy what you need. No ads. No recurring subscription."
- **A winning model might combine three things:**
  1. A generous free tier: all transport modes, HD, a watermark.
  2. A low-cost lifetime or "trip pass" (for example a per-trip unlock).
  3. An optional subscription for power creators who want 4K, all styles and cloud projects.
- **Avoid clone tactics.** Clones that combine a subscription with per-export credits are labelled "scammers" in reviews.

### Gaps
- Exact current Google Play SKU prices for Travel Animator, and the iOS SKU durations (whether the $22 "One Year" is a promo), could not be confirmed.
- Strava's 2026 US price was not found.
- Polarsteps Plus pricing was found only as a Play range ($9.99–$34.99 per item). — [Google Play](https://play.google.com/store/apps/details?id=com.polarsteps)

## Q3. Download counts, ratings, revenue estimates

### Takeaway
- **TravelBoast is the volume leader.** It has 10M+ Android installs and claims 20–30M users. It also has the only third-party revenue estimate found: about $45K a month on iOS.
- **Travel Animator is the fastest-moving challenger** at 1M+ on Play. MapAnim reached 100K+ on Play within months of its June 2026 launch.
- **Mult.dev is mid-sized** at 500K+ on Play.
- **Relive, Strava and Polarsteps are far larger** but are activity or journal apps, not route animators.
- Revenue data is sparse and unreliable.

### Cited Findings

**Ratings and downloads by app (as of Oct 2026)**

| App | Google Play | iOS (US) | Other source |
|---|---|---|---|
| Travel Animator | 1M+ downloads; 4.2★, 37.3K reviews [Play](https://play.google.com/store/apps/details?id=com.travelanimator.routemap) | 4.6★, 1.1K ratings [App Store](https://apps.apple.com/us/app/travelanimator-journey-route/id6462844561) | Site claims "1,000,000+ downloads, 4.6 average" [site](https://www.travelanimator.com/) |
| TravelBoast | 10M+ downloads; 4.4★, 19.2K reviews; Play listing claims "15,000,000+ users on iOS" [Play](https://play.google.com/store/apps/details?id=io.urobots.travelboast) | 4.5★, 2.1K ratings [App Store](https://apps.apple.com/us/app/id1476504378) | "20+ million downloads" [advantages](https://travelboast.com/advantages); "30M+" [homepage](https://travelboast.com/) |
| Mult.dev | 500K+ downloads; 4.2★, 3.86K reviews [Play](https://play.google.com/store/apps/details?id=dev.mult) | 4.7★, 1.5K ratings; last update 27 Jun 2026 [App Store](https://apps.apple.com/us/app/id1606800134) | |
| MapAnim | 100K+ downloads; 4.5★, 1.58K reviews [Play](https://play.google.com/store/apps/details?id=mapanim.travelmapanimation.routemap) | 4.6★, 13 ratings [App Store](https://apps.apple.com/us/app/id6778246890) | |
| Relive | 10M+ downloads; 4.4★, 369K reviews [Play](https://play.google.com/store/apps/details?id=cc.relive.reliveapp) | 4.8★, 70K ratings, Editors' Choice [App Store](https://apps.apple.com/us/app/id1201703657) | |
| Strava | 100M+ downloads; 4.6★, 1.2M reviews [Play](https://play.google.com/store/apps/details?id=com.strava) | | |
| Polarsteps | 10M+ downloads; 4.7★, 197K reviews [Play](https://play.google.com/store/apps/details?id=com.polarsteps) | 4.88★, 9,836 ratings [iTunes API](https://itunes.apple.com/search?term=animated+travel+map&entity=software&country=us) | |

The three TravelBoast user claims (15M, 20M and 30M) are inconsistent with each other.

**Other Android route animators (Google Play)**
- "Travel Video Map Maker Boast" (DenisK Apps): 50K+ downloads, 3.7★. — [Play](https://play.google.com/store/apps/details?id=tech.kongri.travel)
- "TravelRoute: My Journey Boast" (Flowmatic): 100K+ downloads, 2.8★. — [Play](https://play.google.com/store/apps/details?id=travelboast.map.swl)
- AnimateMyMap: 10K+ downloads. — [Play](https://play.google.com/store/apps/details?id=com.animatemymap.app)
- GeoAnimator (Lascade's second map-animation app): 1K+ downloads. — [Play](https://play.google.com/store/apps/details?id=com.lascade.geoanimator)
- Waymotion: 1K+ downloads. — [Play](https://play.google.com/store/apps/details?id=com.drahanov.travel)
- MapReel: 1K+ downloads. — [Play](https://play.google.com/store/apps/details?id=com.sumitpundir.mapreel)
- Cinemaly: 100+ downloads. — [Play](https://play.google.com/store/apps/details?id=com.veulerv.cinemaly)

**Flight apps (iOS, for context)**
- Flightradar24: 4.84★, 670K ratings. — [iTunes Search API](https://itunes.apple.com/search?term=flight+map&entity=software&country=us)
- Flighty: 4.85★, 156.9K ratings. — [iTunes Search API](https://itunes.apple.com/search?term=flight+map&entity=software&country=us)

**Revenue and download estimates** (third-party estimates; period and method undisclosed)
- **ScreensDesign:**
  - TravelBoast: $45K revenue and 60K installs.
  - Travel Animator: $14K revenue and fewer than 5K installs.
  - Mult.dev: under $5K.
  - Polarsteps: $65K for comparison.

  — [ScreensDesign](https://screensdesign.com/apps/travelboast-my-journey-routes/)
- **mwm.ai all-time downloads:** TravelBoast 10M, Travel Animator 500K, Mult.dev 1M. — [mwm.ai TB](https://mwm.ai/apps/id/1476504378); [mwm.ai TA](https://mwm.ai/apps/id/6462844561); [mwm.ai Mult](https://mwm.ai/apps/id/1606800134)
- **Appfigures, April 2022 (pre-2025, historical).** TravelBoast went viral: daily downloads jumped from about 2,000 to nearly 300,000, adding about 1M App Store users in roughly 10 days, after an earlier spike of 136K. — [Appfigures](https://appfigures.com/resources/insights/20220401/3-indiana-jones-pazzaz-takes-over-the-app-store). The page could not be fetched directly; these figures come from search-result excerpts.

### Inferences
- **Travel Animator is likely under-indexed on iOS.** It has 37K Play reviews against 1.1K iOS ratings, which suggests an Android- and India-heavy audience (many India-storefront reviews). The thin iOS rating base is an opening for a polished iOS-first competitor.
- **The category's revenue ceiling looks modest.** The estimates suggest tens of thousands of dollars a month at the top, unless a viral trend spikes it. The upside lies in year-end spikes, B2B and creator tools, or bundling with trip journaling.

### Gaps
- No AppMagic or Sensor Tower figures were publicly available.
- The ScreensDesign and mwm.ai numbers are unverified estimates with unclear periods.
- No public data on paying-user counts or conversion rates.

## Q4. Most frequent complaints and feature requests

### Takeaway
Across 5,516 reviews, the dominant complaints are:
1. **Aggressive or confusing paywalls and subscription failures**, including Pro not activating and lifetime plans not appearing.
2. **Crashes, freezes and failed exports**, often after the user has paid.
3. **Lost work.** Saving is limited, edits are destroyed, and long trips crash past a certain number of points.
4. **Route realism.** Straight lines instead of roads, bad place search, and wrong borders.
5. **Weak editing and camera control**: no reordering, no zoom per city, labels missing or unreadable.

The top requests are more and mixed transport and avatars, better import (GPX, multi-file, auto-tracking), editable and saveable projects, photos or videos at stops (including automatically from the camera roll), music, real-road routing, lifetime pricing, and camera zoom.

### Cited Findings

**Low-star (≤3★) theme counts by corpus (keyword-tagged; multi-label)**
- **Travel Animator, App Store** (n=61 low-star of 148). Paywall/price 33; route accuracy 18; crash/bug 16; stops/points 14; export/render 10. — [App Store RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=6462844561/sortby=mostrecent/json)
- **Travel Animator, Google Play** (n=251 low-star of 1,000 newest; 15.7% are 1★). Crash/freeze 41 (16%); paywall 39 (15%); export/render failure 27 (10%); stops/location search 19; route accuracy 17. — [Google Play](https://play.google.com/store/apps/details?id=com.travelanimator.routemap)
- **TravelBoast, App Store, since 2024** (n=98). Stops/points 37; route accuracy 27; paywall 24; crash 22; lost work/editing 22; vehicles 17; ease of use 16. — [App Store RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1476504378/sortby=mostrecent/json)
- **TravelBoast, Google Play** (n=168 of 1,000). Stops/search 24; route 24; crash 24; ease of use 19; paywall 19; lost work 14; borders/map 8. — [Google Play](https://play.google.com/store/apps/details?id=io.urobots.travelboast)
- **Mult.dev, Google Play** (n=135 of 334; 30% are 1★). Paywall 47 (34%); crash 19; vehicles 14 (paying to switch from plane to car); export 12. — [Google Play](https://play.google.com/store/apps/details?id=dev.mult)
- **Mult.dev, App Store** (n=59 of 88). Paywall 32; crash 18; export 16. — [App Store RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1606800134/sortby=mostrecent/json)
- **Relive, App Store, since Jun 2025** (n=79). Paywall 44; photos 26 (full photo-library permission now required); stops/points 22; lost or removed editing 18 (route trimming removed). — [App Store RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1201703657/sortby=mostrecent/json)

**Representative verbatim pain points**

*Paywall and billing*
- Travel Animator, Play, Oct 2025: "You can't select the plane, only the free mode… Earlier, you could remove the watermark, now you can't." — [Play](https://play.google.com/store/apps/details?id=com.travelanimator.routemap)
- Travel Animator, App Store: "Lifetime purchase not showing" (Dec 2025); "advertised with a lifetime subscription but there's no way to activate it" (Aug 2025); "SUBSCRIPTION NOT ACTIVATED" (Jun 2026). — [App Store RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=6462844561/sortby=mostrecent/json)
- Travel Animator, App Store, Jun 2026: "Incessant Ads for Upgrades and Features… I purchased the premium upgrade." — [App Store RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=6462844561/sortby=mostrecent/json)
- Mult.dev, Play, 48 helpful votes: "unusable without upgrading… a one time purchase to make 5 pro videos and that's it." — [Play](https://play.google.com/store/apps/details?id=dev.mult)
- Mult.dev, App Store, Dec 2024: "Why do I have to pay 7.99 to say I drove to another place instead of flew." — [App Store RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1606800134/sortby=mostrecent/json)
- TravelBoast:
  - "changing vehicles… I have to 'restore purchases' every single time" (Sep 2026, App Store) — [App Store RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1476504378/sortby=mostrecent/json)
  - "keeps forgetting I have a subscription" (Jul 2026, Play) — [Play](https://play.google.com/store/apps/details?id=io.urobots.travelboast)
  - Free users must watch an ad to save, and the ad sometimes cannot be closed. — [App Store RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1476504378/sortby=mostrecent/json)
- Clones:
  - "They charge you for a suscribtion fee… then… ask you to buy coins to export every single video." — [App Store](https://apps.apple.com/us/app/id6743530581)
  - "Every tap goes to an ad." — [App Store](https://apps.apple.com/us/app/id6748111417)

*Crashes, export failures and lost work*
- Travel Animator, Play, 22 helpful votes: "fails at… saving your work… 'tried to save but it was too late'… Your work is gone… If you try to add another section to a route, the app deletes the previous section."
- Travel Animator, Play: "started crashing when I got about 4k miles into a 6k mile trip" (17 votes).
- Travel Animator, Play: "After Exporting 1 video the next export gets hanged" (paid user, Mar 2026).

  — [Play](https://play.google.com/store/apps/details?id=com.travelanimator.routemap)
- Travel Animator, mwm.ai: a 2025 subscriber says all 20 saved trips vanished after an update. — [mwm.ai](https://mwm.ai/apps/id/6462844561)
- TravelBoast, Play: "On a 6 week, 6,000 mile trip… quit working about 4,000 miles in… when you add too many points it stops working" (13 votes); "THE VIDEOS WONT SAVE" (15 votes). — [Play](https://play.google.com/store/apps/details?id=io.urobots.travelboast)
- TravelBoast, App Store, Jun 2024: "you can only work on one video at a time… adding a point BEFORE my original starting point… wiped out an hour's worth of progress." — [App Store](https://apps.apple.com/us/app/id1476504378)
- Travel Animator, App Store, Jan 2026: going back to add a stop "will wipe all the changes you made on the graphics editing section", and label texts must be retyped. — [App Store RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=6462844561/sortby=mostrecent/json)
- Mult.dev: render stuck in a queue or taking 15–20 minutes; credits disappeared; support unresponsive. — [Play](https://play.google.com/store/apps/details?id=dev.mult)

*Route realism, search and geography*
- Travel Animator, App Store, Mar 2026: a GPX plus manual route from England to Wales "show[ed]… going via the Irish Sea… a straight line." — [App Store RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=6462844561/sortby=mostrecent/json)
- Travel Animator, App Store, Apr 2024: "Can't go over International Date Line!" — same source.
- Travel Animator, App Store, Jan 2026: duplicate GPX points (loops or back-tracking) make the app "just give… a warning and stop." — same source.
- Travel Animator, App Store, Sep 2025: "This app only allows 1 gpx route." — same source.
- TravelBoast:
  - "should follow roads, like every other mapping app"
  - "add google maps… many places are missing… in Apple Maps"
  - "it won't let me add any South American city"
  - Jammu & Kashmir / Kargil shown as Pakistan (several Indian 1★ reviews)
  - Gulf of America naming backlash (Oct 2026)

  — [App Store RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1476504378/sortby=mostrecent/json); [Play](https://play.google.com/store/apps/details?id=io.urobots.travelboast)
- Mult.dev: 1★ reviews over Crimea and Serbia borders and a wrong Haiti flag. — [App Store RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1606800134/sortby=mostrecent/json)
- Older Android clones: Australia to Los Angeles routed westward across Africa. — [Play](https://play.google.com/store/apps/details?id=tech.kongri.travel)

*Storytelling and camera*
- Travel Animator, App Store, Dec 2025: "hoping that each time the animation arrived at a destination a marker would show up, or the city's name, but instead it just flies right over everything." — [App Store RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=6462844561/sortby=mostrecent/json)
- TravelBoast reviewers asked for:
  - A close-up on each city: 14 Italy stops end up "twisting on top of each other".
  - Zoom control for twisty roads.
  - A visible, reorderable list of stops.
  - Speech or comic bubbles.
  - Path patterns.
  - Camera start and end framing.
  - Better iPad UI.
  - Non-1:1 aspect ratios without cropping.

  — [App Store](https://apps.apple.com/us/app/id1476504378); [App Store RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1476504378/sortby=mostrecent/json)
- TravelBoast, Play, 9 votes: road markers and names get "way too big" when zoomed in; users want to toggle map info off. — [Play](https://play.google.com/store/apps/details?id=io.urobots.travelboast)
- TravelBoast, Play, Feb 2026 (8 votes): the tutorial shows on every launch and cannot be skipped. — [Play](https://play.google.com/store/apps/details?id=io.urobots.travelboast)
- MapAnim, Play, Jul 2026: rotating the phone wiped a 30-minute animation; users want per-node delete. — [Play](https://play.google.com/store/apps/details?id=mapanim.travelmapanimation.routemap)

*Relive-specific*
- Route trimming was removed (2026).
- Full photo-library access is now required to export.
- Clip length is capped (60 s total, 10 s each).
- Processing happens on a server ("Instead of uploading to a server, do all the processing locally").
- Billing and refund disputes.

— [App Store RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1201703657/sortby=mostrecent/json); [Play](https://play.google.com/store/apps/details?id=cc.relive.reliveapp)

**Feature requests** (258 of 5,516 reviews used request language such as "wish", "please add" or "would be nice"; keyword-tagged and multi-label)
- **More or mixed transport, vehicles and avatars: 61.** Examples: MTB bike, 1800s clipper and steam ships, customizable human models (hair, skin, kids), a comic walking figure.
- **Import and GPS: 49.** GPX editing (add stops to an imported GPX), multiple GPX legs, auto-tracking.
- **Edit, reorder, insert or save projects: 34.** Examples: link part-routes, append daily legs to one long trip, join segment videos into one.
- **Photos and videos at stops: 32**, including auto-placement from camera-roll geolocation.
- **Music: 26.** Own music, per-stage music, a bigger catalogue.
- **Follow real roads, trails and walking paths: 24.**
- **Lifetime or one-time purchase, or cheaper: 23.**
- **Stats and counters: 18.**
- **Labels, custom stop names and fonts: 17.**
- **Line style: 16.**
- **Camera and zoom: 15.**
- **Map style: 12.** Examples: labelled satellite, border creator.
- **Speed per segment: 11.**
- **More stops: 9.**
- **Aspect ratios: 9.**
- **iPad, desktop or web: 8.**

— Corpus sources: [TA RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=6462844561/sortby=mostrecent/json), [TB RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1476504378/sortby=mostrecent/json), [Mult RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1606800134/sortby=mostrecent/json), [Relive RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1201703657/sortby=mostrecent/json), and the Play listings above.

**Specific requests worth noting**
- "Give us month-in-review or year-in-review options… an app that airline crews would like" (Mult.dev, 2024). — [App Store RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1606800134/sortby=mostrecent/json)
- "should just use geo location in your photo albums" (Travel Animator, 2025). — [App Store RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=6462844561/sortby=mostrecent/json)
- "I should be able to preview my video before I spend a credit" (Mult.dev, 2025). — [App Store RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1606800134/sortby=mostrecent/json)
- "a simple 'record my route' automatically" (TravelBoast, 2025). — [App Store RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1476504378/sortby=mostrecent/json)
- "export as a 2D pdf map" (TravelBoast, Play). — [Play](https://play.google.com/store/apps/details?id=io.urobots.travelboast)
- "change the text font in story mode… custom map icons for campsites" (Cinemaly). — [Play](https://play.google.com/store/apps/details?id=com.veulerv.cinemaly)

### Inferences
- **The biggest competitive wedge is reliability, not features.** Users want autosave with version history, robust handling of long trips with many points, guaranteed export, and purchases that reliably unlock. Every leading app fails on at least one of these.
- **Route realism needs good defaults:**
  - Road snapping by default for car, bike and walk legs.
  - Great-circle arcs that handle the date line for flights.
  - Ferry and sea routing.
  - Google-quality place search.
  - Region-aware border rendering (for example local views for India; disputed borders as dashed lines).

  Geography errors produce angry 1★ reviews from large markets such as India.
- **A "trip-length project" model fits real usage.** People add a leg a day and post daily clips plus a final long video. This could also be a differentiator.
- **Labels and camera need automation.** The camera should automatically ease into each stop and show its name. Users read the lack of this as the app "flying over everything".

### Gaps
- Keyword tagging is approximate. Example: "save" can mean saving a video or a project. Manual coding of a sample would sharpen the percentages.
- The Travel Animator Play sample covers about 16 months, so seasonality comparisons double-count Jun–Oct.
- Reddit, YouTube comments and TikTok comments could not be accessed.

## Q5. Features that drive virality, and trending styles

### Takeaway
Virality in this category has come from emotionally framed, simple formats more than from technical depth:
- **The TikTok "distance map" trend** (long-distance couples or friends, a small vehicle driving between two places, set to an emotional song) made TravelBoast explode in 2022.
- **Year-end "my year of travel" recaps** produce December–January spikes (strongly visible for Mult.dev).
- **Cinematic 3D globe or terrain flyovers** with recognizable vehicles, flags and distance counters are what creators showcase now.

Platform-native recap features (Polarsteps Trip Reels, Strava Flyover sharing to Instagram) are also pushing the format mainstream.

### Cited Findings
- **The distance map trend.** It has "swept TikTok since 2022": long-distance couples and best friends show the distance between them using TravelBoast's little vehicle, often set to Coldplay's "Paradise". — [Dexerto](https://www.dexerto.com/tiktok/how-to-do-tiktoks-viral-distance-map-trend-1795886). Pre-2025, but TravelBoast's Play description still invites users to "Take part in the Distance trend on TikTok or in the Guess Empire". — [Google Play](https://play.google.com/store/apps/details?id=io.urobots.travelboast)
- **TravelBoast's 2022 spike** went from about 2K to nearly 300K daily downloads, roughly 1M users in about 10 days (estimates). — [Appfigures](https://appfigures.com/resources/insights/20220401/3-indiana-jones-pazzaz-takes-over-the-app-store)
- **Mult.dev review seasonality.** December and January hold 53% of its App Store reviews (47 of 88) and 32% of its Play reviews (108 of 334). The Dec 2024 reviews say "I came here from tiktok" and "I wanted to track my roadtrips this year". By comparison, TravelBoast is about 20% (App Store) and 11% (Play), and Travel Animator 18% and 13%. — computed from [Mult RSS](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1606800134/sortby=mostrecent/json) and [Mult Play](https://play.google.com/store/apps/details?id=dev.mult). Travel Animator's Play reviews peak in Jun–Aug 2025 (summer travel); its sample spans Jun 2025 to Oct 2026. — [TA Play](https://play.google.com/store/apps/details?id=com.travelanimator.routemap)
- **Travel Animator's showcased creator reels** list engagement figures, apparently views and likes:
  - @flightaroundtheworld_: 1.2M and 54.2K
  - @didiroads: 255.4K and 6.4K
  - @takemeeverywhere: 242.2K and 10.6K
  - @kevinneubeck: 220.3K
  - @furgocaris: 157.2K

  — [travelanimator.com](https://www.travelanimator.com/)
- **Travel Animator growth tactics:**
  - Free custom models for influencers with 1M+ followers. — [model.travelanimator.com](https://model.travelanimator.com/)
  - An affiliate programme and creator collaborations. — [travelanimator.com](https://www.travelanimator.com/)
  - Recent visual hooks: country-flag highlights and distance display styles. — [App Store](https://apps.apple.com/us/app/travelanimator-journey-route/id6462844561)
- **Mult.dev's own tips for views** — [Mult.dev tutorial](https://mult.dev/articles/how-to-create-your-first-video-in-multdev):
  - Videos under 60 s.
  - 5–10 key locations.
  - 9:16 format.
  - A caption like "7 countries in 14 days".
  - Music matched to the vibe (synthwave for fast trips, ambient for slow travel).
- **AvoMap growth loops.** "Post a Reel, get AvoMap for free" (UGC credit-back) and a 30% affiliate share. — [AvoMap pricing](https://avomap.com/pricing)
- **Polarsteps.** The CEO frames Trip Reel as responding to "a growing trend in travel — particularly in younger demographics — for people sharing their travel adventures… in short video form". — [Polarsteps 2025 release](https://news.polarsteps.com/news/polarsteps-summer-2025-release-is-here). Reels gained terrain flyovers in 2026. — [Polarsteps 2026 release](https://news.polarsteps.com/news/polarsteps-launches-summer-2026-release-new-tools-for-planning-privacy-and-sharing)
- **Strava** lets subscribers post Flyovers straight to an Instagram story. — [Strava help](https://support.strava.com/en-us/articles/15401641)
- **Adjacent viral formats.** "Guess the Empire", history and war maps, and bar-chart races are a big neighbouring genre. AnimateMyTravel builds them with AI (Napoleon's empire, WWII, "Light up the 12 countries I've visited") — [animatemytravel.com](https://animatemytravel.com/) — and AnimateMyMap has a "war tool". — [Play](https://play.google.com/store/apps/details?id=com.animatemymap.app)
- **Paid demand for the format.** Freelancers sell 9:16 TikTok, Reels and Shorts map animations on Fiverr. A search summary says one such gig uses GeoLayers and After Effects. — [Fiverr listing A](https://fiverr.com/sakinasadeeq/make-short-form-map-animation-content-for-tiktok); [Fiverr listing B](https://fiverr.com/marisdev27_/create-realistic-travel-map-animation-video)

### Inferences
- **Design for the shareable hook, not the editor:**
  - One-tap "distance between us" and "my year in travel" templates.
  - Automatic counters (km, countries, flights).
  - Flag pop-ups and city name cards on arrival.
  - Trending-audio-friendly pacing (beat-synced stops).
  - A 7–15 s cut alongside a full-length version.
  - A recognizable but optional watermark that doubles as attribution.
- **Seasonal marketing matters.** December and January ("year in review") and June–August (summer trips) are the acquisition windows.
- **Built-in growth loops work in this category:** credit-back for posting a reel, influencer custom models, and affiliate links.

### Gaps
- There is no hard 2025–26 TikTok or Instagram hashtag or view data. The sources found are vendor blogs or freelancer listings.
- I could not verify which specific visual styles (globe vs satellite vs pixel or comic) trend most in 2026.
- The Travel Animator carousel numbers are self-reported and their units are unlabelled.
