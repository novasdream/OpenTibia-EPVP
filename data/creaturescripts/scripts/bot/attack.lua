function onAttack(cid)
	setLastAttack(getPlayerGUID(cid), os.time())
	return true
end