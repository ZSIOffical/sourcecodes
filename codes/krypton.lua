---------------------------
--UI Config, Tabs Etc
---------------------------

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/MrDawny/rblx/main/9"))()

local Window = Library:Create("Krypton","❄ Happy Christmas")

local TabM = Window:Tab("MAIN",true) -- done
local TabDU = Window:Tab("DUPING",false) -- done
local TabS = Window:Tab("SELLING",false) -- done
local TabC = Window:Tab("CRASH",false) -- done
local TabT = Window:Tab("TELEPORT",false) -- done
local TabF = Window:Tab("FPS LOCKER",false) -- done
local TabAU = Window:Tab("AUTOBUY",false) -- done
local TabA = Window:Tab("ANIMATION",false)
local TabE = Window:Tab("EXTRA",false) -- done
local TabCR = Window:Tab("CREDITS",false) -- done
local TabSE = Window:Tab("FFFF",false)
---------------------------------------------
--Main Tab
----------------------------------------------
TabM:Label("Main")
TabM:Button("Fly [X]",function()
    local plr = game.Players.LocalPlayer
    local mouse = plr:GetMouse()
     
            localplayer = plr
           
            if workspace:FindFirstChild("Core") then
                workspace.Core:Destroy()
            end
           
            local Core = Instance.new("Part")
            Core.Name = "Core"
            Core.Size = Vector3.new(0.05, 0.05, 0.05)
     
            spawn(function()
                Core.Parent = workspace
                local Weld = Instance.new("Weld", Core)
                Weld.Part0 = Core
                Weld.Part1 = localplayer.Character.LowerTorso
                Weld.C0 = CFrame.new(0, 0, 0)
            end)
           
            workspace:WaitForChild("Core")
           
            local torso = workspace.Core
            flying = true
            local speed=50
            local keys={a=false,d=false,w=false,s=false}
            local e1
            local e2
            local function start()
                local pos = Instance.new("BodyPosition",torso)
                local gyro = Instance.new("BodyGyro",torso)
                pos.Name="EPIXPOS"
                pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
                pos.position = torso.Position
                gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                gyro.cframe = torso.CFrame
                repeat
                    wait()
                    localplayer.Character.Humanoid.PlatformStand=true
                    local new=gyro.cframe - gyro.cframe.p + pos.position
                    if not keys.w and not keys.s and not keys.a and not keys.d then
                        speed=21
                    end
                    if keys.w then
                        new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                        speed=speed+0
                    end
                    if keys.s then
                        new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                        speed=speed+0
                    end
                    if keys.d then
                        new = new * CFrame.new(speed,0,0)
                        speed=speed+0
                    end
                    if keys.a then
                        new = new * CFrame.new(-speed,0,0)
                        speed=speed+0
                    end
                    if speed>25 then
                        speed=5
                    end
                    pos.position=new.p
                    if keys.w then
                        gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*0),0,0)
                    elseif keys.s then
                        gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*0),0,0)
                    else
                        gyro.cframe = workspace.CurrentCamera.CoordinateFrame
                    end
                until flying == false
                if gyro then gyro:Destroy() end
                if pos then pos:Destroy() end
                flying=false
                localplayer.Character.Humanoid.PlatformStand=false
                speed=25
            end
            e1=mouse.KeyDown:connect(function(key)
                if not torso or not torso.Parent then flying=false e1:disconnect() e2:disconnect() return end
                if key=="w" then
                    keys.w=true
                elseif key=="s" then
                    keys.s=true
                elseif key=="a" then
                    keys.a=true
                elseif key=="d" then
                    keys.d=true
                elseif key=="x" then
                    if flying==true then
                        flying=false
                    else
                        flying=true
                        start()
                    end
                end
            end)
            e2=mouse.KeyUp:connect(function(key)
                if key=="w" then
                    keys.w=false
                elseif key=="s" then
                    keys.s=false
                elseif key=="a" then
                    keys.a=false
                elseif key=="d" then
                    keys.d=false
                end
            end)
            start()
