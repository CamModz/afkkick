-- CONFIG --

-- AFK Kick Time edit if wanted
secondsUntilKick = 200

kickWarning = true

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1000)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)

			if currentPos == prevPos then
				if time > 0 then
			        	if kickWarning and time == math.ceil(secondsUntilKick / 4) then
						TriggerEvent("chatMessage", "WARNING", {255, 225, 0}, "^1You are going to be kicked in " .. time .. " seconds for being AFK!")
				        	end
						
					time = time - 1
				else
					TriggerServerEvent("kickedforbeingafk")
				end
			else
				time = secondsUntilKick
			end

			prevPos = currentPos
		end
	end
end)
