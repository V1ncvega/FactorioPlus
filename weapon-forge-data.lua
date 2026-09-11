local wforge_graphics = 
{
  animation =
  {
	layers =
	{
	  {
		filename = "__factorioplus__/graphics/weapon-forge-off.png",
		priority = "high",
		width = 256,
		height = 349,
		shift = util.by_pixel(-1.0, -18.0),
		scale = 0.4,
	  },
	  {
		filename = "__factorioplus__/graphics/weapon-forge-shadow.png",
		priority = "high",
		width = 256,
		height = 140,
		draw_as_shadow = true,
		shift = util.by_pixel(60, 4),
		scale = 0.6,
	  }
	}
  },
  working_visualisations =
  {
  
  },
  water_reflection =
  {
	pictures =
	{
	  filename = "__base__/graphics/entity/steel-furnace/steel-furnace-reflection.png",
	  priority = "extra-high",
	  width = 20,
	  height = 24,
	  shift = util.by_pixel(0, 45),
	  variation_count = 1,
	  scale = 5
	},
	rotate = false,
	orientation_to_variation = false
  }
}

local wforge_smoke =
{
	{
	  name = "smoke",
	  frequency = 10,
	  position = {-0.25, -5},
	  starting_vertical_speed = 0.04,
	  starting_frame_deviation = 60
	}
}

local wforge = util.copy(data.raw["furnace"]["steel-furnace"])
wforge.name = "weapon-forge"
wforge.icon = "__factorioplus__/graphics/icons/weapon-forge.png"
wforge.minable = {mining_time = 1, result = "weapon-forge"}
wforge.collision_box = {{-1.3, -1.3}, {1.3, 1.3}}
wforge.selection_box = {{-1.5, -1.5}, {1.5, 1.5}}
wforge.fast_replaceable_group = "weapon-forge"
wforge.crafting_categories = {"weapon-forge"}
wforge.crafting_speed = 1
wforge.graphics_set = wforge_graphics
wforge.energy_usage = "1000kW"
wforge.energy_source =
{
  type = "electric",
  usage_priority = "secondary-input",
  emissions_per_minute = { pollution = 1 }
}
wforge.icon_draw_specification = { scale = 1.0},
data.extend({ wforge })

local weaponforging_energyrequired_torare = 60 * 5
local weaponforging_energyrequired_toepic = weaponforging_energyrequired_torare * 2
local weaponforging_energyrequired_tolegendary = weaponforging_energyrequired_torare * 3

