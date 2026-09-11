-- Initial default values set.
local tVIAF = 1
local tVLF = 1
local tDLF = 1

if (settings.startup["settings-turrets-vet-bonus-increase"].value == "half" ) then
	tVIAF = 0.5
elseif (settings.startup["settings-turrets-vet-bonus-increase"].value == "double" ) then
	tVIAF = 2
else
	--do nothing (default)
end

turretValueIncreaseAmount = {0.05 * tVIAF ,0.1 * tVIAF,0.15 * tVIAF,0.25 * tVIAF}



if (settings.startup["settings-turrets-vet-damage-milestones"].value == "half" ) then
	tDLF = 0.5
elseif (settings.startup["settings-turrets-vet-damage-milestones"].value == "double" ) then
	tDLF = 2
else
	--do nothing (default)
end

turretDamageLevels = {2500 * tDLF, 5000 * tDLF, 12500 * tDLF, 32500 * tDLF}





if (settings.startup["settings-turrets-vet-kill-milestones"].value == "half" ) then
	tVLF = 0.5
elseif (settings.startup["settings-turrets-vet-kill-milestones"].value == "double" ) then
	tVLF = 2
else
	--do nothing (default)
end

turretKillLevels = {50 * tVLF, 150 * tVLF, 250 * tVLF, 650 * tVLF}



---

turretVetIcons = {"icon-veterancy-1", "icon-veterancy-2", "icon-veterancy-3", "icon-veterancy-4"}


-- Note: The turret upgrade control script only searches to see if it exists. 
-- And it won't upgrade a turret if it cannot find the entry in here.
-- So you can enter non-existant turrets into the list and it won't mess up. e.g. ["ice-turret"]

turretVetGroupings = {
  ["pistol-turret"] = {
    "pistol-turret-veterancy-1",
    "pistol-turret-veterancy-2",
    "pistol-turret-veterancy-3",
    "pistol-turret-veterancy-4"
  },
  ["cannon-turret"] = {
    "cannon-turret-veterancy-1",
    "cannon-turret-veterancy-2",
    "cannon-turret-veterancy-3",
    "cannon-turret-veterancy-4"
  },
  ["chaingun-turret"] = {
    "chaingun-turret-veterancy-1",
    "chaingun-turret-veterancy-2",
    "chaingun-turret-veterancy-3",
    "chaingun-turret-veterancy-4"
  },
  ["flamethrower-turret"] = {
    "flamethrower-turret-veterancy-1",
    "flamethrower-turret-veterancy-2",
    "flamethrower-turret-veterancy-3",
    "flamethrower-turret-veterancy-4"
  },
  ["gun-turret"] = {
    "gun-turret-veterancy-1",
    "gun-turret-veterancy-2",
    "gun-turret-veterancy-3",
    "gun-turret-veterancy-4"
  },
    ["heavygun-turret"] = {
    "heavygun-turret-veterancy-1",
    "heavygun-turret-veterancy-2",
    "heavygun-turret-veterancy-3",
    "heavygun-turret-veterancy-4"
  },
  ["laser-turret"] = {
    "laser-turret-veterancy-1",
    "laser-turret-veterancy-2",
    "laser-turret-veterancy-3",
    "laser-turret-veterancy-4"
  },
  ["rocket-turret"] = {
    "rocket-turret-veterancy-1",
    "rocket-turret-veterancy-2",
    "rocket-turret-veterancy-3",
    "rocket-turret-veterancy-4"
  },
    ["mortar-turret"] = {
    "mortar-turret-veterancy-1",
    "mortar-turret-veterancy-2",
    "mortar-turret-veterancy-3",
    "mortar-turret-veterancy-4"
  },
  ["sniper-turret"] = {
    "sniper-turret-veterancy-1",
    "sniper-turret-veterancy-2",
    "sniper-turret-veterancy-3",
    "sniper-turret-veterancy-4"
  },
    ["large-laser-turret"] = {
    "large-laser-turret-veterancy-1",
    "large-laser-turret-veterancy-2",
    "large-laser-turret-veterancy-3",
    "large-laser-turret-veterancy-4"
  },
  ["shotgun-turret"] = {
    "shotgun-turret-veterancy-1",
    "shotgun-turret-veterancy-2",
    "shotgun-turret-veterancy-3",
    "shotgun-turret-veterancy-4"
  },
  ["railgun-turret"] = {
    "railgun-turret-veterancy-1",
    "railgun-turret-veterancy-2",
    "railgun-turret-veterancy-3",
    "railgun-turret-veterancy-4"
  },
  ["tesla-turret"] = {
    "tesla-turret-veterancy-1",
    "tesla-turret-veterancy-2",
    "tesla-turret-veterancy-3",
    "tesla-turret-veterancy-4"
  },
    ["rocket-battery"] = {
    "rocket-battery-veterancy-1",
    "rocket-battery-veterancy-2",
    "rocket-battery-veterancy-3",
    "rocket-battery-veterancy-4"
  }
  
}