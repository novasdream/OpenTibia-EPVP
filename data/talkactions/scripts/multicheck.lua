function onSay(cid, words, param, channel) 
    local ips = {} 
	local playersTmp = getPlayersOnline()
	local players = {}
	for _, pid in pairs(playersTmp) do
		if(not isBot(pid) or isBotActive(pid)) then
			table.insert(players, pid)
		end
	end
    for i, pid in ipairs(players) do 
        local ip = getPlayerIp(pid) 
        if(param == "gm" or getPlayerGroupId(pid) <= 3) then 
            if(ips[ip] == nil) then 
                ips[ip] = {pid} 
            else 
                table.insert(ips[ip], pid) 
            end 
        end 
    end 

    table.sort(ips) 
    local anyMultiClient = false 
    for ip, list in pairs(ips) do 
        if(#list > 1) then 
            anyMultiClient = true 
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, #list .. " MCs with IP - " .. doConvertIntegerToIp(ip) .. " - " .. ip .. ":") 
            for i=1, #list do 
                local target = getCreatureTarget(list[i]) 
                if(target ~= 0) then 
                    target = getCreatureName(target) 
                end 
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, getCreatureName(list[i]) .. " [Level: " .. getPlayerLevel(list[i]) .. "][Target: " .. target .. "]") 
            end 
        end 
    end 
    if(not anyMultiClient) then 
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Currently there aren't any players with same IP address(es).") 
    end 
    return true 
end  