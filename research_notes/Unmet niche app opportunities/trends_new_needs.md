# 2025–2026 Trends Creating New Consumer/Prosumer Needs That No Good App Serves Yet

Research date: 14 Oct 2026. Method: web search across news, government/NGO data, App Store listings, Product Hunt and vendor pages (about 43 searches and fetches). Limits: Reddit threads and Google Trends could not be read directly, and the AARP and learnmuscles pages failed to load (DNS errors). Store checks used App Store listing pages and roundups returned by search, not live store queries with download counts. Older data is flagged inline.

Verdict key used below: **GAP** = need is clear and existing apps are generic, service-heavy or absent. **PARTIAL GAP** = a few small or new apps exist, but none fully serves the need. **SATURATED** = many focused apps already exist, so avoid.

## Q1. Which trends have strong, growing demand (quantified) and only weak or generic apps today?

### Takeaway
The clearest gaps are in **coordination and record-keeping chores** that new trends or rules created, where today's tools are generic (Splitwise, spreadsheets), service-heavy (Indian eldercare firms) or just advice articles (family safe words):
1. Sibling eldercare cost-and-effort ledger (US and NRI India)
2. Family "is it really you?" protocol against voice-clone scams
3. GLP-1 grocery and meal planning plus the off-ramp/maintenance phase (the core shot tracker is saturated)
4. India multi-app delivery-rider net-earnings tracker
5. India UPI AutoPay mandate visibility

Digital-nomad day counters, AI quota trackers and core GLP-1 dose trackers looked like gaps but are now **saturated**.

### Cited Findings

