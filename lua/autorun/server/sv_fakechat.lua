util.AddNetworkString("FakePlayerChat")

function FakePlayerChatStart(ply,text,teamChat,isDead)

	local Explode = string.Explode(" ",text)

	local Command
	local Name
	local Message
	local Victim
	
	if Explode[1] then
		Command = Explode[1]
	end
	
	if Command == "!fake" then
	
		if Explode[2] then
			Name = Explode[2]
		else
			ply:ChatPrint("Missing Name")
			return
		end

		for k,v in pairs(player.GetAll()) do

			local Haystack = string.lower(v:Nick())
			local Needle = string.lower(Name)

			local Start, End = string.find(Haystack,Needle,0,true)

			if Start and End and not Victim then
				Victim = v
			end

		end

		if Victim then
		
			if Explode[3] then

				Message = ""
			
				for k,v in pairs(Explode) do
					if k > 2 then
						Message = Message .. " " .. v
					end
				end
			
			else
				ply:ChatPrint("Missing Message")
				return
			end

			net.Start("FakePlayerChat")
				net.WriteEntity(Victim)
				net.WriteString(Message)
				net.WriteEntity(ply)
			net.Broadcast()
			
		else
			ply:ChatPrint("Could not find player.")
			return
		end
		
		return false
		
	end
	
end

hook.Add("PlayerSay","Fake Player Chat",FakePlayerChatStart)