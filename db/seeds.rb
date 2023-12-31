# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'pry'
require 'json'
require 'open-uri'

url = "https://api.unsplash.com/collections/1284213/photos/?client_id=#{ENV['CLIENT_ID']}&count=30"
photos_serialized = URI.open(url).read
photos = JSON.parse(photos_serialized)

User.destroy_all
Quest.destroy_all

marnie = User.create!(username: 'marnie', role: 'dm', profile: 'I am one of the founding Quest Masters', purse: 18500, email: 'marnie@gmail.com', password: 'testing', level: '33', abilities: 'Fire Blast, Ice Barrier, Cone of Cold', character_class: 'Mage', stats: {'str' => 4, 'dex' => 2, 'int' => 10})
david = User.create!(username: 'david', role: 'dm', profile: 'I am one of the founding Quest Masters', purse: 25500, email: 'david@gmail.com', password: 'testing', level: '33', abilities: 'Sinister Strike, Vanish, Gouge', character_class: 'Rogue', stats: {'str' => 10, 'dex' => 20, 'int' => 8})
brian = User.create!(username: 'brian', role: 'dm', profile: 'I am one of the founding Quest Masters', purse: 50000, email: 'brian@gmail.com', password: 'testing', level: '33', abilities: 'Immolate, Shadowbolt, Curse of Agony', character_class: 'Warlock', stats: {'str' => 10, 'dex' => 5, 'int' => 16})
hieu = User.create!(username: 'hieu', role: 'dm', profile: 'I am one of the founding Quest Masters', purse: 15000, email: 'hieu@gmail.com', password: 'testing', level: '33', abilities: 'Arcane Shot, Serpents Sting, Scattershot', character_class: 'Hunter', stats: {'str' => 10, 'dex' => 20, 'int' => 15})