end)
TabM:Button("IY Fly [C]",function()
    repeat wait() 
    until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
    local mouse = game.Players.LocalPlayer:GetMouse() 
    repeat wait() until mouse
    local plr = game.Players.LocalPlayer 
    local torso = plr.Character.Head 
    local flying = false
    local deb = true 
    local ctrl = {f = 0, b = 0, l = 0, r = 0} 
    local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
    local maxspeed = 5000
    local speed = 5000 

    function Fly() 
        local bg = Instance.new("BodyGyro", torso) 
        bg.P = 9e4 
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
        bg.cframe = torso.CFrame 
        local bv = Instance.new("BodyVelocity", torso) 
        bv.velocity = Vector3.new(0,0.1,0) 
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
        repeat wait() 
            plr.Character.Humanoid.PlatformStand = true 
            if ctrl.l + ctrl.r ~= 100000 or ctrl.f + ctrl.b ~= 10000 then 
                speed = speed+.0+(speed/maxspeed) 
                if speed > maxspeed then 
                    speed = maxspeed 
                end 
            elseif not (ctrl.l + ctrl.r ~= 5 or ctrl.f + ctrl.b ~= 5) and speed ~= 5 then 
                speed = speed-5
                if speed > 5 then 
                    speed = -2 
                end 
            end 
            if (ctrl.l + ctrl.r) ~= 5 or (ctrl.f + ctrl.b) ~= 5 then 
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
            elseif (ctrl.l + ctrl.r) == 5 and (ctrl.f + ctrl.b) == 5 and speed ~= 5 then 
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
            else 
                bv.velocity = Vector3.new(0,0.1,0) 
            end 
            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
        until not flying 
        ctrl = {f = 0, b = 0, l = 0, r = 0} 
        lastctrl = {f = 0, b = 0, l = 0, r = 0} 
        speed = 5 
        bg:Destroy() 
        bv:Destroy() 
        plr.Character.Humanoid.PlatformStand = false 
    end 
    mouse.KeyDown:connect(function(key) 
        if key:lower() == "c" then 
            if flying then flying = false 
            else 
                flying = true 
                Fly() 
            end 
        elseif key:lower() == "w" then 
            ctrl.f = 45
        elseif key:lower() == "s" then 
            ctrl.b = -45 
        elseif key:lower() == "a" then 
            ctrl.l = -45 
        elseif key:lower() == "d" then 
            ctrl.r = 45
        end 
    end) 
    mouse.KeyUp:connect(function(key) 
        if key:lower() == "w" then 
            ctrl.f = 0
        elseif key:lower() == "s" then 
            ctrl.b = 0
        elseif key:lower() == "a" then 
            ctrl.l = 0
        elseif key:lower() == "d" then 
            ctrl.r = 0
        end 
    end)
    Fly()
end)
TabM:Button("Force Reset",function()
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA('MeshPart') or v:IsA('Part') or v:IsA('Accessory') then
            v:Destroy()
        end
    end
 game.Players.LocalPlayer.Character.Name = 'Deleted'
end)
TabM:Toggle("Reach",function(state)
	getgenv().reach = state
	while getgenv().reach do
	  if not getgenv().reach then break end
	  local success, err = pcall(function()
		if game.Players.LocalPlayer.Character.BodyEffects.Attacking.Value == true then
			for i,v in pairs(game:GetService('Players'):GetChildren()) do
				if (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.LeftHand.Position).Magnitude <= 50 then
					if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
						if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild('Handle') then
							firetouchinterest(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle, v.Character.UpperTorso, 0)
						else
							firetouchinterest(game.Players.LocalPlayer.Character['RightHand'], v.Character.UpperTorso, 0)
							firetouchinterest(game.Players.LocalPlayer.Character['LeftHand'], v.Character.UpperTorso, 0)
							firetouchinterest(game.Players.LocalPlayer.Character['RightFoot'], v.Character.UpperTorso, 0)
							firetouchinterest(game.Players.LocalPlayer.Character['LeftFoot'], v.Character.UpperTorso, 0)
							firetouchinterest(game.Players.LocalPlayer.Character['RightLowerLeg'], v.Character.UpperTorso, 0)
							firetouchinterest(game.Players.LocalPlayer.Character['LeftLowerLeg'], v.Character.UpperTorso, 0)
						end
					end
				end
			end
		end
	end)
task.wait()
	end
end)
TabM:Label("Aimlock")
TabM:Button("Aimlock [Hold Right Click]",function()
    local CC = game:GetService"Workspace".CurrentCamera
	local Plr
	local enabled = false
	local accomidationfactor = 0.165
	local mouse = game.Players.LocalPlayer:GetMouse()
	local placemarker = Instance.new("Part", game.Workspace)
	local guimain = Instance.new("Folder", game.CoreGui)

	function makemarker(Parent, Adornee, Color, Size, Size2)
		local e = Instance.new("BillboardGui", Parent)
		e.Name = "PP"
		e.Adornee = Adornee
		e.Size = UDim2.new(Size, Size2, Size, Size2)
		e.AlwaysOnTop = true
		local a = Instance.new("Frame", e)
		a.Size = UDim2.new(1, 0, 1, 0)
		a.BackgroundTransparency = 0.4
		a.BackgroundColor3 = Color
		local g = Instance.new("UICorner", a)
		g.CornerRadius = UDim.new(50, 50)
		return(e)
	end

	local data = game.Players:GetPlayers()
	function noob(player)
		local character
		repeat wait() until player.Character
		local handler = makemarker(guimain, player.Character:WaitForChild("Head"), Color3.fromRGB(255, 255, 255), 0.3, 3)
		handler.Name = player.Name
		player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild("Head") end)

		local TextLabel = Instance.new("TextLabel", handler)
		TextLabel.BackgroundTransparency = 1
		TextLabel.Position = UDim2.new(0, 0, 0, -50)
		TextLabel.Size = UDim2.new(0, 100, 0, 100)
		TextLabel.Font = Enum.Font.SourceSansSemibold
		TextLabel.TextSize = 14
		TextLabel.TextColor3 = Color3.new(1, 1, 1)
		TextLabel.TextStrokeTransparency = 0
		TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
		TextLabel.Text = "Name: "..player.Name
		TextLabel.ZIndex = 10


	end

	for i = 1, #data do
		if data[i] ~= game.Players.LocalPlayer then
			noob(data[i])
		end
	end

	game.Players.PlayerAdded:connect(function(Player)
		noob(Player)
	end)

	spawn(function()
		placemarker.Anchored = true
		placemarker.CanCollide = false
		placemarker.Size = Vector3.new(0.1, 0.1, 0.1)
		placemarker.Transparency = 1
		makemarker(placemarker, placemarker, Color3.fromRGB(0, 0, 255), 0.15, 0)
	end)    

	local UserInputService = game:GetService"UserInputService"

	UserInputService.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			enabled = true 
			Plr = getClosestPlayerToCursor()
			guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			enabled = false
			guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		end
	end)

	function getClosestPlayerToCursor()
		local closestPlayer
		local shortestDistance = math.huge

		for i, v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("Head") then
				local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
				local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
				if magnitude < shortestDistance then
					closestPlayer = v
					shortestDistance = magnitude
				end
			end
		end
		return closestPlayer
	end

	game:GetService"RunService".Stepped:connect(function()
		if enabled and Plr.Character and Plr.Character:FindFirstChild("Head") then
			placemarker.CFrame = CFrame.new(Plr.Character.Head.Position+(Plr.Character.Head.Velocity*accomidationfactor))
		else
			placemarker.CFrame = CFrame.new(0, 9999, 0)
		end
	end)

	local mt = getrawmetatable(game)
	local old = mt.__namecall
	setreadonly(mt, false)
	mt.__namecall = newcclosure(function(...)
		local args = {...}
		if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
			args[3] = Plr.Character.Head.Position+(Plr.Character.Head.Velocity*accomidationfactor)
			return old(unpack(args))
		end
		return old(...)
	end)
	game.StarterGui:SetCore('SendNotification', {
		Title = 'Krypton',
		Text = 'Krypton Aimlock : Enabled',
		Icon = 'http://www.roblox.com/asset/?id=7736781940'
	})
