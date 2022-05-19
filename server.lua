RegisterServerEvent("kickedforbeingafk")
AddEventHandler("kickedforbeingafk", function()
	DropPlayer(source, "You were AFK for too long.")
end)