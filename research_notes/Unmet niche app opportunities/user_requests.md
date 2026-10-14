# Recurring, Unmet App Requests from Real Users (2025–2026)

**Method and source caveats (read first)**
- Reddit could not be read directly. reddit.com returned HTTP 403 to curl, and WebSearch/WebFetch refused the domain. Reddit data was instead pulled from the **Arctic Shift Reddit archive API** (arctic-shift.photon-reddit.com). It returned 10,274 posts from 2025-01-01 to 2026-10-14:
  - all 3,024 r/SomebodyMakeThis posts;
  - 6,000 r/AppIdeas posts, covering only 2026-01-27 to 2026-10-14 because of a page cap;
  - title-phrase searches ("is there an app", "wish there was", "app that", "looking for an app", "is there any app") in r/iphone, r/androidapps, r/apps, r/productivity, r/ADHD, r/personalfinance, r/india, r/IndiaTech and r/personalfinanceindia.
- **Arctic Shift scores and comment counts are often snapshots taken soon after posting, so they understate final upvotes.** Treat them as lower bounds.
- Several subreddit queries came back empty because the API was flaky: r/smallbusiness, r/bangalore, r/Entrepreneur, and r/ADHD "is there an app". **Coverage of those subreddits is missing.**
- Reddit links below are standard permalinks (`reddit.com/r/<sub>/comments/<id>/`) for the post IDs pulled from the archive.
- Hacker News was searched through the Algolia API for Ask HN and comments since 2025-01-01. App Store existence checks used the iTunes Search API (US and India storefronts). Each entry shows rating, rating count and last update. Google Play was not searched directly. Google Trends, X/Twitter and Quora were not accessed.
- Many r/AppIdeas "N app ideas people are begging for" posts are marketing posts. One is by the owner of saasniche.com. They claim thread counts and upvotes ("800+ upvotes", "22 threads") **without links**. They are cited only as low-reliability secondary signals.

---

## 1. What do people ask for in "is there an app / I wish there was / somebody make this" threads in 2025–2026?

### Takeaway
Most posts ask for personal admin and life-logistics tools: budgeting, subscriptions and trials, receipts and warranties, pantry and expiry, recipes, checklists, accountability, and app or notification blocking. A smaller cluster is about care for vulnerable people: elderly parents and people living alone. Most of these requests already have apps. Repliers typically answer "this exists, try X". In r/AppIdeas, builders posting their own versions of the same ideas now outnumber the people asking.