#### Opportunity 1 — Sibling eldercare "fairness ledger": shared hours, expenses and reimbursements (verdict: GAP)
- **Trend and scale:** 63 million US family caregivers, about 1 in 4 adults, up 20 million since 2015 (AARP/NAC Caregiving in the US 2025, released July 2025). 59 million care for adults. — [AARP press release](https://www.aarp.org/press/releases/2025-07-24-new-report-reveals-crisis-point-for-americas-63-million-family-caregivers.html); [AARP survey page](https://www.aarp.org/caregiving/basics/caregiving-in-us-survey-2025.html)
- Average caregiver age is 51. 29% are "sandwich generation" (47% of those under 50). Nearly 1 in 4 give 40+ hours of care a week. The survey covered 6,858 caregivers via an Ipsos probability panel. — [AARP press release](https://www.aarp.org/press/releases/2025-07-24-new-report-reveals-crisis-point-for-americas-63-million-family-caregivers.html); [ZenCaregiving summary](https://zencaregiving.org/caregiving-statistics-us-2025/)
- **Unmet need and evidence:**
  - In a survey of 3,300+ family caregivers, 43% said they get no help from siblings (survey date not given in source). — [Caring Village](https://caringvillage.com/blog/family-caregiving/what-to-do-when-caregiving-responsibilities-arent-shared/)
  - A forum post asks whether it is "unreasonable" to make the nearby sibling keep a spreadsheet of parent-related expenses. Another poster describes relatives demanding detailed care records the main caregiver has no time to keep. — [Caregivers.com forum](https://portal.prod.caregivers.com/questions/how-do-you-handle-financial-accountability-in-terms-of-what-caregiver-a-sibling-is-spending-on-paren-481660.htm)
  - AARP and Next Avenue publish guides on splitting caregiving costs among siblings and note that "fair" depends on each family member's view, so families must agree on a split rule (equal, income-based or by distance). — [AARP tips](https://www.aarp.org/caregiving/financial-legal/how-to-split-caregiving-costs-with-family/); [Next Avenue](https://www.nextavenue.org/dividing-caregiving-costs-without-splitting-family/)
- **What exists and its gaps:**
  - Caring Village does calendar, medications and care team; free tier, paid from $14.99/mo (vendor-run roundup). — [Caring Village roundup](https://caringvillage.com/blog/caregiver-tech/caregiver-apps-for-families/)
  - Lotsa Helping Hands is still live and focused on volunteer task sign-ups, with "narrower care-management scope". — [Caring Village CaringBridge alternatives](https://caringvillage.com/blog/caregiver-tech/caringbridge-alternatives/)
  - Caregiver Planner puts its "Care Circle" sharing in the Pro tier. — [Caregiver Planner](https://www.coddykit.com/apps/caregiver-planner)
  - Kinly ("shows who does what, ending sibling conflict with data") and Family Tend (sibling task delegation) are on Product Hunt with roughly zero traction. — [Kinly](https://www.hunted.space/product/kinly-2); [Family Tend](https://webmail.hunted.space/product/family-tend)
  - SupportPay is built for child-support splitting and lists eldercare as a secondary use. Splitwise is generic. A search found **no dedicated app handling eldercare reimbursement workflows (receipts, approvals, documentation) end to end**. Generic split apps don't separate recurring medical, one-time equipment, or reimbursable vs non-reimbursable costs (that last point comes from a vendor page with its own commercial interest). — [SupportPay](https://apps.apple.com/us/app/id808332758); [Gerald guide](https://joingerald.com/learn/life--lifestyle/affordable-expense-sharing-apps-family-caregivers)
- **India variant (NRI or out-of-town children):**
  - Existing players are service marketplaces: Anvayaa (founded 2016, AI/IoT, SOS wearable, about $157k seed), Samarth (two apps plus care managers), 60Plus India (claims 40 million Indian seniors live away from their children; vendor claim), Khyaal and Care4Parents. They sell services, not lightweight sibling coordination. — [Dealroom Anvayaa](https://app.dealroom.co/companies/anvayaa_kin_care_pvt_); [Samarth](https://care.samarth.community/?p=110076); [CB Insights 60Plus](https://www.cbinsights.com/company/60plus-india)
- **Solo-dev build (5–6 weeks):**
  - Shared family ledger: log an expense with a receipt photo and tag it reimbursable or not; log hours or visits.
  - Agreed split rule (equal, income-weighted or custom) and a running "who owes whom / who did what" balance.
  - Monthly PDF statement for family transparency.
  - Optional parent-document vault and task menu that siblings pick from.
  - Stack: Flutter or React Native plus Supabase or Firebase, invite links. Avoid health data beyond notes; this is a finance and coordination tool. INR/USD multi-currency for NRI families is a differentiator.

#### Opportunity 2 — Family "verify it's really you" protocol against AI voice-clone scams (verdict: GAP)
- **Trend and scale:**
  - FTC imposter-scam losses were reportedly $3.5B in 2025 across 1M+ reports (secondary source; verify against FTC Consumer Sentinel).
  - The FBI IC3 2025 report tracked AI-related fraud for the first time. Figures conflict: one source says 22,364 complaints and $893M, another says about 3,100 complaints naming AI and $352M.
  - Family-member voice-clone distress scams account for more than $5M in confirmed losses.
  - Cloning reportedly needs as little as 3 seconds of audio.
  - — [Scam Atlas](https://guptadeepak.com/scam-atlas/scam/grandparent-voice-clone/); [PlainAI](https://plainai.aguidetocloud.com/changes/voice-clone-scams-billions/); [WFTV](https://www.wftv.com/news/local/ai-voice-cloning-scams-cost-victims-millions/CTEEU6WL6RE6BMRI4ARHOXZKBU/). **Loss statistics are conflicting and partly from low-quality aggregators.**
- **Unmet need and evidence:** Security vendors (ESET) and parent guides recommend a family safe word plus calling back on the saved number. The advice is everywhere, but it is a low-tech habit. A search found **no dedicated safe-word or verification app**; results were guides and paid PDF products. — [ESET](https://www.eset.com/gr-en/about/newsroom/press-releases-1/safe-word-what-is-it-and-why-do-you-need-one/); [WeLiveSecurity](https://www.welivesecurity.com/en/cybersecurity/safe-word-what-why-need-one/); [Screenwise parent guide](https://screenwiseapp.com/guides/ai-and-deepfakes-what-parents-need-to-know); [Hotmart "AI Safety Shield" product](https://hotmart.com/en/marketplace/products/the-ai-safety-shield/R105756836W)
- **What exists and its gaps:** Only guides and courses. No app gives a family a shared "verify" flow.
- **Solo-dev build (4–5 weeks):**
  - Family circle with large-type, elder-friendly UI.
  - One-tap "Is this really you?" push sent to the claimed relative's own device, with "Yes, it's me / No, it's not me" answer.
  - Rotating challenge questions stored end-to-end encrypted or on device.
  - "Scam drill" mode that rehearses a fake emergency call script with grandparents, plus a callback checklist.
  - Must **not** claim to detect deepfakes; it verifies identity out of band.
  - Monetize with a family plan, or B2B2C through banks and credit unions (inference).

#### Opportunity 3 — GLP-1: "small appetite" grocery and meal planner, and the off-ramp/maintenance phase (verdict: PARTIAL GAP; the core injection tracker is SATURATED)
- **Trend and scale:**
  - KFF poll (Nov 2025): 12% of US adults are currently taking a GLP-1, roughly double the 6% in May 2024. 18% have ever taken one.
  - Current use is 15% among women vs 9% among men, and 22% among ages 50–64.
  - The release headline notes half say the drugs are difficult to afford.
  - No 2026 KFF update found.
  - — [KFF Nov 2025](https://www.kff.org/public-opinion/poll-1-in-8-adults-say-they-are-currently-taking-a-glp-1-drug-for-weight-loss-diabetes-or-another-condition-even-as-half-say-the-drugs-are-difficult-to-afford/); [KFF May 2024](https://www.kff.org/health-costs/poll-finding/kff-health-tracking-poll-may-2024-the-publics-use-and-views-of-glp-1-drugs/)
- **Food behavior shift:** In the Cornell/Numerator "No-Hunger Games" study (released Dec 2024, older data), households with a GLP-1 user cut grocery spending about 5.5% within 6 months, roughly $416/yr. Higher-income households cut 8.6%. Savory snacks fell 11%. Fast-food and coffee-shop spend dropped. Nutrient-dense items rose modestly. — [Food Dive](https://www.fooddive.com/news/glp-1-drug-use-cuts-grocery-spending-by-6-study-finds/736313/); [eMarketer](https://www.emarketer.com/content/us-households-with-glp-1-users-cut-their-grocery-spending)
- **Discontinuation creates an off-ramp need:**
  - JAMA Netw Open (2025, Truveta, n=125,474): one-year discontinuation was 64.8% for people without T2D vs 46.5% with T2D. Another summary of the same study gives 53.6% at 1 year and 72.2% at 2 years.
  - A Cambridge meta-analysis (2026) modelled 60% of lost weight regained at 52 weeks after stopping.
  - Cleveland Clinic real-world data (2026) conflicts: 45% kept the weight off at 1 year, and many patients restart.
  - — [HealthDay](https://www.healthday.com/healthpro-news/weight-loss/many-with-overweight-obesity-discontinue-glp-1-receptor-agonists-within-one-year); [Healio](https://www.healio.com/news/endocrinology/20250131/most-adults-with-overweight-or-obesity-discontinue-glp1-therapy-within-2-years); [doctors.net.uk](https://www.doctors.net.uk/news/patients-regain-60-of-weight-lost-on-glp-1-drugs-within-a-year-of-stopping); [Cleveland Clinic](https://newsroom.clevelandclinic.org/2026/03/12/what-happens-when-patients-stop-taking-glp-1-drugs-new-cleveland-clinic-study-reveals-real-world-insights)
- **What exists (crowded for dose and side-effect logging):**
  - Shotsy: free plus in-app purchases; logs shots or pills, side effects, protein and water, imports from Apple Health; about 28K ratings per a third-party listing.
  - MeAgain: injection-site rotation and side effects; "#1" claim is from its own press release.
  - Pep: free, 4.7 stars from 665 ratings.
  - Glapp: free features and an estimated medication-level graph.
  - Lilly Health: free manufacturer app with a logbook.
  - MyNetDiary GLP-1 Companion: launched 5 May 2026 in Premium; covers injections, protein, fiber, symptoms and GLP-1 meal plans.
  - Others: GLPify, GLPer.
  - — [Shotsy listing](https://apps.apple.com/bb/app/id6499510249); [AppFollow Shotsy](https://apps.appfollow.io/ios/glp1-tracker-shotsy/6499510249?country=gb); [MeAgain PR](https://markets.financialcontent.com/borgernewsherald/article/abnewswire-2025-12-8-meagain-ranked-the-1-glp-1-tracking-app-for-2026); [Pep comparison](https://apppricinglab.com/compare/apple/595012291/6504788281); [Glapp Trustpilot](https://www.trustpilot.com/review/glapp.io?page=2); [Lilly Health / r/Mounjaro context](https://thehiveindex.com/communities/r-mounjaro/); [MyNetDiary PR](https://digital-release.kxan.com/business/press-releases/cision/20260505FL48085/mynetdiary-launches-glp-1-companion-for-ozempic-wegovy-and-mounjaro-users)
- **Gap evidence:**
  - People are buying **printables and paywalled plans** on Etsy, Payhip, Substack and a dietitian resource shop: GLP-1 grocery lists, 25–40 g protein meals, a 4-week planner for women 45+. This suggests demand for planning content that the trackers don't deliver well. — [Substack](https://wellnesswithedie.substack.com/p/glp-1-grocery-list-meal-plan); [Etsy](https://www.etsy.com/listing/4466964372); [Payhip](https://payhip.com/b/3W5zf); [Well Resourced](https://wellresourced.com/downloads/glp-1-grocery-list-bundle/)
  - A roundup notes apps are either good at meals or at injection reminders, but rarely both. — [learnmuscles via search snippet](https://learnmuscles.com/?p=169359) (page fetch failed)
- **Solo-dev build (6–8 weeks):** A non-medical "small-appetite kitchen":
  - Protein-forward mini-portion recipes, auto-generated grocery lists, and a "what I actually ate / threw away" log to cut food waste.
  - A separate "off-ramp" mode with habit and weight-trend tracking for people stopping or between doses.
  - **Never** suggest doses, tapers or medical decisions (a Mumsnet user warns against using apps for dosing decisions). — [Mumsnet](https://www.mumsnet.com/talk/weight-loss-injections/5546744-comparing-glp-1-tracking-apps-and-companion-tools-for-weight-loss-treatment)

#### Opportunity 4 — India delivery/gig rider multi-app net-earnings and welfare tracker, vernacular-first (verdict: GAP, but low willingness to pay)
- **Trend and scale:**
  - NITI Aayog estimates about 1.27 crore (12.7M) gig workers in 2024-25.
  - Only 8.58 lakh were registered on e-Shram as of 29 Jan 2026.
  - The Code on Social Security 2020 is now in force for gig workers, with an aggregator levy of 1–2% of turnover.
  - A May 2026 rules notification reportedly makes Aadhaar seeding mandatory.
  - 12 platforms (Zomato, Swiggy, Uber, Zepto and others) had been onboarded to the e-Shram aggregator module by January 2026.
  - — [SuperKalam / The Hindu, 2 Sep 2026](https://superkalam.com/current-affairs/02-09-2026/majority-of-india-s-gig-workers-remain-out-of-govt-s-reach-pg9-82445054-7e1d-4709-97f8-0579fb712b59); [Bhatt & Joshi](https://bhattandjoshiassociates.com/indias-gig-economy-workers-under-social-security-code-2020-legal-rights-implementation-and-2026-rules-update/); [PIB doc Aug 2026](https://static.pib.gov.in/WriteReadData/specificdocs/documents/2026/aug/doc_9692_20260825_14270901.pdf)
- **Unmet need and evidence:**
  - A journalist working across Zomato, Blinkit and Swiggy in Delhi logged 23 deliveries in 15.5 hours over 105 km and earned ₹782 gross, but only **₹532 after fuel** (one anecdote).
  - Blinkit cut its minimum per-delivery payout from ₹25 to ₹15 in 2023 (older data).
  - Tips add only about ₹800–1,000 a month (industry estimate).
  - — [Ascendants report](https://ascendants.in/spotlight/gig-economy-delhi-zomato-swiggy-blinkit-report/); [WageIndicator](https://wageindicator.org/ai/what-we-do/news-stories/gig-blog/2023/wageindicator-david-against-goliath-can-the-regional-indian-platforms-break-the-monopolies-of-bigger-giants/); [Storyboard18](https://www.storyboard18.com/how-it-works/only-3-5-of-indian-delivery-orders-receive-tips-report-87226.htm)
- **What exists:** A search found **no multi-platform earnings tracker for Indian riders**. Platforms don't expose per-order cost data. — [same search results; Ascendants](https://ascendants.in/spotlight/gig-economy-delhi-zomato-swiggy-blinkit-report/)
- **Solo-dev build (5–7 weeks):**
  - Hindi plus 2–3 regional languages, Android-first, low-end device and offline friendly.
  - Log earnings by platform (manual entry or screenshot OCR); log fuel, EMI and phone recharge.
  - Show net ₹/hour and ₹/km per platform and time slot.
  - e-Shram/UAN registration checklist and scheme-eligibility reminders.
  - Monetization is weak. Options: free with ads, or B2B2C via unions, NGOs or fuel and insurance partners (inference).

#### Opportunity 5 — India UPI AutoPay mandate and subscription visibility (verdict: PARTIAL GAP with platform risk)
- **Trend and scale:** UPI hit a record 24.51 billion transactions (₹29.82 lakh crore) in Aug 2026. PhonePe had about 45% share (Dec 2025). — [StartupTalky](https://startuptalky.com/india-upi-transactions-august-2026-record-volume/); [Entrackr](https://entrackr.com/news/upi-sets-new-monthly-record-with-217-bn-transactions-in-january-11063663)
- **Unmet need and evidence:**
  - In Feb 2026 the RBI asked NPCI to review a spike in UPI AutoPay complaints: unauthorised recurring deductions (starting late 2025), "limited visibility of active mandates", and difficulty cancelling.
  - Users wrongly believe deleting an app stops the mandates, but mandates sit at the bank level across apps.
  - Outlook Money covered auto-debit issues involving Kuku FM and Stage.
  - — [C4S Courses](https://c4scourses.in/banking-finance/rbi-asks-npci-to-review-upi-autopay-over-debit-concerns/); [Angel One](https://oga-prod.angelone.in/news/market-updates/rbi-asks-npci-to-review-rise-in-upi-autopay-debit-complaints-report); [Outlook Money](https://www.outlookmoney.com/amp/story/banking/upi-auto-debit-scam-kuku-fm-stage-paytm-google-pay-phonepe-how-cancel-auto-debit)
- **What exists and its gaps:**
  - Each UPI app shows only its own mandates (e.g., Google Pay's Autopay "Live" tab). — [Google Pay help](https://support.google.com/pay/india/answer/10840624?hl=en-GB)
  - NPCI reportedly plans cross-app mandate management (single source, no date). That is a platform risk for any app. — [Credyfi](https://www.credyfi.com/news/rbi-urges-npci-to-tackle-upi-autopay-issues)
- **Solo-dev build (5–6 weeks):**
  - Android app that reads bank and UPI alert SMS or emails (with consent) to detect mandates and recurring debits, then shows one list of all subscriptions with the next debit date.
  - "Cancel how-to" deep links per app and bank.
  - Free-trial-ends reminders.

#### Opportunity 6 — US "No Tax on Tips" (and overtime) qualified-income logbook (verdict: PARTIAL GAP)
- **Trend and scale:**
  - OBBBA created a deduction of up to $25,000 of qualified tips for tax years 2025–2028.
  - Workers must separate qualified voluntary tips from service charges. About 68 eligible occupations. Income phaseout reportedly starts around $150,000.
  - From 2026, qualified tips and occupation codes must appear in W-2 fields. Form 4137 applies to unreported tips.
  - — [ADP](https://www.adp.com/spark/articles/2026/06/no-tax-on-tips-employer-payroll-guide.aspx); [Taxfyle](https://www.taxfyle.com/blog/tip-income-deduction-2026-no-tax-on-tips-service-workers); [MoneyLion](https://www.moneylion.com/learn/taxes/basics/no-tax-on-tips) (secondary sources; no IRS primary source retrieved)
- About 4 million workers held tipped occupations in 2023 (2.5% of employment). The typical tipped worker is 31. 37% had too little income to owe income tax in 2022, so they benefit little (older data). — [Yale Budget Lab](https://budgetlab.yale.edu/news/240624/no-tax-tips-act-background-tipped-workers)
- **What exists:** Qualified Tips (free iPhone app, offline) tracks cash, card, tip-pool and tip-out tips per job for the deduction. — [App Store](https://apps.apple.com/app/id6778865958)
- **Gaps:** Only one focused iOS app was found. Android, multi-job shift logs, CPA export and the overtime deduction were not seen. Overtime was not researched further.
- **Solo-dev build (3–4 weeks):** Shift logger with tip-type tagging, monthly employer-report reminder (by the 10th) and year-end PDF for a tax preparer. Must show estimates only, not tax advice.

#### Opportunity 7 — India tenant/landlord "Rent Rules 2025" compliance and deposit vault (verdict: PARTIAL GAP; landlord side mostly served)
- **Trend:** Centre's Home Rent Rules 2025 (Nov 2025), modelled on the Model Tenancy Act:
  - Agreements digitally stamped and registered online within 60 days.
  - Penalties reportedly from ₹5,000.
  - Residential deposit capped at 2 months' rent.
  - **Force depends on state adoption.** One reference sheet disputes viral claims that Karnataka capped deposits.
  - — [Business Today](https://www.businesstoday.in/amp/personal-finance/real-estate/story/good-news-for-urban-renters-centres-home-rent-rules-2025-set-to-bring-major-relief-heres-how-504258-2025-11-29); [LegalKart](https://www.legalkart.com/legal-blog/new-rent-rules-2025-explained-online-registration-%26-deposit-limits-made-simple); [RentOk reference sheet](https://wb.rentok.com/wp-content/uploads/2026/07/Security-Deposit-Rules-India-Reference-Sheet.pdf)
- **What exists (landlord side):**
  - Crib: WhatsApp/SMS reminders, UPI QR with auto reconciliation, e-KYC, digital agreements, multi-unit view.
  - RentOk: PG and flat manager.
  - StayPe (ex-QuickStay): free-forever PG manager.
  - — [Crib](https://apps.apple.com/us/app/-/id1642548368); [RentOk](https://apps.apple.com/us/app/-/id6553993616); [StayPe](https://apps.apple.com/app/id6599858756)
- **Gap (inference):** No tenant-side tool was found that tracks agreement registration deadlines, deposit-cap eligibility by state, move-in/move-out condition photos and deposit-refund disputes. Not specifically searched; verify in the stores.

#### Opportunity 8 — Teen AI companion use: parent-teen "AI agreement" and check-in tool (verdict: WEAK/HARD)
- **Trend and scale:** Common Sense Media (Apr–May 2025, n=1,060 US teens):
  - 72% have used AI companions; 52% are regular users.
  - 24% have shared personal info.
  - One-third felt uncomfortable with something a companion said or did.
  - 31% find these chats as satisfying as or more satisfying than talking to people.
  - — [MediaPost](https://www.mediapost.com/publications/article/407598/controversial-ai-companions-already-popular-among.html); [KMPH/Sinclair](https://kmph.com/news/nation-world/teens-replacing-human-connection-with-machines-most-use-ai-social-companions-youth-mental-health-technology-parents-families-common-sense-media)
- **What exists:** Parent guides (e.g., Screenwise). — [Screenwise](https://screenwiseapp.com/guides/ai-and-deepfakes-what-parents-need-to-know)
- **Why it is hard:** Without device-level monitoring a solo app can't see usage. The realistic product is a family agreement plus conversation-prompt app, and willingness to pay is unproven.

#### Opportunity 9 — California DROP data-broker deletion follow-through (verdict: WEAK/NARROW)
- **Trend:** California's free DROP platform:
  - 300,000+ sign-ups by 2 June 2026; 580+ registered brokers.
  - Brokers must process deletion requests from 1 Aug 2026.
  - DROP has no monitoring that data stays deleted, and publicly available data is exempt (per DeleteMe, a competitor).
  - — [CalPrivacy](https://privacy.ca.gov/2026/06/privacy-momentum-builds-300000-californians-sign-up-for-drop-as-registered-data-brokers-hit-a-record-high/); [Manatt](https://www.manatt.com/insights/newsletters/client-alert/california-s-first-of-its-kind-data-deletion-platform-goes-live-what-businesses-should-know); [DeleteMe](https://joindeleteme.com/?p=26315)
- **Assessment:** Need is real but limited to California. Paid removal services already compete.

#### Opportunity 10 — Creator brand-deal pipeline, invoicing and payment chasing (verdict: PARTIAL GAP, crowded with indie tools)
- **Evidence:**
  - A 2017 Internet Creators Guild survey (**old data**) found 29% of creators had trouble getting paid after delivering.
  - A 2025-26 tool builder's interviews found creators track deals in 40-column Google Sheets, abandoned Notion databases or memory.
  - An agency says the most common cause of deals paid 60+ days late is that the creator never sent the invoice.
  - — [Tubefilter (2017)](https://tubefilter.com/2017/06/01/creators-should-be-charging-more-for-brand-deals-icg-says/); [PitchToPaid](https://www.producthunt.com/p/pitchtopaid/pitchtopaid); [Creators Agency](https://creatorsagency.co/blog/how-to-track-youtube-brand-deals)
- **What exists:** PitchToPaid, Brandea, UGC Deal Tracker and Creator Deal Tracker (small and new). — [Brandea](https://www.producthunt.com/products/brandea); [UGC Deal Tracker](https://mwm.ai/apps/ugc-deal-tracker/6758113158); [Creator Deal Tracker](https://hunted.space/product/creator-deal-tracker)

#### SATURATED trends (look like gaps but are not)
- **Digital-nomad / Schengen EES / tax-residency day counting:**
  - Demand: 18.5M US digital nomads in 2025 (MBO). The EU EES has been operational since 12 Oct 2025 and fully live at all Schengen borders by 10 Apr 2026. ETIAS is due late 2026. The 90/180 rule is now "machine-enforced". — [MBO via Stealth Agents](https://stealthagents.com/research/remote-work-digital-nomad-statistics-2026); [IndraStra](https://www.indrastra.com/2026/04/sitrep-eu-new-digital-entryexit-system.html); [Nomada](https://nomada.tools/blog/ees-etias-schengen-nomads-2026)
  - Supply: Tax Residency Tracker, Pebbles (4.7★), TAX Resident, NomadTax, Borderlog, Visa Day Tracker, Days of Stay ($3.99), plus web calculators and the official EU calculator. — [Pebbles](https://apps.apple.com/us/app/id6472096747); [Borderlog](https://apps.apple.com/app/id6758915339); [Tax Residency Tracker](https://apps.apple.com/app/id6753808152); [NomadTax](https://apps.apple.com/bf/app/id6760604230); [Days of Stay](https://apppricinglab.com/app/apple/6753990603)
- **AI usage, quota and subscription trackers:** 30+ third-party tools, including TokenBar ($4.99 one-time Mac), aiquota, tokenkarma, AIUsage.NET, a Chrome extension and an iPad app. — [Implicator](https://www.implicator.ai/30-tools-your-ai-subscription-has-a-meter-you-just-cant-see-it.md); [Indie Hackers TokenBar](https://www.indiehackers.com/post/i-built-a-menu-bar-app-to-track-ai-usage-limits-heres-why-2546c799a8); [aiquota](https://pypi.org/project/aiquota/)
- **GLP-1 dose and side-effect trackers:** See Opportunity 3.
- **Indian PG/landlord rent collection:** See Opportunity 7.
- **ADHD planners:**
  - Demand: CDC estimates 15.5M US adults (6.0%) had a current ADHD diagnosis in 2023 (data published Oct 2024), about half diagnosed as adults. 71.5% of stimulant users had trouble getting prescriptions filled. — [CDC MMWR](https://www.cdc.gov/mmwr/volumes/73/wr/mm7340a1.htm)
  - Supply: Tiimo won Apple's iPhone App of the Year 2025, so the planner niche is served by a well-funded leader. — [Business Wire / Apple](https://www.businesswire.com/news/home/20251204519906/en/Apple-unveils-the-winners-of-the-2025-App-Store-Awards); [Tiimo](https://www.tiimoapp.com/resource-hub/tiimo-winner-2025-app-store-awards)
- **US student loans after SAVE:**
  - Need: SAVE ended. 90-day notices started 1 Jul 2026, with forbearance likely ending 30 Sep 2026. The default is the Tiered Standard plan (most expensive). RAP is the only income-driven plan for new loans, with 30 years to forgiveness. — [WCTV](https://www.wctv.tv/2026/06/26/save-repayment-plan-ending-july-1-leaves-millions-scrambling-pick-new-option/); [NerdWallet](https://www.nerdwallet.com/student-loans/learn/save-lawsuits); [College Investor](https://thecollegeinvestor.com/77630/save-plan-forbearance-ending-what-to-know/)
  - Supply and timing: The official StudentAid.gov Loan Simulator covers plan comparison, and the urgent window has largely passed. Treat as **timing-risky, not a gap**. — [MOHELA FAQ](https://mohela.studentaid.gov/DL/resourceCenter/SAVEPlanFaq.aspx)

#### Pets (context only)
- APPA: 95M US households own a pet. Spending was $158B in 2025 (+3.7%), projected $165B in 2026. Dog households are 53% (71M), cat households 39% (53M), with growth driven by Gen Z and "cat dads". Vet care is the biggest dog expense. — [APPA](https://americanpetproducts.org/news/u.s.-pet-industry-reaches-158-billion-in-2025-poised-for-continued-growth-in-2026); [Petfood Industry](https://www.petfoodindustry.com/pet-food-market/market-trends-and-reports/news/15834866/report-cat-ownership-grows-to-53-million-us-households)
- No app gap was identified (see Gaps).

### Inferences
- **Pattern:** The strongest openings are **multi-person coordination** (siblings, families, households) and **record-keeping for new rules** (tips deduction, rent registration, UPI mandates). Funded apps target the individual user and the "hero" feature (shot logging, planners, quota meters). Shared, trust-sensitive ledgers between relatives are left to Splitwise and spreadsheets.
- **GLP-1:** The trend is huge and growing; current users doubled to 12% of US adults in about 18 months. But the obvious app (dose/side-effect log) is saturated, and manufacturers (Lilly Health) and incumbents (MyNetDiary, Noom-style) are moving in. The defensible niche is a non-medical food and lifestyle layer: shopping and cooking for a smaller appetite, and life after stopping, given that half to two-thirds stop within a year.
- **India:** The opportunities are real but tilt to **low willingness to pay** (riders) or **platform risk** (NPCI may ship cross-app mandate management). The NRI eldercare ledger is the India idea with the best willingness to pay, since NRI income is in foreign currency.
- **Regulation-driven chores:** These are good but time-boxed. No-tax-on-tips runs 2025–2028. Rent Rules depend on state adoption. Schengen EES was quickly saturated, which shows how fast indie developers fill rule-driven niches. A new entrant needs to ship within weeks of a rule change.
- **Voice-clone verification** is the most "new" need. Behaviour (safe words) is being widely taught but has no software support. The risk is that it becomes a feature of carriers or OS makers.

### Gaps
- Could not read Reddit threads directly (r/AgingParents, r/CaregiverSupport, r/Zepbound, r/Mounjaro, r/IndiaInvestments, r/digitalnomad). Forum evidence above comes from caregivers.com, Mumsnet and indirect summaries. r/Mounjaro (about 193k members) bans app promotion. — [Hive Index](https://thehiveindex.com/communities/r-mounjaro/)
- Google Trends data was not accessible, so search-growth figures are missing for all candidates.
- AARP's long-distance caregiver count and the financial-strain stats could not be retrieved (page fetch failed).
- No 2026 KFF GLP-1 poll found. Oral GLP-1 launches in 2026 were not verified in this research.
- Number of SAVE borrowers affected not retrieved.
- Pet app landscape not researched. No shared pet-care app gap verified.
- India competitive-exam students, RWA/society management (MyGate, NoBrokerHood, ADDA are known incumbents from general knowledge, not verified here), ONDC and language learners were not researched for lack of budget. Treat them as unassessed, not as non-gaps.
- US gig-driver earnings trackers (e.g., Gridwise) were not verified in this research, so it is unknown whether any has expanded to India.
- Google Play rules on SMS-read permission for finance apps (relevant to Opportunity 5) were not checked. This needs verification before building.

## Q2. Where is willingness to pay evident?

### Takeaway
Willingness to pay is clearest where users already pay for adjacent products:
- GLP-1 users buy paid planners and printables and accept in-app purchases.
- Caregiving apps charge about $15/mo, and sharing sits behind a Pro tier.
- Nomads pay for day trackers.
- AI power users pay for meter tools on top of about $66/mo of AI subscriptions.

It is weakest among Indian gig workers and US tipped workers. Teen-AI parenting and privacy tools face free official or bundled alternatives.

### Cited Findings
- **GLP-1:**
  - Half of users say the drugs are hard to afford, yet they keep paying for treatment. — [KFF](https://www.kff.org/public-opinion/poll-1-in-8-adults-say-they-are-currently-taking-a-glp-1-drug-for-weight-loss-diabetes-or-another-condition-even-as-half-say-the-drugs-are-difficult-to-afford/)
  - Shotsy monetizes via in-app purchases with about 28K ratings. — [AppFollow](https://apps.appfollow.io/ios/glp1-tracker-shotsy/6499510249?country=gb)
  - MyNetDiary bundles its GLP-1 Companion into Premium. — [MyNetDiary PR](https://digital-release.kxan.com/business/press-releases/cision/20260505FL48085/mynetdiary-launches-glp-1-companion-for-ozempic-wegovy-and-mounjaro-users)
  - Paid GLP-1 grocery and meal printables on Etsy, Payhip and Substack. — [Etsy](https://www.etsy.com/listing/4466964372); [Substack](https://wellnesswithedie.substack.com/p/glp-1-grocery-list-meal-plan)
  - Glapp reviewers praise it for offering free what rivals charge for, which shows price sensitivity. — [Trustpilot](https://www.trustpilot.com/review/glapp.io?page=2)
- **Caregiving:**
  - Caring Village paid tier from $14.99/mo. — [Caring Village](https://caringvillage.com/blog/caregiver-tech/caringbridge-alternatives/)
  - Caregiver Planner puts multi-person sharing in Pro. — [Caregiver Planner](https://www.coddykit.com/apps/caregiver-planner)
  - Splitwise Pro is about $3/mo. — [Gerald guide](https://joingerald.com/learn/life--lifestyle/affordable-expense-sharing-apps-family-caregivers)
- **AI prosumers:**
  - US paid personal chatbot subscriptions rose from 2.1% to 4.5% (Aug 2026, Bloomberg via Crypto Briefing).
  - Bank of America: about 3% of households pay, median $20. PNC: AI subscription outlays up 150%.
  - A Bango survey (vendor, AI users only) says the average user pays for 4 tools at about $66/mo.
  - — [Crypto Briefing/Bloomberg](https://cryptobriefing.com/ai-subscription-models-consumer-pay-challenge/); [BofA Institute](https://institute.bankofamerica.com/content/dam/economic-insights/consumer-ai-usage.pdf); [PNC Feb 2026](https://www.pnc.com/content/dam/pnc-com/pdf/aboutpnc/EconomicReports/EconomicUpdates/2026/PNC_Research_Consumer_Health_Check_February_2026.pdf)
  - TokenBar sells at $4.99 one-time. — [Indie Hackers](https://www.indiehackers.com/post/i-built-a-menu-bar-app-to-track-ai-usage-limits-heres-why-2546c799a8)
- **Nomads:** Days of Stay is a $3.99 paid app; several others are freemium with in-app purchases. — [Days of Stay](https://apppricinglab.com/app/apple/6753990603); [Tax Residency Tracker](https://apps.apple.com/app/id6753808152)
- **ADHD:** Tiimo is a subscription app and won iPhone App of the Year 2025. — [Business Wire](https://www.businesswire.com/news/home/20251204519906/en/Apple-unveils-the-winners-of-the-2025-App-Store-Awards)
- **Low willingness to pay:**
  - Indian riders net about ₹34/hr gross before fuel in one anecdote. — [Ascendants](https://ascendants.in/spotlight/gig-economy-delhi-zomato-swiggy-blinkit-report/)
  - 37% of US tipped workers owe no income tax. — [Yale Budget Lab](https://budgetlab.yale.edu/news/240624/no-tax-tips-act-background-tipped-workers)
  - StayPe offers a free-forever plan to Indian PG owners. — [StayPe](https://apps.apple.com/app/id6599858756)
- **Privacy:** California's DROP is free and official, which limits willingness to pay for CA deletion apps. — [CalPrivacy](https://privacy.ca.gov/2026/06/privacy-momentum-builds-300000-californians-sign-up-for-drop-as-registered-data-brokers-hit-a-record-high/)
- **Pets:** Spending rose to $158B in 2025, but APPA says owners are becoming "more intentional" and value-oriented. — [APPA](https://americanpetproducts.org/news/u.s.-pet-industry-reaches-158-billion-in-2025-poised-for-continued-growth-in-2026)

### Inferences
- **Best ratio of willingness to pay to competition:**
  1. Sibling/NRI eldercare ledger: adjacent tools charge about $15/mo, and a family can split the cost.
  2. GLP-1 meal and off-ramp planner: users already buy $5–$30 printables.
  3. Family verification app: likely $2–$5/mo family plan, or bank-sponsored.
- **Low willingness to pay:** Indian rider and UPI mandate tools would need ads, partnerships or freemium lead-gen. Rupee subscription willingness to pay is not evidenced in this research.
- **Tipped workers:** A one-time low price ($2.99–$4.99) or free-with-tax-partner-referral is more realistic than a subscription.

### Gaps
- No direct survey of willingness to pay for any specific candidate app was found.
- No conversion or revenue data (e.g., Sensor Tower or Appfigures) for Shotsy, Caring Village or Pebbles was retrieved.
- No Indian consumer subscription willingness-to-pay data was retrieved.

## Q3. Which could be a small, focused mobile app built in 4–8 weeks?

### Takeaway
Most of the gap candidates can be built in 4–8 weeks by a solo developer using a cross-platform stack (Flutter or React Native) plus a hosted backend (Supabase or Firebase). The fastest are the tips logbook (3–4 weeks) and the family verification app (4–5 weeks). The GLP-1 meal/off-ramp app is the longest (6–8 weeks), because it needs recipe and nutrition content.

### Cited Findings
- Existing indie examples show this scope is solo-feasible:
  - Qualified Tips is a single-purpose offline tip tracker. — [App Store](https://apps.apple.com/app/id6778865958)
  - Pebbles, Borderlog and NomadTax are single-purpose day counters using manual entry or local/iCloud storage. — [Pebbles](https://apps.apple.com/us/app/id6472096747); [Borderlog PH](https://www.producthunt.com/products/borderlog-visa-tax-tracker)
  - TokenBar is an indie one-time-purchase meter app. — [Indie Hackers](https://www.indiehackers.com/post/i-built-a-menu-bar-app-to-track-ai-usage-limits-heres-why-2546c799a8)
  - Kinly and Family Tend are solo or small-team sibling-care launches on Product Hunt. — [Kinly](https://www.hunted.space/product/kinly-2)

**Effort and verdict per candidate:**

| # | App | Core MVP | Est. build | Main risk | Verdict |
|---|---|---|---|---|---|
| 1 | Sibling/NRI eldercare ledger | Shared expenses with receipts, reimbursable tag, hours log, split rules, monthly PDF, invites | 5–6 wks | Getting siblings to join; trust and privacy | **Top pick** |
| 2 | Family "really you?" verifier | Family circle, push verify, challenge questions, scam drills, elder UI | 4–5 wks | Habit; possible OS or carrier feature | **Top pick** |
| 3 | GLP-1 small-appetite kitchen and off-ramp | Mini-portion high-protein recipes, grocery list, food-waste log, maintenance habits; no dosing | 6–8 wks | Incumbents (MyNetDiary, Shotsy) adding meal plans; must avoid medical claims | **Strong** |
| 4 | India rider net-earnings tracker | Vernacular earnings and fuel log, ₹/hr per platform, e-Shram checklist | 5–7 wks | Low willingness to pay; manual-entry friction | Good for impact or partnerships |
| 5 | UPI AutoPay mandate radar | SMS/email parsing of mandates, upcoming-debit list, cancel guides | 5–6 wks | NPCI cross-app feature; Play SMS policy | Conditional |
| 6 | Tips (and overtime) deduction logbook | Shift log with tip types, reports, CPA export | 3–4 wks | Small, low-income market; one competitor; sunset 2028 | Quick win |
| 7 | India tenant rent-rules and deposit vault | Agreement and registration deadline, deposit-cap check by state, move-in photos | 4 wks | Rules vary by state; landlord apps may add tenant features | Moderate |
| 8 | Creator deal pipeline and invoice chaser | Deal stages, invoice generation, auto-chase reminders | 4 wks | Many indie competitors | Moderate |
| — | Nomad day counter, AI quota meter, GLP-1 dose tracker, ADHD planner | — | — | Saturated | **Avoid** |

### Inferences
- **Fastest to validate:**
  - Family verification app: tiny scope, no external data, clear story for press and parent communities.
  - Tips logbook: rule-driven, with search intent likely around tax season (Jan–Apr 2027 filing for tax year 2026).
- **Shared ledgers (eldercare, landlord/tenant)** benefit from a web share link, so non-installing siblings or tenants can view without the app. This lowers adoption friction.
- **Compliance boundary:** For GLP-1, tax and student-loan ideas, keep strictly to logging, organizing and reminders, and link to official tools (IRS, StudentAid.gov, the EU calculator). This avoids regulated-advice territory, which fits the brief's exclusion of medical and regulated advice.

### Gaps
- Build-time estimates are the researcher's judgement from comparable indie apps, not sourced benchmarks.
- No check was done on App Store or Play review rules for GLP-1 or health-adjacent claims, or on Play SMS-permission policy for finance apps.
- Store searches were done via web search of App Store listings, not exhaustive in-store queries. Android equivalents, especially for the sibling ledger and the family verifier, should be checked on Google Play before committing.
