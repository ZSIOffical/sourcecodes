------------------
--Auto Anti Afk
------------------

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
------------------
--Notification
------------------
game.StarterGui:SetCore("SendNotification", {
	Title = "Crypt";
	Text = "Created By Icy#6036 & tiny toes#8633";
	Duration = 5;
})
game.StarterGui:SetCore("SendNotification", {
	Title = "Crypt";
	Text = "Alt Control Host";
	Duration = 5;
})
-------------------
--UI LoadString
-------------------
local VLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/MrDawny/rblx/main/8"))()
-------------------
--Title
-------------------
local Window = VLib:Window("Krypton X", "Premium Selling", "K")
-------------------
--Tabs
-------------------
local TabT = Window:Tab("Toggles")
local TabTE = Window:Tab("Teleports")
local TabE = Window:Tab("Extra")
local TabS = Window:Tab("Settings")
TabT:Label("Toggles")
--auto drop
TabT:Toggle("Autodrop",function(state)
    getgenv().drop_money = state
    while getgenv().drop_money do
      if not getgenv().drop_money then break end
      game:GetService("ReplicatedStorage").MainEvent:FireServer("DropMoney", "10000")
      task.wait()
    end
end)
--cash aura
TabT:Toggle("CashAura",function(state)
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

TabTE:Label("Teleports")
TabTE:Button("Bank",function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-376, 21, -300)
end)
TabTE:Button("Admin Base",function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-876, -33, -530)
end)
TabTE:Button("Club",function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-265, -1, -342)
end)
TabTE:Button("Boxing",function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-266, 52, -1128)
end)
TabTE:Button("Basketball",function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-932, 22, -483)
end)
TabTE:Button("Secret Place (best for selling)",function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(207.480, 38.25, 200014.953)
end)
--------------
--Extra
-----
TabE:Label("Extra")
TabE:Button("Swag Mode Crash",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SuperCustomServerCrasher'))()
end)
TabE:Button("Force Reset",function()
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA('MeshPart') or v:IsA('Part') or v:IsA('Accessory') then
            v:Destroy()
        end
    end
    game.Players.LocalPlayer.Character.Name = 'Deleted'
end)
TabE:Button("Cash Counter",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PostHooking/zerosdahoodstuff/main/Zero%27s%20dh%20scripts%5B2%5D.txt"))()
end)
TabE:Toggle("Anti Lag",function(AntiLagValue)
        getgenv().Get_Anti = AntiLagValue
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
-----------------
--Settings
-----------------
TabS:Label("Settings")
TabS:Label("Icy#6036 | Owner, UI, Scripting")
TabS:Label("tiny toes#8633 | Co-Owner, Developer, UI, Scripting")
TabS:Slider("FPS Cap",1,999,60,function(FPSValue)
setfpscap(FPSValue)
end)
TabS:Button("Ad Message (dosen't stop)",function()
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Thanks for buying!", "All") 
        wait(1)
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Krypton X, a script made for selling.", "All") 
      while true do
        wait(10)
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Thanks for buying!", "All") 
        wait(1)
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Krypton X, a script made for selling.", "All") 
      end
end)
