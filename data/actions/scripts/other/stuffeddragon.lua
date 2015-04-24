function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(not canPlayerWearOutfitId(cid, 36, 0)) then
		doPlayerAddOutfitId(cid, 36, 0)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Now you can use demon outfit!")
		doRemoveItem(item.uid)
		doSendMagicEffect(fromPosition, CONST_ME_MAGIC_RED)
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You already have demon outfit.")
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
	end
	return true
end
