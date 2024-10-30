//
//  NewsData.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 3/10/2024.
//

enum NewsData {
    static let sampleBreakingNewsList: [News] = [
        News(
            title: "Tragic Blaze Engulfs Thai School Bus Leaving Dozens Feared Dead",
            score: 8,
            sentiment: .negative,
            slug: "tragic_blaze_engulfs_thai_school_bus_leaving_dozens_feared_dead",
            summary: "A school bus carrying 44 students and teachers on a field trip near Bangkok caught fire, with up to 25 feared dead.",
            content: """
            A tragic incident occurred in Thailand on Tuesday when a school bus carrying 44 students and teachers caught fire on the outskirts of Bangkok, leaving up to 25 people feared dead. The bus was transporting students from Uthai Thani province on a field trip when a tire burst, causing the vehicle to crash into a barrier. According to transport minister Suriya Jungrungreangkit, three teachers and 16 students managed to escape, but 25 individuals remain unaccounted for following the blaze.\n\nThe bus, which was running on compressed gas, ignited after the crash, resulting in flames engulfing the vehicle and thick black smoke billowing into the sky. Video footage captured the severity of the situation, showing the bus burning under an overpass. Emergency services were delayed in conducting a thorough search for any trapped individuals due to the intense heat from the fire.\n\nPrime Minister Paetongtarn Shinawatra expressed her condolences to the victims' families and confirmed that there had been fatalities. “I have learned of the fire on a bus carrying students from Uthai Thani... resulting in deaths and injuries,” she said in a message on X, formerly known as Twitter. “As a mother, I would like to express my deepest condolences to the families of the injured and deceased.”\n\nWhile the fire has been extinguished, rescue workers are waiting for the bus to cool down before proceeding with their search. Thailand has a notorious reputation for poor road safety, with high annual fatality rates attributed to unsafe vehicles and driving practices.
            """,
            keywords: [
                "Bangkok": "The capital and most populous city of Thailand, where the devastating bus fire occurred.",
                "School Trip": "An organized outing where students and teachers travel together for educational purposes.",
                "Thai Bus Fire": "A catastrophic event where a bus carrying students and teachers caught fire in Thailand, causing numerous fatalities."
            ],
            points: [
                "1": "A bus carrying 44 students and teachers on a field trip caught fire.",
                "2": "The incident occurred outside of Thailand's capital, Bangkok.",
                "3": "Up to 25 people are feared dead due to the fire.",
                "4": "The bus was on a school excursion at the time of the incident."
            ],
            quotes: [
                Quote(name: "Unnamed Thai Official", quote: "A devastating fire tore through a Thai bus carrying 44 students and teachers on a school trip, with up to 25 feared dead.")
            ],
            timeline: [
                TimelineEvent(
                    event: "A school bus carrying 44 students and teachers caught fire outside Bangkok.",
                    datetime: convertToLocalDate(from: "2023-10-17T12:00:00Z")
                )
            ],
            location: Location(city: "Bangkok", country: "Thailand", latitude: 13.7563, longitude: 100.5018),
            categories: [
                Category(name: "Crisis", slug: "crisis"),
                Category(name: "Education", slug: "education")
            ],
            urls: [
                "https://www.perthnow.com.au/news/disaster-and-emergency/school-bus-catches-fire-in-thailand-25-feared-dead-c-16245020"
            ],
            images: [
                "https://live-production.wcms.abc-cdn.net.au/a64b356becd9c2d9e4a03e1fb3c87d8d?impolicy=wcms_crop_resize&cropH=2813&cropW=5000&xPos=0&yPos=521&width=862&height=485",
                "https://images.thewest.com.au/publication/C-16244709/37f426b5ea966a970a4c526cefead3f09e0b073b-16x9-x0y415w7963h4479.jpg?imwidth=1200",
                "https://images.perthnow.com.au/publication/C-16245020/b931fda361f11b76ca6b199bc569ba58677c9d97-16x9-x0y0w1280h720.jpg?imwidth=1200"
            ],
            published_at: "2024-10-01T08:08:38Z",
            is_breaking_news: true
        ),
        News(
            title: "Hurricane Havoc: Helene Claims Over 60 Lives and Causes Billions in Damage",
            score: 8,
            sentiment: .negative,
            slug: "hurricane_havoc_helene_claims_over_60_lives_and_causes_billions_in_damage",
            summary: "Hurricane Helene has devastated southeastern US states, resulting in over 60 fatalities and causing billions of dollars in damages.",
            content: """
            Severe Flooding and Landslides Isolate Western North Carolina, Prompting Air Rescues and Community Solidarity...
            """,
            keywords: [
                "Hurricane Helene": "A powerful storm that has heavily impacted the southeastern United States.",
                "southeastern US states": "Regions in the southeastern part of the United States affected by Hurricane Helene."
            ],
            points: [
                "1": "Hurricane Helene has killed over 60 people.",
                "2": "The hurricane caused billions of dollars in damages."
            ],
            quotes: [
                Quote(
                    name: "US emergency services official",
                    quote: "The devastation caused by Hurricane Helene is unprecedented."
                )
            ],
            timeline: [
                TimelineEvent(
                    event: "Hurricane Helene makes landfall in the southeastern US.",
                    datetime: convertToLocalDate(from: "2023-10-01T00:00:00Z")
                )
            ],
            location: Location(city: "Raleigh", country: "USA", latitude: 35.7796, longitude: -78.6382),
            categories: [
                Category(name: "Crisis", slug: "crisis"),
                Category(name: "Environment", slug: "environment")
            ],
            urls: [
                "https://www.smh.com.au/world/north-america/dozens-dead-millions-without-power-after-helene-hits-southeastern-us-20240929-p5kedv.html"
            ],
            images: [
                "https://static.ffx.io/images/$zoom_0.3027%2C$multiply_0.7554%2C$ratio_1.777778%2C$width_1059%2C$x_0%2C$y_0/t_crop_custom/q_86%2Cf_auto/1884f0c3f4be71a1489fa023db3f037c6a07c186"
            ],
            published_at: "2024-09-29T05:23:14Z",
            is_breaking_news: true
        )
    ]

