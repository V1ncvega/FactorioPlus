-- Space age overrides
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local item_effects = require("__space-age__.prototypes.item-effects")

data.raw["ammo"]["capture-robot-rocket"].ammo_type.target_filter = {
"biter-spawner-1", "biter-spawner-2", "biter-spawner-3", "biter-spawner-4", "biter-spawner-5", 
"spitter-spawner-1","spitter-spawner-2","spitter-spawner-3","spitter-spawner-4","spitter-spawner-5",
"tanker-spawner-1","tanker-spawner-2","tanker-spawner-3","tanker-spawner-4","tanker-spawner-5",
"blaster-spawner-1","blaster-spawner-2","blaster-spawner-3","blaster-spawner-4","blaster-spawner-5",
"swarmer-spawner-1","swarmer-spawner-2","swarmer-spawner-3","swarmer-spawner-4","swarmer-spawner-5",
}

table.insert(data.raw["technology"]["bacteria-cultivation"].effects ,  { type = "unlock-recipe",  recipe = "alumina-bacteria-cultivation" } )
table.insert(data.raw["technology"]["biochamber"].effects ,  { type = "unlock-recipe",  recipe = "alumina-bacteria" } )

data:extend({
 {
    type = "item",
    name = "alumina-bacteria",
    icon = "__factorioplus__/graphics/icons/alumina-bacteria.png",
    pictures =
    {
      { size = 64, filename = "__factorioplus__/graphics/icons/alumina-bacteria.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__factorioplus__/graphics/icons/alumina-bacteria-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__factorioplus__/graphics/icons/alumina-bacteria-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__factorioplus__/graphics/icons/alumina-bacteria-3.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "agriculture-processes",
    order = "b[agriculture]-c[alumina-bacteria]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "gleba",
    weight = 1 * kg,
    spoil_ticks = 1 * minute,
    spoil_result = "bauxite-ore"
  },
   {
    type = "recipe",
    name = "alumina-bacteria",
    icon = "__factorioplus__/graphics/icons/alumina-bacteria.png",
    categories = {"hand-crafting", "organic"},
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    subgroup = "agriculture-processes",
    order = "e[bacteria]-a[bacteria]-a[alumina]",
    enabled = false,
    allow_productivity = true,
    energy_required = 1,
    ingredients =
    {
      {type = "item", name = "jelly", amount = 3},
	  {type = "item", name = "yumako-mash", amount = 1},
    },
    results =
    {
      {type = "item", name = "alumina-bacteria", amount = 1, independent_probability = 0.1 },
      {type = "item", name = "spoilage", amount = 3}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.000, g = 0.500, b = 1.000, a = 1.000}, -- #007fffff
      secondary = {r = 0.095, g = 0.412, b = 0.822, a = 1.000}, -- #1868d1ff
    }
  },

  {
    type = "recipe",
    name = "alumina-bacteria-cultivation",
    icon = "__factorioplus__/graphics/icons/alumina-bacteria-cultivation.png",
    categories = {"organic"},
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    subgroup = "agriculture-processes",
    order = "e[bacteria]-b[cultivation]-a[alumina]",
    enabled = false,
    allow_productivity = true,
    energy_required = 6,
    ingredients =
    {
      {type = "item", name = "alumina-bacteria", amount = 1},
      {type = "item", name = "bioflux", amount = 1}
    },
    results =
    {
      {type = "item", name = "alumina-bacteria", amount = 4, always_fresh = true}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.000, g = 0.500, b = 1.000, a = 1.000}, -- #007fffff
      secondary = {r = 0.095, g = 0.412, b = 0.822, a = 1.000}, -- #1868d1ff
    },
    show_amount_in_title = false
  },
})

