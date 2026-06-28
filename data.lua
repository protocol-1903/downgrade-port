-- ============================================================================
-- HUMAN-CREATED SOFTWARE
-- Human-authored. Original work. Not AI-generated.
-- AI training, fine-tuning, dataset creation, and model evaluation prohibited.
-- See LICENSE for complete terms.
-- ============================================================================

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

local SCALE = 0.23

data:extend{
  {
    type = "furnace",
    name = "downgrade-port",
    vector_to_place_result = {0, -0.84},
    icon = "__downgrade-port__/graphics/icons/downgrade-port.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "downgrade-port"},
    max_health = 50,
    corpse = "small-remnants",
    dying_explosion = "splitter-explosion",
    -- icon_draw_specification = {shift = {0, -0.3}},
    resistances = {
      {
        type = "fire",
        percent = 70,
      },
    },
    collision_box = {{-0.29, -0.3}, {0.29, 0.3}},
    selection_box = {{-0.49, -0.5}, {0.49, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "downgrade-port",
    -- next_upgrade = "assembling-machine-2",
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions.create_vector(universal_connector_template, {
      {
        variation = 28,
        main_offset = util.by_pixel(15.375, -2.25),
        shadow_offset = util.by_pixel(15.375, -2.25),
        show_shadow = true,
      },
      {
        variation = 18,
        main_offset = util.by_pixel(-6.625, -2.75),
        shadow_offset = util.by_pixel(-6.625, -2.75),
        show_shadow = true,
      },
      {
        variation = 24,
        main_offset = util.by_pixel(-14.875, -7.5),
        shadow_offset = util.by_pixel(-14.875, -7.5),
        show_shadow = true,
      },
      {
        variation = 14,
        main_offset = util.by_pixel(6.875, -5.75),
        shadow_offset = util.by_pixel(6.875, -5.75),
        show_shadow = true,
      },
    }),
    -- alert_icon_shift = util.by_pixel(0, -12),
    graphics_set = {
      animation = {
        north = {
          layers = {
            {
              filename = "__downgrade-port__/graphics/entity/downgrade-port.png",
              priority = "extra-high",
              width = 424,
              height = 340,
              frame_count = 4,
              line_length = 4,
              animation_speed = 1,
              frame_sequence = {3},
              scale = SCALE,
              shift = util.by_pixel(5, 0),
            },
          },
        },
        east = {
          layers = {
            {
              filename = "__downgrade-port__/graphics/entity/downgrade-port.png",
              priority = "extra-high",
              width = 424,
              height = 340,
              frame_count = 4,
              line_length = 4,
              animation_speed = 1,
              frame_sequence = {4},
              scale = SCALE,
              shift = util.by_pixel(5, 0),
            },
          },
        },
        south = {
          layers = {
            {
              filename = "__downgrade-port__/graphics/entity/downgrade-port.png",
              priority = "extra-high",
              width = 424,
              height = 340,
              frame_count = 4,
              line_length = 4,
              animation_speed = 1,
              frame_sequence = {1},
              scale = SCALE,
              shift = util.by_pixel(5, 3),
            },
          },
        },
        west = {
          layers = {
            {
              filename = "__downgrade-port__/graphics/entity/downgrade-port.png",
              priority = "extra-high",
              width = 424,
              height = 340,
              frame_count = 4,
              line_length = 4,
              animation_speed = 1,
              frame_sequence = {2},
              scale = SCALE,
              shift = util.by_pixel(5, 0),
            },
          },
        },
      },
    },
    crafting_categories = {"downgrade-porting"},
    crafting_speed = 1,
    energy_source = settings.startup["downgrade-port-power-draw"].value and {
      type = "electric",
      usage_priority = "primary-input",

    } or {type = "void"},
    energy_usage = "20kW",
		heating_energy = feature_flags.freezing and "100kW" or nil,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    module_slots = 1,
    allowed_effects = {"consumption", "pollution", "speed", "productivity", "quality"},
    impact_category = "metal",
    working_sound = {
      sound = {filename = "__base__/sound/transport-belt-working.ogg", volume = 0.15},
      fade_in_ticks = 2,
      fade_out_ticks = 5,
    },
    result_inventory_size = 1,
    source_inventory_size = 1,
    custom_input_slot_tooltip_key = "downgrade-port-input-slot-tooltip",
    icon_draw_specification = {scale = 0.75, scale_for_many = 0.5},
  },
  {
		type = "item",
		name = "downgrade-port",
		icon = "__downgrade-port__/graphics/icons/downgrade-port.png",
		icon_size = 170,
		subgroup = "downgrade-port",
		order = "a[downgrade-port]",
		place_result = "downgrade-port",
		stack_size = 40,
		inventory_move_sound = item_sounds.metal_small_inventory_move,
		pick_sound = item_sounds.metal_small_inventory_pickup,
		drop_sound = item_sounds.metal_small_inventory_move,
  },
  {
		type = "recipe",
		name = "downgrade-port",
		ingredients = {
			{type = "item", name = "iron-plate", amount = 5},
			{type = "item", name = "iron-gear-wheel", amount = 2},
		},
		results = {{type = "item", name = "downgrade-port", amount = 1}},
		energy_required = 2,
		enabled = true,
    subgroup = "downgrade-port"
  },
  {
    type = "recipe-category",
    name = "downgrade-porting"
  },
	{
    type = "item-subgroup",
		name = "downgrade-port",
		group = "production",
		order = "e-a[downgrade-port]",
  }
}
