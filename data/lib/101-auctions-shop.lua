-- INFO ONLY:
-- CONST_SLOT_HEAD = 1
-- CONST_SLOT_NECKLACE = 2
-- CONST_SLOT_BACKPACK = 3
-- CONST_SLOT_ARMOR = 4
-- CONST_SLOT_RIGHT = 5
-- CONST_SLOT_LEFT = 6
-- CONST_SLOT_LEGS = 7
-- CONST_SLOT_FEET = 8
-- CONST_SLOT_RING = 9
-- CONST_SLOT_AMMO = 10

-- CONFIG
local itemsBlockedInShop = {
2343, -- something 1
5674, -- something 2
7864 -- something 3
}

local minimumLevelToSell = 20
local maximumNumberOfOffers = 50

local attributesToSave = {
"attack",
"defense",
"armor",
"name",
"duration"
}

-- TFS 0.4 function, added to make sure you will have it
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

-- return shop offer id
function addItemToShopOffer(cid, item, price)
	local attributes = {}
	for _, attrName in pairs(attributesToSave) do
		if(getItemAttribute(item.uid, attrName) ~= nil) then
			attributes[attrName] = getItemAttribute(item.uid, attrName)
		end
	end

	local name = getItemInfo(item.itemid).name
	if(getItemAttribute(item.uid, "name") ~= nil) then
		name = getItemAttribute(item.uid, "name")
	end

	db.executeQuery('INSERT INTO `zotsme_ingame_shop` (`player_id` ,`item_id` ,`item_type` ,`price` ,`name` ,`attributes` ,`start_date`) VALUES (' .. getPlayerGUID(cid) .. ',  ' .. item.itemid .. ',  ' .. item.type .. ',  ' .. tonumber(price) ..',  ' .. db.escapeString(name) .. ',  ' .. db.escapeString(table.serialize(attributes)) .. ',  ' .. os.time() .. ')');

	return db.lastInsertId()
end

-- return status and message (why cannot add to offer)
function canAddOfferToShop(cid, item)
	for _, blockedItemID in pairs(itemsBlockedInShop) do
		if(item.itemid == blockedItemID) then
			return false, "This item is blocked. You cannot add it to shop."
		end
	end

	if(isContainer(item.uid) and getContainerSize(item.uid) > 0) then
		return false, "You cannot add container with items inside."
	end

	if(getPlayerLevel(cid) < minimumLevelToSell) then
		return false, "You cannot sell in shop. Minimum level required is " .. minimumLevelToSell
	end

	local shopItems = db.getResult("SELECT COUNT(`id`) AS `count` FROM `zotsme_ingame_shop` WHERE `player_id` = " .. getPlayerGUID(cid) .. ";")
	if(shopItems:getID() == -1) then
		local offersCount = shopItems:getDataInt("count")
		shopItems:free()
		if(offersCount > maximumNumberOfOffers) then
			return false, "You cannot add more offers to shop. Maximum number of offers for one player is " .. maximumNumberOfOffers
		end
	end

	return true, ""
end

-- return status and message (why cannot add to player)
function addPlayerShopItem(cid, item_id, item_type, item_attributes)
	if(getItemInfo(item_id).weight > getPlayerFreeCap(cid)) then
		return false, "Not enought capacity."
	end

	local itemUID = doCreateItemEx(item_id, item_type)
	if(item_attributes ~= '') then
		for key, value in pairs(table.unserialize(item_attributes)) do
			doItemSetAttribute(itemUID, key, value)
		end
	end

	if(doPlayerAddItemEx(cid, itemUID) ~= RETURNVALUE_NOERROR) then
		return false, "No place in backpack / hands."
	end

	return true, ""
end

function removeShopOffer(offerId)
	db.executeQuery("DELETE FROM `zotsme_ingame_shop` WHERE `id` = " .. db.escapeString(offerId))
end

-- return status and offer info
function getShopOffer(offerId)
	local shopOffer = db.getResult("SELECT * FROM `zotsme_ingame_shop` WHERE `id` = " .. db.escapeString(offerId))
	if(shopOffer:getID() ~= -1) then
		local offerInfo = {}
		offerInfo["id"] = shopOffer:getDataInt("id")
		offerInfo["player_id"] = shopOffer:getDataInt("player_id")
		offerInfo["item_id"] = shopOffer:getDataInt("item_id")
		offerInfo["item_type"] = shopOffer:getDataInt("item_type")
		offerInfo["price"] = shopOffer:getDataInt("price")
		offerInfo["name"] = shopOffer:getDataString("name")
		offerInfo["attributes"] = shopOffer:getDataString("attributes")
		offerInfo["start_date"] = shopOffer:getDataInt("start_date")
		shopOffer:free()
		return true, offerInfo
	end
	return false, {}
end