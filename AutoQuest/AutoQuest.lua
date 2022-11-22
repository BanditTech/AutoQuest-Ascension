AutoQuestSave = nil -- player settings - defaults set up during PLAYER_ENTERING_WORLD event


----------------------------------------------------------------------------------------------------
-- Repeatable quest list - some faction specific quests are added during PLAYER_ENTERING_WORLD
-- [name] = { {{item1, amount}, {item2, amount}, ...}, isEnabled}
----------------------------------------------------------------------------------------------------
local repeatableList = {
-- Ascension
	["High-Risk Events"] = { {{1203209, 4}}, true},
	["Mystic Scrolls: Unlocking Epic Powers"] = { {{375250, 1000}}, false},
	["Mystic Scrolls: Unlocking Legendary Powers"] = { {{375250, 2000}}, false},
	["Hero Architect: Mystic Orbs (Daily)"] = { {{375250, 200}}, true},
	["Hero Architect: Mystic Runes (Daily)"] = { {{375250, 200}}, true},
	["Hero Architect: Scroll of Unlearning - (Repeatable)"] = { {{375250, 200}}, true},
-- Original List
	["10 Tickets - Last Month's Mutton"] = { {{19182, 10}}, false},
	["12 Tickets - Lesser Darkmoon Prize"] = { {{19182, 12}}, false},
	["1200 Tickets - Amulet of the Darkmoon"] = { {{19182, 1200}}, false},
	["1200 Tickets - Orb of the Darkmoon"] = { {{19182, 1200}}, false},
	["40 Tickets - Greater Darkmoon Prize"] = { {{19182, 40}}, false},
	["40 Tickets - Schematic: Steam Tonk Controller"] = { {{19182, 40}}, false},
	["5 Tickets - Darkmoon Flower"] = { {{19182, 5}}, false},
	["5 Tickets - Minor Darkmoon Prize"] = { {{19182, 5}}, false},
	["50 Tickets - Darkmoon Storage Box"] = { {{19182, 50}}, false},
	["50 Tickets - Last Year's Mutton"] = { {{19182, 50}}, false},
	["A Bad Egg"] = { {{8646, 1}}, true},
	["A Binding Contract"] = { {{18628, 1}, {17203, 1}}, false},
	["A Fair Trade"] = { {{15997, 200}}, false},
	["A Fine Egg"] = { {{8644, 1}}, true},
	["A Gallon of Blood"] = { {{17306, 5}}, false},
	["A Head Full of Ivory"] = { {{25463, 3}}, true}, -- quest before the repeatable version
	["Abyssal Crests"] = { {{20513, 3}}, false},
	["Abyssal Scepters"] = { {{20515, 3}}, false},
	["Abyssal Signets"] = { {{20514, 3}}, false},
	["Accepting All Eggs"] = { {{32506, 1}}, true},
	["Additional Runecloth"] = { {{14047, 20}}, false},
	["Again With the Zapped Giants"] = { {{18956, 10}}, true},
	["Agamaggan's Agility"] = { {{5075, 4}}, false},
	["Agamaggan's Strength"] = { {{5075, 4}}, false},
	["Allegiance to Cenarion Circle"] = { {{20802, 1}, {20800, 1}, {20801, 1}}, false},
	["Ally of the Tauren"] = { {{18143, 1}}, true},
	["Amongst the Ruins"] = { {{16762, 1}}, true},
	["An Extraordinary Egg"] = { {{8643, 1}}, true},
	["An Ordinary Egg"] = { {{8645, 1}}, true},
	["Animist's Caress"] = { {{22637, 1}, {19821, 1}}, false},
	["Another Heap of Ethereals"] = { {{29209, 10}}, true},
	["Apprentice Angler"] = { {{19807, 5}}, true},
	["Arcane Tomes"] = { {{29739, 1}}, true},
	["Argent Dawn Gloves"] = { {{22484, 30}}, false},
	["Armor Kits for the Field"] = { {{15564, 8}, {4265, 8}, {21263, 1}}, false},
	["Armor Kits for the Field"] = { {{15564, 8}, {4265, 8}, {21264, 1}}, false},
	["Armor Kits"] = { {{15564, 8}}, false},
	["Armor Scraps"] = { {{17422, 20}}, false},
	["Arms for the Field"] = { {{3853, 2}, {21260, 1}}, false},
	["Arms for the Field"] = { {{3855, 3}, {21261, 1}}, false},
	["Arrows Are For Sissies"] = { {{15997, 200}}, false},
	["Avenging the Fallen"] = { {{19025, 1}}, true},
	["Azure Templar"] = { {{21245, 1}}, true},
	["Bandages for the Field"] = { {{14530, 30}, {8545, 30}, {6451, 30}, {20806, 1}}, true},
	["Beads for Salfa"] = { {{21383, 5}}, true},
	["Begin the Attack!"] = { {{17353, 1}}, true},
	["Big Black Mace"] = { {{7945, 1}}, false},
	["Bone Fragments"] = { {{22526, 30}}, true},
	["Boots for the Guard"] = { {{7936, 3}, {20939, 1}}, false},
	["Bring Me Another Shrubbery!"] = { {{24246, 5}}, true},
	["Call of Air - Guse's Fleet"] = { {{17326, 1}}, true},
	["Call of Air - Ichman's Fleet"] = { {{17504, 1}}, true},
	["Call of Air - Jeztor's Fleet"] = { {{17327, 1}}, true},
	["Call of Air - Mulverick's Fleet"] = { {{17328, 1}}, true},
	["Call of Air - Slidore's Fleet"] = { {{17502, 1}}, true},
	["Call of Air - Vipore's Fleet"] = { {{17503, 1}}, true},
	["Carnival Boots"] = { {{2309, 3}}, false},
	["Carnival Jerkins"] = { {{2314, 3}}, true},
	["Chen's Empty Keg"] = { {{4898, 5}, {4897, 1}, {4896, 1}}, true},
	["Chillwind E'ko"] = { {{12434, 3}}, true},
	["Chromatic Mantle of the Dawn"] = { {{12844, 25}}, false},
	["Coarse Weightstone"] = { {{3240, 10}}, true},
	["Coilfang Armaments"] = { {{24368, 1}}, true},
	["Coldtooth Supplies"] = { {{17542, 10}}, true},
	["Concerted Efforts"] = { {{20560, 1}, {20559, 1}, {20558, 1}, {29024, 1}}, false},
	["Copper Modulator"] = { {{4363, 5}}, false},
	["Core of Elements"] = { {{22527, 30}}, true},
	["Corrupted Night Dragon"] = { {{11516, 4}}, false},
	["Corrupted Songflower"] = { {{11516, 2}}, false},
	["Corrupted Whipper Root"] = { {{11516, 3}}, false},
	["Corrupted Windblossom"] = { {{11516, 2}}, false},
	["Corruptor's Scourgestones"] = { {{12843, 1}}, false},
	["Craftsman's Writ - Brightcloth Pants"] = { {{22609, 1}, {14104, 6}}, false},
	["Craftsman's Writ - Dense Weightstone"] = { {{22600, 1}, {12643, 120}}, false},
	["Craftsman's Writ - Flask of Petrification"] = { {{22621, 1}, {13506, 1}}, false},
	["Craftsman's Writ - Gnomish Battle Chicken"] = { {{22615, 1}, {10725, 4}}, false},
	["Craftsman's Writ - Greater Arcane Protection Potion"] = { {{22620, 1}, {13461, 15}}, false},
	["Craftsman's Writ - Huge Thorium Battleaxe"] = { {{22603, 1}, {12775, 3}}, false},
	["Craftsman's Writ - Imperial Plate Chest"] = { {{22601, 1}, {12422, 3}}, false},
	["Craftsman's Writ - Major Healing Potion"] = { {{22618, 1}, {13446, 20}}, false},
	["Craftsman's Writ - Major Mana Potion"] = { {{22617, 1}, {13444, 10}}, false},
	["Craftsman's Writ - Radiant Circlet"] = { {{22604, 1}, {12417, 3}}, false},
	["Craftsman's Writ - Rugged Armor Kit"] = { {{22606, 1}, {15564, 25}}, false},
	["Craftsman's Writ - Runecloth Bag"] = { {{22611, 1}, {14046, 8}}, false},
	["Craftsman's Writ - Runecloth Robe"] = { {{22612, 1}, {13858, 8}}, false},
	["Craftsman's Writ - Runic Leather Pants"] = { {{22608, 1}, {15095, 4}}, false},
	["Craftsman's Writ - Stonescale Eel"] = { {{22622, 1}, {13422, 40}}, false},
	["Craftsman's Writ - Thorium Grenade"] = { {{22614, 1}, {15993, 20}}, false},
	["Craftsman's Writ - Thorium Tube"] = { {{22616, 1}, {16000, 14}}, false},
	["Craftsman's Writ - Wicked Leather Belt"] = { {{22607, 1}, {15088, 9}}, false},
	["Craftsman's Writ - Wicked Leather Headband"] = { {{22605, 1}, {15086, 10}}, false},
	["Crocolisk Boy and the Bearded Murloc"] = { {{8185, 1}}, true},
	["Crypt Fiend Parts"] = { {{22525, 30}}, true},
	["Crystal Charge"] = { {{11186, 10}, {11188, 10}}, false},
	["Crystal Cluster"] = { {{17423, 5}}, false},
	["Crystal Force"] = { {{11185, 10}, {11184, 10}}, false},
	["Crystal Restore"] = { {{11188, 10}, {11185, 10}}, false},
	["Crystal Spire"] = { {{11184, 10}, {11188, 10}}, false},
	["Crystal Ward"] = { {{11186, 10}, {11185, 10}}, false},
	["Crystal Yield"] = { {{11186, 10}, {11184, 10}}, false},
	["Dadanga is Hungry!"] = { {{11315, 15}}, false},
	["Dalson's Tears Cauldron"] = { {{13320, 1}, {13356, 5}, {14047, 4}}, false},
	["Dark Iron Scraps"] = { {{22528, 30}}, true},
	["Darkmoon Beast Deck"] = { {{19228, 1}}, false},
	["Darkmoon Furies Deck"] = { {{31907, 1}}, false},
	["Darkmoon Lunacy Deck"] = { {{31914, 1}}, false},
	["Death's Embrace"] = { {{22637, 1}, {19814, 1}}, false},
	["Desert Survival Kits"] = { {{7079, 4}, {19440, 4}, {20452, 4}, {20807, 1}}, false},
	["Distracting Jarven"] = { {{2686, 1}}, true},
	["Enchanted Thorium Platemail: Volume III"] = { {{18771, 1}}, true},
	["Encrypted Twilight Texts"] = { {{20404, 10}}, true},
	["Enemy Booty"] = { {{17422, 20}}, false},
	["Enticing Negolash"] = { {{4457, 10}, {4595, 5}}, false},
	["Epic Armaments of Battle - Friend of the Dawn"] = { {{22523, 110}, {22524, 110}}, false},
	["Epic Armaments of Battle - Honored Amongst the Dawn"] = { {{22523, 75}, {22524, 75}}, false},
	["Epic Armaments of Battle - Revered Amongst the Dawn"] = { {{22523, 45}, {22524, 45}}, false},
	["Essence Mangoes"] = { {{19858, 1}}, false},
	["Essence of the Exile"] = { {{4480, 8}, {4479, 8}, {4481, 8}}, false},
	["Ethereum Prisoner I.D. Catalogue"] = { {{31957, 1}}, true},
	["Everything Counts In Large Amounts"] = { {{10593, 1}}, true}, -- quest before the repeatable version
	["Evil Bat Eyes"] = { {{11404, 10}}, true},
	["Extraordinary Materials"] = { {{12655, 2}, {12810, 2}, {21265, 1}}, false},
	["Extraordinary Materials"] = { {{12655, 2}, {12810, 2}, {21381, 1}}, false},
	["Falcon's Call"] = { {{22637, 1}, {19816, 1}}, false},
	["Favor Amongst the Brotherhood, Blood of the Mountain"] = { {{11382, 1}}, false},
	["Favor Amongst the Brotherhood, Core Leather"] = { {{17012, 2}}, false},
	["Favor Amongst the Brotherhood, Dark Iron Ore"] = { {{11370, 10}}, true},
	["Favor Amongst the Brotherhood, Fiery Core"] = { {{17010, 1}}, false},
	["Favor Amongst the Brotherhood, Lava Core"] = { {{17011, 1}}, false},
	["Favor Amongst the Darkspear"] = { {{18142, 1}}, true},
	["Feathers for Grazle"] = { {{21377, 5}}, true},
	["Feathers for Nafien"] = { {{21377, 5}}, true},
	["Fei Fei's Treat"] = { {{31799, 1}}, true},
	["Fel Armaments"] = { {{29740, 1}}, true},
	["Felstone Field Cauldron"] = { {{13320, 1}, {13357, 6}, {14047, 4}}, false},
	["Field Duty Papers"] = { {{23024, 1}}, true},
	["Field Duty"] = { {{20810, 1}}, true},
	["Filling the Soul Gem"] = { {{3912, 1}}, true},
	["Finding the Antidote"] = { {{4886, 4}}, true},
	["Fish in a Bucket"] = { {{13545, 5}}, true},
	["For Great Honor"] = { {{20560, 1}, {20559, 1}, {20558, 1}, {29024, 1}}, false},
	["Free Knot!"] = { {{18250, 1}}, true},
	["Frostmaul E'ko"] = { {{12436, 3}}, true},
	["Frostsaber E'ko"] = { {{12430, 3}}, true},
	["Frostsaber Provisions"] = { {{12622, 5}, {12623, 5}}, true},
	["Gahrron's Withering Cauldron"] = { {{13320, 1}, {13354, 4}, {14047, 4}}, false},
	["Gaining Acceptance"] = { {{18945, 4}}, true},
	["Give Gerard a Drink"] = { {{159, 1}}, true},
	["Glowing Scorpid Blood"] = { {{19933, 10}}, true},
	["Goblin Engineering"] = { {{10789, 1}}, true},
	["Green Fireworks"] = { {{9313, 36}}, true},
	["Green Iron Bracers"] = { {{3835, 3}}, false},
	["Grinding Stones for the Guard"] = { {{12644, 10}, {7966, 10}, {3486, 10}, {20940, 1}}, false},
	["Gurubashi, Vilebranch, and Witherbark Coins"] = { {{19701, 1}, {19702, 1}, {19703, 1}}, true},
	["Hallow's End Treats for Spoops!"] = { {{20493, 1}, {20495, 1}, {20491, 1}, {20497, 1}}, true},
	["Healthy Dragon Scale"] = { {{13920, 1}}, true},
	["Heavy Grinding Stone"] = { {{3486, 7}}, false},
	["Hive'Ashi Scout Report"] = { {{21161, 1}, {21167, 1}}, true},
	["Hive'Regal Scout Report"] = { {{21160, 1}, {21166, 1}}, true},
	["Hive'Zora Scout Report"] = { {{21158, 1}, {21165, 1}}, true},
	["Hoodoo Hex"] = { {{22637, 1}, {19819, 1}}, false},
	["Ice Thistle E'ko"] = { {{12435, 3}}, true},
	["Identify Plant Parts"] = { {{24401, 10}}, true},
	["Indurium Ore"] = { {{5833, 4}}, true},
	["Infallible Mind"] = { {{8394, 10}, {8396, 2}}, false},
	["Invader's Scourgestones"] = { {{12841, 10}}, true},
	["Invaders of Alterac Valley"] = { {{20560, 3}}, false},
	["Irondeep Supplies"] = { {{17522, 10}}, true},
	["Ivory Raptor Replacement"] = { {{13317, 1}}, false},
	["Ivus the Forest Lord"] = { {{17423, 1}}, false},
	["Korrak the Everliving"] = { {{18148, 1}}, true},
	["Kum'isha's Endeavors"] = { {{8244, 1}}, true},
	["Launch the Attack!"] = { {{17442, 1}}, true},
	["Libram of Constitution"] = { {{11754, 1}, {8411, 1}, {11733, 1}, {11952, 4}}, false},
	["Libram of Protection"] = { {{18334, 1}, {18335, 1}, {14344, 2}, {12735, 1}}, false},
	["Libram of Rapidity"] = { {{18332, 1}, {18335, 1}, {14344, 2}, {12938, 2}}, false},
	["Libram of Resilience"] = { {{11754, 1}, {11567, 4}, {11751, 1}, {11736, 1}}, false},
	["Libram of Rumination"] = { {{11754, 1}, {11752, 1}, {8424, 1}, {11732, 1}}, false},
	["Libram of Tenacity"] = { {{11754, 1}, {11734, 1}, {11564, 4}, {11753, 1}}, false},
	["Libram of Voracity"] = { {{11754, 1}, {11737, 1}, {11951, 4}, {11563, 4}}, false},
	["Life's Finer Pleasures"] = { {{29112, 1}}, true},
	["Locked Away"] = { {{12738, 1}}, true},
	["Lokholar the Ice Lord"] = { {{17306, 1}}, false},
	["Making Amends"] = { {{14047, 40}, {3857, 4}}, false},
	["Mark of Honor"] = { {{19322, 1}}, false},
	["Master Angler"] = { {{19807, 40}}, true},
	["Mechanical Repair Kits"] = { {{11590, 6}}, true},
	["Medallion of Station"] = { {{14344, 1}, {20513, 3}}, false},
	["Minion's Scourgestones"] = { {{12840, 20}}, true},
	["More Armor Kits"] = { {{15564, 8}}, false},
	["More Armor Scraps"] = { {{17422, 20}}, false},
	["More Basilisk Eyes"] = { {{25744, 8}}, true},
	["More Bat Eyes"] = { {{11404, 10}}, true},
	["More Booty!"] = { {{17422, 20}}, false},
	["More Crystal Fragments"] = { {{25416, 10}}, true},
	["More Dense Grinding Stones"] = { {{12644, 8}}, false},
	["More Feathers"] = { {{25719, 30}}, true},
	["More Fertile Spores"] = { {{24449, 6}}, true},
	["More Firewing Signets"] = { {{29426, 10}}, true},
	["More Glowcaps"] = { {{24245, 10}}, true},
	["More Glowing Scorpid Blood"] = { {{19933, 10}}, true},
	["More Heads Full of Ivory"] = { {{25463, 3}}, true},
	["More Irradiated Crystal Shards"] = { {{23984, 10}}, true},
	["More Marks of Kil'jaeden"] = { {{29425, 10}}, true},
	["More Marks of Sargeras"] = { {{30809, 10}}, true},
	["More Obsidian Warbeads"] = { {{25433, 10}}, true},
	["More Resource Crates"] = { {{19725, 1}}, true},
	["More Rotting Hearts"] = { {{22641, 10}}, true},
	["More Shadow Dust"] = { {{32388, 6}}, true},
	["More Sparklematic Action"] = { {{9308, 1}}, true},
	["More Spinal Dust"] = { {{22642, 10}}, true},
	["More Spore Sacs"] = { {{24290, 10}}, true},
	["More Sunfury Signets"] = { {{30810, 10}}, true},
	["More Tendrils!"] = { {{24291, 6}}, true},
	["More Thorium Widgets"] = { {{15994, 6}}, true},
	["More Venom Sacs"] = { {{25802, 8}}, true},
	["More Warbeads!"] = { {{25433, 10}}, true},
	["More Warbeads"] = { {{25433, 10}}, true},
	["Morrowgrain Research"] = { {{11040, 10}}, false},
	["Morrowgrain to Darnassus"] = { {{11040, 10}}, false},
	["Morrowgrain to Feathermoon Stronghold"] = { {{11040, 5}}, false},
	["Morrowgrain to Thunder Bluff"] = { {{11040, 10}}, false},
	["Mortal Champions"] = { {{21229, 1}}, true},
	["Nether Gas In a Fel Fire Engine"] = { {{31653, 5}}, true},
	["Nexus-Prince Shaffar's Personal Chamber"] = { {{31941, 1}}, true},
	["One Draenei's Junk..."] = { {{10593, 1}}, true},
	["Perfect Yeti Hide"] = { {{18972, 1}}, true},
	["Presence of Might"] = { {{22637, 1}, {19813, 1}}, false},
	["Presence of Sight"] = { {{22637, 1}, {19818, 1}}, false},
	["Pristine Yeti Hide"] = { {{18969, 1}}, true},
	["Prophetic Aura"] = { {{22637, 1}, {19820, 1}}, false},
	["Purging the Chambers of Bash'ir"] = { {{29460, 5}}, true},
	["Quell the Silverwing Usurpers"] = { {{20558, 1}}, true},
	["Rage of Ages"] = { {{8391, 3}, {8392, 2}, {8393, 1}}, false},
	["Ram Hide Harnesses"] = { {{17642, 1}}, true},
	["Ram Riding Harnesses"] = { {{17643, 1}}, true},
	["Rare Fish - Brownell's Blue Striped Racer"] = { {{19803, 1}}, true},
	["Rare Fish - Dezian Queenfish"] = { {{19806, 1}}, true},
	["Rare Fish - Keefer's Angelfish"] = { {{19805, 1}}, true},
	["Razorhide"] = { {{5075, 4}}, false},
	["Recover the Key!"] = { {{19064, 1}}, true},
	["Refuel for the Zapping"] = { {{18958, 6}}, true},
	["Remember Alterac Valley!"] = { {{20560, 3}}, false},
	["Restoring Fiery Flux Supplies via Heavy Leather"] = { {{18944, 2}, {4234, 10}, {3857, 1}}, true},
	["Restoring Fiery Flux Supplies via Iron"] = { {{18944, 2}, {3575, 4}, {3857, 1}}, true},
	["Restoring Fiery Flux Supplies via Kingsblood"] = { {{18944, 2}, {3356, 4}, {3857, 1}}, true},
	["Rising Spirit"] = { {{5075, 4}}, false},
	["Rituals of Strength"] = { {{12644, 8}}, false},
	["Rocknot's Ale"] = { {{11325, 2}}, true},
	["Salt of the Scorpok"] = { {{8393, 3}, {8396, 2}, {8392, 1}}, false},
	["Salve via Disenchanting"] = { {{11174, 1}}, false},
	["Salve via Gathering"] = { {{11514, 4}}, false},
	["Salve via Hunting"] = { {{11515, 6}}, false},
	["Salve via Mining"] = { {{11513, 4}}, false},
	["Salve via Skinning"] = { {{11512, 5}}, false},
	["Sandfury, Skullsplitter, and Bloodscalp Coins"] = { {{19704, 1}, {19705, 1}, {19706, 1}}, true},
	["Savage Fronds"] = { {{22529, 30}}, true},
	["Scrying Materials"] = { {{14344, 1}, {11178, 1}, {12364, 1}, {21259, 1}}, false},
	["Seal of the Earth"] = { {{4845, 1}, {4844, 1}, {4843, 1}}, true},
	["Secrets of the Qiraji"] = { {{21230, 1}}, true},
	["Shardtooth E'ko"] = { {{12432, 3}}, true},
	["Signets of the Zandalar"] = { {{19858, 15}}, false},
	["Single Firewing Signet"] = { {{29426, 1}}, false},
	["Single Mark of Kil'jaeden"] = { {{29425, 1}}, false},
	["Single Mark of Sargeras"] = { {{30809, 1}}, false},
	["Single Sunfury Signet"] = { {{30810, 1}}, false},
	["Small Furry Paws"] = { {{5134, 5}}, true},
	["Soft Bushy Tails"] = { {{4582, 5}}, true},
	["Spirit of the Boar"] = { {{8392, 3}, {8393, 2}, {8394, 1}}, false},
	["Spirit of the Wind"] = { {{5075, 10}}, false},
	["Spiritual Domination"] = { {{8396, 10}, {8391, 2}}, false},
	["Still Believing"] = { {{20404, 10}}, true},
	["Stormwind Library"] = { {{3898, 1}}, true},
	["Stranglethorn Fever"] = { {{2799, 1}}, true},
	["Superior Armaments of Battle - Friend of the Dawn"] = { {{22523, 30}, {22524, 30}}, false},
	["Superior Armaments of Battle - Revered Amongst the Dawn"] = { {{22523, 7}, {22524, 7}}, false},
	["Syncretist's Sigil"] = { {{22637, 1}, {19815, 1}}, false},
	["Syndicate Emblems"] = { {{17124, 1}}, true},
	["Talismans of Merit"] = { {{19213, 1}}, true},
	["Testing for Corruption - Felwood"] = { {{12230, 1}}, true},
	["Testing for Impurities - Un'Goro Crater"] = { {{12235, 1}}, true},
	["The Alliance Needs More Arthas' Tears!"] = { {{8836, 20}}, false},
	["The Alliance Needs More Purple Lotus!"] = { {{8831, 20}}, false},
	["The Alliance Needs More Roast Raptor!"] = { {{12210, 20}}, false},
	["The Alliance Needs More Stranglekelp!"] = { {{3820, 20}}, false},
	["The Archbishop's Mercy"] = { {{18147, 1}}, true},
	["The Dormant Shade"] = { {{3080, 1}}, true},
	["The Forging of Quel'Serrar"] = { {{18492, 1}}, true},
	["The Four Dukes"] = { {{20948, 1}}, true},
	["The Gordok Ogre Suit"] = { {{14048, 4}, {8170, 8}, {14341, 2}, {18240, 1}}, false},
	["The Hand of the Righteous"] = { {{20384, 200}}, true},
	["The Human Condition"] = { {{18144, 1}}, true},
	["The Ironforge Brigade Needs Explosives!"] = { {{8956, 6}, {9061, 5}, {15992, 10}, {21257, 1}}, false},
	["The Last Element"] = { {{11129, 10}}, true},
	["The Monogrammed Sash"] = { {{3985, 1}}, false},
	["The Orgrimmar Legion Needs Mojo!"] = { {{8956, 8}, {8152, 6}, {12804, 6}, {21258, 1}}, false},
	["The Return of Korrak"] = { {{18148, 1}}, true},
	["The Savage Guard - Arcanum of Focus"] = { {{18330, 1}}, false},
	["The Savage Guard - Arcanum of Protection"] = { {{18331, 1}}, false},
	["The Savage Guard - Arcanum of Rapidity"] = { {{18329, 1}}, false},
	["The Super Egg-O-Matic"] = { {{8564, 1}}, true},
	["The Videre Elixir"] = { {{11242, 1}}, true},
	["The World's Largest Gnome!"] = { {{5739, 3}}, true},
	["Thorium Widget"] = { {{15994, 6}}, false},
	["Thunderbrew Lager"] = { {{1274, 5}}, true},
	["To Serve Kum'isha"] = { {{8244, 1}}, true}, -- quest before the repeatable version
	["Tokens of the Descendants"] = { {{32715, 1}, {32717, 1}, {32716, 1}, {32718, 1}}, true},
	["Torn Bear Pelts"] = { {{11407, 5}}, true},
	["Traitor to the Bloodsail"] = { {{4306, 40}, {2604, 4}}, true},
	["Twilight Ring of Lordship"] = { {{20514, 3}, {14344, 5}}, false},
	["Uncatalogued Species"] = { {{24407, 1}}, true},
	["Uniform Supplies"] = { {{14342, 1}, {14048, 2}, {14227, 1}}, true}, -- +21262/21384
	["Unraveling the Mystery"] = { {{20463, 1}}, true},
	["Vanquish the Invaders!"] = { {{20558, 1}}, true},
	["Vibrant Plumes"] = { {{5117, 5}}, true},
	["Vodouisant's Vigilant Embrace"] = { {{22637, 1}, {19817, 1}}, false},
	["Wanted: DWARVES!"] = { {{18206, 1}}, true},
	["War at Sea"] = { {{4338, 40}, {3466, 4}}, false},
	["Warsong Outrider Update"] = { {{16746, 1}}, false},
	["Warsong Runner Update"] = { {{16746, 1}}, false},
	["Warsong Saw Blades"] = { {{4369, 1}}, false},
	["Warsong Scout Update"] = { {{16746, 1}}, false},
	["Water Pouch Bounty"] = { {{8483, 5}}, true},
	["What the Hoof?"] = { {{18145, 1}}, true},
	["Whirring Bronze Gizmo"] = { {{4375, 7}}, false},
	["Wildkin E'ko"] = { {{12433, 3}}, true},
	["Winterfall E'ko"] = { {{12431, 3}}, true},
	["Wisdom of Agamaggan"] = { {{5075, 4}}, false},
	["Writhing Haunt Cauldron"] = { {{13320, 1}, {13356, 5}, {14047, 4}}, false},
	["You're a Mean One..."] = { {{17662, 1}}, true},
	["Your Fortune Awaits You..."] = { {{19443, 1}}, true},
	["Zanza's Potent Potables"] = { {{19858, 1}}, false},
	["Zinfizzlex's Portable Shredder Unit"] = { {{12359, 30}, {3860, 50}, {3575, 75}, {17411, 1}}, false},
	["Zulian, Razzashi, and Hakkari Coins"] = { {{19698, 1}, {19699, 1}, {19700, 1}}, true},
}

