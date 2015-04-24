function onStatsChange(cid, attacker, type, combat, value)
	if(type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) then
		addHitToDamageCounter(cid, attacker, value)
	end
	return true
end
