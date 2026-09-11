-- This is where the additional building bits are applied
-- CIRCUIT CONNECTIONS
-- STATUS LIGHTS


function generic_status_colors()
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
    low_power = { 1, 0.75, 0, 1 },                 -- If low_power is not specified or is nil, it defaults to working color.
  }
end

local visobj_width = 81
local visobj_height = 73
local visobj_scale = 0.4


-- This function adds the small object that holds the status light
function generic_status_visualisation_object(cb)
local cbcoord_ns = {cb[1][1]+0.3, cb[2][2]-0.1}
local cbcoord_ew = {cb[1][2]+0.3, cb[2][1]-0.1}
	return
	{
		{
			always_draw = true,
			north_position = cbcoord_ns,
			east_position = cbcoord_ew,
			south_position = cbcoord_ns,
			west_position = cbcoord_ew,
			--secondary_draw_order  = 0,
			animation =
			{
			  filename = "__factorioplus__/graphics/working-visualizer/workingvisualizer_generic.png",
			  width = visobj_width,
			  height = visobj_height,
			  scale =visobj_scale,
			  shift = util.by_pixel(0, 0),
			},
		},
		{
			always_draw = true,
			north_position = cbcoord_ns,
			east_position = cbcoord_ew,
			south_position = cbcoord_ns,
			west_position = cbcoord_ew,
			--secondary_draw_order  = 0,
			animation =
			{
			  filename = "__factorioplus__/graphics/working-visualizer/workingvisualizer_generic_shadow.png",
			  width = 110,
			  height = 85,
			  scale = visobj_scale,
			  draw_as_shadow = true,
			  shift = util.by_pixel(6, 1),
			},
		},
		{
			apply_tint = "status",
			always_draw = true,
			--draw_as_light = true,
			north_position = cbcoord_ns,
			east_position = cbcoord_ew,
			south_position = cbcoord_ns,
			west_position = cbcoord_ew,
			--secondary_draw_order  = 1,
			animation =
			{
				
			  filename = "__factorioplus__/graphics/working-visualizer/workingvisualizer_generic_light.png",
			   width = 81,
			  height = 73,
			  scale = 0.4,
			  
			  blend_mode = "additive",
			  --draw_as_light = true,
			  tint = {1,1,1,1},
			  
			  shift = util.by_pixel(0, 0),
			},
		},
		{
			apply_tint = "status",
			always_draw = true,
			--draw_as_light = true,
			north_position = cbcoord_ns,
			east_position = cbcoord_ew,
			south_position = cbcoord_ns,
			west_position = cbcoord_ew,
			--secondary_draw_order  = 1,
			animation =
			{
				
			  filename = "__factorioplus__/graphics/working-visualizer/workingvisualizer_generic_light_glow.png",
			   width = 81,
			  height = 73,
			  scale = 0.4,
			  
			  blend_mode = "additive",
			  draw_as_light = true,
			  tint = {1,1,1,1},
			  
			  shift = util.by_pixel(0, 0),
			},
		},
	}
end

function generic_status_visualisation_object_light(cb)
local cbcoord_ns = {cb[1][1]+0.3, cb[2][2]-0.1}
local cbcoord_ew = {cb[2][2]+0.3, cb[1][1]-0.1}
	return
	{
		{
			apply_tint = "status",
			always_draw = true,
			--draw_as_light = true,
			north_position = cbcoord_ns,
			east_position = cbcoord_ew,
			south_position = cbcoord_ns,
			west_position = cbcoord_ew,
			--secondary_draw_order  = 1,
			animation =
			{
				
			  filename = "__factorioplus__/graphics/working-visualizer/workingvisualizer_generic_light.png",
			   width = 81,
			  height = 73,
			  scale = 0.4,
			  
			  blend_mode = "additive",
			  --draw_as_light = true,
			  tint = {1,1,1,1},
			  
			  shift = util.by_pixel(0, 0),
			},
		},
		{
			apply_tint = "status",
			always_draw = true,
			--draw_as_light = true,
			north_position = cbcoord_ns,
			east_position = cbcoord_ew,
			south_position = cbcoord_ns,
			west_position = cbcoord_ew,
			--secondary_draw_order  = 1,
			animation =
			{
				
			  filename = "__factorioplus__/graphics/working-visualizer/workingvisualizer_generic_light_glow.png",
			   width = 81,
			  height = 73,
			  scale = 0.4,
			  
			  blend_mode = "additive",
			  draw_as_light = true,
			  tint = {1,1,1,1},
			  
			  shift = util.by_pixel(0, 0),
			},
		},
	}
end

