# 🔥 Abilities Module for Roblox

A modular and extensible system for implementing character abilities in Roblox, designed for action or RPG-style games. This module handles animation playback, hitbox-based damage detection, cooldown management, and prevents input spamming through a built-in debounce system.

 Features
🔁 Cooldowns and Debounce logic to prevent ability spamming

🎞️ Animation support via Roblox animation assets

🎯 Hitbox-based collision to apply damage to nearby targets

🧱 Easy to expand with additional abilities via two Lua table

How to use it:
Create these new folders:
"Events" in ReplicatedStorage
"Modules" in ServerScriptService
"Scripts" in ServerScriptService

Then, create a new "RemoteEvent" instance, and name it "UseAbility". Place it inside of the Events folder.

Then, place the AbilitiesModule inside of Modules, AbilityScript inside of Scripts, and the Abilities LocalScript in StarterPlayerScripts.

After that, it should work perfectly!

To add more abilites, add them to both the tables in the ModuleScript and the LocalScript. Then, create a new function named (abilityname).. Ability. You can write the code for it there. The keycode to activate it is in the LocalScript.

Thanks for using my ability script!
