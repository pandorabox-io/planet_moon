

-- http://dev.minetest.net/PerlinNoiseMap

local testparam = {
   offset = 0,
   scale = 1,
   spread = {x=1024, y=512, z=1024},
   seed = 3468584,
   octaves = 5,
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
	local perlin_map = minetest.get_perlin_map(testparam, map_lengths_xyz):get3dMap_flat(minp)

	local c_stone = minetest.get_content_id("default:stone")

	local i = 1
	for z=minp.z,maxp.z do
	for y=minp.y,maxp.y do
	for x=minp.x,maxp.x do


		local index = area:index(x,y,z)
		local n = perlin_map[i]

		if i < 40 then
			print("i:"..i.." -> n:"..n)
		end

		-- higher elevation = lower chance
		local chance = (y-minp.y) / side_length

		if n > chance then
			data[index] = c_stone
		end

		i = i + 1

	end --x
	end --y
	end --z
 
	vm:set_data(data)
	vm:write_to_map()

end)


print("[OK] Planet: moon")