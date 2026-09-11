-- function worm_integration(scale)
-- return
  -- {
    -- filename = "__base__/graphics/entity/worm/worm-integration.png",
    -- frame_count = 1,
    -- variation_count = 1,
    -- width = 166,
    -- height = 122,
    -- shift = util.mul_shift(util.by_pixel(4, -2), scale),
    -- scale = scale,
    -- hr_version =
    -- {
      -- filename = "__base__/graphics/entity/worm/worm-integration.png",
      -- frame_count = 1,
      -- variation_count = 1,
      -- width = 332,
      -- height = 240,
      -- shift = util.mul_shift(util.by_pixel(4, -1), scale),
      -- scale = 0.5 * scale
    -- }
  -- }
-- end

function worm_integration(scale, skip_animation)
  return worm_integration_impl(scale, 0, 1, skip_animation)
end

function worm_integration_impl(scale, skip_frames, use_frames, skip_animation)
  local frame_sequence = {}
  for i = 1, use_frames do
    frame_sequence[i] = i + skip_frames
  end

  local params =
  {
    scale = scale * 0.5,
    multiply_shift = scale,
  }

  if not skip_animation then
    params.variation_count = 1
    params.frame_count = 25
    params.frame_sequence = frame_sequence
  end

  params.surface = "nauvis"
  params.usage = "enemy"

  local result = util.sprite_load("__base__/graphics/entity/worm/worm-hole-collapse", params)
  if skip_animation then result.line_length = nil end

  return result;
end

function worm_folded_animation(scale, tint)
  return
  {
    layers=
    {
      {

          filename = "__base__/graphics/entity/worm/worm-folded.png",
          run_mode = "forward-then-backward",
          line_length = 9,
          width = 130,
          height = 120,
          frame_count = 9,
          shift = util.mul_shift(util.by_pixel(0, 4), scale),
          direction_count = 1,
          scale = scale * 0.5
      },
      {

          filename = "__factorioplus__/graphics/entity/worm/worm-folded-mask.png",
          flags = { "mask" },
          run_mode = "forward-then-backward",
          line_length = 9,
          width = 130,
          height = 108,
          frame_count = 9,
          shift = util.mul_shift(util.by_pixel(0, 7), scale),
          scale = scale * 0.5,
          direction_count = 1,
          tint = tint
      },
      {

          filename = "__base__/graphics/entity/worm/worm-folded-shadow.png",
          run_mode = "forward-then-backward",
          line_length = 9,
          width = 116,
          height = 68,
          frame_count = 9,
          shift = util.mul_shift(util.by_pixel(5, -4), scale),
          direction_count = 1,
          scale = scale * 0.5,
          draw_as_shadow = true
      }
    }
  }
end

function worm_preparing_animation(scale, tint, run_mode)
  return
  {
    layers=
    {
      {

          filename = "__base__/graphics/entity/worm/worm-preparing.png",
          width = 188,
          height = 304,
          line_length = 6,
          frame_count = 18,
          shift = util.mul_shift(util.by_pixel(0, -42), scale),
          run_mode = run_mode,
          scale = 0.5 * scale,
          direction_count = 1

      },
      {

          filename = "__factorioplus__/graphics/entity/worm/worm-preparing-mask.png",
          flags = { "mask" },
          line_length = 6,
          width = 188,
          height = 248,
          frame_count = 18,
          shift = util.mul_shift(util.by_pixel(0, -28), scale),
          run_mode = run_mode,
          scale = 0.5 * scale,
          direction_count = 1,
          tint = tint

      },
      {

          filename = "__base__/graphics/entity/worm/worm-preparing-shadow.png",
          width = 410,
          height = 124,
          line_length = 6,
          frame_count = 18,
          shift = util.mul_shift(util.by_pixel(55, -4), scale),
          run_mode = run_mode,
          scale = 0.5 * scale,
          direction_count = 1,
          draw_as_shadow = true

      }
    }
  }
end

