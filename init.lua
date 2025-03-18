minetest.register_privilege("zoom", {
	description = "Can zoom",
	give_to_singleplayer = false
})
minetest.register_chatcommand("zoom", {
	description = "Change the zoom with precision",
	privs = {zoom = true,},
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local param_num = tonumber(param)
		if param_num == nil then
			player:set_fov(0)
		else
			player:set_fov(param_num, false, 0.2)
		end
	end,
})
