local WINDOWS = {
	[6438] = 6436, [6436] = 6438,
	[6439] = 6437, [6437] = 6439,
	[6442] = 6440, [6440] = 6442,
	[6443] = 6441, [6441] = 6443,
	[6446] = 6444, [6444] = 6446,
	[6447] = 6445, [6445] = 6447,
	[6452] = 6450, [6450] = 6452,
	[6453] = 6451, [6451] = 6453,
	[6456] = 6454, [6454] = 6456,
	[6457] = 6455, [6455] = 6457,
	[6460] = 6458, [6458] = 6460,
	[6461] = 6459, [6459] = 6461,
	[6464] = 6462, [6462] = 6464,
	[6465] = 6463, [6463] = 6465,
	[6468] = 6466, [6466] = 6468,
	[6469] = 6467, [6467] = 6469,
	[6472] = 6470, [6470] = 6472,
	[6473] = 6471, [6471] = 6473,
	[6790] = 6788, [6788] = 6790,
	[6791] = 6789, [6789] = 6791,
	[7027] = 7025, [7025] = 7027,
	[7028] = 7026, [7026] = 7028,
	[7031] = 7029, [7029] = 7031,
	[7032] = 7030, [7030] = 7032,
	[10264] = 10266, [10266] = 10264,
	[10265] = 10267, [10267] = 10265,
	[10488] = 10490, [10490] = 10488,
	[10489] = 10491, [10491] = 10489
}

function onSay(cid, words, param, channel)
	param = tonumber(param)
	if(not param or param < 0) then
		return doPlayerSendCancel(cid, "Numeric param may not be lower than 0.")
	end

	if not getHouseInfo(param) then
		return doPlayerSendCancel(cid, "House does not exist.")
	end

	local minx = 99999
	local miny = 99999
	local minz = 99999
	local maxx = 0
	local maxy = 0
	local maxz = 0
	local change = 11

	local poss = getHousePositions(param)

	if type(poss) == "table" then
		for i, pos in ipairs(poss) do
			if pos.x - change < minx then
				minx = pos.x - change
			end
			if pos.y - change < miny then
				miny = pos.y - change
			end
			if pos.z < minz then
				minz = pos.z
			end
			if pos.x + change > maxx then
				maxx = pos.x + change
			end
			if pos.y + change > maxy then
				maxy = pos.y + change
			end
			if pos.z > maxz then
				maxz = pos.z
			end
		end
	else
		return doPlayerSendCancel(cid, "No house tiles.")
	end

	db.executeQuery('INSERT INTO `zhouse_image` (`houseid`, `minx`, `miny`, `minz`, `maxx`, `maxy`, `maxz`) VALUES (' .. param .. ', ' .. minx .. ', ' .. miny .. ', ' .. minz .. ', ' .. maxx .. ', ' .. maxy .. ', ' .. maxz .. ')');

	for sx = minx, maxx do
		for sy = miny, maxy do
			for sz = 1, 14 do
				pos = {x=sx, y=sy, z=sz}
				local tileItems = {}
				local wall = false
				local door = false
				local window = false
				local houseId = getHouseFromPos(pos)
				for s = 0, 11 do
					pos.stackpos = s
					local thing = getThingFromPos(pos, false)
					if(thing.uid > 0) then
						local itemInfo = getItemInfo(thing.itemid)
						if((itemInfo["blockSolid"] and not itemInfo["blockProjectile"]) or WINDOWS[thing.itemid] ~= nil) then
							window = true
						elseif(itemInfo["blockSolid"] and itemInfo["blockProjectile"]) then
							wall = true
						end
						if(doors[thing.itemid] ~= nil or isInArray(horizontalOpenDoors, thing.itemid) or isInArray(verticalOpenDoors, thing.itemid) or isInArray(specialDoors, thing.itemid) or getItemLevelDoor(thing.itemid) > 0) then
							door = true
						end
						local item = thing.itemid .. ',' .. thing.type
						table.insert(tileItems, item)
					end
				end
				db.executeQuery('INSERT INTO `zhouse_tiles` (`houseid`, `x`, `y`, `z`, `items`, `wall`, `door`, `window`, `tilehouse`) VALUES (' .. param .. ', ' .. pos.x .. ', ' .. pos.y .. ', ' .. pos.z .. ', "' .. table.concat(tileItems, ";") .. '", ' .. tostring(wall) .. ', ' .. tostring(door) .. ', ' .. tostring(window) .. ', ' .. tostring(houseId) .. ')');
			end
		end
	end


	return true
end
