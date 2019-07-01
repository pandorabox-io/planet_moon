
minetest.register_node("planet_moon:radioactive_stone", {
	description = "Stone (radioactive)",
	tiles = {"default_stone.png^[colorize:#000055:100"},
	groups = {cracky = 3, stone = 1, radioactive = 4},
	drop = 'default:cobble',
	sounds = default.node_sound_stone_defaults(),
})