    static let sampleNewsList: [News] = [
        News(
            title: "Jahrome Hughes Edges Tedesco to Clinch Dramatic Dally M Medal Win",
            score: 6,
            sentiment: .positive,
            slug: "jahrome_hughes_edges_tedesco_to_clinch_dramatic_dally_m_medal_win",
            summary: "Melbourne halfback Jahrome Hughes has claimed the NRL's prestigious Dally M Medal, narrowly beating James Tedesco by one point just days before the NRL grand final.",
            content: """
            **Jahrome Hughes Claims Maiden Dally M Medal Ahead of NRL Grand Final**\n\nIn a remarkable turn of events at the Dally M Awards held in Sydney, Jahrome Hughes has clinched his first Dally M Medal, edging out James Tedesco by a narrow margin of just one point, finishing with 62 points to Tedesco's 61. The Melbourne Storm halfback's exemplary season is further highlighted as he prepares to lead his team into the NRL grand final.\n\nHughes, who was widely favored for the top honor, solidified his standing with a stellar six-point performance in the final round against the Brisbane Broncos. Tedesco also secured six points in his last game but fell just short in the overall count. This victory marks the first time a New Zealand player has won the Dally M Medal in over three decades, with Hughes following in the footsteps of Shaun Johnson, who narrowly missed out to Kalyn Ponga in previous years.\n\nThe 29-year-old Hughes has not only excelled in scoring but also in playmaking, recording career-highs in both try assists (26) and kick meters (351 per game). His contribution was pivotal in steering the Storm to the minor premiership, especially in light of injuries to stars Cameron Munster and Ryan Papenhuyzen. Hughes previously featured in the Storm's premiership team, participating in their successful campaign in 2020 against Penrith.\n\nIn addition to the Dally M Medal, Hughes was named Halfback of the Year, while his coach, Craig Bellamy, secured the Coach of the Year title, beating out fellow finalist Ivan Cleary. “He’s been a pleasure to watch all year, he’s been on fire,” said Cleary. “He’s definitely the best running halfback I’ve just about ever seen.”\n\nThe night also celebrated achievements in women's rugby league, with Roosters second-rower Olivia Kernick being crowned the Dally M Female Player of the Year, finishing with 22 points, just ahead of Parramatta's Abbi Church and Gold Coast's Lauren Brown, both of whom amassed 20 points.\n\nThe awards captured an overall glittering night for the Storm, with notable mentions including Xavier Coates winning the Peter Friilingos Headline Moment of the Year for his dramatic win against New Zealand earlier in the season. \n\nOther award winners from the night included Dolphins winger Jack Bostock as the NRL Rookie of the Year and the Bulldogs’ Stephen Crichton, recognized as the NRL Captain of the Year for leading his team into the finals. In the NRLW, Cronulla's Tiana Pentani also received accolades, named Captain of the Year, while Scott Prince earned Coach of the Year honors after guiding the Broncos to a minor premiership. \n\nWith the stage set for the grand final against Penrith, Hughes's Dally M win has set a high note as he aims to cap off a brilliant season with premiership glory.
            """,
            keywords: [
                "Dally M Medal": "The Dally M Medal is awarded annually to the player judged to be the best and fairest over the NRL season.",
                "James Tedesco": "James Tedesco is a professional rugby league footballer who plays as fullback for the Sydney Roosters in the NRL.",
                "Jahrome Hughes": "Jahrome Hughes is a professional rugby league footballer who plays as a halfback for the Melbourne Storm in the NRL.",
                "NRL grand final": "The NRL grand final is the championship-deciding game of the National Rugby League season."
            ],
            points: [
                "1": "Jahrome Hughes has won the NRL's prestigious Dally M Medal.",
                "2": "Hughes edged out James Tedesco by one point to claim the award.",
                "3": "The victory comes just days before Hughes is set to appear in the NRL grand final.",
                "4": "This is Jahrome Hughes' first Dally M Medal win."
            ],
            quotes: [
                Quote(name: "Jahrome Hughes", quote: "Winning the Dally M Medal is an incredible honor and a highlight of my career.")
            ],
            timeline: [
                TimelineEvent(event: "Jahrome Hughes wins the Dally M Medal, edging out James Tedesco by one point.", datetime: convertToLocalDate(from: "2023-09-25T00:00:00Z")),
                TimelineEvent(event: "Jahrome Hughes is set to play in the NRL grand final.", datetime: convertToLocalDate(from: "2023-10-01T00:00:00Z"))
            ],
            location: Location(city: "Melbourne", country: "Australia", latitude: -37.8136, longitude: 144.9631),
            categories: [Category(name: "Sports", slug: "sports")],
            urls: [
                "https://www.perthnow.com.au/sport/rugby-league/jahrome-hughes-wins-maiden-dally-m-medal-c-16258784",
                "https://www.smh.com.au/sport/nrl/jahrome-hughes-wins-the-dally-m-medal-20241002-p5kfen.html",
                "https://thewest.com.au/sport/rugby-league/nrl-dally-m-medal-jahrome-hughes-wins-nrl-dally-m-as-craig-bellamy-named-coach-of-year-c-16258528"
            ],
            images: [
                "https://images.thewest.com.au/publication/C-16258528/d867aca1145dde69beca3af64292cb0c0817824b-16x9-x603y643w1892h1064.jpg?imwidth=1200",
                "https://images.perthnow.com.au/publication/C-16258784/06afd192adbae268656abc1e4db00c70e4fb94de-16x9-x0y0w1280h720.jpg?imwidth=1200"
            ],
            published_at: "2024-10-02T11:40:24Z",
            is_breaking_news: false
        ),
        News(
            title: "Iconic Aussie Brand Announces Major Multinational Merger",
            score: 4,
            sentiment: .neutral,
            slug: "iconic_aussie_brand_announces_major_multinational_merger",
            summary: "An iconic Australian brand has announced a significant merger with two other companies as part of its strategic expansion plans.",
            content: """
            **SPC Merges with The Original Juice Company and Nature One Dairy to Expand Product Offerings**

            In a significant move for the Australian food industry, SPC, one of the nation’s most iconic food brands, has announced its merger with The Original Juice Company and Singaporean dairy business Nature One Dairy. This merger aims to broaden the juice company’s product range and promote healthier food and drink options for consumers...
            """,
            keywords: [
                "merger": "A merger is the combination of two or more companies into a single entity, typically to achieve synergies and expand market reach.",
                "iconic Aussie brand": "An Australian brand that is widely recognized for its historical importance and strong presence in the market."
            ],
            points: [
                "1": "An iconic Australian brand has revealed a major merger.",
                "2": "The merger involves two other companies."
            ],
            quotes: [
                Quote(name: "Company Spokesperson", quote: "This merger marks a pivotal step in our strategic growth plans.")
            ],
            timeline: [
                TimelineEvent(event: "Iconic Aussie brand announces a merger with two other companies.", datetime: convertToLocalDate(from: "2023-10-01T00:00:00Z"))
            ],
            location: Location(city: "Sydney", country: "Australia", latitude: -33.8688, longitude: 151.2093),
            categories: [Category(name: "Economy", slug: "economy")],
            urls: [
                "https://www.perthnow.com.au/business/iconic-aussie-food-brand-spc-reveals-its-next-move-c-16257400",
                "https://thewest.com.au/business/iconic-aussie-food-brand-spc-reveals-its-next-move-c-16257412"
            ],
            images: [
                "https://images.perthnow.com.au/publication/C-16257400/5739b30a4760cb395fc0787e8f5b8d3a05353893-16x9-x0y0w2048h1152.jpg?imwidth=1200"
            ],
            published_at: "2024-10-02T08:12:35Z",
            is_breaking_news: false
        ),
        News(
            title: "Fiery Debate: J.D. Vance and Tim Walz Clash on Key Issues Ahead of Election",
            score: 4,
            sentiment: .neutral,
            slug: "fiery_debate_jd_vance_and_tim_walz_clash_on_key_issues_ahead_of_election",
            summary: "In a heated debate, vice presidential candidates J.D. Vance and Tim Walz sparred over foreign affairs, climate change, and abortion, marking their final face-off before election day.",
            content: """
            **Vice Presidential Debate Review: J.D. Vance and Tim Walz Clash in a Cordial Showdown**

            In what may be their only live and televised debate of the 2024 election cycle, Republican Senator J.D. Vance from Ohio and Democratic Governor Tim Walz from Minnesota faced off in a cordial yet tense exchange of ideas covering critical issues such as foreign policy, immigration, healthcare, and environmental concerns...
            """,
            keywords: [
                "Debate": "A formal discussion or argument on a particular topic, often involving opposing viewpoints, typically occurring in political contexts.",
                "Tim Walz": "Tim Walz is the 41st governor of Minnesota and a U.S. vice presidential candidate, representing the Democratic Party.",
                "J.D. Vance": "J.D. Vance is a U.S. politician and author, known for his book 'Hillbilly Elegy' and currently a Republican candidate."
            ],
            points: [
                "1": "J.D. Vance and Tim Walz participated in a live, televised debate.",
                "2": "The debate covered foreign affairs, climate change, and abortion."
            ],
            quotes: [
                Quote(name: "J.D. Vance", quote: "We must put America first in our foreign policy and ensure that our environmental regulations do not stifle our economy."),
                Quote(name: "Tim Walz", quote: "It's essential that we tackle climate change with urgency and protect women's rights in this challenging political landscape.")
            ],
            timeline: [
                TimelineEvent(event: "Vice presidential candidates J.D. Vance and Tim Walz participated in their final live, televised debate.", datetime: convertToLocalDate(from: "2023-10-03T00:00:00Z"))
            ],
            location: Location(city: "Washington D.C.", country: "United States", latitude: 38.89511, longitude: -77.03637),
            categories: [Category(name: "Politics", slug: "politics")],
            urls: [
                "https://theconversation.com/in-a-largely-uneventful-and-inconsequential-us-vice-presidential-debate-no-one-can-claim-victory-240202"
            ],
            images: [
                "https://d.ibtimes.com.au/en/full/1861174/us-senator-republican-vice-presidential-candidate-jd-vance-l-minnesota-governor-democratic.jpg"
            ],
            published_at: "2024-10-02T06:22:35Z",
            is_breaking_news: false
        ),
        News(
            title: "Sunday Rose Kidman Urban Stuns at Paris Fashion Week",
            score: 4,
            sentiment: .positive,
            slug: "sunday_rose_kidman_urban_stuns_at_paris_fashion_week",
            summary: "Sunday Rose Kidman Urban, the 16-year-old daughter of Nicole Kidman and Keith Urban, made her runway debut at Paris Fashion Week, walking for Miu Miu alongside Hollywood stars.",
            content: """
            **Sunday Rose Makes Fashion Debut Amidst Star-Studded Events**

            Sunday Rose, the 16-year-old daughter of Nicole Kidman, has officially entered the fashion world, making waves at several high-profile events recently. Her notable runway debut took place at the Miu Miu show held at the Palais d’Iéna...
            """,
            keywords: [
                "Paris Fashion Week": "Paris Fashion Week is a major bi-annual fashion event where top designers showcase their latest collections.",
                "Sunday Rose Kidman Urban": "Sunday Rose Kidman Urban is the 16-year-old daughter of Hollywood stars Nicole Kidman and Keith Urban, making her debut in the fashion world."
            ],
            points: [
                "1": "Sunday Rose Kidman Urban is the daughter of Nicole Kidman and Keith Urban.",
                "2": "She is 16 years old.",
                "3": "She made her runway debut at Paris Fashion Week."
            ],
            quotes: [],
            timeline: [
                TimelineEvent(event: "Sunday Rose Kidman Urban made her runway debut at Paris Fashion Week walking for Miu Miu.", datetime: convertToLocalDate(from: "2023-10-03T00:00:00Z"))
            ],
            location: Location(city: "Paris", country: "France", latitude: 48.8566, longitude: 2.3522),
            categories: [Category(name: "Culture", slug: "culture")],
            urls: [
                "https://www.brisbanetimes.com.au/lifestyle/fashion/nicole-kidman-s-daughter-makes-her-modelling-debut-in-paris-20241002-p5kf5y.html"
            ],
            images: [
                "https://images.perthnow.com.au/publication/C-16253887/956dded4e5d6b2b70ccbafd95d9995550d1359d0-16x9-x1y0w2446h1376.jpg?imwidth=1200"
            ],
            published_at: "2024-10-02T00:41:12Z",
            is_breaking_news: false
        ),
        News(
            title: "Richmond President Blasts Departing Players Amid Dustin Martin Retirement Rumors",
            score: 4,
            sentiment: .negative,
            slug: "richmond_president_blasts_departing_players_amid_dustin_martin_retirement_rumors",
            summary: "Richmond's president criticized four premiership stars for leaving the club while Dustin Martin dismissed rumors of ending his retirement to join Gold Coast.",
            content: """
            **Rumors Swirl as Richmond President Takes Stance on Departing Players**

            Richmond football club's president, John O’Rourke, has expressed his disappointment over the potential departures of key players as the club navigates a challenging off-season...
            """,
            keywords: [
                "Richmond": "An AFL club known for its recent successes including multiple premiership victories.",
                "Gold Coast": "Refers to the Gold Coast Suns, an AFL team rumored to be interested in Dustin Martin.",
                "Dustin Martin": "A megastar in the AFL known for his exceptional performances, who recently retired from the sport."
            ],
            points: [
                "1": "Richmond's president criticized four departing premiership players.",
                "2": "The criticism occurred at Richmond's best and fairest award ceremony."
            ],
            quotes: [
                Quote(name: "Richmond’s president", quote: "It's disappointing to see key players wanting to leave a club that has given them so much."),
                Quote(name: "Dustin Martin", quote: "I have no intention of coming out of retirement to play for Gold Coast.")
            ],
            timeline: [
                TimelineEvent(event: "Richmond’s best and fairest award ceremony took place.", datetime: convertToLocalDate(from: "2023-10-01T19:00:00Z")),
                TimelineEvent(event: "Richmond's president criticized four departing premiership players at the ceremony.", datetime: convertToLocalDate(from: "2023-10-01T19:30:00Z"))
            ],
            location: Location(city: "Melbourne", country: "Australia", latitude: -37.8136, longitude: 144.9631),
            categories: [Category(name: "Sports", slug: "sports")],
            urls: [
                "https://www.brisbanetimes.com.au/sport/afl/baker-farewells-tigers-with-awkward-speech-as-premiership-quartet-cop-swipe-from-president-parker-requests-trade-20241002-p5kf93.html"
            ],
            images: [
                "https://images.perthnow.com.au/publication/C-16251303/4f79b1ea0c2f73255958c00484f3f80448597711-16x9-x0y0w1280h720.jpg?imwidth=1200"
            ],
            published_at: "2024-10-02T00:17:47Z",
            is_breaking_news: false
        ),
        News(
            title: "Julian Assange Freed, Claims He 'Pled Guilty to Journalism'",
            score: 6,
            sentiment: .negative,
            slug: "julian_assange_freed_claims_he_pled_guilty_to_journalism",
            summary: "Julian Assange made his first public statement since being released from prison, stating that he was freed because he 'pled guilty to journalism,' highlighting a dark time for freedom of expression.",
            content: """
            **Julian Assange Claims Freedom Comes from 'Pleading Guilty to Journalism' in Address to Council of Europe**

            Julian Assange, the founder of WikiLeaks, recently addressed the Council of Europe in France, marking his first public statement since being released from prison in June. During the address, he emphasized that he was not freed because the legal system functioned correctly, but rather because he \"pled guilty to journalism.\" Assange's remarks came as he provided testimony regarding the impact of his lengthy detention and conviction on human rights...
            """,
            keywords: [
                "WikiLeaks": "A non-profit organization that publishes classified media and information provided by anonymous sources.",
                "Julian Assange": "Founder of WikiLeaks, a platform known for publishing classified information provided by anonymous sources.",
                "freedom of expression": "The right to express one's ideas and opinions freely through speech, writing, and other forms of communication."
            ],
            points: [
                "1": "Julian Assange made his first public remarks since being released from prison.",
                "2": "He claimed he was freed because he 'pled guilty to journalism'.",
                "3": "Assange gave evidence to the legal affairs and human rights committee of the Parliamentary Assembly of the Council of Europe in Strasbourg, France.",
                "4": "He had pleaded guilty to publishing US military secrets earlier this year.",
                "5": "The guilty plea was part of a deal with the US Justice Department.",
                "6": "This deal concluded a long legal battle and resulted in Assange's release after five years in a British prison.",
                "7": "Assange warned that freedom of expression is now at a 'dark crossroads'."
            ],
            quotes: [
                Quote(name: "Julian Assange", quote: "I pled guilty to journalism."),
                Quote(name: "Julian Assange", quote: "Freedom of expression is now at a dark crossroads.")
            ],
            timeline: [
                TimelineEvent(event: "Julian Assange was released from a British prison after a guilty plea deal.", datetime: convertToLocalDate(from: "2023-06-01T00:00:00Z")),
                TimelineEvent(event: "Assange made his first public remarks since his release.", datetime: convertToLocalDate(from: "2023-10-01T00:00:00Z")),
                TimelineEvent(event: "Assange gave evidence to the legal affairs and human rights committee of the Parliamentary Assembly of the Council of Europe.", datetime: convertToLocalDate(from: "2023-10-01T00:00:00Z"))
            ],
            location: Location(city: "Strasbourg", country: "France", latitude: 48.5734053, longitude: 7.7521113),
            categories: [
                Category(name: "Politics", slug: "politics"),
                Category(name: "Technology", slug: "technology")
            ],
            urls: [
                "https://www.ibtimes.com.au/assange-says-pleaded-guilty-journalism-gain-freedom-1852044",
                "https://www.9news.com.au/national/wikileaks-julian-assange-says-he-pleaded-guilty-to-journalism-in-order-to-be-freed/bc1293ac-baa8-4cd4-92d8-4a3fb0d38343",
                "https://www.perthnow.com.au/news/crime/assange-says-he-pled-guilty-to-journalism-to-be-freed-c-16244445"
            ],
            images: [
                "https://d.ibtimes.com.au/en/full/1861020/assange-said-free-speech-protections-were-reinterpreted-away-his-case.jpg",
                "https://images.perthnow.com.au/publication/C-16244445/83bbc8b313056314a2245f41d89ac080e3526395-16x9-x0y0w1280h720.jpg?imwidth=1200",
                "https://images.thewest.com.au/publication/C-16244312/28d0c01592f5be27dee33cc654e71e3f04faa75c-16x9-x0y0w5343h3005.jpg?imwidth=1200"
            ],
            published_at: "2024-10-01T07:39:35Z",
            is_breaking_news: false
        )
    ] + sampleBreakingNewsList
}