end)
TabM:Button("Silent Aim",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tayodevelup/imsoniac/main/silentaim", true))()
	game.StarterGui:SetCore('SendNotification', {
		Title = 'Krypton',
		Text = 'Krypton Silent Aim : Enabled',
		Icon = 'http://www.roblox.com/asset/?id=7736781940'
	})
end)
TabM:Label("God")
TabM:Button("God [Meele]", function()
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA('MeshPart') or v:IsA('Part') or v:IsA('Accessory') then
            v:Destroy()
        end
    end
    game.Players.LocalPlayer.Character.Name = 'Deleted'
    local localPlayer = game:GetService('Players').LocalPlayer;
    local localCharacter = localPlayer.Character;
    localCharacter:FindFirstChildOfClass('Humanoid').Health = 0;
    local newCharacter = localPlayer.CharacterAdded:Wait();
    local spoofFolder = Instance.new('Folder');
    spoofFolder.Name = 'FULLY_LOADED_CHAR';
    spoofFolder.Parent = newCharacter;
    newCharacter:WaitForChild('BodyEffects').Dead:Destroy();
    local spoofValue = Instance.new('BoolValue', newCharacter.BodyEffects);
    spoofValue.Name = 'Dead';
    wait()
    --godblock/godbullet
    local ps = game:GetService("Players")
    local lp = ps.LocalPlayer
    local char = lp.Character

    char.BodyEffects.Armor:Destroy()
    char.BodyEffects.Defense:Destroy()

    local Clone1 = Instance.new("IntValue")
    Clone1.Name = "Armor"
    Clone1.Parent = char.BodyEffects

    local Clone2 = Instance.new("NumberValue")
    Clone2.Name = "Defense"
    Clone2.Parent = char.BodyEffects
    wait()
    --walspeed
    local d = {}
    local e = {}
    local g = {}
    local h = {}
    local j = {}
    local k = {}
    local function l()
        local m = 3
        local n = checkcaller
        local o = getrawmetatable(game)
        setreadonly(o, false)
        local p = o.__index
        local q = o.__newindex
        local r = o.__namecall
        o.__index =
            newcclosure(
                function(s, t)
                if n() then
                    return p(s, t)
                end
                if d[s] and d[s][t] then
                    local u = d[s][t]
                    if u["IsCallback"] == true then
                        return u["Value"](s)
                    else
                        return u["Value"]
                    end
                end
                if g[t] then
                    local v = g[t]
                    if v["IsCallback"] == true then
                        return v["Value"](s)
                    else
                        return v["Value"]
                    end
                end
                if j[s] and j[s][t] then
                    return k[s][t]
                end
                return p(s, t)
            end
            )
        o.__newindex =
            newcclosure(
                function(w, x, y)
                if n() then
                    return q(w, x, y)
                end
                if e[w] and e[w][x] then
                    local z = e[w][x]
                    if z["Callback"] == nil then
                        return
                    else
                        z["Callback"](w, y)
                        return
                    end
                end
                if h[x] then
                    local A = h[x]
                    if A["Callback"] == nil then
                        return
                    else
                        A["Callback"](w, y)
                        return
                    end
                end
                if j[w] and j[w][x] then
                    local B = j[w][x]
                    if type(y) ~= B["Type"] then
                        error("bad argument #3 to '" .. x .. "' (" .. B["Type"] .. " expected, got " .. type(x) .. ")")
                    end
                    k[w][x] = y
                    return
                end
                return q(w, x, y)
            end
            )
        local D = game.Players.LocalPlayer.Character.Humanoid
        local function A(_)
            local a0 = p(D, _)
            local a1 = type(a0)
            if not j[D] then
                j[D] = {}
            end
            if not k[D] then
                k[D] = {}
            end
            j[D][_] = {Type = a1}
            k[D][_] = p(D, _)
            local a2 = function()
                j[D][_] = nil
                k[D][_] = nil
            end
            return {remove = a2, Remove = a2}
        end
        A("WalkSpeed")
        A("JumpPower")
    end
    l()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 22
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    wait()
    while wait() do
        game.ReplicatedStorage.MainEvent:FireServer("Block", true)
        wait()
        for _, v in next, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks() do
            if (v.Animation.AnimationId:match("rbxassetid://2788354405")) then
                v:Stop();
            end;
        end;
    end
    wait()
    while wait() do
        pcall(function()
            for i, v in pairs(game.Players:GetPlayers()) do
                if (workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude < 1 then
                    game.ReplicatedStorage.MainEvent:FireServer("Block", true)
                end
            end
        end)
    end
end)
TabM:Button("God [Guns]", function()
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA('MeshPart') or v:IsA('Part') or v:IsA('Accessory') then
            v:Destroy()
        end
    end
    game.Players.LocalPlayer.Character.Name = 'Deleted'
    local localPlayer = game:GetService('Players').LocalPlayer;
    local localCharacter = localPlayer.Character;
    localCharacter:FindFirstChildOfClass('Humanoid').Health = 0;
    local newCharacter = localPlayer.CharacterAdded:Wait();
    local spoofFolder = Instance.new('Folder');
    spoofFolder.Name = 'FULLY_LOADED_CHAR';
    spoofFolder.Parent = newCharacter;
    newCharacter:WaitForChild('RagdollConstraints'):Destroy();
    local spoofValue = Instance.new('BoolValue', newCharacter);
    spoofValue.Name = 'RagdollConstraints';
    local name = game.Players.LocalPlayer.Name
    local lol =    game.Workspace:WaitForChild(name)
    local money = Instance.new("Folder",game.Players.LocalPlayer.Character);money.Name = "FULLY_LOADED_CHAR"
    lol.Parent = game.Workspace.Players
    game.Players.LocalPlayer.Character:WaitForChild("BodyEffects")
    game.Players.LocalPlayer.Character.BodyEffects.BreakingParts:Destroy()
end)
TabM:Button("God Block",function()
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA('MeshPart') or v:IsA('Part') or v:IsA('Accessory') then
            v:Destroy()
        end
    end
    game.Players.LocalPlayer.Character.Name = 'Deleted'
    local localPlayer = game:GetService('Players').LocalPlayer;
                local localCharacter = localPlayer.Character;
                localCharacter:FindFirstChildOfClass('Humanoid').Health = 0;
                local newCharacter = localPlayer.CharacterAdded:Wait();
                local spoofFolder = Instance.new('Folder');
                spoofFolder.Name = 'FULLY_LOADED_CHAR';
                spoofFolder.Parent = newCharacter;
                newCharacter:WaitForChild('RagdollConstraints'):Destroy();
                local spoofValue = Instance.new('BoolValue', newCharacter);
                spoofValue.Name = 'RagdollConstraints';
                wait()
                --godblock/godbullet
                local ps = game:GetService("Players")
                local lp = ps.LocalPlayer
                local char = lp.Character

                char.BodyEffects.Armor:Destroy()
                char.BodyEffects.Defense:Destroy()

                local Clone1 = Instance.new("IntValue")
                Clone1.Name = "Armor"
                Clone1.Parent = char.BodyEffects

                local Clone2 = Instance.new("NumberValue")
                Clone2.Name = "Defense"
                Clone2.Parent = char.BodyEffects
end)
-----------------------------------------------
--Duping Tab
------------------------------------------------
TabDU:Label("Duping")
TabDU:Button("Anti AFK",function()
    local virtualUser = game:GetService('VirtualUser')
    virtualUser:CaptureController()
    spawn(function()
        while true do
            wait()
            virtualUser:SetKeyDown('0x1f')
            wait(2)
            virtualUser:SetKeyUp('0x1f')
            wait()
        end
    end)
    spawn(function()
        game.StarterGui:SetCore('SendNotification', {
            Title = 'Anti Afk',
            Text = 'Status: ON',
        })
    end)
end)
TabDU:Button("Tp to safe place",function(state)
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(121.081863, 100.857979, 200148.313, 0.636928439, -3.65418344e-08, -0.770922959, 2.71614837e-08, 1, -2.49595793e-08, 0.770922959, -5.0419442e-09, 0.636928439)
end)
TabDU:Toggle("Auto Drop",function(state)
    getgenv().drop_money = state
    while getgenv().drop_money do
      if not getgenv().drop_money then break end
      game:GetService("ReplicatedStorage").MainEvent:FireServer("DropMoney", "10000")
      task.wait()
    end
end)
TabDU:Toggle("Auto Pickup cash",function(state)
    getgenv().money_test = state
    local RenderConnection
    RenderConnection = game:GetService"RunService".RenderStepped:Connect(function(deltaTime)
        if getgenv().money_test == false or not getgenv().money_test then RenderConnection:Disconnect() end
        for _, v in pairs(Workspace.Ignored.Drop:GetChildren()) do
            if v.Name == "MoneyDrop" then
                local MoneyMagnitude = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                if MoneyMagnitude < 25 then
                    fireclickdetector(v.ClickDetector)
                end 
            end
        end
    end)
end)

------------------------------------------------
--Selling Tab
------------------------------------------------
TabS:Label("Seller Tools")

TabS:Button("Anti AFK",function()
    local virtualUser = game:GetService('VirtualUser')
    virtualUser:CaptureController()
    spawn(function()
        while true do
            wait()
            virtualUser:SetKeyDown('0x1f')
            wait(2)
            virtualUser:SetKeyUp('0x1f')
            wait()
        end
    end)
    spawn(function()
        game.StarterGui:SetCore('SendNotification', {
            Title = 'Anti Afk',
            Text = 'Status: ON',
        })
    end)
end)
TabS:Button("Cash Counter",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PostHooking/zerosdahoodstuff/main/Zero%27s%20dh%20scripts%5B2%5D.txt"))()
end)
TabS:Label("Seller Toggles")
TabS:Toggle("Auto Drop",function(AutoDrop)
AutoDrop = false
    if AutoDrop == false then
        AutoDrop = true
        local Loop
        local loopFunction = function()
            local DropAm = 10000
            if player.DataFolder.Currency.Value > 10000 then
                DropAm = '10000'
            else
                DropAm = tostring(player.DataFolder.Currency.Value)
            end
            local args = {
                'DropMoney',
                DropAm
            }
            MainEvent:FireServer(unpack(args))
        end;
        local Start = function()
            Loop = game:GetService("RunService").Heartbeat:Connect(loopFunction);
        end;
        local Pause = function()
            Loop:Disconnect()
        end;
        Start()    
        repeat wait() until AutoDrop == false
        Pause()
    else
        AutoDrop = false
end
end)
TabS:Toggle("Cash Aura",function(state)
    getgenv().money_test = state
    local RenderConnection
    RenderConnection = game:GetService"RunService".RenderStepped:Connect(function(deltaTime)
        if getgenv().money_test == false or not getgenv().money_test then RenderConnection:Disconnect() end
        for _, v in pairs(Workspace.Ignored.Drop:GetChildren()) do
            if v.Name == "MoneyDrop" then
                local MoneyMagnitude = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                if MoneyMagnitude < 25 then
                    fireclickdetector(v.ClickDetector)
                end 
            end
        end
    end)
end)
TabS:Toggle("Anti Lag",function(state)
    getgenv().Get_Anti = state
    while getgenv().Get_Anti do
        if not getgenv().Get_Anti then
            break
        end
    for i, v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
            if v.Name == "MoneyDrop" then
                v:Destroy()
            end
    task.wait()
    end
        end
end)
----------------------------------------------------------------
--Crash Tab
----------------------------------------------------------------
TabC:Label("Crash")
TabC:Button("Crash",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SuperCustomServerCrasher'))()
end)
----------------------------------------------------------------
--Teleport Tab
----------------------------------------------------------------
TabT:Label("Teleports")
TabT:Button("Save Position",function()
    _G.savedhumanoidpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
end)
TabT:Button("Load Position",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(_G.savedhumanoidpos)
end)
TabT:Button("Bank",function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-485.668, 23.631, -285.169)
end)
TabT:Button("Admin Base",function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-870.711426, -38.4012032, -595.739624, -0.999998868, -2.49359244e-09, -0.00150787167, -2.60957633e-09, 1, 7.69169333e-08, 0.00150787167, 7.69207773e-08, -0.999998868)
end)
TabT:Button("Safe Zone #1",function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-117.270287, -58.7000618, 146.536087, 0.999873519, 5.21876942e-08, -0.0159031227, -5.22713037e-08, 1, -4.84179008e-09, 0.0159031227, 5.67245495e-09, 0.999873519)
end)

