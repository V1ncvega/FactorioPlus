local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local movement_triggers = require("__base__.prototypes.entity.movement-triggers")
local crash_site_assembling_machine_1_animation_speed = 1.5
local crash_site_assembling_machine_2_animation_speed = 1.5

local crash_site_sprite_priority = "very-low"


local cs_craft_speed = 0.5
local cs_research_speed = 0.5
local cs_wreckage_loot = nil
local cs_power_amount = "500kW"
local cs_ship_gear = nil

if settings.startup["settings-crashsite-bonus-buildingstats"].value == "more" then
	cs_craft_speed = 0.5
	cs_research_speed = 1
	 cs_power_amount = "1500kW"
elseif settings.startup["settings-crashsite-bonus-buildingstats"].value == "extra" then
	cs_craft_speed = 0.5
	cs_research_speed = 1.5
	cs_power_amount = "4000kW"
end

local wreck_flags =
{
  "placeable-player",
  "player-creation",
  "hidden",
  "not-rotatable",
  "placeable-off-grid",
  "not-blueprintable",
  "not-deconstructable"
}

function hr_crash_site_assembling_machine_1_ground()
  return
  {
      filename = "__factorioplus__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-1-ground.png",
      priority = crash_site_sprite_priority,
      width = 446,
      height = 234,
      shift = util.by_pixel(-31, 12),
      frame_count = 1,
      line_length = 1,
      scale = 0.5
  }
end

function hr_crash_site_assembling_machine_2_ground()
  return
  {

      filename = "__factorioplus__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-2-ground.png",
      priority = crash_site_sprite_priority,
      width = 290,
      height = 238,
      shift = util.by_pixel(-8, -10),
      frame_count = 1,
      line_length = 1,
      scale = 0.5
  }
end

function hr_crash_site_lab_ground()
  return
  {

      filename = "__factorioplus__/graphics/entity/crash-site-lab/hr-crash-site-lab-ground.png",
      priority = crash_site_sprite_priority,
      width = 700,
      height = 344,
      shift = util.by_pixel(-49, 11),
      frame_count = 1,
      line_length = 1,
      scale = 0.5

  }
end

-- REPLACE ENTRY data.raw["electric-pole"]["big-electric-pole"].maximum_wire_distance = 32
-- INSERT ENTRY table.insert(data.raw["technology"]["advanced-circuit-2"].effects,{type = "unlock-recipe",recipe = "silicon-wafer"})

data.raw["container"]["crash-site-spaceship-wreck-big-1"].inventory_size = 3
data.raw["container"]["crash-site-spaceship-wreck-big-2"].inventory_size = 3
data.raw["container"]["crash-site-spaceship-wreck-medium-1"].inventory_size = 2
data.raw["container"]["crash-site-spaceship-wreck-medium-2"].inventory_size = 2
data.raw["container"]["crash-site-spaceship-wreck-medium-3"].inventory_size = 2

data.raw["container"]["crash-site-chest-1"].inventory_size = 10
data.raw["container"]["crash-site-chest-2"].inventory_size = 10
data.raw["container"]["crash-site-chest-2"].minable = { mining_time = 1 }

data.raw["container"]["crash-site-spaceship"].inventory_size = 10
data.raw["container"]["crash-site-spaceship"].minable = nil
data.raw["container"]["crash-site-spaceship"].max_health = 10000


