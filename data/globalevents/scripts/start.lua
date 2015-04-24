function onStartup()
	db.executeQuery("UPDATE `players` SET `online` = 0, `tmp_kills` = 0, `tmp_deaths` = 0, `tmp_assists` = 0 WHERE `world_id` = " .. getConfigValue('worldId') .. ";")
	return true
end
