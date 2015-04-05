
net.Receive("FakePlayerChat", function(len)

	local Victim = net.ReadEntity()
	local Text = net.ReadString()
	--local Team = net.ReadInt()
	
	local DeadText = ""
	
	if Victim:Health() <= 0 then
		DeadText = "*DEAD*"
	end


	chat.AddText(	Color(255,0,0,255),DeadText,
					team.GetColor(Victim:Team()),Victim:Nick(),
					Color(255,255,255,255),":" .. Text
				)
				
end)
