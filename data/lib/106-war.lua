LEVEL_MINIMUM = 75
LEVEL_MAXIMUM = 150

timeOnline = {}
timeAlive = {}
damageReceived = {}
lastHitOnGuy = {}
lastKiller = {}

killsIpCounter = {}
killsAccountCounter = {}

function resetTimeAlive(cid)
	timeAlive[getPlayerGUID(cid)] = os.time()
end

function getTimeAlive(cid)
	if(timeAlive[getPlayerGUID(cid)] == nil) then
		resetTimeAlive(cid)
	end
	return os.time() - timeAlive[getPlayerGUID(cid)]
end

function removePlayerTimeAliveCounter(cid)
	timeAlive[getPlayerGUID(cid)] = nil
end

function resetDamageCounter(cid)
	damageReceived[getPlayerGUID(cid)] = {}
	damageReceived[getPlayerGUID(cid)][0] = 0
	lastHitOnGuy[getPlayerGUID(cid)] = 0
	lastKiller[getPlayerGUID(cid)] = 0
end

function removeDamageCounter(cid)
	local playerGUID = getPlayerGUID(cid)
	-- remove from all players that this player did hit
	for _, playerCid in pairs(getPlayersOnline()) do
		if(damageReceived[getPlayerGUID(playerCid)] ~= nil) then
			if(damageReceived[getPlayerGUID(playerCid)][playerGUID] ~= nil) then
				table.remove(damageReceived[getPlayerGUID(playerCid)], playerGUID)
			end
		end
	end
	damageReceived[getPlayerGUID(cid)] = nil
	lastHitOnGuy[getPlayerGUID(cid)] = nil
	lastKiller[getPlayerGUID(cid)] = nil
end

function addHitToDamageCounter(damaged, damager, value)
	if(isPlayer(damaged)) then
		local damagerGUID = 0
		-- if 'damager' is monster or field (fire field etc.) then save it as guid 0
		if(isPlayer(damager)) then
			--damagerGUID = lastKiller[killerGUID]
			damagerGUID = getPlayerGUID(damager)
		end
		local damagedGUID = getPlayerGUID(damaged)
		if(damageReceived[damagedGUID] == nil) then
			resetDamageCounter(damaged)
		end
		if(damageReceived[damagedGUID][damagerGUID] == nil) then
			damageReceived[damagedGUID][damagerGUID] = value
		else
			damageReceived[damagedGUID][damagerGUID] = damageReceived[damagedGUID][damagerGUID] + value
		end
		lastHitOnGuy[damagedGUID] = damagerGUID
	end
end

function getDamageCounterTable(cid)
	if(damageReceived[getPlayerGUID(cid)] == nil) then
		resetDamageCounter(cid)
	end
	return damageReceived[getPlayerGUID(cid)]
end


function reduceDamageOverTime(cid)
	local damagedGUID = getPlayerGUID(cid)
	if(damageReceived[damagedGUID] ~= nil) then
		for damagerGUID, damage in pairs(damageReceived[damagedGUID]) do
			damageReceived[damagedGUID][damagerGUID] = damage / 2
		end
	end
end

function addKillToKillsCounter(cid, target)
	if(isPlayer(cid) and isPlayer(target) and not isBot(cid) and not isBot(target)) then
		local playerGUID = getPlayerGUID(cid)
		local targetIP = getPlayerIp(target)
		local targetAccountID = getPlayerAccountId(target)
		if(killsIpCounter[playerGUID] == nil) then
			killsIpCounter[playerGUID] = {}
		end
		if(killsIpCounter[playerGUID][targetIP] == nil) then
			killsIpCounter[playerGUID][targetIP] = {}
		end
		if(killsAccountCounter[playerGUID] == nil) then
			killsAccountCounter[playerGUID] = {}
		end
		if(killsAccountCounter[playerGUID][targetAccountID] == nil) then
			killsAccountCounter[playerGUID][targetAccountID] = {}
		end
		table.insert(killsIpCounter[playerGUID][targetIP], os.time())
		table.insert(killsAccountCounter[playerGUID][targetAccountID], os.time())
	end
end

local killsPerHourPerIp = 10
local killsPerFiveMinutesPerIp = 2

local killsPerHourPerAccount = 10
local killsPerFiveMinutesPerAccount = 2

