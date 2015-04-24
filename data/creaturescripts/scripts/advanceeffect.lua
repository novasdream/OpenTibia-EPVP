SKILL_NAMES = {
	[SKILL_FIST] = "FIST",
	[SKILL_CLUB] = "CLUB",
	[SKILL_SWORD] = "SWORD",
	[SKILL_AXE] = "AXE",
	[SKILL_DISTANCE] = "DISTANCE",
	[SKILL_SHIELD] = "SHIELDING",
	[SKILL_FISHING] = "FISHING",
	[SKILL__LEVEL] = "LEVEL",
	[SKILL__MAGLEVEL] = "MAGICLEVEL"
}
function onAdvance(cid, skill, oldLevel, newLevel)
	if(newLevel > oldLevel) then
		local pos = getThingPosition(cid)
		addEvent(doSendAnimatedText, 1000, pos, SKILL_NAMES[skill], COLOR_ORANGE)
		addEvent(doSendAnimatedText, 1500, pos, oldLevel .. "->" .. newLevel, COLOR_ORANGE)
		
		doSendMagicEffect({x=pos.x-1, y=pos.y-1, z=pos.z}, math.random(12,14))
		doSendMagicEffect({x=pos.x, y=pos.y-1, z=pos.z}, math.random(12,14))
		doSendMagicEffect({x=pos.x+1, y=pos.y-1, z=pos.z}, math.random(12,14))

		doSendMagicEffect({x=pos.x-1, y=pos.y, z=pos.z}, math.random(12,14))
		doSendMagicEffect({x=pos.x, y=pos.y, z=pos.z}, CONST_ME_HOLYAREA)
		doSendMagicEffect({x=pos.x+1, y=pos.y, z=pos.z}, math.random(12,14))

		doSendMagicEffect({x=pos.x-1, y=pos.y+1, z=pos.z}, math.random(12,14))
		doSendMagicEffect({x=pos.x, y=pos.y+1, z=pos.z}, math.random(12,14))
		doSendMagicEffect({x=pos.x+1, y=pos.y+1, z=pos.z}, math.random(12,14))
		
		if(oldLevel < 100 and newLevel >= 100) then
			doBroadcastMessage(getCreatureName(cid) .. ": I'm PRO, I got " .. newLevel .. " " .. SKILL_NAMES[skill] .. "!", MESSAGE_STATUS_CONSOLE_ORANGE)
		end	
		if(oldLevel < 130 and newLevel >= 130) then
			doBroadcastMessage(getCreatureName(cid) .. ": HA! I got " .. newLevel .. " " .. SKILL_NAMES[skill] .. "!", MESSAGE_STATUS_CONSOLE_ORANGE)
		end
		if(newLevel == 150) then
			doBroadcastMessage(getCreatureName(cid) .. ": FEAR ME! I'm " .. newLevel .. " " .. SKILL_NAMES[skill] .. " and I'm coming for you!", MESSAGE_STATUS_CONSOLE_ORANGE)
		end
	end
	return true
end
