-- full source with whitelist here: https://pastebin.com/raw/2BcYBrPh
getgenv().Settings =  {
	--// !Main! \\--
	['Owner'] = '', -- Username Of Owner
	['Position'] = 'Back', -- Position Of Stand [Back! / Left! / Right!]
	['Attack'] = 'Heavy!', -- Heavy = Super Punch Light = Spam Punch [Heavy! / Light!]
	['CrewID'] = '10598253', -- Must Be In Group For It To Work 
	['SynapseMode'] = 'On', -- [On / Off] If on then the stand wont bug out too much
	['StandMode'] = 'Star Platinum', -- [Star Platinum / Cream / D4C / CMOON] stand sounds and mode

	--// ! Misc ! \\--
	['FPSCAP'] = '60', -- This is so your main account gets the most fps (MAXED IS 60, SUGGEST 30 FPS ON STANDS)
	['Msg'] = 'Yare Yare Daze..', -- When you say /e msg it makes all the alts say that message
	['LowGraphics'] = "On", -- [On/Off] Turns graphics down so your stand doesnt lag too much
	['NoFace'] = "On", -- [On/Off] For A Better Look On Your Stand

	--//    ! Sounds !     \\--
	--\\ MUST HAVE BOOMBOX //--
	['Sounds'] = "Off", -- [On/Off] Sounds when you use some commands like Mimic! Evolve! etc
	['SummonMusicID'] = 'Default', -- Enter A Sound ID Put [Default] If You Would Like The Default Sound
	['SummonMusic'] = "Off", -- [On/Off]
	['VanishAppearSound'] = "Off", -- [On/Off]
	['CustomSong'] = "3457906535" -- Enter A Song ID And Say "Song!"
}



--setting
local StandOwner = getgenv().Settings.Owner
local Pos = getgenv().Settings.Position
local Attack = getgenv().Settings.Attack
local CrewID = getgenv().Settings.CrewID
local Sounds = getgenv().Settings.Sounds
local Fpscap = getgenv().Settings.FPSCAP
local Msg = getgenv().Settings.Msg
local lowgraphics = getgenv().Settings.LowGraphics
local noface = getgenv().Settings.NoFace
local SummonMusicID = getgenv().Settings.SummonMusicID
local SummonMusic = getgenv().Settings.SummonMusic
local VanishAppear = getgenv().Settings.VanishAppearSound
local SynapseMode = getgenv().Settings.SynapseMode
local CustomSong = getgenv().Settings.CustomSong
local StandMode = getgenv().Settings.StandMode
--end


--anti tp bypass
grm = getrawmetatable(game)
setreadonly(grm, false)
old = grm.__namecall
grm.__namecall = newcclosure(function(self, ...)
	local args = {...}
	if tostring(args[1]) == "TeleportDetect" then
		return
	elseif tostring(args[1]) == "CHECKER_1" then
		return
	elseif tostring(args[1]) == "CHECKER" then
		return
	end
	return old(self, ...)
end)
--end

local vu = game:GetService("VirtualUser") -- AntiAfk
game:GetService("Players").LocalPlayer.Idled:connect(function()
	vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)


if noface == "On" then
	if game.Players.LocalPlayer.Character.Head:FindFirstChild("face") then
		game.Players.LocalPlayer.Character.Head.face:Destroy()
	elseif not game.Players.LocalPlayer.Character.Head:FindFirstChild("face") then
		print("Already has no face!")
	end
end

_G.FPS = Fpscap
local clock = tick()

_G.fps = true 
game:service"RunService".RenderStepped:connect(function()
	if _G.fps == true then
		while clock + 1 / _G.FPS > tick() do end
		wait()
		clock = tick()
	end
end)

game.StarterGui:SetCore("SendNotification", {
	Title = "Nova Stand"; 
	Text = "Made By $ Icxy#0001 And The_KillerHood! This Script Should Not Be Resold!";
	Duration = 30;
})

for d, e in pairs(game.Workspace:GetDescendants()) do
	if e:IsA("Seat") then
		e:Destroy()
	end
end

lp = game:GetService("Players").LocalPlayer
rs = game:GetService("RunService")

loadstring(game:HttpGet("https://talornoob.000webhostapp.com/noclip"))()
setfflag("HumanoidParallelRemoveNoPhysics", "False")
setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
rs:BindToRenderStep("w", Enum.RenderPriority.Camera.Value, function()
	if _G.noclipsyn == true then
		lp.Character:WaitForChild("Humanoid"):ChangeState(11)
		rs.RenderStepped:Wait()
	end
end)

local e = Instance.new("Part", game.Workspace)
e.Parent = game.Workspace
e.Name = "FLOATPART"
e.Transparency = 1
e.Anchored = true

if lowgraphics == "On" then
	local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
	local g = game
	local w = g.Workspace
	local l = g.Lighting
	local t = w.Terrain
	t.WaterWaveSize = 0
	t.WaterWaveSpeed = 0
	t.WaterReflectance = 0
	t.WaterTransparency = 0
	l.GlobalShadows = false
	l.FogEnd = 9e9
	l.Brightness = 0
	settings().Rendering.QualityLevel = "Level01"
	for i, v in pairs(g:GetDescendants()) do
		if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
			v.Material = "Plastic"
			v.Reflectance = 0
		elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
			v.Transparency = 1
		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
			v.Lifetime = NumberRange.new(0)
		elseif v:IsA("Explosion") then
			v.BlastPressure = 1
			v.BlastRadius = 1
		elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
			v.Enabled = false
		elseif v:IsA("MeshPart") then
			v.Material = "Plastic"
			v.Reflectance = 0
			v.TextureID = 10385902758728957
		end
	end
	for i, e in pairs(l:GetChildren()) do
		if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
			e.Enabled = false
		end
	end
	print("Low Graphics Enabled!")
end

--locals for Attack!
local StandUser = game.Players[StandOwner]
local Player = game.Players.LocalPlayer
local Players = game.Players
local StudLimit = 75
local MainEvent = game:GetService("ReplicatedStorage").MainEvent

--locals
local Player = game.Players.LocalPlayer
plr = game.Players.LocalPlayer
killed = false
killnear = false
follow = false
noclip = false
bring = true
evolvefollow = false
barragepos = false
barragepunch = false
vanish = false
bind = false
aura = false
mimic = false
Block = false
mimicpunch = false
killtheplayer = false

function Hit()
	if Attack == 'Heavy!' then
		if Player.Character:FindFirstChild('Combat') then
			Player.Character:FindFirstChild('Combat'):Activate()
		else
			Player.Backpack:FindFirstChild('Combat').Parent = Player.Character
		end   
	else
		if Attack == 'Light!' then
			if Player.Character:FindFirstChild('Combat') then
				Player.Character:FindFirstChild('Combat'):Activate()
				Player.Character:FindFirstChild('Combat'):Deactivate()
			else
				Player.Backpack:FindFirstChild('Combat').Parent = Player.Character
			end  
		end
	end
end



