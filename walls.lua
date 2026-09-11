local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
 
 woodtint = {r=0.5, g=0.35, b=0.25, a=1}
 reinforcedtint = {r=0.6, g=0.6, b=0.6, a=1}
 wall_y_shift = -6
 
 data.raw["wall"]["stone-wall"].hide_resistances = false
 
 data:extend({
{
    type = "wall",
    name = "basic-wall",
    icon = "__factorioplus__/graphics/icons/basic-wall.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation", "not-repairable"},
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.wall(),
    minable = 
	{ 
		transfer_entity_health_to_products = false,
		mining_time = 0.25, 
		results = 
		{
			{type= "item", name = "stone", amount = 2}, 
		},
   },
    fast_replaceable_group = "wall",
	next_upgrade = "stone-wall",
    max_health = 300,
    repair_speed_modifier = 0,
	
	loot =
	{
		{
			amount_max = 2,
			amount_min = 0,
			type = "item",
			name = "stone",
			independent_probability = 1
		},
	},
    dying_explosion = "wall-explosion",
    repair_sound = sounds.manual_repair,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg",volume = 0.8},
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.car_stone_impact,
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
        percent = 50
      },
      {
        type = "impact",
        decrease = 10,
        percent = 10
      },
      {
        type = "laser",
        percent = 50
      },
	  {
        type = "fire",
        percent = 90
      },
	  {
        type = "acid",
        percent = 25
      }
    },
	hide_resistances = false,
    visual_merge_group = 1, -- different walls will visually connect to each other if their merge group is same (defaults to 0)
    pictures =
    {
      single =
      {
        layers =
        {
          {
            filename = "__factorioplus__/graphics/basicwall/wall-s.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, wall_y_shift),
			scale = 0.4,
          },
		  {
			  filename = "__factorioplus__/graphics/basicwall/wall-s-shadow.png",
			  priority = "extra-high",
			  width = 128,
			  height = 128,
			  repeat_count = 1,
			  shift = util.by_pixel(4, wall_y_shift+1),
			  draw_as_shadow = true,
			  scale = 0.4,
          }
        }
      },
      straight_vertical =
      {
		layers =
        {
          {
            filename = "__factorioplus__/graphics/basicwall/wall-v.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, wall_y_shift),
			scale = 0.4,
          },
		  {
			  filename = "__factorioplus__/graphics/basicwall/wall-s-shadow.png",
			  priority = "extra-high",
			  width = 128,
			  height = 128,
			  repeat_count = 1,
			  shift = util.by_pixel(4, wall_y_shift+1),
			  draw_as_shadow = true,
			  scale = 0.4,
          }
        }
      },
      straight_horizontal =
      {
		layers =
        {
          {
            filename = "__factorioplus__/graphics/basicwall/wall-h.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, wall_y_shift),
			scale = 0.4,
          },
		  {
			  filename = "__factorioplus__/graphics/basicwall/wall-s-shadow.png",
			  priority = "extra-high",
			  width = 128,
			  height = 128,
			  repeat_count = 1,
			  shift = util.by_pixel(4, wall_y_shift+1),
			  draw_as_shadow = true,
			  scale = 0.4,
          }
        }
      },
      corner_right_down =
      {
		layers =
        {
          {
            filename = "__factorioplus__/graphics/basicwall/wall-r.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, wall_y_shift),
			scale = 0.4,
          },
		  {
			  filename = "__factorioplus__/graphics/basicwall/wall-s-shadow.png",
			  priority = "extra-high",
			  width = 128,
			  height = 128,
			  repeat_count = 1,
			  shift = util.by_pixel(4, wall_y_shift+1),
			  draw_as_shadow = true,
			  scale = 0.4,
          }
        }
      },
      corner_left_down =
      {
		layers =
        {
          {
            filename = "__factorioplus__/graphics/basicwall/wall-l.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, wall_y_shift),
			scale = 0.4,
          },
		  {
			  filename = "__factorioplus__/graphics/basicwall/wall-s-shadow.png",
			  priority = "extra-high",
			  width = 128,
			  height = 128,
			  repeat_count = 1,
			  shift = util.by_pixel(4, wall_y_shift+1),
			  draw_as_shadow = true,
			  scale = 0.4,
          }
        }
      },
      t_up =
      {
		layers =
        {
          {
			filename = "__factorioplus__/graphics/basicwall/wall-td.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, wall_y_shift),
			scale = 0.4,
          },
		  {
			  filename = "__factorioplus__/graphics/basicwall/wall-s-shadow.png",
			  priority = "extra-high",
			  width = 128,
			  height = 128,
			  repeat_count = 1,
			  shift = util.by_pixel(4, wall_y_shift+1),
			  draw_as_shadow = true,
			  scale = 0.4,
          }
        }
      },
      ending_right =
      {
		layers =
        {
          {
			filename = "__factorioplus__/graphics/basicwall/wall-rh.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, wall_y_shift),
			scale = 0.4,
          },
		  {
			  filename = "__factorioplus__/graphics/basicwall/wall-s-shadow.png",
			  priority = "extra-high",
			  width = 128,
			  height = 128,
			  repeat_count = 1,
			  shift = util.by_pixel(4, wall_y_shift+1),
			  draw_as_shadow = true,
			  scale = 0.4,
          }
        }
      },
      ending_left =
      {
		layers =
        {
          {
			filename = "__factorioplus__/graphics/basicwall/wall-lh.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, wall_y_shift),
			scale = 0.4,
          },
		  {
			  filename = "__factorioplus__/graphics/basicwall/wall-s-shadow.png",
			  priority = "extra-high",
			  width = 128,
			  height = 128,
			  repeat_count = 1,
			  shift = util.by_pixel(4, wall_y_shift+1),
			  draw_as_shadow = true,
			  scale = 0.4,
          }
        }
      },
      filling =
		{
			filename = "__factorioplus__/graphics/basicwall/wall-f.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			variation_count = 1,
			line_length = 1,
			shift = util.by_pixel(0, -2),
			scale = 0.4,
		},
		{
			  filename = "__factorioplus__/graphics/basicwall/wall-s-shadow.png",
			  priority = "extra-high",
			  width = 128,
			  height = 128,
			  repeat_count = 1,
			  shift = util.by_pixel(4, wall_y_shift+1),
			  draw_as_shadow = true,
			  scale = 0.4,
          }     
    },
  },
  })
  