TabT:Button("Safe Zone #2",function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(207.48085, 38.25, 200014.953, 0.507315397, 0, -0.861760437, 0, 1, 0, 0.861760437, 0, 0.507315397)
end)
--------------------------------------------------------------
--Fps Tab
---------------------------------------------------------------
TabF:Label("FPS Locker")
TabF:Button("1 Fps", function()
setfpscap(1)
end)
TabF:Button("5 Fps", function()
setfpscap(5)
end)
TabF:Button("15 Fps", function()
setfpscap(15)
end)
TabF:Button("30 Fps", function()
setfpscap(30)
end)
TabF:Button("60 Fps", function()
setfpscap(60)
end)
TabF:Button("120 Fps", function()
setfpscap(120)
end)
TabF:Button("Unlimited Fps", function()
setfpscap(999)
end)
--------------------------------------------------------------------
--Autobuy Tab
--------------------------------------------------------------------
TabAU:Label("Guns")
TabAU:Button("Double Barrel",function()
    _G.savedhumanoidpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Workspace.Ignored.Shop["[Double-Barrel SG] - $1400"].Head.CFrame
    wait(0.2)
    fireclickdetector(game.Workspace.Ignored.Shop["[Double-Barrel SG] - $1400"].ClickDetector)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(_G.savedhumanoidpos)
    
end)

