function onSay(cid, words, param, channel)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You got " .. getFrags(cid) .. " frags, " .. getAssists(cid) .. " assists and " .. getDeaths(cid) .. " deaths. [" .. getFrags(cid) .. " / " .. getAssists(cid) .. " / " .. getDeaths(cid) .. "]")
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "From LOGIN you got " .. getTmpFrags(cid) .. " frags, " .. getTmpAssists(cid) .. " assists and " .. getTmpDeaths(cid) .. " deaths. [" .. getTmpFrags(cid) .. " / " .. getTmpAssists(cid) .. " / " .. getTmpDeaths(cid) .. "]")
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "From LAST DEATH you got " .. getLastFrags(cid) .. " frags and " .. getLastAssists(cid) .. " assists. [" .. getLastFrags(cid) .. " / " .. getLastAssists(cid) .. "]")
	return true
end
