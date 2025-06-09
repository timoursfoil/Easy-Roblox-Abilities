local ReplicatedStorage = game:GetService("ReplicatedStorage") -- Replicated Storage
local Events = ReplicatedStorage:WaitForChild("Events") -- Events folder for better storage
local ServerScriptService = game:GetService("ServerScriptService") -- Server Script Service
local Module = require(ServerScriptService:WaitForChild("Modules"):WaitForChild("AbilitiesModule")) -- Module of the abilities
local debounce = {} -- Debounce check for no spam/exploit



Events.UseAbility.OnServerEvent:Connect(function(player, abilityName) -- When you use the ability
	
	if debounce[player] then return end
	debounce[player] = true
	
	local findability = Module.FindAbility(abilityName)
	if findability == true then -- If the ability is real then continue
		local abilityrealname = abilityName.. "Ability"
		Module[abilityrealname](player) -- Plays the ability function
	
			debounce[player] = false
	
	end
end)