function GetNearest()
	local ClosestPlayer
	local ClosestDistance = math.huge
	for _,v in pairs(Players:GetPlayers()) do
		if v.Character and StandUser.Character then
			if v.Character:FindFirstChild('BodyEffects') and v.Character:FindFirstChild('BodyEffects'):FindFirstChild('Defense') and v.Character:FindFirstChild('BodyEffects'):FindFirstChild('BreakingParts') then
				if v ~= StandUser and v:FindFirstChild('DataFolder') and v:FindFirstChild('DataFolder'):FindFirstChild('Information') then
					if v.Character:WaitForChild('BodyEffects')['K.O'].Value == false then
						if v:FindFirstChild('DataFolder'):FindFirstChild('Information'):FindFirstChild('Crew') then
							if v.Character:FindFirstChild('HumanoidRootPart') then
								if v.DataFolder.Information.Crew.Value ~= StandUser.DataFolder.Information.Crew.Value or not v.DataFolder.Information:FindFirstChild('Crew') then
									local Distance = (v.Character.HumanoidRootPart.Position - StandUser.Character.HumanoidRootPart.Position).Magnitude
									if Distance < ClosestDistance then
										if Distance <= StudLimit then
											ClosestDistance = Distance
											ClosestPlayer = v
										end
									end
								end
							end
						else
							if v.Character:FindFirstChild('HumanoidRootPart') then
								local Distance = (v.Character.HumanoidRootPart.Position - StandUser.Character.HumanoidRootPart.Position).Magnitude
								if Distance < ClosestDistance then
									if Distance <= StudLimit then
										ClosestDistance = Distance
										ClosestPlayer = v
									end
								end
							end
						end
					end
				end
			end
		end
	end
	return ClosestPlayer
end

function GetNearest2()
	local ClosestPlayer
	local ClosestDistance = math.huge
	for _,v in pairs(Players:GetPlayers()) do
		if v.Character and StandUser.Character then
			if v.Character:FindFirstChild('BodyEffects') and v.Character:FindFirstChild('BodyEffects'):FindFirstChild('Defense') and v.Character:FindFirstChild('BodyEffects'):FindFirstChild('BreakingParts') then
				if v ~= StandUser and v:FindFirstChild('DataFolder') and v:FindFirstChild('DataFolder'):FindFirstChild('Information') then
					if v.Character:WaitForChild('BodyEffects')['K.O'].Value == true then
						if v:FindFirstChild('DataFolder'):FindFirstChild('Information'):FindFirstChild('Crew') then
							if v.Character:FindFirstChild('HumanoidRootPart') then
								if v.DataFolder.Information.Crew.Value ~= StandUser.DataFolder.Information.Crew.Value or not v.DataFolder.Information:FindFirstChild('Crew') then
									local Distance = (v.Character.HumanoidRootPart.Position - StandUser.Character.HumanoidRootPart.Position).Magnitude
									if Distance < ClosestDistance then
										if Distance <= StudLimit then
											ClosestDistance = Distance
											ClosestPlayer = v
										end
									end
								end
							end
						else
							if v.Character:FindFirstChild('HumanoidRootPart') then
								local Distance = (v.Character.HumanoidRootPart.Position - StandUser.Character.HumanoidRootPart.Position).Magnitude
								if Distance < ClosestDistance then
									if Distance <= StudLimit then
										ClosestDistance = Distance
										ClosestPlayer = v
									end
								end
							end
						end
					end
				end
			end
		end
	end
	return ClosestPlayer
end

local hover = Instance.new("Animation", game.Workspace)
hover.Name = "Hover"
hover.AnimationId = "rbxassetid://3541114300"
local char = game.Players.LocalPlayer.Character
local hoveranim = char.Humanoid:LoadAnimation(game.Workspace.Hover)

local movehover = Instance.new("Animation", game.Workspace)
movehover.Name = "MoveHover"
movehover.AnimationId = "rbxassetid://3541044388"
local char = game.Players.LocalPlayer.Character
local movehoveranim = char.Humanoid:LoadAnimation(game.Workspace.MoveHover)


--end

--functions
local OriginalKeyUpValue = 0
function StopAudio()
	if game:GetService("Players").LocalPlayer.Character.LowerTorso:FindFirstChild("BOOMBOXSOUND") then
		game:GetService("Players").LocalPlayer.Character.LowerTorso.BOOMBOXSOUND:Stop()
	end
end
function stop(ID, Key)
	local cor = coroutine.wrap(function()
		wait(game:GetService("Players").LocalPlayer.Character.LowerTorso.BOOMBOXSOUND.TimeLength-0.1)
		if game:GetService("Players").LocalPlayer.Character.LowerTorso.BOOMBOXSOUND.SoundId == "rbxassetid://"..ID and OriginalKeyUpValue == Key then
			StopAudio()
		end
	end)
	cor()
end
function play(ID, STOP, LMAO)
	if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[Boombox]") then
		local Tool = nil
		if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") and LMAO == true then
			Tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
			game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Parent = game:GetService("Players").LocalPlayer.Backpack
		end
		game:GetService("Players").LocalPlayer.Backpack["[Boombox]"].Parent =
			game:GetService("Players").LocalPlayer.Character
		game.ReplicatedStorage.MainEvent:FireServer("Boombox", ID)
		game:GetService("Players").LocalPlayer.Character["[Boombox]"].RequiresHandle = false
		if game:GetService("Players").LocalPlayer.Character["[Boombox]"]:FindFirstChild("Handle") then
			game:GetService("Players").LocalPlayer.Character["[Boombox]"].Handle:Destroy()
		end
		game:GetService("Players").LocalPlayer.Character["[Boombox]"].Parent =
			game:GetService("Players").LocalPlayer.Backpack
		game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.BoomboxFrame.Visible = false
		if Tool ~= true then
			if Tool then
				Tool.Parent = game:GetService("Players").LocalPlayer.Character
			end
		end
		if STOP == true then
			game:GetService("Players").LocalPlayer.Character.LowerTorso:WaitForChild("BOOMBOXSOUND")
			local cor = coroutine.wrap(function()
				repeat wait() until game:GetService("Players").LocalPlayer.Character.LowerTorso.BOOMBOXSOUND.SoundId == "rbxassetid://"..ID and game:GetService("Players").LocalPlayer.Character.LowerTorso.BOOMBOXSOUND.TimeLength > 0.01
				OriginalKeyUpValue = OriginalKeyUpValue+1
				stop(ID, OriginalKeyUpValue)
			end)
			cor()
		end
	end
end
--end

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Banish!") then

		autostomp = false

	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("/e noface") then

		game.Players.LocalPlayer.Character.Head.face:Destroy()

	end 
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Light!") then
		Attack = "Light!"
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Heavy!") then
		Attack = "Heavy!"
	end
end)

