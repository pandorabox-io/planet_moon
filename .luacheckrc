allow_defined_top = true

globals = {
	"planet_moon"
}

read_globals = {
	-- Stdlib
	string = {fields = {"split"}},
	table = {fields = {"copy", "getn"}},

	-- Minetest
	"minetest",
	"vector", "ItemStack",
	"dump", "VoxelArea",

	-- Deps
	"unified_inventory", "default",
	"vacuum",

	-- optional mods
	"planetoidgen", "skybox"
}
