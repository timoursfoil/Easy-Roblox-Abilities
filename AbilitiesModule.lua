--ModuleScript. To be placed in ServerScriptService > Modules (folder)

local Players = game:GetService("Players") -- Player Service
local ServerScriptService = game:GetService("ServerScriptService") -- ServerScriptService for the Server Scripts
local Events = game:GetService("ReplicatedStorage"):WaitForChild("Events") -- Folder of the events
local debounce = {} -- Debounce to prevent players from spamming abilities

local abilities = { -- Table of the abilities
	Kick = { -- Basic ability as an example
		Damage = 5, -- How much damage it will do to humanoids around it
		Hitbox = Vector3.new(7.479, 10.182, 5.647), -- Hitbox of the ability (the range that it will hit enemies from)
		Animation = "rbxassetid://81035389795198", -- Animation to play to show ability
		Cooldown = 2 -- Cooldown before you can use the next ability
	},
	-- You can add more using that format

}

function abilities.FindAbility(abilityName: string) -- Check to find if the ability exists
	local ability = abilities[abilityName] -- Finding the ability
	if ability then
		return true -- Returns that the ability does exist
	else
		return nil -- Returns that the ability does not exist
	end
end

function abilities.KickAbility(player: Player) -- Function to Kick
	if debounce[player] then return end -- Debounce to stop spam
	debounce[player] = true

	local char = player.Character or player.CharacterAdded:Wait() -- Getting character
	local hum = char:WaitForChild("Humanoid") -- Getting your humanoid

	local animator = hum:FindFirstChildOfClass("Animator")
	if not animator then -- Finding/Creating an Animator to play animations
		animator = Instance.new("Animator")
		animator.Parent = hum
	end

	local ability = abilities.Kick -- Getting the ability from the table

	local anim = Instance.new("Animation") -- Creating a new animation to play
	anim.AnimationId = ability.Animation
	local track = animator:LoadAnimation(anim) -- Loading the animation to play
	track:Play() -- Playing the animation
	
	local CF = char:WaitForChild("HumanoidRootPart").CFrame -- CFrame of the part to use for the hitbox



	local hitbox = Instance.new("Part") -- Creating the hitbox
	hitbox.Size = abilities.Kick.Hitbox -- Setting the size of the hitbox to the ability's hitbox
	hitbox.Transparency = 1 -- Invisible
	hitbox.Anchored = true -- Stays in place
	hitbox.CanCollide = false -- Cannot be collided with
	hitbox.Massless = true -- It wont mess up physics
	hitbox.CFrame = CF + Vector3.new(0,0,-1) -- Places it infront of your character so it can hit, the Vector is offset.
	hitbox.Parent = workspace -- Put in workspace

	task.delay(0.05, function()
		hitbox:Destroy() -- Destroys the hitbox after 0.05 seconds
	end)

	local touched = {} -- Table to make sure that they dont get damaged multiple times

	for _, thing in pairs(workspace:GetPartsInPart(hitbox)) do
		if thing.Parent:FindFirstChild("Humanoid") and not touched[thing.Parent] and thing.Parent ~= char then
			local humanoid = thing.Parent:FindFirstChild("Humanoid")
			humanoid:TakeDamage(ability.Damage)
			table.insert(touched, thing.Parent)
			print(thing.Parent)
			-- Add whatever you need here to happen to the character
		end
	end


	-- Add whatever you need after this to happen before the ability is over (effects, other animations, etc)


	task.delay(ability.Cooldown, function()
		debounce[player] = false -- To let you use another ability
	end)
end



return abilities