local rsummon = {
	"8713037614",
	"8705304536",
	"8769131644",
	"4683843842"
}

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Summon!") then
		if SummonMusic == "On" and SummonMusicID == "Default" then
			play((rsummon[math.random(1,#rsummon)]), true, true)
		elseif SummonMusic == "On" and not SummonMusicID == "Default" then
			play(SummonMusicID, true, true)
		end
		local A_1 = "I'm Here, Master" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 
		follow = true
		barragepos = false
		oranear = false
		barragepunch = false
		vanish = false
		autostomp = false
		aura = false
		noclip = true
		hoveranim:Play()
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Unmimic!") then

		follow = true
		noclip = true
		barragepos = false
		vanish = false
		mimic = false
		barragepos = false
		barragepunch = false
		Block = false
		mimicpunch = false
		oranear = false

	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Mimic!") then

		local A_1 = "Mimic Enabled Master!" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 

		follow = true
		barragepos = false
		noclip = true
		vanish = false
		mimic = true
		barragepos = false
		barragepunch = false
		Block = true
		mimicpunch = true
		oranear = false
	end
end)

game:GetService('RunService').Stepped:connect(function()
	if mimic == true then
		if game.Players[StandOwner].Character.BodyEffects.Attacking.Value == true then
			Player.Character.HumanoidRootPart.CFrame = game.Players[StandOwner].Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-6)
			Hit()
		else
			if Block == true then
				if game.Players[StandOwner].Character.BodyEffects:FindFirstChild("Block") then
					game:GetService("ReplicatedStorage").MainEvent:FireServer("Block", true)
					Player.Character.HumanoidRootPart.CFrame = game.Players[StandOwner].Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-6)
				else
					game:GetService("ReplicatedStorage").MainEvent:FireServer("Block", false)
				end
			end
			--end
		end
	end
end)

game:service"RunService".RenderStepped:connect(function()
	if Block == true then
		if game.Players[StandOwner].Character.BodyEffects:FindFirstChild("Block") then
			game:GetService("ReplicatedStorage").MainEvent:FireServer("Block", true)
		else
			game:GetService("ReplicatedStorage").MainEvent:FireServer("Block", false)
		end
	end
end)

--[[game:GetService('RunService').Stepped:connect(function()
	if mimicpunch == true then
		if game:GetService("Workspace").Players[StandOwner].BodyEffects.Attacking.Value == true then
			game:GetService("VirtualUser"):ClickButton1(Vector2.new())
			if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") then
				game.Players.LocalPlayer.Backpack:FindFirstChild("Combat").Parent = game.Players.LocalPlayer.Character
			end
		end
	end
end)]]

game:GetService("Players").LocalPlayer.Chatted:Connect(function(msg)
	if msg == ("Unora!") then

		oranear = false
		autostomp = false
		barragepos = false
		barragepunch = false
		evolvefollow = false
		aura = false
		killnear = false
		mimic = false
		vanish = false
		killed = false
		bring = false
		Block = false
		mimicpunch = false

		follow = true
		noclip = true
	end
end)

game:GetService("Players").LocalPlayer.Chatted:Connect(function(msg)
	if msg == ("Unbring!") then

		oranear = false
		autostomp = false
		barragepos = false
		barragepunch = false
		evolvefollow = false
		aura = false
		killnear = false
		mimic = false
		vanish = false
		killed = false
		bring = false
		Block = false
		mimicpunch = false

	end
end)

game:GetService("Players").LocalPlayer.Chatted:Connect(function(msg)
	if msg == ("Stop!") then
		wait(.2)
		local A_1 = "Powers Disabled!" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 

		follow = false
		oranear = false
		autostomp = false
		barragepos = false
		barragepunch = false
		evolvefollow = false
		noclip = false
		aura = false
		killnear = false
		mimic = false
		vanish = false
		killed = false
		bring = false
		Block = false
		mimicpunch = false
		killtheplayer = false
		game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		hoveranim:Stop()
		StopAudio()

	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Stop!") then	

		local A_1 = "Master Disabled My Powers!" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 

		follow = false
		barragepos = false
		barragepunch = false
		evolvefollow = false
		noclip = false
		aura = false
		mimic = false
		vanish = false
		killed = false
		bring = false
		killnear = false
		Block = false
		mimicpunch = false
		killtheplayer = false
		game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		hoveranim:Stop()
		StopAudio()
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Left!") then	

		local A_1 = "Position Set Master!" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 

		Pos = "Left"
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Right!") then

		local A_1 = "Position Set Master!" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 

		Pos = "Right"
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Back!") then	

		local A_1 = "Position Set Master!" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 

		Pos = "Back"
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Leave!") then
		game:Shutdown()
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("stand!Jumped") then

	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Vanish!") then
		local A_1 = "Vanishing!" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 
		if VanishAppear == "On" then
			play(6546133414, true, true)
		end
		wait(1.5)
		StopAudio()
		vanish = true
		noclip = true
		autostomp = false
		barragepos = false
		barragepunch = false
		killnear = false
		follow = false
		evolvefollow = false
		mimic = false
		Block = false
		killtheplayer = false
		vanish = true
		game.Workspace.Camera.CameraSubject = game.Players[StandOwner].Character.Humanoid;
		while vanish == true do
			game:service('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-374.04702758789, 427.14468383789, -263.02795410156) wait()
			game:service('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-235.09289550781, 427.14468383789, -326.25317382812) wait()
			game:service('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-433.60748291016, 427.13568115234, -180.2112121582) wait()
			game:service('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-351.47393798828, 427.11862182617, -182.98684692383) wait()
			game:service('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-349.13708496094, 369.23416137695, -232.91188049316) wait()
			game:service('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-255.47518920898, 326.90557861328, -307.60479736328) wait()
			game:service('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-408.70520019531, 387.16589355469, -332.86459350586) wait()
		end
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Appear!") then
		vanish = false
		follow = true
		noclip = true
		barragepos = false
		barragepunch = false
		vanish = false
		game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		wait()

		local A_1 = "Im Back Master!" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 

		if VanishAppear == "On" then
			play(6543435253, true, true)
		end
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Dark Rebirth!") then
		play(6661478470, true, true)
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Golden Experience!") then
		play(6037482765, false, true)
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Killer!") then
		play(8730302992, false, true)
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Mysterious!") then
		play(3993398286, false, true)
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("/e stopaudio") then
		StopAudio()
	end
end)



game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Battle!") then

		play(5105940701, true, true)

	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Song!") then

		play(CustomSong, false, true)

	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Golden Wind!") then
		play(3429326637, false, true)
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Ora!") then

		if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") then
			game.Players.LocalPlayer.Backpack:FindFirstChild("Combat").Parent = game.Players.LocalPlayer.Character
		end
		wait()
		game.ReplicatedStorage.MainEvent:FireServer("ChargeButton")
		wait(1)
		noclip = false
		follow = false
		Block = false
		vanish = false
		barragepos = false
		killtheplayer = false
		killnear = false
		barragepunch = false
		mimic = false
		evolvefollow = false
		wait(.3)
		game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		plr.Character.HumanoidRootPart.CFrame = game.Players[StandOwner].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -30)
		if Sounds == "On" then
			play(7808867467, true, true)
		end
		wait(.8)
		noclip = true
		follow = true
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Bind!") then
		local A_1 = "Bind Enabled!" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 
		bind = true
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Unbind!") then

		local A_1 = "Bind Disabled Master!" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 

		bind = false
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Save!") then

		noclip = false
		Block = false
		mimic = false
		vanish = false
		killtheplayer = false
		barragepos = false
		killnear = false
		barragepunch = false
		follow = false
		evolvefollow = false
		game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid

		repeat wait()
			if game.Players[StandOwner].Character.BodyEffects["K.O"].Value == true then

				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[StandOwner].Character.UpperTorso.Position) * CFrame.new(0,1,0)
				wait(.4)
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing")
				wait(.4)
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-484.67132568359, 41.499858856201, -100.71377563477)
				wait(1.5)
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing")

			end

			if game.Players[StandOwner].Character.BodyEffects["K.O"].Value == false then

				noclip = true
				follow = true

			end
		until game.Players[StandOwner].Character.BodyEffects["K.O"].Value == false

	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Aura!") then

		game.Workspace.Camera.CameraSubject = game.Players[StandOwner].Character.Humanoid;
		follow = false
		evolvefollow = false
		noclip = true
		Block = false
		killnear = false
		killtheplayer = false
		mimic = false
		vanish = false
		barragepos = false
		barragepunch = false
		aura = true
		game.Workspace.Camera.CameraSubject = game.Players[StandOwner].Character.Humanoid;

		repeat wait()

			local RanX = math.random(-12,12)
			local RanZ = math.random(-12,12)
			Player.Character.HumanoidRootPart.CFrame = CFrame.new(StandUser.Character.UpperTorso.Position.X + RanX, StandUser.Character.UpperTorso.Position.Y - 10, StandUser.Character.UpperTorso.Position.Z + RanZ)
			wait()
			Hit()
		until aura == false


		while wait() do
			pcall(function()
				for i,v in pairs(game:GetService('Players'):GetChildren()) do
					if (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.LeftHand.Position).Magnitude <= 50 then
						firetouchinterest(game.Players.LocalPlayer.Character['RightHand'], v.Character.UpperTorso, 0)
						firetouchinterest(game.Players.LocalPlayer.Character['LeftHand'], v.Character.UpperTorso, 0)
						firetouchinterest(game.Players.LocalPlayer.Character['RightFoot'], v.Character.UpperTorso, 0)
						firetouchinterest(game.Players.LocalPlayer.Character['LeftFoot'], v.Character.UpperTorso, 0)
						firetouchinterest(game.Players.LocalPlayer.Character['RightLowerLeg'], v.Character.UpperTorso, 0)
						firetouchinterest(game.Players.LocalPlayer.Character['LeftLowerLeg'], v.Character.UpperTorso, 0)
					end
				end
			end)
		end

	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Noaura!") then
		game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		aura = false
		follow = true
		noclip = true

	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Power!") then

		if Sounds == "On" then
			play(2152227673, true, true)
		end

		while wait() do
			pcall(function()
				for i,v in pairs(game:GetService('Players'):GetChildren()) do
					if (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.LeftHand.Position).Magnitude <= 50 then
						firetouchinterest(game.Players.LocalPlayer.Character['RightHand'], v.Character.UpperTorso, 0)
						firetouchinterest(game.Players.LocalPlayer.Character['LeftHand'], v.Character.UpperTorso, 0)
						firetouchinterest(game.Players.LocalPlayer.Character['RightFoot'], v.Character.UpperTorso, 0)
						firetouchinterest(game.Players.LocalPlayer.Character['LeftFoot'], v.Character.UpperTorso, 0)
						firetouchinterest(game.Players.LocalPlayer.Character['RightLowerLeg'], v.Character.UpperTorso, 0)
						firetouchinterest(game.Players.LocalPlayer.Character['LeftLowerLeg'], v.Character.UpperTorso, 0)
					end
				end
			end)
		end

	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Synapse!") then

		SynapseMode = "On"
		wait()
		_G.noclipsyn = true

	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Rejoin!") then

		TeleportService = game:GetService("TeleportService")
		placeID_1 = 2788229376  --Da hood
		wait()
		TeleportService:Teleport(placeID_1, plr)

	end     
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Reset!") then
		game.Players.LocalPlayer.Character.Head:Destroy()
		game.Players.LocalPlayer.Character.RightHand:Destroy()
		game.Players.LocalPlayer.Character.LeftHand:Destroy()
		game.Players.LocalPlayer.Character.LowerTorso:Destroy()
		game.Players.LocalPlayer.Character.UpperTorso:Destroy()
		game.Players.LocalPlayer.Character.LeftLowerLeg:Destroy()
		game.Players.LocalPlayer.Character.RightLowerLeg:Destroy()
		game.Players.LocalPlayer.Character.RightFoot:Destroy()
		game.Players.LocalPlayer.Character.LeftFoot:Destroy()
		game.Players.LocalPlayer.Character.LeftUpperLeg:Destroy()
		game.Players.LocalPlayer.Character.RightUpperLeg:Destroy()
		game.Players.LocalPlayer.Character.RightUpperArm:Destroy()
		game.Players.LocalPlayer.Character.RightLowerArm:Destroy()
		game.Players.LocalPlayer.Character.LeftLowerArm:Destroy()
		game.Players.LocalPlayer.Character.LeftUpperArm:Destroy()
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Untarget!") then

		noclip = true
		follow = true
		evolvefollow = false
		aura = false
		mimic = false
		killnear = false
		killed = false
		Block = false
		vanish = false
		killtheplayer = false
		barragepos = false
		barragepunch = false
		bring = false
		killtheplayer = false
		autostomp = false
		game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
	end
end)

local commands = {}
local prefix = "/"
local Players = game.Players

function findPlayer(name)
	for _, player in ipairs(Players:GetPlayers()) do
		if (string.lower(name) == string.sub(string.lower(player.Name), 1, #name)) then
			return player;
		end
	end
end


--print(tostring(findPlayer(arguments[2])))
local gettingkilled = ""
local brotagettingkilled = ""

-- /e bring , target , setuser , bring2
commands.e = function(arguments)
	local CMD = arguments[1]
	if CMD == 'b' then
		if arguments[2] then
			local target1 = tostring(findPlayer(arguments[2]))
			print(target1)
			Block = false
			mimic = false
			barragepos = false
			barragepunch = false
			follow = false
			vanish = false
			noclip = false
			killnear = false
			bring = true
			game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
			repeat wait()
				if game.Players[target1].Character.BodyEffects["K.O"].Value == false then
					if game. Players.LocalPlayer.Backpack:FindFirstChild("Combat") then
						game.Players.LocalPlayer.Backpack:FindFirstChild("Combat").Parent = game.Players.LocalPlayer.Character
					end
					wait()
					game.Players.LocalPlayer.Character:FindFirstChild('Combat'):Activate()
					game.Players.LocalPlayer.Character:FindFirstChild('Combat'):Deactivate()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[target1].Character.HumanoidRootPart.CFrame
				end
			until game.Players[target1].Character.BodyEffects["K.O"].Value == true or bring == false
			wait()
			repeat wait()
				if game.Players[target1].Character.BodyEffects["K.O"].Value == true then
					game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[target1].Character.UpperTorso.Position) * CFrame.new(0,1,0)
					wait(.4)
					game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[target1].Character.UpperTorso.Position) * CFrame.new(0,1,0)
					wait()
					game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[target1].Character.UpperTorso.Position) * CFrame.new(0,1,0)
					wait(.4)
					game.ReplicatedStorage.MainEvent:FireServer("Grabbing")
					wait(.6)
					game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[StandOwner].Character.HumanoidRootPart.CFrame
				end

				if game.Players[target1].Character.BodyEffects["K.O"].Value == false then

				end
			until game.Players[target1].Character.BodyEffects["K.O"].Value == false or bring == false
			follow = true
			noclip = true
		end
	elseif CMD == 't' then
		if arguments[2] then
			local target3 = tostring(findPlayer(arguments[2]))
			gettingkilled = target3
			noclip = true
			follow = false
			evolvefollow = false
			aura = false
			mimic = false
			killnear = false
			killed = true
			Block = false
			vanish = false
			barragepos = false
			barragepunch = false
			bring = false
			game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		end
	elseif CMD == 't2' then
		if arguments[2] then
			local target4 = tostring(findPlayer(arguments[2]))
			brotagettingkilled = target4
			noclip = true
			follow = false
			evolvefollow = false
			aura = false
			mimic = false
			killnear = false
			killed = false
			Block = false
			vanish = false
			barragepos = false
			barragepunch = false
			bring = false
			killtheplayer = true
			game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
			--here
		end
	elseif CMD == 'song' then
		if arguments[2] then
			play((arguments[2]), true, true)

		end
	end
end

game.Players[StandOwner].Chatted:Connect(function(msg)
	msg = string.lower(msg)
	local splitString = msg:split(" ")
	local slashCommand = splitString[1] 
	local cmd = slashCommand:split(prefix)    
	local cmdName = cmd[2]    
	if commands[cmdName] then
		local arguments = {} 
		for i = 2, #splitString, 1 do
			table.insert(arguments,splitString[i])            
		end
		commands[cmdName](arguments)
	end
end)


-----
game:service"RunService".RenderStepped:connect(function()
	if killed == true then
		Hit()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[gettingkilled].Character.UpperTorso.Position) * CFrame.new(0,-9,0)
		game.Workspace.Camera.CameraSubject = game:GetService("Players")[gettingkilled].Character.UpperTorso
	end
end)	


game:service"RunService".RenderStepped:connect(function()
	if killtheplayer == true and game.Players[brotagettingkilled].Character.BodyEffects["K.O"].Value == false then
		Hit()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[brotagettingkilled].Character.UpperTorso.Position) * CFrame.new(0,-9,0)
		game.Workspace.Camera.CameraSubject = game:GetService("Players")[brotagettingkilled].Character.UpperTorso
	else
		if killtheplayer == true and  game.Players[brotagettingkilled].Character.BodyEffects["K.O"].Value == true then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[brotagettingkilled].Character.UpperTorso.Position) * CFrame.new(0,3,0)
			game.Workspace.Camera.CameraSubject = game:GetService("Players")[brotagettingkilled].Character.UpperTorso
			autostomp = true
		end
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("DropCash!") then
		local A_1 = "Anything For My Master!" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 
		local A_1 = "DropMoney"
		local A_2 = "10000"
		local Event = game:GetService("ReplicatedStorage").MainEvent
		Event:FireServer(A_1, A_2)
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Hide!") then

		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()

		local plr = game.Players.LocalPlayer
		plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Surgeon Mask] - $25"].Head.CFrame
		wait(.3)
		fireclickdetector(game.Workspace.Ignored.Shop["[Surgeon Mask] - $25"].ClickDetector)
		wait(.3)
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Mask") then
			game.Players.LocalPlayer.Backpack:FindFirstChild("Mask").Parent = game.Players.LocalPlayer.Character
		end
		wait(.2)
		game:GetService("VirtualUser"):ClickButton1(Vector2.new())
		wait()
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
		wait(.2)
		follow = true
		noclip = true
		wait(.3)
		for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
			if v.Name == "In-gameMask" then 
				v.Handle:Destroy()
			end
		end

		wait()

		follow = true
		wait()
		noclip = true

	end