data:extend
({
----------------------------------- LAB -----------------------------------
{
    type = "lab",
    name = "crash-site-lab-repaired",
    icon = "__factorioplus__/graphics/icons/crash-site-lab-repaired.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-deconstructable", "placeable-player", "player-creation" },
	hidden = true,
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 350,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.2, -1.2}, {2.2, 1.2}},
    selection_box = {{-2.5, -1.5}, {2.5, 1.5}},
    entity_info_icon_shift = util.by_pixel(32, 0),
    light = {intensity = 0.9, size = 12, color = {r = 1.0, g = 1.0, b = 1.0}, shift = {1.5, 0.5}},
    integration_patch_render_layer = "decals",
    integration_patch = hr_crash_site_lab_ground(),

    on_animation =
    {
      layers =
      {
        {
            filename = "__factorioplus__/graphics/entity/crash-site-lab/hr-crash-site-lab-repaired.png",
            priority = crash_site_sprite_priority,
            width = 488,
            height = 252,
            frame_count = 1,
            line_length = 1,
            repeat_count = 24,
            animation_speed = 1 / 3,
            shift = util.by_pixel(-18, 14),
            scale = 0.5
        },
        {
            filename = "__factorioplus__/graphics/entity/crash-site-lab/hr-crash-site-lab-repaired-beams.png",
            priority = crash_site_sprite_priority,
            width = 130,
            height = 100,
            frame_count = 24,
            line_length = 6,
            animation_speed = 1 / 3,
            shift = util.by_pixel(37, -20),
            blend_mode = "additive",
            scale = 0.5
        },
        {
            filename = "__factorioplus__/graphics/entity/crash-site-lab/hr-crash-site-lab-repaired-shadow.png",
            priority = crash_site_sprite_priority,
            width = 696,
            height = 302,
            frame_count = 1,
            line_length = 1,
            repeat_count = 24,
            animation_speed = 1 / 3,
            shift = util.by_pixel(-11, 12),
            scale = 0.5,
            draw_as_shadow = true
        }
      }
    },
    off_animation =
    {
      layers =
      {
        {

            filename = "__factorioplus__/graphics/entity/crash-site-lab/hr-crash-site-lab-repaired.png",
            priority = crash_site_sprite_priority,
            width = 488,
            height = 252,
            frame_count = 1,
            line_length = 1,
            repeat_count = 24,
            animation_speed = 1 / 3,
            shift = util.by_pixel(-18, 14),
            scale = 0.5

        },
        {

            filename = "__factorioplus__/graphics/entity/crash-site-lab/hr-crash-site-lab-repaired-shadow.png",
            priority = crash_site_sprite_priority,
            width = 696,
            height = 302,
            frame_count = 1,
            line_length = 1,
            repeat_count = 24,
            animation_speed = 1 / 3,
            shift = util.by_pixel(-11, 12),
            scale = 0.5,
            draw_as_shadow = true

        }
      }
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/lab.ogg",
        volume = 0.7
      },
      audible_distance_modifier = 0.7,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = {pollution =4},
    },
    energy_usage = "60kW",
    researching_speed = cs_research_speed,
    inputs = { "automation-science-pack", "logistic-science-pack" }
  },
