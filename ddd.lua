setfpscap(math.huge)

repeat
    task.wait(5)
until game:IsLoaded()

-- SETUP

local player = game.Players.LocalPlayer

local character = player.Character

local humanoid = character.Humanoid

local HumanoidRootPart = character.HumanoidRootPart

local Player = game.Players.LocalPlayer
local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait();
local Humanoid = Character:WaitForChild("Humanoid");
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local VirtualUser = game:GetService("VirtualUser");
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui");
local TweenService = game:GetService("TweenService");
local Camera = workspace.CurrentCamera;
local request = (syn and syn.request)
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService");
local GameName = MarketplaceService:GetProductInfo(game.PlaceId).Name;
local ESPColor, RainbowESP = Color3.fromRGB(255, 255, 255), false;
local ESPToggle, OldEspColor = false, Color3.fromRGB(255, 255, 255);
local ChamsColor, RainbowChams = Color3.fromRGB(255, 255, 255), false;
local Nametags = false;
local TeamCheck = false;

-- Important Values

_G.AutoEquip = false
_G.AutoBreath = false
_G.AutoStamina = false
_G.MiscChat = false

_G.TweenSpeed = 250
local currentTween

-- Functions

-- when kicked auto rejoin

game.Players.PlayerRemoving:Connect(function (plr)
    if plr == game.Players.LocalPlayer then
      game:GetService('TeleportService'):Teleport(game.PlaceId)
    end
end)


-- Teleport

function TeleportTween(dist, AdditionalCFrame)
    if Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("Humanoid") then
        if AdditionalCFrame then
            local tweenInfo = TweenInfo.new((Player.Character:WaitForChild("HumanoidRootPart").Position - dist.Position).Magnitude / _G.TweenSpeed, Enum.EasingStyle.Linear)
            currentTween = TweenService:Create(Player.Character:WaitForChild("HumanoidRootPart"), tweenInfo, {CFrame = dist * AdditionalCFrame})
        else
            local tweenInfo = TweenInfo.new((Player.Character:WaitForChild("HumanoidRootPart").Position - dist.Position).Magnitude / _G.TweenSpeed, Enum.EasingStyle.Linear)
            currentTween = TweenService:Create(Player.Character:WaitForChild("HumanoidRootPart"), tweenInfo, {CFrame = dist})
        end

        local Noclip = nil
        local Clip = nil
        
        function noclip()
            Clip = false
            local function Nocl()
                if Clip == false and game.Players.LocalPlayer.Character ~= nil then
                    for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
                            v.CanCollide = false
                        end
                    end
                end
                wait(0.21) -- basic optimization
            end
            Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
        end
        
        function clip()
            if Noclip then Noclip:Disconnect() end
            Clip = true
        end
        
        noclip() -- to toggle noclip() and clip()

        currentTween:Play()
        currentTween.Completed:Wait()
        currentTween = nil

        clip()
    end
end

-- Random

function FireButton(x)
    for i, v in pairs(getconnections(x.MouseButton1Click)) do
        v:Function()
    end
end

function FireClick(x)
    for i, v in pairs(getconnections(x.Activated)) do
        v.Function()
    end
end

-- Infinity Breath

function Breath()
    spawn(function()
        while _G.AutoBreath == true do wait()
            local stam = game:GetService("ReplicatedStorage").PlayerValues[game.Players.LocalPlayer.Name].Stamina
            local breathing = game:GetService("ReplicatedStorage").PlayerValues[game.Players.LocalPlayer.Name].Breath
            if not breathing.Value == breathing.MaxValue then
            wait()
          else
              breathing.Value = breathing.MaxValue
            end end
    end)
end

-- Infinity Stamina

function Stamina()
    spawn(function()
        while _G.AutoStamina == true do wait()
            local stam = game:GetService("ReplicatedStorage").PlayerValues[game.Players.LocalPlayer.Name].Stamina
            local breathing = game:GetService("ReplicatedStorage").PlayerValues[game.Players.LocalPlayer.Name].Breath
            if not stam.Value == stam.MaxValue then
            wait()
          else
              stam.Value=stam.MaxValue
            end end
    end)
