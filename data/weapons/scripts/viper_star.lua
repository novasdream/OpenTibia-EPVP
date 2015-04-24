local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_GREENSTAR)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 1, 0, 1.0, 0)

local xCombat = createCombatObject()
setCombatParam(xCombat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)

local condition = createConditionObject(CONDITION_POISON)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 15, 1000, -5)
setCombatCondition(xCombat, condition)

function onUseWeapon(cid, var)
	local ret = doCombat(cid, combat, var)
	if(ret == false) then
		return false
	end

		local chance = math.random(0, 100)
		if(chance > 50) then
			ret = doCombat(cid, xCombat, var)
		end
	return ret
end
