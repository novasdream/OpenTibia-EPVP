local keepOnline = 50
local maxChange = 3

function onThink(interval, lastExecution, thinkInterval)
	keepOnline = math.min(100, math.max(keepOnline+math.random(-1,1), 20))
	local online = getPlayersOnline()
	local botsOnline = {}
	local botsOffline = {}
	local playersOnline = {}
	for _, cid in pairs(online) do
		doPlayerFeed(cid, 9999)
		if(isBot(cid) and isBotActive(cid)) then
			table.insert(botsOnline, cid)
		elseif(not isBot(cid)) then
			table.insert(playersOnline, cid)
		else
			table.insert(botsOffline, cid)
		end
	end
	print("BOTS: " .. #botsOnline .. " (" .. keepOnline .. "), P: " .. #playersOnline)
	if(#playersOnline+#botsOnline > keepOnline) then
		if(#botsOnline > 0) then
			local toRemove = math.min(maxChange, #playersOnline+#botsOnline-keepOnline)
			for i = 1, toRemove do
				for i, bot in pairs(botsOnline) do
					if(getTileInfo(getThingPosition(bot)).protection) then
						setBotActive(bot, false)
						table.remove(botsOnline, i)
						break
					end
				end
			end
		end
	elseif(#playersOnline+#botsOnline < keepOnline) then
		for i = 1, maxChange do
			if(#playersOnline+#botsOnline+i <= keepOnline) then
				for i, bot in pairs(botsOffline) do
					setBotActive(bot, true)
					table.remove(botsOffline, i)
					break
				end
			end
		end
	end
	return true
end

function setBotDelayed(name)
	setBot(getPlayerByName(name), 1)
	setBotActive(getPlayerByName(name), false)
end

function onStartup()
	for i=1,200 do
		loadPlayer(getBotNameByID(i))
		addEvent(setBotDelayed, 1000, getBotNameByID(i))
	end
	return true
end
