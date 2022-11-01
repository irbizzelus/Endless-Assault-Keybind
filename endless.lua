if not _G.EndlessAssaultKeybindModByIrbi then
	_G.EndlessAssaultKeybindModByIrbi = {}
	EndlessAssaultKeybindModByIrbi.check = 0
end

if Network:is_server() then
	if EndlessAssaultKeybindModByIrbi then
		if EndlessAssaultKeybindModByIrbi.check == 0 then
			managers.chat:_receive_message(1, "EndlessKeybind", "I hope you didn't missclick.", Color(255,255,0,0) / 255)
			EndlessAssaultKeybindModByIrbi.check = EndlessAssaultKeybindModByIrbi.check + 1
		elseif EndlessAssaultKeybindModByIrbi.check == 1 then
			managers.chat:_receive_message(1, "EndlessKeybind", "Are you REALLY sure you want to do this?", Color(255,255,0,0) / 255)
			EndlessAssaultKeybindModByIrbi.check = EndlessAssaultKeybindModByIrbi.check + 1
		elseif EndlessAssaultKeybindModByIrbi.check == 2 then
			if managers.groupai:state():get_assault_mode() then
				if managers.groupai:state()._hunt_mode then
					if managers.groupai:state()._hunt_mode == true then
						managers.chat:_receive_message(1, "EndlessKeybind", "Endless Assault allready in progress.", Color(255,255,0,0) / 255)
					else
						managers.groupai:state():set_wave_mode("hunt")
						managers.player:local_player():sound():say("Play_ban_p01",true,true) -- REMOVE this line if you dont want Bain's endless announcment voice line to play
						managers.chat:send_message(ChatManager.GAME, nil, "HOST ENABLED PERMANENT ENDLESS ASSAULT: NO GOING BACK NOW!")
					end
				else
					managers.groupai:state():set_wave_mode("hunt")
					managers.player:local_player():sound():say("Play_ban_p01",true,true) -- REMOVE this line if you dont want Bain's endless announcment voice line to play
					managers.chat:send_message(ChatManager.GAME, nil, "HOST ENABLED PERMANENT ENDLESS ASSAULT: NO GOING BACK NOW!")
				end
			else
				managers.chat:_receive_message(1, "EndlessKeybind", "Can only be activated during an active assault.", Color(255,255,0,0) / 255)
				EndlessAssaultKeybindModByIrbi.check = EndlessAssaultKeybindModByIrbi.check - 1
			end
		end
	end
else
	managers.chat:_receive_message(1, "EndlessKeybind", "Can only be activated by host.", Color(255,255,0,0) / 255)
end