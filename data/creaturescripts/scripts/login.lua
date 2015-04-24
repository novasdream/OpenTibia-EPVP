function onLogin(cid)
	registerCreatureEvent(cid, "GuildMotd")
	registerCreatureEvent(cid, "ReportBug")
	registerCreatureEvent(cid, "Idle")
	registerCreatureEvent(cid, "AdvanceEffect")
	doPlayerFeed(cid, 9999)
	return true
end