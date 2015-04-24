local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1497)

function mwallCounter(timeLeft, position)
	if(timeLeft == 0) then
		local item = getTileItemById(position, 1497)
		if(item.uid > 0) then
			doRemoveItem(item.uid)
		end
	else
		if(timeLeft < 6) then
			doSendAnimatedText(position, timeLeft, 89)
		end
		addEvent(mwallCounter, 1000, timeLeft-1, position)
	end
end

function onCastSpell(cid, var)
	if(doCombat(cid, combat, var)) then
		local toPos = variantToPosition(var)
		addEvent(mwallCounter, 1000, math.random(14, 18), toPos)
		return true
	else
		return false
	end
end