end)



game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Evolve!") then

		noclip = true
		follow = false
		mimic = false
		barragepos = false
		killnear = false
		vanish = false
		barragepunch = false
		killtheplayer = false
		Block = false
		wait()
		evolvefollow = true
		game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid

		local function rm()
			for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v.Name == "OriginalPosition" then
					v:Destroy()
				elseif v.Name == "OriginalSize" then
					v:Destroy()
				elseif v.Name == "AvatarPartScaleType" then
					v:Destroy()
				end
			end
		end
		local Humanoid = game.Players.LocalPlayer.Character.Humanoid


		local player = game.Players.LocalPlayer
		local anim = Instance.new("Animation")
		anim.AnimationId = "rbxassetid://2788838708"
		local play = player.Character:WaitForChild("Humanoid"):LoadAnimation(anim)
		play:AdjustSpeed(0.1)

		play:Play()

		rm()
		wait(0.5)
		Humanoid:FindFirstChild("BodyTypeScale"):Destroy()
		wait(1)

		rm()
		wait(0.5)
		Humanoid:FindFirstChild("BodyWidthScale"):Destroy()
		wait(1)

		rm()
		wait(0.5)
		Humanoid:FindFirstChild("BodyDepthScale"):Destroy()
		play:Play()
		wait()

		rm()
		wait(0.5)
		Humanoid:FindFirstChild("HeadScale"):Destroy()

	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("ORA!") then

		oranear = true
		autostomp = false
		killtheplayer = false
		killnear = false
		noclip = true
		vanish = false
		barragepos = false
		barragepunch = false

	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Barrage!") then
		local A_1 = "ORA! ORA! ORA! ORA!" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 

		play(5487424124, false, true)
		follow = false
		oranear = false
		autostomp = false
		killnear = false
		noclip = true
		vanish = false
		killtheplayer = false
		barragepos = true
		barragepunch = true
		game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid

		repeat wait()
			if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") then
				game.Players.LocalPlayer.Backpack:FindFirstChild("Combat").Parent = game.Players.LocalPlayer.Character
			end
			wait()
			game.Players.LocalPlayer.Character:FindFirstChild('Combat'):Activate()
			game.Players.LocalPlayer.Character:FindFirstChild('Combat'):Deactivate()
		until barragepunch == false
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Drop!") then

		game.ReplicatedStorage.MainEvent:FireServer("Grabbing")

	end    
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Crew!") then

		game.ReplicatedStorage.MainEvent:FireServer("LeaveCrew")
		wait(.5)
		game.ReplicatedStorage.MainEvent:FireServer("JoinCrew",CrewID)

	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Uncrew!") then

		game.ReplicatedStorage.MainEvent:FireServer("LeaveCrew")

	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("To Base!") then

		game.ReplicatedStorage.MainEvent:FireServer("LeaveCrew")

		wait()

		noclip = false
		Block = false
		mimic = false
		vanish = false
		barragepos = false
		killnear = false
		killtheplayer = false
		barragepunch = false
		follow = false
		evolvefollow = false
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[StandOwner].Character.UpperTorso.Position) * CFrame.new(0,1,0)
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") then
			game.Players.LocalPlayer.Backpack:FindFirstChild("Combat").Parent = game.Players.LocalPlayer.Character
		end
		wait()
		game.Players.LocalPlayer.Character:FindFirstChild('Combat'):Activate()
		wait(5)

		repeat wait()
			if game.Players[StandOwner].Character.BodyEffects["K.O"].Value == true then

				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[StandOwner].Character.UpperTorso.Position) * CFrame.new(0,1,0)
				wait(.4)
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing")
				wait(.4)
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-726.136169, -39.6542053, -885.562744)
				wait(1.5)
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing")

			end

			if game.Players[StandOwner].Character.BodyEffects["K.O"].Value == false then

				noclip = true
				follow = true
			end
		until game.Players[StandOwner].Character.BodyEffects["K.O"].Value == false	

		wait()

		game.ReplicatedStorage.MainEvent:FireServer("JoinCrew",CrewID) 


	end    
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("To Shop1!") then

		game.ReplicatedStorage.MainEvent:FireServer("LeaveCrew")

		wait()

		noclip = false
		killtheplayer = false
		Block = false
		mimic = false
		vanish = false
		barragepos = false
		killnear = false
		barragepunch = false
		follow = false
		evolvefollow = false
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[StandOwner].Character.UpperTorso.Position) * CFrame.new(0,1,0)
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") then
			game.Players.LocalPlayer.Backpack:FindFirstChild("Combat").Parent = game.Players.LocalPlayer.Character
		end
		wait()
		game.Players.LocalPlayer.Character:FindFirstChild('Combat'):Activate()
		wait(5)

		repeat wait()
			if game.Players[StandOwner].Character.BodyEffects["K.O"].Value == true then

				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[StandOwner].Character.UpperTorso.Position) * CFrame.new(0,1,0)
				wait(.4)
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing")
				wait(.4)
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-578.96765136719, 66.649810791016, -682.64239501953)
				wait(1.5)
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing")

			end

			if game.Players[StandOwner].Character.BodyEffects["K.O"].Value == false then

				noclip = true
				follow = true
			end
		until game.Players[StandOwner].Character.BodyEffects["K.O"].Value == false	

		wait()

		game.ReplicatedStorage.MainEvent:FireServer("JoinCrew",CrewID) 


	end    
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("To Shop2!") then

		game.ReplicatedStorage.MainEvent:FireServer("LeaveCrew")

		wait()

		noclip = false
		Block = false
		mimic = false
		vanish = false
		barragepos = false
		killnear = false
		barragepunch = false
		killtheplayer = false
		follow = false
		evolvefollow = false
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[StandOwner].Character.UpperTorso.Position) * CFrame.new(0,1,0)
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") then
			game.Players.LocalPlayer.Backpack:FindFirstChild("Combat").Parent = game.Players.LocalPlayer.Character
		end
		wait()
		game.Players.LocalPlayer.Character:FindFirstChild('Combat'):Activate()
		wait(5)

		repeat wait()
			if game.Players[StandOwner].Character.BodyEffects["K.O"].Value == true then

				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[StandOwner].Character.UpperTorso.Position) * CFrame.new(0,1,0)
				wait(.4)
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing")
				wait(.4)
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(432.02212524414, 106.68374633789, -624.31518554688)
				wait(1.5)
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing")

			end

			if game.Players[StandOwner].Character.BodyEffects["K.O"].Value == false then

				noclip = true
				follow = true
			end
		until game.Players[StandOwner].Character.BodyEffects["K.O"].Value == false	

		wait()

		game.ReplicatedStorage.MainEvent:FireServer("JoinCrew",CrewID) 


	end    
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("To Bank!") then

		game.ReplicatedStorage.MainEvent:FireServer("LeaveCrew")

		wait()

		noclip = false
		Block = false
		mimic = false
		vanish = false
		killtheplayer = false
		barragepos = false
		killnear = false
		barragepunch = false
		follow = false
		evolvefollow = false
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[StandOwner].Character.UpperTorso.Position) * CFrame.new(0,1,0)
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") then
			game.Players.LocalPlayer.Backpack:FindFirstChild("Combat").Parent = game.Players.LocalPlayer.Character
		end
		wait()
		game.Players.LocalPlayer.Character:FindFirstChild('Combat'):Activate()
		wait(5)

		repeat wait()
			if game.Players[StandOwner].Character.BodyEffects["K.O"].Value == true then

				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[StandOwner].Character.UpperTorso.Position) * CFrame.new(0,1,0)
				wait(.4)
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing")
				wait(.4)
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-445.48233032227, 39.001861572266, -284.55798339844)
				wait(1.5)
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing")

			end

			if game.Players[StandOwner].Character.BodyEffects["K.O"].Value == false then

				noclip = true
				follow = true
			end
		until game.Players[StandOwner].Character.BodyEffects["K.O"].Value == false	

		wait()

		game.ReplicatedStorage.MainEvent:FireServer("JoinCrew",CrewID) 


	end    
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("To Club!") then

		game.ReplicatedStorage.MainEvent:FireServer("LeaveCrew")

		wait()

		noclip = false
		Block = false
		killtheplayer = false
		mimic = false
		vanish = false
		barragepos = false
		killnear = false
		barragepunch = false
		follow = false
		evolvefollow = false
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[StandOwner].Character.UpperTorso.Position) * CFrame.new(0,1,0)
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") then
			game.Players.LocalPlayer.Backpack:FindFirstChild("Combat").Parent = game.Players.LocalPlayer.Character
		end
		wait()
		game.Players.LocalPlayer.Character:FindFirstChild('Combat'):Activate()
		wait(5)

		repeat wait()
			if game.Players[StandOwner].Character.BodyEffects["K.O"].Value == true then

				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[StandOwner].Character.UpperTorso.Position) * CFrame.new(0,1,0)
				wait(.4)
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing")
				wait(.4)
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-264.96301269531, -6.2083458900452, -379.59927368164)
				wait(1.5)
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing")

			end

			if game.Players[StandOwner].Character.BodyEffects["K.O"].Value == false then

				noclip = true
				follow = true
			end
		until game.Players[StandOwner].Character.BodyEffects["K.O"].Value == false	

		wait()

		game.ReplicatedStorage.MainEvent:FireServer("JoinCrew",CrewID) 


	end    
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("To Casino!") then

		game.ReplicatedStorage.MainEvent:FireServer("LeaveCrew")

		wait()

		noclip = false
		Block = false
		killtheplayer = false
		mimic = false
		vanish = false
		barragepos = false
		killnear = false
		barragepunch = false
		follow = false
		evolvefollow = false
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[StandOwner].Character.UpperTorso.Position) * CFrame.new(0,1,0)
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") then
			game.Players.LocalPlayer.Backpack:FindFirstChild("Combat").Parent = game.Players.LocalPlayer.Character
		end
		wait()
		game.Players.LocalPlayer.Character:FindFirstChild('Combat'):Activate()
		wait(5)

		repeat wait()
			if game.Players[StandOwner].Character.BodyEffects["K.O"].Value == true then

				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[StandOwner].Character.UpperTorso.Position) * CFrame.new(0,1,0)
				wait(.4)
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing")
				wait(.4)
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1001.9741210938, 80.306343078613, -230.61473083496)
				wait(1.5)
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing")

			end

			if game.Players[StandOwner].Character.BodyEffects["K.O"].Value == false then

				noclip = true
				follow = true
			end
		until game.Players[StandOwner].Character.BodyEffects["K.O"].Value == false	

		wait()

		game.ReplicatedStorage.MainEvent:FireServer("JoinCrew",CrewID) 


	end    
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("To Ufo!") then

		game.ReplicatedStorage.MainEvent:FireServer("LeaveCrew")

		wait()

		noclip = false
		killtheplayer = false
		Block = false
		mimic = false
		vanish = false
		barragepos = false
		killnear = false
		barragepunch = false
		follow = false
		evolvefollow = false
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[StandOwner].Character.UpperTorso.Position) * CFrame.new(0,1,0)
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") then
			game.Players.LocalPlayer.Backpack:FindFirstChild("Combat").Parent = game.Players.LocalPlayer.Character
		end
		wait()
		game.Players.LocalPlayer.Character:FindFirstChild('Combat'):Activate()
		wait(5) 

		repeat wait()
			if game.Players[StandOwner].Character.BodyEffects["K.O"].Value == true then

				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[StandOwner].Character.UpperTorso.Position) * CFrame.new(0,1,0)
				wait(.4)
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing")
				wait(.4)
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(69.059066772461, 139, -688.31414794922)
				wait(1.5)
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing")

			end

			if game.Players[StandOwner].Character.BodyEffects["K.O"].Value == false then

				noclip = true
				follow = true
			end
		until game.Players[StandOwner].Character.BodyEffects["K.O"].Value == false	

		wait()

		game.ReplicatedStorage.MainEvent:FireServer("JoinCrew",CrewID) 


	end    
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("To Park!") then

		game.ReplicatedStorage.MainEvent:FireServer("LeaveCrew")

		wait()

		noclip = false
		killtheplayer = false
		Block = false
		mimic = false
		vanish = false
		barragepos = false
		killnear = false
		barragepunch = false
		follow = false
		evolvefollow = false
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[StandOwner].Character.UpperTorso.Position) * CFrame.new(0,1,0)
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") then
			game.Players.LocalPlayer.Backpack:FindFirstChild("Combat").Parent = game.Players.LocalPlayer.Character
		end
		wait()
		game.Players.LocalPlayer.Character:FindFirstChild('Combat'):Activate()
		wait(5)

		repeat wait()
			if game.Players[StandOwner].Character.BodyEffects["K.O"].Value == true then

				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[StandOwner].Character.UpperTorso.Position) * CFrame.new(0,1,0)
				wait(.4)
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing")
				wait(.4)
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(109.26601409912, 21.880002975464, -806.00689697266)
				wait(1.5)
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing")

			end

			if game.Players[StandOwner].Character.BodyEffects["K.O"].Value == false then

				noclip = true
				follow = true
			end
		until game.Players[StandOwner].Character.BodyEffects["K.O"].Value == false	

		wait()

		game.ReplicatedStorage.MainEvent:FireServer("JoinCrew",CrewID) 


	end    
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("To School!") then

		game.ReplicatedStorage.MainEvent:FireServer("LeaveCrew")

		wait()

		noclip = false
		Block = false
		mimic = false
		vanish = false
		barragepos = false
		killtheplayer = false
		killnear = false
		barragepunch = false
		follow = false
		evolvefollow = false
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[StandOwner].Character.UpperTorso.Position) * CFrame.new(0,1,0)
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") then
			game.Players.LocalPlayer.Backpack:FindFirstChild("Combat").Parent = game.Players.LocalPlayer.Character
		end
		wait()
		game.Players.LocalPlayer.Character:FindFirstChild('Combat'):Activate()
		wait(5)

		repeat wait()
			if game.Players[StandOwner].Character.BodyEffects["K.O"].Value == true then

				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[StandOwner].Character.UpperTorso.Position) * CFrame.new(0,1,0)
				wait(.4)
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing")
				wait(.4)
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-586.56262207031, 68.625, 326.88354492188)
				wait(1.5)
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing")

			end

			if game.Players[StandOwner].Character.BodyEffects["K.O"].Value == false then

				noclip = true
				follow = true
			end
		until game.Players[StandOwner].Character.BodyEffects["K.O"].Value == false	

		wait()

		game.ReplicatedStorage.MainEvent:FireServer("JoinCrew",CrewID) 


	end    
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Sky!") then

		follow = false
		barragepos = false
		barragepunch = false
		killtheplayer = false
		evolvefollow = false
		aura = false
		killnear = false
		mimic = false
		vanish = false
		killed = false
		bring = false
		Block = false
		mimicpunch = false
		follow = false
		wait(.6)
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[StandOwner].Character.HumanoidRootPart.CFrame * CFrame.new(0, 100, 0)
		wait(.6)
		game.ReplicatedStorage.MainEvent:FireServer("Grabbing")
		wait(.4)
		follow = true

	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Jail!") then

		follow = false
		barragepos = false
		barragepunch = false
		evolvefollow = false
		aura = false
		killnear = false
		mimic = false
		vanish = false
		killed = false
		bring = false
		Block = false
		killtheplayer = false
		mimicpunch = false
		follow = false
		wait(.6)
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-798.12994384766, -39.649200439453, -841.04211425781)
		wait(.6)
		game.ReplicatedStorage.MainEvent:FireServer("Grabbing")
		wait(.4)
		follow = true

	end    
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Void!") then

		follow = false
		barragepos = false
		barragepunch = false
		evolvefollow = false
		aura = false
		killnear = false
		mimic = false
		vanish = false
		killed = false
		killtheplayer = false
		bring = false
		Block = false
		mimicpunch = false
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-879.11431884766, -417.69311523438, -983.22149658203)
		wait(1)
		game.ReplicatedStorage.MainEvent:FireServer("Grabbing")
		wait(1)
		follow = true

	end    
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Nobarrage!") then
		StopAudio()
		wait()
		if Sounds == "On" then
			play(6603004272, true, true)
		end
		barragepos = false
		barragepunch = false
		follow = true
		noclip = true

	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Requiem!") then

		local A_1 = "This is requiem.." local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 

		wait(2.5)

		local player = game.Players.LocalPlayer

		local function DeleteChar()
			for i,v in pairs(player.Character:GetChildren()) do
				if v:IsA('MeshPart') or v:IsA('Part') or v:IsA('Accessory') then
					v:Destroy()
				end
			end
		end

		DeleteChar()
		local newCharacter =  game.Workspace:WaitForChild(player.Name)
		local spoofFolder = Instance.new('Folder');
		spoofFolder.Name = 'FULLY_LOADED_CHAR';
		spoofFolder.Parent = newCharacter;
		newCharacter:WaitForChild('RagdollConstraints'):Destroy();
		local spoofValue = Instance.new('BoolValue', newCharacter);
		spoofValue.Name = 'RagdollConstraints';            

		--god bullet
		local armor = game.Players.LocalPlayer.Character.BodyEffects.Armor
		local clone = game.Players.LocalPlayer.Character.BodyEffects.Armor:Clone()
		clone:Clone()
		clone.Parent = game.Players.LocalPlayer.Character.BodyEffects
		armor:Destroy()
		--end


		--god block
		local defense = game.Players.LocalPlayer.Character.BodyEffects.Defense
		local clone1 = game.Players.LocalPlayer.Character.BodyEffects.Defense:Clone()
		clone1:Clone()
		clone1.Parent = game.Players.LocalPlayer.Character.BodyEffects
		defense:Destroy()
		--end




		repeat wait() 
			local A_1 = "Block"
			local A_2 = "True"
			local Event = game:GetService("ReplicatedStorage").MainEvent
			Event:FireServer(A_1,A_2)

			for _,v in pairs(player.Character:FindFirstChildWhichIsA('Humanoid'):GetPlayingAnimationTracks()) do
				if v.Name == 'Block' then
					v:Stop()
				end
			end    
		until block == false or game.Players.LocalPlayer.PlayerGui.MainScreenGui.AmmoFrame.Visible == true

		while wait() do
			pcall(function()
				if game.Players.LocalPlayer.PlayerGui.MainScreenGui.AmmoFrame.Visible == true then
					block = false
				else
					if game.Players.LocalPlayer.PlayerGui.MainScreenGui.AmmoFrame.Visible == false then
						block = true
					end
				end
			end)
		end

	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Attack!") then
		follow = false
		noclip = false
		killnear = true
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("Unattack!") then
		killnear = false
		follow = true
		noclip = true
	end
