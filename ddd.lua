local player = game.Players.LocalPlayer

local character = player.Character

local humanoid = character:WaitForChild("Humanoid")

local function FireButton(x)
    for i, v in pairs(getconnections(x.MouseButton1Click)) do
        v:Function()
    end
end

_G.Stands = {}

_G.FarmStands = false

function startFarming()
    while _G.FarmStands == true do wait()

        repeat
            wait()

            -- stands farm method

            if game:GetService("Players").LocalPlayer.CharacterSkillTree["Worthiness I"].Value == false then

                local args = {
                    [1] = "LearnSkill",
                    [2] = {
                        ["Skill"] = "Worthiness I",
                        ["SkillTreeType"] = "Character"
                    }
                }

                game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))
            end

            if game:GetService("Players").LocalPlayer.PlayerStats.Stand.Value == "None" then
    
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:WaitForChild("Mysterious Arrow"))
    
                local gui = game.Players.LocalPlayer.PlayerGui:WaitForChild("DialogueGui")
                local yesButton = gui:WaitForChild("Frame"):WaitForChild("Options"):WaitForChild("Option1"):WaitForChild("TextButton")

                FireButton(yesButton)

            elseif game:GetService("Players").LocalPlayer.PlayerStats.Stand.Value ~= "None" then
                    
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:WaitForChild("Rokakaka"))

                local gui = game.Players.LocalPlayer.PlayerGui:WaitForChild("DialogueGui")
                local yesButton = gui:WaitForChild("Frame"):WaitForChild("Options"):WaitForChild("Option1"):WaitForChild("TextButton")

                FireButton(yesButton)
            end


        until _G.Stands[game:GetService("Players").LocalPlayer.PlayerStats.Stand.Value]
        print("stand found !")
        break
    end
end

_G.FarmStands = true
startFarming()
