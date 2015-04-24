function onThink(interval, lastExecution, thinkInterval)
	--doBroadcastMessage("Frags save.")
	--[[
	for _, cid in pairs(getPlayersOnline()) do
		if(not isBot(cid) or isBotActive(cid)) then
			db.executeQuery("UPDATE `players` SET `level` = " .. getPlayerLevel(cid) .. ", `kills` = " .. getFrags(cid) .. ", `tmp_kills` = " .. getTmpFrags(cid) .. ", `deaths` = " .. getDeaths(cid) .. ", `tmp_deaths` = " .. getTmpDeaths(cid) .. ", `assists` = " .. getAssists(cid) .. ", `tmp_assists` = " .. getTmpAssists(cid) .. "  WHERE `id` = " .. getPlayerGUID(cid) .. ";")
		end
	end]]--
	return true
end
