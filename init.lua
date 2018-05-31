

-- http://dev.minetest.net/PerlinNoiseMap

local testparam = {
   offset = 0,
   scale = 1,
   spread = {x=2048, y=2048, z=2048},
   seed = 1337,
   octaves = 6,
   persist = 0.6
}

minetest.register_on_generated(function(minp, maxp, seed)
	if minp.y < 100 or minp.y > 180 then
		return
	end

	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
	local data = vm:get_data()

	local side_length = maxp.x - minp.x + 1 -- 80
	local map_lengths_xyz = {x=side_length, y=side_length, z=side_length}
	local perlin_map = minetest.get_perlin_map(testparam, map_lengths_xyz):get2dMap_flat({x=minp.x, y=minp.z})

	local c_stone = minetest.get_content_id("default:stone")

	local i = 1
	for x=minp.x,maxp.x do
	for z=minp.z,maxp.z do

		local n = perlin_map[i]
		i = i + 1

		local height = math.floor(n * side_length)

		for y=0, height do
			local index = area:index(x,minp.y+y,z)
			data[index] = c_stone
		end

	end --z
	end --x
 
	vm:set_data(data)
	vm:write_to_map()

end)


print("[OK] Planet: moon")