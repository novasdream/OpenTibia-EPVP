-- ### CONFIG ###
SHOP_MSG_TYPE = 19
-- ### END OF CONFIG ###

function table.serialize(x, recur)
	local t = type(x)
	recur = recur or {}
 
	if(t == nil) then
		return "nil"
	elseif(t == "string") then
		return string.format("%q", x)
	elseif(t == "number") then
		return tostring(x)
	elseif(t == "boolean") then
		return t and "true" or "false"
	elseif(getmetatable(x)) then
		error("Can not serialize a table that has a metatable associated with it.")
	elseif(t == "table") then
		if(table.find(recur, x)) then
			error("Can not serialize recursive tables.")
		end
		table.insert(recur, x)
 
		local s = "{"
		for k, v in pairs(x) do
			s = s .. "[" .. table.serialize(k, recur) .. "]" .. " = " .. table.serialize(v, recur) .. ", "
		end
 
		return s:sub(0, s:len() - 2) .. "}"
	end
 
	error("Can not serialize value of type '" .. t .. "'.")
end
 
function table.unserialize(str)
	return loadstring("return " .. str)()
end

function addThingAttributes(thing, attributes, cid, tid)
	if attributes ~= '' then
		for key, value in pairs(table.unserialize(attributes)) do
			doItemSetAttribute(thing, key, value)
		end
	end
	doItemSetAttribute(thing, "ownerID", getPlayerGUID(cid))
	doItemSetAttribute(thing, "TID", tid)
end

function getGUIDTable()
	local ret = {}
	for _, pid in pairs(getPlayersOnline()) do
		ret[getPlayerGUID(pid)] = pid
	end
	return ret
end

function onThink(interval, lastExecution)
	local actionsList = db.getResult("SELECT * FROM `zotsme_ots_communication`")
	if(actionsList:getID() ~= -1) then
		local transactionsFinished = {}
		local actionsToDelete = {}
		local playersToSave = {}
		local playersOnline = getGUIDTable()
		while(true) do
			local action = {}
			action["player_id"] = actionsList:getDataInt("player_id")
			if playersOnline[action.player_id] ~= nil then
				local cid = playersOnline[action.player_id]
				action["id"] = actionsList:getDataInt("id")
				action["tid"] = actionsList:getDataInt("tid")
				action["name"] = actionsList:getDataString("name")
				action["item"] = actionsList:getDataInt("item")
				action["item_count"] = actionsList:getDataInt("item_count")
				action["item_attributes"] = actionsList:getDataString("item_attributes")
				action["container"] = actionsList:getDataInt("container")
				action["container_items_count"] = actionsList:getDataInt("container_items_count")
				action["container_attributes"] = actionsList:getDataString("container_attributes")
				action["lua_execute"] = actionsList:getDataString("lua_execute")
				action["storages"] = actionsList:getDataString("storages")
				action["addons"] = actionsList:getDataString("addons")
				action["custom_parameters"] = actionsList:getDataString("custom_parameters")

				local delete = false
				local thingWeight = 0
				local blockNext = false

				if action.item > 0 then
					local itemInfo = getItemInfo(action.item)
					if itemInfo.clientCharges then -- item is rune = has charges = 'stack' that doesn't change weight
						thingWeight = itemInfo.weight
					else
						thingWeight = itemInfo.weight * action.item_count
					end
				end
				if action.container > 0 then
					thingWeight = thingWeight * action.container_items_count + getItemInfo(action.container).weight
				end
				local freeCapacity = getPlayerFreeCap(cid)

				if thingWeight > 0 then
					if thingWeight <= freeCapacity then
						local receivedItem = -111
						if action.container > 0 then
							local newContainer = doCreateItemEx(action.container, 1)
							addThingAttributes(newContainer, action.container_attributes, cid, action.tid)
							for i = 1, action.container_items_count do
								local item = doCreateItemEx(action.item, action.item_count)
								addThingAttributes(item, action.item_attributes, cid, action.tid)
								doAddContainerItemEx(newContainer, item)
							end
							receivedItem = doPlayerAddItemEx(cid, newContainer)
						else
							local newItem = doCreateItemEx(action.item, action.item_count)
							addThingAttributes(newItem, action.item_attributes, cid, action.tid)
							receivedItem = doPlayerAddItemEx(cid, newItem)
						end
						if receivedItem == RETURNVALUE_NOERROR then
							delete = true
						else
							blockNext = true
							doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, '>> '.. action.name ..' << from OTS shop is waiting for you. Please make place for this item in your backpack/hands and wait about '.. interval ..' seconds to get it.')
						end
					else
						blockNext = true
						doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, '>> '.. action.name ..' << from OTS shop is waiting for you. It weight is '.. thingWeight ..' oz., you have only '.. freeCapacity..' oz. free capacity. Put some items in depot and wait about '.. interval ..' seconds to get it.')
					end
				end

				if not blockNext and action.lua_execute ~= '' then
					local executed, err = pcall(loadstring('local cid = ' .. cid .. ' ' .. action.lua_execute))
					if not executed then
						print('Error occured while executing SHOP - LUA EXECUTE for player >> ' .. getCreatureName(cid) .. ' << , offer: ' .. action.name .. ' , error text is line below:')
						print(err)
					end
					delete = true
				end

				if not blockNext and action.storages ~= '' then
					local storages = table.unserialize(action.storages)
					for _, storageData in pairs(storages) do
						if storageData.value == nil then
							doCreatureSetStorage(cid, storageData.key)
						else
							doCreatureSetStorage(cid, storageData.key, storageData.value)
						end
					end
					delete = true
				end

				if not blockNext and action.addons ~= '' then
					local addonsData = table.unserialize(action.addons)
					for _, addonData in pairs(addons) do
						if addonData.type == "add" then
							doPlayerAddOutfitId(cid, addonData.outfit_id, addonData.addon)
						elseif addonData.addon ~= nil then
							doPlayerRemoveOutfitId(cid, addonData.outfit_id, addonData.addon)
						else
							doPlayerRemoveOutfitId(cid, addonData.outfit_id)
						end
					end
					delete = true
				end

				if not blockNext and action.custom_parameters ~= '' then
				-- custom action?
					delete = true
				end

				if delete then
					playersToSave[cid] = cid
					table.insert(actionsToDelete, action.id)
					-- action doesn't mean 'transaction', other script [not shop] can add for example: message to player (lua execute)
					-- so we must check if there is set 'transaction id'
					if action.tid > 0 then
						doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, 'You received >> '.. action.name ..' << from OTS shop.')
						table.insert(transactionsFinished, action.tid)
					end
				end
			end
			if not(actionsList:next()) then
				break
			end
		end

		if #actionsToDelete > 0 then
			for _, pid in pairs(playersToSave) do
				doPlayerSave(pid)
			end
			db.executeQuery('DELETE FROM `zotsme_ots_communication` WHERE `id` IN (' .. table.concat(actionsToDelete, ',') .. ')');
			db.executeQuery('UPDATE `zotsme_shop_transactions` SET `state` = 3, `date_delivery` = ' .. os.time() .. ' WHERE `id` IN (' .. table.concat(transactionsFinished, ',') .. ')');
		end
		actionsList:free()
	end
	return true
end