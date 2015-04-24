local config = {
	usableOnTarget = "yes", -- can be used on target? (fe. healing friend)
	splashable = "no",
	realAnimation = "no", -- make text effect visible only for players in range 1x1
	healthMultiplier = 1.0,
	manaMultiplier = 1.0
}

config.usableOnTarget = getBooleanFromString(config.usableOnTarget)
config.splashable = getBooleanFromString(config.splashable)
config.realAnimation = getBooleanFromString(config.realAnimation)

local POTIONS = {
	[8704] = {splash = 2, health = {50, 100}}, -- small health potion
	[7618] = {splash = 2, health = {100, 200}}, -- health potion
	[7588] = {splash = 2, health = {200, 400}, level = 50, vocations = {3, 4, 7, 8}, vocStr = "knights and paladins"}, -- strong health potion
	[7591] = {splash = 2, health = {500, 700}, level = 80, vocations = {4, 8}, vocStr = "knights"}, -- great health potion
	[8473] = {splash = 2, health = {800, 1000}, level = 130, vocations = {4, 8}, vocStr = "knights"}, -- ultimate health potion

	[7620] = {splash = 7, mana = {70, 130}}, -- mana potion
	[7589] = {splash = 7, mana = {150, 230}, level = 50, vocations = {1, 2, 3, 5, 6, 7}, vocStr = "sorcerers, druids and paladins"}, -- strong mana potion
	[7590] = {splash = 7, mana = {200, 300}, level = 80, vocations = {1, 2, 5, 6}, vocStr = "sorcerers and druids"}, -- great mana potion

	[8472] = {splash = 3, health = {200, 400}, mana = {110, 190}, level = 80, vocations = {3, 7}, vocStr = "paladins"} -- great spirit potion
}

local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, (getConfigInfo('timeBetweenExActions') - 100))

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local potion = POTIONS[item.itemid]
	if(not potion) then
		return false
	end

	if(not isPlayer(itemEx.uid) or (not config.usableOnTarget and cid ~= itemEx.uid)) then
		if(toPosition.x == CONTAINER_POSITION) then
			toPosition = getThingPos(item.uid)
		end

		doDecayItem(doCreateItem(2016, potion.splash, toPosition))
		return true
	end

	if(cid ~= itemEx.uid and getTileInfo(getThingPosition(cid)).protection) then
		doCreatureSay(cid, "You cannot use potions on other people while you are in protection zone.", TALKTYPE_ORANGE_1, false, cid)
		return true
	end
--[[
	if(hasCondition(cid, CONDITION_EXHAUST_HEAL)) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return true
	end
]]
	if(((potion.level and getPlayerLevel(cid) < potion.level) or (potion.vocations and not isInArray(potion.vocations, getPlayerVocation(cid)))) and
		not getPlayerCustomFlagValue(cid, PLAYERCUSTOMFLAG_GAMEMASTERPRIVILEGES))
	then
		doCreatureSay(cid, "Only " .. potion.vocStr .. (potion.level and (" of level " .. potion.level) or "") .. " or above may drink this fluid.", TALKTYPE_ORANGE_1, false, cid)
		return true
	end

	local health = potion.health
	if(health and not doCreatureAddHealth(itemEx.uid, math.ceil(math.random(health[1], health[2]) * config.healthMultiplier))) then
		return false
	end

	local mana = potion.mana
	if(mana and not doPlayerAddMana(itemEx.uid, math.ceil(math.random(mana[1], mana[2]) * config.manaMultiplier))) then
		return false
	end

	doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_MAGIC_BLUE)
	doCreatureSay(itemEx.uid, "Aaaah...", TALKTYPE_ORANGE_1)

	--doAddCondition(cid, exhaust)
	--doRemoveItem(item.uid)
	return true
end