function worm_prepared_animation(scale, tint)
  return
  {
    layers=
    {
      {

          filename = "__base__/graphics/entity/worm/worm-prepared.png",
          run_mode = "forward-then-backward",
          line_length = 9,
          width = 190,
          height = 300,
          frame_count = 9,
          scale = 0.5 * scale,
          direction_count = 1,
          shift = util.mul_shift(util.by_pixel(-3, -41), scale)

      },
      {

          filename = "__factorioplus__/graphics/entity/worm/worm-prepared-mask.png",
          flags = { "mask" },
          run_mode = "forward-then-backward",
          line_length = 9,
          width = 190,
          height = 268,
          frame_count = 9,
          shift = util.mul_shift(util.by_pixel(-3, -33), scale),
          scale = 0.5 * scale,
          direction_count = 1,
          tint = tint

      },
      {

          filename = "__base__/graphics/entity/worm/worm-prepared-shadow.png",
          run_mode = "forward-then-backward",
          line_length = 9,
          width = 408,
          height = 122,
          frame_count = 9,
          scale = 0.5 * scale,
          direction_count = 1,
          shift = util.mul_shift(util.by_pixel(52, -6), scale),
          draw_as_shadow = true

      }
    }
  }
end

alternate_frame_sequence = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
                             17, 17, 16, 16, 15, 15, 16, 16, 17, 17, 16, 16, 16, 17, 17,
                             16, 16, 15, 15, 16, 16, 15, 15, 16, 16, 17, 17,
                             17, 16, 16, 15, 15, 16, 16, 15, 15, 16, 16, 17,
                             16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1}

function worm_prepared_alternative_animation(scale, tint)
  return
  {
    layers=
    {
      {
          filename = "__base__/graphics/entity/worm/worm-prepared-alternative.png",
          line_length = 6,
          width = 182,
          height = 324,
          frame_count = 17,
          frame_sequence = alternate_frame_sequence,
          scale = 0.5 * scale,
          direction_count = 1,
          shift = util.mul_shift(util.by_pixel(-2, -47), scale)
      },
      {

          filename = "__factorioplus__/graphics/entity/worm/worm-prepared-alternative-mask.png",
          flags = { "mask" },
          line_length = 6,
          width = 182,
          height = 288,
          frame_count = 17,
          frame_sequence = alternate_frame_sequence,
          shift = util.mul_shift(util.by_pixel(-2, -38), scale),
          scale = 0.5 * scale,
          direction_count = 1,
          tint = tint

      },
      {

          filename = "__base__/graphics/entity/worm/worm-prepared-alternative-shadow.png",
          line_length = 6,
          width = 424,
          height = 120,
          frame_count = 17,
          frame_sequence = alternate_frame_sequence,
          scale = 0.5 * scale,
          direction_count = 1,
          shift = util.mul_shift(util.by_pixel(57, -6), scale),
          draw_as_shadow = true

      }
    }
  }
end

start_attack_frame_sequence = { 1, 2, 3, 4, 5, 6, 7, 8, 9}

