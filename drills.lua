local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
require ("__base__.prototypes.entity.pipecovers")
require ("__factorioplus__.util-building-additions")

local function electric_mining_grinder_status_colors()
  return
  {
    -- If no_power, idle, no_minable_resources, disabled, insufficient_input or full_output is used, always_draw of corresponding layer must be set to true to draw it in those states.

    no_power = { 0, 0, 0, 0 },                  -- If no_power is not specified or is nil, it defaults to clear color {0,0,0,0}

    idle = { 1, 0, 0, 1 },                      -- If idle is not specified or is nil, it defaults to white.
    no_minable_resources = { 1, 0, 0, 1 },      -- If no_minable_resources, disabled, insufficient_input or full_output are not specified or are nil, they default to idle color.
    insufficient_input = { 1, 1, 0, 1 },
    full_output = { 1, 1, 0, 1 },
    disabled = { 1, 1, 0, 1 },

    working = { 0, 1, 0, 1 },                   -- If working is not specified or is nil, it defaults to white.
    low_power = { 1, 1, 0, 1 },                 -- If low_power is not specified or is nil, it defaults to working color.
  }
end

local function electric_mininer_grinder_status_leds_working_visualisation()
  local led_blend_mode = nil -- "additive"
  local led_tint = {1,1,1,1}
  return
  {
    apply_tint = "status",
    always_draw = true,
    draw_as_light = true,
    north_animation =
	{
		layers =
		{
			{
			  filename = "__factorioplus__/graphics/electric-grinder/electric-grinder-led.png",
			  width = 40,
			  height = 160/4,
			  y = (160/4) * 0,
			  scale = 0.4,
			  blend_mode = led_blend_mode,
			  tint = led_tint,
			  shift = util.by_pixel(-50, -62),
			},
			{
			  filename = "__factorioplus__/graphics/electric-grinder/electric-grinder-led.png",
			  width = 40,
			  height = 160/4,
			  y = (160/4) * 0,
			  scale = 0.4,
			  blend_mode = led_blend_mode,
			  draw_as_light = true,
			  tint = led_tint,
			  shift = util.by_pixel(-50, -62),
			},
		},
	},
    east_animation =
    {
		layers =
		{
			{
			  filename = "__factorioplus__/graphics/electric-grinder/electric-grinder-led.png",
			  width = 40,
			  height = 160/4,
			  y = (160/4) * 1,
			  scale = 0.4,
			  blend_mode = led_blend_mode,
			  tint = led_tint,
			  shift = util.by_pixel(66, -46),
			},
			{
			  filename = "__factorioplus__/graphics/electric-grinder/electric-grinder-led.png",
			  width = 40,
			  height = 160/4,
			  y = (160/4) * 1,
			  scale = 0.4,
			  blend_mode = led_blend_mode,
			  draw_as_light = true,
			  tint = led_tint,
			  shift = util.by_pixel(66, -46),
			},
		},
    },
    south_animation =
    {
		layers =
		{
			{
			  filename = "__factorioplus__/graphics/electric-grinder/electric-grinder-led.png",
			  width = 40,
			  height = 160/4,
			  y = (160/4) * 2,
			  scale = 0.4,
			  blend_mode = led_blend_mode,
			  tint = led_tint,
			  shift = util.by_pixel(48, 55),
			},
			{
			  filename = "__factorioplus__/graphics/electric-grinder/electric-grinder-led.png",
			  width = 40,
			  height = 160/4,
			  y = (160/4) * 2,
			  scale = 0.4,
			  blend_mode = led_blend_mode,
			  draw_as_light = true,
			  tint = led_tint,
			  shift =  util.by_pixel(48, 55),
			},
		},
    },
    west_animation =
    {
		layers =
		{
			{
			  filename = "__factorioplus__/graphics/electric-grinder/electric-grinder-led.png",
			  width = 40,
			  height = 160/4,
			  y = (160/4) * 3,
			  scale = 0.4,
			  blend_mode = led_blend_mode,
			  tint = led_tint,
			  shift = util.by_pixel(-68, 38),
			},
			{
			  filename = "__factorioplus__/graphics/electric-grinder/electric-grinder-led.png",
			  width = 40,
			  height = 160/4,
			  y = (160/4) * 3,
			  scale = 0.4,
			  blend_mode = led_blend_mode,
			  draw_as_light = true,
			  tint = led_tint,
			  shift = util.by_pixel(-68, 38),
			},
		},
    },
  }
end

-- OVERRIDES --

data.raw["mining-drill"]["burner-mining-drill"].resource_searching_radius = 1.99
data.raw["mining-drill"]["burner-mining-drill"].energy_source.light_flicker = {color = {1/2,0.7/2,0.6/2}}
data.raw["mining-drill"]["burner-mining-drill"].radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
      width = 4,
      height = 4
    },