-- For messed up quest lists that show every version of a quest instead of the highest possible
-- level, this will set which level to look for.
repeatableList["Quell the Silverwing Usurpers"].level = 60
repeatableList["Vanquish the Invaders!"].level = 60

----------------------------------------------------------------------------------------------------
-- Leveling Hands of Fate list
----------------------------------------------------------------------------------------------------
local fateList = {
	-- Specialization 1 Hands of Fate
		["Specialization 1: Hand of Fate Level 10"] = true,
		["Specialization 1: Hand of Fate Level 20"] = true,
		["Specialization 1: Hand of Fate Level 30"] = true,
		["Specialization 1: Hand of Fate Level 40"] = true,
		["Specialization 1: Hand of Fate Level 50"] = true,
		["Specialization 1: Hand of Fate Level 60"] = true,
		["Specialization 1: Hand of Fate Level 61"] = true,
		["Specialization 1: Hand of Fate Level 62"] = true,
		["Specialization 1: Hand of Fate Level 63"] = true,
		["Specialization 1: Hand of Fate Level 64"] = true,
		["Specialization 1: Hand of Fate Level 65"] = true,
		["Specialization 1: Hand of Fate Level 66"] = true,
		["Specialization 1: Hand of Fate Level 67"] = true,
		["Specialization 1: Hand of Fate Level 68"] = true,
		["Specialization 1: Hand of Fate Level 69"] = true,
		["Specialization 1: Hand of Fate Level 70"] = true,	
	-- Specialization 2 Hands of Fate
		["Specialization 2: Hand of Fate Level 10"] = true,
		["Specialization 2: Hand of Fate Level 20"] = true,
		["Specialization 2: Hand of Fate Level 30"] = true,
		["Specialization 2: Hand of Fate Level 40"] = true,
		["Specialization 2: Hand of Fate Level 50"] = true,
		["Specialization 2: Hand of Fate Level 60"] = true,
		["Specialization 2: Hand of Fate Level 61"] = true,
		["Specialization 2: Hand of Fate Level 62"] = true,
		["Specialization 2: Hand of Fate Level 63"] = true,
		["Specialization 2: Hand of Fate Level 64"] = true,
		["Specialization 2: Hand of Fate Level 65"] = true,
		["Specialization 2: Hand of Fate Level 66"] = true,
		["Specialization 2: Hand of Fate Level 67"] = true,
		["Specialization 2: Hand of Fate Level 68"] = true,
		["Specialization 2: Hand of Fate Level 69"] = true,
		["Specialization 2: Hand of Fate Level 70"] = true,	
	-- Specialization 3 Hands of Fate
		["Specialization 3: Hand of Fate Level 10"] = true,
		["Specialization 3: Hand of Fate Level 20"] = true,
		["Specialization 3: Hand of Fate Level 30"] = true,
		["Specialization 3: Hand of Fate Level 40"] = true,
		["Specialization 3: Hand of Fate Level 50"] = true,
		["Specialization 3: Hand of Fate Level 60"] = true,
		["Specialization 3: Hand of Fate Level 61"] = true,
		["Specialization 3: Hand of Fate Level 62"] = true,
		["Specialization 3: Hand of Fate Level 63"] = true,
		["Specialization 3: Hand of Fate Level 64"] = true,
		["Specialization 3: Hand of Fate Level 65"] = true,
		["Specialization 3: Hand of Fate Level 66"] = true,
		["Specialization 3: Hand of Fate Level 67"] = true,
		["Specialization 3: Hand of Fate Level 68"] = true,
		["Specialization 3: Hand of Fate Level 69"] = true,
		["Specialization 3: Hand of Fate Level 70"] = true,	
	-- Specialization 4 Hands of Fate
		["Specialization 4: Hand of Fate Level 10"] = true,
		["Specialization 4: Hand of Fate Level 20"] = true,
		["Specialization 4: Hand of Fate Level 30"] = true,
		["Specialization 4: Hand of Fate Level 40"] = true,
		["Specialization 4: Hand of Fate Level 50"] = true,
		["Specialization 4: Hand of Fate Level 60"] = true,
		["Specialization 4: Hand of Fate Level 61"] = true,
		["Specialization 4: Hand of Fate Level 62"] = true,
		["Specialization 4: Hand of Fate Level 63"] = true,
		["Specialization 4: Hand of Fate Level 64"] = true,
		["Specialization 4: Hand of Fate Level 65"] = true,
		["Specialization 4: Hand of Fate Level 66"] = true,
		["Specialization 4: Hand of Fate Level 67"] = true,
		["Specialization 4: Hand of Fate Level 68"] = true,
		["Specialization 4: Hand of Fate Level 69"] = true,
		["Specialization 4: Hand of Fate Level 70"] = true,	
	-- Specialization 5 Hands of Fate
		["Specialization 5: Hand of Fate Level 10"] = true,
		["Specialization 5: Hand of Fate Level 20"] = true,
		["Specialization 5: Hand of Fate Level 30"] = true,
		["Specialization 5: Hand of Fate Level 40"] = true,
		["Specialization 5: Hand of Fate Level 50"] = true,
		["Specialization 5: Hand of Fate Level 60"] = true,
		["Specialization 5: Hand of Fate Level 61"] = true,
		["Specialization 5: Hand of Fate Level 62"] = true,
		["Specialization 5: Hand of Fate Level 63"] = true,
		["Specialization 5: Hand of Fate Level 64"] = true,
		["Specialization 5: Hand of Fate Level 65"] = true,
		["Specialization 5: Hand of Fate Level 66"] = true,
		["Specialization 5: Hand of Fate Level 67"] = true,
		["Specialization 5: Hand of Fate Level 68"] = true,
		["Specialization 5: Hand of Fate Level 69"] = true,
		["Specialization 5: Hand of Fate Level 70"] = true,	
	-- Specialization 6 Hands of Fate
		["Specialization 6: Hand of Fate Level 10"] = true,
		["Specialization 6: Hand of Fate Level 20"] = true,
		["Specialization 6: Hand of Fate Level 30"] = true,
		["Specialization 6: Hand of Fate Level 40"] = true,
		["Specialization 6: Hand of Fate Level 50"] = true,
		["Specialization 6: Hand of Fate Level 60"] = true,
		["Specialization 6: Hand of Fate Level 61"] = true,
		["Specialization 6: Hand of Fate Level 62"] = true,
		["Specialization 6: Hand of Fate Level 63"] = true,
		["Specialization 6: Hand of Fate Level 64"] = true,
		["Specialization 6: Hand of Fate Level 65"] = true,
		["Specialization 6: Hand of Fate Level 66"] = true,
		["Specialization 6: Hand of Fate Level 67"] = true,
		["Specialization 6: Hand of Fate Level 68"] = true,
		["Specialization 6: Hand of Fate Level 69"] = true,
		["Specialization 6: Hand of Fate Level 70"] = true,	
	-- Specialization 7 Hands of Fate
		["Specialization 7: Hand of Fate Level 10"] = true,
		["Specialization 7: Hand of Fate Level 20"] = true,
		["Specialization 7: Hand of Fate Level 30"] = true,
		["Specialization 7: Hand of Fate Level 40"] = true,
		["Specialization 7: Hand of Fate Level 50"] = true,
		["Specialization 7: Hand of Fate Level 60"] = true,
		["Specialization 7: Hand of Fate Level 61"] = true,
		["Specialization 7: Hand of Fate Level 62"] = true,
		["Specialization 7: Hand of Fate Level 63"] = true,
		["Specialization 7: Hand of Fate Level 64"] = true,
		["Specialization 7: Hand of Fate Level 65"] = true,
		["Specialization 7: Hand of Fate Level 66"] = true,
		["Specialization 7: Hand of Fate Level 67"] = true,
		["Specialization 7: Hand of Fate Level 68"] = true,
		["Specialization 7: Hand of Fate Level 69"] = true,
		["Specialization 7: Hand of Fate Level 70"] = true,	
	-- Specialization 8 Hands of Fate
		["Specialization 8: Hand of Fate Level 10"] = true,
		["Specialization 8: Hand of Fate Level 20"] = true,
		["Specialization 8: Hand of Fate Level 30"] = true,
		["Specialization 8: Hand of Fate Level 40"] = true,
		["Specialization 8: Hand of Fate Level 50"] = true,
		["Specialization 8: Hand of Fate Level 60"] = true,
		["Specialization 8: Hand of Fate Level 61"] = true,
		["Specialization 8: Hand of Fate Level 62"] = true,
		["Specialization 8: Hand of Fate Level 63"] = true,
		["Specialization 8: Hand of Fate Level 64"] = true,
		["Specialization 8: Hand of Fate Level 65"] = true,
		["Specialization 8: Hand of Fate Level 66"] = true,
		["Specialization 8: Hand of Fate Level 67"] = true,
		["Specialization 8: Hand of Fate Level 68"] = true,
		["Specialization 8: Hand of Fate Level 69"] = true,
		["Specialization 8: Hand of Fate Level 70"] = true,	
	-- Specialization 9 Hands of Fate
		["Specialization 9: Hand of Fate Level 10"] = true,
		["Specialization 9: Hand of Fate Level 20"] = true,
		["Specialization 9: Hand of Fate Level 30"] = true,
		["Specialization 9: Hand of Fate Level 40"] = true,
		["Specialization 9: Hand of Fate Level 50"] = true,
		["Specialization 9: Hand of Fate Level 60"] = true,
		["Specialization 9: Hand of Fate Level 61"] = true,
		["Specialization 9: Hand of Fate Level 62"] = true,
		["Specialization 9: Hand of Fate Level 63"] = true,
		["Specialization 9: Hand of Fate Level 64"] = true,
		["Specialization 9: Hand of Fate Level 65"] = true,
		["Specialization 9: Hand of Fate Level 66"] = true,
		["Specialization 9: Hand of Fate Level 67"] = true,
		["Specialization 9: Hand of Fate Level 68"] = true,
		["Specialization 9: Hand of Fate Level 69"] = true,
		["Specialization 9: Hand of Fate Level 70"] = true,	
	-- Specialization 10 Hands of Fate
		["Specialization 10: Hand of Fate Level 10"] = true,
		["Specialization 10: Hand of Fate Level 20"] = true,
		["Specialization 10: Hand of Fate Level 30"] = true,
		["Specialization 10: Hand of Fate Level 40"] = true,
		["Specialization 10: Hand of Fate Level 50"] = true,
		["Specialization 10: Hand of Fate Level 60"] = true,
		["Specialization 10: Hand of Fate Level 61"] = true,
		["Specialization 10: Hand of Fate Level 62"] = true,
		["Specialization 10: Hand of Fate Level 63"] = true,
		["Specialization 10: Hand of Fate Level 64"] = true,
		["Specialization 10: Hand of Fate Level 65"] = true,
		["Specialization 10: Hand of Fate Level 66"] = true,
		["Specialization 10: Hand of Fate Level 67"] = true,
		["Specialization 10: Hand of Fate Level 68"] = true,
		["Specialization 10: Hand of Fate Level 69"] = true,
		["Specialization 10: Hand of Fate Level 70"] = true,	
	-- Specialization 11 Hands of Fate
		["Specialization 11: Hand of Fate Level 10"] = true,
		["Specialization 11: Hand of Fate Level 20"] = true,
		["Specialization 11: Hand of Fate Level 30"] = true,
		["Specialization 11: Hand of Fate Level 40"] = true,
		["Specialization 11: Hand of Fate Level 50"] = true,
		["Specialization 11: Hand of Fate Level 60"] = true,
		["Specialization 11: Hand of Fate Level 61"] = true,
		["Specialization 11: Hand of Fate Level 62"] = true,
		["Specialization 11: Hand of Fate Level 63"] = true,
		["Specialization 11: Hand of Fate Level 64"] = true,
		["Specialization 11: Hand of Fate Level 65"] = true,
		["Specialization 11: Hand of Fate Level 66"] = true,
		["Specialization 11: Hand of Fate Level 67"] = true,
		["Specialization 11: Hand of Fate Level 68"] = true,
		["Specialization 11: Hand of Fate Level 69"] = true,
		["Specialization 11: Hand of Fate Level 70"] = true,	
	-- Specialization 12 Hands of Fate
		["Specialization 12: Hand of Fate Level 10"] = true,
		["Specialization 12: Hand of Fate Level 20"] = true,
		["Specialization 12: Hand of Fate Level 30"] = true,
		["Specialization 12: Hand of Fate Level 40"] = true,
		["Specialization 12: Hand of Fate Level 50"] = true,
		["Specialization 12: Hand of Fate Level 60"] = true,
		["Specialization 12: Hand of Fate Level 61"] = true,
		["Specialization 12: Hand of Fate Level 62"] = true,
		["Specialization 12: Hand of Fate Level 63"] = true,
		["Specialization 12: Hand of Fate Level 64"] = true,
		["Specialization 12: Hand of Fate Level 65"] = true,
		["Specialization 12: Hand of Fate Level 66"] = true,
		["Specialization 12: Hand of Fate Level 67"] = true,
		["Specialization 12: Hand of Fate Level 68"] = true,
		["Specialization 12: Hand of Fate Level 69"] = true,
		["Specialization 12: Hand of Fate Level 70"] = true,	
}