end)

game.Players[StandOwner].Chatted:Connect(function(msg)
	if msg == ("/e msg") then

		local A_1 = "" ..Msg.. "" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 

	end
end)

--[[

game.Players[StandOwner].Chatted:Connect(function(msg)
    if msg == ("") then
    
    end
end)

]]



game:GetService('RunService').Stepped:connect(function()
	if follow == true and Pos == "Right" then
		hoveranim:Play()
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[StandOwner].Character.HumanoidRootPart.CFrame * CFrame.new(2, 5, 2.5)
	elseif follow == true and Pos == "Left" then
		hoveranim:Play()
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[StandOwner].Character.HumanoidRootPart.CFrame * CFrame.new(-2, 5, 2.5)
	elseif follow == true and Pos == "Back" then
		hoveranim:Play()
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[StandOwner].Character.HumanoidRootPart.CFrame * CFrame.new(.6, 2, 3)
	end
end)

while vanish == true do
	game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-374.04702758789, 427.14468383789, -263.02795410156) wait()
	game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-235.09289550781, 427.14468383789, -326.25317382812) wait()
	game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-433.60748291016, 427.13568115234, -180.2112121582) wait()
	game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-351.47393798828, 427.11862182617, -182.98684692383) wait()
	game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-349.13708496094, 369.23416137695, -232.91188049316) wait()
	game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-255.47518920898, 326.90557861328, -307.60479736328) wait()
	game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-408.70520019531, 387.16589355469, -332.86459350586) wait()
