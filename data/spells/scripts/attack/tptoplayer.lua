local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -10, -1, -20, 5, 5, 1.4, 2.1)

function onCastSpell(cid, var)
	local target = variantToNumber(var)
	if(isPlayer(target) and doCombat(cid, combat, var)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		doTeleportThing(cid, getCreaturePosition(target), true)
		return true
	end
	return false
end