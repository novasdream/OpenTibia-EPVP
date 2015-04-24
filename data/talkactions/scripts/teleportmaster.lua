function onSay(cid, words, param, channel)
	if(not getTileInfo(getCreaturePosition(cid)).protection and getPlayerAccess(cid) <= 2) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You can use it only in Protection Zone.")
		return true
	end
	local townID = tonumber(param)
	if(not townID or townID < 1 or townID > 5) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Town ID must be between 1 and 5.")
		return true
	end

	local pos = getTownTemplePosition(townID)
	local tmp = getThingPosition(cid)

	if(doTeleportThing(cid, pos, true) and not isPlayerGhost(tid)) then
		doSendMagicEffect(tmp, CONST_ME_POFF)
		doSendMagicEffect(pos, CONST_ME_TELEPORT)
	end

	return true
end
