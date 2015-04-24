function onKill(cid, target, lastHit)
	if lastHit and isBot(cid) then
		resetIgnored(getPlayerGUID(cid))
		addIgnored(getPlayerGUID(cid), target, 5) -- 'fake', remove problem with position of just killed player [that does not exist]
	end
	return true
end