function onLogout(cid)
	war_saveTimeAliveRecord(cid)
	setTmpDeaths(cid, 0)
	setTmpAssists(cid, 0)
	setTmpFrags(cid, 0)
	setLastAssists(cid, 0)
	setLastFrags(cid, 0)
	resetTimeAlive(cid)
	resetDamageCounter(cid)
	db.executeQuery("UPDATE `players` SET `kills` = " .. getFrags(cid) .. ", `tmp_kills` = 0, `deaths` = " .. getDeaths(cid) .. ", `tmp_deaths` = 0, `assists` = " .. getAssists(cid) .. ", `tmp_assists` = 0 WHERE `id` = " .. getPlayerGUID(cid) .. ";")
	if(timeOnline[getPlayerGUID(cid)] ~= nil) then
		local playerTimeOnline = os.time() - timeOnline[getPlayerGUID(cid)]
		if(playerTimeOnline > 10) then
			db.executeQuery("INSERT INTO `zotsme_logins` (`id`, `player_id`, `login_time`, `logout_time`, `online_time`, `kills`, `deaths`, `assists`) VALUES (NULL, " .. getPlayerGUID(cid) .. ", " .. timeOnline[getPlayerGUID(cid)] .. ", " .. os.time() .. ", " .. playerTimeOnline .. ", " .. getTmpFrags(cid) .. ", " .. getTmpDeaths(cid) .. ", " .. getTmpAssists(cid) .. ");")
		end
	end
	return true
end
