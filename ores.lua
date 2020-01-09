local has_technic_mod = minetest.get_modpath("technic")
local has_vacuum_mod = minetest.get_modpath("vacuum")

local register_ore = function(def)
	table.insert(planet_moon.ores, def)
	planet_moon.min_chance = math.min(def.chance, planet_moon.min_chance)
end

-- inner core of the veins
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

-- prepare layers
local layer1 = {
	id_list = {
		minetest.get_content_id("default:stone_with_diamond"),
		minetest.get_content_id("default:stone_with_mese"),
		minetest.get_content_id("default:stone_with_gold")
	},
	chance = 0.99
}

local layer2 = {
	id_list = {
		minetest.get_content_id("default:stone_with_copper"),
		minetest.get_content_id("default:stone_with_iron"),
		minetest.get_content_id("default:stone_with_coal")
	},
	chance = 0.8
}


if has_technic_mod then
	-- populate technic stuff

	table.insert(layer2.id_list, minetest.get_content_id("technic:mineral_chromium"))
	table.insert(layer2.id_list, minetest.get_content_id("technic:mineral_uranium"))

	register_ore({
		id_list = {
			minetest.get_content_id("technic:mineral_lead"),
			minetest.get_content_id("technic:mineral_zinc")
		},
		chance = 0.7
	})

	register_ore({
		id = minetest.get_content_id("technic:mineral_sulfur"),
		chance = 0.6
	})

end

-- register prepared layers
register_ore(layer1)
register_ore(layer2)

register_ore({
	id = minetest.get_content_id("default:ice"),
	chance = 0.45
})


-- sort ores
table.sort(planet_moon.ores, function(a,b)
	return b.chance < a.chance
end)
