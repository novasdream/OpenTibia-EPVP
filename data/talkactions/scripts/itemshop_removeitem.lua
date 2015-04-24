function onSay(cid, words, param, channel)
	local offerId = tonumber(param)

	if(offerId == nil or offerId <= 0) then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Offer ID must be higher then 0.")
	end

	local offerStatus, offer = getShopOffer(offerId)

	if(not offerStatus) then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Offer with ID " .. offerId .. " doesn't exist.")
	end

	if(offer.player_id ~= getPlayerGUID(cid)) then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "This item is not in your offer.")
	end

	local addItemStatus, whyNot = addPlayerShopItem(cid, offer.item_id, offer.item_type, offer.attributes)

	if(not addItemStatus) then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, whyNot)
	end

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You remove item: " .. offer.name .. " from offer.")
	removeShopOffer(offerId)
	return true
end