### Cited Findings
**Highest-signal individual requests (2025–2026)**
- "An app where adult kids manage their elderly parents' passwords" (r/SomebodyMakeThis, Aug 8 2026, score 45, 25 comments).
  - OP: "Every tool I've found assumes the person using it is tech-savvy enough to understand what a 'vault' is… designed for the relative managing it, not the elderly person."
  - Top replies: "most password managers offer a shared family vault" and "I do this currently with my elderly father, my siblings, and 1Password."
  - One IT worker said: "my main demographic is people in their 70s and 80s… this is something pretty much needed. I'm not aware of a specific app designed with this in mind."
  - [Reddit 1vit5w3](https://www.reddit.com/r/SomebodyMakeThis/comments/1vit5w3/)
- "'I'm OK' – A Daily Check-In Safety App" for people who live alone. It alerts a contact by SMS or email if no check-in arrives within X hours (r/SomebodyMakeThis, Aug 17 2025, score 16). Replies list existing services: Snug Safety, AssureOkay, checkinbee, Dooinwell, imokay.app. Several replies are people who built one after the post. [Reddit 1msmsho](https://www.reddit.com/r/SomebodyMakeThis/comments/1msmsho/)
- "A dead-simple 'Renter's Digital Vault' app for timestamped move-in/out proof to win deposit disputes" (r/SomebodyMakeThis, Feb 15 2026, score 15). It asks for room-by-room checklists, hashed and timestamped photos, and a dispute-ready report. Replies: "I've just used Google Photos", "just email yourself", and a dev who built a prototype. [Reddit 1r59vfg](https://www.reddit.com/r/SomebodyMakeThis/comments/1r59vfg/)
- "Is there a budget app that tells you what's safe to spend based on your account balance, and expected income and bills?" (r/personalfinance, Aug 2026, 24 comments). [Reddit 1vnxvt6](https://www.reddit.com/r/personalfinance/comments/1vnxvt6/)
- "Is there a finance app that's actually worth replacing a custom spreadsheet with?" (r/personalfinance, Aug 2026, score 43, 80 comments).
  - Top comment (84): "no budgeting or finance app is going to match your highly customized spreadsheet."
  - Many replies recommend Monarch or YNAB: "Happily pay the yearly fee."
  - One reply (35) flags the post as likely LLM-written astroturf.
  - [Reddit 1vgroyx](https://www.reddit.com/r/personalfinance/comments/1vgroyx/)
- "Looking for an app with reusable checklists" (r/ADHD, Jul 2025, 29 comments). The OP's previous app "Check Check… vanished from the Google Play Store." [Reddit 1m0cv26](https://www.reddit.com/r/ADHD/comments/1m0cv26/)
- "Is there an app where people actually hold you accountable to be productive?" (r/productivity, Sep 2026, score 22, 23 comments). Answers: Focusmate and Beeminder ("puts real money on the line"). [Reddit 1wsmymp](https://www.reddit.com/r/productivity/comments/1wsmymp/)
- "A recipe App that gives you Just The Recipe" (r/SomebodyMakeThis, Sep 2026, score 13, 23 comments). [Reddit 1wsky2u](https://www.reddit.com/r/SomebodyMakeThis/comments/1wsky2u/)
- "An app that reminds you about subscriptions, renewals, and deadlines before you forget" (r/SomebodyMakeThis, Feb 2026, score 13). [Reddit 1r9u9ok](https://www.reddit.com/r/SomebodyMakeThis/comments/1r9u9ok/)
  - Related: "I wish there was a way to find all my forgotten subscriptions without giving Plaid my bank login" (Aug 2026). [Reddit 1vttf94](https://www.reddit.com/r/SomebodyMakeThis/comments/1vttf94/)
- "Somebody should make an app that automatically tracks groceries, expiry dates, and meal planning from receipts" (r/SomebodyMakeThis, Dec 2025, 11 comments). [Reddit 1ppxyvi](https://www.reddit.com/r/SomebodyMakeThis/comments/1ppxyvi/)
- "A service where you pay someone to waste a scammers' time for you" (r/SomebodyMakeThis, Jan 2026, score 22, 17 comments). [Reddit 1q4g9j6](https://www.reddit.com/r/SomebodyMakeThis/comments/1q4g9j6/)
- "Somebody make a way to leave digital notes tied to physical places" (r/SomebodyMakeThis, Dec 2025, score 22). [Reddit 1pnze9p](https://www.reddit.com/r/SomebodyMakeThis/comments/1pnze9p/)
- "A app I can't find": a shared diary, planner and to-do list that a partner signs into too (r/AppIdeas, May 2026, score 30, 42 comments). [Reddit 1tnua9j](https://www.reddit.com/r/AppIdeas/comments/1tnua9j/)

**India-specific**
- "Created an App QuickCompare to compare prices between Zepto, Swiggy, Blinkit" (r/india, Feb 17 2025, **score 3,565, 355 comments**). This is the highest-engagement app post in the India sample.
  - Comments ask for multiple saved addresses and sort-by-price.
  - Others ask how the builder got the data: "not publicised api but still a public api."
  - [Reddit 1irc155](https://www.reddit.com/r/india/comments/1irc155/)
  - Copycat builds followed: Jul 2025 (score 42) [Reddit 1m6g2iw](https://www.reddit.com/r/india/comments/1m6g2iw/), and Feb 2026 "compares 9 quick commerce and 5 cab platforms" [Reddit 1qxhxz2](https://www.reddit.com/r/india/comments/1qxhxz2/).
- "Is there any app that shows your net worth based on pan number?" (r/personalfinanceindia, Aug 2026, score 24, 50 comments). [Reddit 1vwyynl](https://www.reddit.com/r/personalfinanceindia/comments/1vwyynl/)
- "Is there any app where you can track bank account balance, FDs and stocks and doesn't share data?" (r/personalfinanceindia, Sep 2025, score 16, 22 comments). [Reddit 1nkug1y](https://www.reddit.com/r/personalfinanceindia/comments/1nkug1y/)
- "Is there any app for automatically suggesting which of your credit cards is best used for a payment?" (r/personalfinanceindia, Sep 2026, score 10). [Reddit 1wlke4e](https://www.reddit.com/r/personalfinanceindia/comments/1wlke4e/)
- Several r/india builders posted, in 2026, apps that auto-track UPI spending from SMS or screenshots and that scan Blinkit/BigBasket invoices to track pantry stock. This is a sign of builder saturation.
  - [Reddit 1tduk1p](https://www.reddit.com/r/india/comments/1tduk1p/), [Reddit 1veywgc](https://www.reddit.com/r/india/comments/1veywgc/)
  - PennyWise AI is an open-source on-device SMS parser: [Reddit 1mktmtm](https://www.reddit.com/r/india/comments/1mktmtm/)

**Hacker News (2025–2026)**
- "Ask HN: What do you wish existed? (October 2025)" (13 points, 19 comments). Requests included:
  - a cyclist-edited, wiki-style city bike map, because "CityMapper is pretty good but there's no way for me to correct a route because one stretch… is a death trap";
  - a browser extension that filters AI content on Reddit;
  - a chronological Facebook-groups feed;
  - "TurboTax-quality tax filing for American expats… I would pay $1-2k a year."
  - [HN 45500937](https://news.ycombinator.com/item?id=45500937)
- "Ask HN: What could I build to make your life a little easier?" (Jul 2025, 16 points, 23 comments). Requests: a debt-pile visualizer, "a to do list app that I like… compact like Workflowy… Cursor for To Do lists", and "an app to keep me off my damn phone… plenty already… not really working for me." [HN 44618822](https://news.ycombinator.com/item?id=44618822)
- "Ask HN: What non-existent app or tool would you pay for right now?" (Apr 2025):
  - A "Digital Life Concierge" that audits subscriptions, accounts and digital footprint: "If it existed, I'd pay for it today."
  - A blocker that is finer-grained than Apple Screen Time, which a commenter called "the 311-dad of this kind of thing."
  - [HN 43772295](https://news.ycombinator.com/item?id=43772295)
- "Show HN: DoNotNotify – Log and intelligently block notifications on Android" (Jan 2026, **347 points, 168 comments**).
  - Comments: apps "stuff marketing notifications into notification groups that are not marked for marketing"; "It would be neat to be able to do LLM filtered notifications… with a local LLM."
  - Existing paid tools named: BuzzKill and FilterBox.
  - On iOS: "Apple would never even consider allowing this."
  - [HN 46499646](https://news.ycombinator.com/item?id=46499646)
- The HN comment phrase searches ("wish there was an app", "is there an app that", "someone should make an app", "I would pay for an app") returned only 14 comments since 2025. HN is a weak source for consumer app requests. [HN Algolia](https://hn.algolia.com/api/v1/search?query=%22wish%20there%20was%20an%20app%22&tags=comment)

**Other viral signal**
- China's "Are You Dead?" (Sileme, international name Demumu) is a check-in app for people living alone.
  - It launched in May 2025 and went viral in January 2026.
  - It **topped Apple's paid-app chart in China for several days** and planned a subscription of about 8 yuan.
  - [Communicate Online](https://communicateonline.me/news/are-you-dead-chinese-app-for-solo-dwellers-goes-viral/), [NBC News](https://www.nbcnews.com/world/asia/viral-question-young-chinese-people-living-alone-are-dead-rcna253758?rand=1513)
  - NBC reports it later disappeared from the Chinese App Store. CNN-affiliate reports say it rebranded and added a fee. The accounts conflict. [KVIA/CNN](https://kvia.com/news/us-world/cnn-world/2026/01/14/viral-app-in-china-taps-into-national-loneliness-by-asking-are-you-dead/)

### Inferences
- Most requests are for **life-admin utilities with a privacy or simplicity twist**: "without giving Plaid my bank login", "doesn't share data", "isn't super complicated", "doesn't charge an arm and a leg". The complaint is less often "no app exists" and more often "existing apps are bloated, subscription-priced, or demand bank credentials."
- Requests that carry an emotional caregiving stake (elderly parents, living alone) get more engagement per post than generic productivity requests.

### Gaps
- Reddit upvote totals are understated because the archive snapshots scores early. True final scores could not be checked because reddit.com is blocked.
- r/smallbusiness, r/bangalore, r/Entrepreneur and r/ADHD "is there an app" searches failed, so small-business and Bangalore-specific requests are under-sampled.
- X/Twitter, Quora and Google Trends were not accessed. Search interest volumes are unknown.

---

## 2. Which requests recur most often? (independent mentions; scores where visible)

### Takeaway
Measured by title mentions across about 10.3k archived 2025–2026 posts, the most frequent requests are:
- subscription and free-trial tracking (87);
- app blockers and screen time (69);
- simple budgeting apps (65);
- UPI/SMS expense tracking (46);
- pantry and expiry (39);
- warranty and receipts (36);
- recipes (33).

Many of these mentions are **builders announcing their own version**, not users asking. The single highest-engagement request was Indian quick-commerce price comparison, and it has since been built several times.

### Cited Findings
Counts are titles matching a keyword pattern across the 10,274 archived posts. Subreddit breakdowns are in brackets. Data: [Arctic Shift API](https://arctic-shift.photon-reddit.com/api/posts/search?subreddit=SomebodyMakeThis&after=2025-01-01).

| Theme | Matching titles | Where | Example high-engagement post |
|---|---|---|---|
| Subscription / free-trial reminders | 87 | AppIdeas 58, SMT 15, r/personalfinance 11 | [1r9u9ok](https://www.reddit.com/r/SomebodyMakeThis/comments/1r9u9ok/) (score 13) |
| App blocker / screen time / doomscroll | 69 | AppIdeas 35, r/productivity 11, SMT 8, r/apps 8 | [1v6twqs](https://www.reddit.com/r/productivity/comments/1v6twqs/) "blocker that resets each hour" (score 14); [1wbzq0u](https://www.reddit.com/r/productivity/comments/1wbzq0u/) "screen time app that will let me exclude apps" (17 comments) |
| Budgeting app (simple / safe-to-spend / couples) | 65 | r/personalfinance 49 | [1qzd262](https://www.reddit.com/r/personalfinance/comments/1qzd262/) "budgeting app that isnt super complicated" (53 comments); [1wbjbgg](https://www.reddit.com/r/personalfinance/comments/1wbjbgg/) "use with my wife" (23 comments) |
| UPI/SMS expense tracking | 46 | AppIdeas 15, SMT 12, r/india 7 | mostly builder posts |
| Grocery expiry / pantry | 39 | AppIdeas 34 | [1ppxyvi](https://www.reddit.com/r/SomebodyMakeThis/comments/1ppxyvi/) |
| Warranty / receipts | 36 | AppIdeas 18, r/personalfinance 11 | [1s7lbe5](https://www.reddit.com/r/AppIdeas/comments/1s7lbe5/) (15 comments) |
| Recipe (just-the-recipe / video→recipe) | 33 | AppIdeas 24, SMT 7 | [1wsky2u](https://www.reddit.com/r/SomebodyMakeThis/comments/1wsky2u/) (23 comments) |
| Notification filtering | 26 | r/androidapps 8, AppIdeas 7 | plus HN DoNotNotify, 347 points |
| Accountability partner | 24 | AppIdeas 16, r/productivity 4 | [1wsmymp](https://www.reddit.com/r/productivity/comments/1wsmymp/) |
| Read-later / bookmark (post-Pocket) | 23 | AppIdeas 11, SMT 7, r/androidapps 4 | [1vtmodn](https://www.reddit.com/r/androidapps/comments/1vtmodn/) "alternative to Raindrop.io that works offline" (score 50, 21 comments) |
| Credit-card tracking / optimizer | 21 | r/personalfinance 12 | [1wlke4e](https://www.reddit.com/r/personalfinanceindia/comments/1wlke4e/) |
| Quick-commerce price comparison (India) | 20 | r/india 16 | [1irc155](https://www.reddit.com/r/india/comments/1irc155/) (**score 3,565, 355 comments**) |
| Medication tracking (people) | 15 | AppIdeas 10 | [1vcr5lb](https://www.reddit.com/r/androidapps/comments/1vcr5lb/) "medication tracking app… designed for elderly" |
| Time tracking / logging | 10 | r/productivity 6 | [1l9gcz9](https://www.reddit.com/r/productivity/comments/1l9gcz9/) |
| Net worth / portfolio tracker | 9 | SMT 5, r/personalfinance 3, r/personalfinanceindia 1 | [1vwyynl](https://www.reddit.com/r/personalfinanceindia/comments/1vwyynl/) (50 comments) |
| Elderly parents: tech, passwords, remote help | 8 | SMT 2, AppIdeas 4, r/iphone 1, r/androidapps 1 | [1vit5w3](https://www.reddit.com/r/SomebodyMakeThis/comments/1vit5w3/) (score 45); [1k5wkv6](https://www.reddit.com/r/iphone/comments/1k5wkv6/) "control my granddad's iPhone remotely on my android" |
| Renter evidence / small landlord | 8 | SMT 4, AppIdeas 4 | [1r59vfg](https://www.reddit.com/r/SomebodyMakeThis/comments/1r59vfg/) |
| Daily check-in / living alone | 7 | AppIdeas 4, SMT 2 | [1msmsho](https://www.reddit.com/r/SomebodyMakeThis/comments/1msmsho/); [1t8ahby](https://www.reddit.com/r/AppIdeas/comments/1t8ahby/) MVP feedback (30 comments) |
| Reusable checklists | 7 | AppIdeas 5, r/ADHD 2 | [1m0cv26](https://www.reddit.com/r/ADHD/comments/1m0cv26/) |
| Pet medication / care log | 4 | AppIdeas 4 (all builders) | [1rdvvp8](https://www.reddit.com/r/AppIdeas/comments/1rdvvp8/) |

- r/SomebodyMakeThis engagement is low overall. Of 3,024 posts since Jan 2025, the top non-showcase request scored 45 (elderly-parents passwords). Most requests score under 20 in the archive snapshot. [Arctic Shift data](https://arctic-shift.photon-reddit.com/api/posts/search?subreddit=SomebodyMakeThis&after=2025-01-01)
- Secondary, low-reliability claims come from a marketer's r/AppIdeas posts (Feb–Apr 2026, scores 30–166). None of these figures link to the threads behind them. Claimed recurring B2B-ish gaps:
  - freelancer late-invoice escalation ("one thread alone had 800+ upvotes");
  - maintenance tracking for small landlords with 1–5 units ("18 threads");
  - trades scheduling ("14 threads");
  - pet medication tracker ("22+ threads");
  - menu sync across delivery platforms;
  - kids' medication log across multiple caregivers;
  - co-parent sports-schedule logistics ("350+ upvotes").
  - [Reddit 1r73tui](https://www.reddit.com/r/AppIdeas/comments/1r73tui/), [Reddit 1rbpz8h](https://www.reddit.com/r/AppIdeas/comments/1rbpz8h/), [Reddit 1r8ckrc](https://www.reddit.com/r/AppIdeas/comments/1r8ckrc/), [Reddit 1rzrhjm](https://www.reddit.com/r/AppIdeas/comments/1rzrhjm/), [HN 47618992 (same author, SaasNiche)](https://news.ycombinator.com/item?id=47618992)
  - My own sample found only 4 pet-medication posts, all from builders. That contradicts the "22+ threads" claim, though my sample is not exhaustive.

### Inferences
- **High mention counts track saturation, not unmet demand.** The most-mentioned themes (subscriptions, blockers, budgets, pantry, recipes, receipts) are where vibe-coding builders cluster. Their App Store categories are full of 2025–2026 entrants with 0–10 ratings (see Q3).
- The strongest *request* signals, where users ask rather than builders announce, are:
  1. elderly-parent digital caregiving;
  2. simple, private personal finance;
  3. finer-grained blocking and notification control;
  4. India quick-commerce price comparison, which has since been built several times.

### Gaps
- The keyword counting is approximate. Patterns like "subscription" also match non-request posts, such as "No subscription, no ads".
- No Google Trends volumes were collected.
- Counts for r/smallbusiness and r/bangalore are missing because those API calls failed.

---

## 3. Candidate ideas: does an app already exist, and why do users still complain?

### Takeaway
Of 20 recurring candidates checked, **13 are "Exists / crowded"** and should be avoided. **4 are "Partial gap"**, meaning building blocks exist but not for the specific user or platform. **3 are "Gap / under-served"**:
- a privacy-first Indian net-worth tracker using CAS import;
- a caregiver-first "digital helper" for elderly parents;
- an India-localized daily check-in.

In 2025–2026, a viral or widely voiced request typically gets several indie clones within weeks. For example, "Are You Dead?" clones appeared in the US App Store within days of the January 2026 virality.

### Cited Findings

**Candidate table.** Ratings are from the iTunes Search API, pulled 2026-10-14. Store links use the app IDs returned.

| # | Candidate | Demand evidence | Existing solutions (ratings) | Why users still complain / gap | Verdict |
|---|---|---|---|---|---|
| 1 | **Caregiver-first digital helper for elderly parents.** The adult child administers passwords and accounts; the parent gets a big-button view, remote help and scam alerts. | SMT 1vit5w3 (score 45, 25 comments, Aug 2026); r/iphone 1k5wkv6 (control granddad's iPhone from Android); r/androidapps 1vcr5lb (elderly-friendly medication app); SMT 1o6ps02 "Elderly Check-In Software"; HN "Digital Life Concierge… I'd pay for it today" | 1Password ★4.7 (42,848) and Bitwarden family vaults. Commenters say these work with 10 minutes of setup. [1Password](https://apps.apple.com/us/app/id1511601750). Elder-law guidance names only generic tools: password managers, 2FA, account monitoring. [ElderLawAnswers](https://www.elderlawanswers.com/digital-tools-to-protect-older-adults-from-financial-abuse-21402). A caregiver-alert scam blocker exists only in China (Qihoo 360). [SCMP](https://amp.scmp.com/abacus/tech/article/3029449/parental-control-grandparents-china-struggles-protecting-elderly-online) | Tools assume the senior understands "vaults". Parents reset passwords without telling the child. "Paranoia/lack of trust" is a hurdle. Cross-platform remote help (Android child, iPhone parent) is awkward. In India, LocalCircles found 1 in 5 UPI users faced fraud in 3 years, as reported by a vendor blog. [getfinny](https://getfinny.app/blog/best-expense-tracker-apps-india-2026) | **Gap / under-served (UX layer).** Avoid storing passwords yourself; build on OS password sharing. |
| 2 | **Daily check-in / dead-man's switch for people living alone** | "Are You Dead?" #1 paid app in China, Jan 2026 ([Communicate Online](https://communicateonline.me/news/are-you-dead-chinese-app-for-solo-dwellers-goes-viral/)); SMT "I'm OK" (Aug 2025); AppIdeas MVP thread with 30 comments | Snug Safety ★4.9 (2,229) [App Store](https://apps.apple.com/us/app/id1122758716). Clones released Jan–Feb 2026, mostly 0–12 ratings: "Are You Dead Yet?", "Are you dead-sms&email alert" ★4.7 (12), "Still OK", "I'm Alive" ★4.7 (10), "AloneGuard", "Still Here", "YouGood?". Web services named in replies: AssureOkay, imokay.app, checkinbee, Dooinwell. [Reddit 1msmsho](https://www.reddit.com/r/SomebodyMakeThis/comments/1msmsho/) | Requesters want offline SMS fallback, Android support and no subscription. The India storefront search for "daily check in alone" returned no relevant app. | **Exists / crowded in US.** **Possible gap in India**: Hindi/regional UI, WhatsApp/SMS alerts, family-in-another-city use case. Unverified on Google Play. |
| 3 | **Privacy-first Indian net-worth tracker.** Import CAMS/KFintech CAS PDFs locally; add FDs and stocks; no Account Aggregator, no bank login. | r/personalfinanceindia 1vwyynl (score 24, 50 comments); 1nkug1y "doesn't share data" (score 16, 22 comments); SMT 1okss62 "minimalist net worth app… update once or twice a month" | FOLO ★4.5 (81 ratings, India), uses the Account Aggregator framework [App Store](https://apps.apple.com/in/app/id6739345850). INDmoney, Kuvera, ET Money ★4.3 (21,527) are account-based. folioman is self-hosted and covers mutual funds only. Arthavi (web, CAS) and Kanakkupaaru (manual) are small. Search summary: "Nothing I found covers all of FDs, stocks, and mutual funds fully offline with no account." [peerpush Arthavi](https://peerpush.com/p/arthavi), [Product Hunt Kanakkupaaru](https://www.producthunt.com/p/kanakkupaaru/kanakkupaaru-in) | Users distrust data-sharing apps. Existing private options are developer tools (casparser/folioman) or web-only. | **Gap (niche).** Strong solo-dev fit: open-source casparser exists, on-device storage, one-time price. |
| 4 | **Android notification filter with AI to separate promo from transactional pushes** | Show HN DoNotNotify 347 points / 168 comments (Jan 2026); 26 Reddit titles about notifications; HN commenter asks for "LLM filtered notifications" | BuzzKill (paid) and FilterBox (paid), per HN comments; Before Launcher; Samsung Good Lock. [HN 46499646](https://news.ycombinator.com/item?id=46499646). iOS cannot do this. | Apps hide marketing in transactional channels, e.g. "MyGate" in Indian gated societies. Rule-based tools need manual setup. | **Partial gap.** Exists for power users; an on-device AI auto-classifier is the differentiator. Android only. |
| 5 | **Renter-side move-in/move-out evidence vault** (US) | SMT 1r59vfg (score 15, Feb 2026); 8 renter/landlord titles | RentProof (Product Hunt, renter-side, no account) [Product Hunt](https://www.producthunt.com/p/rentproof-rental-inspection-reports/rentproof). Landlord tools: Oxmaint, Imfuna, Switchlabs. [Oxmaint](https://oxmaint.com/industries/property-management/move-in-move-out-inspections-protect-property-deposit) | Workarounds such as Google Photos or emailing yourself are "good enough" for many. A commenter notes listing sites (apartments.com) have a distribution advantage. | **Partial gap.** New, small entrants; modest demand. |
| 6 | **Cross-platform shared pet-medication log** | Aggregator claims 22+ threads (unverified); my sample found 4 builder posts; "Why does every [pet] tracker lock basic features behind a paywall?" [Reddit 1ud9xcc](https://www.reddit.com/r/AppIdeas/comments/1ud9xcc/) | PetPill: family sharing via iCloud, Pro paywall. PetMed, TailCare, PetDesk (vet-linked). [PetPill](https://apps.apple.com/za/app/id6760020801), [PetDesk](https://petdesk.com/blog/using-petdesk-to-remember-pet-medications) | Sharing is iOS-only or paywalled. No confirmed Android plus iOS shared household log. | **Partial gap** (cross-platform). Small market. |
| 7 | **Reusable checklists (ADHD routines and packing)** | r/ADHD 1m0cv26 (29 comments); "Check Check vanished from Play" | Checklist – Simple Task Lists ★4.7 (2,928) [App Store](https://apps.apple.com/us/app/id521946672). Six or more new 2025–26 "reusable checklist" apps with 0–8 ratings. Google Keep workaround. | Android/e/OS and web availability; simplicity | **Exists / crowded** |
| 8 | **Quick-commerce price comparison (Blinkit / Zepto / Instamart)** | r/india 1irc155 (score 3,565, 355 comments) | QuickCompare, Smartprix's free comparison tool, Comparify, others. [Smartprix](https://www.smartprix.com/bytes/smartprixs-new-tool-finally-lets-you-price-compare-blinkit-zepto-and-instamart-before-you-order/), [Comparify](https://comparify.pro/grocery-price-comparison) | Prices vary by device, city and time of day [MediaNama](https://www.medianama.com/2025/01/223-medianama-analysis-differential-pricing-instamart-blinkit-zepto/). Relies on unofficial APIs, a ToS and breakage risk. | **Exists** (and legally fragile) |
| 9 | **Splitwise alternative (India)** | Vendor blogs about Splitwise free-tier limits [tricount blog](https://tricount.com/en-us/blog/top-splitwise-alternatives-in-india-2025-which-app-should-you-switch-to), [thehisaab](https://thehisaab.com/blog/best-expense-splitting-apps-india-2025); r/india builder post 1tzbbyl | Splitwise ★4.4 IN (13,296) / ★4.0 US (28,760); Splitkaro ★4.7 IN (3,645); tricount ★4.9 US (7,383); Splid ★4.9; Settle Up ★4.8 [Splitkaro](https://apps.apple.com/us/app/id1573115695) | UPI settle-in-app is gated or missing in some (vendor claims) | **Exists / crowded** |
| 10 | **Subscription / free-trial tracker without a bank login** | 87 titles; SMT 1vttf94 "without giving Plaid my bank login" | Bobby ★4.6 (344 IN); Orbit ★4.8 (72); Subo; many 2026 entrants with 0 ratings. Rocket Money (US). | Auto-detection without a bank link is hard. Manual entry is a chore. | **Exists / crowded** |
| 11 | **Simple / safe-to-spend / couples budgeting** | 49 r/personalfinance requests; 1qzd262 (53 comments); 1vnxvt6 (24 comments); 1wbjbgg (23 comments) | YNAB and Monarch are praised in threads ("Happily pay the yearly fee"). Many others exist. [Reddit 1vgroyx](https://www.reddit.com/r/personalfinance/comments/1vgroyx/) | Complexity, price, and "won't match my spreadsheet" | **Exists / crowded** (US). Not recommended. |
| 12 | **App blocker / screen-time with finer rules** | 69 titles; hourly-reset and exclude-apps requests; HN "Screen Time is the 311-dad" | Opal ★4.7 (89,756), ScreenZen ★4.9 (51,614, free), Brick ★4.9 (57,184), Refocus ★4.8 (11,607), ClearSpace ★4.7 (8,906) [Opal](https://apps.apple.com/us/app/id1497465230) | Price ("doesn't charge an arm and a leg"), bypassability | **Exists / crowded** |
| 13 | **Human accountability partner** | r/productivity 1wsmymp (score 22, 23 comments); 24 titles | Focusmate, Beeminder (named in replies); HabitShare ★4.6; several 2026 clones | — | **Exists** |
| 14 | **"Just the recipe" / video-to-recipe** | SMT 1wsky2u (23 comments); 33 titles | Samsung Food ★4.8 (6,403); Plated, Preplo, Hemogry, Clip To Cook, Mealish (2025–26, 0–3 ratings) | — | **Exists / crowded** |
| 15 | **Pantry / expiry tracking from grocery receipts** (incl. Blinkit/BigBasket invoices) | 39 titles, mostly builders; SMT 1ppxyvi | Several indie builds in r/india (2026) | No clear market leader was identified (not verified) | **Crowded with indie builds** |
| 16 | **Warranty / receipt vault** | 36 titles | Keep Receipt ★4.7 (1,459); PaperTrail, Slipvault, "Warranty: Receipt Keeper" (2026, 0–1 ratings) [Keep Receipt](https://apps.apple.com/us/app/id1458904227) | — | **Exists / crowded** |
| 17 | **Shared couple diary / planner** | AppIdeas 1tnua9j (score 30, 42 comments) | TimeTree ★4.9 (92,595); Howbout ★4.8 (50,906); Cozi ★4.8 (400,958); Cupla ★4.7 (2,304) [TimeTree](https://apps.apple.com/us/app/id952578473) | — | **Exists** |
| 18 | **Read-later after Pocket's shutdown** (Jul 8 2025) | r/androidapps "Raindrop alternative offline" (score 50); 23 titles. Pocket shut down Jul 8 2025; export allowed until Oct 8 2025. [Engadget](https://engadget.com/apps/mozilla-is-shutting-down-its-read-it-later-app-pocket-183247576.html?src=rss) | Instapaper ★4.6 (3,545), Matter ★4.6 (1,241), Readwise Reader ★4.6, Flyleaf ★4.9 (91), Karakeep (self-hosted) | — | **Exists** |
| 19 | **Snapchat Memories exporter** (after Snap's 5 GB cap, Sept 2025) | Snap capped free Memories at 5 GB, with paid tiers from $1.99/month [TechCrunch](https://techcrunch.com/2025/09/29/snapchat-caps-free-memory-storage-launches-paid-storage-plans) | Memport ★4.0 (28), SC Memories Importer ★4.2 (37), MemSafe ★4.2 (20) (late 2025) | Exports' date/metadata handling is unclear | **Exists** (filled within weeks) |
| 20 | **WhatsApp group-chat summarizer** (school and society groups) | Parents describe school WhatsApp groups as "hell" [Gothamist](https://gothamist.com/arts-entertainment/nyc-parents-on-school-whatsapp-group-chats-oh-my-god-its-hell) | WhatsApp's own Message Summaries (Meta AI, Private Processing) launched June 2025, US English only, off by default [Outlook Business](https://www.outlookbusiness.com/technology/whatsapps-new-feature-gives-ai-powered-summaries-for-unread-messages) | Not yet confirmed outside the US or English. Third-party access to WhatsApp messages is restricted. | **Platform-owned; high platform risk.** Not recommended. |

**Other recurring requests checked (all exist)**
- Debt payoff visualizer (HN Jul 2025): Debt Payoff Planner ★4.7 (7,359), Ditch ★4.8 (3,574), Gauss ★4.9 (4,330).
- Visual timer / time blindness: Visual Countdown Timer ★4.6 (41,092), Time Timer ★4.6 (14,587). Tiimo was Apple's 2025 iPhone App of the Year; it is free with a $10/month premium. [Yahoo Tech](https://tech.yahoo.com/ai/apple-intelligence/articles/apples-iphone-app-ai-tool-123900823.html)
- Body doubling: dubbii ★4.8 (747), plus five or more 2026 clones.
- Personal CRM: Contacts Journal CRM ★4.7 (2,454), Cloze ★4.7 (2,834), Dex ★4.4.
- Home inventory: Sortly ★4.7 (9,526), Home Contents ★4.7 (1,459).
- Group trip planner: Wanderlog ★4.9 (35,880), TripIt ★4.8 (311,930).
- Chore charts: FamilyWall ★4.8 (24,209), Chorsee ★4.6 (11,879).
- Safe bike routing: Ride with GPS ★4.7 (39,795), Cyclers ★4.8. None of these is a wiki-style "danger segment" map (HN request).
- Learning Kannada (Bangalore migrants): Learn Kannada SmartApp (paid), Lentil, Indilingo, and a state app announced. [Preply](https://preply.com/en/blog/apps-to-learn-kannada/), [Citizen Matters](https://citizenmatters.in/kannada-classes-whatsapp-online-bangalore/)
- Credit-card picker, India: SaveSage ★4.2 (8,616 IN), CRED ★4.8 (611,559 IN).
- Medication reminders for parents (India): many new 2026 entrants with 0–7 ratings, e.g. Vouch AI, Nagly, Joovik.
- Document-expiry reminders (India store): "Document Expiry" ★4.7 (19) and several 0-rating apps. Weak incumbents, but I found no direct 2025–26 Reddit demand evidence.

**Excluded per constraints**
- US-expat tax filing. It has strong willingness to pay ($1–2k/yr, [HN 45500937](https://news.ycombinator.com/item?id=45500937)) but is regulated and complex.
- Robot weed killer, laundry robot and other hardware.
- Reddit ban-evasion tools (unethical).

### Inferences
- **Best remaining fits for a solo, AI-assisted, low-budget developer (my ranking):**
  1. Privacy-first Indian net-worth tracker via CAS import (candidate 3). Clear complaint ("doesn't share data"), technically doable with open-source casparser, and incumbents are account-based.
  2. Caregiver-first digital helper for elderly parents (candidate 1). Highest-scoring pure request on r/SomebodyMakeThis in 2026, and the emotional stake suggests willingness to pay. Scope it away from storing passwords to avoid security liability.
  3. India-localized daily check-in (candidate 2). Proven demand via China's paid-chart #1, but the US is saturated.
  4. Android AI notification filter (candidate 4). Proven HN interest; Android only.
- Everything in the "Exists / crowded" rows should be treated as **"exists"**. Complaints there are about price, complexity or privacy, which a solo developer can differentiate on only with strong distribution.
- The flood of 0–10-rating clones in 2025–2026 (check-in, reusable checklists, subscriptions, recipes, warranty, body doubling) suggests that **simple ideas no longer stay unbuilt**. Any candidate should be judged on distribution and trust as much as on whether it already exists.

### Gaps
- Google Play was not searched, so Android-specific existence (e.g. check-in apps in India, cross-platform pet meds) is unverified.
- Play Store and App Store review text (complaint themes) was not pulled; gap reasons come from Reddit/HN comments and vendor pages.
- Product Hunt was checked only via search results (RentProof, Kanakkupaaru).
- Splitwise's exact current free-tier limits were not verified from a primary source; only vendor blogs.
- California AB 2801 (landlord photo requirement), mentioned by vendors, was not verified.

---

## 4. Which candidates show willingness to pay?

### Takeaway
Direct willingness-to-pay evidence is thin in consumer threads. The clearest signals:
- "Are You Dead?" topping China's paid chart and planning a ~8-yuan subscription;
- users who "happily pay" for Monarch or YNAB (budgeting is served);
- Beeminder users paying penalties (served);
- an HN user's "I'd pay for it today" for a digital-life concierge;
- an HN user's $1–2k/yr for expat tax filing (excluded).

India-focused candidates have weaker willingness-to-pay evidence.

### Cited Findings
- "Are You Dead?" reached #1 on Apple's **paid** chart in China in early January 2026. The developers planned a subscription of about 8 yuan (~$1) to cover SMS and server costs. [Communicate Online](https://communicateonline.me/news/are-you-dead-chinese-app-for-solo-dwellers-goes-viral/), [NBC News](https://www.nbcnews.com/world/asia/viral-question-young-chinese-people-living-alone-are-dead-rcna253758?rand=1513)
- On budgeting, r/personalfinance users report paying for Monarch and YNAB: "Happily pay the yearly fee, totally worth it." [Reddit 1vgroyx](https://www.reddit.com/r/personalfinance/comments/1vgroyx/)
- On accountability: "Beeminder works for me because it puts real money on the line." [Reddit 1wsmymp](https://www.reddit.com/r/productivity/comments/1wsmymp/)
- On a digital-life audit (subscriptions, accounts, footprint): "If it existed, I'd pay for it today." [HN 43772295](https://news.ycombinator.com/item?id=43772295)
- On US-expat tax filing (excluded): "I would pay $1-2k a year." [HN 45500937](https://news.ycombinator.com/item?id=45500937)
- On Android notification filtering: an HN user "ended up paying money to buy FilterBox." [HN 46499646](https://news.ycombinator.com/item?id=46499646)
- On pet medication, PetPill charges for family sharing through a Pro tier, so the incumbent monetizes the sharing feature. [PetPill](https://apps.apple.com/za/app/id6760020801)
- On Kannada learning, the WhatsApp course "Kannada Gottilla" had 2,800 students paying Rs 200/month. **This article is several years old, not 2025–26.** [Citizen Matters](https://citizenmatters.in/kannada-classes-whatsapp-online-bangalore/)
- On Snapchat Memories, Snap charges $1.99/month for 100 GB, which shows people pay to preserve memories. Indie exporters monetize around that. [TechCrunch](https://techcrunch.com/2025/09/29/snapchat-caps-free-memory-storage-launches-paid-storage-plans)
- The r/AppIdeas marketer posts assert willingness to pay ("people saying they'd pay right now"), for example small landlords at "$15/mo". The claims carry no links and are unverified. [Reddit 1rbpz8h](https://www.reddit.com/r/AppIdeas/comments/1rbpz8h/)
- On the Indian quick-commerce comparator, a commenter asked "How do you plan to monetize it?" No willingness-to-pay was expressed; users expect it free. [Reddit 1irc155](https://www.reddit.com/r/india/comments/1irc155/)

### Inferences
- The candidates with the most credible willingness to pay are those tied to **safety, family care or money**: elderly-parent helper, daily check-in, private net-worth tracking. Free-expectation categories (price comparison, recipes, checklists) are weak for paid apps.
- For India, a freemium or one-time-purchase model is likely more viable than a subscription. This is inference only; no India-specific willingness-to-pay data was found for the top candidates.

### Gaps
- No pricing surveys, revenue data or conversion data were found for any candidate.
- Willingness-to-pay for the elderly-parent helper and the Indian net-worth tracker is inferred from engagement and comment tone, not from explicit "I'd pay X" statements.
