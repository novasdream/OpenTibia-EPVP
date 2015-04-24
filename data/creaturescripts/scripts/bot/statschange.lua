function onStatsChange(cid, attacker, type, combat, value)
	if((type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) and isPlayer(attacker) and isBot(cid)) then
		local guid = getPlayerGUID(cid)
		if(b_attackersLastSec[guid] == nil) then
			b_attackersLastSec[guid] = {}
		end
		if(b_attackersLastSec[guid][attacker] == nil) then
			b_attackersLastSec[guid][attacker] = 1
		end
	end
	return true
end
