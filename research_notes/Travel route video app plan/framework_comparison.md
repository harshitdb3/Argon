# Framework comparison for a 3D route-map video app (iOS first, then Android)

Scope: which app framework a solo, AI-assisted, small-budget developer should use to build a mobile app that renders animated 3D route maps (a plane or car moving along a route over a 3D map with a cinematic camera) and exports them as MP4. Current as of 14 October 2026. Research method note: WebFetch was failing (DNS) in this session, so primary sources were read with curl or `git` directly (Mapbox docs, the Mapbox Unity SDK git repo, Cesium pricing page, Google policy pages, npm and pub.dev registries, Unity docs). Where a claim comes only from a search-engine summary, that is noted.

## Key question 1: How do the candidate frameworks compare for this specific app, and which one is best?

### Takeaway
Native Swift/SwiftUI with the Mapbox Maps SDK for iOS is the best fit, followed by a native Kotlin port that reuses the same Mapbox APIs. Mapbox ships an official iOS example that is almost this app's core feature: an airplane glTF model animated along a flight path with a following free camera. Video capture and encoding (AVAssetWriter on iOS, MediaCodec or Media3 on Android) are native APIs in any case. Every cross-platform option (React Native/Expo, Flutter, KMP) would still need a native module for the frame-capture-and-encode loop, which is the hardest part of the app. That cuts into most of the code-sharing benefit. Flutter (official Mapbox plugin) is the strongest cross-platform runner-up. Unity is a poor fit, mainly because of map licensing and pricing, not rendering ability (see Key question 2).

### Cited Findings

