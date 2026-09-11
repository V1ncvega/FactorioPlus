data.raw["character"]["character"].mining_categories = {"basic-solid","wood-solid"}
data.raw["character"]["character"].inventory_size = 50
data.raw["character"]["character"].synced_footstep_particle_triggers = require("movement_triggers").character
table.insert(
	data.raw["character"]["character"].synced_footstep_particle_triggers,
	{
		tiles = { "water", "water-green"},

		type = "create-particle",
		repeat_count = 8,
		particle_name = "tintable-water-particle",
		apply_tile_tint = "primary",
		initial_height = 0.2,
		speed_from_center = 0.0075,
		speed_from_center_deviation = 0.05,
		initial_vertical_speed = 0.05,
		initial_vertical_speed_deviation = 0.05,
		offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
		tail_length = 4
	}
)

local pcs = data.raw["character"]["character"].collision_box[1][1]
data.raw["character"]["character"].crafting_speed = 1

if  settings.startup["settings-character-selection"].value == "kobold" then

data.raw["character"]["character"].running_speed = data.raw["character"]["character"].running_speed * 0.8
data.raw["character"]["character"].mining_speed = data.raw["character"]["character"].mining_speed * 4.0
data.raw["character"]["character"].max_health = data.raw["character"]["character"].max_health * 0.5
data.raw["character"]["character"].distance_per_frame = data.raw["character"]["character"].distance_per_frame * 0.8

pcs = pcs * -0.8
data.raw["character"]["character"].collision_box = {{-pcs, -pcs}, {pcs, pcs}} 
end

if  settings.startup["settings-character-selection"].value == "nimble" then
data.raw["character"]["character"].inventory_size = data.raw["character"]["character"].inventory_size - 30
data.raw["character"]["character"].running_speed = data.raw["character"]["character"].running_speed * 1.75
data.raw["character"]["character"].mining_speed = data.raw["character"]["character"].mining_speed * 0.75
data.raw["character"]["character"].distance_per_frame = data.raw["character"]["character"].distance_per_frame * 2
data.raw["character"]["character"].max_health = data.raw["character"]["character"].max_health / 2
data.raw["character"]["character"].guns_inventory_size = 2

pcs = pcs * -0.6
data.raw["character"]["character"].collision_box = {{-pcs, -pcs}, {pcs, pcs}} 
end

if  settings.startup["settings-character-selection"].value == "constructor" then
data.raw["character"]["character"].guns_inventory_size = 1
data.raw["character"]["character"].crafting_speed = data.raw["character"]["character"].crafting_speed * 3
data.raw["character"]["character"].inventory_size = data.raw["character"]["character"].inventory_size + 10
data.raw["character"]["character"].build_distance = data.raw["character"]["character"].build_distance * 2
data.raw["character"]["character"].reach_distance = data.raw["character"]["character"].reach_distance * 2
data.raw["character"]["character"].emissions_per_minute = {pollution = 20} 	 
data.raw["character"]["character"].healing_per_tick = data.raw["character"]["character"].healing_per_tick * 0
data.raw["character"]["character"].flags = {"placeable-off-grid", "not-on-map", "not-flammable", "get-by-unit-number"}
end

if  settings.startup["settings-character-selection"].value == "soldier" then
data.raw["character"]["character"].guns_inventory_size = 5
data.raw["character"]["character"].mining_speed = data.raw["character"]["character"].mining_speed * 0.5
data.raw["character"]["character"].crafting_speed = data.raw["character"]["character"].crafting_speed * 0.5
data.raw["character"]["character"].build_distance = data.raw["character"]["character"].build_distance * 0.5
data.raw["character"]["character"].reach_distance = data.raw["character"]["character"].reach_distance * 0.5
data.raw["character"]["character"].max_health = data.raw["character"]["character"].max_health * 1.5
data.raw["character"]["character"].healing_per_tick = data.raw["character"]["character"].healing_per_tick * 3
data.raw["character"]["character"].ticks_to_stay_in_combat = data.raw["character"]["character"].ticks_to_stay_in_combat * 0.5

pcs = pcs * -1.25
data.raw["character"]["character"].collision_box = {{-pcs, -pcs}, {pcs, pcs}} 
end

if  settings.startup["settings-character-selection"].value == "hauler" then
data.raw["character"]["character"].guns_inventory_size = 1
data.raw["character"]["character"].running_speed = data.raw["character"]["character"].running_speed * 0.8
data.raw["character"]["character"].inventory_size = data.raw["character"]["character"].inventory_size + 60
--table.insert(data.raw["character"]["character"].mining_categories, "advanced-crafting", "basic-solid" )
table.insert(data.raw["character"]["character"].crafting_categories, "advanced-crafting" )
-- data.raw["character"]["character"].crafting_categories = {"crafting","advanced-crafting"}
data.raw["character"]["character"].emissions_per_minute = {pollution = 8} 	 
data.raw["character"]["character"].healing_per_tick = data.raw["character"]["character"].healing_per_tick * 0
data.raw["character"]["character"].flags = {"placeable-off-grid", "not-on-map", "not-flammable", "get-by-unit-number"}
end

if  settings.startup["settings-character-selection"].value == "tank" then
data.raw["character"]["character"].guns_inventory_size = 2
data.raw["character"]["character"].max_health = data.raw["character"]["character"].max_health * 3
data.raw["character"]["character"].crafting_speed = data.raw["character"]["character"].crafting_speed * 0.75
data.raw["character"]["character"].build_distance = data.raw["character"]["character"].build_distance * 0.75
data.raw["character"]["character"].reach_distance = data.raw["character"]["character"].reach_distance * 0.75
data.raw["character"]["character"].healing_per_tick = data.raw["character"]["character"].healing_per_tick * 1.5
data.raw["character"]["character"].ticks_to_stay_in_combat = data.raw["character"]["character"].ticks_to_stay_in_combat * 0.01
data.raw["character"]["character"].mining_speed = data.raw["character"]["character"].mining_speed * 0.75

pcs = pcs * -1.5
data.raw["character"]["character"].collision_box = {{-pcs, -pcs}, {pcs, pcs}} 
end