-- LARGE BURNER MINER DRILL --

data:extend({
	{
    type = "mining-drill",
    name = "large-burner-mining-drill",
    icon = "__factorioplus__/graphics/icons/large-burner-miner.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    resource_categories = {"basic-solid"},
    minable = {mining_time = 0.5, result = "large-burner-mining-drill"},
    max_health = 450,
    corpse = "burner-mining-drill-remnants",
    dying_explosion = "burner-mining-drill-explosion",
    collision_box = {{ -1.3, -1.3}, {1.3, 1.3}},
    selection_box = {{ -1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    mining_speed = 1.0,
	input_fluid_box =
    {
      pipe_picture = require("__base__.prototypes.entity.assembler-pictures").assembler2pipepictures,
      pipe_covers = pipecoverspictures(),
      volume = 100,
      pipe_connections =
      {
        { direction = defines.direction.south, position = {0, 1}}
      }
    },
     working_sound =
    {
      sound = sound_variations("__base__/sound/burner-mining-drill", 2, 0.6, volume_multiplier("tips-and-tricks", 0.8)),
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    allowed_effects = {}, -- no beacon effects on the burner drill
    energy_source =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 1,
      fuel_inventory_size = 2,
      emissions_per_minute = {pollution=24},
      light_flicker = {color = {1/1.5,0.7/1.5,0.6/1.5}},
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 8
        }
      }
    },
    energy_usage = "360kW",
	
	graphics_set =
    {
      drilling_vertical_movement_duration = 10 / electric_drill_animation_speed,
      animation_progress = 1,

      circuit_connector_layer = "object",
      circuit_connector_secondary_draw_order = { north = 14, east = 30, south = 30, west = 30 },

      animation =
      {
        north =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__factorioplus__/graphics/large-burner-miner/large-burner-mining-n.png",
              width = 1148/4,
              height = 746/2,
			  scale = 0.375,
			  line_length = 4,
              frame_count = 8,
              animation_speed = 1/2,
              shift = util.by_pixel(0, -18),
            },  
			{
			  filename = "__factorioplus__/graphics/large-burner-miner/large-burner-mining-drill-n-shadow.png",
			  priority = "high",
			  width = 339,
			  height = 285,
			  direction_count = 1,
			  shift = util.by_pixel(26, -18),
			  draw_as_shadow = true,
			  scale = 0.5,
			  repeat_count = 8,
			},		
          }
        },
        east =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__factorioplus__/graphics/large-burner-miner/large-burner-mining-e.png",
              width = 1148/4,
              height = 746/2,
			  scale = 0.375,
			  line_length = 4,
              frame_count = 8,
              animation_speed = 1/2,
              shift = util.by_pixel(0, -18),
            },    
			{
			  filename = "__factorioplus__/graphics/large-burner-miner/large-burner-mining-drill-e-shadow.png",
			  priority = "high",
			  width = 339,
			  height = 285,
			  direction_count = 1,
			  shift = util.by_pixel(26, -18),
			  draw_as_shadow = true,
			  scale = 0.5,
			  repeat_count = 8,
			},			
          }
        },
        south =
        {
          layers =
          {
           {
              priority = "high",
              filename = "__factorioplus__/graphics/large-burner-miner/large-burner-mining-s.png",
              width = 1148/4,
              height = 746/2,
			  scale = 0.375,
			  line_length = 4,
              frame_count = 8,
              animation_speed = 1/2,
              shift = util.by_pixel(0, -18),
            },  
			{
			  filename = "__factorioplus__/graphics/large-burner-miner/large-burner-mining-drill-s-shadow.png",
			  priority = "high",
			  width = 339,
			  height = 285,
			  direction_count = 1,
			  shift = util.by_pixel(26, -18),
			  draw_as_shadow = true,
			  scale = 0.5,
			  repeat_count = 8,
			},		
            
          }
        },
        west =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__factorioplus__/graphics/large-burner-miner/large-burner-mining-w.png",
              width = 1148/4,
              height = 746/2,
			  scale = 0.375,
			  line_length = 4,
              frame_count = 8,
              animation_speed = 1/2,
              shift = util.by_pixel(0, -18),
            },  
			{
			  filename = "__factorioplus__/graphics/large-burner-miner/large-burner-mining-drill-w-shadow.png",
			  priority = "high",
			  width = 339,
			  height = 285,
			  direction_count = 1,
			  shift = util.by_pixel(26, -18),
			  draw_as_shadow = true,
			  scale = 0.5,
			  repeat_count = 8,
			},					
          }
        },
      },
	},
	  
	wet_mining_graphics_set =
    {
      drilling_vertical_movement_duration = 10 / electric_drill_animation_speed,
      animation_progress = 1,

      circuit_connector_layer = "object",
      circuit_connector_secondary_draw_order = { north = 14, east = 30, south = 30, west = 30 },


      animation =
       {
        north =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__factorioplus__/graphics/large-burner-miner/large-burner-wet-mining-n.png",
              width = 1148/4,
              height = 746/2,
			  scale = 0.375,
			  line_length = 4,
              frame_count = 8,
              animation_speed = 1/2,
              shift = util.by_pixel(0, -18),
            },
			{
			  filename = "__factorioplus__/graphics/large-burner-miner/large-burner-mining-drill-n-shadow.png",
			  priority = "high",
			  width = 339,
			  height = 285,
			  direction_count = 1,
			  shift = util.by_pixel(26, -18),
			  draw_as_shadow = true,
			  scale = 0.5,
			  repeat_count = 8,
			},		
          }
        },
        east =
        {
          layers =
          {
           {
              priority = "high",
              filename = "__factorioplus__/graphics/large-burner-miner/large-burner-wet-mining-e.png",
              width = 1148/4,
              height = 746/2,
			  scale = 0.375,
			  line_length = 4,
              frame_count = 8,
              animation_speed = 1/2,
              shift = util.by_pixel(0, -18),
            },
			{
			  filename = "__factorioplus__/graphics/large-burner-miner/large-burner-mining-drill-e-shadow.png",
			  priority = "high",
			  width = 339,
			  height = 285,
			  direction_count = 1,
			  shift = util.by_pixel(26, -18),
			  draw_as_shadow = true,
			  scale = 0.5,
			  repeat_count = 8,
			},			
          }
        },
        south =
        {
          layers =
          {
           {
              priority = "high",
              filename = "__factorioplus__/graphics/large-burner-miner/large-burner-wet-mining-s.png",
              width = 1148/4,
              height = 746/2,
			  scale = 0.375,
			  line_length = 4,
              frame_count = 8,
              animation_speed = 1/2,
              shift = util.by_pixel(0, -18),
            },
			{
			  filename = "__factorioplus__/graphics/large-burner-miner/large-burner-mining-drill-s-shadow.png",
			  priority = "high",
			  width = 339,
			  height = 285,
			  direction_count = 1,
			  shift = util.by_pixel(26, -18),
			  draw_as_shadow = true,
			  scale = 0.5,
			  repeat_count = 8,
			},		
            
          }
        },
        west =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__factorioplus__/graphics/large-burner-miner/large-burner-wet-mining-w.png",
              width = 1148/4,
              height = 746/2,
			  scale = 0.375,
			  line_length = 4,
              frame_count = 8,
              animation_speed = 1/2,
              shift = util.by_pixel(0, -18),
            },
			{
			  filename = "__factorioplus__/graphics/large-burner-miner/large-burner-mining-drill-w-shadow.png",
			  priority = "high",
			  width = 339,
			  height = 285,
			  direction_count = 1,
			  shift = util.by_pixel(26, -18),
			  draw_as_shadow = true,
			  scale = 0.5,
			  repeat_count = 8,
			},					
          }
        },
      },

      shift_animation_waypoint_stop_duration = 195 / electric_drill_animation_speed,
      shift_animation_transition_duration = 30 / electric_drill_animation_speed,
      
    },
	
    monitor_visualization_tint = {r=78, g=173, b=255},
    resource_searching_radius = 3.5,
	radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
      width = 7,
      height = 7
    },
    vector_to_place_result = {-0.75, -1.75},
    fast_replaceable_group = "mining-drill",

    circuit_wire_connection_points = circuit_connector_definitions["burner-mining-drill"].points,
    circuit_connector_sprites = circuit_connector_definitions["burner-mining-drill"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  
	{
    type = "mining-drill",
    name = "electric-grinder",
    icon = "__factorioplus__/graphics/icons/electric-grinder.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1.25, result = "electric-grinder"},
    max_health = 600,
    resource_categories = {"basic-solid"},
    corpse = "electric-mining-drill-remnants",
    dying_explosion = "electric-mining-drill-explosion",
    collision_box = {{ -2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{ -2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
	input_fluid_box =
    {
      pipe_picture = require("__base__.prototypes.entity.assembler-pictures").assembler2pipepictures,
      pipe_covers = pipecoverspictures(),
      volume = 200,
      pipe_connections =
      {
        { direction = defines.direction.west, position = {-2, -1}},
        { direction = defines.direction.east, position = {2, -1}},
      }
    },
	working_sound =
		{
			  sound = sound_variations("__base__/sound/burner-mining-drill", 2, 0.5, volume_multiplier("tips-and-tricks", 0.8)),
			  fade_in_ticks = 4,
			  fade_out_ticks = 20
		},
    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,

    graphics_set =
    {
      status_colors = electric_mining_grinder_status_colors(),

      circuit_connector_layer = "object",
      circuit_connector_secondary_draw_order = { north = 14, east = 30, south = 30, west = 30 },

      animation =
      {
        north =
        {
          layers =
          {
				{
					priority = "high",
					filename = "__factorioplus__/graphics/electric-grinder/electric-grinder-miner.png",
					line_length = 4,
					width = 1980/4,
					height = 1904/4,
					y = (1904/4) * 0,
					scale = 0.38,
					frame_count = 4,
					animation_speed =  1/3,
					direction_count = 1,
					shift = util.by_pixel(0, 0),
				},
				{
					filename = "__factorioplus__/graphics/electric-grinder-shadow.png",
					priority = "high",
					width = 870,
					height = 720,
					repeat_count = 4,
					draw_as_shadow = true,
					shift = util.by_pixel(3, 5),
					scale = 0.2275
			   }
           }
        },
        east =
        {
           layers =
          {
            {
				priority = "high",
				filename = "__factorioplus__/graphics/electric-grinder/electric-grinder-miner.png",
				line_length = 4,
				width = 1980/4,
				height = 1904/4,
				y = (1904/4) * 1,
				scale = 0.38,
				frame_count = 4,
				animation_speed =  1/3,
				direction_count = 1,
				shift = util.by_pixel(0, 0),
			},
			{
				filename = "__factorioplus__/graphics/electric-grinder-shadow.png",
				priority = "high",
				width = 870,
				height = 720,
				repeat_count = 4,
				draw_as_shadow = true,
				shift = util.by_pixel(3, 5),
				scale = 0.2275
           }
           }
        },
        south =
        {
           layers =
          {
            {
				priority = "high",
				filename = "__factorioplus__/graphics/electric-grinder/electric-grinder-miner.png",
				line_length = 4,
				width = 1980/4,
				height = 1904/4,
				y = (1904/4) * 2,
				scale = 0.38,
				frame_count = 4,
				animation_speed =  1/3,
				direction_count = 1,
				shift = util.by_pixel(0, 0),
			},
			{
				filename = "__factorioplus__/graphics/electric-grinder-shadow.png",
				priority = "high",
				width = 870,
				height = 720,
				repeat_count = 4,
				draw_as_shadow = true,
				shift = util.by_pixel(3, 5),
				scale = 0.2275
           }
           }
        },
        west =
        {
           layers =
          {
            {
				priority = "high",
				filename = "__factorioplus__/graphics/electric-grinder/electric-grinder-miner.png",
				line_length = 4,
				width = 1980/4,
				height = 1904/4,
				y = (1904/4) * 3,
				scale = 0.38,
				frame_count = 4,
				animation_speed =  1/3,
				direction_count = 1,
				shift = util.by_pixel(0, 0),
			},
			{
				filename = "__factorioplus__/graphics/electric-grinder-shadow.png",
				priority = "high",
				width = 870,
				height = 720,
				repeat_count = 4,
				draw_as_shadow = true,
				shift = util.by_pixel(3, 5),
				scale = 0.2275
           }
           }
        },
      },
	  
	  working_visualisations =
		{
			electric_mininer_grinder_status_leds_working_visualisation(),
		},
	},	
	
	wet_mining_graphics_set =
    {

      status_colors = electric_mining_grinder_status_colors(),

      circuit_connector_layer = "object",
      circuit_connector_secondary_draw_order = { north = 14, east = 30, south = 30, west = 30 },

      animation =
      {
        north =
        {
          layers =
          {
				{
					priority = "high",
					filename = "__factorioplus__/graphics/electric-grinder/electric-grinder-miner-wet.png",
					line_length = 4,
					width = 1980/4,
					height = 1904/4,
					y = (1904/4) * 0,
					scale = 0.38,
					frame_count = 4,
					animation_speed =  1/3,
					direction_count = 1,
					shift = util.by_pixel(0, 0),
				},
				{
					filename = "__factorioplus__/graphics/electric-grinder-shadow.png",
					priority = "high",
					width = 870,
					height = 720,
					repeat_count = 4,
					draw_as_shadow = true,
					shift = util.by_pixel(3, 5),
					scale = 0.2275
			   }
           }
        },
        east =
        {
           layers =
          {
            {
				priority = "high",
				filename = "__factorioplus__/graphics/electric-grinder/electric-grinder-miner-wet.png",
				line_length = 4,
				width = 1980/4,
				height = 1904/4,
				y = (1904/4) * 1,
				scale = 0.38,
				frame_count = 4,
				animation_speed =  1/3,
				direction_count = 1,
				shift = util.by_pixel(0, 0),
			},
			{
				filename = "__factorioplus__/graphics/electric-grinder-shadow.png",
				priority = "high",
				width = 870,
				height = 720,
				repeat_count = 4,
				draw_as_shadow = true,
				shift = util.by_pixel(3, 5),
				scale = 0.2275
           }
           }
        },
        south =
        {
           layers =
          {
            {
				priority = "high",
				filename = "__factorioplus__/graphics/electric-grinder/electric-grinder-miner-wet.png",
				line_length = 4,
				width = 1980/4,
				height = 1904/4,
				y = (1904/4) * 2,
				scale = 0.38,
				frame_count = 4,
				animation_speed =  1/3,
				direction_count = 1,
				shift = util.by_pixel(0, 0),
			},
			{
				filename = "__factorioplus__/graphics/electric-grinder-shadow.png",
				priority = "high",
				width = 870,
				height = 720,
				repeat_count = 4,
				draw_as_shadow = true,
				shift = util.by_pixel(3, 5),
				scale = 0.2275
           }
           }
        },
        west =
        {
           layers =
          {
            {
				priority = "high",
				filename = "__factorioplus__/graphics/electric-grinder/electric-grinder-miner-wet.png",
				line_length = 4,
				width = 1980/4,
				height = 1904/4,
				y = (1904/4) * 3,
				scale = 0.38,
				frame_count = 4,
				animation_speed =  1/3,
				direction_count = 1,
				shift = util.by_pixel(0, 0),
			},
			{
				filename = "__factorioplus__/graphics/electric-grinder-shadow.png",
				priority = "high",
				width = 870,
				height = 720,
				repeat_count = 4,
				draw_as_shadow = true,
				shift = util.by_pixel(3, 5),
				scale = 0.2275
           }
           }
        },
      },
	  
	  working_visualisations =
		{
			electric_mininer_grinder_status_leds_working_visualisation(),
		},
	},	

    mining_speed = 0.2,
	effect_receiver = 
	{
		base_effect = 
		{
			productivity = 2,
		}
	},
	module_slots = 3,
	resource_drain_rate_percent = 50,
	
    energy_source =
    {
      type = "electric",
      emissions_per_minute ={pollution = 4},
      usage_priority = "secondary-input"
    },
	
    energy_usage = "125kW",
    resource_searching_radius = 5.5,
    vector_to_place_result = {0, -2.75},
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
      width = 10,
      height = 10
    },
    monitor_visualization_tint = {r=78, g=173, b=255},
    fast_replaceable_group = "mining-drill",

	circuit_connector = circuit_connector_definitions["grinder"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
	},

  
   {
    type = "mining-drill",
    name = "steam-turbine-miner",
    icon = "__factorioplus__/graphics/icons/turbine-miner.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    resource_categories = {"basic-solid"},
    minable = {mining_time = 0.75, result = "steam-turbine-miner"},
    max_health = 800,
    corpse = "burner-mining-drill-remnants",
    dying_explosion = "burner-mining-drill-explosion",
    collision_box = {{ -1.9, -2.4}, {1.9, 2.4}},
    selection_box = {{ -2.0, -2.5}, {2.0, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    mining_speed = 6.0,
	working_sound =
    {
      sound = sound_variations("__base__/sound/burner-mining-drill", 2, 0.5, volume_multiplier("tips-and-tricks", 0.8)),
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    allowed_effects = {}, -- no beacon effects on the burner drill

    energy_source =
    {
      type = "fluid",
      effectivity = 1,
      emissions_per_minute = {pollution=4},
	  maximum_temperature = 500,	  
	  fluid_box =
		{
		  production_type = "input-output",
		  pipe_picture = require("__base__.prototypes.entity.assembler-pictures").assembler2pipepictures,
		  pipe_covers = pipecoverspictures(),
		  volume = 100,
		  minimum_temperature = 100.0,
		  maximum_temperature = 1000.0,
		  filter = "steam",
		  pipe_connections =
		  {
			{flow_direction = "input-output",  direction = defines.direction.west,  position = {-1.5,2} },
			{flow_direction = "input-output",  direction = defines.direction.east,  position = {1.5, 2} }
		  }
		},
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.2, 0.2},
          frequency = 20
        }
      },
    },
    energy_usage = "0.8MW",
	graphics_set =
    {
		animation =
		{
		  north =
		  {
			layers =
			{
			  {
				priority = "high",
				width = 2048/4,
				height = 1024/2,
				 scale = 0.475,
				line_length = 4,
				shift = util.by_pixel(0, -26),
				filename = "__factorioplus__/graphics/turbine-miner-n.png",
				frame_count = 8,
				},
				{
				  filename = "__factorioplus__/graphics/steam-miner-n-shadow.png",
				  priority = "high",
				  width = 327,
				  height = 333, 
				  shift = util.by_pixel(14, -16),
				  draw_as_shadow = true,
				  scale = 0.65,
				  frame_count = 1,
				  repeat_count = 8,
				  },
			}
		  },
		  east =
		 {
			layers =
			{
			  {
				priority = "high",
				width = 2048/4,
				height = 1024/2,
				 scale = 0.4,
				line_length = 4,
				shift = util.by_pixel(0, -20),
				filename = "__factorioplus__/graphics/turbine-miner-e.png",
				frame_count = 8,
			  },
			   {
			  filename = "__factorioplus__/graphics/steam-miner-e-shadow.png",
			  priority = "high",
			  width = 327,
			  height = 333, 
			  shift = util.by_pixel(18, -18),
			  draw_as_shadow = true,
			  scale = 0.6,
			 frame_count = 1,
			  repeat_count = 8,
			  },
			}
		  },
		  south =
		 {
			layers =
			{
			  {
				priority = "high",
				width = 2048/4,
				height = 1024/2,
				 scale = 0.475,
				line_length = 4,
				shift = util.by_pixel(0, -24),
				filename = "__factorioplus__/graphics/turbine-miner-s.png",
				frame_count = 8,
			  },
			  {
			  filename = "__factorioplus__/graphics/steam-miner-s-shadow.png",
			  priority = "high",
			  width = 327,
			  height = 333, 
			  shift = util.by_pixel(14, -10),
			  draw_as_shadow = true,
			  scale = 0.65,
			 frame_count = 1,
			  repeat_count = 8,
			  },
			}
		  },
		  west =
		  {
			layers =
			{
			  {
				priority = "high",
				width = 2048/4,
				height = 1024/2,
				scale = 0.4,
				line_length = 4,
				shift = util.by_pixel(0, -20),
				filename = "__factorioplus__/graphics/turbine-miner-w.png",
				frame_count = 8,
			  },
			  {
			  filename = "__factorioplus__/graphics/steam-miner-w-shadow.png",
			  priority = "high",
			  width = 382,
			  height = 333, 
			  shift = util.by_pixel(30, -18),
			  draw_as_shadow = true,
			  scale = 0.6,
			  frame_count = 1,
			  repeat_count = 8,
			  },	
			}
		  },
		},
	},
    monitor_visualization_tint = {r=78, g=173, b=255},
    resource_searching_radius = 5,
	radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
      width = 10,
      height = 10
    },
    vector_to_place_result = {0.5, -2.65},
    fast_replaceable_group = "mining-drill",
  },
    ---------------------------------------------------  SAWMILL  ------------------------------------------------------------
  {
    type = "mining-drill",
    name = "electric-sawmill",
    icon = "__factorioplus__/graphics/icons/sawmill.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "electric-sawmill"},
    max_health = 600,
    resource_categories = {"wood-solid"},
    corpse = "electric-mining-drill-remnants",
    dying_explosion = "electric-mining-drill-explosion",
    collision_box = {{ -2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{ -2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/electric-mining-drill.ogg",
        volume = 0.5
      },
      audible_distance_modifier = 0.6,
      fade_in_ticks = 4,
      fade_out_ticks = 20,
    },
    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,

    graphics_set =
    {
      drilling_vertical_movement_duration = 10 / electric_drill_animation_speed,
      animation_progress = 1,
      min_animation_progress = 0,
      max_animation_progress = 30,

      circuit_connector_layer = "object",
      circuit_connector_secondary_draw_order = { north = 14, east = 30, south = 30, west = 30 },

      animation =
      {
        north =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__factorioplus__/graphics/sawmill-n.png",
              width = 2048/4,
              height = 1024/2,
			  scale = 0.4,
              frame_count = 8,
			  line_length = 4,
              animation_speed = electric_drill_animation_speed,
              direction_count = 1,
              shift = util.by_pixel(0, 0),
            },
			 {
              priority = "high",
              filename = "__factorioplus__/graphics/sawmill-n-shadow.png",
			  draw_as_shadow = true,
              width = 569,
              height = 490,
			  scale = 0.35,
              animation_speed = electric_drill_animation_speed,
              direction_count = 1,
			  repeat_count = 8,
              shift = util.by_pixel(16,0),
             },
          },
        },
        
        east =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__factorioplus__/graphics/sawmill-e.png",
              width = 2048/4,
              height = 1024/2,
			  scale = 0.4,
              frame_count = 8,
			  line_length = 4,
              animation_speed = electric_drill_animation_speed,
              direction_count = 1,
              shift = util.by_pixel(0, 0),
            },
			 {
              priority = "high",
              filename = "__factorioplus__/graphics/sawmill-e-shadow.png",
			   draw_as_shadow = true,
              width = 569,
              height = 490,
			  scale = 0.35,
              animation_speed = electric_drill_animation_speed,
              direction_count = 1,
			  repeat_count = 8,
              shift = util.by_pixel(16, 0),
             },
          }
        },
        south =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__factorioplus__/graphics/sawmill-s.png",
               width = 2048/4,
              height = 1024/2,
			  scale = 0.4,
              frame_count = 8,
			  line_length = 4,
              animation_speed = electric_drill_animation_speed,
              direction_count = 1,
              shift = util.by_pixel(0, 0),
            },   
 {
              priority = "high",
              filename = "__factorioplus__/graphics/sawmill-s-shadow.png",
			   draw_as_shadow = true,
              width = 569,
              height = 490,
			  scale = 0.35,
              animation_speed = electric_drill_animation_speed,
              direction_count = 1,
			  repeat_count = 8,
              shift = util.by_pixel(16, 0),
             },			
          },    
        },
        west =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__factorioplus__/graphics/sawmill-w.png",
              width = 2048/4,
              height = 1024/2,
			  scale = 0.4,
              frame_count = 8,
			  line_length = 4,
              animation_speed = electric_drill_animation_speed,
              direction_count = 1,
              shift = util.by_pixel(0, 0),
             },
			 {
              priority = "high",
              filename = "__factorioplus__/graphics/sawmill-w-shadow.png",
			   draw_as_shadow = true,
              width = 569,
              height = 490,
			  scale = 0.35,
              animation_speed = electric_drill_animation_speed,
              direction_count = 1,
			  repeat_count = 8,
              shift = util.by_pixel(16, 0),
             },
			 
			 
          }
        },
      },
	  working_visualisations =
	  {
		{	 
		-- BIG SMOKE
          fadeout = true,
          constant_speed = true,
          north_position = util.by_pixel_hr(-22, 18),
          east_position = util.by_pixel_hr(-76, -60),
          south_position = util.by_pixel_hr(20-8-6, -100-4),
          west_position = util.by_pixel_hr(76, -40),
          render_layer = "wires",
          animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
            frame_count = 47,
            line_length = 16,
            width = 90,
            height = 188,
            animation_speed = 0.2,
            shift = util.by_pixel(-2, -40),
            scale = 0.2,
			tint = {0.6, 0.6, 0.6},
          }
        },
        {
		-- WEE SMOKE
          fadeout = true,
          constant_speed = true,
          north_position = util.by_pixel_hr(-3, -6),
          east_position = util.by_pixel_hr(-76, -72),
          south_position = util.by_pixel_hr(30-4-4, -138),
          west_position = util.by_pixel_hr(76, -62),
          render_layer = "wires",
          animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-inner.png",
            frame_count = 47,
            line_length = 16,
            width = 40,
            height = 84,
            animation_speed = 0.4,
            shift = util.by_pixel(0, -14),
            scale = 0.25,
			tint = {0.8, 0.8, 0.8},
          }
        }
	  }
	},
    
    mining_speed = 0.25,
    energy_source =
    {
      type = "electric",
      emissions_per_minute = {pollution=4},
      usage_priority = "secondary-input"
    },
    energy_usage = "125kW",
    resource_searching_radius = 11.5,
	resource_searching_offset = {0, 9}, -- Waiting for patch 2.0.69
    vector_to_place_result = {0, -2.75},
    module_slots = 3,

    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
      width = 10,
      height = 10
    },
    monitor_visualization_tint = {r=78, g=173, b=255},
    --fast_replaceable_group = "mining-drill",

	circuit_connector = circuit_connector_definitions["sawmill"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
  },
    ---------------------------------------------------  GAS EXTRACTOR  ------------------------------------------------------------
  {
    type = "mining-drill",
    name = "gas-extractor",
    icon = "__factorioplus__/graphics/icons/gas-extractor.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1.25, result = "gas-extractor"},
    resource_categories = {"pressurized-gas"},
    max_health = 550,
    corpse = "pumpjack-remnants", --TODO
    dying_explosion = "pumpjack-explosion", --TODO
    collision_box = {{ -2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{ -2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box = {{-2.5, -2.5}, {2.5, 2.5}},
    energy_source =
    {
      type = "void",
		emissions_per_minute = { pollution = 4 },	  
    },
    output_fluid_box =
    {
	  production_type = "output",
      volume = 1000,
      pipe_picture = require("__base__.prototypes.entity.assembler-pictures").assembler2pipepictures,
	  pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {
		  direction = defines.direction.north,
          positions = { {2, -2}, {2, -2}, {-2, 2}, {-2, 2} },
          flow_direction = "output"
        }
      }
    },
    energy_usage = "50kW",
    mining_speed = 1,
    resource_searching_radius = 0.49,
    vector_to_place_result = {0, 0},
    -- module_slots = 2,
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
      width = 12,
      height = 12
    },
    monitor_visualization_tint = {r=78, g=173, b=255},
    base_render_layer = "object",
	use_mirroring = false,
	
	-- These have to be sliced to each direction. "north_animation" etc.

	
	graphics_set =
	{
		animation =
			{
			north =
			{
			  layers =
			  {
				 {
				priority = "high",
				filename = "__factorioplus__/graphics/gas-extractor-anim.png",
				animation_speed = 2,
				line_length = 4,			
				width = 500,
				height = 506,
				scale = 0.4,
				frame_count = 16,
				shift = util.by_pixel(0, -4),
				},
			  }
			}
		  },
		  
		  working_visualisations =
		  {
			  {
				always_draw = true, 
				secondary_draw_order = -1,
				
				north_animation =
				{
					
				  layers =
				  {
					{
					  filename = "__factorioplus__/graphics/gas-extractor.png",
					  priority = "extra-high",
					  width = 2000/4,
					  x = 0,
					  height = 469,
					  scale = 0.4,
					  shift = util.by_pixel(0, -16),	 
					  },
					{
					  filename = "__factorioplus__/graphics/gas-extractor-shadow.png",
					  priority = "extra-high",
					  width = 2488/4,
					  x = 0,
					  height = 469,
					  scale = 0.4,
					  shift = util.by_pixel(32, -16),
					  draw_as_shadow = true,
					},

				  }
				},
				
				east_animation =
				{
					
				  layers =
				  {
					{
					  filename = "__factorioplus__/graphics/gas-extractor.png",
					  priority = "extra-high",
					  width = 2000/4,
					  x = (2000/4) * 1,
					  height = 469,
					  scale = 0.4,
					  shift = util.by_pixel(0, -16),	 
					  },
					{
					  filename = "__factorioplus__/graphics/gas-extractor-shadow.png",
					  priority = "extra-high",
					  width = 2488/4,
					  x = (2488/4) * 1,
					  height = 469,
					  scale = 0.4,
					  shift = util.by_pixel(32, -16),
					  draw_as_shadow = true,
					},

				  }
				},
				
				
				south_animation =
				{
					
				  layers =
				  {
					{
					  filename = "__factorioplus__/graphics/gas-extractor.png",
					  priority = "extra-high",
					  width = 2000/4,
					  x = (2000/4) * 2,
					  height = 469,
					  scale = 0.4,
					  shift = util.by_pixel(0, -16),	 
					  },
					{
					  filename = "__factorioplus__/graphics/gas-extractor-shadow.png",
					  priority = "extra-high",
					  width = 2488/4,
					  x = (2488/4) * 2,
					  height = 469,
					  scale = 0.4,
					  shift = util.by_pixel(32, -16),
					  draw_as_shadow = true,
					},

				  }
				},
				
				
				west_animation =
				{
					
				  layers =
				  {
					{
					  filename = "__factorioplus__/graphics/gas-extractor.png",
					  priority = "extra-high",
					  width = 2000/4,
					  x = (2000/4) * 3,
					  height = 469,
					  scale = 0.4,
					  shift = util.by_pixel(0, -16),	 
					  },
					{
					  filename = "__factorioplus__/graphics/gas-extractor-shadow.png",
					  priority = "extra-high",
					  width = 2488/4,
					  x = (2488/4) * 3,
					  height = 469,
					  scale = 0.4,
					  shift = util.by_pixel(32, -16),
					  draw_as_shadow = true,
					},

				  }
				},
			},
			
			{
			  -- "resource-color" or "input-fluid-base-color" or "input-fluid-flow-color" or "status" or "none" or "visual-state-color"
			  apply_tint = "resource-color",
			  fadeout = true,
			  constant_speed = true,
			  north_position = util.by_pixel_hr(120, -128),
			  east_position = util.by_pixel_hr(120, -128),
			  south_position = util.by_pixel_hr(120, -128),
			  west_position = util.by_pixel_hr(120, -128),
			  render_layer = "wires",
			  animation =
			  {
				filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
				frame_count = 47,
				line_length = 16,
				width = 90,
				height = 188,
				animation_speed = 0.3,
				shift = util.by_pixel(-2, -40),
				scale = 0.3
			  }
			},
			{
			  apply_tint = "resource-color",
			  fadeout = true,
			  constant_speed = true,
			  north_position = util.by_pixel_hr(120, -128),
			  east_position = util.by_pixel_hr(120, -128),
			  south_position = util.by_pixel_hr(120, -128),
			  west_position = util.by_pixel_hr(120, -128),
			  render_layer = "wires",
			  animation =
			  {
				filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-inner.png",
				frame_count = 47,
				line_length = 16,
				width = 40,
				height = 84,
				animation_speed = 0.5,
				shift = util.by_pixel(0, -14),
				scale = 0.3
			  }
			}
			}
		},
	
	vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/pumpjack.ogg",
          volume = 0.8
        },
      },
      max_sounds_per_type = 3,
      audible_distance_modifier = 0.6,
      fade_in_ticks = 4,
      fade_out_ticks = 10,
    },
    --fast_replaceable_group = "pumpjack",
	-- NO MODULES ALLOWED!
	allowed_effects = {},
	circuit_connector = circuit_connector_definitions["extractor"],
   circuit_wire_max_distance = default_circuit_wire_max_distance,
  },
})