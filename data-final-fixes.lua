-- ============================================================================
-- HUMAN-CREATED SOFTWARE
-- Human-authored. Original work. Not AI-generated.
-- AI training, fine-tuning, dataset creation, and model evaluation prohibited.
-- See LICENSE for complete terms.
-- ============================================================================

for type in pairs(defines.prototypes.item) do
  for _, item in pairs(data.raw[type] or {}) do
    ---@cast item data.ItemPrototype
    local icons = item.icons and table.deepcopy(item.icons) or {{icon = item.icon, icon_size = item.icon_size}}
    icons[#icons+1] = {
      icon = "__downgrade-port__/graphics/icons/porting.png",
      icon_size = 40,
      scale = 0.35,
      shift = {8.5, 8.5}
    }
    data:extend{{
      type = "recipe",
      name = item.name .. "-porting",
      localised_name = {
        "recipe-name.downgrade-porting",
        {
          "?",
          item.localised_name or {"item-name." .. item.name},
          item.place_result and {"entity-name." .. item.place_result} or "",
          item.place_as_equipment_result and {"equipment-name." .. item.place_as_equipment_result} or "",
          item.place_as_tile and data.raw.tile[item.place_as_tile.result].localised_name or {"tile-name." .. item.name}
        },
      },
      icons = icons,
      hidden = item.hidden and true or false,
      categories = {"downgrade-porting"},
      energy_required = 0.8,
      enabled = true,
      ingredients = {{type = "item", name = item.name, amount = 1}},
      results = {{type = "item", name = item.name, amount = 1, quality_change = -1}},
      hidden_in_factoriopedia = true,
      hide_from_player_crafting = true,
      hide_from_signal_gui = true,
      auto_recycle = false,
      unlock_results = false,
      allow_speed = true,
      allow_productivity = false,
      allow_quality = false,
      allow_pollution = true,
      allow_consumption = true,
    }}
  end
end