bravewarrior = User.create!(username: 'bravewarrior', role: 'adventurer', profile: 'I am a brave warrior seeking new adventures!', purse: 0, email: 'bravewarrior@gmail.com', password: 'testing', level: 25, abilities: 'Sword Slash, Shield Bash, Whirlwind Strike', character_class: 'Barbarian', stats: {'str' => 35, 'dex' => 20, 'int' => 8})
mysteriousmage = User.create!(username: 'mysteriousmage', role: 'adventurer', profile: 'I am a mysterious mage wielding powerful arcane magic!', purse: 800, email: 'mysteriousmage@gmail.com', password: 'testing', level: 18, abilities: 'Fireball, Frost Nova, Arcane Missile', character_class: 'Mage', stats: {'str' => 10, 'dex' => 15, 'int' => 40})
skilledhunter = User.create!(username: 'skilledhunter', role: 'adventurer', profile: 'I am a skilled hunter, tracking my prey across the lands!', purse: 600, email: 'skilledhunter@gmail.com', password: 'testing', level: 15, abilities: 'Aimed Shot, Multi-Shot, Steady Shot', character_class: 'Hunter', stats: {'str' => 25, 'dex' => 35, 'int' => 12})
cunningrogue = User.create!(username: 'cunningrogue', role: 'adventurer', profile: 'I am a cunning rogue, striking from the shadows!', purse: 1000, email: 'cunningrogue@gmail.com', password: 'testing', level: 22, abilities: 'Backstab, Stealth, Eviscerate', character_class: 'Rogue', stats: {'str' => 18, 'dex' => 40, 'int' => 15})
devotedcleric = User.create!(username: 'devotedcleric', role: 'adventurer', profile: 'I am a devoted cleric, healing the wounded and aiding my allies!', purse: 1400, email: 'adventurer5@example.com', password: 'testing', level: 30, abilities: 'Heal, Divine Protection, Smite', character_class: 'Cleric', stats: {'str' => 15, 'dex' => 20, 'int' => 38})
quest1 = Quest.new(name: "The Enigma of the Eclipsed Monolith", description: "A mysterious monolith has suddenly appeared in the heart of the Old Ruins, its dark surface gleaming under the moonlight. The locals whisper of ancient prophecies and arcane knowledge engraved upon its surface. The quest calls for a skilled Mage and a nimble Rogue to investigate the enigma and decipher its hidden secrets, for the fate of the realm may lie within its obsidian core.", requirement: "Mage, Rogue", location: "Old Ruins", reward: 500, user: marnie)
file = URI.open(photos[1]["urls"]["regular"])
quest1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest1.save
quest2 = Quest.new(name: "Sunken Riches", description: "Rumors abound of an underwater cave concealed along the treacherous Coastal Cave. Within its depths rests a fabled treasure lost to the annals of time. The quest beckons the prowess of a skilled Hunter and the unyielding virtue of a noble Paladin to navigate the murky waters, overcome perilous trials, and lay claim to the sunken riches.", requirement: "Hunter, Paladin", location: "Coastal cave", reward: 600, user: david)
file = URI.open(photos[2]["urls"]["regular"])
quest2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest2.save
quest3 = Quest.new(name: "Cursed Forest's Redemption", description: "A malevolent curse shrouds the once lush and vibrant Cursed Forest, transforming it into a haunted realm of darkness and despair. Legend speaks of a powerful Warlock and a devoted Cleric, whose combined magical abilities may dispel the wicked enchantment and restore life to the withering forest. The quest calls upon these chosen heroes to venture into the heart of darkness and bring hope back to the cursed land.", requirement: "Warlock, Cleric", location: "Cursed Forest", reward: 700, user: brian)
file = URI.open(photos[3]["urls"]["regular"])
quest3.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest3.save
quest4 = Quest.new(name: "Bloodmoon: Hunt for the Vampire Lord", description: "A reign of terror descends upon the Castle Ruins as a malevolent vampire lord emerges from the shadows, preying upon innocent souls under the blood-red moon. In this dire hour, only a fearsome Barbarian, with unmatched combat prowess, can stand against the creature of the night and bring forth an everlasting dawn to the land.", requirement: "Barbarian", location: "Castle ruins", reward: 400, user: hieu)
file = URI.open(photos[4]["urls"]["regular"])
quest4.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest4.save
quest5 = Quest.new(name: "Enchanted Forest: Grove of the Whispering Trees", description: "Deep within the Enchanted Forest lies the Grove of the Whispering Trees, where ancient secrets are said to be guarded. This quest calls for a group of adventurers, including a wise Druid, a skilled Tracker, and an empathetic Animal Communicator, to commune with the mystical trees, decipher their messages, and unlock the forest's hidden knowledge.", requirement: "Druid, Tracker, Animal Communicator", location: "Grove of the Whispering Trees", reward: 1800, user: brian)
file = URI.open(photos[5]["urls"]["regular"])
quest5.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest5.save
quest6 = Quest.new(name: "The Princess's Embrace", description: "Under the pale moonlight, the princess of the realm has been abducted and imprisoned deep within the treacherous Ogre Cave. This perilous rescue mission demands the finesse of a cunning Mage and the agile skill of a seasoned Rogue to infiltrate the lair, outwit the fearsome ogres, and return the princess to her rightful place.", requirement: "Mage, Rogue", location: "Ogre Cave", reward: 500, user: marnie)
file = URI.open(photos[6]["urls"]["regular"])
quest6.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest6.save
quest7 = Quest.new(name: "Spectres of the Haunted Harbor", description: "An ethereal apparition, the Ghost Ship, haunts the mist-laden waters of the Haunted Harbor. Whispered to carry lost souls, the eerie vessel awaits brave souls to unravel its haunting mysteries. The quest seeks the talents of a soulful Bard, whose melodious charm and the dexterity of a skilled Rogue may quell the spirits and guide them towards eternal rest.", requirement: "Bard, Rogue", location: "Haunted Harbor", reward: 800, user: david)
file = URI.open(photos[7]["urls"]["regular"])
quest7.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest7.save
quest8 = Quest.new(name: "Jewels of the Desert", description: "Lost within the endless expanse of the Desert Ruins lies a fabled trove of jewels, guarded by ancient traps and enigmatic riddles. The quest demands the survival instincts of a resilient Warlock and the keen senses of a sharp-eyed Hunter to navigate the treacherous dunes and unlock the secrets of the arid realm.", requirement: "Warlock, Hunter", location: "Desert Ruins", reward: 900, user: brian)
file = URI.open(photos[8]["urls"]["regular"])
quest8.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest8.save
quest9 = Quest.new(name: "The Forgotten Temple's Revelation", description: "Concealed amidst the dense foliage of the Jungle Temple, a forgotten realm of mystery awaits those willing to brave its intricate puzzles and tests of faith. The quest seeks the divine guidance of a noble Paladin and the unwavering devotion of a wise Cleric to unveil the temple's ancient secrets and restore its sacred purpose.", requirement: "Paladin, Cleric", location: "Jungle Temple", reward: 1000, user: hieu)
file = URI.open(photos[9]["urls"]["regular"])
quest9.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest9.save
quest10 = Quest.new(name: "The Pirate's Plunder", description: "Within the treacherous Pirate Cove, a band of ruthless pirates hoards their ill-gotten treasure. Only a cunning Mage and an alluring Bard, wielding spells and enchanting melodies, can sway the pirates' hearts and minds, unlocking the path to their hidden plunder.", requirement: "Mage, Bard", location: "Pirate Cove", reward: 650, user: marnie)
file = URI.open(photos[1]["urls"]["regular"])
quest10.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest10.save
quest11 = Quest.new(name: "Arcane Alchemy", description: "The Wizard's Tower stands as an enigmatic monument to arcane mastery and magical experimentation. Within its walls, untold mysteries and wonders await those with the wit of a crafty Warlock and the nimble agility of a skilled Rogue. The quest invites these audacious individuals to participate in the wizard's alchemical pursuits and unravel the secrets that lay locked within.", requirement: "Warlock, Rogue", location: "Wizard's Tower", reward: 700, user: david)
file = URI.open(photos[1]["urls"]["regular"])
quest11.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest11.save
quest12 = Quest.new(name: "The Enchanted Grove: Guardian of the Forest", description: "Within the Enchanted Grove, a mystical forest said to be protected by ancient spirits, an ominous presence threatens to disrupt the harmony of nature. The quest summons a noble Paladin and a wise Cleric to dispel the darkness and restore the guardian's balance, for the fate of the realm rests upon the sanctuary of the forest.", requirement: "Paladin, Cleric", location: "Enchanted Grove", reward: 750, user: marnie)
file = URI.open(photos[2]["urls"]["regular"])
quest12.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest12.save
quest13 = Quest.new(name: "Ancient Jungle Ruins: Heart of the Serpent", description: "Deep within the dense jungle, hidden in the ruins of an ancient civilization, lies the Heart of the Serpent – a mysterious artifact of immense power. This quest requires the skills of an agile Rogue, a fearless Ranger, and a knowledgeable Archaeologist to navigate the treacherous traps, fend off jungle creatures, and unlock the artifact's secrets.", requirement: "Rogue, Ranger, Archaeologist", location: "Ancient Jungle Ruins", reward: 1800, user: hieu)
file = URI.open(photos[3]["urls"]["regular"])
quest13.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest13.save
quest14 = Quest.new(name: "Frozen Destiny: Journey to the Ice Citadel", description: "A mysterious ice citadel, cloaked in eternal frost, has surfaced in the Arctic Wastes. The quest implores a daring Mage and an agile Rogue to navigate the perilous frozen landscape, decipher ancient runes, and unveil the truth behind the citadel's chilling origins.", requirement: "Mage, Rogue", location: "Ice Citadel", reward: 850, user: david)
file = URI.open(photos[4]["urls"]["regular"])
quest14.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest14.save
quest15 = Quest.new(name: "The Shifting Sands: A Desert Mirage", description: "The shifting sands of the Mirage Desert conceal a long-lost oasis rumored to hold untold riches and magical wonders. The quest beckons the talents of a resourceful Bard and a sharp-eyed Hunter to survive the ever-changing dunes, decode ancient inscriptions, and unearth the secrets of the ephemeral oasis.", requirement: "Bard, Hunter", location: "Mirage Desert", reward: 950, user: brian)
file = URI.open(photos[5]["urls"]["regular"])
quest15.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest15.save
quest16 = Quest.new(name: "Rise of the Dragonheart: The Ancient Volcano", description: "In the heart of the Ancient Volcano, where molten lava flows like a river, a slumbering dragonheart lies dormant. The quest calls upon the courage of a valiant Paladin and the mastery of a skilled Warlock to awaken the ancient spirit and forge a bond between dragon and champion, fated to defend the realm from impending doom.", requirement: "Paladin, Warlock", location: "Ancient Volcano", reward: 1100, user: hieu)
file = URI.open(photos[6]["urls"]["regular"])
quest16.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest16.save
quest17 = Quest.new(name: "Desert Sands: Oasis of the Enchantress", description: "In the scorching desert, a mythical enchantress resides in the fabled Oasis of Dreams. This quest calls for a brave Knight, an insightful Sorceress, and a resourceful Nomad to traverse the unforgiving sands, resist the desert's illusions, and seek the enchantress's wisdom.", requirement: "Knight, Sorceress, Nomad", location: "Oasis of Dreams", reward: 1600, user: brian)
file = URI.open(photos[7]["urls"]["regular"])
quest17.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest17.save
quest18 = Quest.new(name: "The Hidden Caverns", description: "Hidden beneath the verdant meadows of the Serenity Hills, a labyrinth of ancient caverns conceals forgotten relics of immense power. The quest seeks a Mage and a Rogue, whose combined intellect and agility may navigate the treacherous subterranean maze, uncover the relics, and safeguard them from falling into the wrong hands.", requirement: "Mage, Rogue", location: "Serenity Hills Caverns", reward: 600, user: marnie)
file = URI.open(photos[8]["urls"]["regular"])
quest18.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest18.save
quest19 = Quest.new(name: "Volcanic Abyss: Forge of the Firelord", description: "Beneath the fiery depths of the Volcanic Abyss, the Forge of the Firelord blazes with ancient craftsmanship. This quest implores the talents of a determined Blacksmith, a knowledgeable Alchemist, and a resilient Fire Mage to withstand the inferno, harness the forge's power, and craft legendary weapons of fire and steel.", requirement: "Blacksmith, Alchemist, Fire Mage", location: "Forge of the Firelord", reward: 1900, user: david)
file = URI.open(photos[9]["urls"]["regular"])
quest19.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest19.save
quest20 = Quest.new(name: "The Song of the Celestial Harp", description: "A celestial harp, crafted by the gods themselves, is rumored to grant the power to weave harmony and peace across the realm. The quest calls for the artistry of a gifted Bard and the wisdom of a venerable Cleric to resonate with the divine melody, unleash its benevolent force, and orchestrate a symphony of unity.", requirement: "Bard, Cleric", location: "Celestial Grove", reward: 800, user: david)
file = URI.open(photos[2]["urls"]["regular"])
quest20.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest20.save
quest21 = Quest.new(name: "The Lost Starlight: Seeking the Astral Comet", description: "A rare astral comet, said to bestow otherworldly knowledge, journeys across the night sky once every thousand years. The quest beckons a Mage and a Hunter, who, under the shimmering constellations, must follow the elusive comet's path, decode the cosmic riddles, and claim the ethereal wisdom.", requirement: "Mage, Hunter", location: "Astral Plains", reward: 950, user: brian)
file = URI.open(photos[1]["urls"]["regular"])
quest21.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest21.save
quest22 = Quest.new(name: "Tomb of the Fallen Kings", description: "Deep beneath the earth, the long-forgotten Tomb of the Fallen Kings holds untold treasures and ancient curses. This quest seeks a skilled Warrior, a wise Mage, and a cunning Thief to conquer the tomb's undead guardians, decipher forgotten scripts, and claim the lost royal relics.", requirement: "Warrior, Mage, Thief", location: "Tomb of the Fallen Kings", reward: 1900, user: david)
file = URI.open(photos[2]["urls"]["regular"])
quest22.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest22.save
quest23 = Quest.new(name: "Whispers in the Moonlight: The Lunar Enigma", description: "As the moon waxes full, whispers emerge of an enigmatic lunar artifact that holds the power to control the tides of the oceans. The quest summons the presence of a Rogue and a Warlock, who, under the cloak of moonlight, must infiltrate the ancient Lunar Citadel, evade its mysterious guardians, and unlock the secrets of the celestial relic.", requirement: "Rogue, Warlock", location: "Lunar Citadel", reward: 1050, user: hieu)
file = URI.open(photos[3]["urls"]["regular"])
quest23.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest23.save
quest24 = Quest.new(name: "Celestial Observatory: Astral Convergence", description: "During a rare astral convergence, the Celestial Observatory becomes a nexus of otherworldly energy. This quest seeks the collaboration of an adept Astrologer, a visionary Mage, and a celestial-aligned Cleric to unlock the observatory's mysteries, interpret cosmic omens, and harness the celestial powers for the realm's benefit.", requirement: "Astrologer, Mage, Cleric", location: "Celestial Observatory", reward: 2000, user: marnie)
file = URI.open(photos[4]["urls"]["regular"])
quest24.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest24.save
quest25 = Quest.new(name: "The Shadowed Wood: Realm of the Night Elves", description: "Amidst the dense foliage of the Shadowed Wood resides a hidden realm of the reclusive Night Elves, protectors of ancient knowledge. The quest calls upon the skills of a Mage and a Paladin, who, in the embrace of moonlight, must earn the trust of the elusive elves, decipher their age-old scrolls, and preserve the secrets of their mystical domain.", requirement: "Mage, Paladin", location: "Shadowed Wood", reward: 850, user: marnie)
file = URI.open(photos[5]["urls"]["regular"])
quest25.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest25.save
quest26 = Quest.new(name: "The Astral Observatory", description: "During the rare cosmic event of an eclipse, the Astral Observatory reveals an ancient gateway to other realms. The quest implores a Warlock and a Bard, harnessing the energy of the celestial alignment, to explore the interdimensional gateway, face the trials of astral realms, and bring back the knowledge of the cosmos.", requirement: "Warlock, Bard", location: "Astral Observatory", reward: 1200, user: david)
file = URI.open(photos[6]["urls"]["regular"])
quest26.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest26.save
quest27 = Quest.new(name: "Realm of Ethereal Whispers", description: "In a mystical realm shrouded in ethereal mists, an enigmatic seer holds the answers to the cosmos. This quest implores the combined talents of a gifted Illusionist, a celestial Astrologer, and a perceptive Dreamweaver to navigate the realm's shifting illusions, decode cosmic prophecies, and gain the seer's insight.", requirement: "Illusionist, Astrologer, Dreamweaver", location: "Realm of Ethereal Whispers", reward: 2000, user: marnie)
file = URI.open(photos[7]["urls"]["regular"])
quest27.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest27.save
quest28 = Quest.new(name: "Cloudtop Citadel: Skyborne Skirmish", description: "High in the floating Cloudtop Citadel, aerial battles rage between rival factions. This quest calls for a daring Sky Captain, a skilled Aeronaut, and a masterful Windshaper to navigate the floating islands, engage in skyborne combat, and secure dominion over the skies.", requirement: "Sky Captain, Aeronaut, Windshaper", location: "Cloudtop Citadel", reward: 1700, user: hieu)
file = URI.open(photos[8]["urls"]["regular"])
quest28.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest28.save
quest29 = Quest.new(name: "The Faerie's Lament", description: "Within the mystical Crystal Glade, a faerie's haunting lament resounds through the forest. The quest calls upon the grace of a Bard and the agility of a Rogue to commune with the sorrowful fae, uncover the source of their grief, and restore the glade's enchanting harmony.", requirement: "Bard, Rogue", location: "Crystal Glade", reward: 800, user: brian)
file = URI.open(photos[2]["urls"]["regular"])
quest29.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest29.save
quest30 = Quest.new(name: "Chronicle of the Sages", description: "The fabled Library of Ancients, safeguarding knowledge spanning eons, has reemerged from the depths of oblivion. The quest beckons the wisdom of a Cleric and the cunning of a Warlock to delve into the vast tomes, decipher the ancient texts, and unlock the timeless wisdom of the ages.", requirement: "Cleric, Warlock", location: "Library of Ancients", reward: 950, user: hieu)
file = URI.open(photos[5]["urls"]["regular"])
quest30.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest30.save
quest31 = Quest.new(name: "Crystal Caves: Luminescent Labyrinth", description: "In the depths of the Crystal Caves, an intricate luminescent labyrinth awaits explorers. This quest requires the cooperation of a perceptive Crystal Weaver, an adaptable Shape Shifter, and a keen-minded Cartographer to navigate the ever-changing maze, harness the crystals' radiant power, and uncover the cave's secrets.", requirement: "Crystal Weaver, Shape Shifter, Cartographer", location: "Crystal Caves", reward: 1600, user: brian)
file = URI.open(photos[1]["urls"]["regular"])
quest31.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest31.save
quest32 = Quest.new(name: "Lost City of Aegis", description: "In the desolate wastelands, the Lost City of Aegis is rumored to house an ancient relic capable of healing the land. This quest requires a group of valiant adventurers, including a seasoned Paladin, a skilled Geomancer, and a compassionate Healer to confront the city's dark guardians, mend the land, and recover the relic's power.", requirement: "Paladin, Geomancer, Healer", location: "Lost City of Aegis", reward: 1700, user: hieu)
file = URI.open(photos[2]["urls"]["regular"])
quest32.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest32.save
quest33 = Quest.new(name: "Frostfire Dominion", description: "Within the impenetrable Citadel of the Ice Dragon, an ancient frostfire elemental awaits liberation. The quest implores the courage of a Paladin and the elemental mastery of a Mage to face the chilling guardians, tame the frostfire, and harness its power for the greater good of the realm.", requirement: "Paladin, Mage", location: "Citadel of the Ice Dragon", reward: 1100, user: marnie)
file = URI.open(photos[3]["urls"]["regular"])
quest33.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
quest33.save