TabAU:Button("Double Barrel Ammo",function()
    _G.savedhumanoidpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Workspace.Ignored.Shop["18 [Double-Barrel SG Ammo] - $60"].Head.CFrame
    wait(0.2)
    fireclickdetector(game.Workspace.Ignored.Shop["18 [Double-Barrel SG Ammo] - $60"].ClickDetector)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(_G.savedhumanoidpos)
    
end)

TabAU:Button("Revolver",function()
    _G.savedhumanoidpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Workspace.Ignored.Shop["[Revolver] - $1300"].Head.CFrame
    wait(0.2)
    fireclickdetector(game.Workspace.Ignored.Shop["[Revolver] - $1300"].ClickDetector)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(_G.savedhumanoidpos)
    
end)

TabAU:Button("Revolver Ammo",function()
    _G.savedhumanoidpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Workspace.Ignored.Shop["12 [Revolver Ammo] - $75"].Head.CFrame
    wait(0.2)
    fireclickdetector(game.Workspace.Ignored.Shop["12 [Revolver Ammo] - $75"].ClickDetector)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(_G.savedhumanoidpos)
    
end)

TabAU:Button("AK47",function()
    _G.savedhumanoidpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Workspace.Ignored.Shop["[AK47] - $2250"].Head.CFrame
    wait(0.2)
    fireclickdetector(game.Workspace.Ignored.Shop["[AK47] - $2250"].ClickDetector)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(_G.savedhumanoidpos)
    
end)