end

-- Kamado Healing

function Godmode()

    local args = {
        [1] = _G.Godmode
    }
    
    game:GetService("ReplicatedStorage").Remotes.heal_tang123asd:FireServer(unpack(args))
end

-- Breath Healing

function Godmode2()

    local args = {
        [1] = _G.Godmode2
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("regeneration_breathing_remote"):FireServer(unpack(args))
end

-- GUI

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/i8zHub/i8zHub/main/Library.lua"))()
local Wait = library.subs.Wait -- Only returns if the GUI has not been terminated. For 'while Wait() do' loops

local PepsisWorld = library:CreateWindow({
    Name = "Ora Hub",
    Defult = false,
    Themeable = {
        Info = 'By: OzNL',
        Asset = "rbxassetid://0",
        Credit = false,
    }
})

local GeneralTab = PepsisWorld:CreateTab({
    Name = "Main"
})

local BuffsAndModesTab = PepsisWorld:CreateTab({
    Name = "Buffs & Modes"
})

local MiscTab = PepsisWorld:CreateTab({
    Name = "Misc"
})

local FarmingSection = GeneralTab:CreateSection({
    Name = "Farming"
})

local AutoSkillsSection = GeneralTab:CreateSection({
    Name = "Auto Skills",
    Side = "Right",
})

local ModifySection = MiscTab:CreateSection({
    Name = "Modifying"
})

local PlayerSection = MiscTab:CreateSection({
    Name = "Local Player",
    Side = "Right",
})

local WebhookSection = MiscTab:CreateSection({
    Name = "Webhook",
    Side = "Left",
})

-- Auto Skills Section

_G.UseingInFarming = false
_G.Keyz = false
_G.Keyx = false
_G.Keyc = false
_G.Keyv = false
_G.Keyzb = false
_G.Keyzn = false


AutoSkillsSection:AddToggle({
    Name = "Use Skills On Farming?",
    Flag = "AutoSkill_Auto",
    Callback = function(NewValue, OldValue)
        _G.UseingInFarming = NewValue
    end
})

AutoSkillsSection:AddToggle({
    Name = "Key Z",
    Flag = "AutoSkill_Z",
    Callback = function(NewValue, OldValue)
        _G.Keyz = NewValue
    end
})

AutoSkillsSection:AddToggle({
    Name = "Key X",
    Flag = "AutoSkill_X",
    Callback = function(NewValue, OldValue)
        _G.Keyx = NewValue
    end
})

AutoSkillsSection:AddToggle({
    Name = "Key C",
    Flag = "AutoSkill_C",
    Callback = function(NewValue, OldValue)
        _G.Keyc = NewValue
    end
})


AutoSkillsSection:AddToggle({
    Name = "Key V",
    Flag = "AutoSkill_V",
    Callback = function(NewValue, OldValue)
        _G.Keyv = NewValue
    end
})

AutoSkillsSection:AddToggle({
    Name = "Key B",
    Flag = "AutoSkill_B",
    Callback = function(NewValue, OldValue)
        _G.Keyzb = NewValue
    end
})

AutoSkillsSection:AddToggle({
    Name = "Key N",
    Flag = "AutoSkill_N",
    Callback = function(NewValue, OldValue)
        _G.Keyzn = NewValue
    end
})

spawn(function()
    while true do wait()
        
        if _G.UseingInFarming == true then
            
            if _G.AutoFarmAllBosses == true then
                
                if _G.Keyz == true then
                
                    game:GetService('VirtualInputManager'):SendKeyEvent(true,'Z',false,uwu)
                    game:GetService('VirtualInputManager'):SendKeyEvent(false,'Z',false,uwu)
                end
    
                if _G.Keyx == true then
                    
                    game:GetService('VirtualInputManager'):SendKeyEvent(true,'X',false,uwu)
                    game:GetService('VirtualInputManager'):SendKeyEvent(false,'X',false,uwu)
                end
    
                if _G.Keyc == true then
                    
                    game:GetService('VirtualInputManager'):SendKeyEvent(true,'C',false,uwu)
                    game:GetService('VirtualInputManager'):SendKeyEvent(false,'C',false,uwu)
                end
    
                if _G.Keyv == true then
                    
                    game:GetService('VirtualInputManager'):SendKeyEvent(true,'V',false,uwu)
                    game:GetService('VirtualInputManager'):SendKeyEvent(false,'V',false,uwu)
                end
    
                if _G.Keyzb == true then
                    
                    game:GetService('VirtualInputManager'):SendKeyEvent(true,'B',false,uwu)
                    game:GetService('VirtualInputManager'):SendKeyEvent(false,'B',false,uwu)
                end
    
                if _G.Keyzn == true then
                    
                    game:GetService('VirtualInputManager'):SendKeyEvent(true,'N',false,uwu)
                    game:GetService('VirtualInputManager'):SendKeyEvent(false,'N',false,uwu)
                end
            end

        else

            if _G.Keyz == true then
                
                game:GetService('VirtualInputManager'):SendKeyEvent(true,'Z',false,uwu)
                game:GetService('VirtualInputManager'):SendKeyEvent(false,'Z',false,uwu)
            end

            if _G.Keyx == true then
                
                game:GetService('VirtualInputManager'):SendKeyEvent(true,'X',false,uwu)
                game:GetService('VirtualInputManager'):SendKeyEvent(false,'X',false,uwu)
            end

            if _G.Keyc == true then
                
                game:GetService('VirtualInputManager'):SendKeyEvent(true,'C',false,uwu)
                game:GetService('VirtualInputManager'):SendKeyEvent(false,'C',false,uwu)
            end

            if _G.Keyv == true then
                
                game:GetService('VirtualInputManager'):SendKeyEvent(true,'V',false,uwu)
                game:GetService('VirtualInputManager'):SendKeyEvent(false,'V',false,uwu)
            end

            if _G.Keyzb == true then
                
                game:GetService('VirtualInputManager'):SendKeyEvent(true,'B',false,uwu)
                game:GetService('VirtualInputManager'):SendKeyEvent(false,'B',false,uwu)
            end

            if _G.Keyzn == true then
                
                game:GetService('VirtualInputManager'):SendKeyEvent(true,'N',false,uwu)
                game:GetService('VirtualInputManager'):SendKeyEvent(false,'N',false,uwu)
            end
        end
    end
end)

-- Farm Section

local combatType = "fist_combat"

FarmingSection:AddSearchBox({
    Name = "Choose Killaura Method",
    Value = "Combat",
    List = {"Combat", "Sword", "War Fans", "Claw", "Scythe"},
    Flag = "Farming_ChooseWeapon",
    Callback = function(NewValue, LastValue)
        
        if NewValue == "Combat" then
            combatType = "fist_combat"
        elseif NewValue == "Sword" then
            combatType = "Sword_Combat_Slash"
        elseif NewValue == "War Fans" then
            combatType = "fans_combat_slash"
        elseif NewValue == "Claw" then
            combatType = "claw_Combat_Slash"
        elseif NewValue == "Scythe" then
            combatType = "Scythe_Combat_Slash"  
        end
    end
})

_G.AutoFarmAllBosses = false
_G.Boso = nil

local BossesPath = game:GetService("Workspace").Mobs.Bosses

local Bosses = game:GetService("Workspace").Mobs.Bosses

local RotationFarm =  CFrame.new(0, 8.5, 0) * CFrame.Angles(math.rad(-90),0, 0)

function AutoFarmAll()

    while _G.AutoFarmAllBosses == true do task.wait()

        -- Chooseing Boss
        
        for _, boss in pairs(Bosses:GetDescendants()) do

            -- Automatic

            if _G.Boso == nil then

                if not boss:FindFirstChildOfClass("Humanoid") and not boss:FindFirstChild("HumanoidRootPart") then
                    _G.Boso = nil
                end

                if boss:FindFirstChildOfClass("Humanoid") and boss:FindFirstChild("HumanoidRootPart") then
                    
                    local BossesTier5 = {
                        ["Akeza"] = CFrame.new(1902.86096, 556.218628, -150.781982, 0.707398295, 2.53234589e-08, 0.706815124, -2.17222773e-08, 1, -1.40873553e-08, -0.706815124, -5.38826272e-09, 0.707398295),
                        ["Rengoku"] = CFrame.new(3742.44653, 673.759949, -346.272552, -0.997118294, -3.57623833e-08, -0.075862214, -3.08747161e-08, 1, -6.5600986e-08, 0.075862214, -6.30697201e-08, -0.997118294),
                        ["Tengen"] = CFrame.new(1474.50378, 486.326874, -3157.11865, -0.999827683, -2.77116001e-08, -0.0185644738, -2.82084009e-08, 1, 2.64990607e-08, 0.0185644738, 2.70181673e-08, -0.999827683),
                        ["Douma"] = CFrame.new(-45.8025055, 512.893677, -1713.55981, 0.902059257, -3.05681738e-08, 0.431612223, 4.24350617e-08, 1, -1.78650321e-08, -0.431612223, 3.44308084e-08, 0.902059257),
                    }

                    if BossesTier5[boss.Name] then
                        _G.Boso = boss
                    else
                        _G.Boso = boss
                    end
                end

                if boss:FindFirstChildOfClass("Humanoid") and not boss:FindFirstChild("HumanoidRootPart") then
    
                    local BossesPlaces = {
                        ["Muichiro Tokito"] = CFrame.new(4632.61621, 673.7323, -439.146667, 0.723658621, 1.03431663e-08, -0.690158129, -3.57349563e-08, 1, -2.24828813e-08, 0.690158129, 4.09327008e-08, 0.723658621), -- Tokito
                        ["Renpeke"] = CFrame.new(-1357.677, 600.626221, -628.709229, 0.998222232, 4.432734e-08, -0.0596017465, -4.22518127e-08, 1, 3.60835131e-08, 0.0596017465, -3.3501081e-08, 0.998222232),
                        ["Inosuke"] = CFrame.new(1827.58728, 500.767822, 63.9801941, -0.570480525, 8.53314752e-10, -0.821311116, 1.3872719e-08, 1, -8.59698712e-09, 0.821311116, -1.62982321e-08, -0.570480525),
                        ["Akeza"] = CFrame.new(1902.86096, 556.218628, -150.781982, 0.707398295, 2.53234589e-08, 0.706815124, -2.17222773e-08, 1, -1.40873553e-08, -0.706815124, -5.38826272e-09, 0.707398295),
                        ["Rengoku"] = CFrame.new(3742.44653, 673.759949, -346.272552, -0.997118294, -3.57623833e-08, -0.075862214, -3.08747161e-08, 1, -6.5600986e-08, 0.075862214, -6.30697201e-08, -0.997118294),
                        ["Swampy"] = CFrame.new(-1388.1228, 601.12616, -262.222229, 0.58744359, -2.06237871e-08, 0.809265137, -6.31205879e-08, 1, 7.1303667e-08, -0.809265137, -9.29681718e-08, 0.58744359),
                        ["Enme"] = CFrame.new(1638.46252, 532.670471, -639.816895, 0.0184088573, -2.99955794e-08, 0.999830544, 3.03867886e-09, 1, 2.99447152e-08, -0.999830544, 2.48691601e-09, 0.0184088573),
                        ["Tengen"] = CFrame.new(1474.50378, 486.326874, -3157.11865, -0.999827683, -2.77116001e-08, -0.0185644738, -2.82084009e-08, 1, 2.64990607e-08, 0.0185644738, 2.70181673e-08, -0.999827683),
                        ["Sound Trainee"] = CFrame.new(1803.49072, 487.373657, -2756.94702, 0.916571796, -5.09106783e-08, -0.399870127, 7.79397382e-08, 1, 5.13333909e-08, 0.399870127, -7.82165159e-08, 0.916571796),
                        ["Snow Trainee"] = CFrame.new(404.37207, 531.96875, -2857.95361, 0.0619085319, 5.66658507e-08, 0.998081803, 6.51483134e-09, 1, -5.71788554e-08, -0.998081803, 1.00421937e-08, 0.0619085319),
                        ["Douma"] = CFrame.new(-45.8025055, 512.893677, -1713.55981, 0.902059257, -3.05681738e-08, 0.431612223, 4.24350617e-08, 1, -1.78650321e-08, -0.431612223, 3.44308084e-08, 0.902059257),
                    }

                    local BossesTier5 = {
                        ["Akeza"] = CFrame.new(1902.86096, 556.218628, -150.781982, 0.707398295, 2.53234589e-08, 0.706815124, -2.17222773e-08, 1, -1.40873553e-08, -0.706815124, -5.38826272e-09, 0.707398295),
                        ["Rengoku"] = CFrame.new(3742.44653, 673.759949, -346.272552, -0.997118294, -3.57623833e-08, -0.075862214, -3.08747161e-08, 1, -6.5600986e-08, 0.075862214, -6.30697201e-08, -0.997118294),
                        ["Tengen"] = CFrame.new(1474.50378, 486.326874, -3157.11865, -0.999827683, -2.77116001e-08, -0.0185644738, -2.82084009e-08, 1, 2.64990607e-08, 0.0185644738, 2.70181673e-08, -0.999827683),
                        ["Douma"] = CFrame.new(-45.8025055, 512.893677, -1713.55981, 0.902059257, -3.05681738e-08, 0.431612223, 4.24350617e-08, 1, -1.78650321e-08, -0.431612223, 3.44308084e-08, 0.902059257),
                    }
    
                    repeat
                        wait()

                        if not BossesTier5[boss.Name] then
                            
                            local function selectRandomBoss()
                                local bosses = {}
                                for boss, _ in pairs(BossesPlaces) do
                                    table.insert(bosses, boss)
                                end
                                local randomIndex = math.random(1, #bosses)
                                return bosses[randomIndex]
                            end
                            
                            local randomBoss = selectRandomBoss()
    
                            if not boss:FindFirstChild("HumanoidRootPart") then
                                if currentTween then currentTween:Cancel() currentTween = nil end
                                TeleportTween(randomBoss)
                            end
                        end

                        if BossesTier5[boss.Name] then

                            local randomBoss = BossesTier5[boss.Name]
    
                            if not boss:FindFirstChild("HumanoidRootPart") then
                                if currentTween then currentTween:Cancel() currentTween = nil end
                                TeleportTween(randomBoss)
                            end
                        end

                    until boss:FindFirstChild("HumanoidRootPart")
    
                    _G.Boso = boss

                end
            end
        end

        
        -- Auto Farm Boss

        if _G.Boso ~= nil and _G.Boso.Humanoid.Health < 1 then
            _G.Boso = nil
        end

        if _G.Boso ~= nil then

            local mag = (Player.Character:WaitForChild("HumanoidRootPart").Position - _G.Boso.HumanoidRootPart.Position).Magnitude
        
            if mag < 100 then

                if currentTween then currentTween:Cancel() currentTween = nil end

                Player.Character:WaitForChild("HumanoidRootPart").CFrame = _G.Boso:WaitForChild("HumanoidRootPart").CFrame * RotationFarm

            else
                if currentTween then currentTween:Cancel() end
                TeleportTween(_G.Boso:WaitForChild("HumanoidRootPart").CFrame * RotationFarm)
            end
        end
    end
end

FarmingSection:AddToggle({
    Name = "Kill All Bosses",
    Flag = "Farming_Bosses",
    Keybind = 1,
    Callback = function(NewValue, OldValue)
        _G.AutoFarmAllBosses = NewValue
        AutoFarmAll()
    end
})


function args(style, count)
    return {
        [1] = style,
        [2] = Player,
        [3] = Player.Character,
        [4] = Player.Character:WaitForChild("HumanoidRootPart"),
        [5] = Player.Character:WaitForChild("Humanoid"),
        [6] = count,
    }
end

local cd = 1.5

local db = false

_G.Killaura = false

function Killaura_Normal()
    while _G.Killaura == true do wait()

        if db == false then
        
            db = true
    
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args(combatType, 1)))
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args(combatType, 2)))
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args(combatType, 3)))
            wait(0.05)
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args(combatType, 4)))
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args(combatType, 5)))
            wait(0.05)
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args(combatType, 1)))
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args(combatType, 2)))
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args(combatType, 3)))
            wait(0.05)
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args(combatType, 4)))
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args(combatType, 5)))
            wait(0.05)
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args(combatType, 1)))
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args(combatType, 2)))
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args(combatType, 3)))
            wait(0.05)
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args(combatType, 4)))
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args(combatType, 5)))
    
            task.delay(cd, function()
                db = false
            end)
        end
    end
