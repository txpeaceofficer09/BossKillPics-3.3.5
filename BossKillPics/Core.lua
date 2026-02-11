local f = CreateFrame("Frame", nil, UIParent)

local lastBossGUID = nil

local BossID = {
	-- Black Temple
	[22948] = true, -- Bloodboil
	[23418] = true, -- Essence Of Souls
	[22917] = true, -- Illidan
	[22949] = true, -- Illidari Council
	[22950] = true, -- Illidari Council
	[22951] = true, -- Illidari Council
	[22952] = true, -- Illidari Council
	[22887] = true, -- Najentus
	[22841] = true, -- Shade Of Akama
	[22947] = true, -- Shahraz
	[22898] = true, -- Supremus
	[22871] = true, -- Teron Gorefiend

	-- Chamber of Aspects
	[28860] = true, -- Sartharion
	[30451] = true, -- Shadron
	[30452] = true, -- Tenebron
	[30449] = true, -- Vesperon
	[39751] = true, -- Baltharus
	[39863] = true, -- Halion
	[39747] = true, -- Saviana
	[39746] = true, -- Zarithrian

	-- Coliseum
	[34564] = true, -- Anub'arak
	[34458] = false, -- Champions
	[34451] = false, -- Champions
	[34459] = false, -- Champions
	[34448] = false, -- Champions
	[34449] = false, -- Champions
	[34445] = false, -- Champions
	[34456] = false, -- Champions
	[34447] = false, -- Champions
	[34441] = false, -- Champions
	[34454] = false, -- Champions
	[34444] = false, -- Champions
	[34455] = false, -- Champions
	[34450] = false, -- Champions
	[34453] = false, -- Champions
	[34461] = false, -- Champions
	[34460] = false, -- Champions
	[34469] = false, -- Champions
	[34467] = false, -- Champions
	[34468] = false, -- Champions
	[34471] = false, -- Champions
	[34465] = false, -- Champions
	[34466] = false, -- Champions
	[34473] = false, -- Champions
	[34472] = false, -- Champions
	[34470] = false, -- Champions
	[34463] = false, -- Champions
	[34474] = false, -- Champions
	[34475] = false, -- Champions
	[34780] = true, -- Jaraxxus
	[34796] = true, -- Northrend Beasts
	[35144] = true, -- Northrend Beasts
	[34799] = true, -- Northrend Beasts
	[34797] = true, -- Northrend Beasts
	[34497] = true, -- Twins
	[34496] = true, -- Twins
	
	-- Eye of Eternity
	[28859] = true, -- Malygos

	-- Ice Crown Citadel
	[36853] = true, -- Sindragosa
	[36789] = true, -- Valithria
	[37970] = true, -- BP Council
	[37972] = true, -- BP Council
	[37973] = true, -- BP Council
	[37955] = true, -- Lanathel
	[36597] = true, -- Lich King
	[37813] = true, -- Deathbringer
	[36855] = true, -- Deathwhisper
	[36939] = true, -- Gunship Battle
	[37215] = true, -- Gunship Battle
	[36948] = true, -- Gunship Battle
	[37540] = true, -- Gunship Battle
	[36612] = true, -- Lord Marrowgar
	[36626] = true, -- Festergut
	[36678] = true, -- Putricide
	[36627] = true, -- Rotface

	-- Karazhan
	[16151] = true, -- Attumen
	[16152] = true, -- Attumen
	[17521] = true, -- Big Bad Wolf
	[21752] = false, -- Chess
	[21684] = false, -- Chess
	[15691] = true, -- Curator
	[16457] = true, -- Maiden Of Virtue
	[15687] = true, -- Moroes
	[16180] = true, -- Named Beasts
	[16179] = true, -- Named Beasts
	[16181] = true, -- Named Beasts
	[15689] = true, -- Netherspite
	[17225] = true, -- Nightbane
	[15690] = true, -- Prince Malchezaar
	[17534] = true, -- Romulo And Julianne
	[17533] = true, -- Romulo And Julianne
	[99999] = true, -- Romulo And Julianne
	[16524] = true, -- Shade Of Aran
	[15688] = true, -- Terestian Illhoof
	[18168] = true, -- Wizard Of Oz

	-- Molten Core
	[12057] = true, -- Garr
	[12056] = true, -- Geddon
	[12259] = true, -- Gehennas
	[11988] = true, -- Golemagg
	[12118] = true, -- Lucifron
	[11982] = true, -- Magmadar
	[12018] = true, -- Majordomo
	[11663] = true, -- Majordomo
	[11664] = true, -- Majordomo
	[11502] = true, -- Ragnaros
	[12264] = true, -- Shazzrah
	[12098] = true, -- Sulfuron

	--Naxx'ramas
	[15956] = true, -- Anub'Rekhan
	[15953] = true, -- Faerlina
	[15952] = true, -- Maexxna
	[15932] = true, -- Gluth
	[15931] = true, -- Grobbulus
	[16028] = true, -- Patchwerk
	[15928] = true, -- Thaddius
	[15990] = true, -- Kel'Thuzad
	[15989] = true, -- Sapphiron
	[16060] = true, -- Gothik
	[16063] = true, -- Horsemen
	[16064] = true, -- Horsemen
	[16065] = true, -- Horsemen
	[30549] = true, -- Horsemen
	[16061] = true, -- Razuvious
	[15936] = true, -- Heigan
	[16011] = true, -- Loatheb
	[15954] = true, -- Noth

	-- Onyxia's Lair
	[10184] = true, -- Onyxia

	-- Crypts
	[18373] = true, -- Maladaar
	[18371] = true, -- Shirrak
	[1890] = true, -- Shirrak

	-- Sethekk Halls
	[23035] = true, -- Anzu
	[18473] = true, -- Ikiss
	[1902] = true, -- Ikiss
	[18472] = true, -- Syth

	-- Shadow Labyrinth
	[18731] = true, -- Hellmaw
	[18667] = true, -- Inciter
	[18708] = true, -- Murmur
	[18732] = true, -- Vorpil

	-- Mana Tombs
	[18341] = true, -- Pandemonius
	[18344] = true, -- Shaffar
	[18343] = true, -- Tavarok
	[22930] = true, -- Yor

	--Black Morass
	[17881] = true, -- Aeonus
	[17879] = true, -- Deja
	[17880] = true, -- Temporus

	--Old Hillsbrad Foothills
	[17848] = true, -- Drake
	[18096] = true, -- Epoch Hunter
	[17862] = true, -- Skarloc

	-- Slavepens
	[17941] = true, -- Mennu
	[17942] = true, -- Quagmirran
	[17991] = true, -- Rokmar
	
	-- Steamvault
	[17798] = true, -- Kalithresh
	[17796] = true, -- Steamrigger
	[17797] = true, -- Thespia
	
	-- Underbog
	[18105] = true, -- Ghazan
	[17770] = true, -- Hungarfen
	[17826] = true, -- Muselek
	[17882] = true, -- Stalker
	
	-- Blood Furnace
	[17380] = true, -- Broggok
	[17377] = true, -- Keli'dan
	[17381] = true, -- Maker
	
	-- Ramparts
	[17306] = true, -- Gargolmar
	[17308] = true, -- Omor
	[17537] = true, -- Vazruden
	[17307] = true, -- Vazruden
	
	-- Shattered Halls
	[16808] = true, -- Kargath
	[16807] = true, -- Nethekurse
	[16809] = true, -- O'mrogg
	[20923] = true, -- Porung
	
	-- Magister's Terrace
	[24560] = true, -- Delrissa
	[24664] = true, -- Kael'thas
	[24723] = true, -- Selin
	[24744] = true, -- Vexallus
	
	-- Arcatraz
	[20885] = true, -- Dalliah
	[20912] = true, -- Skyriss
	[20886] = true, -- Soccothrates
	[20870] = true, -- Zereketh
	
	-- Botanica
	[17975] = true, -- Freywinn
	[17980] = true, -- Laj
	[17976] = true, -- Sarannis
	[17978] = true, -- Thorngrin
	[17977] = true, -- Warp Splinter
	
	-- Mechanar
	[19219] = true, -- Capacitus
	[19218] = true, -- Gyrokill
	[19710] = true, -- Ironhand
	[19220] = true, -- Pathaleon
	[19221] = true, -- Sepethrea
	
	-- Blackfathom Deeps
	[4829] = true, -- Akumai
	[6243] = true, -- Gelihast
	[4887] = true, -- Ghamoo'Ra
	[4831] = true, -- Lady Serevess
	[4830] = true, -- Old Serrakis
	[4832] = true, -- Twilight Lord Kelris
	
	-- Blackrock Depths
	[9156] = true, -- Ambassador Flamelash
	[9016] = true, -- Bael Gar
	[9019] = true, -- Emperor Dagran Thaurissan
	[9056] = true, -- Fineous Darkvire
	[9033] = true, -- General Angerforge
	[9018] = true, -- Gerstahn
	[8983] = true, -- Golem Lord Argelmach
	[9319] = true, -- Houndmaster Grebmar
	[9537] = true, -- Hurley Blackbreath
	[9017] = true, -- Lord Incendius
	[9025] = true, -- Lord Roccor
	[9938] = true, -- Magmus
	[9502] = true, -- Phalanx
	[9499] = true, -- Plugger Spazzring
	[9024] = true, -- Pyromancer Loregrain
	[9028] = true, -- Ring of Law
	[9031] = true, -- Ring of Law
	[9029] = true, -- Ring of Law
	[9030] = true, -- Ring of Law
	[9032] = true, -- Ring of Law
	[9027] = true, -- Ring of Law
	[9035] = true, -- The Seven
	[9039] = true, -- The Seven
	[9040] = true, -- The Seven
	[9037] = true, -- The Seven
	[9034] = true, -- The Seven
	[9038] = true, -- The Seven
	[9036] = true, -- The Seven
	[9041] = true, -- Warden Stilgiss
	
	-- Deadmines
	[647] = true, -- Captain Greenskin
	[645] = true, -- Cookie
	[639] = true, -- Edwin Van Cleef
	[1763] = true, -- Gilnid
	[3586] = true, -- Miner Johnson
	[646] = true, -- Mr Smite
	[644] = true, -- Rhahk Zor
	[642] = true, -- Sneeds Shredder
	[643] = true, -- Sneeds Shredder
	
	-- Dire Maul
	[11492] = true, -- Alzzin
	[14325] = true, -- Captain Kromcrush
	[14324] = true, -- Cho'Rush
	[14321] = true, -- Guard Fengus
	[14326] = true, -- Guard Moldar
	[14323] = true, -- Guard Slipkik
	[13280] = true, -- Hydrospawn
	[11488] = true, -- Illyanna Ravensoak
	[11496] = true, -- Immolthar
	[11501] = true, -- King Gordok
	[14327] = true, -- Lethtendris
	[11487] = true, -- Magister Kelendris
	[11486] = true, -- Prince Tortheldrin
	[14322] = true, -- Stomper Kreeg
	[11489] = true, -- Tendris Warpwood
	[11490] = true, -- Zevrim Thornhoof
	
	-- Gnomeregan
	[6229] = true, -- Crowd Pummeler
	[6235] = true, -- Electrocutioner 6000
	[7361] = true, -- Grubbis
	[7800] = true, -- Mekgineer Thermaplugg
	[7079] = true, -- Viscous Fallout
	
	-- Lower Blackrock Spire
	[10268] = true, -- Gizrul
	[10220] = true, -- Halycon
	[9196] = true, -- Highlord Omokk
	[10596] = true, -- Mother Smolderweb
	[9568] = true, -- Overlord Wyrmthalak
	[9736] = true, -- Quartermaster Zigris
	[9236] = true, -- Shadow Hunter Voshgajin
	[10584] = true, -- Urok Doomhowl
	[9237] = true, -- War Master Voone
	
	-- Maraudon
	[12225] = true, -- Celebras the Cursed
	[12203] = true, -- Landslide
	[12236] = true, -- Lord Vyletongue
	[13282] = true, -- Noxxion
	[12201] = true, -- Princess Theradras
	[12258] = true, -- Razorlash
	[13596] = true, -- Rotgrip
	[13601] = true, -- Tinkerer Gizlock
	
	-- Ragefire Chasm
	[11519] = true, -- Bazzalan
	[11518] = true, -- Jergosh
	[11517] = true, -- Oggleflint
	[11520] = true, -- Taragaman
	
	--Razorfen Downs
	[7358] = true, -- Amnennarthe Coldbringer
	[8567] = true, -- Glutton
	[7357] = true, -- Mordresh Fire Eye
	[7356] = true, -- Plaguemaw the Rotting
	[7354] = true, -- Ragglesnout
	[7355] = true, -- Tutenkash
	
	-- Razorfen Kraul
	[4422] = true, -- Agathelos the Raging
	[4424] = true, -- AggemThorncurse
	[4425] = true, -- Blind Hunter
	[4421] = true, -- Charlga Razorflank
	[4428] = true, -- Death Speaker Jargba
	[4842] = true, -- Earthcaller Halmgar
	[4420] = true, -- Overlord Ramtusk
	[6168] = true, -- Roogug
	
	-- Scarlet Monastery
	[6487] = true, -- Arcanist Doan
	[4543] = true, -- Bloodmage Thalnos
	[3975] = true, -- Herod
	[4542] = true, -- High Inquisitor Fairbanks
	[3974] = true, -- Houndmaster Loksey
	[3983] = true, -- Interrogator Vishas
	[3977] = true, -- Mograine and Whitemane
	[3976] = true, -- Mograine and Whitemane
	[99999] = true, -- Mograine and Whitemane
	
	-- Scholomance
	[1853] = true, -- Darkmaster Gandling
	[11261] = true, -- Doctor Theolen Krastinov
	[10505] = true, -- Instructor Malicia
	[10503] = true, -- Jandice Barov
	[10506] = true, -- Kirtonos the Herald
	[10502] = true, -- Lady Illucia Barov
	[10504] = true, -- Lord Alexei Barov
	[10901] = true, -- Lorekeeper Polkelt
	[10433] = true, -- Marduk Blackpool
	[10508] = true, -- Ras Frostwhisper
	[11622] = true, -- Rattlegore
	[10507] = true, -- The Ravenian
	[10432] = true, -- Vectus
	
	-- Shadowfang Keep
	[4275] = true, -- Archmage Arugal
	[3887] = true, -- Baron Silverlaine
	[4278] = true, -- Commander Springvale
	[3872] = true, -- Deathsworn Captain
	[4274] = true, -- Fenrus the Devourer
	[4279] = true, -- Odo the Blindwatcher
	[3886] = true, -- Razorclaw the Butcher
	[3914] = true, -- Rethilgore
	[3927] = true, -- Wolf Master Nandos
	
	-- Stormwind Stockades
	[1716] = true, -- Bazil Thredd
	[1720] = true, -- Bruegal Ironknuckle
	[1663] = true, -- Dextren Ward
	[1717] = true, -- Hamhock
	[1666] = true, -- Kam Deepfury
	[1696] = true, -- Targorr
	
	-- Stratholme
	[10812] = true, -- Balnazzar
	[10813] = true, -- Balnazzar
	[10436] = true, -- Baroness Anastari
	[11032] = true, -- Commander Malor
	[10558] = true, -- Hearthsinger Forresten
	[10811] = true, -- Instructor Galford
	[10440] = true, -- Lord Aurius Rivendare
	[10435] = true, -- Magistrate Barthilas
	[10438] = true, -- Maleki the Pallid
	[10437] = true, -- Narubenkan
	[10439] = true, -- Ramstein the Gorger
	[10516] = true, -- The Unforgiven
	[10808] = true, -- Timmy the Cruel
	[10997] = true, -- Willey Hopebreaker
	
	-- Sunken Temple
	[8443] = true, -- Avatar of Hakkar
	[5721] = true, -- Dreamscythe
	[5722] = true, -- Hazzas
	[5710] = true, -- Jammalan the Prophet
	[5719] = true, -- Morphaz
	[5709] = true, -- Shade of Eranikus
	[5720] = true, -- Weaver
	
	-- Uldaman
	[7206] = true, -- Ancient StoneKeeper
	[2748] = true, -- Archaedas
	[7291] = true, -- Galgann Firehammer
	[4854] = true, -- Grimlok
	[7228] = true, -- Ironaya
	[7023] = true, -- Obsidian Sentinel
	[6910] = true, -- Revelosh
	[6906] = true, -- The Lost Dwarves
	[6907] = true, -- The Lost Dwarves
	[6908] = true, -- The Lost Dwarves
	
	-- Upper Blackrock Spire
	[10363] = true, -- General Drakkisath
	[10899] = true, -- Goraluk Anvilcrack
	[10509] = true, -- Jed Runewatcher
	[9816] = true, -- Pyroguard Emberseer
	[10264] = true, -- Solakar Flamewreath
	[10430] = true, -- TheBeast
	[10339] = true, -- Warchief Rend Blackhand
	[10429] = true, -- Warchief Rend Blackhand
	
	-- Wailing Caverns
	[5912] = true, -- Deviate Faerie Dragon
	[3653] = true, -- Kresh
	[3671] = true, -- Lady Anacondra
	[3669] = true, -- Lord Cobrahn
	[3670] = true, -- Lord Pythas
	[3673] = true, -- Lord Serpentis
	[3654] = true, -- Mutanus the Devourer
	[3674] = true, -- Skum
	[5775] = true, -- Veran the Everliving
	
	-- Zul'Farrak
	[8127] = true, -- Antusul
	[7267] = true, -- Chief Ukorz Sandscalp
	[7273] = true, -- Gahzrilla
	[7795] = true, -- Hydromancer Velrath
	[7796] = true, -- Nekrum Sezzziz
	[7275] = true, -- Nekrum Sezzziz
	[7272] = true, -- Theka the Martyr
	[7271] = true, -- Witch Doctor Zumrah
	
	-- Ahn'Kahet
	[30258] = true, -- Amanitar
	[29310] = true, -- Jedoga Shadowseeker
	[29309] = true, -- Nadox
	[29308] = true, -- Taldaram
	[29311] = true, -- Volazj
	
	-- AzjolNerub
	[29120] = true, -- Anubarak
	[28921] = true, -- Hadronox
	[28684] = true, -- Krikthir
	
	-- DrakTharon
	[27483] = true, -- Dred
	[26631] = true, -- Novos The Summoner
	[26632] = true, -- Prophet Tharonja
	[26630] = true, -- Trollgore
	
	-- Forge of Souls
	[36497] = true, -- Bronjahm
	[36502] = true, -- Devourer of Souls
	
	--Gundrak
	[29307] = true, -- Bloodstone Annihilator
	[29932] = true, -- Eck
	[29306] = true, -- Galdarah
	[29305] = true, -- Moorabi
	[29304] = true, -- Sladran
	
	-- Halls of Lightning
	[28586] = true, -- Bjarngrin
	[28546] = true, -- Ionar
	[28923] = true, -- Loken
	[28587] = true, -- Volkhan
	
	-- Halls of Stone
	[28070] = false, -- Brann Bronzebeard
	[27977] = true, -- Krystallus
	[27975] = true, -- Maiden Of Grief
	[27978] = true, -- Sjonnir The Ironshaper
	
	-- Halls of Reflection
	[38112] = true, -- Falric
	[38113] = true, -- Marwyn
	[30658] = false, -- WaveTimers
	
	-- Culling of Stratholme
	[26532] = true, -- Chrono Lord Epoch
	[26533] = true, -- Mal'Ganis
	[26529] = true, -- Meathook
	[26530] = true, -- Salramm The Flesh Crafter
	
	-- Pit of Saron
	[36494] = true, -- Forgemaster Garfrost
	[36476] = true, -- Ick
	[36658] = true, -- Scourgelord Tyrannus
	[36661] = true, -- Scourgelord Tyrannus
	
	-- The Nexus
	[26763] = true, -- Anomalus
	[26798] = true, -- Commander
	[26796] = true, -- Commander
	[26731] = true, -- Grand Magus Telestra
	[26723] = true, -- Keristrasza
	[26794] = true, -- Ormorok The Tree Shaper
	
	-- The Oculus
	[27654] = true, -- Drakos The Interrogator
	[27656] = true, -- Ley Guardian Eregos
	[27655] = true, -- Mage Lord Urom
	[27447] = true, -- Varos Cloudstrider
	
	-- Trial of the Champion
	[35451] = true, -- Black Knight
	[10000] = true, -- Black Knight
	[34657] = false, -- Champions
	[34701] = false, -- Champions
	[34702] = false, -- Champions
	[34703] = false, -- Champions
	[34705] = false, -- Champions
	[35569] = false, -- Champions
	[35570] = false, -- Champions
	[35571] = false, -- Champions
	[35572] = false, -- Champions
	[35617] = false, -- Champions
	[34928] = true, -- Confessor
	[35119] = true, -- Eadric the Pure
	
	-- Utgarde Keep
	[24200] = true, -- Constructor And Controller
	[24201] = true, -- Constructor And Controller
	[23980] = true, -- Ingvar The Plunderer
	[23954] = true, -- Ingvar The Plunderer
	[23953] = true, -- Keleseth
	
	-- Utgarde Pinnacle
	[26687] = true, -- Gortok Palehoof
	[26693] = true, -- Skadi The Ruthless
	[29281] = true, -- Svala Sorrowgrave
	[26861] = true, -- Ymiron
	
	-- Violet Hold
	[31134] = true, -- Cyanigosa
	[29315] = true, -- Erekem
	[29313] = true, -- Ichoron
	[29312] = true, -- Lavanthor
	[29316] = true, -- Moragg
	[30658] = false, -- Portal Timers
	[29266] = true, -- Xevoss
	[29314] = true, -- Zuramat
	
	-- Sunwell Plateau
	[24882] = true, -- Brutallus
	[25165] = true, -- Eredar Twins
	[25166] = true, -- Eredar Twins
	[25038] = true, -- Felmyst
	[24850] = true, -- Kalecgos
	[25315] = true, -- Kil'jaeden
	[25741] = true, -- M'uru
	
	-- Ulduar
	[32871] = true, -- Algalon
	[33515] = true, -- Auriaya
	[33113] = true, -- Flame Leviathan
	[32906] = true, -- Freya
	[32914] = false, -- Freya Elders
	[32915] = false, -- Freya Elders
	[32913] = false, -- Freya Elders
	[33271] = true, -- General Vezax
	[32845] = true, -- Hodir
	[32926] = true, -- Hodir
	[33118] = true, -- Ignis
	[32867] = true, -- Iron Council
	[32927] = true, -- Iron Council
	[32857] = true, -- Iron Council
	[32930] = true, -- Kologarn
	[33432] = true, -- Mimiron
	[33186] = true, -- Razorscale
	[32865] = true, -- Thorim
	[33293] = true, -- XT002
	[33288] = true, -- Yogg Saron
	
	-- Vault of Archavon
	[31125] = true, -- Archavon
	[33993] = true, -- Emalon
	[35013] = true, -- Koralon
	[38433] = true, -- Toravon
	
	-- Winter
	[25740] = true, -- Ahune
	
	[36272] = true, -- Apothecary Trio
	[36296] = true, -- Apothecary Trio
	[36565] = true, -- Apothecary Trio
	
	-- Brewfest
	[23872] = true, -- CorenDirebrew
	
	-- All Hallow's Eve
	[23682] = true, -- Headless Horseman
	[23775] = true, -- Headless Horseman
	
	-- Zul'Gurub
	[14515] = true, -- Arlokk
	[11382] = true, -- Bloodlord
	[14988] = true, -- Bloodlord
	[15083] = true, -- Edge Of Madness
	[15114] = true, -- Gahzranka
	[14834] = true, -- Hakkar
	[14517] = true, -- Jeklik
	[11380] = true, -- Jindo
	[14510] = true, -- Marli
	[14509] = true, -- Thekal
	[11348] = true, -- Thekal
	[11347] = true, -- Thekal
	[14507] = true, -- Venoxis

	-- Love is in the Air (Seasonal)
	[36288] = true, -- Alchemist Hummel
}

local function IsBoss(guid)
	return guid and BossID[tonumber(guid:sub(9, 12), 16)]
	--return guid and BossID[tonumber(guid:sub(7, 10), 16)]
end

local function OnEvent(self, event, ...)
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local timestamp, subevent, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellID, spellName = ...

		if ( subevent == "UNIT_DIED" or subevent == "PARTY_KILL" ) and IsBoss(dstGUID) then
			if not lastBossGUID or lastBossGUID ~= dstGUID then
				self:SetScript("OnUpdate", function(self, elapsed)
					self.timer = (self.timer or 0) + elapsed

					if self.timer >= 1.5 then
						TakeScreenshot()
						lastBossGUID = dstGUID

						print("|cffff8800[BossKillPics]:|r screenshot taken of "..dstName..".")

						self.timer = nil
						self:SetScript("OnUpdate", nil)
					end
				end)
				
				--TakeScreenshot()
				--lastBossGUID = dstGUID
			end
		end
	end
end

f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:SetScript("OnEvent", OnEvent)