end

game:GetService('RunService').Stepped:connect(function()
	if mimic == true then
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[StandOwner].Character.HumanoidRootPart.CFrame * CFrame.new(0, 5.2, -4)
	end
end)

game:GetService('RunService').Stepped:connect(function()
	if barragepos == true then
		plr.Character.HumanoidRootPart.CFrame = game.Players[StandOwner].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -8)
	end
end)

game:GetService('RunService').Stepped:connect(function()
	if evolvefollow == true then
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[StandOwner].Character.HumanoidRootPart.CFrame * CFrame.new(0, 6.2, 5)
	end
end)

game:GetService('RunService').Stepped:connect(function()
	if bind == true then
		local LocalPlayer = game:GetService("Players").LocalPlayer
		local char = LocalPlayer.Character
		if game.Players.LocalPlayer.Character.Humanoid.Health <= 5 then
			game.Players.LocalPlayer.Character.Head:Destroy()
			game.Players.LocalPlayer.Character.RightHand:Destroy()
			game.Players.LocalPlayer.Character.LeftHand:Destroy()
			game.Players.LocalPlayer.Character.LowerTorso:Destroy()
			game.Players.LocalPlayer.Character.UpperTorso:Destroy()
			game.Players.LocalPlayer.Character.LeftLowerLeg:Destroy()
			game.Players.LocalPlayer.Character.RightLowerLeg:Destroy()
			game.Players.LocalPlayer.Character.RightFoot:Destroy()
			game.Players.LocalPlayer.Character.LeftFoot:Destroy()
			game.Players.LocalPlayer.Character.LeftUpperLeg:Destroy()
			game.Players.LocalPlayer.Character.RightUpperLeg:Destroy()
			game.Players.LocalPlayer.Character.RightUpperArm:Destroy()
			game.Players.LocalPlayer.Character.RightLowerArm:Destroy()
			game.Players.LocalPlayer.Character.LeftLowerArm:Destroy()
			game.Players.LocalPlayer.Character.LeftUpperArm:Destroy()
		end
	end
end)

