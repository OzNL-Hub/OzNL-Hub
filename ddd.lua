local player = game.Players.LocalPlayer

local character = player.Character

local humanoid = character:FindFirstChild("Humanoid")

local function FireButton(x)
    for i, v in pairs(getconnections(x.MouseButton1Click)) do
        v:Function()
    end
end

_G.SniperStand = {"The World", "Star Platinum"}

function AutoSnipe()

    while _G.AutoSniper == true do wait()
        repeat
            wait()

            if game:GetService("Players").LocalPlayer.PlayerStats.Stand.Value == "None" then
    
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:WaitForChild("Mysterious Arrow"))
    
                local gui = game.Players.LocalPlayer.PlayerGui:WaitForChild("DialogueGui")
                local yesButton = gui:WaitForChild("Frame"):WaitForChild("Options"):WaitForChild("Option1"):WaitForChild("TextButton")

                FireButton(yesButton)

            elseif game:GetService("Players").LocalPlayer.PlayerStats.Stand.Value ~= "None" and not _G.SniperStand[game:GetService("Players").LocalPlayer.PlayerStats.Stand.Value] then
                    
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:WaitForChild("Rokakaka"))

                local gui = game.Players.LocalPlayer.PlayerGui:WaitForChild("DialogueGui")
                local yesButton = gui:WaitForChild("Frame"):WaitForChild("Options"):WaitForChild("Option1"):WaitForChild("TextButton")

                FireButton(yesButton)
            end
            
        until _G.AutoSniper == false or _G.SniperStand[game:GetService("Players").LocalPlayer.PlayerStats.Stand.Value]
        break
    end
end

_G.AutoSniper = true
AutoSnipe()