----------------------------------------------------------------------------------------------------
-- Daily quest list
-- These quests will be automatically accepted if the daily setting is enabled
----------------------------------------------------------------------------------------------------
local dailyList = {
	-- Ascension
	["Forging Mystic Power"] = true,
	["Call to Arms: Battleground"] = true,
	-- High Risk - Tier 1 - Level 70
	["Population Control: Shadow Tomb (High-Risk)"] = true,
	["Population Control: Tomb of Lights (High-Risk)"] = true,
	["Population Control: Veil Shalas (High-Risk)"] = true,
	["Population Control: Burning Blade Ruins (High-Risk)"] = true,
	["Population Control: Kilsorrow Fortress (High-Risk)"] = true,
	["Population Control: Manaforge Bnaar (High-Risk)"] = true,
	["Population Control: Darkcrest Shore (High-Risk)"] = true,
	["Population Control: Funggor Cavern (High-Risk)"] = true,
	["Population Control: The Twilight Ridge (High-Risk)"] = true,
	["Population Control: Forge Camp Fear (High-Risk)"] = true,
	["Population Control: Laughing Skull Ruins (High-Risk)"] = true,
	["Population Control: Northwind Cleft (High-Risk)"] = true,
	["Population Control: Sunspring Post (High-Risk)"] = true,
	["War in Nagrand: Crystal Clear Solution (High-Risk)"] = true,
	["War in Nagrand: Fields of Shadow (High-Risk)"] = true,
	["War in Nagrand: Hate and Fear (High-Risk)"] = true,
	["War in Zangarmarsh Umbrafen Village (High-Risk)"] = true,
	["War in Zangarmarsh: Daggerfen Village (High-Risk)"] = true,
	["War in Zangarmarsh: The Ango'rosh Stronghold (High-Risk)"] = true,
	["War in Zangarmarsh: Lost Tribes (High-Risk)"] = true,
	["War in Zangarmarsh: The Darkcrest (High-Risk)"] = true,
	["War in Zangarmarsh: The Dead Mire (High-Risk)"] = true,
	["War in Terokkar: Skettis (High-Risk)"] = true,
	["War in Terokkar: Tomb of Lights (High-Risk)"] = true,
	["War in Terokkar: Veil Shalas (High-Risk)"] = true,
	-- High Risk - Tier 1 - Level 60
	["Bloody Expedition: Kickin' Jurass"] = true,
	["Bloody Expedition: Slithering Scar"] = true,
	["Bloody Expedition: West Un'goro Crater Hunt"] = true,
	-- Cooking/Fishing
	["Bait Bandits"] = true,
	["Crocolisks in the City"] = true,
	["Felblood Fillet"] = true,
	["Manalicious"] = true,
	["Revenge is Tasty"] = true,
	["Shrimpin' Ain't Easy"] = true,
	["Soup for the Soul"] = true,
	["Super Hot Stew"] = true,
	["The One That Got Away"] = true,
	-- Reputations
	["A Slow Death"] = true,
	["Banish More Demons"] = true,
	["Bomb Them Again!"] = true,
	["Disrupting the Twilight Portal"] = true,
	["Dragons are the Least of Our Problems"] = true,
	["Escape from Skettis"] = true,
	["Fires Over Skettis"] = true,
	["Nethercite Ore"] = true,
	["Netherdust Pollen"] = true,
	["Nethermine Flayer Hide"] = true,
	["Netherwing Crystals"] = true,
	["Picking up the Pieces..."] = true,
	["The Booterang: A Cure For The Common Worthless Peon"] = true,
	["The Deadliest Trap Ever Laid"] = true,
	["The Not-So-Friendly Skies..."] = true,
	["The Relic's Emanation"] = true,
	["Wrangle More Aether Rays!"] = true,
	-- Instances (Normal)
	["Wanted: Arcatraz Sentinels"] = true,
	["Wanted: Coilfang Myrmidons"] = true,
	["Wanted: Malicious Instructors"] = true,
	["Wanted: Rift Lords"] = true,
	["Wanted: Shattered Hand Centurions"] = true,
	["Wanted: Sisters of Torment"] = true,
	["Wanted: Sunseeker Channelers"] = true,
	["Wanted: Tempest-Forge Destroyers"]= true,
	-- Instances (Heroic)
	["Wanted: A Black Stalker Egg"] = true,
	["Wanted: A Warp Splinter Clipping"] = true,
	["Wanted: Aeonus's Hourglass"] = true,
	["Wanted: Bladefist's Seal"] = true,
	["Wanted: Keli'dan's Feathered Stave"] = true,
	["Wanted: Murmur's Whisper"] = true,
	["Wanted: Nazan's Riding Crop"] = true,
	["Wanted: Pathaleon's Projector"] = true,
	["Wanted: Shaffar's Wondrous Pendant"] = true,
	["Wanted: The Epoch Hunter's Head"] = true,
	["Wanted: The Exarch's Soul Gem"] = true,
	["Wanted: The Headfeathers of Ikiss"] = true,
	["Wanted: The Heart of Quagmirran"] = true,
	["Wanted: The Scroll of Skyriss"] = true,
	["Wanted: The Signet Ring of Prince Kael'thas"] = true,
	["Wanted: The Warlord's Treatise"] = true,
	-- PvP
	["Call to Arms: Alterac Valley"] = true,
	["Call to Arms: Arathi Basin"] = true,
	["Call to Arms: Eye of the Storm"] = true,
	["Call to Arms: Warsong Gulch"] = true,
	["Enemies, Old and New"] = true,
	["Hellfire Fortifications"] = true,
	["In Defense of Halaa"] = true,
	["Spirits of Auchindoun"] = true,
	-- Shattered Sun
	["A Charitable Donation"] = false, -- pay gold, so disabled by default
	["Arm the Wards!"] = true,
	["Ata'mal Armaments"] = true,
	["Blast the Gateway"] = true,
	["Blood for Blood"] = true,
	["Crush the Dawnblade"] = true,
	["Discovering Your Roots"] = true,
	["Disrupt the Greengill Coast"] = true,
	["Distraction at the Dead Scar"] = true,
	["Don't Stop Now...."] = true,
	["Erratic Behavior"] = true,
	["Further Conversions"] = true,
	["Gaining the Advantage"] = true,
	["Intercept the Reinforcements"] = true,
	["Intercepting the Mana Cells"] = true,
	["Keeping the Enemy at Bay"] = true,
	["Know Your Ley Lines"] = true,
	["Maintaining the Sunwell Portal"] = true,
	["Making Ready"] = true,
	["Open for Business"] = true,
	["Rediscovering Your Roots"] = true,
	["Sunfury Attack Plans"] = true,
	["Taking the Harbor"] = true,
	["The Air Strikes Must Continue"] = true,
	["The Battle for the Sun's Reach Armory"] = true,
	["The Battle Must Go On"] = true,
	["The Multiphase Survey"] = true,
	["The Sanctum Wards"] = true,
	["Your Continued Support"] = false, -- pay gold, so disabled by default
	-- Seasonal
	["Bark for Drohn's Distillery!"] = true,
	["Bark for T'chali's Voodoo Brewery!"] = true,
	["Bark for the Barleybrews!"] = true,
	["Bark for the Thunderbrews!"] = true,
	["Call the Headless Horseman"] = true,
	["Insult Coren Direbrew"] = true,
	["More Torch Catching"] = true,
	["More Torch Tossing"] = true,
	["Smash the Pumpkin"] = true,
	["Stop the Fires!"] = true,
	["Striking Back"] = true,
	["Summon Ahune"] = true,
	["There and Back Again!"] = true,
	["This One Time, When I Was Drunk..."] = true,
}