function worm_start_attack_animation(scale, tint)
  return
  {
    layers=
    {
      util.sprite_load("__base__/graphics/entity/worm/worm-attack",
        {
          slice = 4,
          frame_count = 10,
          direction_count = 16,
          scale = scale * 0.5,
          frame_sequence = start_attack_frame_sequence,
          multiply_shift = scale,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__factorioplus__/graphics/entity/worm/worm-attack-mask",
        {
          slice = 4,
          frame_count = 10,
          direction_count = 16,
          scale = scale * 0.5,
          frame_sequence = start_attack_frame_sequence,
          tint = tint,
          multiply_shift = scale,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/worm/worm-attack-shadow",
        {
          slice = 4,
          frame_count = 10,
          direction_count = 16,
          scale = scale * 0.5,
          frame_sequence = start_attack_frame_sequence,
          draw_as_shadow = true,
          multiply_shift = scale,
          surface = "nauvis",
          usage = "enemy"
        }
      )
    }
  }
end

end_attack_frame_sequence = { 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1}

function worm_end_attack_animation(scale, tint)
  return
  {
    layers=
    {
      util.sprite_load("__base__/graphics/entity/worm/worm-attack",
        {
          slice = 4,
          frame_count = 10,
          direction_count = 16,
          scale = scale * 0.5,
          frame_sequence = end_attack_frame_sequence,
          multiply_shift = scale,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__factorioplus__/graphics/entity/worm/worm-attack-mask",
        {
          slice = 4,
          frame_count = 10,
          direction_count = 16,
          scale = scale * 0.5,
          frame_sequence = end_attack_frame_sequence,
          tint = tint,
          multiply_shift = scale,
          surface = "nauvis",
          usage = "enemy"
        }
      ),
      util.sprite_load("__base__/graphics/entity/worm/worm-attack-shadow",
        {
          slice = 4,
          frame_count = 10,
          direction_count = 16,
          scale = scale * 0.5,
          frame_sequence = end_attack_frame_sequence,
          draw_as_shadow = true,
          multiply_shift = scale,
          surface = "nauvis",
          usage = "enemy"
        }
      )
    }
  }
end

local function dead_worm_animation (path, scale, tint, frame_count, usage)
  return
  {
    util.sprite_load( path ,
      {
        frame_count = frame_count,
        direction_count = 1,
        scale = scale * 0.5,
        multiply_shift = scale,
        flags = {"corpse-decay"},
        surface = "nauvis",
        usage = usage or "enemy"
      }
    ),
    util.sprite_load( path .. "-mask",
      {
        frame_count = frame_count,
        direction_count = 1,
        scale = scale * 0.5,
        tint = tint,
        multiply_shift = scale,
        flags = {"corpse-decay"},
        surface = "nauvis",
        usage = usage or "enemy"
      }
    ),
    util.sprite_load( path .. "-shadow",
      {
        frame_count = frame_count,
        direction_count = 1,
        scale = scale * 0.5,
        draw_as_shadow = true,
        multiply_shift = scale,
        surface = "nauvis",
        usage = usage or "enemy"
      }
    ),
  }
  end

function worm_die_animation(scale, tint)
  return
  {
    {
      layers = dead_worm_animation("__base__/graphics/entity/worm/worm-die-01", scale, tint, 24)
    },
    {
      layers = dead_worm_animation("__base__/graphics/entity/worm/worm-die-02", scale, tint, 24)
    },
    {
      layers = dead_worm_animation("__base__/graphics/entity/worm/worm-die-03", scale, tint, 24)
    }
  }
end

function worm_shoot_shiftings(scale, offset)
  return
  {
    {0.0625 *  0, util.add_shift(util.mul_shift(util.by_pixel(  -6, -213), scale * 0.5), util.by_pixel(  offset *    0, -offset *    1))},
    {0.0625 *  1, util.add_shift(util.mul_shift(util.by_pixel(  86, -193), scale * 0.5), util.by_pixel(  offset * 0.38, -offset * 0.92))},
    {0.0625 *  2, util.add_shift(util.mul_shift(util.by_pixel( 136, -155), scale * 0.5), util.by_pixel(  offset * 0.71, -offset * 0.71))},
    {0.0625 *  3, util.add_shift(util.mul_shift(util.by_pixel( 166, -134), scale * 0.5), util.by_pixel(  offset * 0.92, -offset * 0.38))},
    {0.0625 *  4, util.add_shift(util.mul_shift(util.by_pixel( 200,  -75), scale * 0.5), util.by_pixel(  offset *    1,  offset *    0))},
    {0.0625 *  5, util.add_shift(util.mul_shift(util.by_pixel( 168,   13), scale * 0.5), util.by_pixel(  offset * 0.92,  offset * 0.38))},
    {0.0625 *  6, util.add_shift(util.mul_shift(util.by_pixel( 118,   59), scale * 0.5), util.by_pixel(  offset * 0.71,  offset * 0.71))},
    {0.0625 *  7, util.add_shift(util.mul_shift(util.by_pixel(  48,   52), scale * 0.5), util.by_pixel(  offset * 0.38,  offset * 0.92))},
    {0.0625 *  8, util.add_shift(util.mul_shift(util.by_pixel(   4,   68), scale * 0.5), util.by_pixel(  offset *    0,  offset *    1))},
    {0.0625 *  9, util.add_shift(util.mul_shift(util.by_pixel( -58,   91), scale * 0.5), util.by_pixel( -offset * 0.38,  offset * 0.92))},
    {0.0625 * 10, util.add_shift(util.mul_shift(util.by_pixel(-114,   71), scale * 0.5), util.by_pixel( -offset * 0.71,  offset * 0.71))},
    {0.0625 * 11, util.add_shift(util.mul_shift(util.by_pixel(-163,   32), scale * 0.5), util.by_pixel( -offset * 0.92,  offset * 0.38))},
    {0.0625 * 12, util.add_shift(util.mul_shift(util.by_pixel(-220,  -56), scale * 0.5), util.by_pixel( -offset *    1,  offset *    0))},
    {0.0625 * 13, util.add_shift(util.mul_shift(util.by_pixel(-200, -120), scale * 0.5), util.by_pixel( -offset * 0.92, -offset * 0.38))},
    {0.0625 * 14, util.add_shift(util.mul_shift(util.by_pixel(-152, -175), scale * 0.5), util.by_pixel( -offset * 0.71, -offset * 0.71))},
    {0.0625 * 15, util.add_shift(util.mul_shift(util.by_pixel( -67, -204), scale * 0.5), util.by_pixel( -offset * 0.38, -offset * 0.92))}
  }
end
