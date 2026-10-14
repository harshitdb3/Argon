# Automate the trip, guarantee the export

**Recommendation:** build the app natively. Use Swift/SwiftUI on the Mapbox Maps SDK v11, with a hand-built loop that renders and encodes the video one frame at a time through AVAssetWriter. Port it later to Kotlin/Compose on the same Mapbox APIs. **Do not use Unity.** Unity can render this app fine. It fails here for three other reasons: map licensing, an immature Mapbox Unity SDK, and video capture you would have to build yourself.

Adding more features will not win this market. Travel Animator already ships **300+ vehicles, 30+ map styles and 4K export**, and since September 2026 it also turns typed text into a route. More than 15 near-identical clones launched in 2025–26. A new app wins by fixing what reviewers say is broken. Across **5,516 store reviews**, the main complaints are:
- paywalls, and purchases that never unlock;
- crashes and failed exports;
- lost work;
- straight-line or wrong routes;
- a camera that "flies right over everything".

The best opening combines automation with reliability:
- build the trip automatically from the camera roll (only the small app TripReel does this, and Travel Animator users ask for it);
- let users type the trip;
- give every vehicle away free;
- autosave every edit;
- render on the phone, with no server queue.

**These AI features cost almost nothing to run.** They use Apple's on-device Foundation Models, plus Apple's server-side model service (Private Cloud Compute), which is free for developers under 2M downloads. Cloud extras such as narration and generated music cost about **$0.05–$0.25 per video** and belong in Pro.

**Two licences can block the launch:**
- **Maps.** Mapbox's product terms restrict map content in video unless expressly permitted, so you need Mapbox's written confirmation before launch.
- **Music.** Exports must be silent or use properly sync-licensed tracks, never Apple Music.

Expect a small-business outcome:
- The median Photo & Video app earns about **$124/month a year after launch**.
- One analytics site estimates TravelBoast, the category's download leader, at **about $45K in revenue** (period not stated).
- Running costs stay near zero until about 25,000 monthly active users (MAU).

**The plan:**
1. Two weeks of spikes (short throwaway experiments): frame-capture speed, the encoder, and the legal emails.
2. A roughly 10-week iOS MVP, aimed at the December–January "year in travel" posting season if the spikes pass quickly.
3. iOS updates for summer 2027.
4. An Android port before the December 2027 recap season, at roughly 50–70% of the iOS effort.

## Fifteen clones share one feature set, so automation is the open lane

The market has three tiers.