game:GetService('RunService').Stepped:connect(function()
	if killnear == true then
		follow = false
		noclip = false

		local target = GetNearest()
		if target then
			local targetchar = target.Character
			if targetchar.BodyEffects['K.O'].Value == false then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetchar.HumanoidRootPart.CFrame
				Hit()
			end
		else
			follow = true
			noclip = true
		end
	end
end)

game:GetService('RunService').Stepped:connect(function()
	if oranear == true then
		follow = false
		noclip = false
		autostomp = true

		local target = GetNearest2()
		if target then
			local targetchar = target.Character
			if targetchar.BodyEffects['K.O'].Value == true then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetchar.UpperTorso.Position) + Vector3.new(0,2,0)
			end
		else
			follow = true
			noclip = true
			autostomp = false
		end
	end
end)

game:GetService('RunService').Stepped:connect(function()
	if autostomp == true then
		game.ReplicatedStorage.MainEvent:FireServer("Stomp")
	end
end)

--noclip
game:GetService('RunService').Stepped:connect(function()
	if noclip == true then
		if SynapseMode == "On" then
			_G.noclipsyn = true
		end
		e.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.4 , 0)
		for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
	else
		if SynapseMode == "On" then
			_G.noclipsyn = false
		end
		for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = true
			end
		end
		e.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, -30 , 0)
	end