-- This function adds the lamps
local function generic_status_leds_working_visualisation()
  local led_blend_mode = nil -- "additive"
  local led_tint = {1,1,1,1}
  return
  {
    apply_tint = "status",
    always_draw = true,
    draw_as_light = true,
    north_animation =
    {
      filename = "__factorioplus__/graphics/electric-grinder-n-led.png",
      width = 40,
      height = 30,
	  scale = 0.4,
      blend_mode = led_blend_mode,
	  draw_as_light = true,
      tint = led_tint,
      shift = util.by_pixel(-50, -62),
    },
    east_animation =
    {
      filename = "__factorioplus__/graphics/electric-grinder-e-led.png",
      width = 30,
      height = 40,
      blend_mode = led_blend_mode,
	  draw_as_light = true,
	  scale = 0.4,
      tint = led_tint,
      shift = util.by_pixel(61, -52),
    },
    south_animation =
    {
      filename = "__factorioplus__/graphics/electric-grinder-s-led.png",
      width = 40,
      height = 30,
      blend_mode = led_blend_mode,
	  draw_as_light = true,
	  scale = 0.4,
      tint = led_tint,
      shift = util.by_pixel(51.5, 46),
    },
    west_animation =
    {
      filename = "__factorioplus__/graphics/electric-grinder-w-led.png",
      width = 30,
      height = 40,
      blend_mode = led_blend_mode,
	  draw_as_light = true,
	  scale = 0.4,
      tint = led_tint,
      shift = util.by_pixel(-62, 36),
    },
  }
end

-- This function will go through a list of entities to apply a status panel to it.
-- If it already has a status_color table, it does not need one.
-- But if it already has visualizers (from coloured dust, or recipe smoke like a chem plant) we insert them into the table.

 
function apply_generic_workingvis_to_all(entity_type)
local _setting = settings.startup["settings-status-panels"].value
local _hascolors
local _notelectric
local _void
	if (_setting ~= "none" ) then
		for i, v in pairs(data.raw[entity_type]) do
	
			if (v.graphics_set) then
				_hascolors = false
				_burner = false
				_void = false
			
				local collision_box = v.collision_box 
				if (v.energy_source.type == "burner" and _setting ~= "all" ) then
					_burner = true
				end		
				if (v.energy_source.type == "void" ) then
					_void = true
				end					
				
				if (not v.graphics_set.status_colors and not _burner) then
					v.graphics_set.status_colors = generic_status_colors()
				else
					_hascolors = true
				end
				
				if (not v.graphics_set.working_visualisations and not _hascolors and not _void) then
					v.graphics_set.working_visualisations = generic_status_visualisation_object(collision_box)
				elseif (not _hascolors and not _void) then
					for j, k in pairs(generic_status_visualisation_object(collision_box)) do
						table.insert(v.graphics_set.working_visualisations, k ) 
					end
				end
			end
		end
	end
end

---------------------------------------------------  HUT/WAREHOUSE CIRCUIT CONNECTIONS  ------------------------------------------------------------

circuit_connector_definitions["hut"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
	{
		variation = 26, 
		main_offset = util.by_pixel(-22, 16), 
		shadow_offset = util.by_pixel(-26, 12), 
		show_shadow = true 
	}
  }
)

circuit_connector_definitions["medium-turret"] = circuit_connector_definitions.create_vector -- TurretPrototype takes vector
(
  universal_connector_template,
  {
    { variation = 17, main_offset = util.by_pixel( -18, 13), shadow_offset = util.by_pixel( -12, 25), show_shadow = false }
  }
)

circuit_connector_definitions["medium-turret-rotatable"] = circuit_connector_definitions.create_vector -- TurretPrototype takes vector
(
  universal_connector_template,
  {
    { variation = 17, main_offset = util.by_pixel( -18, 13), shadow_offset = util.by_pixel( -12, 25), show_shadow = false },
	{ variation = 17, main_offset = util.by_pixel( -18, 13), shadow_offset = util.by_pixel( -12, 25), show_shadow = false },
	{ variation = 17, main_offset = util.by_pixel( -18, 13), shadow_offset = util.by_pixel( -12, 25), show_shadow = false },
	{ variation = 17, main_offset = util.by_pixel( -18, 13), shadow_offset = util.by_pixel( -12, 25), show_shadow = false },
	{ variation = 17, main_offset = util.by_pixel( -18, 13), shadow_offset = util.by_pixel( -12, 25), show_shadow = false },
	{ variation = 17, main_offset = util.by_pixel( -18, 13), shadow_offset = util.by_pixel( -12, 25), show_shadow = false },
	{ variation = 17, main_offset = util.by_pixel( -18, 13), shadow_offset = util.by_pixel( -12, 25), show_shadow = false },
	{ variation = 17, main_offset = util.by_pixel( -18, 13), shadow_offset = util.by_pixel( -12, 25), show_shadow = false },
  }
)
	
