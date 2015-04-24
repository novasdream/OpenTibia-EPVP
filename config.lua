-- The Forgotten Server Config

	-- Account manager
	accountManager = true
	namelockManager = true
	newPlayerChooseVoc = false
	newPlayerSpawnPosX = 95
	newPlayerSpawnPosY = 117
	newPlayerSpawnPosZ = 7
	newPlayerTownId = 1
	newPlayerLevel = 1
	newPlayerMagicLevel = 0
	generateAccountNumber = false

	redSkullLength = 30 * 24 * 60 * 60
	blackSkullLength = 45 * 24 * 60 * 60
	dailyFragsToRedSkull = 3
	weeklyFragsToRedSkull = 5
	monthlyFragsToRedSkull = 10
	dailyFragsToBlackSkull = dailyFragsToRedSkull
	weeklyFragsToBlackSkull = weeklyFragsToRedSkull
	monthlyFragsToBlackSkull = monthlyFragsToRedSkull
	dailyFragsToBanishment = dailyFragsToRedSkull
	weeklyFragsToBanishment = weeklyFragsToRedSkull
	monthlyFragsToBanishment = monthlyFragsToRedSkull
	blackSkulledDeathHealth = 40
	blackSkulledDeathMana = 0
	useBlackSkull = true
	useFragHandler = true
	advancedFragList = false

	notationsToBan = 3
	warningsToFinalBan = 4
	warningsToDeletion = 5
	banLength = 7 * 24 * 60 * 60
	killsBanLength = 7 * 24 * 60 * 60
	finalBanLength = 30 * 24 * 60 * 60
	ipBanishmentLength = 1 * 24 * 60 * 60
	broadcastBanishments = true
	maxViolationCommentSize = 200
	violationNameReportActionType = 2
	autoBanishUnknownBytes = false

	worldType = "pvp"
	protectionLevel = 1
	pvpTileIgnoreLevelAndVocationProtection = true
	pzLocked = 60 * 1000
	huntingDuration = 60 * 1000
	criticalHitChance = 7
	criticalHitMultiplier = 1
	displayCriticalHitNotify = false
	removeWeaponAmmunition = false
	removeWeaponCharges = false
	removeRuneCharges = false
	whiteSkullTime = 15 * 60 * 1000
	noDamageToSameLookfeet = false
	showHealingDamage = false
	showHealingDamageForMonsters = false
	fieldOwnershipDuration = 0
	stopAttackingAtExit = true
	oldConditionAccuracy = false
	loginProtectionPeriod = 1000
	deathLostPercent = 10
	stairhopDelay = 2 * 1000
	pushCreatureDelay = 1000
	deathContainerId = 1987
	gainExperienceColor = 215
	addManaSpentInPvPZone = true
	squareColor = 0
	allowFightback = true

	-- Connection config
	worldId = 0
	ip = "25.78.32.42"
	bindOnlyConfiguredIpAddress = false
	loginPort = 7171
	gamePort = 7172
	adminPort = 7171
	statusPort = 7171
	loginTries = 10
	retryTimeout = 5 * 1000
	loginTimeout = 60 * 1000
	maxPlayers = 1000
	motd = "Welcome to the Forgotten Server!"
	displayOnOrOffAtCharlist = false
	onePlayerOnlinePerAccount = false
	allowClones = true
	serverName = "Forgotten"
	loginMessage = "Welcome to the Forgotten Server!"
	statusTimeout = 5 * 60 * 1000
	replaceKickOnLogin = true
	forceSlowConnectionsToDisconnect = true
	loginOnlyWithLoginServer = false
	premiumPlayerSkipWaitList = false

	sqlType = "mysql"
	sqlHost = "localhost"
	sqlPort = 3306
	sqlUser = "root"
	sqlPass = ""
	sqlDatabase = "otserver"
	sqlFile = "forgottenserver.s3db"
	sqlKeepAlive = 0
	mysqlReadTimeout = 10
	mysqlWriteTimeout = 10
	encryptionType = "sha1"

	-- Deathlist
	deathListEnabled = false
	deathListRequiredTime = 1 * 60 * 1000
	deathAssistCount = 19
	maxDeathRecords = 5

	-- Guilds
	ingameGuildManagement = false
	levelToFormGuild = 8
	premiumDaysToFormGuild = 0
	guildNameMinLength = 4
	guildNameMaxLength = 20

	-- Highscores
	highscoreDisplayPlayers = 15
	updateHighscoresAfterMinutes = 60

	-- Houses
	buyableAndSellableHouses = true
	houseNeedPremium = true
	bedsRequirePremium = false
	levelToBuyHouse = 1
	housesPerAccount = 0
	houseRentAsPrice = false
	housePriceAsRent = false
	housePriceEachSquare = 1000
	houseRentPeriod = "never"
	houseCleanOld = 0
	guildHalls = false

	-- Item usage
	timeBetweenActions = 200
	timeBetweenExActions = 1000
	hotkeyAimbotEnabled = true

	-- Map
	-- NOTE: storeTrash costs more memory, but will perform alot faster cleaning.
	mapName = "Thais_War"
	mapAuthor = "Gesior"
	randomizeTiles = true
	storeTrash = true
	cleanProtectedZones = true
	mailboxDisabledTowns = "-1"

	defaultPriority = "high"
	niceLevel = 5
	coresUsed = "-1"

	-- Startup
	optimizeDatabaseAtStartup = false
	removePremiumOnInit = false
	confirmOutdatedVersion = false

	-- Spells
	formulaLevel = 5.0
	formulaMagic = 1.0
	bufferMutedOnSpellFailure = false
	spellNameInsteadOfWords = false
	emoteSpells = false

	-- Outfits
	allowChangeOutfit = true
	allowChangeColors = true
	allowChangeAddons = true
	disableOutfitsForPrivilegedPlayers = false
	addonsOnlyPremium = true

	dataDirectory = "data/"
	bankSystem = true
	displaySkillLevelOnAdvance = false
	promptExceptionTracerErrorBox = true
	separateViplistPerCharacter = false
	maximumDoorLevel = 500
	maxMessageBuffer = 4

	-- Saving-related
	saveGlobalStorage = true
	useHouseDataStorage = false
	storePlayerDirection = false

	checkCorpseOwner = true
	monsterLootMessage = 3
	monsterLootMessageType = 25

	-- Ghost mode
	ghostModeInvisibleEffect = false
	ghostModeSpellEffects = true

	-- Limits
	idleWarningTime = 14 * 60 * 1000
	idleKickTime = 15 * 60 * 1000
	expireReportsAfterReads = 1
	playerQueryDeepness = 2
	maxItemsPerPZTile = 0
	maxItemsPerHouseTile = 0

	-- Premium-related
	freePremium = false
	premiumForPromotion = true

	-- Blessings
	-- NOTE: blessingReduction* regards items/containers loss.
	-- eachBlessReduction is how much each bless reduces the experience/magic/skills loss.
	blessingOnlyPremium = true
	blessingReductionBase = 30
	blessingReductionDecreament = 5
	eachBlessReduction = 8

	-- Rates
	-- NOTE: experienceStages configuration is located in data/XML/stages.xml.
	-- rateExperienceFromPlayers 0 to disable.
	experienceStages = false
	rateExperience = 5.0
	rateExperienceFromPlayers = 0
	rateSkill = 3.0
	rateMagic = 3.0
	rateLoot = 2.0
	rateSpawn = 1

	-- Monster rates
	rateMonsterHealth = 1.0
	rateMonsterMana = 1.0
	rateMonsterAttack = 1.0
	rateMonsterDefense = 1.0

	minLevelThresholdForKilledPlayer = 0.9
	maxLevelThresholdForKilledPlayer = 1.1

	rateStaminaLoss = 1
	rateStaminaGain = 3
	rateStaminaThresholdGain = 12
	staminaRatingLimitTop = 41 * 60
	staminaRatingLimitBottom = 14 * 60
	rateStaminaAboveNormal = 1.5
	rateStaminaUnderNormal = 0.5
	staminaThresholdOnlyPremium = true

	experienceShareRadiusX = 30
	experienceShareRadiusY = 30
	experienceShareRadiusZ = 1
	experienceShareLevelDifference = 2 / 3
	extraPartyExperienceLimit = 20
	extraPartyExperiencePercent = 5
	experienceShareActivity = 2 * 60 * 1000

	globalSaveEnabled = false
	globalSaveHour = 8
	shutdownAtGlobalSave = true
	cleanMapAtGlobalSave = false

	-- Spawns
	deSpawnRange = 2
	deSpawnRadius = 50

	-- Summons
	maxPlayerSummons = 2
	teleportAllSummons = false
	teleportPlayerSummons = false

	-- Status
	ownerName = ""
	ownerEmail = "@otland.net"
	url = "http://otland.net/"
	location = "Europe"
	displayGamemastersWithOnlineCommand = false

	adminLogsEnabled = false
	displayPlayersLogging = true
	prefixChannelLogs = ""
	runFile = ""
	outLogName = ""
	errorLogName = ""
	truncateLogsOnStartup = false
