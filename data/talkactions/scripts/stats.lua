function onSay(cid, words, param, channel)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Time alive statistics: ")
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Time online statistics: ")
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player statistics: ")
	return true
end
