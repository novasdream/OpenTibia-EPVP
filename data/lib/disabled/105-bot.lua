--[[
TYPE_GO_TO = 1
TYPE_STEP_TO = 2

botConfig = {}

function isActionFinished(cid, akcja)
	local zrobione = false
	if akcja["type"] == TYPE_GO_TO then
		zrobione = (getDistanceBetween(getThingPosition(cid), akcja["parameters"][1]) <= akcja["parameters"][2])
	elseif akcja["type"] == TYPE_STEP_TO then
		zrobione = true
	end
	return zrobione
end

function doAction(cid, akcja)
	if akcja["type"] == TYPE_GO_TO then
		goTo(cid, akcja["parameters"][1], 0, akcja["parameters"][2], 0, 0, 150, 1000)
	elseif akcja["type"] == TYPE_STEP_TO then
		doMoveCreature(cid, getDirectionTo(getThingPosition(cid), akcja["parameters"]))
	end
	setSleep(cid, akcja["sleep"])
end

spellCooldownAttack = {}
spellCooldownHeal = {}
itemCooldown = {}
attackersLastSec = {}
visiblePlayers = {}
ignoredPlayers = {}
function getLastTarget(cid)
	return getCreatureStorage(cid, 59427)
end

function setLastTarget(cid, pid)
	doCreatureSetStorage(cid, 59427, pid)
	getLastAttack(cid, os.time())
end

function updateBattleList(cid)
	visiblePlayers[getPlayerGUID(cid)] = getSpectators(getThingPosition(cid), 8, 8, false) 
end

function loadIgnored(cid)
	local data = getCreatureStorage(cid, 59423)
	if type(data) == 'number' and data == -1 then
		return {}
	else
		return table.unserialize(data)
	end
end

function saveIgnored(cid, list)
	doCreatureSetStorage(cid, 59423, table.serialize(list))
end

function addIgnored(cid, pid)
	local data = loadIgnored(cid)
	data[pid] = os.time() + 5
	saveIgnored(cid, data)
end

function removeIgnored(cid, pid)
	local data = loadIgnored(cid)
	if data[pid] ~= nil then
		data[pid] = nil
		saveIgnored(cid, data)
	end
end

function updateIgnored(cid)
	for pid, ignoreTime in pairs(loadIgnored(cid)) do
		if ignoreTime < os.time() then
			removeIgnored(cid, pid)
		end
	end
end

function isIgnored(cid, pid)
	local data = loadIgnored(cid)
	if data[pid] ~= nil then
		return true
	else
		return false
	end
end

function getAttackers(cid)
	local attackers = {}
	updateIgnored(cid)
	for _, pid in pairs(visiblePlayers[getPlayerGUID(cid)]) do
		-- duzo ciagnie, moze jakies inne rozwiazanie?
		--if not isIgnored(cid, pid) and canGoTo(cid, getThingPosition(pid), 0, 1, 1, 1, 12) then
		if not isIgnored(cid, pid) then
			table.insert(attackers, pid)
		end
	end
	return attackers
end

function selectClosestTarget(cid)
	local attackers = getAttackers(cid)
	local selfPos = getThingPosition(cid)
	while(#attackers > 0) do
		local minRange = 15
		local newTarget = 0
		local newTargetID = -1
		for _,aid in pairs(attackers) do
			if(aid ~= cid) then
				local aidPos = getThingPosition(aid)
				local dist = getDistanceBetween(selfPos, aidPos)
				if dist < minRange and not isNpc(aid) and (not isPlayer(aid) or getPlayerGroupId(aid) == 1) 
					and not getTileInfo(aidPos).protection then
					minRange = dist
					newTarget = aid
					newTargetID = _
				end
			end
		end
		if(newTarget == 0) then
			break
		end
		if(doPlayerSetTarget(cid, newTarget)) then
			setLastTarget(cid, newTarget)
			break
		else
			table.remove(attackers, newTargetID)
		end
	end
	-- jesli jeszcze nie mial celu to ustaw, ze aktualny to ostatni
	if getCreatureTarget(cid) > 0 and getLastTarget(cid) == 0 then
		setLastTarget(cid, getCreatureTarget(cid))
	end
	setPlayerModes(cid, 1, 1, 1)
end

function isSleeping(cid)
	return getCreatureStorage(cid, 59425) > os.time()
end

function setSleep(cid, seconds)
	doCreatureSetStorage(cid, 59425, os.time() + seconds)
end

function getTries(cid)
	return math.max(0, getCreatureStorage(cid, 59431))
end

function setTries(cid, value)
	doCreatureSetStorage(cid, 59431, value)
end

function isBot(cid)
	return (getCreatureStorage(cid, 59432) ~= -1)
end

function setBot(cid, bot)
	return doCreatureSetStorage(cid, 59432, bot)
end

function loadNextAction(cid)
	
	local acId = getCurrentAction(cid)
	-- fix
	if botConfig[acId + 1] ~= nil then
		setCurrentAction(cid, acId + 1)
	else
		
	end
	-- setCurrentStep(cid, closesStep)
	-- setCurrentAction(cid, )
	--print("AID: " .. getCurrentAction(cid))
end


exori_mort = createCombatObject()
setCombatParam(exori_mort, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(exori_mort, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(exori_mort, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
setCombatFormula(exori_mort, COMBAT_FORMULA_LEVELMAGIC, -1, -10, -1, -20, 5, 5, 1.4, 2.1)
--[[
exori_con = createCombatObject()
setCombatParam(exori_con, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(exori_con, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(exori_con, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)

function onGetFormulaValuesCon(cid, level, skill, attack, factor)
	return -(((skill + 25) / 3) + (level / 5)), -((skill + 25) + (level / 5))
end

setCombatCallback(exori_con, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValuesCon")
]]
sudden_death = createCombatObject()
setCombatParam(sudden_death, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(sudden_death, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(sudden_death, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(sudden_death, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
setCombatFormula(sudden_death, COMBAT_FORMULA_LEVELMAGIC, -1, -60, -1, -60, 5, 5, 4, 7)

terra_strike = createCombatObject()
setCombatParam(terra_strike, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(terra_strike, COMBAT_PARAM_EFFECT, CONST_ME_CARNIPHILA)
setCombatParam(terra_strike, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)
setCombatFormula(terra_strike, COMBAT_FORMULA_LEVELMAGIC, -1, -10, -1, -20, 5, 5, 1.4, 2.1)
--[[
exori_hur = createCombatObject()
setCombatParam(exori_hur, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(exori_hur, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(exori_hur, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
setCombatParam(exori_hur, COMBAT_PARAM_USECHARGES, true)

function onGetFormulaValuesHur(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = skill + attack, level / 5
	return -(skillTotal / 3 + levelTotal), -(skillTotal + levelTotal)
end

setCombatCallback(exori_hur, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValuesHur")
]]
function castBestAttackSpell(cid)
	local target = numberToVariant(getCreatureTarget(cid))
	local voc = getPlayerVocation(cid)
	local level = getPlayerLevel(cid)
	local mlvl = getPlayerMagLevel(cid)
	if voc == 1 then
		if level >= 45 and mlvl >= 15 then
			return doCombat(cid, sudden_death, target)
		elseif level >= 16 then
			return doCombat(cid, exori_mort, target)
		end
	elseif voc == 2 then
		if level >= 45 and mlvl >= 15 then
			return doCombat(cid, sudden_death, target)
		elseif level >= 13 then
			return doCombat(cid, terra_strike, target)
		end
	elseif voc == 3 then
	
	elseif voc == 4 then
	
	end
	return true
end

healing = {}
table.insert(healing, {getHeal=function(level,maglevel) return math.random(200, 250) end, exhaust=1000, level=0,text="Ahhh..",anim=0})
table.insert(healing, {getHeal=function(level,maglevel) return math.random(350, 550) end, exhaust=1000, level=50,voc={3, 4, 7, 8},text="Ahhh..",anim=0})
table.insert(healing, {getHeal=function(level,maglevel) return math.random(700, 950) end, exhaust=1000, level=80,voc={4, 8},text="Ahhh..",anim=0})
table.insert(healing, {getHeal=function(level,maglevel) return math.random(1200, 1500) end, exhaust=1000, level=130,voc={4, 8},text="Ahhh..",anim=0})
table.insert(healing, {getHeal=function(level,maglevel) return 0 end, exhaust=1000,level=15,maglevel=5,anim=0})

function castBestHealingSpell(cid)
	local voc = getPlayerVocation(cid)
	local level = getPlayerLevel(cid)
	local mlvl = getPlayerMagLevel(cid)
	for _, spell in pairs(healing) do
	
	end
end
]]