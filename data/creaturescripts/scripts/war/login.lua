function onLogin(cid)
	timeOnline[getPlayerGUID(cid)] = os.time()
	resetTimeAlive(cid)
	resetDamageCounter(cid)
	recalculateHPandMana(cid)
	doTeleportThing(cid, getTownTemplePosition(math.random(1, 5)))
	registerCreatureEvent(cid, "WarPrepareDeath")
	registerCreatureEvent(cid, "WarStatsChange")
	return true
end
