planet_moon = {
	miny = tonumber(minetest.settings:get("planet_moon.miny")) or 5000,
	maxy = tonumber(minetest.settings:get("planet_moon.maxy")) or 5280,
	maxsolidy = tonumber(minetest.settings:get("planet_moon.maxsolidy")) or 5200
}


local MP = minetest.get_modpath("planet_moon")

dofile(MP.."/ores.lua")
dofile(MP.."/mapgen.lua")


print("[OK] Planet: moon")