**Mobile 3D-vehicle animators** compete on how many vehicles and map styles they offer, and on 4K export:
- **Travel Animator** (Lascade) has the broadest mobile toolset. It offers 300+ glTF vehicles, 80+ landmark models that pop up along the route, a face avatar and a custom-model service ([travelanimator.com](https://www.travelanimator.com/)). It imports GPX files and Google Maps links, and can make any single leg follow real roads ([how-to guide](https://travelanimator.com/hub/how-to-use-the-travel-animator-app/)). Since v4.0.0 on 11 Sep 2026 it has **Journey AI**, a chat assistant that builds the route ([Journey AI guide](https://www.travelanimator.com/hub/how-to-plan-a-trip-with-the-journey-ai-route-assistant)). It also runs an MCP server (a connector for AI assistants) that sells exports for credits ([TA MCP](https://www.travelanimator.com/mcp)). It ships builds almost weekly.
- **TravelBoast** is the download leader. Its 2022 TikTok spike took daily downloads from about 2,000 to nearly 300,000 ([Appfigures](https://appfigures.com/resources/insights/20220401/3-indiana-jones-pazzaz-takes-over-the-app-store)).

**Browser and credit-based tools** compete on routing, camera control and paying per video:
- **Mult.dev** renders in the cloud and sells video packs.
- **AvoMap** has the deepest toolset of any product. It offers camera keyframes for each leg, six camera presets, elevation charts, and 4K at 60 fps ([AvoMap features](https://avomap.com/features)). It is desktop-web only.

**Auto-recap apps** turn recorded GPS into video with no vehicles and no stop-by-stop story:
- **Relive**, **Strava Flyover** and **Polarsteps Trip Reels** all work this way ([Strava help](https://support.strava.com/en-us/articles/15401641)).

| App | Model | US price | Scale signal |
|---|---|---|---|
| Travel Animator | Mobile 3D animator | $6.99/mo, $24.99/yr, $52 lifetime ([App Store](https://apps.apple.com/us/app/travelanimator-journey-route/id6462844561)) | 1M+ Play downloads, 4.2★ from 37.3K reviews; only 1.1K US iOS ratings ([Play](https://play.google.com/store/apps/details?id=com.travelanimator.routemap)) |
| TravelBoast | Mobile 3D animator | $2.99/wk, $5.99/mo, $17.99–$29.99/yr, $1.99 per vehicle ([App Store](https://apps.apple.com/us/app/id1476504378)) | 10M+ Play; ~$45K revenue, 60K installs (ScreensDesign estimate, period undisclosed) ([ScreensDesign](https://screensdesign.com/apps/travelboast-my-journey-routes/)) |
| Mult.dev | Web + mobile, cloud render | iOS packs: 5/25/100 videos at $7.99/$19.99/$44.99 ([App Store](https://apps.apple.com/us/app/id1606800134)) | 500K+ Play ([Play](https://play.google.com/store/apps/details?id=dev.mult)) |
| MapAnim | 2026 mobile clone | $19.99/yr, $29.99 lifetime ([App Store](https://apps.apple.com/us/app/id6778246890)) | 100K+ Play within months of a June 2026 launch ([Play](https://play.google.com/store/apps/details?id=mapanim.travelmapanimation.routemap)) |
| Waymotion | Mobile, AI text route | $3.99/mo, $17.99/yr, $39.99 lifetime ([App Store](https://apps.apple.com/us/app/id6767525852)) | Launched July 2026 |
| AvoMap | Web, credits | 1 credit per 1080p export; +1 each for 4K or logo removal ([AvoMap pricing](https://avomap.com/pricing)) | No published figures |
| Relive | GPS activity → 3D video | Plus $6.99 / $38.99 ([App Store](https://apps.apple.com/us/app/id1201703657)) | 10M+ Play; 4.8★ from 70K iOS ratings |
| Polarsteps | Trip tracker + Trip Reels | Plus €29.99/yr ([Polarsteps Plus](https://www.polarsteps.com/news/polarsteps-launches-polarsteps-plus-a-new-subscription-for-its-most-dedicated-travelers)) | 20M+ travellers |

### The complete feature inventory, and when to match each feature

The table below covers every feature found across direct competitors, web tools and auto-recap apps. The last column says when this app should match it:
- **MVP**: the first iOS release;
- **1.x**: iOS updates after launch;
- **Later**: after the Android port.

| Area | Feature | Who ships it today | Phase |
|---|---|---|---|
| Route input | Stop search by city, address, coordinates or airport code | Travel Animator (incl. IATA airport codes); Mult.dev; AvoMap covers 7,695 airports ([TA guide](https://travelanimator.com/hub/how-to-use-the-travel-animator-app/); [AvoMap](https://avomap.com/features)) | MVP |
| Route input | Drag to reorder, insert or delete stops; undo/redo | Travel Animator, Mult.dev ([Mult.dev tutorial](https://mult.dev/articles/how-to-create-your-first-video-in-multdev)) | MVP |
| Route input | Google Maps link import | Travel Animator (one link only; at its Jan 2026 launch, imported routes were not editable), TravelBoast, Mult.dev, MapAnim ([hunted.space](https://www.hunted.space/product/travel-animator/launches/travelanimator)) | 1.x |
| Route input | GPX import; also KML, GeoJSON, FIT, TCX, IGC | Travel Animator (one file free); Mult.dev (Pro only); AvoMap; Relive ([Mult.dev pricing](https://mult.dev/pricing)) | MVP for GPX, including several files; other formats 1.x |
| Route input | Fitness-account sync | AvoMap (Strava); Relive (Garmin, Suunto, Apple Health); SkyGlide (Health stats) ([SkyGlide](https://apps.apple.com/us/app/id6758352711)) | Apple Health workouts in 1.x; Strava later |
| Route input | Route from plain text (AI) | Travel Animator Journey AI, Mult.dev, Waymotion, Travel Recap, Mapimator ([Travel Recap](https://travelrecap.app/instagram-year-travel-recap)) | MVP (needed to match rivals) |
| Route input | Trip detected automatically from photo locations | TripReel only (on-device); Travel Animator users ask for it ([TripReel](https://tripreel.app/)) | **MVP headline feature** |
| Route input | Live GPS recording | Relive, Strava, Polarsteps, FindPenguins | Later or never (a different product) |
| Route input | Route templates and sample routes | Mult.dev templates; Travel Animator's free GPX library, which doubles as SEO ([TA GPX](https://www.travelanimator.com/gpx)) | 1.x |
| Routing | Legs that follow roads | Travel Animator (set per stop); Mult.dev Pro; MapAnim; AvoMap ([Mult.dev packages](https://mult.dev/articles/packages-sizes-and-subscriptions)) | MVP, free |
| Routing | Rail and sea/river legs | AvoMap (rail, river); Mult.dev Pro (sea) | Later; MVP uses smoothed arcs instead |
| Routing | Flight arcs that cross the International Date Line | Missing: a Travel Animator reviewer wrote "Can't go over International Date Line!" ([TA reviews](https://itunes.apple.com/us/rss/customerreviews/page=1/id=6462844561/sortby=mostrecent/json)) | MVP |
| Routing | Trim or reroute an imported track | AvoMap; Relive removed trimming in 2026 | 1.x |
| Routing | Borders that respect each region's view | Missing: 1★ reviews over Jammu & Kashmir, Crimea and the "Gulf of America" ([TravelBoast reviews](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1476504378/sortby=mostrecent/json)) | MVP setting |
| Vehicles | 3D vehicle library | Travel Animator 300+ (.glb files); TravelBoast 160–300 (its listings disagree); TripReel "hundreds" ([TA](https://www.travelanimator.com/)) | MVP 8–10 free-licence (CC0) models, growing monthly |
| Vehicles | Different transport per leg | Nearly all; Mult.dev charges for anything but a plane | MVP, every vehicle free |
| Vehicles | Custom vehicle built from your photos | Travel Animator service; AvoMap (photos from four sides) ([TA models](https://model.travelanimator.com/)) | Later |
| Vehicles | Face or photo avatar | Travel Animator, MapAnim | 1.x |
| Vehicles | 3D landmarks that pop up along the route | Travel Animator (80+) | Later |
| Map & camera | Map styles | Travel Animator 30+ (incl. Pixel, Comic, Watercolor, seasonal); AvoMap 7 styles × 4 times of day; Relive 12 themes ([TA maps](https://www.travelanimator.com/maps)) | MVP 4–6 styles |
| Map & camera | 3D globe and terrain | Travel Animator, AvoMap, Relive, Strava, Polarsteps (2026) | MVP |
| Map & camera | Camera presets | Travel Animator "SceneStyle" (1×/2×/3× zoom); AvoMap's six presets; Mult.dev follow/wide | MVP: three presets plus automatic camera |
| Map & camera | Camera keyframes per leg or per waypoint | AvoMap; SkyGlide | 1.x Pro "Director mode" |
| Map & camera | Camera slows into each stop and shows its name | Missing: "it just flies right over everything" ([TA reviews](https://itunes.apple.com/us/rss/customerreviews/page=1/id=6462844561/sortby=mostrecent/json)) | MVP |
| Story & media | Photos at stops | Nearly all; Mult.dev allows 10 free / 100 Pro | MVP, best photos picked automatically |
| Story & media | Video clips at stops | Travel Animator, TravelBoast, MapAnim (picture-in-picture), AvoMap; Relive caps clips at 60 s total | 1.x |
| Story & media | Labels, titles, fonts, country flags | Travel Animator (flags added Aug 2026), Mult.dev, AvoMap | MVP |
| Story & media | Distance and stats counters; elevation chart | Travel Animator; AvoMap; Strava; SkyGlide | MVP for distance and countries; elevation in 1.x |
| Story & media | Emojis, stickers, speech bubbles | Mult.dev; requested by TravelBoast users | 1.x |
| Story & media | Music | Mult.dev Pro ("dozens of pre-cleared tracks"); Relive Plus | MVP exports silent; licensed library in 1.x |
| Story & media | Voice narration | No route app; CapCut has generic text-to-speech | 1.x Pro |
| Story & media | Cuts synced to the music beat | GoPro Quik ([Quik](https://apps.apple.com/us/app/gopro-quik/id561350520)) | Later |
| Output | 9:16, 1:1, 16:9 and 4:5 formats | SkyGlide has all four; Mult.dev three | MVP |
| Output | Resolution and frame rate | Travel Animator 4K (Pro); AvoMap 1080p/4K at 60 fps; Mult.dev 768p30 free, 1920p60 Pro | MVP: 1080p30 free, 1080p60 Pro; 4K once the spike passes |
| Output | On-device rendering | SkyGlide, TripReel, Cinemaly | MVP |
| Output | Cloud rendering | Mult.dev (has a queue), AvoMap, Relive, Strava (push notification when ready) | Later, as a fallback |
| Output | Direct share to Reels/TikTok; web view link | Strava (to Instagram Stories); Mult.dev (view link) | MVP direct share; link later |
| Output | Stills, carousel, printable 2D map | Requested ("export as a 2D pdf map") ([TravelBoast Play](https://play.google.com/store/apps/details?id=io.urobots.travelboast)) | 1.x |
| Projects | Saved projects and sync | Travel Animator: 1 project free, unlimited on Pro; TravelBoast: cloud on Pro; Mult.dev: account sync | MVP unlimited projects on the phone, with version history; iCloud in 1.x |
| Projects | Recap of several trips or a whole year | TripReel, Travel Recap, Google Photos Recap | MVP template |
| Projects | Collaboration; custom logo/white-label; API/MCP | Polarsteps Travel Buddies; Travel Animator Pro logo and MCP; AvoMap | Later |
| Growth | Affiliate links, free models for influencers, free credits for posting a reel | Travel Animator (free models for 1M+ follower accounts); AvoMap (30% affiliate, "Post a Reel, get AvoMap for free") ([AvoMap pricing](https://avomap.com/pricing)) | Launch |

### Adjacent memory apps show where the format is heading

Every large travel-memory app now ships some kind of one-tap trip video. **None of the big platforms (Google, Apple, Instagram, TikTok) puts an animated route map in its auto-generated memories.** That gap is the clearest open space. Polarsteps is closing it from the trip-tracker side.

| App | How it turns trips into stories | Lesson for this app |
|---|---|---|
| Polarsteps | Tracks the trip automatically. Trip Reels (2025) added terrain flyovers in 2026. Travel Books cost about €36–€150. Plus adds a 3D "Play mode" ([2026 release](https://news.polarsteps.com/news/polarsteps-launches-summer-2026-release-new-tools-for-planning-privacy-and-sharing)) | Trackers are moving into route video. Printed books are a proven revenue line |
| FindPenguins | Free 3D flyover videos; asks users to tag @findpenguinsapp and reposts the best ([FindPenguins flyover](https://findpenguins.com/flyover)) | A user-generated repost loop works. Free flyovers set price expectations |
| Journi | Groups bulk-uploaded photos "smartly by time and location data" ([App Store](https://apps.apple.com/us/app/-/id884030844)) | Automatic grouping by photo metadata is now expected |
| Google Photos | 2025 Recap shows stats and exports in one click to CapCut templates ([TechRepublic](https://www.techrepublic.com/article/news-google-photos-recap/)) | Hand off to a pro editor instead of building one |
| Apple Photos | Type a description and get a "Memory Movie" ([9to5Mac](https://9to5mac.com/2024/07/31/this-apple-intelligence-photos-feature-is-my-surprise-early-favorite-in-ios-181/)) | Users expect "describe it" creation. Apple draws no route |
| GoPro Quik | Sep 2026 "Studio Edit" switches any clip between automatic and manual ([Quik](https://apps.apple.com/us/app/gopro-quik/id561350520)) | Offer an AI first draft with full manual override |
| CapCut | "Travel Map", "Earth Zoom Trend", "Boarding Pass" and "TRAVEL RECAP 2026" templates ([CapCut](https://www.capcut.com/explore/travel-map)) | Templates are the entry point. CapCut is also the default rival tool |
| Spotify Wrapped, Strava Year in Sport | A share card on every slide. Putting Year in Sport behind the paywall "roiled numerous Strava users" ([Spotify](https://newsroom.spotify.com/2025-wrapped-user-experience/); [Ars Technica](https://tagteam.harvard.edu/hub_feeds/3415/feed_items/17132945/content)) | Use Wrapped-style mechanics, and keep the base recap free |
| Snapchat Footsteps, Flighty Passport | Countries visited and % of a city explored; lifetime flight stats ([TechCrunch](https://techcrunch.com/2024/09/30/snapchats-new-footsteps-feature-tracks-your-location-history); [Flighty](https://flighty.com/help/passport)) | A "digital passport" share card |

**Typing a trip to get a route is no longer an open niche.** Travel Animator, Mult.dev, Waymotion and Travel Recap all ship it. Camera-roll-to-route is more defensible.

Among route-animation apps, only TripReel builds trips from photos. It is a small, globe-focused iOS app with vehicles and photos from the camera roll. It documents no road-following legs, GPX import, text input or camera control ([TripReel](https://apps.apple.com/us/app/id6757102726)). None of the three category leaders offers camera-roll trips, and Travel Animator's users are asking for it.

So the lead feature is the combination: automatic trip detection, plus text and GPX input, plus road-accurate routing, plus stop-by-stop storytelling.

## Broken trust, not missing vehicles, drives the one-star reviews

The review corpus covers **5,516 reviews** from the App Store and Google Play for Travel Animator, TravelBoast, Mult.dev, MapAnim and Relive. Themes were tagged by keyword and one review can carry several, so treat the counts as relative weights. Reddit and TikTok comments could not be reached.

The pattern is consistent. Users rarely leave because a feature is missing. They leave because the app took their money, lost their work, or drew their trip wrong.

| Theme | Evidence | What users say |
|---|---|---|
| Paywalls and purchases that fail | Top theme in Travel Animator App Store reviews (33 of 61 low-star) and Mult.dev Play reviews (47 of 135, **34%**). Relive: 44 of 79 ([TA reviews](https://itunes.apple.com/us/rss/customerreviews/page=1/id=6462844561/sortby=mostrecent/json); [Mult.dev Play](https://play.google.com/store/apps/details?id=dev.mult)) | "Why do I have to pay 7.99 to say I drove to another place instead of flew"; "Lifetime purchase not showing"; TravelBoast: "I have to 'restore purchases' every single time" ([Mult.dev reviews](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1606800134/sortby=mostrecent/json)) |
| Crashes and failed exports | Travel Animator Play: crash/freeze 41 (16%) and export failure 27 (10%) of 251 low-star reviews. Mult.dev: renders stuck in a queue for 15–20 min ([TA Play](https://play.google.com/store/apps/details?id=com.travelanimator.routemap)) | "After Exporting 1 video the next export gets hanged" (a paying user) |
| Lost work | TravelBoast App Store: lost work/editing 22 of 98. One Travel Animator subscriber lost all 20 saved trips after an update ([mwm.ai](https://mwm.ai/apps/id/6462844561)) | "tried to save but it was too late… Your work is gone." Adding a stop "will wipe all the changes you made on the graphics editing section." Rotating the phone wiped a 30-minute MapAnim project |
| Long trips break | Both leaders fail around **4,000 miles** into a 6,000-mile trip ([TravelBoast Play](https://play.google.com/store/apps/details?id=io.urobots.travelboast)) | "when you add too many points it stops working" |
| Wrong routes and geography | TravelBoast App Store: stops/points 37, route accuracy 27 | A GPX route from England to Wales went "via the Irish Sea… a straight line." "add google maps… many places are missing… in Apple Maps." Indian users gave 1★ over Jammu & Kashmir shown as Pakistan |
| Weak storytelling and camera | Requests for close-ups on each city, zoom, and visible stop lists ([TravelBoast App Store](https://apps.apple.com/us/app/id1476504378)) | "flies right over everything"; 14 Italy stops ended up "twisting on top of each other" |
| Privacy and server processing | Relive: 26 of 79 low-star reviews concern its new requirement for full photo-library access ([Relive reviews](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1201703657/sortby=mostrecent/json)) | "Instead of uploading to a server, do all the processing locally" |
| Clone dark patterns | Clones that charge a subscription and then sell coins per export ([App Store](https://apps.apple.com/us/app/id6743530581)) | "Every tap goes to an ad" |

Explicit requests point the same way. Of the **258 reviews** that used request language ("wish", "please add"):

| Request | Reviews |
|---|---|
| More or mixed vehicles and avatars | 61 |
| Better import (GPX editing, several GPX legs, automatic tracking) | 49 |
| Editable, saveable, appendable projects | 34 |
| Photos and videos at stops, including automatic placement from the camera roll | 32 |
| Music | 26 |
| Real roads | 24 |
| Lifetime or cheaper pricing | 23 |
| Stats | 18 |
| Labels | 17 |
| Camera and zoom | 15 |

Two individual requests stand out as product direction:
- "should just use geo location in your photo albums" (Travel Animator).
- "Give us month-in-review or year-in-review options" (Mult.dev).

([request corpus, TA](https://itunes.apple.com/us/rss/customerreviews/page=1/id=6462844561/sortby=mostrecent/json); [Mult.dev](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1606800134/sortby=mostrecent/json))

### The "beat the competitors" list

Each item below answers a documented complaint. Most are engineering discipline rather than new features, which is why a solo developer can deliver them. Incumbents carry legacy code and ship "minor bug fixes" weekly.

| # | Move | Complaint it answers | Phase |
|---|---|---|---|
| 1 | **Never lose work.** Save after every edit, keep a version history, write project files so a crash cannot corrupt them, and give each stop a stable ID so editing the route never wipes styling or labels | Lost work after saves, updates, edits and screen rotation | MVP |
| 2 | **Long trips just work.** Stress-test with 300+ stops and a 10,000 km GPX file; simplify dense tracks; handle duplicate points, loops and several GPX files | Crashes ~4,000 miles in; "only allows 1 gpx route" | MVP |
| 3 | **Every vehicle free.** Never charge for the transport mode; charge for quality and polish | "pay 7.99 to say I drove… instead of flew" | MVP |
| 4 | **Purchases that stick.** Use RevenueCat entitlements; make lifetime visible; test restore on reinstall; no ads or upgrade nags for paying users; no coins required to export | Lifetime not appearing; repeated restore prompts; nags after paying | MVP |
| 5 | **Real routes by default.** Road routing free; great-circle flight arcs (the shortest path over the globe) that cross the date line; ferry and rail fallbacks; drop-a-pin, coordinates and airport codes when search fails | Straight lines across the Irish Sea; date-line failure; places missing from Apple Maps search | MVP |
| 6 | **Arrive, don't fly over.** The camera slows into each stop and shows a city card, flag and distance counter; tight clusters of stops get grouped with an automatic zoom | "flies right over everything"; 14 stops "twisting on top of each other" | MVP |
| 7 | **Borders that respect the region.** Border display follows the storefront region, with disputed borders dashed; test the India view before launch | 1★ reviews over Kashmir, Crimea, Gulf naming | MVP |
| 8 | **Preview free, pay at export, no queue.** A full-quality preview costs nothing; rendering happens on the phone | Mult.dev: "preview… before I spend a credit"; 15–20 min render queues | MVP |
| 9 | **Sharp at every zoom.** Render map tiles at the export resolution | Travel Animator admits "even a 4K export can look blurry" ([TA quality guide](https://www.travelanimator.com/hub/how-to-generate-high-quality-map-animation-using-travelanimator)) | MVP 1080p; 4K in 1.x |
| 10 | **Privacy first.** No account required; processing on the phone; limited photo-library access; option to hide home location | Relive's full-library requirement; server uploads | MVP |
| 11 | **Trip-length projects.** Append a leg each day, export a daily clip and the full trip | Requests to "link part-routes" and join segments | 1.x |
| 12 | **Respect the user's time.** Onboarding shows once and can be skipped | TravelBoast's tutorial on every launch | MVP |

## AI should build the route on-device for almost nothing

The economics of AI on iOS changed at WWDC 2026. Apple's Foundation Models framework already ran an on-device language model for free. Apple now also gives **free access to its Private Cloud Compute (PCC) models** to developers with fewer than **2 million first-time downloads** who are in the App Store Small Business Program ([Apple Developer: PCC](https://developer.apple.com/private-cloud-compute)). Developers who cross the threshold have **six months to migrate**.

Lower-confidence sources report two further additions: image input, and a way to route requests to third-party models such as Claude or Gemini through the same Swift API ([MacRumors](https://www.macrumors.com/2026/06/09/apple-outlines-major-ai-and-developer-tool-updates/)). Confirm these in Apple's documentation before relying on them.

Android is behind. The ML Kit Prompt API, which runs Gemini Nano on the device, launched in **alpha in October 2025** and runs best on Pixel 10 phones ([Android Developers Blog](https://developer.android.com/blog/posts/ml-kit-s-prompt-api-unlock-custom-on-device-gemini-nano-experiences)). The Android version should default to a cheap cloud model.

The design rule follows from that: **text and photo intelligence runs on the device first**, behind a provider interface that can switch to a cloud model.

| AI feature | Phase | How it works | Cost per use | Who else has it |
|---|---|---|---|---|
| **Camera roll → trip** (headline) | MVP | Read photo locations and times through PhotoKit, Apple's photo-library framework. Group photos by time gaps and distance, and detect "home". Name each place with the on-device geocoder. Rank photos with Vision's aesthetics score, which runs from −1 to 1 and separates memorable shots from screenshots ([Apple docs](https://developer.apple.com/documentation/vision/calculateimageaestheticsscoresrequest.md)) | **~$0** on-device. Optional cloud landmark naming ≈ $0.03 per 20 photos at $1.50 per 1,000 images ([Cloud Vision](https://cloud.google.com/vision/pricing)) | TripReel only |
| **"Describe your trip" → route** | MVP | The on-device model returns structured output (stops, order, transport, dates). Each place is then geocoded with MapKit search, followed by a confirm-and-edit step for ambiguous names such as Paris, TX vs Paris, France | **$0** on-device or PCC. Cloud fallback per trip (≈1k input + 800 output tokens): ~$0.0015 on Gemini 3.1 Flash-Lite, ~$0.002 on GPT-5 mini, ~$0.005 on Claude Haiku 4.5 ([Flash-Lite](https://anotherwrapper.com/tools/llm-pricing/gemini-3.1-flash-lite-preview); [GPT-5 mini](https://modelcompare.dev/pricing/openai-api-pricing); [Haiku 4.5](https://pricepertoken.com/pricing-page/model/anthropic-claude-haiku-4.5)) | Travel Animator, Mult.dev, Waymotion, Travel Recap |
| Transport inference and automatic camera direction | MVP | Rules based on leg distance, time gap and photo count, with optional model choice of camera preset | $0 | None found |
| Titles, captions, hashtags (multilingual) | MVP | On-device model | ~$0–$0.001 | Expected everywhere (Apple, Google, CapCut) |
| Stats and "fun facts" per stop | 1.x | Stats calculated without AI; facts written by a language model from retrieved reference text | $0.001–$0.005 per video | None found |
| **Voice narration** | 1.x Pro | Free system voices (AVSpeechSynthesizer) for everyone; premium cloud voices on Pro | 60 s ≈ 900 characters: ~$0.045 on ElevenLabs Flash, ~$0.09 on ElevenLabs Multilingual, ~$0.015/min on OpenAI gpt-4o-mini-tts ([ElevenLabs](https://developer.puter.com/tutorials/elevenlabs-api-pricing/); [OpenAI](https://community.openai.com/t/understanding-gpt-4o-mini-tts-pricing-input-characters-cost/1151816)) | None in route apps |
| Generated music | Later Pro | Eleven Music, Stable Audio or Lyria, each only after its licence is verified | ~$0.15/min (Eleven Music); $0.20 per track (Stable Audio 2.5); ~$0.06 per 30 s (Lyria 2) ([Smallest.ai](https://smallest.ai/blog/elevenlabs-pricing-plans-cost-what-you-get-in-2026); [CometAPI](https://www.cometapi.com/ja/ai-music-api-pricing/)) | Relive uses preselected music |
| Chat editing ("slow the plane over Paris") | Later | Model tool-calling over the project's scene data | ~$0.001–$0.0035 per command | None found |
| Import from booking screenshots or emails | Later | On-device text recognition, then model extraction | ~$0 on-device | None found |
| Custom 3D models or landmarks | Later / avoid generative 3D | A curated asset library | Asset cost only | Travel Animator |

A fully loaded premium render costs about **$0.10–$0.25** in cloud AI: the model call, 60 s of premium voice and 30–60 s of generated music. Voice and music make up nearly all of that. Without them, AI costs round to zero.

Two features to skip:
- **Apple's Personal Voice** (a synthetic copy of the user's own voice). Apple says it "should be primarily used for augmentative or alternative communication apps." One developer reports that it cannot render audio into a file, which is what video export needs ([Developer Forums](https://developer.apple.com/forums/thread/736148)).
- **Suno and Udio** for music. Neither has a confirmed public API, and their licensing has been in flux since the 2025 label settlements ([Dupple](https://dupple.com/learn/suno-vs-udio)).

Privacy shapes the cloud fallback. Since November 2025, App Store guideline **5.1.2(i)** requires in-app disclosure and an explicit "yes" from the user before personal data reaches a third-party AI. A line in the privacy policy is not enough ([TechCrunch](https://techcrunch.com/2025/11/13/apples-new-app-review-guidelines-clamp-down-on-apps-sharing-personal-data-with-third-party-ai)).

So keep raw photos and GPS tracks on the phone, and send only short derived text ("Paris, Rome, May 2026") to cloud models. Show a consent sheet for each cloud feature. Polarsteps sets a useful precedent: its Claude-powered itinerary tool is opt-in, and it says photos never go to external AI ([Polarsteps](https://news.polarsteps.com/news/polarsteps-summer-2025-release-is-here)).

## Native Swift on Mapbox wins, and Unity loses on licensing

**The hardest part of this app is the export loop, and every option forces it into native code.** The loop works like this:
1. Step a timeline forward.
2. Place the camera and the vehicle.
3. Wait until the map tiles have loaded and drawn.
4. Capture the frame.
5. Hardware-encode it to H.264 or HEVC.

The cross-platform frameworks only offer slow PNG or base64 snapshots from their JavaScript or Dart layers:
- React Native's map wrapper returns base64 PNGs ([rnmapbox docs](https://github.com/rnmapbox/maps)).
- Flutter's `snapshot()` returns PNG bytes ([mapbox_maps_flutter changelog](https://pub.dev/packages/mapbox_maps_flutter/changelog)).

FFmpegKit, the usual cross-platform video tool, was officially retired in January 2025 ([Taner Sener](https://tanersener.medium.com/saying-goodbye-to-ffmpegkit-33ae939767e1)). So in React Native or Flutter you would still write the core loop twice, in Swift and in Kotlin, and gain only a shared interface.

Mapbox already ships an official iOS sample, **"SwiftUI – Animated 3D model along a route"**. It moves a glTF airplane along a flight path every display frame, with a following camera "creating a flyover effect" ([Mapbox example](https://docs.mapbox.com/ios/maps/examples/swiftui-animated-3d-model/)). That sample is half of the product's core, and it is free to start from.

Mapbox v11 is also the only native mobile SDK found with all four 3D pieces stable on both platforms: globe, terrain, the 3D Standard style, and a glTF model layer. Its model layer has been stable since 11.17. Version 11.19 added animated model parts (propellers, doors) and stable elevated lines for flight arcs ([mapbox-maps-ios changelog](https://github.com/mapbox/mapbox-maps-ios/blob/main/CHANGELOG.md)).

The alternatives each fall short:
- **MapLibre Native** (the free, open-source fork) has **no 3D terrain**, only pre-release globe builds (8 Oct 2026), and no glTF model layer ([MapLibre terrain](https://maplibre.org/maplibre-style-spec/terrain/); [releases](https://github.com/maplibre/maplibre-native/releases)).
- **Apple MapKit** is iOS-only and has no model layer. In one device test its SwiftUI camera animator drifted "up to 340 m off the trail" ([OpenBikeComputer #2081](https://github.com/timohueser/OpenBikeComputer/issues/2081)).
- **Google's mobile 3D SDKs** are still Experimental ([Google 3D Maps](https://mapsplatform.google.com/maps-products/3d-maps/)).

Polarsteps, the best-documented large app in the space, runs on the native Mapbox SDKs ([Mapbox showcase](https://www.mapbox.com/showcase/polarsteps)).

Ratings below are the research team's synthesis on a 1–5 scale. They are reasoned estimates; no public benchmark exists.

| Criterion (1–5) | Native Swift → Kotlin | Flutter + official Mapbox | React Native + rnmapbox | Kotlin Multiplatform | Unity |
|---|---|---|---|---|---|
| Map SDK quality / 3D models | 5 | 4 | 4 (volunteer-maintained) | 3 (MapLibre beta, no glTF) | 3 |
| Frame capture + encode | 5 | 2–3 | 2 | 3 | 3 |
| Solo dev speed with AI | 4 | 4 for interface / 2 for capture | 4 for interface / 2 for capture | 3 | 2 |
| Android port effort | 3 | 4–5 | 4–5 | 4 | 5 |
| App size | 5 | 3 | 3 | 4 | 2 |

**Flutter is the runner-up.** Its Mapbox plugin is official, and the model layer is stable in 3.0 (Oct 2026). Choose it only if one interface codebase matters more to you than native polish, and accept that you will still write native capture plugins for each platform.

React Native's map wrapper carries a "Call for additional maintainers" banner. Its Fabric support (React Native's new rendering architecture) shipped with the warning "some stuff might be broken" ([rnmapbox](https://github.com/rnmapbox/maps)).

### The Unity verdict: a capable engine blocked by map licensing

Unity is not a good choice for this app, and the reasons are specific. Unity's own costs are not the problem: the Runtime Fee was cancelled, and Unity Personal is free up to **$200,000** in annual revenue ([Unity pricing](https://unity.com/products/pricing-updates)). The problems are the map data, the video capture and the app shell.

**First, map content.** Mapbox's Unity docs still say "Current version: v2.1.1" and that v3 "will be released soon" ([Mapbox Unity docs](https://docs.mapbox.com/unity/maps/guides/)). The v3.1.0 code exists on GitHub, but:
- it installs by cloning the repository and adding the package "from disk";
- it treats Unity 6 as "best-effort";
- it needed a patch release just to compile on Unity 6 ([README](https://github.com/mapbox/mapbox-unity-sdk/blob/main/README.md); [changelog](https://github.com/mapbox/mapbox-unity-sdk/blob/main/CHANGELOG.md));
- its pricing is "contact Mapbox Sales" ([Unity pricing guide](https://docs.mapbox.com/unity/maps/guides/pricing/)).

Google's Photorealistic 3D Tiles, the usual reason to choose Unity with Cesium, allow video only as **promotional clips of 30 seconds or less "about the capabilities of your application"**. They also ban caching ([Map Tiles API policies](https://developers.google.com/maps/documentation/tile/policies)). A user's exported trip video does not qualify. Cesium ion's paid plans start at **$149/month** and cover use "within your organization". Serving end users requires a custom integration licence ([Cesium pricing](https://cesium.com/platform/cesium-ion/pricing/)).

**Second, capture.** Unity Recorder only works inside the editor, not in a shipped app ([Unity Discussions](https://discussions.unity.com/t/is-there-a-way-to-record-a-video-in-game-save-it-and-be-able-to-access-the-created-recording/919970)). NatCorder, the usual recording plugin, was discontinued. Its replacement, VideoKit, is alpha and needs a subscription ([Unity Discussions](https://discussions.unity.com/t/which-plugin-for-android-smartphone-screen-capture-video-and-screenshots/1559732)).

**Third, the app shell.** You could embed Unity in a native app ("Unity as a Library"), but it renders only full-screen and keeps **80–180 MB** of memory even after you unload it ([Unity Manual](https://docs.unity3d.com/Manual/UnityasaLibrary.html)). An empty Unity app is already about 20 MB on the App Store ([Unity docs](https://docs.unity3d.com/Manual/iphone-playerSizeOptimization.html)). Ordinary app screens (paywall, onboarding, stop lists) are also slower to build in Unity than in SwiftUI.

The best case for Unity is real: you control a fixed-timestep render loop, you get Cinemachine camera tools, and you ship one project to both platforms. That case only wins if the product changes into a stylized, game-like globe drawn from self-hosted OpenStreetMap data, where licensing is simple. That is not this app.

### The recommended stack

| Layer | Choice | Why | Cost |
|---|---|---|---|
| App (iOS) | Swift 6, SwiftUI, standard system components | Picks up Apple's Liquid Glass design automatically; fastest native path | Free |
| Map | Mapbox Maps SDK v11: Standard style, globe, terrain, model layer, elevated lines | Every 3D piece needed is stable; Android SDK releases in step with iOS | Free to 25k MAU, then ~$4 per 1,000 MAU ([Woosmap](https://www.woosmap.com/blog/mapbox-pricing)) |
| Geometry | turf-swift (along, trim, bezier, simplify) plus about 30 lines of custom great-circle code | turf-swift has **no greatCircle** ([turf-swift](https://github.com/mapbox/turf-swift)) | Free |
| Routing | Calculate flights locally; call Mapbox Directions once per road leg and store the result with the trip | 100k requests/month free, then ~$2 per 1,000 ([StoreRocket](https://storerocket.io/learn/mapbox-pricing)) | ~$0 with stored routes |
| Geocoding | MapKit search on the phone; Apple Maps Server API (25,000 calls/day per team) for Android | Mapbox's free geocoding results may not be stored ([Apple](https://developer.apple.com/documentation/applemapsserverapi.md); [Geocodio](https://www.geocod.io/geocoding-terms-of-use-comparison)) | $0 |
| Export | Fixed-timeline render loop → AVAssetWriter, drawing into reusable BGRA pixel buffers; H.264 by default, HEVC optional; audio track muxed in | Saving each frame as a PNG wasted ~94% of export time in one project ([RayMol](https://github.com/javierbq/RayMol/issues/601)) | Free |
| Vehicles | Free-licence (CC0) low-poly .glb files from Quaternius / Poly Pizza; under 65,536 vertices per mesh | No credit line needed in videos ([Poly Pizza](https://poly.pizza/bundle/Cars-Bundle-FE5IWe6OMk); [Mapbox 3D spec](https://docs.mapbox.com/style-spec/guides/using-3d-models/)) | Free |
| AI | Foundation Models on-device + PCC behind a provider interface; Gemini Flash-Lite / GPT-5 mini as cloud fallback; Vision aesthetics score | Near-zero marginal cost | ~$0 |
| Payments | StoreKit 2 + RevenueCat; Superwall later for paywall tests | RevenueCat is free under $2,500 monthly tracked revenue, then 1% ([BuildMVPFast](https://www.buildmvpfast.com/blog/revenuecat-vs-superwall-vs-adapty-in-app-subscription-indie-2026)) | $0 at launch |
| Backend | None for the MVP, apart from a small proxy that holds cloud AI keys | Keeps API keys out of the app binary | Minimal |
| Android | Kotlin + Jetpack Compose (Material 3 Expressive) + Mapbox Android v11 + Media3 Transformer `RawAssetLoader` | Accepts the map's GPU frames directly with timestamps ([Android docs](https://developer.android.com/reference/androidx/media3/transformer/RawAssetLoader)) | Free |

Keep the route, timeline, easing and camera-path maths in **a small pure-Swift module with unit tests and no UIKit or Mapbox imports**. That module translates almost mechanically to Kotlin, or can move into a Kotlin Multiplatform module later. It also gives an AI coding assistant fast, cheap feedback without running on a device.

### Making $100 of AI credits last

$100 of assistant credits will not pay for an assistant to write two native apps by trial and error, so spend in order of risk:
- **Spikes first.** If frame capture is too slow, you find out before spending on interface code.
- **Start from Mapbox's official airplane sample** rather than generating the animation from scratch.
- **Point the assistant at the engine module and its tests**, where each iteration is fast and can be checked.
- **Build screens from standard SwiftUI components**, which need little bespoke code.

The evidence on assistant quality is weak. It comes from blogs, and they warn that assistants often write pre-Swift 6 concurrency code (`DispatchQueue.main.async` where `@MainActor` is required) ([The Prompt Shelf](https://thepromptshelf.dev/blog/ai-tools-mobile-dev-2026/)). So enable strict concurrency checking from day one, so the compiler catches these errors instead of a paid session.

Xcode 27 shipped with agentic coding features, which may stretch the paid credits further ([Let's Data Science](https://letsdatascience.com/news/apple-releases-xcode-27-with-agentic-coding-30c31dfc)).

## Design for an automatic first draft and a step editor

**Use a step editor, not a video timeline.** Every direct competitor uses a list of stops with settings for each stop, and that matches what users want: their trip as a 10–30 second clip. Travel Animator's flow is: add stops, drag to curve, long-press to assign a vehicle or photos, preview, export ([travelanimator.com](https://www.travelanimator.com/)). A CapCut-style multi-track timeline would be overkill for v1.

The direction to borrow comes from GoPro's September 2026 "Studio Edit": **an automatic first draft that the user can override clip by clip** ([GoPro Quik](https://apps.apple.com/us/app/gopro-quik/id561350520)). That answers the most common complaint about auto-generated memories in adjacent apps: wrong photos, forced music, and no way to reorder.

| Screen | Purpose | Key design decisions |
|---|---|---|
| Home | Get to a first export fast | Template-first cards ("Year in Travel", "Distance between us", "Road trip", "Flight hop") above three ways to start: *From my photos*, *Describe my trip*, *Add stops* (plus GPX import) |
| Review | Confirm what the AI built | A reorderable stop list with dates, a transport chip per leg and a "did you mean…" prompt for ambiguous places. The map updates live. Photos already placed at each stop can be swapped |
| Editor | Tune the story | Edge-to-edge map preview with a scrubber. Style, vehicle and camera pickers in bottom sheets. Settings for each stop: zoom, label, photos, speed. Per-stop "Auto/Manual" toggles |
| Export | Convert and share | Format (9:16 default, 1:1, 16:9, 4:5); length (15/30/60 s); quality. The paywall appears here, after the free preview. Buttons for Reels, TikTok, Save to Photos and "Export silent – add a trending sound in-app" |

**Automate the storytelling defaults.** Open wide on the globe, ease into each stop, and pop a city card, flag and distance counter on arrival. End on a still frame that loops cleanly, and keep the map in the cover frame.

Vendor playbooks recommend:
- opening wide and then zooming in;
- short, high-contrast labels for viewers watching without sound;
- year recaps under a minute, exported silent so a trending sound can be added inside Instagram ([MapRecap](https://maprecap.com/travel-map-for-instagram/); [Travel Recap](https://travelrecap.app/instagram-year-travel-recap)).

Instagram's "Sharing to Reels" accepts **3–60 s, 1080p, H.264/H.265** video, and the developer must warrant that the content does not infringe anyone's IP ([Meta docs](https://developers.facebook.com/documentation/ios/sharing-to-reels-instagram)). TikTok's Share Kit accepts videos up to 10 minutes ([TikTok docs](https://developers.tiktok.com/docs/en/share-kit-ios-quickstart-v2)). So default to **9:16, 1080×1920, 15–30 s** per trip.

Also add a carousel export (a map frame plus stop photos). Buffer's 2026 data shows Instagram carousels lead on engagement (6.9% vs 3.3% for Reels), while Reels reach 2.25× more people ([Buffer](https://buffer.com/resources/data-best-content-format-social-media/)).

**Use Liquid Glass only on floating controls, never on content.** Apps built with the iOS 27 SDK reportedly can no longer opt out of Liquid Glass ([AppleInsider](https://appleinsider.com/articles/26/03/26/stop-holding-out-hope-liquid-glass-will-be-mandatory-in-ios-27)). Apple's WWDC26 update improved legibility and added a user slider from "ultra clear" to "fully tinted" ([MacRumors](https://www.macrumors.com/2026/06/10/how-liquid-glass-is-changing-in-ios-27/)).

So build on standard tab bars, toolbars and sheets. Put the persistent Preview/Export bar in `tabViewBottomAccessory` ([WWDC25 session 323](https://developer.apple.com/videos/play/wwdc2025/323/)). Keep glass out of the rendered video frames. Also limit custom glass for performance: it adds GPU load on top of a live 3D map.

Nielsen Norman Group's critique of Liquid Glass legibility is a reason to use regular (not clear) glass and to test contrast over busy satellite imagery ([summary](https://anderegg.ca/2025/10/12/nielsen-norman-group-on-ios-26-usability)).

**Treat accessibility as a feature.** Animated route videos are full of motion:
- With Reduce Motion on, the in-app preview should become a static overview you step through.
- Honour Reduce Transparency and Increase Contrast.
- Claim Apple's Accessibility Nutrition Labels only for features you have actually tested ([App Store story](https://apps.apple.com/us/story/id1814164299)).

For the Android port, aim for Material 3 Expressive's "excellent" level using standard Compose components ([Android Developers](https://developer.android.com/design/ui/wear/guides/get-started/levels-expression)). That guidance is published for Wear OS; check m3.material.io for phones.

**Add a distinctive watermark.** Use a small corner mark plus an end card, kept separate from the map attribution. It answers "what app made this?" and is how the category's distribution works.

## Maps and music licences are the launch-blocking risks

### The map licence

**Mapbox's video clause is the single biggest risk in the plan.** As extracted from the October 2025 Product Terms (the PDF itself could not be opened directly), the terms:
- bar Licensed Map Content in printed or video media "unless expressly permitted";
- allow promotional video for your own app;
- appear to permit video distributed over the Internet;
- offer broader video rights for purchase in an Order (a signed contract) ([Mapbox Product Terms, Oct 2025](https://cdn.prod.website-files.com/609ed46055e27a02ffc0749b/68dddd2815cb3d82685f0096_Mapbox%20Product%20Terms%20(October%201,%202025).pdf)).

A user's trip video posted to TikTok is arguably neither your promotion nor clearly your Internet distribution. Treat this as **launch-blocking**: email Mapbox sales in week one describing the exact use case, and get either written confirmation or a priced Order addendum.

The other providers are worse:
- **Google 3D Tiles:** promotional clips only, as above.
- **Apple Maps:** content "cannot be used in any way whatsoever, except as agreed by Apple in writing" ([Apple Maps terms](https://www.apple.com/legal/internet-services/maps/terms-en.html)).

The clean fallback is **MapLibre with OpenStreetMap data**. The rights position is clear: show "© OpenStreetMap contributors" visibly on every frame, not hidden behind an (i) button ([OSM community](https://community.openstreetmap.org/t/mapbox-does-not-satisfy-attribution-requirements/108134)). Two ways to host the tiles:
- self-host the planet basemap on Cloudflare R2: about 120 GB of tiles, with no egress fees ([Protomaps](https://docs.protomaps.com/basemaps/downloads); [R2](https://developers.cloudflare.com/r2/pricing));
- use OpenFreeMap, which is free and requires video credit to OpenMapTiles and OSM ([OpenFreeMap](https://github.com/hyperknot/openfreemap)).

The cost of this fallback is the look: no on-device 3D terrain, only hillshading. Keep the timeline engine independent of the map renderer so the swap stays possible.

### The music licence

Music is the second risk. Apple's guidelines say MusicKit is not a valid way to license music for "shareable audio or video files on social networks" ([App Review Guidelines](https://developer.apple.com/app-store/review/guidelines/)). Epidemic Sound's free API tier is for prototyping only. Its commercial tier, which includes sublicensing to end users, is priced by volume through negotiation ([Epidemic Sound developers](https://developers.epidemicsound.com/)). Eleven Music permits commercial use on paid plans ([ElevenLabs](https://elevenlabs.io/hi/eleven-music-api)). Whether that covers end users posting to social platforms must be confirmed in writing.

Music is the fifth most-requested feature (26 requests), not the first, and both TikTok and Instagram add licensed sound natively. So the MVP should:
- export silent by default;
- add a licensed library in 1.x;
- never offer an "export audio" option (royalty-free licences usually forbid it) ([Foxi Music](https://www.foximusic.com/blog/royalty-free-music-for-app-licensing-store-compliance/)).

### All risks and mitigations

| Risk | Evidence | Mitigation |
|---|---|---|
| **Mapbox does not license end-user video exports** | Oct 2025 terms restrict video unless expressly permitted | Email sales on day 1 and get it in writing; burn the logo, "© Mapbox" and "© OpenStreetMap" into every frame; fallback to MapLibre + OSM; keep the engine independent of the renderer |
| **Music claims or takedowns** | MusicKit excluded; Suno/Udio unsettled; Instagram's IP warranty | Silent export in the MVP; a library licensed for end-user social use; no audio export; no Apple Music |
| On-device export too slow or too hot | No published Mapbox frame benchmarks; a MapKit test took ~3.7 min for a full ride on an iPhone 13 ([OpenBikeComputer](https://github.com/timohueser/OpenBikeComputer/issues/2081)) | Spike S1 with a pass threshold; preload tiles with a quick low-resolution pass first; 30 fps default; progress screen; resumable exports; cloud 4K rendering later |
| HEVC encoding glitches | One report of frames out of order with Metal → HEVC ([Developer Forums](https://developer.apple.com/forums/thread/729382)) | H.264 by default; HEVC behind a test |
| Fast-follow and clone saturation | Travel Animator ships weekly and added Journey AI; Polarsteps (20M+ users) has terrain Trip Reels; App Store search shows a flood of "Travel Animator…" clones ([iTunes Search](https://itunes.apple.com/search?term=travel+map+animation&country=us&entity=software)) | A distinct name and icon (lowers copycat/spam rejection risk); lead with automation and reliability; own the year-recap format |
| Geography backlash | 1★ reviews over Kashmir, Crimea, Gulf naming | Border display by region; dashed disputed lines; test the India view before launch |
| AI privacy rejection under 5.1.2(i) | Apple rejected an app under the rule, with no official guidance on what counts as enough consent ([Developer Forums](https://developer.apple.com/forums/thread/815715)) | On-device by default; a consent sheet for each cloud feature; send only derived text |
| PCC free tier ends at scale | 2M-download cap, six months to migrate | Provider interface from day one |
| Purchases fail to unlock | The most common failure among competitors | RevenueCat; sandbox tests for purchase, restore, reinstall and lifetime |
| Mapbox costs grow with free users | Each install counts as a monthly active user (MAU), creating a map snapshot counts, and reinstalls create a new MAU ([Mapbox pricing guide](https://docs.mapbox.com/android/maps/guides/pricing/)) | Store routes with the trip; watch MAU against conversion |
| Small market | Leading iOS apps have only 1–2K US ratings after 2–7 years | Widen to "travel recap"; Android for volume; posters/books later |
| AI dev budget runs out | $100 of credits | Spikes first; narrow MVP; start from Mapbox sample code; test-driven engine module |

## Price per trip, not per week, and keep costs near zero to 25k MAU

### Pricing

Travel is episodic. RevenueCat's 2026 report says travel users return "for [the] next big trip" and Photo & Video users work in "project-based workflows" ([RevenueCat SOSA 2026](https://www.revenuecat.com/state-of-subscription-apps)). Reviewers keep asking for lifetime pricing for an app they use once or twice a year.

The category benchmarks pull in different directions:
- **Hard paywalls convert better.** They turn **10.7%** of downloads into payers by day 35, against **2.1%** for freemium, with no difference in year-one retention.
- **Weekly plans churn.** Weekly subscribers retain only **1–2%** at year one, against 20–40% for yearly plans.
- **Photo & Video converts trials worst.** Its median trial-to-paid rate is **22.2%**, the lowest of any category ([RevenueCat SOSA 2026](https://www.revenuecat.com/state-of-subscription-apps)).

A hard paywall would kill the free watermarked exports that drive word of mouth. So use a soft entry, a paywall at the export moment, and plans built around trips.

| Plan | Includes | US price | India price (~45–50% of US) |
|---|---|---|---|
| Free | **All vehicles**, every creation path including AI, 1080p30 export with watermark and end card, unlimited projects on the phone, Year in Travel at base quality | $0 | ₹0 |
| Trip Pass (non-renewing, 7 days) | Everything in Pro for one trip | ~$4.99 (weekly prices most often sit at $5) | ~₹199–249 |
| **Pro Annual** (default, 7-day trial) | No watermark, 1080p60 and 4K, all styles and premium vehicles, licensed music, premium narration with a fair-use cap, Director mode | **~$29.99** (the most common yearly price is $30; Travel Animator $24.99; Relive $38.99) | ~₹1,199–1,499 |
| Lifetime | Pro forever (cloud-cost AI extras capped) | ~$39.99–$49.99 (Travel Animator $52; Waymotion $39.99) | ~₹1,599–1,999 |

The Trip Pass replaces a weekly auto-renewing plan. It is based on Travel Recap's "Day Pass" ([Travel Recap](https://travelrecap.app/instagram-year-travel-recap)). It catches impulse buyers without weekly auto-renewal, which retains only 1–2% of subscribers at year one and is a recurring source of billing complaints. A/B test it against a weekly plan once traffic allows.

Bundling a lifetime plan with subscriptions fits the category: 33.0% of Photo & Video apps do it, the highest share of any category. A 7-day trial on the annual plan also beats a 3-day one, because 55.4% of 3-day trial cancellations happen on day zero ([RevenueCat SOSA 2026](https://www.revenuecat.com/state-of-subscription-apps)).

Two rules apply to all plans:
- **Never take a free feature back.** Strava and Relive both drew backlash for doing that ([Relive developer reply](https://apps.apple.com/us/app/id1201703657)).
- **Enroll in Apple's Small Business Program before the first sale.** It cuts Apple's commission to 15% ([Apple](https://developer.apple.com/app-store/small-business-program/)).

**Expect a small business, not a big one:**
- The median Photo & Video app earns about $124/month a year after launch; the top 10% earn more than $3,600.
- 21.4% reach $1K/month within two years, and 7.3% reach $10K ([RevenueCat SOSA 2026](https://www.revenuecat.com/state-of-subscription-apps)).
- iOS converts downloads to payers at about **2.9×** the rate of Android, which justifies iOS first.

### Running costs

All costs below are per month. The usage behind them is the research team's assumption: 6 map sessions, 2 exports and 4 road-routing requests per user per month. Re-check vendor prices on their live pages before budgeting.

| Cost line | 1k MAU | 10k MAU | 100k MAU |
|---|---|---|---|
| Mapbox Maps SDK (25k MAU free, then $4 per 1,000) | $0 | $0 | ~$300 |
| Mapbox Directions (100k free, then ~$2 per 1,000) | $0 | $0 | $0 if routes are stored with trips; ~$600 if not |
| Geocoding (MapKit on the phone) | $0 | $0 | $0 |
| On-device / PCC AI | $0 | $0 | $0 (until 2M downloads) |
| Cloud model fallback (~$0.002 per trip, worst case if every trip falls back) | ~$4 | ~$40 | ~$400 |
| Premium narration (if 5% of exports use ElevenLabs Flash) | ~$5 | ~$45 | ~$450 |
| RevenueCat | $0 | $0 | 1% above $2,500 tracked revenue |
| Fixed platform fees | Apple Developer Program $99/yr; Google Play $25 one-time (standard fees) | | |
| **Total (excl. Apple's 15%)** | **~$10–20** | **~$90–100** | **~$1,150–1,750** |

The illustrative rows (cloud fallback and narration) are the report's own arithmetic from the cited unit prices.

At 100k MAU, 1–2% of users paying about $30/year would bring in roughly $2,500–5,000/month gross. That is the report's arithmetic, not a benchmark. Costs therefore stay well covered only if the app stores routes with trips and keeps paid cloud AI inside Pro.

### Launch into the December recap wave

Seasonality is the strongest timing signal in the data:
- December and January hold **53% of Mult.dev's App Store reviews**, with comments like "I came here from tiktok."
- Travel Animator's Play reviews peak in June–August ([Mult.dev reviews](https://itunes.apple.com/us/rss/customerreviews/page=1/id=1606800134/sortby=mostrecent/json)).
- The "distance map" trend, with long-distance couples set to Coldplay's "Paradise", powered TravelBoast's 2022 surge ([Dexerto](https://www.dexerto.com/tiktok/how-to-do-tiktoks-viral-distance-map-trend-1795886)).

So ship one-tap "Distance between us" and "My year in travel" templates, and time pushes for **late December to early January** and **June to August**.

For App Store optimization (ASO):
- **Category:** Photo & Video primary, Travel secondary.
- **Name and subtitle:** a distinctive brand name (avoid "Travel Animator…"), something like "[Brand]: Travel Map Video" with the subtitle "Animated Route & Trip Recap".
- **Keywords:** animation, animated, journey, route, trip, flight, 3D, reels, recap, map, maker, road, travel.
- **Screenshot captions** should repeat search phrases. Appfigures reports they now affect ranking, though another test found the effect weak ([Appfigures](https://appfigures.com/resources/guides/app-store-algorithm-update-2025)).

The growth loops are proven in this category:
- the watermark and end card;
- lifetime codes for 15–30 travel micro-creators in launch week, with the caveat that the "2M+ impressions from 20 creators" case comes from a vendor ([The Viral App](https://theviralapp.com/blog/app-launch-strategy-2026/));
- an affiliate programme;
- AvoMap-style "post a reel, get Pro" credit-back;
- FindPenguins-style reposting of user videos.

Treat **India** as a volume and user-content market priced at about 45–50% of US:
- Travel Animator has more Indian iOS ratings than US ones ([iTunes lookup](https://itunes.apple.com/lookup?id=6462844561&country=in)).
- CapCut is absent from the Indian App Store ([iTunes lookup](https://itunes.apple.com/lookup?id=1500855883&country=in)).
- Indian users convert at about a quarter of the US rate.

## A phased plan from two-week spikes to the Android port

### First technical spikes (weeks 1–2)

Run these before writing any interface code. S1, S2 and L1 decide whether the plan proceeds as written. The pass thresholds are proposed targets derived from the research team's rough budget of 100–250 ms per frame.

| # | Spike | Question | Pass criterion |
|---|---|---|---|
| **L1** | Mapbox legal (email, day 1) | Are end-user exported videos posted to social media allowed, and at what price? | Written yes or a quote. If no: switch to MapLibre + OSM |
| **S1** | Map frame capture | Render 1080×1920 with the Standard style, globe, terrain and a model-layer plane. Compare an off-screen MapView sized to the export with the Snapshotter (which may not draw models). Measure ms per frame on an iPhone 12/13-class device | ≤250 ms per frame (a 30 s clip at 30 fps in ≤4 min); models and terrain correct; two runs give identical frames |
| **S2** | Encoder | AVAssetWriter with reusable BGRA buffers, H.264 vs HEVC, AAC audio track, 4K memory use | No dropped or out-of-order frames; 4K completes without memory warnings, or 4K moves to 1.x |
| **S3** | Route geometry stress | Great-circle arc Sydney → Los Angeles across the date line; elevated arc; stored road leg; a 6,000-mile, 300-stop trip; GPX with duplicate points and loops | No crash; preview stays smooth; editing never loses state |
| **S4** | Camera roll → trips | Group 2–3 real photo libraries by time, distance and home location | Most real trips segmented correctly with only a quick review; runs in seconds |
| **S5** | Text → route | Run the on-device model's structured output on 30 sample prompts, including ambiguous place names; test the cloud fallback | Correct after the confirm step; fallback works on non-Apple-Intelligence iPhones |
| **S6** | Purchases | StoreKit 2 + RevenueCat: annual, Trip Pass, lifetime, restore, reinstall | Every path unlocks instantly and survives a reinstall |
| **L2** | Music licence (email, week 1) | Does Epidemic Sound or Eleven Music cover end-user social posting? | Written terms, or the MVP ships silent only |

### Recommended MVP feature list (iOS 1.0)

| Feature | Detail | Why it is in |
|---|---|---|
| Three ways to start | From my photos (on-device detection), Describe my trip (on-device model), Add stops (MapKit search, coordinates, airport codes, drop a pin); GPX import including several files | Automation is the lead feature; import is the #2 request |
| Stop editor | Reorder, insert anywhere, delete, rename, transport per leg, undo/redo, autosave with versions, unlimited local projects | Lost work is a top complaint |
| Realistic routing | Great-circle flights with date-line handling and elevated arcs; stored road legs for car, bus, bike and walking; smoothed arcs for train and ferry | Wrong routes are a top complaint |
| 8–10 free vehicles | Plane, car, campervan, train, bus, ferry, bike, walker (CC0 .glb) | Every vehicle free |
| Map and camera | Standard style with globe and terrain; 4–6 looks; automatic camera that eases into each stop; 3 presets; zoom override per stop | "Flies over everything" |
| Story layer | Auto-picked, swappable photos at stops; city cards; flags; distance and country counters; title and end cards | Photos are the #4 request; stats drive sharing |
| Templates | Year in Travel (several trips from the camera roll), Distance between us, Road trip, Flight hop | Viral formats and the seasonal window |
| Export and share | 9:16 / 1:1 / 16:9 / 4:5; 15/30/60 s; 1080p30 free with watermark, 1080p60 Pro (4K if S2 passes); silent export; Reels, TikTok, Photos | Matches platform specs |
| Paywall at export | Annual, Trip Pass, Lifetime through RevenueCat; no ads; no coins | Billing trust |
| Privacy and compliance | No account; limited photo access; hide home location; map attribution burned into every frame; consent sheet for any cloud AI | Guideline 5.1.2(i); map terms |

**Deliberately excluded from the MVP:** video clips at stops, a music library, narration, avatars, custom vehicles, landmark pop-ups, a keyframe timeline, iCloud sync, Strava sync, live tracking, web links, iPad layout, and Android.

### Phases from iOS launch to Android

| Phase | Window (from 14 Oct 2026) | Scope | Exit gate |
|---|---|---|---|
| **0. De-risk** | Weeks 1–2 (to ~31 Oct 2026) | Spikes S1–S6; legal emails L1–L2; Small Business Program enrollment; RevenueCat; name and keyword check | S1/S2 pass and Mapbox replies, or a MapLibre fallback decision is made |
| **1. iOS MVP** | Weeks 3–12 (Nov 2026 – mid-Jan 2027) | The MVP list above; TestFlight with 20–50 travellers by week 8 | Stretch: if the core is stable and video rights are confirmed by about 1 Dec, ship a deliberately narrow 1.0 (Year in Travel + single trip) in mid-December for the recap wave. Otherwise ship a polished 1.0 in late Jan–Feb 2027 |
| **2. iOS 1.x growth** | Feb – Aug 2027 | Finish the beat-the-competitors list; 4K; video clips at stops; Google Maps link import; Apple Health workouts; licensed music; Pro narration; avatars; Director-mode keyframes; carousel/poster export; iCloud; creator and affiliate programme; summer 2027 push | Export success and crash-free targets met; day-35 conversion at or above the 2.1% freemium median |
| **3. Android port** | Start ~Jun 2027; launch by ~Nov 2027 | Kotlin/Compose (Material 3 Expressive); Mapbox Android v11; Media3 `RawAssetLoader` export; cloud model by default with Gemini Nano where available; Apple Maps Server API or self-hosted Photon (an open-source geocoder) for geocoding; Play Billing through RevenueCat; India pricing | Feature parity with iOS 1.x before the December 2027 recap season |
| **4. Expansion** | 2028 | Cloud 4K rendering for low-end Android; web share links; printed posters and books; chat editing; generated music; creator tier with custom logo; API/MCP | Driven by revenue mix |

The Android port should take roughly **50–70% of the iOS build time**. That is an estimate; no case study exists. The pure engine module carries over almost line for line, and the Mapbox SDKs share the same style spec, model layer and camera concepts.

Budget for Android quirks:
- **Encoder variability across devices.** Use a valid-configuration check of the kind other Android video tools document ([npm](https://www.npmjs.com/package/@azzapp/react-native-skia-video)).
- **A known Media3 crash** when mixing 48 kHz and 44.1 kHz audio ([androidx/media #2963](https://github.com/androidx/media/issues/2963)).
- **Lower trial conversion.** Photo & Video has the weakest Google Play trial conversion, at 17.1% ([RevenueCat SOSA 2026](https://www.revenuecat.com/state-of-subscription-apps)). Android is a volume market, not the revenue engine.

## Conclusion

The defensible advantage in this category is the pipeline, not the asset library. Vehicle counts and style counts are easy for a weekly-shipping incumbent to copy, and clones do copy them. What incumbents have not shipped is the combination of a trip built automatically from the camera roll, rendering that produces the same frames on every run with no queue, projects that cannot be lost, and pricing that matches how often people travel. Each of those answers a measured complaint. Each can be built by one developer, because it comes down to careful engineering on top of Mapbox's own sample code rather than large content budgets.

The two biggest unknowns are cheap to resolve and should be resolved before any interface code: one email to Mapbox and one frame-time measurement on an iPhone 13. They also change the shape of the product. If Mapbox will not license end-user video at a sensible price, the fallback is MapLibre on OpenStreetMap data, which loses photoreal terrain. That pushes the product toward a stylized, brand-defining globe look. That scenario is also the only one in which Unity's case partly revives. Settle the licence first, and the rest of the plan stays native, cheap to run, and timed to the travel calendar.
