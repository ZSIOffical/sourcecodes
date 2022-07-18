function ban(check)
   --// Delete everything out of chat to not make it display a message
    for _,v in pairs(game.Chat:GetChildren()) do
        v:Destroy()
    end
    game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui").Chat:Destroy()
    --// messages
    local BanMessages = {
        "ᕵᑘSSy",
        "§hï†",
        "ƈυɳƚ",
        "Ŧยςк",
        "ыtch"
    }
    --// send messages
    for _,v in pairs(BanMessages) do
        wait(0.4)
        local A_1 = v local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2)
    end
    -- checker
    if check == true then
        local MT = getrawmetatable(game)
        local NC = MT.namecall
        setreadonly(MT, false)

        MT.namecall = newcclosure(function(self, ...)
            local A = { ... }
            local GNCM = getnamecallmethod() or get_namecall_method()
            if GNCM == "FireServer" and self.Name == "SayMessageRequest" then
                return local A_1 = math.random(tostring(#BanMessages)) local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2)

            end
            return NC(self, unpack(A))
        end)
        setreadonly(MT, true)
    elseif check == false then
        print("check: false")
    end
end
-- ban(false)
