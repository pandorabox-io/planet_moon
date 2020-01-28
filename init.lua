planet_moon = {
	miny = tonumber(minetest.settings:get("planet_moon.miny")) or 5000,
	maxy = tonumber(minetest.settings:get("planet_moon.maxy")) or 5280,
	maxsolidy = tonumber(minetest.settings:get("planet_moon.maxsolidy")) or 5200,
	ores = {},
	min_chance = 1
}


local MP = minetest.get_modpath("planet_moon")

dofile(MP.."/legacy.lua")
dofile(MP.."/ores.lua")
dofile(MP.."/mapgen.lua")

if minetest.get_modpath("skybox") then
	dofile(MP.."/skybox.lua")
end

print("[OK] Planet: moon")