end)
--end


game.Players.LocalPlayer.CharacterAdded:connect(function()
	follow = false
	noclip = false
	game.Players.LocalPlayer.Character:WaitForChild("FULLY_LOADED_CHAR")
	wait(1)
	local hover = Instance.new("Animation", game.Workspace)
	hover.Name = "Hover"
	hover.AnimationId = "rbxassetid://3541114300"
	local char = game.Players.LocalPlayer.Character
	hoveranim = char.Humanoid:LoadAnimation(game.Workspace.Hover)
	hoveranim:Play()

	wait()


	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()

	local plr = game.Players.LocalPlayer
	plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Surgeon Mask] - $25"].Head.CFrame
	wait(.3)
	fireclickdetector(game.Workspace.Ignored.Shop["[Surgeon Mask] - $25"].ClickDetector)
	wait(.3)
	if game.Players.LocalPlayer.Backpack:FindFirstChild("Mask") then
		game.Players.LocalPlayer.Backpack:FindFirstChild("Mask").Parent = game.Players.LocalPlayer.Character
	end
	wait(.2)
	game:GetService("VirtualUser"):ClickButton1(Vector2.new())
	wait()
	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
	wait(.2)
	follow = true
	noclip = true
	wait(.3)
	for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
		if v.Name == "In-gameMask" then 
			v.Handle:Destroy()
		end
	end

	wait()

	follow = true
	wait()
	noclip = true

	if noface == "On" then
		if game.Players.LocalPlayer.Character.Head:FindFirstChild("face") then
			game.Players.LocalPlayer.Character.Head.face:Destroy()
		elseif not game.Players.LocalPlayer.Character.Head:FindFirstChild("face") then
			print("Already has no face!")
		end
	end
end)

game.Players.PlayerRemoving:Connect(function(plr)
	if plr.Name == StandOwner then
		follow = false
		barragepos = false
		barragepunch = false
		evolvefollow = false
		noclip = false
		aura = false
		killnear = false
		mimic = false
		vanish = false
		killed = false
		bring = false
		Block = false
		mimicpunch = false
		game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		hoveranim:Stop()
		StopAudio()
	end
end)

local owner = {
	3124365579, -- Icxy
	3288356328, -- Icxy
	3288363591, -- Icxy
	3288372849, -- Icxy
	3288377018, -- Icxy
	3288385592, -- Icxy
	3288391126, -- Icxy
	3288396145, -- Icxy
	1577712947, -- Icxy
	1610372409, -- Icxy
	1608284382, -- KillerHood
}

local plrs = game:GetService("Players")
local cc = game:GetService('Workspace').Players


while wait() do
	pcall(function()
		for _,Player in pairs(game:GetService('Players'):GetChildren()) do
			if table.find(owner, Player.UserId) then
				if Player.Character then
					if Player.Character.Parent.Name == 'Players' then
						if not Player.Character.UpperTorso:FindFirstChild('OriginalSize') then
							Player.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[👑]' .. Player.DisplayName)
						end
					end
				end
			end
		end
	end) 
end
