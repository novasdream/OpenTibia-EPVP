function onSay(cid, words, param, channel)
	local offerId = tonumber(param)

	if(offerId == nil or offerId <= 0) then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Offer ID must be higher then 0.")
	end

	local offerStatus, offer = getShopOffer(offerId)

	if(not offerStatus) then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Offer with ID " .. offerId .. " doesn't exist.")
	end

	if(offer.player_id == getPlayerGUID(cid)) then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You cannot buy your item: " .. offer.name .. ". Use !removeoffer " .. offerId)
	end

	if(offer.price > getPlayerMoney(cid)) then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "This item cost " .. offer.price .. " gp. You have only " .. getPlayerMoney(cid) .. " gp.")
	end

	local addItemStatus, whyNot = addPlayerShopItem(cid, offer.item_id, offer.item_type, offer.attributes)

	if(not addItemStatus) then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, whyNot)
	end

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You bought item: " .. offer.name .. " for " .. offer.price .. " gp.")
	doPlayerRemoveMoney(cid, offer.price)
	doPlayerSetBalance(cid, getPlayerBalance(cid) + offer.price)
	doPlayerTransferMoneyTo(cid, getPlayerNameByGUID(offer.player_id), offer.price)
	removeShopOffer(offerId)
	return true
end