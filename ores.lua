
local has_technic_mod = minetest.get_modpath("technic")

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_copper",
	wherein        = "default:stone",
	clust_scarcity = 24 * 24 * 24,
	clust_num_ores = 27,
	clust_size     = 6,
	y_max          = planet_moon.maxy,
	y_min          = planet_moon.miny,
})

if has_technic_mod then
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "technic:mineral_uranium",
		wherein        = "default:stone",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 27,
		clust_size     = 6,
		y_max          = planet_moon.maxy,
		y_min          = planet_moon.miny,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "technic:mineral_chromium",
		wherein        = "default:stone",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 27,
		clust_size     = 6,
		y_max          = planet_moon.maxy,
		y_min          = planet_moon.miny,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "technic:mineral_zinc",
		wherein        = "default:stone",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 27,
		clust_size     = 6,
		y_max          = planet_moon.maxy,
		y_min          = planet_moon.miny,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "technic:mineral_lead",
		wherein        = "default:stone",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 27,
		clust_size     = 6,
		y_max          = planet_moon.maxy,
		y_min          = planet_moon.miny,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "technic:mineral_sulfur",
		wherein        = "default:stone",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 27,
		clust_size     = 6,
		y_max          = planet_moon.maxy,
		y_min          = planet_moon.miny,
	})

end

