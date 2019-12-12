local has_technic_mod = minetest.get_modpath("technic")
local has_vacuum_mod = minetest.get_modpath("vacuum")

local register_ore = function(def)
	table.insert(planet_moon.ores, def)
	planet_moon.min_chance = math.min(def.chance, planet_moon.min_chance)
end


if has_vacuum_mod then

	c_vacuum = minetest.get_content_id("vacuum:vacuum")
	register_ore({
		id = c_vacuum,
		chance = 1
	})

else
	register_ore({
		id = minetest.get_content_id("air"),
		chance = 1
	})
end

register_ore({
	id = minetest.get_content_id("default:stone_with_diamond"),
	chance = 0.998
})

register_ore({
	id = minetest.get_content_id("default:stone_with_mese"),
	chance = 0.995
})

register_ore({
	id = minetest.get_content_id("default:stone_with_gold"),
	chance = 0.99
})

register_ore({
	id = minetest.get_content_id("default:stone_with_copper"),
	chance = 0.98
})

register_ore({
	id = minetest.get_content_id("default:stone_with_iron"),
	chance = 0.9
})

register_ore({
	id = minetest.get_content_id("default:stone_with_coal"),
	chance = 0.8
})

register_ore({
	id = minetest.get_content_id("default:ice"),
	chance = 0.45
})

if has_technic_mod then
	register_ore({
		id = minetest.get_content_id("technic:mineral_uranium"),
		chance = 0.95
	})

	register_ore({
		id = minetest.get_content_id("technic:mineral_chromium"),
		chance = 0.82
	})

	register_ore({
		id = minetest.get_content_id("technic:mineral_zinc"),
		chance = 0.75
	})

	register_ore({
		id = minetest.get_content_id("technic:mineral_lead"),
		chance = 0.7
	})

	register_ore({
		id = minetest.get_content_id("technic:mineral_sulfur"),
		chance = 0.6
	})

end

-- sort ores
table.sort(planet_moon.ores, function(a,b)
	return b.chance < a.chance
end)
