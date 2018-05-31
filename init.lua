

-- http://dev.minetest.net/PerlinNoiseMap

-- basic planet material noise
local base_params = {
   offset = 0,
   scale = 1,
   spread = {x=1024, y=512, z=1024},
   seed = 3468584,
   octaves = 5,
   persist = 0.6
}

-- ore params
local ore_params = {
   offset = 0,
   scale = 1,
   spread = {x=128, y=64, z=128},
   seed = 3454657,
   octaves = 4,
   persist = 0.6
}

minetest.register_on_generated(function(minp, maxp, seed)

	if minp.y < 1000 or minp.y > 1280 then
		return
	end

	-- colid layer
	local is_solid = minp.y < 1200

	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
	local data = vm:get_data()

	local side_length = maxp.x - minp.x + 1 -- 80
	local map_lengths_xyz = {x=side_length, y=side_length, z=side_length}

	local base_perlin_map = minetest.get_perlin_map(base_params, map_lengths_xyz):get3dMap_flat(minp)
	local ore_perlin_map = minetest.get_perlin_map(ore_params, map_lengths_xyz):get3dMap_flat(minp)

	local c_base = minetest.get_content_id("default:stone")
	local c_ore1 = minetest.get_content_id("default:ice")
	local c_ore2 = minetest.get_content_id("default:stone_with_coal")
	local c_ore3 = minetest.get_content_id("default:stone_with_iron")
	local c_ore4 = minetest.get_content_id("default:stone_with_copper")
	local c_ore5 = minetest.get_content_id("default:stone_with_gold")
	local c_ore6 = minetest.get_content_id("default:stone_with_mese")
	local c_ore7 = minetest.get_content_id("default:stone_with_diamond")
	local c_air = minetest.get_content_id("air")

	local i = 1
	for z=minp.z,maxp.z do
	for y=minp.y,maxp.y do
	for x=minp.x,maxp.x do


		local index = area:index(x,y,z)

		-- higher elevation = lower chance
		local chance = (y-minp.y) / side_length

		if data[index] == c_air then
			-- unpopulated node

			local base_n = base_perlin_map[i]
			local ore_n = ore_perlin_map[i]

			if is_solid or base_n > chance then


				if ore_n > 1 then
					data[index] = c_air

				elseif ore_n > 0.998 then
					data[index] = c_ore7

				elseif ore_n > 0.995 then
					data[index] = c_ore6

				elseif ore_n > 0.99 then
					data[index] = c_ore5

				elseif ore_n > 0.98 then
					data[index] = c_ore4

				elseif ore_n > 0.9 then
					data[index] = c_ore3

				elseif ore_n > 0.8 then
					data[index] = c_ore2

				elseif ore_n > 0.45 then
					data[index] = c_ore1

				else
					-- base material
					data[index] = c_base
				end

			end
		end

		i = i + 1

	end --x
	end --y
	end --z
 
	vm:set_data(data)
	vm:write_to_map()

end)


print("[OK] Planet: moon")