function getKillExpRatio(cid, target)
	local ratio = 1000
	local msges = {}
	local playerGUID = getPlayerGUID(cid)
	local targetIP = getPlayerIp(target)
	local targetAccountID = getPlayerAccountId(target)
	if(killsIpCounter[playerGUID] == nil) then
		killsIpCounter[playerGUID] = {}
	end
	if(killsIpCounter[playerGUID][targetIP] == nil) then
		killsIpCounter[playerGUID][targetIP] = {}
	end
	if(killsAccountCounter[playerGUID] == nil) then
		killsAccountCounter[playerGUID] = {}
	end
	if(killsAccountCounter[playerGUID][targetAccountID] == nil) then
		killsAccountCounter[playerGUID][targetAccountID] = {}
	end
	local killsIp = killsIpCounter[playerGUID][targetIP]
	local killsAccount = killsAccountCounter[playerGUID][targetAccountID]
	local killsInLastHourPerIp = 0
	local killsInLastFiveMinutesPerIp = 0
	local killsInLastHourPerAccount = 0
	local killsInLastFiveMinutesPerAccount = 0
	local timeNow = os.time()
	local toRemoveFromTable = {}
	for _, killIpTime in pairs(killsIp) do
		if(killIpTime + 3600 > timeNow) then
			killsInLastHourPerIp = killsInLastHourPerIp + 1
			if(killIpTime + 300 > timeNow) then
				killsInLastFiveMinutesPerIp = killsInLastFiveMinutesPerIp + 1
			end
		else
			table.insert(toRemoveFromTable, _)
		end
	end
	for _, removeID in pairs(toRemoveFromTable) do
		table.remove(killsIpCounter[playerGUID][targetIP], removeID)
	end
	if(#killsIpCounter[playerGUID][targetIP] == 0) then
		table.remove(killsIpCounter[playerGUID], targetIP)
	end

	toRemoveFromTable = {}
	for _, killAccountTime in pairs(killsAccount) do
		if(killAccountTime + 3600 > timeNow) then
			killsInLastHourPerAccount = killsInLastHourPerAccount + 1
			if(killAccountTime + 300 > timeNow) then
				killsInLastFiveMinutesPerAccount = killsInLastFiveMinutesPerAccount + 1
			end
		else
			table.insert(toRemoveFromTable, _)
		end
	end
	for _, removeID in pairs(toRemoveFromTable) do
		table.remove(killsAccountCounter[playerGUID][targetAccountID], removeID)
	end
	if(#killsAccountCounter[playerGUID][targetAccountID] == 0) then
		table.remove(killsAccountCounter[playerGUID], targetAccountID)
	end

	if(not isBot(target)) then
		-- check rules
		if(getPlayerIp(cid) == 0 or getPlayerIp(target) == 0) then
			ratio = 0
			table.insert(msges, "offline kill block")
		end
		if(getPlayerIp(cid) == getPlayerIp(target)) then
			ratio = 0
			table.insert(msges, "MC kill block")
		end
		if(killsInLastHourPerIp > killsPerHourPerIp) then
			ratio = 0
			table.insert(msges, "IP hour limit")
		end
		if(killsInLastFiveMinutesPerIp > killsPerFiveMinutesPerIp) then
			ratio = 0
			table.insert(msges, "IP five minutes limit")
		end
		if(killsInLastHourPerAccount > killsPerHourPerAccount) then
			ratio = 0
			table.insert(msges, "account hour limit")
		end
		if(killsInLastFiveMinutesPerAccount > killsPerFiveMinutesPerAccount) then
			ratio = 0
			table.insert(msges, "account five minutes limit")
		end
	end
	if(not isBot(target)) then
		ratio = ratio * (10 / (10 +(killsInLastFiveMinutesPerIp + killsInLastFiveMinutesPerAccount / 2)))
	end
	ratio = ratio * math.min(getPlayerLevel(target) / getPlayerLevel(cid), 1.2)
	if(getDeaths(target) > getFrags(target) * 5 or getFrags(target) < 3) then
		ratio = ratio * 0.4
		table.insert(msges, "newbie or very bad player")
	elseif(getDeaths(target) > getFrags(target) * 4) then
		ratio = ratio * 0.6
		table.insert(msges, "bad player")
	elseif(getDeaths(target) * 2 < getFrags(target) and getTmpFrags(target) > 15 and getLastFrags(target) > 5) then
		ratio = ratio * 1.4
		table.insert(msges, "very good player")
	elseif(getDeaths(target) < getFrags(target) and getTmpFrags(target) > 5 and getLastFrags(target) > 0) then
		ratio = ratio * 1.2
		table.insert(msges, "good player")
	end
	if(#msges > 0) then
		return ratio / 1000, table.concat(msges, ", ")
	else
		return ratio / 1000, ""
	end
end

function war_doPlayerAddExperience(cid, value)
	if(value > 0) then
		if(getPlayerExperience(cid) + value <= getExperienceForLevel(LEVEL_MAXIMUM)) then
			doPlayerAddExperience(cid, value)
		else
			doPlayerAddExperience(cid, getExperienceForLevel(LEVEL_MAXIMUM) - getPlayerExperience(cid))
		end
	end
end

function war_doPlayerRemoveExperience(cid, value)
	if(value > 0) then
		if(getPlayerExperience(cid) - value >= getExperienceForLevel(LEVEL_MINIMUM)) then
			doPlayerAddExperience(cid, -value)
		else
			doPlayerAddExperience(cid, getExperienceForLevel(LEVEL_MINIMUM) - getPlayerExperience(cid))
		end
	end
end

function war_saveTimeAliveRecord(cid)
	if(getTimeAlive(cid) > 10 and getLastFrags(cid) > 0) then
		db.executeQuery("INSERT INTO `zotsme_alive_records` (`id`, `player_id`, `date`, `alive_time`, `kills`, `assists`) VALUES (NULL, " .. getPlayerGUID(cid) .. ", " .. os.time() .. ", " .. getTimeAlive(cid) .. ", " .. getLastFrags(cid) .. ", " .. getLastAssists(cid) .. ");")
	end
end

function recalculateHPandMana(cid)
	if(isPlayer(cid)) then
		local voc = getPlayerVocation(cid)
		local lvl = getPlayerLevel(cid)
		if(voc == 1 or voc == 2) then
			setCreatureMaxHealth(cid, 185 + ((lvl - 8) * 5))
			setCreatureMaxMana(cid, 35 + ((lvl - 8) * 30))
		elseif(voc == 3) then
			setCreatureMaxHealth(cid, 185 + ((lvl - 8) * 10))
			setCreatureMaxMana(cid, 35 + ((lvl - 8) * 15))
		else
			setCreatureMaxHealth(cid, 185 + ((lvl - 8) * 15))
			setCreatureMaxMana(cid, 35 + ((lvl - 8) * 5))
		end
		doCreatureAddHealth(cid, getCreatureMaxHealth(cid)-getCreatureHealth(cid), 0, 0, 1)
		doCreatureAddMana(cid, getCreatureMaxMana(cid)-getCreatureMana(cid))
	end
end