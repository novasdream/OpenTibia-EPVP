function microSave()
	for _, pid in pairs(getPlayersOnline()) do
		if(not isBot(pid) or isBotActive(pid)) then
			doPlayerSave(pid)
		end
	end
end

function onThink(interval, lastExecution, thinkInterval)
	doBroadcastMessage("Server save in 5 seconds.")
	addEvent(microSave, 5000, false)
	return true
end