**Native iOS (Swift/SwiftUI) + Mapbox Maps SDK for iOS**
- Mapbox's official iOS example "SwiftUI - Animated 3D model along a route" animates a 3D airplane along a GeoJSON flight path. It uses `ModelSource` + `ModelLayer`, updates the airplane's position and bearing "on each display frame" via a `DisplayLink`, and drives a following camera through `map.freeCameraOptions` (location, altitude, `lookAtPoint`), "creating a flyover effect along the route" — [Mapbox iOS example](https://docs.mapbox.com/ios/maps/examples/swiftui-animated-3d-model/)
- The Mapbox iOS docs index also lists "Display a 3D model in a model layer", "Interactive 3D model source", "Use a 3D model to show the user's location", "SceneKit rendering on map" (custom layer rendering SceneKit models over terrain), fly-to and custom camera animators — [Mapbox iOS llms.txt index](https://docs.mapbox.com/ios/maps/llms.txt)
- The SDK is very actively maintained. The changelog shows 11.31.0 (17 Sep 2026), 11.32.0 (1 Oct 2026), 11.32.1 (12 Oct 2026) and 11.33.0-rc.1 (5 Oct 2026) — [mapbox-maps-ios CHANGELOG](https://github.com/mapbox/mapbox-maps-ios/blob/main/CHANGELOG.md)
- `MapView.snapshot(includeOverlays:)` "Synchronously captures the rendered map as a `UIImage`". Internally it calls `drawHierarchy(in:afterScreenUpdates:)` on the Metal view, so it captures the live on-screen view rather than an offscreen render target — [MapView+Snapshot.swift source](https://github.com/mapbox/mapbox-maps-ios/blob/main/Sources/MapboxMaps/Foundation/MapView%2BSnapshot.swift)
- `MapView` exposes `presentsWithTransaction` (controls `CAMetalLayer.presentsWithTransaction`) and `preferredFrameRateRange`, which help sync rendering with capture — [MapView.swift / PresentationTransactionMode.swift source](https://github.com/mapbox/mapbox-maps-ios/tree/main/Sources/MapboxMaps/Foundation)
- A separate `Snapshotter` creates "a static, non-interactive image of a map style with specified camera position" returned as a `UIImage` — [Mapbox iOS static snapshot example](https://docs.mapbox.com/ios/maps/examples/static-map-snapshot/)
- `MapRecorder` (v11) records and replays API calls for debugging. It is experimental and "designed for development purposes only", so it is not a video exporter — [Mapbox MapRecorder guide](https://docs.mapbox.com/ios/maps/guides/debugging-and-profiling/map-recorder/)
- Mapbox has no official recipe pairing the SDK with AVAssetWriter. The pipeline (step camera → capture frame → append pixel buffer) has to be built by hand — [search summary of Mapbox docs; no AVAssetWriter guide found](https://docs.mapbox.com/ios/maps/examples/static-map-snapshot/)
- Model layer constraints: glTF 2.0 only, max 65,536 vertices per mesh (16-bit indices), and no glTF cameras or lights — [Mapbox style-spec "Using 3D models"](https://docs.mapbox.com/style-spec/guides/using-3d-models/)
- Billing is per monthly active user ("Maps SDKs for Mobile" MAUs). A user counts "as soon as they view a map or otherwise cause your app to use Maps SDK functionality" — [Mapbox iOS pricing guide](https://docs.mapbox.com/ios/maps/guides/pricing/). The Android guide says creating a map snapshot also counts — [Mapbox Android pricing guide](https://docs.mapbox.com/android/maps/guides/pricing/)

**Native Android (Kotlin/Compose) + Mapbox Maps SDK for Android (the later port)**
- The Android docs offer the same building blocks: "3D Model Layer", "Interactive 3D model source", "MapView Snapshot" (bitmap from a MapView), "Create a snapshot" (MapSnapshotter), camera animations, and MapboxMapRecorder — [Mapbox Android llms.txt index](https://docs.mapbox.com/android/maps/llms.txt)
- The Android SDK ships in lockstep with iOS (11.33.0-rc.1 dated 5 Oct 2026) — [mapbox-maps-android CHANGELOG](https://github.com/mapbox/mapbox-maps-android/blob/main/CHANGELOG.md)
- For encoding on Android, Jetpack Media3 Transformer's `RawAssetLoader` accepts video frames as GL textures via `queueInputTexture(texId, presentationTimeUs)`. The older `TextureAssetLoader` is deprecated in its favor — [Android RawAssetLoader reference](https://developer.android.com/reference/androidx/media3/transformer/RawAssetLoader)

**React Native (Expo, New Architecture) + @rnmapbox/maps**
- `@rnmapbox/maps` latest is 10.3.8 (12 Oct 2026), and 10.3.6, 10.3.7 and 10.3.8 all shipped in October 2026, so it is actively released — [npm registry @rnmapbox/maps](https://www.npmjs.com/package/@rnmapbox/maps)
- The 10.1.0 release notes added "fabric support (should cover all functionality, but some stuff might be broken)" and Mapbox v11 support "including api for new features like style config, slot and ModelLayers" — [rnmapbox CHANGELOG](https://github.com/rnmapbox/maps/blob/main/CHANGELOG.md)
- The library is community-maintained. The README carries a "Call for additional maintainers" banner and a sponsorship request. It does not run in Expo Go; it needs a custom dev client — [rnmapbox README](https://github.com/rnmapbox/maps)
- Its frame-grab API is `MapView.takeSnap([writeToDisk])`: "Takes snapshot of map with current tiles and returns a Base64-encoded PNG image, or a file-system URI to a temporary PNG file" — [rnmapbox MapView docs](https://github.com/rnmapbox/maps/blob/main/docs/MapView.md)
- Expo's Modules API "allows you to write Swift and Kotlin to add new capabilities to your app with native modules and views", and all Expo Modules support the New Architecture — [Expo Modules API overview](https://docs.expo.dev/modules/overview/). Expo latest on npm is 57.0.28 (12 Oct 2026) — [npm expo](https://www.npmjs.com/package/expo)
- `@shopify/react-native-skia` latest is 2.14.0 (1 Oct 2026) — [npm](https://www.npmjs.com/package/@shopify/react-native-skia). `@azzapp/react-native-skia-video` (0.10.1, Aug 2026) can export "videos created by compositing frames from other videos" using the Skia imperative API. It has Android-specific encoder-capability checks — [npm @azzapp/react-native-skia-video](https://www.npmjs.com/package/@azzapp/react-native-skia-video)
- `@maplibre/maplibre-react-native` latest is 11.5.0 (Oct 2026) — [npm](https://www.npmjs.com/package/@maplibre/maplibre-react-native)

**Flutter + mapbox_maps_flutter (official) / flutter_map / maplibre_gl**
- `mapbox_maps_flutter` (Mapbox's official plugin) released 3.0.0 on 2 Oct 2026 and 3.0.1 on 12 Oct 2026, with 2.x patch releases continuing alongside — [pub.dev API mapbox_maps_flutter](https://pub.dev/packages/mapbox_maps_flutter)
- Relevant changelog entries:
  - Adds `MapboxMap.snapshot()`, which "captures the map's current canvas as PNG-encoded bytes".
  - ModelLayer is promoted to stable.
  - On Android, the default platform-view hosting changes to Hybrid Composition, and rendering moves to a SurfaceView by default "avoiding the per-frame copy a TextureView requires".
  - Fixes several Snapshotter and platform-view crashes.
  — [mapbox_maps_flutter changelog](https://pub.dev/packages/mapbox_maps_flutter/changelog)
- Mapbox's Flutter docs include "Display a 3D model" and "Create a static map snapshot" examples — [Mapbox Flutter llms.txt index](https://docs.mapbox.com/flutter/maps/llms.txt)
- `flutter_map` latest is 8.3.2 (27 Aug 2026), and `maplibre_gl` is 0.27.1 (10 Sep 2026) — [pub.dev flutter_map](https://pub.dev/packages/flutter_map); [pub.dev maplibre_gl](https://pub.dev/packages/maplibre_gl)
- FFmpegKit (the common Flutter and React Native video path) was officially retired on 6 Jan 2025, and its prebuilt binaries were scheduled for removal. A "FFmpegKitNext" continuation is source-only (dates from search summary; sources conflict on the archive date: June 2025 vs July 2026) — [Taner Sener, "Saying goodbye to FFmpegKit"](https://tanersener.medium.com/saying-goodbye-to-ffmpegkit-33ae939767e1); [arthenica/ffmpeg-kit repo](https://github.com/arthenica/ffmpeg-kit)
- A community fork, `ffmpeg_kit_flutter_new`, is still publishing (4.6.7 on 5 Oct 2026) — [pub.dev ffmpeg_kit_flutter_new](https://pub.dev/packages/ffmpeg_kit_flutter_new)

**Kotlin Multiplatform / Compose Multiplatform**
- JetBrains lists Compose Multiplatform UI as Stable on both Android and iOS, and core KMP as Stable on iOS — [Kotlin docs: supported platforms](https://kotlinlang.org/docs/multiplatform/supported-platforms.html)
- Mapbox ships no KMP SDK. The main KMP map library is `maplibre-compose`, which marks iOS and Android as Beta and says "minor releases can contain breaking changes". Its v0.15.0 moved Android and iOS onto MapLibre Native FFI. The latest is 0.18.0 (25 Sep 2026, per an aggregator) — [maplibre-compose GitHub](https://github.com/maplibre/maplibre-compose); [buildwithmaplibre SDK page](https://buildwithmaplibre.com/sdks/maplibre-compose/)
- MapLibre Native has no built-in glTF model layer. As of the May 2025 newsletter, glTF loading existed only as a demo of a planned "plugin layer" mechanism — [MapLibre Newsletter May 2025](https://maplibre.org/news/2025-06-02-maplibre-newsletter-may-2025/)

**Web / hybrid (MapLibre GL JS, deck.gl, CesiumJS in a WebView or PWA)**
- WebCodecs (the browser API for encoding frames to H.264/HEVC) is only partially supported ("video-only") on iOS Safari 16.4–18.x. It is fully supported from iOS Safari 26.0 — [caniuse WebCodecs data](https://caniuse.com/webcodecs)
- Remotion's map-animation guide renders Mapbox GL JS frames deterministically by using `useDelayRender()` to wait for the map to load before each frame is captured. This is a server or desktop rendering approach — [Remotion: Map animations](https://www.remotion.dev/docs/maps)

**Paywall SDKs (relevant to every stack)**
- RevenueCat's Unity SDK 8.4.0 added Paywalls and Customer Center (Oct 2025) — [RevenueCat release note](https://www.revenuecat.com/release/unity-sdk-adds-paywalls-and-customer-center-support-2025-10-23)
- Adapty has a Unity SDK with Paywall Builder support — [Adapty Unity SDK overview](https://adapty.io/docs/unity-sdk-overview)
- Superwall's Unity SDK is in beta. Superwall states its runtime renders paywalls on iOS, Android, React Native, Flutter, Capacitor, Unity and Web — [Superwall Unity docs](https://superwall.com/docs/unity/llms.txt)

**AI coding assistant fit (low-quality evidence)**
- Blog and vendor comparisons claim:
  - Claude Code is "Very Good" for Swift and "Excellent" for Flutter and React Native.
  - An experimental Dart/Flutter MCP server can be connected to Claude Code.
  - Assistants trained on older code often produce patterns that fail under Swift 6 strict concurrency, such as `DispatchQueue.main.async` where `@MainActor` is needed.
  - No source covered Unity-specific accuracy.
  — [The Prompt Shelf: AI tools for mobile dev 2026](https://thepromptshelf.dev/blog/ai-tools-mobile-dev-2026/); [Dartitude: best AI for Flutter](https://dartitude.com/blog/best-ai-for-flutter-development). These are not independent benchmarks.

### Inferences
- **Comparison matrix** (my synthesis from the findings above; scores 1–5, higher is better for this app):

| Criterion | Native Swift → Kotlin | KMP/CMP | RN/Expo + rnmapbox | Flutter + mapbox_maps_flutter | Unity (+Mapbox v3 / Cesium) | Web/WebView |
|---|---|---|---|---|---|---|
| Map SDK quality / 3D models | 5 (first-party Mapbox, official airplane example) | 3 (MapLibre Beta, no glTF layer; or hand-wrap Mapbox per platform) | 4 (ModelLayer exposed; community-maintained wrapper) | 4 (official Mapbox wrapper, ModelLayer stable) | 3 (Mapbox v3 young, sales-only pricing; Cesium/Google licensing blockers) | 3 (GL JS / three.js custom layers fine; WebView perf) |
| Deterministic frame capture + H.264/HEVC encode | 5 (direct AVAssetWriter / Media3 access) | 3 (native per platform anyway) | 2 (needs custom Expo native module; takeSnap is base64 PNG) | 2–3 (snapshot() returns PNG bytes over channel; needs native plugin) | 3 (full control of render loop, but runtime recorders are paid/alpha or DIY) | 2 (WebCodecs full only on iOS 26+) |
| Mid-range Android perf | 4 | 4 | 3 | 3 (platform-view overhead, now mitigated with HC/SurfaceView) | 3 (heavy runtime + 3D tiles memory) | 2 |
| App size | 5 | 4 | 3 | 3 | 2 | 4 (PWA) / 3 (WebView) |
| Paywall SDKs | 5 | 4 | 5 | 5 | 4 (RevenueCat/Adapty OK; Superwall beta) | 3 |
| Dev speed (solo + AI) | 4 | 3 | 4 for UI / 2 for capture | 4 for UI / 2 for capture | 2 (UI building, editor workflow less AI-friendly) | 3 |
| Android port effort | 3 (rewrite UI + capture; same Mapbox APIs) | 4 | 4–5 | 4–5 | 5 (same project) | 5 |

- **Recommendation: Native Swift/SwiftUI + Mapbox Maps SDK v11 on iOS. Then native Kotlin/Compose + Mapbox Maps SDK v11 on Android.** Reasoning:
  - **The hardest part is native in every stack.** The core risk in this app is the export loop: step a deterministic timeline → set model position and camera → wait for tiles and render → grab the frame → encode with hardware H.264/HEVC. Cross-platform stacks only expose PNG/base64 snapshot APIs at the JS/Dart layer, so in every stack this loop ends up written in Swift and Kotlin.
  - **Mapbox has a worked reference.** Its official iOS sample already implements the animation and camera half of the product.
  - **The Android port reuses the design.** The Mapbox iOS and Android SDKs share the same style spec, ModelLayer, FreeCamera concepts and release cadence. Porting is a translation exercise (Swift → Kotlin, AVAssetWriter → MediaCodec/Media3), which AI assistants handle well.
  - **Mitigation for the double cost.** Keep all route, timeline, easing and camera-path math in a small, pure, well-tested module with no UIKit/Mapbox dependencies. It can be translated mechanically to Kotlin, or later moved into a KMP shared module.
- **Runner-up: Flutter.** It is the best cross-platform choice because the map plugin is Mapbox-official (not community), ModelLayer is stable and releases are frequent. You would still write a native capture/encode plugin per platform. Pick it only if you value one UI codebase over native polish and accept platform-view overhead on Android.
- **React Native/Expo** has the best paywall and AI ecosystem story, but `@rnmapbox/maps` is volunteer-maintained (call for maintainers) and its Fabric support was described as "some stuff might be broken" when it landed. The export loop would still be a custom Expo module in Swift and Kotlin.
- **KMP/CMP** is now stable on iOS, but it has no Mapbox SDK and its MapLibre wrapper is Beta without glTF models. It is better used later to share pure logic than as the UI/map layer.
- **Web/WebView** is unsuitable as the primary on-device renderer for iOS-first: WebCodecs is fully available only on iOS 26+, and WebView WebGL overhead is significant. A web stack is, however, a credible server-side rendering fallback (Remotion-style deterministic rendering), at higher server cost.
- **Achieving 1080p/4K natively.** `MapView.snapshot()` captures the on-screen view. For 4K export, the MapView would likely need to be laid out at a pixel size of 3840×2160 (e.g., an offscreen-positioned or covered view in a window) rather than truly headless. This needs a spike to validate memory and Metal texture limits on older iPhones.
- **Share sheet, Photos and paywalls** are solved problems in every stack: native UIActivityViewController/PHPhotoLibrary; expo-sharing/expo-media-library; share_plus; Unity NativeShare/NativeGallery plugins. These package names were not verified in this session.

### Gaps
- No public benchmark compares Mapbox rendering frame times on mid-range Android across native, Flutter platform views, React Native and Unity. The performance scores above are reasoned estimates.
- Mapbox's free MAU tier and per-MAU price for "Maps SDKs for Mobile" could not be extracted (the pricing page is rendered client-side). It must be read directly at mapbox.com/pricing.
- It is unconfirmed whether the iOS `Snapshotter` (true offscreen) renders `ModelLayer` models, terrain and the Standard style's 3D content. If it does, it could enable headless rendering at arbitrary resolution. This needs a code spike.
- No published app-size delta for adding the Mapbox Maps SDK v11 to an iOS app was found.
- AI-assistant quality per framework rests only on blog and vendor claims, with no independent benchmark.
- No explicit Mapbox policy on users exporting map animations as videos was found. The attribution guide covers "Static & print" (cite like a photograph). Mapbox's terms should be checked, or sales asked, before launch.

## Key question 2: Is Unity a good fit (Mapbox Unity SDK status, Cesium/Google 3D Tiles cost and terms, licensing, app size, UI, video capture, Unity as a Library)?

### Takeaway
Unity is not a good fit for a budget-constrained solo developer on this app. Three reasons:
- **Map content.** The Mapbox Unity SDK is alive again (v3.1.x, 2026) but is new, iOS/Android-only, installed "from disk", and priced only via Mapbox Sales.
- **Licensing.** Google Photorealistic 3D Tiles' policies allow only short promotional videos, not user-generated video exports. Cesium ion's self-serve plans cover use "within your organization", and serving end users needs custom integration licensing.
- **Engineering overhead.** Runtime video capture needs a paid/alpha plugin or a DIY encoder, and Unity as a Library is full-screen-only.

Unity's real strength is full control of a deterministic render loop. Native Mapbox already covers this app's visual needs.

### Cited Findings
**Mapbox Maps SDK for Unity: status in 2026**
- Mapbox's Unity docs page still states "Current version: v2.1.1" and "Version 2 of the Maps SDK for Unity is no longer in active development. Version 3 is in development and will be released soon". The docs were "reduced to include only an installation guide" (page metadata dateModified 2025-05-23) — [Mapbox Unity SDK docs](https://docs.mapbox.com/unity/maps/guides/)
- The GitHub repo has a `v3.1.0` tag (commit dated 18 May 2026, "Document AR/MR support, polish README"). `main`/`develop` were last updated 20 Jul 2026, and a `ver3.2` branch was committed on 12 Oct 2026 ("Report 3.2.0 from Constants.SDK_VERSION…"). Active 2026 branches include `terrainImprovements`, `landmarksMerge` (glTF import) and `locationModuleChanges` — [mapbox/mapbox-unity-sdk repository refs, read via git ls-remote/fetch](https://github.com/mapbox/mapbox-unity-sdk)
- The v3 README says:
  - Package `com.mapbox.sdk`, current version 3.1.0.
  - Minimum Unity 2022.3 LTS ("Primary target"); Unity 6 (6000.x) is "Best-effort".
  - Build targets are "Only iOS and Android" (Standalone, WebGL, console and visionOS not supported).
  - Universal Render Pipeline is required.
  - Install via Package Manager "Add package from disk" after cloning the repo.
  - Samples: LocationBasedGame, WorldMapViewer, Directions, Geocoding, MapboxComponents.
  — [mapbox-unity-sdk README](https://github.com/mapbox/mapbox-unity-sdk/blob/main/README.md)
- The CHANGELOG v3.1.1 patch exists to restore "compilation on Unity 6+ projects", because the 3.1.0 Examples assembly failed to compile on Unity 6. v3.1.0 contains source-breaking API changes (camera, terrain, tile provider) — [mapbox-unity-sdk CHANGELOG](https://github.com/mapbox/mapbox-unity-sdk/blob/main/CHANGELOG.md)
- License: Mapbox TOS; the SDK may be used only with an active Mapbox account — [mapbox-unity-sdk LICENSE](https://github.com/mapbox/mapbox-unity-sdk/blob/main/LICENSE)
- Pricing page: "For pricing on the Maps SDK for Unity, contact Mapbox Sales" — [Mapbox Unity pricing](https://docs.mapbox.com/unity/maps/guides/pricing/)
- Earlier community issues asked whether the project was dead or abandoned — [Issue #1837 "Is mapbox-unity abandonware?"](https://github.com/mapbox/mapbox-unity-sdk/issues/1837); [Issue #1912 "This project is dead?"](https://github.com/mapbox/mapbox-unity-sdk/issues/1912); [Issue #1734](https://github.com/mapbox/mapbox-unity-sdk/issues/1734)
- Niantic Spatial has sunset its Maps SDK for Unity and points developers to third-party options including Mapbox — [Niantic Maps SDK sunset notice](https://www.nianticspatial.com/en/products/maps-sdk-notice)

**Cesium for Unity and Google Photorealistic 3D Tiles: cost and terms**
- Cesium for Unity is a free, open-source plugin with an optional Cesium ion subscription — [Cesium for Unity](https://cesium.com/platform/cesium-for-unity/)
- It is actively maintained: v1.26.0 (1 Oct 2026), v1.25.0 (3 Aug 2026; added Unity 6.5 support), 16 KB page alignment for Android 15+, and iOS build support with later iOS fixes — [cesium-unity CHANGES.md](https://github.com/CesiumGS/cesium-unity/blob/main/CHANGES.md). The marketing page lists "Windows, macOS, Android, and VR" but not iOS, which is inconsistent with the changelog — [Cesium for Unity](https://cesium.com/platform/cesium-for-unity/)
- Cesium ion plans:
  - Community: free; personal/non-commercial use and exploratory commercial development.
  - Commercial: $149/mo individual or $524/mo team.
  - Premium: $499/mo individual or $874/mo team.
  - Google Photorealistic 3D Tiles quota: 1,000 / 5,000 / 10,000 root tiles per month.
  - Paid plans are labeled "Commercial use within your organization", with "Integration pricing and licensing: Contact us if you plan to integrate Cesium ion into solutions used outside your organization".
  - A paid account is required once revenue or funding exceeds $50K.
  — [Cesium ion pricing](https://cesium.com/platform/cesium-ion/pricing/)
- Google bills Photorealistic 3D Tiles per root-tile request. The official price list (per search summary) gives a free usage cap of 1,000, then $6.00 per 1,000 up to 100k, $5.10 per 1,000 for 100,001–500,000, falling to $2.40 per 1,000 above 5M — [Google Maps Platform pricing](https://developers.google.com/maps/billing-and-pricing/pricing). Root-tile requests count against the daily quota; individual tile requests don't. The old $200 monthly credit ended 28 Feb 2025 — [Map Tiles API usage and billing](https://developers.google.com/maps/documentation/tile/usage_limits)
- One root request opens a renderer session of up to three hours (search summary of Google's FAQ) — [Google Maps Platform blog FAQ](https://mapsplatform.google.com/resources/blog/commonly-asked-questions-about-our-recently-launched-photorealistic-3d-tiles/)
- **Licensing blocker.** The Map Tiles API policies cover video only under "Promotional Videos". The video "must be no more than 30 seconds", "must be about the capabilities of your application(s)", must be "clearly marked, 'for promotional purposes only'", "may not be resold separately or as part of the software, application, or user experience", and must exclude Street View. The policies also prohibit pre-fetching, caching or storing content, and offline uses — [Google Map Tiles API policies](https://developers.google.com/maps/documentation/tile/policies)

**ArcGIS Maps SDK for Unity**
- Supports iOS and Android among its deployment targets. It requires an ArcGIS Location Platform or ArcGIS Online account; a free Location Platform account exists — [ArcGIS Maps SDK for Unity FAQ](https://developers.arcgis.com/unity/faq/)
- One free-plan developer reported about 4,000 tiles used in a day from Editor and internal tests and found it "too expensive" (anecdotal, unanswered) — [Esri Community thread](https://community.esri.com/t5/arcgis-maps-sdk-for-unity-questions/tile-usage/m-p/1357265)

**Unity licensing**
- The Runtime Fee was cancelled in September 2024 — [Unity blog](https://unity.com/en/blog/unity-is-canceling-the-runtime-fee)
- Unity Personal is free up to $200,000 annual revenue plus funding, and its splash screen is optional with Unity 6. Pro is required above $200K, at $2,310 per seat per year or $210 per month from 12 Jan 2026. Enterprise is required above $25M — [Unity pricing updates](https://unity.com/products/pricing-updates)

**Video capture in Unity**
- The Unity Recorder is an Editor-only tool, so it cannot record from an iOS or Android build. Developers instead use paid plugins or a custom render-texture pipeline — [Unity Discussions thread](https://discussions.unity.com/t/is-there-a-way-to-record-a-video-in-game-save-it-and-be-able-to-access-the-created-recording/919970)
- NatCorder was discontinued and replaced by VideoKit, which is described as alpha with a C# API "expected to change a lot". NatCorder 1.9.4 required "an active NatML VideoKit subscription" — [Unity Discussions](https://discussions.unity.com/t/which-plugin-for-android-smartphone-screen-capture-video-and-screenshots/1559732); [VideoKit package listing](https://classic.yarnpkg.com/en/package/ai.natml.videokit); [NatCorder npm listing](https://npmjs.com/package/ai.natml.natcorder)
- A free iOS ReplayKit bridge (screen recording) exists — [ustwo/ReplayKitUnityBridge](https://github.com/ustwo/ReplayKitUnityBridge)

**Unity as a Library (embedding Unity in a native app)**
- "You can't load or integrate more than one instance of the Unity runtime".
- "Unity supports only full-screen rendering" (not part of the screen).
- After `Application.Unload`, Unity retains "between 80 and 180 MB" of memory.
— [Unity Manual: Unity as a Library](https://docs.unity3d.com/Manual/UnityasaLibrary.html); [Unity as a Library on iOS](https://docs.unity3d.com/Manual/UnityasaLibrary-iOS.html)

**App size**
- An empty Unity project is "around 20MB in the App Store" with size optimizations disabled — [Unity 6.3 manual: iOS player size](https://docs.unity3d.com/Manual/iphone-playerSizeOptimization.html). The 2022.3 docs say it can go below 12 MB with stripping — [Unity 2022.3 manual](https://docs.unity.cn/Components/iphone-playerSizeOptimization.html)

### Inferences
- **The Mapbox Unity SDK is not deprecated in October 2026, but it is a risky dependency for a solo developer:**
  - v3 has existed publicly only since around mid-2026.
  - The official docs page still describes v3 as "coming soon".
  - Unity 6 is "best-effort", and a patch was needed just to compile on Unity 6.
  - It installs from a cloned repo rather than a registry.
  - Pricing is "contact sales", so there is no self-serve cost model to budget against.
- **Google Photorealistic 3D Tiles are effectively off the table** for a product whose core output is user-exported, shareable videos. The policies only permit ≤30-second promotional videos about your app and forbid storing content. A user-generated MP4 export is not covered. This applies regardless of engine (Unity, Unreal, CesiumJS).
- **Cesium ion's self-serve tiers don't fit a consumer app.** Each user session needs its own root-tile request, so 5,000 root tiles/month on the $149 plan would cover only a few thousand sessions. In any case, distributing ion content to end users "outside your organization" requires a custom integration license from Cesium sales.
- **Unity's real advantages** are a fully controllable render loop (e.g., fixed-timestep capture via `Time.captureFramerate`, a standard Unity API not verified in this session) and better cinematic tooling (Cinemachine, post-processing). For this product, these are outweighed by:
  - map-licensing friction;
  - a roughly 20 MB+ runtime plus 3D-tile memory pressure on mid-range Android;
  - uGUI/UI Toolkit being slower for building conventional app screens (paywall, onboarding, editors, lists) than SwiftUI or Compose;
  - Unity-as-a-Library's full-screen-only restriction, which makes a "native shell + Unity renderer" hybrid awkward.
- **Unity would make sense** only if the product pivots to a game-like, fully stylized globe (custom low-poly world, no third-party photoreal tiles) where map-data licensing is simple (e.g., self-hosted OSM-derived data).

### Gaps
- VideoKit's current price and license terms were not found.
- No firm figure for a typical Unity + Mapbox v3 or Cesium mobile build size was found.
- Mapbox Unity SDK v3 pricing cannot be determined without contacting sales.
- No Unity Asset Store or UPM-registry listing for Mapbox Unity v3 was found.
- It was not confirmed whether Google's general Maps Platform terms elsewhere grant broader video rights (e.g., via the separate Aerial View API). Only the Map Tiles API policy page was read.

## Key question 3: How hard is the later Android port for each option?

### Takeaway
Cross-platform stacks (Flutter, React Native, Unity, web) make the UI port nearly free. All of them except Unity and web still need a second native capture/encode module for Android. A native Swift-first build means rewriting the UI and the export pipeline in Kotlin, but against near-identical Mapbox APIs, which is a well-bounded translation task suited to AI assistants.

### Cited Findings
- The Mapbox Android SDK exposes the same feature set used by the iOS reference example (3D model layer, interactive model source, MapView snapshot, MapSnapshotter, camera animations) — [Mapbox Android docs index](https://docs.mapbox.com/android/maps/llms.txt)
- iOS and Android Mapbox SDK versions are released in lockstep (both 11.33.0-rc.1 on 5 Oct 2026) — [iOS CHANGELOG](https://github.com/mapbox/mapbox-maps-ios/blob/main/CHANGELOG.md); [Android CHANGELOG](https://github.com/mapbox/mapbox-maps-android/blob/main/CHANGELOG.md)
- The Android-side encoder path is the Media3 Transformer `RawAssetLoader` (GL texture input with timestamps) — [Android RawAssetLoader reference](https://developer.android.com/reference/androidx/media3/transformer/RawAssetLoader)
- `@azzapp/react-native-skia-video` documents Android-specific encoder-capability checks (`getValidEncoderConfigurations`), showing that Android hardware encoder variability has to be handled even in cross-platform stacks — [npm @azzapp/react-native-skia-video](https://www.npmjs.com/package/@azzapp/react-native-skia-video)
- `mapbox_maps_flutter` changed Android defaults (Hybrid Composition hosting, SurfaceView rendering) to avoid per-frame copies, a sign that Android performance with platform views needs tuning — [mapbox_maps_flutter changelog](https://pub.dev/packages/mapbox_maps_flutter/changelog)
- The Mapbox Unity v3 SDK needs per-Unity-version Android plugin folders copied manually into `Assets/` for Android builds — [mapbox-unity-sdk README](https://github.com/mapbox/mapbox-unity-sdk/blob/main/README.md)
- Compose Multiplatform is Stable on iOS and Android — [Kotlin docs](https://kotlinlang.org/docs/multiplatform/supported-platforms.html)

### Inferences
- **Native Swift → native Kotlin.** Medium effort, roughly 50–70% of the iOS build time for a solo developer with AI help (estimate). Concepts, Mapbox style JSON, glTF assets, camera math and backend/paywall configuration carry over. SwiftUI → Compose and AVAssetWriter → MediaCodec/Media3 are well-trodden translations. Making the timeline and camera engine a pure module first reduces this further, and it could be moved to KMP later.
- **KMP/CMP.** Low-to-medium effort: logic and UI are shared. The map is the problem: either wrap Mapbox natively per platform via expect/actual (doing native work twice anyway) or accept Beta MapLibre without glTF models.
- **React Native/Expo and Flutter.** Low effort for UI and app logic. Medium effort for the Kotlin side of the custom capture/encode module and Android encoder quirks.
- **Unity.** Lowest code-port effort (same project). Android build configuration for Mapbox v3 is manual, and performance on mid-range Android with heavy 3D content is the main risk.
- **Web/PWA.** Trivial port, but the weakest on-device rendering and encoding quality.

### Gaps
- No case studies were found that quantify iOS→Android port time for Mapbox-based apps in any stack.
- No data was found on Mapbox ModelLayer performance on specific mid-range Android GPUs (e.g., Mali/Adreno 6xx class).

## Key question 4: What shipping apps exist in this category, and which stack do they use (from public info)?

### Takeaway
The category has clear consumer demand: TravelAnimator, Relive, Polarsteps (Trip Reels) and Mult.dev. Public stack evidence is thin. Only Polarsteps' use of the Mapbox mobile SDKs is confirmed (via a Mapbox showcase). No source confirmed that any leading map-video app is built in Unity.

### Cited Findings
- **TravelAnimator** is a travel map animation app for iOS and Android. Users add stops, choose a 3D model and map style, and export videos sized for Reels, TikTok and Shorts — [travelanimator.com](https://www.travelanimator.com/). A listing claims 250+ 3D vehicle models, 30+ map styles, 4K/HD exports, and Google Maps URL import — [Product Hunt](https://www.producthunt.com/products/travel-animator). App Store listings show two developers (Lascade, and SHELL INFRASTRUCTURE PRIVATE LIMITED on a separate "Travel Animator Maps App" listing) — [App Store listing](https://apps.apple.com/us/app/travel-animator-maps/id6757300007); [App Store listing (TR)](https://apps.apple.com/tr/app/travelanimator-journey-route/id6462844561). No public source states its engine or map SDK.
- **Relive** builds 3D fly-through videos of outdoor activities from GPS and satellite imagery — [TechCrunch 2017](https://techcrunch.com/2017/05/02/relive/). Its team page lists several "Full Stack Engineer" roles and a "Mobile Platform Staff Engineer", but no stack — [Relive jobs page](https://www.relive.com/jobs). No source confirms its mobile or rendering stack.
- **Polarsteps** uses the Mapbox Maps SDKs in its mobile app for route tracking and map styling, plus Mapbox GL JS. The showcase cites 15 million registered travelers in 2025 — [Mapbox showcase: Polarsteps](https://www.mapbox.com/showcase/polarsteps). Its Google Play listing describes "Trip Reels", which turns a trip into a video — [Google Play: Polarsteps](https://play.google.com/store/apps/details?id=com.polarsteps)
- **Mult.dev** is a web tool that creates animated travel maps downloadable as MP4. It imports Google Maps links and GPX/KML and supports per-leg plane, car, train, bus, boat or walking — [FreeTech4Teachers review](https://freetech4teach.teachermade.com/?p=3780); [Mult.dev article](https://mult.dev/articles/how-to-import-a-route-from-google-maps-into-multdev-and-create-a-travel-animation). Its rendering stack was not confirmed (page source inspection in this session found no map-library identifiers).
- Mapbox's Unity SDK samples are oriented to location-based games (LocationBasedGame, WorldMapViewer), not video export — [mapbox-unity-sdk README](https://github.com/mapbox/mapbox-unity-sdk/blob/main/README.md)

### Inferences
- The best-documented large player in the adjacent space (Polarsteps) runs on the native Mapbox mobile SDKs. This is consistent with recommending native + Mapbox.
- TravelAnimator's feature set (hundreds of vehicle models, many map styles, 4K export) is achievable with Mapbox ModelLayer + style configuration + native encoding. Unity is not required for this feature set, though it cannot be ruled out as TravelAnimator's engine.

### Gaps
- TravelAnimator's, Relive's and Mult.dev's engines and map SDKs could not be confirmed. No job posts, tech blogs or SDK showcase pages naming them were found, and binary inspection was not possible in this environment.
- No real-world example of a shipping consumer map-video app built on Unity + Mapbox, Cesium or Google 3D Tiles was found, nor one confirmed native that exports via AVAssetWriter.
- Unreal Engine was only briefly assessed. Epic charges a 5% royalty on lifetime gross revenue above $1M per product — [Unreal Engine FAQ](https://www.unrealengine.com/en-US/faq). No data was gathered on Unreal mobile app size or Cesium for Unreal on iOS. Unreal shares Unity's map-licensing problems (Google 3D Tiles video policy, Cesium ion integration licensing) and has a heavier mobile footprint, so it is not a credible option for a solo budget build.
