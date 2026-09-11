
-- Merge tables
function table.merge(t1,t2)
   for i=1,#t2 do
      t1[#t1+1] = t2[i]
   end
   return t1
end

-- If a table has this element, return true
function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

-- if a table has this entry, then delete it.
function table.removetablewithmatchingentry(t, key, value) 
    for i,v in pairs(t) do
		if (v[key] == value) then	
			table.remove(t,i)
			break
		end
    end
end

-- Remove an element inside a table
function table.removeentry(t, e) 
    for i,v in pairs(t) do
        if v == e then
            table.remove(t,i)
            break
        end
    end
end

-- Switch out an old recipe with a replacement new one.
function switchrecipeingredient(old_item,new_item)
	for k, v in pairs(data.raw["recipe"]) do
		if (v.ingredients ~= nil) then
			for i, w in pairs(v.ingredients) do
				if w.name==old_item then
					w.name=new_item
				end
			end
		end
	end
end

-- Place one icon on top of another.
function iconoverlayontop(icon_base, icon_overlay, base_size, overlay_size, overlay_scale)
  local icons =
  {
    {
      icon = icon_base,
      icon_size = size,
	  icon_mipmaps = 4
    },
    {
      icon = icon_overlay,
      icon_size = size,
	  icon_mipmaps = 4,
      scale = overlay_scale,
    }
  }
  return icons
end

function create_decoratives(decorative, rad, probability)
  return {
		type = "direct",
		action_delivery =
		{
			type = "instant",
			target_effects =
			{
				{
					type = "create-decorative",
					decorative = decorative,
					probability = probability or 1,
					spawn_min = math.floor(rad / 4),
					spawn_max = math.ceil(rad / 2),
					spawn_min_radius = 1,
					spawn_max_radius = rad + 2 or 2,
					spread_evenly = true,
				}
			}
		}
	}
end

function create_entity(entity, rad, probability, amount)
	return	
	{
	  type = "cluster",
	  cluster_count = amount,
	  distance = rad/2,
	  distance_deviation = rad/2,
	  action_delivery =
	  {
		type = "instant",
		target_effects =
		{
		  {
				type = "create-entity",
				entity_name = entity,
				
				probability = probability or 1,
				--repeat_count = amount or 2,
				--repeat_count_deviation = math.ceil( amount),
				
				check_buildability = true,
				find_non_colliding_position  = true,
				non_colliding_search_precision  = 0.25,
				non_colliding_search_radius = 3,
				tile_collision_mask  = {not_colliding_with_itself = true, layers = {object = true} }
			}
		}
	  }
	}
end


function create_entity2(entity, rad, probability, amount)
	return	
	{
		{
		  type = "cluster",
		  cluster_count = amount,
		  distance = rad/1.5,
		  distance_deviation = rad/3,
		  action_delivery =
		  {
			type = "instant",
			target_effects =
			{
			  {
					type = "create-entity",
					entity_name = entity,
					
					probability = probability or 1,
					--repeat_count = amount or 2,
					--repeat_count_deviation = math.ceil( amount),
					
					check_buildability = true,
					find_non_colliding_position  = true,
					non_colliding_search_precision  = 0.25,
					non_colliding_search_radius = 3,
					tile_collision_mask  = {not_colliding_with_itself = true, layers = {object = true} }
				}
			}
		  }
		}
	}
end


function create_tiles(tilename, rad, probability)
  return {
		type = "direct",
		action_delivery =
		{
			type = "instant",
			target_effects =
			{
				{
					type = "set-tile",	
					tile_name = tilename,
					probability = probability or 1,
					radius = rad or 1,
					apply_projectionoptional = true,
				},
			}
		}
	}
end

function create_clustertiles(tilename, rad, probability, amount)
	return	
	{
	  type = "cluster",
	  cluster_count = amount,
	  distance = rad or 1,
	  distance_deviation = rad/3 or 1,
	  action_delivery =
	  {
			type = "instant",
			target_effects =
			{
				{
					type = "set-tile",	
					tile_name = tilename,
					probability = probability or 1,
					radius = math.max(rad/3,1) or 1,
					apply_projectionoptional = true,
				},
			}
		}
	}
end