circuit_connector_definitions["warehouse"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {  
	{  
		variation = 26, 
		main_offset = util.by_pixel(-68, 64), 
		shadow_offset = util.by_pixel(-72, 60), 
		show_shadow = true 
	} 
  }
)

circuit_connector_definitions["accumulator-battery"] = circuit_connector_definitions.create_single
(
  universal_connector_template,
  {    
	variation = 26, 
	main_offset = util.by_pixel(44, 44), 
	shadow_offset = util.by_pixel(44, 44), 
	show_shadow = true 
  }
)

circuit_connector_definitions["adv-accumulator-battery"] = circuit_connector_definitions.create_single
(
  universal_connector_template,
  {    
	variation = 26, 
	main_offset = util.by_pixel(68, 68), 
	shadow_offset = util.by_pixel(66, 68), 
	show_shadow = true 
  }
)

circuit_connector_definitions["factory"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {    
	{	variation = 26, main_offset = util.by_pixel(28, 74), shadow_offset = util.by_pixel(56, 72), show_shadow = true	}, 
	{	variation = 26, main_offset = util.by_pixel(28, 74), shadow_offset = util.by_pixel(56, 72), show_shadow = true	}, 
	{	variation = 26, main_offset = util.by_pixel(28, 74), shadow_offset = util.by_pixel(56, 72), show_shadow = true	}, 
	{	variation = 26, main_offset = util.by_pixel(28, 74), shadow_offset = util.by_pixel(56, 72), show_shadow = true	}, 
  }
)

circuit_connector_definitions["mini-assembler"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {    
	{	variation = 26, main_offset = util.by_pixel(16, 16), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
	{	variation = 26, main_offset = util.by_pixel(16, 16), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
	{	variation = 26, main_offset = util.by_pixel(16, 16), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
	{	variation = 26, main_offset = util.by_pixel(16, 16), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
  }
)

circuit_connector_definitions["hpmp"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {    
	{	variation = 26, main_offset = util.by_pixel(24, 24), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
	{	variation = 26, main_offset = util.by_pixel(24, 24), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
	{	variation = 26, main_offset = util.by_pixel(24, 24), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
	{	variation = 26, main_offset = util.by_pixel(24, 24), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
  }
)

circuit_connector_definitions["compressor"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {    
	{	variation = 26, main_offset = util.by_pixel(64, 64), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
	{	variation = 26, main_offset = util.by_pixel(64, 64), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
	{	variation = 26, main_offset = util.by_pixel(64, 64), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
	{	variation = 26, main_offset = util.by_pixel(64, 64), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
  }
)

circuit_connector_definitions["grinder"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {    
	{	variation = 26, main_offset = util.by_pixel(68, 64), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
	{	variation = 26, main_offset = util.by_pixel(68, 64), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
	{	variation = 26, main_offset = util.by_pixel(68, 64), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
	{	variation = 26, main_offset = util.by_pixel(68, 64), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
  }
)

circuit_connector_definitions["sawmill"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {    
	{	variation = 26, main_offset = util.by_pixel(64, 54), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
	{	variation = 26, main_offset = util.by_pixel(64, 54), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
	{	variation = 26, main_offset = util.by_pixel(64, 54), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
	{	variation = 26, main_offset = util.by_pixel(64, 54), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
  }
)

circuit_connector_definitions["extractor"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {    
	{	variation = 0, main_offset = util.by_pixel(-6, -64), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
	{	variation = 0, main_offset = util.by_pixel(-6, -64), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
	{	variation = 0, main_offset = util.by_pixel(-6, -64), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
	{	variation = 0, main_offset = util.by_pixel(-6, -64), shadow_offset = util.by_pixel(66, 68), show_shadow = true	}, 
  }
)

circuit_connector_definitions["loader"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 4, main_offset = util.by_pixel(0, 0), shadow_offset = util.by_pixel(-0, -0), show_shadow = false },
    { variation = 2, main_offset = util.by_pixel(0, 0), shadow_offset = util.by_pixel(0,0), show_shadow = false },
    { variation = 0, main_offset = util.by_pixel(0, 0), shadow_offset = util.by_pixel(-0, 0), show_shadow = false },
    { variation = 6, main_offset = util.by_pixel(0, 0), shadow_offset = util.by_pixel(-0, 0), show_shadow = false },
	{ variation = 4, main_offset = util.by_pixel(-0, -16), shadow_offset = util.by_pixel(-0, -0), show_shadow = false },
    { variation = 2, main_offset = util.by_pixel(-0, -16), shadow_offset = util.by_pixel(0,0), show_shadow = false },
    { variation = 0, main_offset = util.by_pixel(-0, -16), shadow_offset = util.by_pixel(-0, 0), show_shadow = false },
    { variation = 6, main_offset = util.by_pixel(-0, -16), shadow_offset = util.by_pixel(-0, 0), show_shadow = false }
  }
)
