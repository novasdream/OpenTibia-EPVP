function removePzBlock(cid)
	if(isPlayer(cid) and getTileInfo(getThingPosition(cid)).protection) then
		doRemoveConditions(cid)
		doPlayerSetPzLocked(cid, false)
	end
end

function onPrepareDeath(cid, deathList)
	local killerGUID = lastHitOnGuy[getPlayerGUID(cid)]
	local damageDealed = getDamageCounterTable(cid)
	local totalDamage = 1
	local expLost = round((math.floor(getPlayerExperience(cid) - getExperienceForLevel(LEVEL_MINIMUM)) / 5) * 2.5, 0)
	local attackersNumber = 0
	if(expLost < 250000) then
		expLost = 250000
	end
	local expRealLost = round((expLost / 2) * ((LEVEL_MINIMUM+150) / (getPlayerLevel(cid)+150)), 0)
	for guid, damage in pairs(damageDealed) do
		if(damage > 1) then
			totalDamage = totalDamage + damage
			attackersNumber = attackersNumber + 1
		end
	end
	local killRatio = 1
	if(attackersNumber <= 4) then -- guy + 2 summons
		killRatio = 0.8
	end
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You lost " .. round(expRealLost, 0) .. " experience points, because of death after attack of " .. attackersNumber .. " players that dealed " .. round(totalDamage, 0) .. " damage.")
	local expGiven = 0
	for guid, damage in pairs(damageDealed) do
		if(damage > 1) then
			local attacker = getPlayerByGUID(guid)
			if(isPlayer(attacker)) then -- if is still online
				local damagePercent = (damage / totalDamage) * 100
				local roundedDamagePercent = round(damagePercent, 2)
				local expRatio, text = getKillExpRatio(attacker, cid)
				expRatio = expRatio * killRatio
				if(damagePercent > math.random(60, 90)) then
					expRatio = expRatio * 0.8
				end
				local expGained = math.floor(((expLost * damagePercent / 100) * expRatio) / 2)
				--print(getCreatureName(attacker) .. " dostal " .. expGained .. " exp")
				if(text ~= "" and damagePercent > 0.1) then
					doPlayerSendTextMessage(attacker, MESSAGE_STATUS_CONSOLE_BLUE, "You received " .. round(expGained, 0) .. " exp (exp-ratio: " .. round(expRatio * 100, 2) .. " %, damage: " .. roundedDamagePercent .. "%) for killing " .. getCreatureName(cid) .. ", because of: " .. text)
				elseif(expGained > 0) then
					doPlayerSendTextMessage(attacker, MESSAGE_STATUS_CONSOLE_BLUE, "You received " .. round(expGained, 0) .. " exp (exp-ratio: " .. round(expRatio * 100, 2) .. " %, damage: " .. roundedDamagePercent .. " %) for killing " .. getCreatureName(cid) .. ".")
				end
				if(expRatio > 0) then -- frag not blocked
					war_doPlayerAddExperience(attacker, expGained)
					expGiven = expGiven + expGained
					if(expGained > 10000) then
						addKillToKillsCounter(attacker, cid)
					end
					if(guid == killerGUID) then
						local extraExp = 30000 * expRatio
						doSendAnimatedText(getThingPosition(attacker), round(expGained+extraExp, 0), COLOR_WHITE)
						expGiven = expGiven + extraExp
						war_doPlayerAddExperience(attacker, extraExp)
						 -- add frag
						doPlayerAddSoul(attacker, 1)
						setFrags(attacker, getFrags(attacker)+1)
						setTmpFrags(attacker, getTmpFrags(attacker)+1)
						setLastFrags(attacker, getLastFrags(attacker)+1)
						for _, pid in pairs(getPlayersOnline()) do
							doPlayerSendChannelMessage(pid, "System", getCreatureName(attacker) .. " (" .. getPlayerLevel(attacker) .. ") killed " .. getCreatureName(cid) .. " (" .. getPlayerLevel(cid) .. ")", 15,5)
						end
						doPlayerSendTextMessage(attacker, MESSAGE_STATUS_CONSOLE_BLUE, "You did last hit on " .. getCreatureName(cid) .. ". You receive frag and extra " .. round(extraExp,0) .. " exp.")
						-- drop body
						if(getPlayerSex(cid) == 0) then -- female
							local corpse = doCreateItem(6081, 1, getThingPosition(cid))
							if(corpse and type(corpse) == "number") then
								doItemSetAttribute(corpse, "name", "dead body. You recognize " .. getCreatureName(cid) .. ". She was killed by " .. getCreatureName(attacker) .. ".")
								doDecayItem(corpse)
							end
						else -- male
							local corpse = doCreateItem(6080, 1, getThingPosition(cid))
							if(corpse and type(corpse) == "number") then
								doItemSetAttribute(corpse, "name", "dead body. You recognize " .. getCreatureName(cid) .. ". He was killed by " .. getCreatureName(attacker) .. ".")
								doDecayItem(corpse)
							end
						end
					elseif(expGained > 0) then
						doSendAnimatedText(getThingPosition(attacker), round(expGained, 0), COLOR_WHITE)
						if(expGained > 2000) then
							setAssists(attacker, getAssists(attacker)+1)
							setTmpAssists(attacker, getTmpAssists(attacker)+1)
							setLastAssists(attacker, getLastAssists(attacker)+1)
							doPlayerSendTextMessage(attacker, MESSAGE_STATUS_CONSOLE_BLUE, "You did hit on " .. getCreatureName(cid) .. ". You receive assist.")
						end
					end
				end
			end
		end
	end
	-- add to records on www
	print("Padl: " .. getCreatureName(cid) .. "(" .. getPlayerLevel(cid) .. ") stracil: " .. expRealLost .. " (full: " .. expLost .. " ), rozdal: " .. round(expGiven,0))
	war_doPlayerRemoveExperience(cid, expRealLost)
	setDeaths(cid, getDeaths(cid)+1)
	setTmpDeaths(cid, getTmpDeaths(cid)+1)
	if(lastKiller[killerGUID] ~= nil and lastKiller[killerGUID] == getPlayerGUID(cid)) then
		-- lastKiller[killerGUID] zabil tego kto zabil ostatnio ciebie, zemsta?
	end
	if(lastKiller[getPlayerGUID(cid)] ~= nil and lastKiller[getPlayerGUID(cid)] == killerGUID) then
		-- znowu ten sam zabil co wczesniej, cos zrobic?
	end
	-- save alive time
	war_saveTimeAliveRecord(cid)
	db.executeQuery("UPDATE `players` SET `kills` = " .. getFrags(cid) .. ", `tmp_kills` = " .. getTmpFrags(cid) .. ", `deaths` = " .. getDeaths(cid) .. ", `tmp_deaths` = " .. getTmpDeaths(cid) .. ", `assists` = " .. getAssists(cid) .. ", `tmp_assists` = " .. getTmpAssists(cid) .. " WHERE `id` = " .. getPlayerGUID(cid) .. ";")
	setLastAssists(cid, 0)
	setLastFrags(cid, 0)
	resetTimeAlive(cid)
	resetDamageCounter(cid)
	lastKiller[getPlayerGUID(cid)] = killerGUID
	
	-- return false i lecz gracza co pada i tp do swiatyni
	doSendMagicEffect(getThingPosition(cid), CONST_ME_YALAHARIGHOST)
	doTeleportThing(cid, getTownTemplePosition(math.random(1, 5)))
	-- HP i MANA fix
	recalculateHPandMana(cid)
	doRemoveConditions(cid)
	doPlayerSetPzLocked(cid, false)
	addEvent(removePzBlock, 1000, cid)
	addEvent(removePzBlock, 5500, cid)
	-- dodanie skull za ilosc fragow
	return true
end