# AI Features to Differentiate a Trip-to-Animated-Route-Video App (iOS first, then Android) — research as of 14 Oct 2026

Method note for the report writer: Web searches worked. Direct fetches of several primary vendor pages failed with DNS errors from this environment (ai.google.dev, elevenlabs.io, macrumors.com, techcrunch.com, mult.dev, nubiapage.com). As a result, many prices below come from **secondary aggregators that state their own check dates**. Those dates are given inline. The official pricing pages should be re-checked before anyone budgets from these numbers.

---

## Q0. Which AI features should be prioritized, and for each: user value, competitor overlap, implementation, per-use cost, solo-dev feasibility?

### Takeaway
The clearest white space is **turning a trip into a map route automatically**, either from the camera roll (EXIF GPS + time clustering) or from a plain-language description. No map-animation competitor found ships either one. Apple Memories and Google Photos auto-build trip videos, but they make no route map. Polarsteps has AI itinerary *planning*, not video. Both features can run almost free on-device on iOS 26/27, with Apple's free Private Cloud Compute tier as a backup. Voiceover, music, chat editing and 3D landmark pop-ups are second-wave features: they cost more per use, carry licensing or quality risk, or need much more engineering.

### Cited Findings
(Supporting facts are cited in Q1–Q5. This section only collects the competitor-overlap evidence that drives the ranking.)
- Polarsteps' AI itinerary builder (summer 2025 release) generates a multi-destination plan on a map. It uses opt-in trip history, human-written editorial content and Claude, and is aimed at planning future trips — [Polarsteps news, Summer 2025 release](https://news.polarsteps.com/news/polarsteps-summer-2025-release-is-here); the App Store listing still advertises an "AI itinerary planner" — [App Store: Polarsteps](https://apps.apple.com/us/app/polarsteps/id947925763)
- Apple Photos "Describe a memory" (iOS 18.1+, Apple Intelligence devices) builds a movie from a text prompt such as "Me in Paris in July 2024". It adds an AI-generated title and asks for an Apple Music song choice. There is no route map — [iDownloadBlog](https://www.idownloadblog.com/2024/09/25/how-to-create-photo-memory-using-apple-intelligence/); [Tom's Guide](https://www.tomsguide.com/ai/i-used-apple-intelligence-to-create-a-memory-movie-from-my-photos-heres-how-it-went)
- Google Photos added AI highlight videos in Oct 2023: users pick people, places or activities, and the app assembles clips with music. Ask Photos (Gemini, I/O 2024) can suggest which photos belong in a trip highlight and write a social caption — [GSMArena](https://www.gsmarena.com/google_photos_can_now_make_aigenerated_highlight_videos_for_you-news-60355.php); [Google blog, Ask Photos](https://blog.google/products/photos/ask-photos-google-io-2024/)
- The only AI features attributed to Travel Animator are "AI Custom Models (personalised 3D models)" and "AI-assisted route smoothing". Both come from a single third-party review updated Aug 2026 — [Nubia Magazine review (search snippet; page could not be fetched)](https://nubiapage.com/travelanimator-review-in-2026-app-ai-video-windows-faqs/). App Store listings for the several apps named "Travel Animator" do not mention AI. They describe rule-based automatic 3D route animation, vehicle icons and map styles — [App Store: Travel Animator Journey Video](https://apps.apple.com/app/id6748111417); [App Store: TravelAnimator: Journey Route](https://apps.apple.com/app/id6462844561)
- No AI feature was found for Relive. Its core product is a 3D flyover video built from GPS activity data. Relive Plus adds photos/clips (50–100), preselected music, HD, speed control, colour themes and removal of end credits — [Relive support: Plus features](https://support.relive.com/kb/guide/en/relive-plus-features-fQ8ISqSGRd/Steps/3655880)
- CapCut's relevant AI is auto captions with language detection and TTS (11 voices, 10 languages), plus user-made travel-recap templates that need a fixed number of clips (e.g., 14 clips at 9:16). No one-tap "trip to video" feature was confirmed — [CapCut: AI video editing for travel vloggers](https://www.capcut.com/create/ai-video-editing-for-travel-vloggers); [CapCut template example](https://www.capcut.com/template-detail/BEACH-TRAVEL-2026/7590764366543441157)

### Inferences
Prioritized feature list. Costs are derived from the prices cited in Q1–Q3; token counts are my assumptions.

**Tier 1 — build for MVP (high differentiation, near-zero cost, solo-feasible)**

1. **Auto-build trip from camera roll** (new to the route-map category)
   - *User value:* one tap turns a trip's photos into stops, order and dates, then picks the best photos and clips for each stop.
   - *Competitors:* Apple Memories and Google Photos auto-select photos but render no route map. Relive builds from GPS activity tracks, not photos. No map-animation app found does this.
   - *Implementation (iOS, all on-device):* PhotoKit asset location/time. Cluster by time gap plus distance (e.g., DBSCAN or a simple gap threshold). Reverse-geocode cluster centroids with on-device CoreLocation/MapKit. Rank photos with Vision `CalculateImageAestheticsScoresRequest` (iOS 18+, score −1..1, separates "memorable" from utility shots such as screenshots). Optionally label stops with the Foundation Models on-device model.
   - *Optional cloud landmark naming:* Cloud Vision landmark detection ($1.50 per 1k images after 1k free), or a Gemini/Claude vision call.
   - *Android:* MediaStore EXIF plus ML Kit; Gemini Nano Prompt API image input on supported devices.
   - *Cost:* about $0 on-device. Optional landmark detection on ~20 photos is about $0.03 with Cloud Vision.
   - *Feasibility:* High. The main difficulty is heuristics: photos without GPS, and inferring transport legs (flight vs drive) from distance and time gaps.

2. **"Describe your trip" to structured itinerary to route** (white space for videos)
   - *User value:* type "London → Paris by Eurostar, then flew to Rome, May 3–10" and get an editable route.
   - *Competitors:* Polarsteps does natural-language itinerary for *planning*. No route-video app was found doing it.
   - *Implementation:* An LLM with structured/guided output (JSON schema of stops, order, transport mode, dates), then geocode each place name. Run on the Foundation Models on-device model first and escalate to Apple PCC, which is free under the Small Business Program threshold. On Android or cloud, use Gemini Flash-Lite, GPT-5 mini or Claude Haiku.
   - *Geocoding:* MapKit `MKLocalSearch` on-device, or the Apple Maps Server API (25k calls/day free per team). Mapbox temporary is free for the first 100k/month.
   - *Cost:* about 1k input + 800 output tokens per trip. That is roughly $0.0015 (Gemini 3.1 Flash-Lite), $0.002 (GPT-5 mini) or $0.005 (Claude Haiku 4.5). It is $0 on-device or on Apple PCC (while eligible).
   - *Feasibility:* High. The main risk is ambiguous names (Paris, TX vs Paris, FR), so show a confirm-and-edit step.

3. **AI titles, captions and hashtags (multilingual)**
   - *Competitors:* already table stakes. Apple Memories auto-titles, Google Ask Photos writes captions, CapCut auto-captions.
   - *Implementation:* on-device Foundation Models or Gemini Nano, with a cloud LLM fallback.
   - *Cost:* about $0–$0.001.
   - *Feasibility:* Very high. It is cheap parity rather than a differentiator.

**Tier 2 — fast follow (differentiating when combined with route data; moderate cost)**

4. **Auto stats and fun facts per stop**
   - *Implementation:* compute distance, countries, days and transport-mode totals deterministically, with no AI. Use an LLM only for "fun facts", grounded in retrieved text such as Wikipedia/Wikidata to limit hallucination (Wikipedia/Wikidata grounding was not researched here).
   - *Competitors:* none found offering LLM fun facts on a route video. Relive shows activity stats.
   - *Cost:* about $0.001–$0.005 per video on cloud LLMs, $0 on-device.
   - *Feasibility:* High for stats. Medium for facts, because of the accuracy risk.

5. **AI voiceover narration (multilingual)**
   - *Implementation:* Tier A is AVSpeechSynthesizer system voices (free, on-device). Tier B is premium cloud TTS.
   - *Cost for 60 s (~900 characters):* ElevenLabs Flash about $0.045, ElevenLabs Multilingual about $0.09, OpenAI gpt-4o-mini-tts about $0.015/min (estimate).
   - *Personal Voice:* Apple restricts it, so it is not a fit (see Q1).
   - *Competitors:* CapCut has generic TTS. No route-map app was found offering a narrated story.
   - *Feasibility:* High. Gate the paid TTS behind the subscription.

6. **Music plus beat-synced cuts**
   - *Licensed library (safest):* Epidemic Sound's API is free for prototyping only; commercial use is custom-priced by download volume.
   - *Generated music:* Eleven Music about $0.15/min (paid plan required), Stable Audio 2.5 about $0.20 per generation (up to 3 min), Lyria 2 about $0.06 per 30 s (aggregator figures). Avoid Suno and Udio: no confirmed public API, and their licensing is unsettled.
   - *Beat detection:* can be done on-device with standard onset/beat tracking. The specific libraries were not researched.
   - *Competitors:* Relive offers preselected music. Apple Memories uses Apple Music, which third parties cannot use for export.
   - *Feasibility:* Medium. The licensing paperwork is the bottleneck, not the code.

7. **Multi-format remix (9:16 / 1:1 / 16:9) with AI pacing**
   - *Implementation:* mostly deterministic re-render. An LLM can pick a duration and pace per platform.
   - *Competitors:* CapCut already offers resizing.
   - *Cost:* about $0.
   - *Feasibility:* High. The value is moderate; "trend-matching templates" would need a trend data feed, which is not feasible solo.

**Tier 3 — later or experimental**

8. **Chat-based editing** ("make the plane slower over Paris")
   - *Implementation:* LLM tool or function calling over a JSON scene graph. Foundation Models supports tool calling and guided generation on iOS. On Android or cloud, use Gemini/Claude/OpenAI function calling.
   - *Cost:* about 2k input + 300 output tokens per command, so roughly $0.001 (Flash-Lite) to $0.0035 (Haiku 4.5).
   - *Competitors:* none found in route-video apps.
   - *Feasibility:* Medium. The hard part is designing a clean, small edit DSL. Strong as a demo or marketing feature.

9. **AI camera direction** (cinematic paths, pacing per leg)
   - *Implementation:* mostly heuristics based on leg length, transport mode and number of photos at each stop. An LLM can choose among preset camera moves.
   - *Cost:* about $0.
   - *Feasibility:* Medium. It is a quality multiplier more than a marketing headline.

10. **3D landmark pop-ups / AI custom 3D models**
    - *Competitors:* Travel Animator reportedly already has "AI Custom Models" (single source).
    - *Implementation:* a curated asset library keyed by landmark recognition.
    - *Feasibility:* Low–medium, because the assets are costly. Avoid generative 3D.

11. **Photo stylization / AI backgrounds**
    - Apple's ImageCreator/Image Playground API could not be verified (see Gaps). Cloud image generation adds moderation and cost.
    - *Feasibility:* Low priority. It is not core to "route video".

12. **Additional ideas found**
    - *Import a trip from booking screenshots or emails:* Vision OCR on iOS, then LLM extraction. Google's own Prompt API examples include "event details from an email thread".
    - *Import from a Google Maps URL:* TravelAnimator reportedly supports this per one aggregator title, [Feedbagel](https://feedbagel.com/post/travelanimator-create-animated-travel-maps-from-google-maps-urls).
    - *"Travel profile" across trips:* Polarsteps-style.

**Overall per-video AI cost estimate for a "full" premium render** (cloud LLM + 60 s premium TTS + 30–60 s generated music): about $0.10–$0.25, dominated by TTS and music. The LLM and geocoding share is under $0.01. Without premium TTS and music, the cost is roughly $0.

### Gaps
- No direct evidence on whether Travel Animator's "AI Custom Models" or "AI route smoothing" exist in the shipping app (single review; the page could not be fetched).
- The mult.dev "best travel map animation tools in 2026" roundup could not be fetched, so smaller map-animation competitors (e.g., Mult.dev itself, Journey Boast) were not assessed for AI features.
- No data on user demand or willingness to pay for any specific AI feature.

---

## Q1. What do Apple's on-device and Apple Intelligence options offer in 2026, and what does Android offer?

### Takeaway
On iOS 26/27, the Foundation Models framework gives a free on-device LLM plus, since WWDC 2026, **free Private Cloud Compute (PCC) access** for small developers. It now accepts image input and can route to third-party server models (Claude, Gemini) through the same Swift API. That makes iOS-first AI nearly zero-marginal-cost for a solo developer. Android's equivalent, the ML Kit GenAI Prompt API on Gemini Nano, was still alpha with limited device support in the sources found, so Android needs a cloud fallback.

### Cited Findings
**Apple — Foundation Models / PCC (WWDC 2026, June 8–9 2026)**
- Free access to Apple Foundation Models running on Private Cloud Compute for developers with fewer than 2 million first-time App Store downloads was the headline WWDC 2026 announcement — [MacRumors, 9 Jun 2026 (search snippet)](https://www.macrumors.com/2026/06/09/apple-outlines-major-ai-and-developer-tool-updates/); [TechCrunch, 8 Jun 2026 (search snippet)](https://techcrunch.com/2026/06/08/apple-bets-cheaper-ai-will-woo-small-developers/)
- Eligibility, per Apple's page:
  - Requirements: enrolled in the App Store Small Business Program, under 2M first-time downloads across all your apps, and the PCC entitlement assigned to your account.
  - Test installs do not count toward the threshold.
  - If you cross the threshold or leave the program, you must migrate to an alternative within 6 months.
  - Source: [Apple Developer: Accessing Private Cloud Compute](https://developer.apple.com/private-cloud-compute)
- The framework adds image input and server-side model integration, so developers can call third-party models such as Claude and Gemini through the same Swift API. It also adds "Dynamic Profiles" for multi-agent workflows, and per the docs can route between on-device, PCC or another server provider — [Implicator.ai (AI-generated, editor-reviewed; treat with caution)](https://www.implicator.ai/apple-expands-xcode-and-foundation-models-for-wwdc-ai-developers/); [MacRumors snippet](https://www.macrumors.com/2026/06/09/apple-outlines-major-ai-and-developer-tool-updates/)
- Apple said the Foundation Models framework would be open-sourced "later this summer" (2026) — [MacRumors snippet](https://www.macrumors.com/2026/06/09/apple-outlines-major-ai-and-developer-tool-updates/)
- **Core AI**, a new framework for running custom on-device models, was announced alongside agentic Xcode updates — [Implicator.ai](https://www.implicator.ai/apple-expands-xcode-and-foundation-models-for-wwdc-ai-developers/); [Let's Data Science: Xcode 27](https://letsdatascience.com/news/apple-releases-xcode-27-with-agentic-coding-30c31dfc)

**Apple — Vision, Speech, Personal Voice, Photos**
- Vision `CalculateImageAestheticsScoresRequest` (iOS 18+, macOS 15+, visionOS 2) returns an `ImageAestheticsScoresObservation` — [Apple docs](https://developer.apple.com/documentation/vision/calculateimageaestheticsscoresrequest.md). Per a tutorial, it includes an `overallScore` from −1 to 1 that weighs blur, exposure, colour balance and composition, and the request is designed to separate memorable photos from utility images such as screenshots — [Create with Swift](https://www.createwithswift.com/scoring-the-aesthetics-of-an-image-with-the-vision-framework/)
- **Personal Voice** (iOS 17+):
  - Generated on-device; third-party apps request it via `requestPersonalVoiceAuthorization`.
  - Apple says its use is sensitive and "should be primarily used for augmentative or alternative communication apps" — [WWDC23 session 10033](https://developer.apple.com/videos/play/wwdc2023/10033/); [WWDC Notes](https://wwdcnotes.com/notes/wwdc23/10033)
  - A developer reports that buffer callbacks (needed to render speech into a video file) are not supported with Personal Voices — [Apple Developer Forums thread 736148](https://developer.apple.com/forums/thread/736148)
- Apple's own Photos app uses Apple Intelligence to "craft a storyline with unique chapters and a narrative arc" and set it to music (Mac: macOS 15.4+, M1+). This shows the capability exists system-side but is not exposed as a third-party movie API — [Apple Support: Mac Memories](https://support.apple.com/guide/mac-help/mchl35c53342)

**Android — Gemini Nano / ML Kit GenAI**
- The ML Kit GenAI **Prompt API** launched in **alpha on 30 Oct 2025**:
  - It sends natural-language and multimodal (image + text) requests to on-device Gemini Nano, with offline capability and privacy benefits.
  - Best performance is on the **Pixel 10** series (nano-v3, same architecture as Gemma 3n).
  - Google suggests prototyping with Gemma 3n on other devices.
  - Source: [Android Developers Blog](https://developer.android.com/blog/posts/ml-kit-s-prompt-api-unlock-custom-on-device-gemini-nano-experiences)
- Google's listed Prompt API use cases include image understanding ("draft social posts"), information extraction ("event details from an email thread") and content classification. All three map directly onto trip import and captioning — [Android Developers Blog](https://developer.android.com/blog/posts/ml-kit-s-prompt-api-unlock-custom-on-device-gemini-nano-experiences)
- Earlier ML Kit GenAI pre-built APIs cover summarization and image description — [Android Developers Blog](https://developer.android.com/blog/posts/ml-kit-s-prompt-api-unlock-custom-on-device-gemini-nano-experiences); device list: [ML Kit GenAI device support](https://developers.google.com/ml-kit/genai#device-support)
- An InfoQ item (Feb 2026) covered the Android GenAI Prompt API — [InfoQ JP](https://www.infoq.com/jp/news/2026/02/android-genai-prompt-api)

### Inferences
- An iOS-first plan can put most text features (itinerary parsing, captions, fun facts, chat edits) on the Foundation Models on-device model, with free PCC as an escalation path. That means near-zero AI cost until 2M downloads, plus 6 months of migration runway after that. Design a provider abstraction from day one, because the PCC benefit ends at scale.
- The third-party model routing reported for 2026 would let the same Swift code call Claude or Gemini when on-device quality falls short. This rests on lower-tier sources, so confirm against Apple docs.
- Background knowledge, not re-verified this session: the WWDC25 on-device model is about 3B parameters with a small context window (about 4k tokens) and supports `@Generable` guided generation and tool calling. Keep prompts compact; it suits structured extraction, not long creative writing.
- Personal Voice is effectively unusable for exported narration, given Apple's AAC-focused guidance and the reported buffer-callback limitation. Use system AVSpeechSynthesizer voices for the free tier and cloud TTS for the premium tier.
- On Android, Gemini Nano coverage is too narrow (flagship devices only, alpha API) to be the primary path. Plan for a cloud LLM default with on-device as an opportunistic optimization.

### Gaps
- Exact on-device Foundation Models specs for the 2026 (iOS 27) model, the context window, and the languages supported for third-party apps were not verified; MacRumors and TechCrunch pages could not be fetched.
- Whether **Image Playground / ImageCreator** has a public developer API usable for stylizing photos in an exported video, and its terms, was not found.
- Whether the ML Kit Prompt API left alpha by Oct 2026, and the status of Firebase AI Logic hybrid on-device/cloud fallback, could not be confirmed.
- Pricing for PCC for developers *above* the free threshold was not found.
- Implicator.ai's claim that the framework docs list "watchOS 27" alongside iOS 26 looks inconsistent and is unverified.

---

## Q2. Cloud options and current pricing: LLM/vision (Claude, Gemini, OpenAI), TTS (ElevenLabs etc.), music generation and licensed libraries

### Takeaway
Cheap LLMs (Gemini Flash-Lite, GPT-5 mini) cost well under $0.01 per trip-parsing or captioning call. Claude Haiku 4.5 costs about 3–4x more but is still under a cent. **TTS and music dominate per-video cost** at roughly $0.015–$0.10 per minute each. Music licensing is the riskiest area: Suno and Udio terms are in flux after the 2025 label settlements. The safer options are ElevenLabs Eleven Music on paid plans, Stability's Stable Audio, Google Lyria, or a licensed library such as Epidemic Sound, which is custom-priced.

### Cited Findings
**LLM / vision (per 1M tokens, input/output)**
- **Gemini 3.1 Flash-Lite:** $0.25 / $1.50 (aggregator, checked 3 Sep 2026; also on a June 2026 list) — [AnotherWrapper: Gemini 3.1 Flash-Lite](https://anotherwrapper.com/tools/llm-pricing/gemini-3.1-flash-lite-preview)
- **Gemini 3.5 Flash-Lite:** $0.30 / $2.50, 1M context (aggregator, Aug 2026). This conflicts on which is the current Flash-Lite — [AnotherWrapper: Gemini 3.5 Flash-Lite](https://anotherwrapper.com/tools/llm-pricing/gemini-3.5-flash-lite)
- **Gemini 2.5 Flash-Lite:** $0.10 / $0.40 (June 2026 list) — [MorphLLM: Gemini API pricing 2026](https://www.morphllm.com/gemini-api-pricing)
- **OpenAI GPT-5 mini:** $0.25 / $2.00, cached input $0.025 — [ModelCompare, 12 May 2026](https://modelcompare.dev/pricing/openai-api-pricing); [Puter OpenAI pricing](https://developer.puter.com/tutorials/openai-api-pricing/)
- **Claude Haiku 4.5:** $1.00 / $5.00, cached input $0.10 — [PricePerToken](https://pricepertoken.com/pricing-page/model/anthropic-claude-haiku-4.5); [AnotherWrapper](https://anotherwrapper.com/tools/llm-pricing/claude-haiku-4-5-20251001)
  - A blog dated 11 Oct 2026 claims a "Claude Haiku 5.5" at $0.10 / $0.50. This conflicts with the other sources and appears unreliable — [Activepieces](https://www.activepieces.com/blog/claude-haiku-55-api-pricing-rates-and-costs-for-2026.md)
  - Official page to verify: platform.claude.com/docs/en/about-claude/pricing.
- **Polarsteps' AI itinerary feature uses Claude**, and the company says user photos and videos stay private and are not shared with external AI services — [Polarsteps Summer 2025 release](https://news.polarsteps.com/news/polarsteps-summer-2025-release-is-here)
- **Landmark recognition:** Google Cloud Vision Landmark Detection costs $1.50 per 1,000 units (1,001–5M/month) and $0.60 per 1,000 above 5M; the first 1,000 units per month are free — [Google Cloud Vision pricing](https://cloud.google.com/vision/pricing)

**TTS**
- **ElevenLabs API:** $0.10 per 1k characters for Multilingual v2/v3 and $0.05 per 1k for Flash/Turbo. The rate is the same across plans; paid tiers add included usage, not a lower rate. Regenerations are billed again — [Puter: ElevenLabs API pricing (Jun 2026)](https://developer.puter.com/tutorials/elevenlabs-api-pricing/); [ModelsLab (checked 23 Sep 2026)](https://modelslab.com/elevenlabs-api-pricing)
  - Single-source claim: "Eleven v4" launched 28 Sep 2026 at $0.08 per 1k characters — [DevToolLab](https://devtoollab.com/blog/best-text-to-speech-apis) (unverified)
  - Plan prices conflict between sources (Starter about $5–6/month up to Business $990–$1,320/month) — [Smallest.ai](https://smallest.ai/blog/elevenlabs-pricing-plans-cost-what-you-get-in-2026); [HappyRobot](https://www.happyrobot.ai/hub/elevenlabs-pricing)
- **OpenAI gpt-4o-mini-tts:** $0.60 per 1M input text tokens and $12.00 per 1M audio output tokens, about $0.015/min. That per-minute figure is OpenAI's estimate, not a fixed rate — [OpenAI community thread](https://community.openai.com/t/understanding-gpt-4o-mini-tts-pricing-input-characters-cost/1151816); [s-anand.net](https://www.s-anand.net/blog/openai-tts-cost/)
- **CapCut** offers TTS with 11 voices in 10 languages, so basic TTS is commodity — [CapCut](https://www.capcut.com/create/ai-video-editing-for-travel-vloggers)

**Music generation and licensing**
- **ElevenLabs Eleven Music:**
  - Commercial use is allowed on all paid plans; film, TV and large-studio games need Enterprise; the free tier has no commercial licence; the Music API is for paid subscribers — [ElevenLabs Eleven Music API page](https://elevenlabs.io/hi/eleven-music-api)
  - API price about $0.15/min (third party, checked July 2026), or about 900 credits/min on subscriptions — [Smallest.ai](https://smallest.ai/blog/elevenlabs-pricing-plans-cost-what-you-get-in-2026)
- **Stable Audio 2.5:** 20 credits ($0.20) per generation, up to 3 minutes. **Lyria 2:** about $0.06 per 30 s output. One aggregator also lists Lyria 3 Clip at $0.04 per 30 s. All aggregator figures; licensing terms not covered — [CometAPI: AI music API pricing](https://www.cometapi.com/ja/ai-music-api-pricing/)
- **Suno / Udio:**
  - Warner settled with Suno (Nov 2025) and UMG with Udio (Oct 2025); Sony's claims against Udio and the UMG/Sony case against Suno reportedly remain open.
  - Suno paid plans grant commercial rights (wording changed from "ownership" to "granted licence").
  - Udio reportedly suspended WAV downloads and stem exports across all tiers in April 2026 during its licensing transition. Sources conflict on whether Udio commercial use is currently possible.
  - No public API terms were found for either.
  - Sources: [Dubspot (2026)](https://blog.dubspot.com/ai-music-licensing-explained-2026); [Dupple: Suno vs Udio (checked Sep 2026)](https://dupple.com/learn/suno-vs-udio); [Dynamoi timeline](https://dynamoi.com/learn/statistics/ai-music-copyright-cases-timeline)
- **Epidemic Sound developer API:**
  - $0/month tier for prototyping only (cannot go live), with full catalogue access.
  - The commercial "Scale" tier is priced by download volume and includes a commercial licence plus sub-licensing to end users.
  - Partner agreements are negotiated — [Epidemic Sound developers](https://developers.epidemicsound.com/); [Epidemic Sound business/developers](https://www.epidemicsound.com/business/developers/); [APIs.io plans summary](https://apis.io/plans/epidemic-sound/epidemic-sound-plans-pricing/)
  - A 2026 integration (Elevate.io) handles licensing at video export — [Post Magazine, 2026](https://www.postmagazine.com/Press-Center/Daily-News/2026/Elevate-io-integrates-Epidemic-Sound-catalog.aspx)

### Inferences
- Default LLM: an on-device or Apple PCC model on iOS. Use Gemini Flash-Lite or GPT-5 mini as the cheap cloud fallback, especially for Android. Use Claude Haiku 4.5 or larger only where quality matters (narration scripts, chat editing).
- Per-call cost examples at the above rates:
  - Itinerary parse (about 1k in / 800 out): about $0.0015 (Gemini 3.1 Flash-Lite), $0.002 (GPT-5 mini), $0.005 (Haiku 4.5).
  - 60 s narration (about 900 characters): $0.045 (ElevenLabs Flash), $0.09 (ElevenLabs Multilingual), about $0.015 (OpenAI mini-tts).
  - 45 s generated music: about $0.11 (Eleven Music) or $0.20 (Stable Audio, one generation).
- Music strategy for a solo developer:
  - Launch with a small bundled royalty-free or licensed set, or Epidemic Sound once volume justifies a negotiated deal.
  - Add on-demand generated tracks (Eleven Music or Stable Audio) as a premium feature.
  - Avoid Suno and Udio until their licensing and API terms stabilise.
  - Generated music sidesteps Content ID claims on Reels and Shorts only if the licence covers end-user social distribution. Verify this in each vendor's terms.

### Gaps
- Official Google (ai.google.dev), ElevenLabs (elevenlabs.io) and OpenAI pricing pages could not be fetched (DNS failures). All figures are secondary and need confirmation.
- No Gemini TTS pricing or Gemini "Grounding with Google Maps" pricing was retrieved.
- Stable Audio and Lyria commercial licence terms (especially sublicensing to end users posting on social platforms) were not found.
- Artlist and Soundstripe API availability and pricing were not researched.
- No cloud image-generation pricing (for stylization or AI backgrounds) was collected.

---

## Q3. Geocoding / places APIs to turn names into coordinates, and their costs

### Takeaway
On iOS, Apple's MapKit/CoreLocation search on-device is the obvious free first choice, and the Apple Maps Server API gives 25k free calls/day per team for server-side or cross-platform use. Mapbox gives 100k free temporary geocodes/month, but stored results need the paid Permanent tier (from about $5 per 1k). Saved trips are stored by definition, so this licence constraint matters. Google Places Text Search Pro is the priciest at $32 per 1k after 5k free. Nominatim's public server is not for app-scale use, so self-host Photon or Nominatim, or use a commercial OSM-based host.

### Cited Findings
- **Apple Maps Server API + MapKit JS:** up to 25,000 service calls per day per team, shared between the Server API and MapKit JS. Over-quota requests get HTTP 429, and larger quotas go through a request form — [Apple: Apple Maps Server API docs](https://developer.apple.com/documentation/applemapsserverapi.md); [WWDC22 Notes: Meet Apple Maps Server APIs](https://wwdcnotes.com/notes/wwdc22/10006). The MapKit JS page lists 250,000 free map views plus 25,000 service calls per day per Apple Developer Program membership — [Apple MapKit JS](https://developer.apple.com/maps/mapkitjs/)
- **Mapbox (temporary geocoding):** 100,000 free requests/month, then $0.75 per 1,000, with volume discounts — [Mapbox geocoding evaluation page](https://www.mapbox.com/geocoding/evaluation). Temporary results may not be stored or cached — [Geocodio terms comparison](https://www.geocod.io/geocoding-terms-of-use-comparison)
- **Mapbox Permanent geocoding:** no free tier; starts at about $5 per 1,000 and is quote-based at higher volume. It is limited to your own business's use (no redistribution) and lacks POI data — [Geocodio vs Mapbox](https://www.geocod.io/geocodio-vs-mapbox-geocoding-comparison/); [MapScaping](https://mapscaping.com/guide-to-geocoding-api-pricing/)
- **Google Places API (New):**
  - Text Search Essentials (IDs Only) is listed as unlimited free.
  - Text Search Pro has 5,000 free per month, then $32.00 per 1,000 for the first 100k — [Google Maps Platform pricing](https://developers.google.com/maps/billing-and-pricing/pricing?hl=en_US)
  - Since 1 Mar 2025, per-SKU free caps (about 10k Essentials / 5k Pro / 1k Enterprise) replaced the $200 monthly credit.
  - Requests are billed at the highest SKU of any requested field (Enterprise $35, Enterprise+Atmosphere $40 per 1k) — [Woosmap: Google Places API pricing 2026](https://www.woosmap.com/blog/google-places-api-pricing); [OpenPlacesAPI](https://openplacesapi.com/blog/google-places-api-pricing)
- **Nominatim public server (OSMF policy):**
  - Volume must stay modest on donated servers; bulk geocoding is discouraged.
  - Caching is expected, and limits apply per application, not per end user.
  - The policy does not apply to self-hosted instances — [OSMF Nominatim Usage Policy](https://operations.osmfoundation.org/policies/nominatim/)
  - A custom User-Agent/Referer is required — [OSM geocoding list, 2013](https://lists.openstreetmap.org/pipermail/geocoding/2013-June/000825.html)
  - An unofficial source cites a limit of 1 request per second — [unofficial wiki](https://moltchat-agent-commons.onrender.com/wiki/Nominatim_geocoding_usage_policy_and_rate_limits)
- **Photon:** a self-hostable geocoder based on Nominatim/OSM data with downloadable dumps. Self-hosting avoids rate limits — [OSM Community forum](https://community.openstreetmap.org/t/understanding-and-complying-with-nominatim-usage-policy/129212). Licensed Apache 2.0 — [Mobilizon geocoder docs](https://docs.mobilizon.org/3.%20System%20administration/configure/geocoders/)

### Inferences
- iOS MVP: geocode on-device with MapKit (`MKLocalSearch` / `CLGeocoder`), which is free with Apple-managed throttling. Use the Apple Maps Server API for any backend or Android needs within 25k calls/day. A trip of about 8 stops uses 8 calls, so 25k/day covers roughly 3,000 trips/day before a quota request.
- Storing coordinates in a user's saved trip is likely "storage" under Mapbox and Google terms. Check the Apple MapKit terms on caching as well; that was not verified here.
- Cost per 8-stop trip:
  - Apple: $0.
  - Mapbox temporary: $0 within 100k/month, else about $0.006.
  - Mapbox permanent: about $0.04.
  - Google Text Search Pro: about $0.26, the most expensive.
- Android fallback: Apple Maps Server API via your backend, or a self-hosted Photon (about $20–50/month VPS; this hosting cost is my assumption and was not sourced).
- An LLM is not a geocoder. Have the LLM output place names plus country/region hints, then resolve them with a geocoder and show disambiguation.

### Gaps
- Apple MapKit on-device (`MKLocalSearch` / `CLGeocoder`) rate limits and the terms on persisting results were not found.
- Hosted OSM geocoders (Geoapify, LocationIQ, Stadia, Pelias hosted) were not priced.
- The official Mapbox pricing page for Permanent geocoding was not directly fetched.

---

## Q4. Which AI features have competitors shipped as of 2026 (Travel Animator, Relive, Polarsteps, Google Photos, Apple Memories, CapCut, others)?

### Takeaway
Competitors split in two. **Photo apps** (Apple Memories, Google Photos, CapCut) ship AI selection, titles, captions and TTS, but no route maps. **Map/route apps** (Travel Animator, Relive, Strava Flyover) ship 3D route animation with little or no confirmed AI. Polarsteps ships Claude-powered AI itinerary *planning*. No product was found combining AI trip reconstruction (text or photos) with animated route-map video, which is the opening.

### Cited Findings
- **Travel Animator:**
  - Reported AI features are "AI Custom Models (personalised 3D models)" and "AI-assisted route smoothing" (single source, updated Aug 2026). The same review describes a Kerala, India-based app launched in 2024, mobile-only (iOS/Android) — [Nubia Magazine snippet](https://nubiapage.com/travelanimator-review-in-2026-app-ai-video-windows-faqs/)
  - It is freemium with paid plans — [ToolRadar](https://toolradar.com/tools/travelanimator)
  - Product Hunt lists 250+ 3D vehicle models, 30+ map styles and 4K export, with no AI mentioned — [Hunted.space](https://hunted.space/product/travel-animator)
  - Several separate App Store apps use the "Travel Animator" name, and none of their listings mention AI — [App Store id6748111417](https://apps.apple.com/app/id6748111417); [id6462844561](https://apps.apple.com/app/id6462844561); [id6743530581](https://apps.apple.com/app/id6743530581)
- **Relive:**
  - A 3D flyover video from GPS activity data (iPhone/Apple Watch) — [KTAR](https://ktar.com/data-doctors/heres-how-the-activity-app-relive-can-help-you-remember-your-adventures)
  - Plus adds photos/clips, preselected music, HD, speed control, themes and removal of end credits; no AI features were listed — [Relive Plus features](https://support.relive.com/kb/guide/en/relive-plus-features-fQ8ISqSGRd/Steps/3655880)
  - About $6.99/month (App Store) — [App Store: Relive](https://apps.apple.com/id/app/relive-hike-ride-memories/id1201703657)
- **Strava Flyover:** a 3D video recap powered by Fatmap, for subscribers only — [road.cc](https://www.road.cc/content/tech-news/strava-introduces-flyover-3d-video-maps-305103). Strava has also talked about AI route creation — [TechRadar](https://www.techradar.com/features/3-exciting-features-coming-to-strava-this-year-including-ai-route-creation)
- **Polarsteps:**
  - AI itinerary builder (summer 2025) built on opt-in trip history, editorial content and Claude — [Polarsteps news](https://news.polarsteps.com/news/polarsteps-summer-2025-release-is-here)
  - An "AI route assistant" on iOS, with Android "soon" (undated trade article) — [TourMaG](https://www.tourmag.com/Polarsteps-devoile-trois-nouvelles-fonctionnalites_a127673.html)
  - A paid "Plus" tier reportedly launched 5 Aug 2026 (aggregator, unverified) — [Simplify](https://simplify.jobs/c/Polarsteps)
- **Google Photos:**
  - AI highlight videos (Oct 2023) built from people, places and activities, with music, editable afterwards — [GSMArena](https://www.gsmarena.com/google_photos_can_now_make_aigenerated_highlight_videos_for_you-news-60355.php); [Android Authority](https://www.androidauthority.com/google-photos-highlight-video-3379231)
  - Ask Photos (Gemini) helps create trip highlights and writes captions — [Google blog](https://blog.google/products/photos/ask-photos-google-io-2024/)
  - No 2026 travel-video-specific feature was found.
- **Apple Photos Memories:** text-prompt memory movies with an AI title, Apple Music soundtrack, "storyline with chapters" (iOS 18.1+ / macOS 15.4+) — [iPhoneLife](https://iphonelife.com/node/284413); [Apple Support](https://support.apple.com/guide/mac-help/mchl35c53342)
- **CapCut:** auto captions, TTS (11 voices, 10 languages) and community travel-recap templates; no confirmed one-tap trip-to-video — [CapCut](https://www.capcut.com/create/ai-video-editing-for-travel-vloggers)
- **Other "relive memories" AI video apps** (Reliv.ee, launched May 2026; Reely) turn photos into AI-generated cinematic videos without maps — [Hunted.space: Reliv.ee](https://hunted.space/product/reliv-ee); [MWM: Reely](https://mwm.ai/apps/reely-ai-video-maker/6740178270)

### Inferences
- Positioning: "Apple Memories plus a route map." Users already expect auto-selection and AI titles from their OS photo apps, but those apps cannot draw an animated travel route. Map apps can draw routes but require manual entry.
- Parity features (AI titles/captions, TTS, auto-selection) are table stakes. Differentiators are text-to-route, camera-roll-to-route, narrated route stories with grounded stop facts, and chat editing.
- Expect fast-follow risk from Travel Animator (already investing in AI 3D assets) and from Polarsteps, which already has trip data and a Claude-based AI pipeline and could add route videos.

### Gaps
- Official Relive and Travel Animator 2026 changelogs were not found. AI features may exist that the search missed.
- No 2026 confirmation whether Apple Memories in iOS 26/27 gained map or route elements.
- CapCut's official AI feature list for 2026 (e.g., AI auto-edit or "AI travel" features) was not confirmed.
- Smaller map-animation competitors (Mult.dev, Journey Boast) were not checked.

---

## Q5. Privacy considerations for location data and photos

### Takeaway
Since Nov 2025, App Store guideline 5.1.2(i) requires **in-app disclosure plus affirmative opt-in consent before sending personal data (photos, locations) to third-party AI**. A privacy-policy mention is not enough. That strongly favours on-device and Apple PCC processing for camera-roll and location features, with explicit per-feature consent for any cloud model. Polarsteps' "opt-in, photos never shared with external AI" approach is a useful precedent.

### Cited Findings
- Apple's Nov 2025 App Review Guidelines update added explicit mention of third-party AI to rule 5.1.2(i): apps must disclose where personal data is shared with third parties, including third-party AI, and obtain explicit permission first — [TechCrunch, 13 Nov 2025](https://techcrunch.com/2025/11/13/apples-new-app-review-guidelines-clamp-down-on-apps-sharing-personal-data-with-third-party-ai); [iGeeksBlog](https://www.igeeksblog.com/apple-app-store-ai-data-disclosure-guidelines)
- Implementation guidance says you need an affirmative "yes" before data leaves the device; a line in terms or the privacy policy does not satisfy the rule — [QAwerk](https://qawerk.com/blog/apple-app-store-ai-data-sharing-guidelines/); [Stora.sh, 6 May 2026](https://stora.sh/blog/2026-05-06-apple-ai-consent-rule-5-1-2-i-implementation-guide)
- It is unclear whether on-device models are covered; Apple has not clarified — [iGeeksBlog](https://www.igeeksblog.com/apple-app-store-ai-data-disclosure-guidelines). A developer whose app was rejected under 5.1.2(i) asked what counts as sufficient permission, with no official answer — [Apple Developer Forums 815715](https://developer.apple.com/forums/thread/815715)
- One vendor blog claims Google added a matching Android obligation in July 2026. This is uncorroborated — [Product Hunt discussion / vendor blogs via search](https://www.producthunt.com/p/murror/your-we-use-ai-line-is-now-a-consent-screen-apple-s-rule-5-1-2-i-has-been-live-since-november)
- Apple's PCC programme is the route for cloud Foundation Models access (eligibility rules above) — [Apple Developer: Private Cloud Compute](https://developer.apple.com/private-cloud-compute)
- Polarsteps' AI is "entirely opt-in"; it says photos and videos remain private and user data is not shared with external AI services, even though Claude powers the feature — [Polarsteps news](https://news.polarsteps.com/news/polarsteps-summer-2025-release-is-here)
- Android's Gemini Nano Prompt API processes data locally, offering offline capability and "improved user privacy" — [Android Developers Blog](https://developer.android.com/blog/posts/ml-kit-s-prompt-api-unlock-custom-on-device-gemini-nano-experiences)
- Nominatim's policy requires caching and an identifying User-Agent. Sending user-typed places to a public geocoder also shares location intent with a third party — [OSMF Nominatim policy](https://operations.osmfoundation.org/policies/nominatim/)

### Inferences
- Architecture rule: camera-roll analysis (EXIF GPS, clustering, aesthetics scoring, labels) stays on-device. Only send minimal derived text (e.g., "Paris, Rome, May 2026") to cloud LLMs, never raw photos or GPS traces, unless the user explicitly opts into cloud landmark recognition.
- Show a 5.1.2(i) consent sheet per cloud AI feature (narration, cloud fun facts, chat edits via cloud). Record consent and allow revocation, and fill in App Privacy "nutrition label" entries for Location and Photos accordingly.
- Use PhotoKit limited-library access and the photo picker where possible, and request "When In Use" location only if live tracking is added.
- Exported videos can leak home locations: offer "hide start/end point" or "fuzz home location" and strip EXIF from any shared stills. A home-location privacy zone is common in fitness apps, though that was not sourced here.
- For EU users, location histories and photos are personal data under GDPR, so data minimisation and processor agreements (DPAs) with each AI vendor are needed. Vendor data-retention and no-training terms for API data were not researched.

### Gaps
- Official text of App Review Guideline 5.1.2(i) was not fetched directly; the wording above comes from secondary reports.
- Google Play's equivalent AI data-sharing policy (claimed July 2026) is unverified.
- Each AI vendor's API data retention and training policies (Anthropic, Google, OpenAI, ElevenLabs) were not checked.
- Specific GDPR/CCPA guidance on location-history videos was not researched.
