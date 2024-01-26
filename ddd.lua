local player = game.Players.LocalPlayer

local character = player.Character

local humanoid = character:FindFirstChild("Humanoid")

local function FireButton(x)
    for i, v in pairs(getconnections(x.MouseButton1Click)) do
        v:Function()
    end
end

_G.SniperStand = {"The World", "White Sneak"}

function Auto_Sniper()
    while _G.AutoSniper == true do wait()

        local function EquipArrow()

            local item1 = player.Backpack:WaitForChild("Mysterious Arrow")

            humanoid:EquipTool(item1)
        end

        local function EquipRokaka()

            local item2 = player.Backpack:WaitForChild("Rokakaka")

            humanoid:EquipTool(item2)
        end

        --

        if _G.SniperStand[game:GetService("Players").LocalPlayer.PlayerStats.Stand.Value] then

            break
        end

        if not _G.SniperStand[game:GetService("Players").LocalPlayer.PlayerStats.Stand.Value] then

            if game:GetService("Players").LocalPlayer.PlayerStats.Stand.Value == "None" then

                if game:GetService("Players").LocalPlayer.CharacterSkillTree["Worthiness I"].Value == false then

                    local args = {
                        [1] = "LearnSkill",
                        [2] = {
                            ["Skill"] = "Worthiness I",
                            ["SkillTreeType"] = "Character"
                        }
                    }
                    
                    game:GetService("Players").LocalPlayer.Character:WaitForChild("RemoteFunction"):InvokeServer(unpack(args))
                end

                EquipArrow()

                mouse1click()

                wait(1)

                local gui = player.PlayerGui:WaitForChild("DialogueGui")
                local yesButton = gui:WaitForChild("Frame"):WaitForChild("Options"):WaitForChild("Option1"):WaitForChild("TextButton")

                FireButton(yesButton)
    
            elseif game:GetService("Players").LocalPlayer.PlayerStats.Stand.Value ~= "None" then

                EquipRokaka()

                mouse1click()

                wait(1)

                local gui = player.PlayerGui:WaitForChild("DialogueGui")
                local yesButton = gui:WaitForChild("Frame"):WaitForChild("Options"):WaitForChild("Option1"):WaitForChild("TextButton")

                FireButton(yesButton)
            end
        end
    end
end

_G.AutoSniper = true
Auto_Sniper()