----------------------------------------------------------------------------------------------------
-- helper functions
----------------------------------------------------------------------------------------------------

local function IsQuestEnabled(name)
	if AutoQuestSave.overrideList[name:lower()] ~= nil then
		return AutoQuestSave.overrideList[name:lower()]
	elseif dailyList[name] ~= nil then
		return dailyList[name]
	elseif repeatableList[name] ~= nil then
		return repeatableList[name][2]
	elseif fateList[name] ~= nil then
		return fateList[name]
	end
	return true
end

----------------------------------------------------------------------------------------------------
-- handling going through quest/gossip windows
----------------------------------------------------------------------------------------------------
local eventFrame = CreateFrame("frame")

-- return true if a quest is complete
local function IsQuestComplete(name, level)
	-- check repeatable quests first in case the quest log doesn't show it as completed
	local quest_info = repeatableList[name]
	if quest_info then
		if quest_info == nil or (quest_info.level and quest_info.level ~= level) then
			return nil
		end
		for i,item in ipairs(quest_info[1]) do
			if GetItemCount(item[1]) < item[2] then
				return nil
			end
		end
		return true
	end
	-- go through the quest log to see if it's there
	for i=1, GetNumQuestLogEntries() do
		local title, _, _, _, _, _, complete = GetQuestLogTitle(i)
		if title == name then
			return (complete == 1 or GetNumQuestLeaderBoards(i) == 0) -- "LeaderBoards" are objectives
		end
	end
	return nil