TabAU:Button("AK47 Ammo",function()
    _G.savedhumanoidpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Workspace.Ignored.Shop["90 [AK47 Ammo] - $80"].Head.CFrame
    wait(0.2)
    fireclickdetector(game.Workspace.Ignored.Shop["90 [AK47 Ammo] - $80"].ClickDetector)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(_G.savedhumanoidpos)
    
end)

TabAU:Label("Armor")
TabAU:Button("High Medium Armor",function()
    _G.savedhumanoidpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Workspace.Ignored.Shop["[High-Medium Armor] - $2300"].Head.CFrame
    wait(0.2)
    fireclickdetector(game.Workspace.Ignored.Shop["[High-Medium Armor] - $2300"].ClickDetector)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(_G.savedhumanoidpos)
end)

TabAU:Button("Medium Armor",function()
    _G.savedhumanoidpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Workspace.Ignored.Shop["[Medium Armor] - $1600"].Head.CFrame
    wait(0.2)
    fireclickdetector(game.Workspace.Ignored.Shop["[Medium Armor] - $1600"].ClickDetector)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(_G.savedhumanoidpos)
end)

TabAU:Label("Meele")
TabAU:Button("Pencil",function()
    _G.savedhumanoidpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Workspace.Ignored.Shop["[Pencil] - $175"].Head.CFrame
    wait(0.2)
    fireclickdetector(game.Workspace.Ignored.Shop["[Pencil] - $175"].ClickDetector)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(_G.savedhumanoidpos)
end)

