-- // Introduce the API 

script_key = "CLODDSlqJfmwQrjuIXqYaJHyLyzfKPmc";
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d836cd48a6355851cfebe7811b9ad445.lua"))()
d2c = getgenv().d2c







	getgenv().ownerid = 1224079
getgenv().ownerusername = {'busyidclol', 'xcl', 'lazy',"staandz"}

if d2c.username  then table.insert(getgenv().ownerusername,d2c.username) end



	if game.PlaceId == 9825515356 then 

		getgenv().ownerid = getgenv().ownerid or 1224079

		local remote = game:GetService("ReplicatedStorage").MainFunction
		local arguments = {[1] = "GetFFAServerList"}
		local results = remote:InvokeServer(unpack(arguments))
		function locateplayer(plrid) 

			for i, server in ipairs(results) do

				local PlayerCount = server.Players
				local PlayerIds   = server.PlayerIDs
				local jobid       = server.JobId


				if type(PlayerIds) == "table" then
					for _, id in ipairs(PlayerIds) do
						if id == plrid then 
							return jobid
						end
					end
				else
				end
			end


		end

	local url = "https://dtc-production-22eb.up.railway.app/KkiocHpYUjAzKsAyINhsCWjLOAYthiKB/"..script_key 

		local function checkJoin()
			local response = game:HttpGet((url))
			print(response)
			local data = game:GetService("HttpService"):JSONDecode(response)

			if data.method and data.method == "join" and data.username then 
			
					pcall(function()
						if game.Players:GetUserIdFromNameAsync(data.username) then 
							local i22d = game.Players:GetUserIdFromNameAsync(data.username)
							local jobidtojoin = locateplayer(i22d)
							print(jobidtojoin)
							if jobidtojoin then 
								game:GetService("TeleportService"):TeleportToPlaceInstance(138995385694035, jobidtojoin, game:GetService("Players").LocalPlayer)
							end 

						end end)
			

			else
				print("No pending join request.")
			end
		end

		while true do
			checkJoin()
			task.wait(2) -- checks every 2 seconds
		end



	elseif game.PlaceId == 138995385694035 then 
	local url = "https://dtc-production-22eb.up.railway.app/KkiocHpYUjAzKsAyINhsCWjLOAYthiKB/"..script_key 
		local response = game:HttpGet((url))
		print(response)
		local data = game:GetService("HttpService"):JSONDecode(response)
		if data and data.method and data.method == "join" then 
			if data.username then 
				table.insert(getgenv().ownerusername, data.username)
			end 
		end 


		local teleportation = {
			active = false,
			Height = 10,
			Radius = 15,
		}


		game:GetService("Workspace").FallenPartsDestroyHeight = 0/0

		local Script = {Target = nil}  -- REQUIRED: your teleport code references Script.Target

		local Players = game:GetService("Players")
		local LocalPlayer = Players.LocalPlayer

		-- Wait for character and HumanoidRootPart to load
		local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		local hrp = character:WaitForChild("HumanoidRootPart")


		spawn(function()

			repeat task.wait() until LocalPlayer.Backpack:FindFirstChild("[Revolver]") and LocalPlayer.Character and not LocalPlayer.Character:FindFirstChildWhichIsA("ForceField")
			hrp.CFrame = CFrame.new(-26.2317238, 34.9869881, -956.068604, -0.174567223, 4.61064609e-08, -0.984645247, -9.13180358e-08, 1, 6.30151789e-08, 0.984645247, 1.00916253e-07, -0.174567223)
			task.wait(1)
			LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack:FindFirstChild("[Revolver]"))

		end)

		LocalPlayer.CharacterAdded:Connect(function()

			repeat task.wait() until LocalPlayer.Backpack:FindFirstChild("[Revolver]") and LocalPlayer.Character and not LocalPlayer.Cha    racter:FindFirstChildWhichIsA("ForceField")
			hrp.CFrame = CFrame.new(-26.2317238, 34.9869881, -956.068604, -0.174567223, 4.61064609e-08, -0.984645247, -9.13180358e-08, 1, 6.30151789e-08, 0.984645247, 1.00916253e-07, -0.174567223)
			task.wait(1)
			LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack:FindFirstChild("[Revolver]"))


		end )



		--// ORBIT SYSTEM (EXTRACTED FROM YOUR SCRIPT)
		local Players = game:GetService("Players")
		local RunService = game:GetService("RunService")
		local Client = Players.LocalPlayer

		local Script = Script or {}
		Script.Target = Script.Target or nil

		-- Orbit settings
		local OrbitSettings = {
			Enable = false, -- turn on/off
			X = 13,          -- radius
			Y = 5,          -- vertical offset
			Z = 8          -- rotation speed
		}

		-- Random teleport settings
		local teleportation = {
			active = false,
			Height = 10,
			Radius = 20,
		}

		-- RANDOM TELEPORT MODULE
		local function randomTeleport()
			if teleportation.active and Script.Target and Script.Target.Character and Script.Target.Character:FindFirstChild("HumanoidRootPart") then

				local targetPosition = Script.Target.Character.HumanoidRootPart.Position

				local offset = Vector3.new(
					math.random(-teleportation.Radius, teleportation.Radius),
					teleportation.Height,
					math.random(-teleportation.Radius, teleportation.Radius)
				)

				Client.Character:MoveTo(targetPosition + offset)
			end
		end

		RunService.Heartbeat:Connect(function()
			if teleportation.active then
				randomTeleport()
				task.wait(0.25)
			end
		end)


		-- ORBIT CALCULATOR
		local angle = 0

		local function RadiusPointOnCircle(radians)
			local x = OrbitSettings.X * math.cos(radians)
			local z = OrbitSettings.X * math.sin(radians)
			return Vector3.new(x, 0, z)
		end

		-- MAIN ORBIT FUNCTION
		local function Orbit()
			if OrbitSettings.Enable 
				and Script.Target 
				and Script.Target.Character
				and Script.Target.Character:FindFirstChild("HumanoidRootPart")
				and Client.Character
				and Client.Character:FindFirstChild("HumanoidRootPart")
			then
				local targetPos = Script.Target.Character.HumanoidRootPart.Position

				local pos = targetPos 
					+ RadiusPointOnCircle(angle)
					+ Vector3.new(0, OrbitSettings.Y, 0)

				Client.Character:MoveTo(pos)

				angle = angle + math.rad(OrbitSettings.Z)
			end
		end

		RunService.RenderStepped:Connect(function()
			Orbit()
		end)

		--// PUBLIC API FOR YOU TO USE:
		_G.EnableOrbit = function(bool)
			OrbitSettings.Enable = bool
		end

		_G.SetOrbitTarget = function(plr)
			Script.Target = plr
		end

		_G.SetOrbitRadius = function(value)
			OrbitSettings.X = value
		end

		_G.SetOrbitHeight = function(value)
			OrbitSettings.Y = value
		end

		_G.SetOrbitSpeed = function(value)
			OrbitSettings.Z = value
		end

		_G.EnableRandomTP = function(bool)
			teleportation.active = bool
		end

		_G.SetRandomTP_Height = function(value)
			teleportation.Height = value
		end

		_G.SetRandomTP_Radius = function(value)
			teleportation.Radius = value
		end


		LocalPlayer.CharacterAdded:Connect(function(character)
			local humanoid = character:WaitForChild("Humanoid")
			humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
		end)

		local remote = game:GetService("ReplicatedStorage").MainEvent
		local mainFunction = game.ReplicatedStorage.MainFunction

		local function shoot(target)
			local args = {[1] = "GunCheck"}
			mainFunction:InvokeServer(unpack(args))

			for i = 1, 6 do
				local targetPlayer = game.Players:FindFirstChild(target)
				if not targetPlayer or not targetPlayer.Character then return end

				local head = targetPlayer.Character:FindFirstChild("Head")
				local tool = LocalPlayer.Character:FindFirstChildWhichIsA("Tool")

				if not head or not tool then return end

				local shootArgs = {
					[1] = "Shoot",
					[2] = {
						[1] = {
							[1] = {
								["Instance"] = head,
								["Normal"] = Vector3.new(0,1,0),
								["Position"] = head.Position
							}
						},
						[2] = {
							[1] = {
								["thePart"] = head,
								["theOffset"] = Vector3.new(-43.9796142578125, 5.25, -11.555770874023438)
							}
						},
						[3] = tool and tool:FindFirstChild("Handle") and tool.Handle.Position or LocalPlayer.Character.HumanoidRootPart.Position,
						[4] = head.Position,
						[5] = tick()
					}
				}

				remote:FireServer(unpack(shootArgs))
				task.wait(0.06)
			end
		end

		-- prefix + whitelist
		local prefix = getgenv().prefix or "."
		local whitelist = getgenv().ownerusername

		local function isWhitelisted(name)
			for _, v in ipairs(whitelist) do
				if v:lower() == name:lower() then
					return true
				end
			end
			return false
		end

		local function findPlayerByPartialName(partialName)
			partialName = string.lower(partialName) -- Make it case-insensitive
			for _, player in ipairs(Players:GetPlayers()) do
				local playerName = string.lower(player.Name)
				local displayName = string.lower(player.DisplayName)

				if string.find(playerName, partialName) or string.find(displayName, partialName) then
					return player -- Return first match
				end
			end
			return nil -- No match found
		end

		local function down()
			-- Require a target first
			if not Script.Target 
				or not Script.Target.Character 
				or not Script.Target.Character:FindFirstChild("Humanoid") then

				print("No valid target selected.")
				return
			end

			-- Enable orbit teleportation
			_G.SetOrbitTarget(Script.Target)
			_G.EnableOrbit(true)
			task.wait(1.5)
			-- Shoot until target dies
			local humanoid = Script.Target.Character:FindFirstChild("Humanoid")
			if not humanoid then
				print("Target has no humanoid.")
				teleportation.active = false
				return
			end

			while Script.Target and Script.Target.Character and (not humanoid.Parent.BodyEffects["K.O"].Value) do
				shoot(Script.Target.Name)
				task.wait(0.1)
			end

			-- Stop orbit teleporting
			teleportation.active = false

			-- Move the local player 100 studs downward
			if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				local hrp = LocalPlayer.Character.HumanoidRootPart
				_G.EnableOrbit(false)
				wait(1)
				hrp.CFrame = CFrame.new(-26.2317238, 34.9869881, -956.068604, -0.174567223, 4.61064609e-08, -0.984645247, -9.13180358e-08, 1, 6.30151789e-08, 0.984645247, 1.00916253e-07, -0.174567223)
				local rle = {
					[1] = "Reload",
					[2] = game.Players.LocalPlayer.Character:FindFirstChild("[Revolver]")
				}
				remote:FireServer(unpack(rle))

			end
		end
	
	
	d2c:setfunctioncallback("down", function(data) 
		local targetName = data.params[1]
		if not targetName then return end
		local plr = findPlayerByPartialName(targetName)

		if not plr then
			print("Player not found:", targetName)
			return
		end

		Script.Target = plr
		print("Target set to:", plr.Name, " — running down()")
		down()
		return
	end, true)
	


		-- CHAT COMMAND HANDLER
		local TextChatService = game:GetService("TextChatService")

		TextChatService.OnIncomingMessage = function(message)
			if not message.TextSource then return end
			local sender = Players:GetPlayerByUserId(message.TextSource.UserId)
			if not sender then return end

			-- Only whitelisted users can run commands
			if not isWhitelisted(sender.Name) then
				return
			end

			local msg = message.Text

			-- Must start with prefix ($)
			if msg:sub(1, #prefix) ~= prefix then
				return
			end

			-- Strip prefix
			msg = msg:sub(#prefix + 1)

			---------------------------------------------------------------------
			-- $down <target>
			---------------------------------------------------------------------
			if msg:sub(1, 4) == "down" then
				local targetName = msg:sub(6) -- skip "down "
				local plr = findPlayerByPartialName(targetName)

				if not plr then
					print("Player not found:", targetName)
					return
				end

				Script.Target = plr
				print("Target set to:", plr.Name, " — running down()")
				down()
				return
			end

			---------------------------------------------------------------------
			-- Default: $username (sets target)
			---------------------------------------------------------------------
			local plr = findPlayerByPartialName(msg)
			if not plr then
				print("Player not found:", msg)
				return
			end

			Script.Target = plr
			print("Target set to:", plr.Name)
		end


		game:GetService('TextChatService').ChatWindowConfiguration.Enabled = true

		print("we in")

		local Players = game:GetService("Players")
		local TeleportService = game:GetService("TeleportService")
		local CoreGui = game:GetService("CoreGui")

		local LocalPlayer = Players.LocalPlayer
		local placeId = game.PlaceId

		local function tryAutoRejoin(messageText)
			-- You can adjust these patterns if your message looks different
			if messageText:lower():find("kicked") 
				or messageText:lower():find("disconnected") 
				or messageText:lower():find("lost connection") then

				-- Try to rejoin the same place
				TeleportService:Teleport(9825515356, LocalPlayer)
			end
		end

		CoreGui:WaitForChild("RobloxPromptGui")
			:WaitForChild("promptOverlay").ChildAdded:Connect(function(child)
				-- This GUI appears for kicks / disconnects / errors
				if child.Name == "ErrorPrompt" then
					-- This is the standard hierarchy Roblox uses for the message
					local messageArea = child:WaitForChild("MessageArea", 5)
					if not messageArea then return end

					local errorFrame = messageArea:WaitForChild("ErrorFrame", 5)
					if not errorFrame then return end

					local errorMessage = errorFrame:FindFirstChildOfClass("TextLabel")
					if not errorMessage then return end

					local text = errorMessage.Text or ""
					tryAutoRejoin(text)
				end
			end)


		Players.PlayerRemoving:Connect(function(plr)
			if isWhitelisted(plr.Name) then
				game:shutdown()
			end
		end)

	end 



---updt