----------------------------------- ASSEMBLING MACHINE 1 -----------------------------------
{
    type = "assembling-machine",
    name = "crash-site-assembling-machine-1-repaired",
    icon = "__factorioplus__/graphics/icons/crash-site-assembling-machine-1-repaired.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-deconstructable", "not-rotatable"},
	hidden = true,
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.2, -0.7}, {1.2, 0.7}},
    selection_box = {{-1.5, -1}, {1.5, 1}},
    alert_icon_shift = util.by_pixel(-3, -12),
    integration_patch_render_layer = "decals",
    integration_patch = hr_crash_site_assembling_machine_1_ground(),
	
	graphics_set =
    {
		status_colors = {},
		
		animation =
		{
		  layers =
		  {
			{
				filename = "__factorioplus__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-1-repaired.png",
				priority = crash_site_sprite_priority,
				width = 282,
				height = 182,
				frame_count = 20,
				line_length = 5,
				shift = util.by_pixel(-12, 3),
				animation_speed = crash_site_assembling_machine_1_animation_speed,
				scale = 0.5
			},
			{

				filename = "__factorioplus__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-1-repaired-shadow.png",
				priority = crash_site_sprite_priority,
				width = 278,
				height = 168,
				frame_count = 20,
				line_length = 5,
				draw_as_shadow = true,
				shift = util.by_pixel(4, 6),
				animation_speed = crash_site_assembling_machine_1_animation_speed,
				scale = 0.5

			}
		  }
		},
	},
	
    working_visualisations =
    {
      {
        animation =
        {

            filename = "__factorioplus__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-1-repaired-light.png",
            priority = crash_site_sprite_priority,
            width = 162,
            height = 120,
            frame_count = 20,
            line_length = 5,
            shift = util.by_pixel(12, -8),
            blend_mode = "additive",
            animation_speed = crash_site_assembling_machine_1_animation_speed,
            scale = 0.5

        }
      }
    },
    crafting_categories = {"crafting" },
    crafting_speed = cs_craft_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = {pollution = 4 },
    },
    energy_usage = "90kW",
    ingredient_count = 2,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/assembling-machine-repaired-1.ogg",
          volume = 0.8
        },
      },
      --idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.3 },
      --max_sounds_per_type = 2,
    }
  },
  ----------------------------------- ASSEMBLING MACHINE 2 -----------------------------------
{
    type = "assembling-machine",
    name = "crash-site-assembling-machine-2-repaired",
    icon = "__factorioplus__/graphics/icons/crash-site-assembling-machine-2-repaired.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-deconstructable", "not-rotatable"},
	hidden = true,
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-0.7, -1.2}, {0.7, 1.2}},
    selection_box = {{-1, -1.5}, {1, 1.5}},
    alert_icon_shift = util.by_pixel(-3, -12),
    integration_patch_render_layer = "decals",
    integration_patch = hr_crash_site_assembling_machine_2_ground(),

	graphics_set =
    {
		status_colors = {},
		
		animation =
		{
		  layers =
		  {
			{

				filename = "__factorioplus__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-2-repaired.png",
				priority = crash_site_sprite_priority,
				width = 198,
				height = 200,
				frame_count = 20,
				line_length = 5,
				shift = util.by_pixel(-4, -11),
				animation_speed = crash_site_assembling_machine_2_animation_speed,
				scale = 0.5

			},
			{

				filename = "__factorioplus__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-2-repaired-shadow.png",
				priority = crash_site_sprite_priority,
				width = 208,
				height = 174,
				frame_count = 20,
				line_length = 5,
				draw_as_shadow = true,
				shift = util.by_pixel(3, -9),
				animation_speed = crash_site_assembling_machine_2_animation_speed,
				scale = 0.5

			}
		  },
		},
	},
	
    working_visualisations =
    {
      {
        animation =
        {

            filename = "__factorioplus__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-2-repaired-light.png",
            priority = crash_site_sprite_priority,
            width = 174,
            height = 124,
            frame_count = 20,
            line_length = 5,
            shift = util.by_pixel(-7, -4),
            blend_mode = "additive",
            animation_speed = crash_site_assembling_machine_2_animation_speed,
            scale = 0.5
 
        }
      }
    },
    crafting_categories = {"crafting" },
    crafting_speed = cs_craft_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = {pollution =4},
    },
    energy_usage = "90kW",
    ingredient_count = 2,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/assembling-machine-repaired-1.ogg",
          volume = 0.8
        },
      },
      --idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.3 },
      --max_sounds_per_type = 2,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
  },-- rotation 2 repaired
  ----------------------------------- E POLE  -----------------------------------
  {
    type = "electric-pole",
    name = "crash-site-electric-pole",
    icon = "__factorioplus__/graphics/icons/crash-site-electric-pole.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-deconstructable", "placeable-neutral",  "player-creation"},
	minable = 
	{
      mining_time = 0.25,
	  result = "crash-site-electric-pole",
    },
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 150,
    corpse = "small-remnants",
	dying_explosion = "medium-explosion",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.35, -0.35}, {0.35, 0.35}},
    drawing_box = {{-0.45, -0.45}, {0.45, 0.45}},
    maximum_wire_distance = 10.5,
    selectable_in_game = true,
    order="a",
    supply_area_distance = 4.5,
    impact_category = "metal",
	--vehicle_impact_sound = sounds.car_wood_impact(0.5),
	track_coverage_during_build_by_moving = true,
	 radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12,
      priority = "extra-high-no-scale"
    },
	integration_patch =
    {
      filename = "__factorioplus__/graphics/entity/crash-site-generator/hr-crash-site-generator-ground.png",
      priority = crash_site_sprite_priority,
      width = 192,
      height = 180,
      shift = util.by_pixel(-4, -9),
      frame_count = 1,
      line_length = 1,
	  scale = 0.2,
    },
    pictures =
    {
      layers =
      {
        {
          filename = "__factorioplus__/graphics/crashsite-electric-pole.png",
          width = 600/4,
          height= 174,
          direction_count = 4,
		  scale = 0.5,
		  shift = util.by_pixel(0, -30),
        },
		{
          filename = "__factorioplus__/graphics/crashsite-electric-poles-shadow.png",
          priority = "extra-high",
          width = 600/4,
          height = 76,
          direction_count = 4,
          shift = util.by_pixel(14, 4),
		  scale = 0.5,
          draw_as_shadow = true,
        }
      }
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = util.by_pixel(0, -2),
          red = util.by_pixel(0, 0),
          green = util.by_pixel(0, -9),
        },
        wire =
        {
          green = util.by_pixel(-16, -44),
          red = util.by_pixel(-27, -39),
          copper = util.by_pixel(-24, -50),
        }
      },
	  {
        shadow =
        {
          copper = util.by_pixel(0, 0),
          red = util.by_pixel(0, 0),
          green = util.by_pixel(0, 0),
        },
        wire =
        {
          green = util.by_pixel(8, -47),
          red = util.by_pixel(22, -50),
          copper = util.by_pixel(16, -40),
        }
      },
	  {
        shadow =
        {
          copper = util.by_pixel(0, 0),
          red = util.by_pixel(0, 0),
          green = util.by_pixel(0, 0),
        },
        wire =
        {
          green = util.by_pixel(-10, -46),
          red = util.by_pixel(2, -40),
          copper =util.by_pixel(-11, -38),
        }
      },
	  {
        shadow =
        {
          copper = util.by_pixel(0, 0),
          red = util.by_pixel(0, 0),
          green = util.by_pixel(0, 0),
        },
        wire =
        {
          green = util.by_pixel(-6, -35),
          red = util.by_pixel(6, -37),
          copper = util.by_pixel(6, -29),
        }
      },
    }
  },
    ----------------------------------- GENERATOR -----------------------------------
	
	{
    type = "electric-energy-interface",
    name = "crash-site-generator",
    icon = "__factorioplus__/graphics/icons/crash-site-generator.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-deconstructable", "placeable-player", "player-creation", "not-rotatable"},
	hidden = true,
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 350,
    corpse = "medium-remnants",
	dying_explosion = "medium-explosion",
    --subgroup = "other",
    collision_box = {{-1.5, -0.9}, {0.9, 0.9}},
    selection_box = {{-1.5, -0.9}, {0.9, 0.9}},
    allow_copy_paste = false,
    energy_source =
    {
      type = "electric",
      buffer_capacity = cs_power_amount,
      usage_priority = "primary-output",
      input_flow_limit = "0kW",
      output_flow_limit = cs_power_amount,
	  render_no_power_icon = false
    },

    energy_production = cs_power_amount,
    -- energy_usage = "0kW",
    light = {intensity = 0.75, size = 6, color = {r = 1.0, g = 1.0, b = 1.0}, shift = {64/64, -140/64}},
    continuous_animation = true,
    integration_patch_render_layer = "decals",
    -- also 'pictures' for 4-way sprite is available, or 'animation' resp. 'animations'
    integration_patch =
    {
        filename = "__factorioplus__/graphics/entity/crash-site-generator/hr-crash-site-generator-ground.png",
        priority = crash_site_sprite_priority,
        width = 384,
        height = 360,
        shift = util.by_pixel(-28, -38),
        frame_count = 1,
        line_length = 1,
        scale = 0.5
    },

    animation =
    {
      layers =
      {
        {

            filename = "__factorioplus__/graphics/entity/crash-site-generator/hr-crash-site-generator.png",
            priority = crash_site_sprite_priority,
            width = 286,
            height= 252,
            frame_count = 5,
            line_length = 5,
            repeat_count = 16,
            animation_speed = crash_site_generator_animation_speed,
            shift = util.by_pixel(-11, -23),
            scale = 0.5

        },
        {

            filename = "__factorioplus__/graphics/entity/crash-site-generator/hr-crash-site-generator-beams.png",
            priority = crash_site_sprite_priority,
            width = 224,
            height= 232,
            frame_count = 16,
            line_length = 4,
            repeat_count = 5,
            animation_speed = crash_site_generator_animation_speed,
            shift = util.by_pixel(-8, -30),
            scale = 0.5

        },
        {

            filename = "__factorioplus__/graphics/entity/crash-site-generator/hr-crash-site-generator-shadow.png",
            priority = crash_site_sprite_priority,
            width = 474,
            height= 152,
            frame_count = 1,
            line_length = 1,
            repeat_count = 80,
            draw_as_shadow = true,
            shift = util.by_pixel(25, 5),
            animation_speed = crash_site_generator_animation_speed,
            scale = 0.5

        },
      }
    },
    vehicle_impact_sound = sounds.generic_impact
  },
  
})