end

-- handling events
local acceptedQuests = {} -- temporary table of accepted quests to prevent accepting them twice
eventFrame:SetScript("OnEvent", function(self, event)
	if IsModifierKeyDown() then return end
	-- search for quests when talking to a quest giver - method 1
	if event == "GOSSIP_SHOW" then
		if not AutoQuestSave.autoComplete and not AutoQuestSave.autoAccept then
			return
		end
		acceptedQuests = {}
		local name, level
		local on_quest
		-- check active quests
		on_quest = 1
		repeat
			name, level = select(1 + ((on_quest-1)*4), GetGossipActiveQuests())
			if name  and type(name) == "string" and IsQuestEnabled(name) and IsQuestComplete(name, level) then
				SelectGossipActiveQuest(on_quest)
				return
			end
			on_quest = on_quest + 1
		until not name
		-- check available quests
		on_quest = 1
		repeat
			name, level = select(1 + ((on_quest-1)*5), GetGossipAvailableQuests())
			if name and type(name) == "string" and not acceptedQuests[name] and IsQuestEnabled(name) then
				acceptedQuests[name] = true
				if (AutoQuestSave.autoDaily and dailyList[name])
				or (AutoQuestSave.autoFate and fateList[name])
				or AutoQuestSave.autoAccept
				or IsQuestComplete(name, level) then
					SelectGossipAvailableQuest(on_quest)
				end
			end
			on_quest = on_quest + 1
		until not name
		return
	end

	-- search for quests when talking to a quest giver - method 2
	if event == "QUEST_GREETING" then
		if not AutoQuestSave.autoComplete and not AutoQuestSave.autoAccept then
			return
		end
		local name, level
		for i=1,GetNumActiveQuests() do
			name = GetActiveTitle(i)
			level = GetActiveLevel(i)
			if IsQuestEnabled(name) and IsQuestComplete(name, level) then
				SelectActiveQuest(i)
				return
			end
		end
		return
	end

	-- when the quest giver explains and offers the quest - autoaccept if needed
	if event == "QUEST_DETAIL" then
		local name = GetTitleText()
		if IsQuestEnabled(name) then
			if AutoQuestSave.autoAccept 
			or (AutoQuestSave.autoDaily and dailyList[name])
			or (AutoQuestSave.autoFate and fateList[name])
			or IsQuestComplete(name, 60) then
				acceptedQuests[name] = true
				AcceptQuest()
			end
		end
		return
	end

	-- going through quest complete windows
	if event == "QUEST_PROGRESS" then
		if AutoQuestSave.autoComplete and IsQuestEnabled(GetTitleText()) and IsQuestCompletable() then
			CompleteQuest()
		end
		return
	end
	if event == "QUEST_COMPLETE" then
		if AutoQuestSave.autoComplete and IsQuestEnabled(GetTitleText()) and GetNumQuestChoices() == 0 then
			GetQuestReward()
		end
		return
	end

	-- set faction-specific quests and set up default settings if needed
	if event == "PLAYER_ENTERING_WORLD" then
		eventFrame:UnregisterEvent(event)

		if UnitFactionGroup("player") == "Horde" then
			repeatableList["One Commendation Signet"]  = { {{21438, 1}}, false}
			repeatableList["Oshu'gun Crystal Powder"]  = { {{26042, 20}}, true}
			repeatableList["Ten Commendation Signets"] = { {{21438, 10}}, true}
		else
			repeatableList["One Commendation Signet"]  = { {{21436, 1}}, false}
			repeatableList["Oshu'gun Crystal Powder"]  = { {{26043, 20}}, true}
			repeatableList["Ten Commendation Signets"] = { {{21436, 10}}, true}
		end

		if AutoQuestSave              == nil then AutoQuestSave              = {}    end
		if AutoQuestSave.autoAccept   == nil then AutoQuestSave.autoAccept   = false end
		if AutoQuestSave.autoDaily    == nil then AutoQuestSave.autoDaily    = true  end
		if AutoQuestSave.autoFate     == nil then AutoQuestSave.autoFate     = true  end
		if AutoQuestSave.autoRepeat   == nil then AutoQuestSave.autoRepeat   = true  end
		if AutoQuestSave.autoComplete == nil then AutoQuestSave.autoComplete = true  end
		if AutoQuestSave.overrideList == nil then AutoQuestSave.overrideList = {}    end

		AutoQuestSave.overrideList["Allegiance to the Aldor"] = false
		AutoQuestSave.overrideList["Allegiance to the Scryers"] = false
		return
	end
end)