end

FarmingSection:AddToggle({
    Name = "Normal Killaura",
    Flag = "Farming_NormalKillaura",
    Keybind = 1,
    Callback = function(NewValue, OldValue)
        _G.Killaura = NewValue
        Killaura_Normal()
    end
})


-- Buffs & Modes



-- Player Section



-- Modifying Section

ModifySection:AddTextbox({
    Name = "Change Clan",
    Flag = "Modifying_ChangeClan",
    Value = game:GetService("ReplicatedStorage")["Player_Data"][Player.Name].Clan.Value,
    Callback = function(NewValue, OldValue)
        game:GetService("ReplicatedStorage")["Player_Data"][Player.Name].Clan.Value = NewValue
    end
})


-- Webhook Section

_G.Webhook = ""

_G.AutoWebhook = false

_G.everyoneEnabled = false
_G.everyoneEnabled2 = false
_G.everyoneEnabled3 = false

WebhookSection:AddTextbox({
    Name = "Webhook Url",
    Flag = "Webhook_Url",
    Value = "",
    Callback = function(NewValue, OldValue)
        _G.Webhook = NewValue
    end
})

WebhookSection:AddButton({
    Name = "Test Webhook",
    Callback = function()
        local data = {
            ["content"] = "",
            ["embeds"] = {
                {
                    ["title"] = "Webhook is working very well!",
                    ["description"] = "Ora Hub, Has been checked all the webhook methodes and luckly there is no problem!\n \n- Message by: **Ora Hub**",
                    ["type"] = "rich",
                    ["color"] = Color3.fromHex("ffffff"),
                    ["image"] = {
                        ["url"] = ""
                    },
                }
            }
        }
    
        local newdata = game:GetService("HttpService"):JSONEncode(data)
    
        local headers = {
           ["content-type"] = "application/json"
        }
        request = http_request or request or HttpPost or syn.request
        local abcdef = {Url = _G.Webhook, Body = newdata, Method = "POST", Headers = headers}
        request(abcdef)
    end
})

WebhookSection:AddToggle({
    Name = "Auto Loot",
    Flag = "Webhook_AutoLoot",
    Callback = function(NewValue, OldValue)
        _G.AutoWebhook = NewValue
    end
})

WebhookSection:AddToggle({
    Name = "Auto Loot (Only Mythic)",
    Flag = "Webhook_AutoLootMythic",
    Callback = function(NewValue, OldValue)
        _G.everyoneEnabled3 = NewValue
    end
})

WebhookSection:AddToggle({
    Name = "Mention @here",
    Flag = "Webhook_Everything",
    Callback = function(NewValue, OldValue)
        _G.everyoneEnabled = NewValue
    end
})

WebhookSection:AddToggle({
    Name = "Mention @here (Only Mythic)",
    Flag = "Webhook_OnlyMythic",
    Callback = function(NewValue, OldValue)
        _G.everyoneEnabled2 = NewValue
    end
})
