local zoom_num = 10

minetest.register_privilege("zoom", {
	description = "Can zoom",
	give_to_singleplayer = false
})
minetest.register_chatcommand("zoom", {
	description = "Change the zoom with precision",
	privs = {zoom = true},
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local param_num = tonumber(param)
		if not (param_num == nil) then
			zoom_num = param_num
		end
	end,
})

minetest.register_chatcommand("zoom", {
	description = "Change the zoom with precision",
	privs = {fly = true},
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local param_num = tonumber(param)
		if not (param_num == nil) then
			zoom_num = param_num
		end
	end,
})

minetest.register_chatcommand("zoom", {
	description = "Change the zoom with precision",
	privs = {creative = true},
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local param_num = tonumber(param)
		if not (param_num == nil) then
			zoom_num = param_num
		end
	end,
})

local function zoom()
	for _,player in ipairs(minetest.get_connected_players()) do
		if minetest.check_player_privs(player, {zoom = true}) or
		minetest.check_player_privs(player, {fly = true}) or 
		minetest.check_player_privs(player, {creative = true}) then
			player:set_properties({zoom_fov = zoom_num})
		end
	end
	minetest.after(1, zoom)
end

zoom()
