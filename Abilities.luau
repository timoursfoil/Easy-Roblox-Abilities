--Local Script. To be placed in StarterPlayerScripts.

local Players = game:GetService("Players") -- Players Service
local player = Players.LocalPlayer -- Your player
local UserInputService = game:GetService("UserInputService") -- For tracking User Inputs
local ReplicatedStorage = game:GetService("ReplicatedStorage") -- Replicated to the client.
local Events = ReplicatedStorage:WaitForChild("Events") -- Events folder for better storage

local abilities = { -- Table of all your abilitys
	["E"] = "Kick"
	-- ["F"] (keycode on keyboard) = "Dive" (ability name)
	
}

UserInputService.InputBegan:Connect(function(input, gameProcessed) -- When you press a key on the keyboard
	if gameProcessed then return end -- Don't trigger when typing in chat, in guis, etc.

	local key = input.KeyCode.Name -- Gets the name of the key (E, F, U, etc)
	local ability = abilities[key] -- Looks through your abilities table for the ability corresponding to the keycode.
	if ability then -- If the ability is found
		Events.UseAbility:FireServer(ability) -- Fires the event to the server to play ability
		-- Makes it so that other people can see the ability, also better to stopping exploiters.
	end
	
end)
