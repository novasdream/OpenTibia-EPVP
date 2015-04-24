local topFraggers = 5

function onThink(interval, lastExecution, thinkInterval)
	local online = getPlayersOnline()
	local topKills = {0,0,0,0,0,0,0}
	local topIDs = {0,0,0,0,0,0,0}
	for _, id in pairs(online) do
		local kills = getTmpFrags(id)
		if(kills > 0) then
			for i = 1, topFraggers do
				if(topKills[i] < kills) then
					for ii = topFraggers, i, -1 do
						topKills[ii] = topKills[ii-1]
						topIDs[ii] = topIDs[ii-1]
					end
					topKills[i] = kills
					topIDs[i] = id
					break
				end
			end
		end
	end
	doBroadcastMessage("Top fraggers:", MESSAGE_STATUS_CONSOLE_ORANGE)
	for i = 1, 5 do
		if(topIDs[i] > 0) then
			doBroadcastMessage(i .. ". " .. getCreatureName(topIDs[i]) .. " - " .. topKills[i] .. " frags", MESSAGE_STATUS_CONSOLE_ORANGE)
		end
	end
	return true
end