-- radioactive outgasing of ores in vacuum

-- gas definition, drowns and is slightly radioactive
minetest.register_node("planet_moon:gas", {
	description = "Moon gas",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drawtype = "glasslike",
	drowning = 1,
	post_effect_color = {a = 20, r = 20, g = 250, b = 20},
	tiles = {"planet_moon_gas.png^[colorize:#E0F0E033"},
	alpha = 0.1,
	groups = {
    not_in_creative_inventory = 1,
    not_blocking_trains = 1,
    cools_lava = 1,
    radioactive = 3
  },
	drop = {},
	sunlight_propagates = true
})

-- ores gas out in vacuum
minetest.register_abm({
  label = "moon ore outgasing",
	nodenames = {"vacuum:vacuum"},
	neighbors = {
    "default:stone_with_diamond",
    "default:stone_with_mese",
    "default:stone_with_gold",
    "default:stone_with_iron",
    "default:stone_with_coal",
    "default:mineral_uranium"
  },
	interval = 5,
	chance = 10,
	action = function(pos)
    minetest.set_node(pos, {name = "planet_moon:gas"})
  end
})

-- radioactive gas removal if near air
minetest.register_abm({
  label = "radioactive gas removal",
	nodenames = {"planet_moon:gas"},
	neighbors = {"air"},
	interval = 5,
	chance = 5,
	action = function(pos)
    minetest.set_node(pos, {name = "air"})
  end
})