data.extend({ 
	{
		type = "item",
		name = "weapon-forge",
		icon = "__factorioplus__/graphics/icons/weapon-forge.png",
		icon_size = 64, icon_mipmaps = 4,
		hidden = true,
		--subgroup = "smelting-machine",
		--order = "cz[stone-furnace]",
		place_result = "weapon-forge",
		stack_size = 5
	},
  
  
	{ 
		type = "recipe",
		name = "pistol-rare",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_torare,
		ingredients = {{type="item", name="pistol-uncommon", amount=2}},
	    results = {{type="item", name="pistol-rare", amount=1}},
	},
	{ 
		type = "recipe",
		name = "pistol-epic",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_toepic,
		ingredients = {{type="item", name="pistol-rare", amount=2}},
		results = {{type="item", name="pistol-epic", amount=1}},
	},
	{ 
		type = "recipe",
		name = "pistol-legendary",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_tolegendary,
		ingredients = {{type="item", name="pistol-epic", amount=2}},
		results = {{type="item", name="pistol-legendary", amount=1}},
	},
	
	----------
	
	{ 
		type = "recipe",
		name = "magnum-rare",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_torare,
		ingredients = {{type="item", name="magnum-uncommon", amount=2}},
	    results = {{type="item", name="magnum-rare", amount=1}},
	},
	{ 
		type = "recipe",
		name = "magnum-epic",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_toepic,
		ingredients = {{type="item", name="magnum-rare", amount=2}},
		results = {{type="item", name="magnum-epic", amount=1}},
	},
	{ 
		type = "recipe",
		name = "magnum-legendary",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_tolegendary,
		ingredients = {{type="item", name="magnum-epic", amount=2}},
		results = {{type="item", name="magnum-legendary", amount=1}},
	},
	
	----------
	
	{ 
		type = "recipe",
		name = "submachine-gun-rare",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_torare,
		ingredients = {{type="item", name="submachine-gun-uncommon", amount=2}},
	    results = {{type="item", name="submachine-gun-rare", amount=1}},
	},
	{ 
		type = "recipe",
		name = "submachine-gun-epic",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_toepic,
		ingredients = {{type="item", name="submachine-gun-rare", amount=2}},
		results = {{type="item", name="submachine-gun-epic", amount=1}},
	},
	{ 
		type = "recipe",
		name = "submachine-gun-legendary",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_tolegendary,
		ingredients = {{type="item", name="submachine-gun-epic", amount=2}},
		results = {{type="item", name="submachine-gun-legendary", amount=1}},
	},
	
		----------
	
	{ 
		type = "recipe",
		name = "uzi-gun-rare",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_torare,
		ingredients = {{type="item", name="uzi-gun-uncommon", amount=2}},
	    results = {{type="item", name="uzi-gun-rare", amount=1}},
	},
	{ 
		type = "recipe",
		name = "uzi-gun-epic",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_toepic,
		ingredients = {{type="item", name="uzi-gun-rare", amount=2}},
		results = {{type="item", name="uzi-gun-epic", amount=1}},
	},
	{ 
		type = "recipe",
		name = "uzi-gun-legendary",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_tolegendary,
		ingredients = {{type="item", name="uzi-gun-epic", amount=2}},
		results = {{type="item", name="uzi-gun-legendary", amount=1}},
	},
	
		----------
	
	{ 
		type = "recipe",
		name = "shotgun-rare",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_torare,
		ingredients = {{type="item", name="shotgun-uncommon", amount=2}},
	    results = {{type="item", name="shotgun-rare", amount=1}},
	},
	{ 
		type = "recipe",
		name = "shotgun-epic",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_toepic,
		ingredients = {{type="item", name="shotgun-rare", amount=2}},
		results = {{type="item", name="shotgun-epic", amount=1}},
	},
	{ 
		type = "recipe",
		name = "shotgun-legendary",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_tolegendary,
		ingredients = {{type="item", name="shotgun-epic", amount=2}},
		results = {{type="item", name="shotgun-legendary", amount=1}},
	},
	
		----------
	
	{ 
		type = "recipe",
		name = "blunderbuss-rare",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_torare,
		ingredients = {{type="item", name="blunderbuss-uncommon", amount=2}},
	    results = {{type="item", name="blunderbuss-rare", amount=1}},
	},
	{ 
		type = "recipe",
		name = "blunderbuss-epic",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_toepic,
		ingredients = {{type="item", name="blunderbuss-rare", amount=2}},
		results = {{type="item", name="blunderbuss-epic", amount=1}},
	},
	{ 
		type = "recipe",
		name = "blunderbuss-legendary",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_tolegendary,
		ingredients = {{type="item", name="blunderbuss-epic", amount=2}},
		results = {{type="item", name="blunderbuss-legendary", amount=1}},
	},
	
		----------
	
	{ 
		type = "recipe",
		name = "combat-shotgun-rare",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_torare,
		ingredients = {{type="item", name="combat-shotgun-uncommon", amount=2}},
	    results = {{type="item", name="combat-shotgun-rare", amount=1}},
	},
	{ 
		type = "recipe",
		name = "combat-shotgun-epic",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_toepic,
		ingredients = {{type="item", name="combat-shotgun-rare", amount=2}},
		results = {{type="item", name="combat-shotgun-epic", amount=1}},
	},
	{ 
		type = "recipe",
		name = "combat-shotgun-legendary",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_tolegendary,
		ingredients = {{type="item", name="combat-shotgun-epic", amount=2}},
		results = {{type="item", name="combat-shotgun-legendary", amount=1}},
	},
	
		----------
	
	{ 
		type = "recipe",
		name = "sniper-rifle-rare",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_torare,
		ingredients = {{type="item", name="sniper-rifle-uncommon", amount=2}},
	    results = {{type="item", name="sniper-rifle-rare", amount=1}},
	},
	{ 
		type = "recipe",
		name = "sniper-rifle-epic",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_toepic,
		ingredients = {{type="item", name="sniper-rifle-rare", amount=2}},
		results = {{type="item", name="sniper-rifle-epic", amount=1}},
	},
	{ 
		type = "recipe",
		name = "sniper-rifle-legendary",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_tolegendary,
		ingredients = {{type="item", name="sniper-rifle-epic", amount=2}},
		results = {{type="item", name="sniper-rifle-legendary", amount=1}},
	},
	
		----------
	
	{ 
		type = "recipe",
		name = "flamethrower-rare",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_torare,
		ingredients = {{type="item", name="flamethrower-uncommon", amount=2}},
	    results = {{type="item", name="flamethrower-rare", amount=1}},
	},
	{ 
		type = "recipe",
		name = "flamethrower-epic",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_toepic,
		ingredients = {{type="item", name="flamethrower-rare", amount=2}},
		results = {{type="item", name="flamethrower-epic", amount=1}},
	},
	{ 
		type = "recipe",
		name = "flamethrower-legendary",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_tolegendary,
		ingredients = {{type="item", name="flamethrower-epic", amount=2}},
		results = {{type="item", name="flamethrower-legendary", amount=1}},
	},
	
		----------
	
	{ 
		type = "recipe",
		name = "grenade-launcher-rare",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_torare,
		ingredients = {{type="item", name="grenade-launcher-uncommon", amount=2}},
	    results = {{type="item", name="grenade-launcher-rare", amount=1}},
	},
	{ 
		type = "recipe",
		name = "grenade-launcher-epic",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_toepic,
		ingredients = {{type="item", name="grenade-launcher-rare", amount=2}},
		results = {{type="item", name="grenade-launcher-epic", amount=1}},
	},
	{ 
		type = "recipe",
		name = "grenade-launcher-legendary",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_tolegendary,
		ingredients = {{type="item", name="grenade-launcher-epic", amount=2}},
		results = {{type="item", name="grenade-launcher-legendary", amount=1}},
	},
	
		----------
	
	{ 
		type = "recipe",
		name = "rocket-launcher-rare",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_torare,
		ingredients = {{type="item", name="rocket-launcher-uncommon", amount=2}},
	    results = {{type="item", name="rocket-launcher-rare", amount=1}},
	},
	{ 
		type = "recipe",
		name = "rocket-launcher-epic",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_toepic,
		ingredients = {{type="item", name="rocket-launcher-rare", amount=2}},
		results = {{type="item", name="rocket-launcher-epic", amount=1}},
	},
	{ 
		type = "recipe",
		name = "rocket-launcher-legendary",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_tolegendary,
		ingredients = {{type="item", name="rocket-launcher-epic", amount=2}},
		results = {{type="item", name="rocket-launcher-legendary", amount=1}},
	},
	
		----------
	
	{ 
		type = "recipe",
		name = "multirocket-launcher-rare",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_torare,
		ingredients = {{type="item", name="multirocket-launcher-uncommon", amount=2}},
	    results = {{type="item", name="multirocket-launcher-rare", amount=1}},
	},
	{ 
		type = "recipe",
		name = "multirocket-launcher-epic",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_toepic,
		ingredients = {{type="item", name="multirocket-launcher-rare", amount=2}},
		results = {{type="item", name="multirocket-launcher-epic", amount=1}},
	},
	{ 
		type = "recipe",
		name = "multirocket-launcher-legendary",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_tolegendary,
		ingredients = {{type="item", name="multirocket-launcher-epic", amount=2}},
		results = {{type="item", name="multirocket-launcher-legendary", amount=1}},
	},
	
		----------
	
	{ 
		type = "recipe",
		name = "mini-gun-rare",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_torare,
		ingredients = {{type="item", name="mini-gun-uncommon", amount=2}},
	    results = {{type="item", name="mini-gun-rare", amount=1}},
	},
	{ 
		type = "recipe",
		name = "mini-gun-epic",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_toepic,
		ingredients = {{type="item", name="mini-gun-rare", amount=2}},
		results = {{type="item", name="mini-gun-epic", amount=1}},
	},
	{ 
		type = "recipe",
		name = "mini-gun-legendary",
		enabled = true,
		hidden = true,
		auto_recycle = false,
		categories = {"weapon-forge"},
		energy_required = weaponforging_energyrequired_tolegendary,
		ingredients = {{type="item", name="mini-gun-epic", amount=2}},
		results = {{type="item", name="mini-gun-legendary", amount=1}},
	},
})
