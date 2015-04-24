function onSay(cid, words, param, channel)

	local price = tonumber(param)

	if(price == nil or price <= 0 or price > 10000000) then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Minimum price for item is 1 gp, maximum 10.000.000 gp.")
	end

	local item = getPlayerSlotItem(cid, CONST_SLOT_LEFT)

	if(item.uid == 0) then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You don't have any item in right hand.")
	end

	local canAdd, whyNot = canAddOfferToShop(cid, item)

	if(not canAdd) then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, whyNot)
	end

	local newID = addItemToShopOffer(cid, item, price)
	local name = getItemInfo(item.itemid).name
	if(getItemAttribute(item.uid, "name") ~= nil) then
		name = getItemAttribute(item.uid, "name")
	end
	doRemoveItem(item.uid)

	return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Item " .. name .. " added to shop. Offer ID: " .. newID)
end