eventFrame:RegisterEvent("GOSSIP_SHOW")           -- to search through quest giver's quests
eventFrame:RegisterEvent("QUEST_GREETING")        -- to search through quest giver's quests
eventFrame:RegisterEvent("QUEST_PROGRESS")        -- to complete a quest
eventFrame:RegisterEvent("QUEST_DETAIL")          -- to accept a quest
eventFrame:RegisterEvent("QUEST_COMPLETE")        -- to accept the reward
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD") -- temporary - to get the player's faction and set default settings

----------------------------------------------------------------------------------------------------
-- slash command
----------------------------------------------------------------------------------------------------
_G.SLASH_AUTOQUEST1 = "/autoquest"
_G.SLASH_AUTOQUEST2 = "/aq"
function SlashCmdList.AUTOQUEST(input)
	input = input or ""
	local command, value = input:lower():match("%s*(%S+)%s*(.*)%s*$")

	local ON_TEXT  = "|cff00FF00ON|r"
	local OFF_TEXT = "|cffFF0000OFF|r"

	if command == "complete" or command == "autocomplete" then
		if value == "on" then
			AutoQuestSave.autoComplete = true
		elseif value == "off" then
			AutoQuestSave.autoComplete = false
		else
			DEFAULT_CHAT_FRAME:AddMessage('Syntax: /aq complete <"on"|"off">')
		end
		DEFAULT_CHAT_FRAME:AddMessage("Automatically completing quests is now " .. (AutoQuestSave.autoComplete and ON_TEXT or OFF_TEXT) .. ".")
		return
	end

	if command == "daily" or command == "autodaily" then
		if value == "on" then
			AutoQuestSave.autoDaily = true
		elseif value == "off" then
			AutoQuestSave.autoDaily = false
		else
			DEFAULT_CHAT_FRAME:AddMessage('Syntax: /aq daily <"on"|"off">')
		end
		DEFAULT_CHAT_FRAME:AddMessage("Automatically accepting daily quests is now " .. (AutoQuestSave.autoDaily and ON_TEXT or OFF_TEXT) .. ".")
		return
	end

	if command == "fate" or command == "autofate" then
		if value == "on" then
			AutoQuestSave.autoFate = true
		elseif value == "off" then
			AutoQuestSave.autoFate = false
		else
			DEFAULT_CHAT_FRAME:AddMessage('Syntax: /aq fate <"on"|"off">')
		end
		DEFAULT_CHAT_FRAME:AddMessage("Automatically accepting fate quests is now " .. (AutoQuestSave.autoFate and ON_TEXT or OFF_TEXT) .. ".")
		return
	end

	if command == "accept" or command == "autoaccept" then
		if value == "on" then
			AutoQuestSave.autoAccept = true
		elseif value == "off" then
			AutoQuestSave.autoAccept = false
		else
			DEFAULT_CHAT_FRAME:AddMessage('Syntax: /aq accept <"on"|"off">')
		end
		DEFAULT_CHAT_FRAME:AddMessage("Automatically accepting all quests is now " .. (AutoQuestSave.autoAccept and ON_TEXT or OFF_TEXT) .. ".")
		return
	end

	if command == "repeat" or command == "repeatable" or command == "autorepeat" then
		if value == "on" then
			AutoQuestSave.autoRepeat = true
		elseif value == "off" then
			AutoQuestSave.autoRepeat = false
		else
			DEFAULT_CHAT_FRAME:AddMessage('Syntax: /aq repeat <"on"|"off">')
		end
		DEFAULT_CHAT_FRAME:AddMessage("Automatically accepting repeatable quests (if you have the required items) is now " .. (AutoQuestSave.autoRepeat and ON_TEXT or OFF_TEXT) .. ".")
		return
	end

	if command == "toggle" then
		if value == "" then
			DEFAULT_CHAT_FRAME:AddMessage("Syntax: /aq toggle <quest name>")
		else
			local enabled = not IsQuestEnabled(value) -- toggle it
			AutoQuestSave.overrideList[value] = enabled
			DEFAULT_CHAT_FRAME:AddMessage("Automating the quest [" .. value .. "] has been " .. (enabled and "enabled." or "disabled."))
		end
		return
	end

	if command == "remove" then
		if value == "" then
			DEFAULT_CHAT_FRAME:AddMessage("Syntax: /aq remove <quest name>")
		elseif AutoQuestSave.overrideList[value] == nil then
			DEFAULT_CHAT_FRAME:AddMessage("You haven't toggled a quest called [" .. value .. "] on or off yet.")
		else
			AutoQuestSave.overrideList[value] = nil
			DEFAULT_CHAT_FRAME:AddMessage("The custom automation settings for [" .. value .. "] has been removed.")
		end
		return
	end

	DEFAULT_CHAT_FRAME:AddMessage("AutoQuest commands:", 1, 1, 0)
	DEFAULT_CHAT_FRAME:AddMessage('/aq [accept,daily,fate,repeat,complete] <"on"|"off">')
	DEFAULT_CHAT_FRAME:AddMessage('/aq toggle <quest name>')
	DEFAULT_CHAT_FRAME:AddMessage(" ")
	DEFAULT_CHAT_FRAME:AddMessage(string.format(
		"AutoAccept:[%s], AutoDaily:[%s], AutoFate:[%s], AutoRepeat:[%s], AutoComplete:[%s]",
		AutoQuestSave.autoAccept and ON_TEXT or OFF_TEXT,
		AutoQuestSave.autoDaily and ON_TEXT or OFF_TEXT,
		AutoQuestSave.autoFate and ON_TEXT or OFF_TEXT,
		AutoQuestSave.autoRepeat and ON_TEXT or OFF_TEXT,
		AutoQuestSave.autoComplete and ON_TEXT or OFF_TEXT
	))
end

