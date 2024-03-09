_G.AutoGetFeeds = true
_G.CurrentBarrel = nil

function AutoGetFeeds()
    while _G.AutoGetFeeds == true do wait()

        local folder = game.Workspace.Interactions.Resource
        local ClickDetector

        if _G.CurrentBarrel == nil then

            for i, v in pairs(folder) do
                if v.Name == "AppleBarrel" then
                    _G.CurrentBarrel = v
                    ClickDetector = _G.CurrentBarrel.ClickDetector
                end
            end

        else

            if _G.CurrentBarrel.DefaultResourceNodeGui.Bar.BackGround.HP.Text == "1" then
                fireclickdetector(ClickDetector)
                return
            end

            fireclickdetector(ClickDetector)
        end
    end
end

function AutoDamageFeeds()
    while _G.AutoGetFeeds == true do wait()

        local args = {
            [1] = game:GetService("Players").LocalPlayer.Character.Animals:FindFirstChild("1")
        }
        
        workspace:WaitForChild("Interactions"):WaitForChild("Resource"):WaitForChild("AppleBarrel"):WaitForChild("RemoteEvent"):FireServer(unpack(args))

        local args2 = {
            [1] = game:GetService("Players").LocalPlayer.Character.Animals:FindFirstChild("2")
        }
        
        workspace:WaitForChild("Interactions"):WaitForChild("Resource"):WaitForChild("AppleBarrel"):WaitForChild("RemoteEvent"):FireServer(unpack(args2))

        local args3 = {
            [1] = game:GetService("Players").LocalPlayer.Character.Animals:FindFirstChild("3")
        }
        
        workspace:WaitForChild("Interactions"):WaitForChild("Resource"):WaitForChild("AppleBarrel"):WaitForChild("RemoteEvent"):FireServer(unpack(args3))

        local args4 = {
            [1] = "\1"
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SendDropsRemote"):FireServer(unpack(args4))
        
        
    end
end

-- _G.AutoFeedHorse = true

-- while _G.AutoFeedHorse == true do wait()
        
--     local args = {
--         [1] = "1",
--         [2] = "Apple"
--     }
    
--     game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("FeedAnimalRemote"):InvokeServer(unpack(args))
    
-- end