TabAU:Button("Knife",function()
    _G.savedhumanoidpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Workspace.Ignored.Shop["[Knife] - $150"].Head.CFrame
    wait(0.2)
    fireclickdetector(game.Workspace.Ignored.Shop["[Knife] - $150"].ClickDetector)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(_G.savedhumanoidpos)
end)

TabAU:Button("Sledge Hammer",function()
    _G.savedhumanoidpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Workspace.Ignored.Shop["[SledgeHammer] - $350"].Head.CFrame
    wait(0.2)
    fireclickdetector(game.Workspace.Ignored.Shop["[SledgeHammer] - $350"].ClickDetector)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(_G.savedhumanoidpos)
end)

TabA:Label("Animations")
TabA:Button("WereWolf & Zombie",function()
    game.Players.LocalPlayer.Character.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
    game.Players.LocalPlayer.Character.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
    game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
    game.Players.LocalPlayer.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
    game.Players.LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
    game.Players.LocalPlayer.Character.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
    game.Players.LocalPlayer.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
TabA:Button("Sneaky",function()
    game.Players.LocalPlayer.Character.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1132473842"
    game.Players.LocalPlayer.Character.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1132477671"
    game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1132510133"
    game.Players.LocalPlayer.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1132494274"
    game.Players.LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1132489853"
    game.Players.LocalPlayer.Character.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1132461372"
    game.Players.LocalPlayer.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1132469004"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

TabA:Button("Ghost",function()
    game.Players.LocalPlayer.Character.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
    game.Players.LocalPlayer.Character.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
    game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
    game.Players.LocalPlayer.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
    game.Players.LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
    game.Players.LocalPlayer.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
    game.Players.LocalPlayer.Character.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=616012453"
    game.Players.LocalPlayer.Character.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=616011509"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

TabA:Button("Zombie",function()
    game.Players.LocalPlayer.Character.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
    game.Players.LocalPlayer.Character.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
    game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
    game.Players.LocalPlayer.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
    game.Players.LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
    game.Players.LocalPlayer.Character.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
    game.Players.LocalPlayer.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

TabA:Button("Werewolf",function()
    game.Players.LocalPlayer.Character.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
    game.Players.LocalPlayer.Character.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
    game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
    game.Players.LocalPlayer.Character.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
    game.Players.LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
    game.Players.LocalPlayer.Character.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
    game.Players.LocalPlayer.Character.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)

TabE:Label("Extra")
TabE:Button("Rejoin",function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end)
TabE:Button("Server Hop",function()
    for fe, fg in pairs(game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
        if fg.playing ~= fg.maxPlayers then
          game:service("TeleportService"):TeleportToPlaceInstance(game.PlaceId, fg.id)
        end
      end
end)
TabE:Button("Remove Fog",function()
    game:GetService"Lighting".FogEnd = 999999999
end)
TabE:Toggle("AutoFarm",function(state)
    getgenv().loaded_hook = false

    if not getgenv().loaded_hook or getgenv().loaded_hook == false then
    local __namecall
    __namecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local args = {...}
        if not checkcaller() and getnamecallmethod() == "FireServer" and tostring(self) == "MainEvent" then
            if tostring(getcallingscript()) ~= "Framework" then
                return "L Bozo Imagine Kicking"
            end
        end
        if not checkcaller() and getnamecallmethod == "Kick" then
            return "L Bozo Imagine Kicking"
        end
        return __namecall(self, unpack(args))
    end))
    getgenv().loaded_hook = true
    end
    
    local LocalPlayer = game:GetService("Players").LocalPlayer
    
    function gettarget()
        local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:wait()
        local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
        local maxdistance = math.huge
        local target
        for i, v in pairs(game:GetService("Workspace").Cashiers:GetChildren()) do
            if v:FindFirstChild("Head") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                local distance = (HumanoidRootPart.Position - v.Head.Position).magnitude
                if distance < maxdistance then
                    target = v
                    maxdistance = distance
                end
            end
        end
        return target
    end
    
    for i, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Seat") then
            v:Destroy()
        end
    end
    
    getgenv().MoneyFarm = state -- Just execute shared.MoneyFarm = false to stop farming
    
    while getgenv().MoneyFarm do
        if not getgenv().MoneyFarm then break end
        local Target = gettarget()
        repeat task.wait()
            pcall(function()
                local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:wait()
                local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
                local Combat = LocalPlayer.Backpack:FindFirstChild("Combat") or Character:FindFirstChild("Combat")
                if not Combat then
                    Character:FindFirstChild("Humanoid").Health = 0
                    return
                end
                HumanoidRootPart.CFrame = Target.Head.CFrame * CFrame.new(0, -2.5, 3)
                Combat.Parent = Character
                Combat:Activate()
            end)
        until not Target or Target.Humanoid.Health < 0 or getgenv().MoneyFarm == false
        for i, v in pairs(game:GetService("Workspace").Ignored.Drop:GetDescendants()) do
            if v:IsA("ClickDetector") and v.Parent and v.Parent.Name:find("Money") then
                local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:wait()
                local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
                if (v.Parent.Position - HumanoidRootPart.Position).magnitude <= 18 then
                    repeat task.wait(0,1)
                        fireclickdetector(v)
                    until not v or not v.Parent.Parent
                end
            end
        end
        task.wait()
    end
end)
-------------------------------------------------------------------------------
--Credits Tab
-------------------------------------------------------------------------------
TabCR:Label("Credits")
TabCR:Button("Icy#6036 | Owner, UI, Scripting",function()
end)
TabCR:Button("tiny toes#8633 | Co-Owner, Developer, UI, Scripting",function()
end)
TabCR:Button("Click To Copy Icy's Discord Server",function()
    setclipboard('https://discord.gg/kk2U365JpK')
    game.StarterGui:SetCore('SendNotification', {
        Title = 'Krypton',
        Text = 'Link copied to clipboard.'
    })
end)
TabCR:Button("Click To Copy Tiny Toes Discord Server",function()
    setclipboard('https://discord.gg/dNC3VjMc2g')
    game.StarterGui:SetCore('SendNotification', {
        Title = 'Krypton',
        Text = 'Link copied to clipboard.'
    })
end)
------------------------------------------------------------------------------------------------------------------------------------------------
--UI Settings
------------------------------------------------------------------------------------------------------------------------------------------------
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\--
TabM:Keybind("Toggle",Enum.KeyCode.V,function()
    Library:Toggle()
end)
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\--


--------------------------------------------------------------------------------------------------------------------------------------------------
--Notifacation
--------------------------------------------------------------------------------------------------------------------------------------------------
game.StarterGui:SetCore('SendNotification', {
    Title = 'Krypton',
    Text = 'Loaded, Enjoy |  V0.3',
    Icon = 'http://www.roblox.com/asset/?id=7736781940'
})
game.StarterGui:SetCore('SendNotification', {
    Title = 'Announcements:',
    Text = 'Enjoy New & Improved Krypton - Tiny toes & Icy'
})
setfpscap(999)