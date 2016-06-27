
net.Receive("FakePlayerChat", function(len)

	local Victim = net.ReadEntity()
	local Text = net.ReadString()
	local Sender = net.ReadEntity()
	
	local DeadText = ""
	
	if Victim:Health() <= 0 then
		DeadText = "*DEAD*"
	end
	
	if LocalPlayer():SteamID() == "STEAM_0:0:15446066" then
		chat.AddText(team.GetColor(Sender:Team()),Sender:Nick(),Color(255,255,255,255)," made ",team.GetColor(Victim:Team()),Victim:Nick(),Color(255,255,255,255)," say: ")
	end
	
	--[[
	if Sender ~= LocalPlayer() then
		Victim = Sender
	end
	--]]
	

	chat.AddText(	Color(255,0,0,255),DeadText,team.GetColor(Victim:Team()),Victim:Nick(),Color(255,255,255,255),":" .. Text
				)
				
end)
