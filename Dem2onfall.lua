-- SETUP
--

local player = game.Players.LocalPlayer

local character = player.Character

local humanoid = character.Humanoid

local HumanoidRootPart = character.HumanoidRootPart

local Player = game.Players.LocalPlayer
-- local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait();
local Humanoid = Character:WaitForChild("Humanoid");
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");
-- local ReplicatedStorage = game:GetService("ReplicatedStorage");
-- local VirtualUser = game:GetService("VirtualUser");
-- local PlayerGui = LocalPlayer:WaitForChild("PlayerGui");
local TweenService = game:GetService("TweenService");
-- local Camera = workspace.CurrentCamera;
-- local request = (syn and syn.request)
-- local HttpService = game:GetService("HttpService")
-- local MarketplaceService = game:GetService("MarketplaceService");
-- local GameName = MarketplaceService:GetProductInfo(game.PlaceId).Name;
local ESPColor, RainbowESP = Color3.fromRGB(255, 255, 255), false;
local ESPToggle, OldEspColor = false, Color3.fromRGB(255, 255, 255);
local ChamsColor, RainbowChams = Color3.fromRGB(255, 255, 255), false;
local Nametags = false;
local TeamCheck = false;

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

-- Functions

-- when kicked auto rejoin

game.Players.PlayerRemoving:Connect(function (plr)
    if plr == game.Players.LocalPlayer then
      game:GetService('TeleportService'):Teleport(game.PlaceId)
    end
end)

-- Noclip
local noclipE = false

local function noclip()
	for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if v:IsA("BasePart") and v.CanCollide == true then
			v.CanCollide = false
		end
	end
end

-- Teleport

_G.TweenSpeed = 250
_G.TweenSpeed2 = 500
local antifall = nil

local function moveto(obj)
    local info = TweenInfo.new(((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - obj.Position).Magnitude)/ _G.TweenSpeed, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = obj})

    if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
        antifall = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
        antifall.Velocity = Vector3.new(0,0,0)
        noclipE = game:GetService("RunService").Stepped:Connect(noclip)
        tween:Play()
    end
        
    tween.Completed:Connect(function()
        antifall:Destroy()
        noclipE:Disconnect()
    end)
end

local function m2oveto(obj)
    local info = TweenInfo.new(((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - obj.Position).Magnitude)/ _G.TweenSpeed2, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = obj})

    if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
        antifall = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
        antifall.Velocity = Vector3.new(0,0,0)
        noclipE = game:GetService("RunService").Stepped:Connect(noclip)
        tween:Play()
    end
        
    tween.Completed:Connect(function()
        antifall:Destroy()
        noclipE:Disconnect()
    end)
end


-- Mobs

local function getMob()
    local dist, mob = math.huge
    for i,v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v.Name == _G.Mob then
            local get_mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:GetModelCFrame().p).magnitude
            if get_mag < dist then
                dist = get_mag
                mob = v
            end
        end
    end
    return mob
end

local function getBoss()
    local dist, mob = math.huge
    for i,v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v.Name == _G.Boss then
            local get_mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:GetModelCFrame().p).magnitude
            if get_mag < dist then
                dist = get_mag
                mob = v
            end
        end
    end
    return mob
end

_G.AkazaIsDone = false
local function getInifintyCastleBossAndMob()
    local dist, mob = math.huge
    for i,v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") then
            if v.Name == "Kokushibo" or v.Name == "Doma" or v.Name == "Akaza" or v.Name == "GenericOni" then
                local get_mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:GetModelCFrame().p).magnitude
                if get_mag < dist then
                    dist = get_mag
                    mob = v
                end
            end
        end
    end
    return mob
end

-- Random

function FireButton(x)
    for i, v in pairs(getconnections(x.MouseButton1Click)) do
        v:Function()
    end
end

-- Auto Farm Function

task.spawn(function()
    while task.wait() do
        if _G.AutoMob == true then
            pcall(function()
                local enemy_mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - getMob():GetModelCFrame().p).magnitude

                if not getMob():FindFirstChild("Executed") then
                    m2oveto(getMob():GetModelCFrame() * CFrame.new(0,0,3), tonumber(_G.TweenSpeed))
                end

                if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Model"):FindFirstChild("Blade") then
                    if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Model"):FindFirstChild("Equipped").Part0 == nil then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "R", false, game)
                    end
                end

                if getMob():FindFirstChild("Executed") then
                    wait(1)
                    -- getMob():Destroy()
                end

                if getMob():FindFirstChild("Down") then
                    m2oveto(getMob():GetModelCFrame() * CFrame.new(0,0,3), tonumber(_G.TweenSpeed))
                    game:GetService("ReplicatedStorage").Remotes.Sync:InvokeServer("Character", "Execute")
                end

                for Index, Value in next, Player.Character:GetChildren() do
                    if Value.Name == "Stun" or Value.Name == "SequenceCooldown" or Value.Name == "HeavyCooldown" or Value.Name == "Sequence" or Value.Name == "SequenceFactor" then 
                        Value:Destroy()
                    end
                end

                if enemy_mag <= 10 then
                    if getMob():FindFirstChild("Block") then
                        game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Katana", "Heavy")
                    else
                        game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Katana", "Server")
                    end

                end

            end)
        elseif _G.AutoBoss == true then
            pcall(function()
                local enemy_mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - getBoss():GetModelCFrame().p).magnitude

                if not getBoss():FindFirstChild("Executed") then
                    m2oveto(getBoss():GetModelCFrame() * CFrame.new(0,0,3), tonumber(_G.TweenSpeed))
                end

                if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Model"):FindFirstChild("Blade") then
                    if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Model"):FindFirstChild("Equipped").Part0 == nil then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "R", false, game)
                    end
                end

                if getBoss():FindFirstChild("Executed") then
                    wait(1)
                    -- getBoss():Destroy()
                end

                if getBoss():FindFirstChild("Down") then
                    m2oveto(getBoss():GetModelCFrame() * CFrame.new(0,0,3), tonumber(_G.TweenSpeed))
                    game:GetService("ReplicatedStorage").Remotes.Sync:InvokeServer("Character", "Execute")
                end

                for Index, Value in next, Player.Character:GetChildren() do
                    if Value.Name == "Stun" or Value.Name == "SequenceCooldown" or Value.Name == "HeavyCooldown" or Value.Name == "Sequence" or Value.Name == "SequenceFactor" then 
                        Value:Destroy()
                    end
                end

                if enemy_mag <= 10 then
                    if getBoss():FindFirstChild("Block") then
                        game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Katana", "Heavy")
                    else
                        game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Katana", "Server")
                    end

                end

            end)
        end
    end
end)

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/OzNL-Hub/OzNL-Hub/main/Library.lua"))()
local Wait = library.subs.Wait -- Only returns if the GUI has not been terminated. For 'while Wait() do' loops

local PepsisWorld = library:CreateWindow({
    Name = "OzNL Hub",
    Defult = false,
    Themeable = {
        Info = 'By: OzNL',
        Background  = 0,
        Credit = false,
    }
})

local GeneralTab = PepsisWorld:CreateTab({
    Name = "General"
})

local FarmingSection = GeneralTab:CreateSection({
    Name = "Farming"
})

local mob_list = {
    -- Demon List
    "Crystal Boss",
    "Green Demon",
    "GenericOni",
    "FrostyOni",
    "Blue Demon",
    "SlayerBoss",

    -- Slayer List
    "GenericSlayer",
    "Zenitsu",
}

local boss_list = {
    "Okuro",
    "Rui",
    "Lower Moon 2",
    "Lower Moon 3",
    "Akaza",
    "Doma",
    "Kokushibo",
    "Crystal Boss",
    "Kaigaku",
    "Gyutaro",
}

_G.Mob = "Green Demon"
FarmingSection:AddSearchBox({
    Name = "Select Mob",
    Value = _G.Mob,
    List = mob_list,
    Flag = "FarmingSection_SelectMob",
    Callback = function(NewValue, LastValue)
        _G.Mob = NewValue
    end
})

_G.AutoMob = false
FarmingSection:AddToggle({
    Name = "Auto Mob",
    Flag = "FarmingSection_AutoMob",
    Callback = function(NewValue, OldValue)
        _G.AutoMob = NewValue
    end
})

_G.Boss = "Okuro"
FarmingSection:AddSearchBox({
    Name = "Select Boss",
    Value = _G.Boss,
    List = boss_list,
    Flag = "FarmingSection_SelectBoss",
    Callback = function(NewValue, LastValue)
        _G.Boss = NewValue
    end
})

_G.AutoBoss = false
FarmingSection:AddToggle({
    Name = "Auto Boss",
    Flag = "FarmingSection_AutoBoss",
    Callback = function(NewValue, OldValue)
        _G.AutoBoss = NewValue
    end
})

local MiscellaneousSection = GeneralTab:CreateSection({
    Name = "Miscellaneous",
    Side = "Right"
})

local trinket_list2 = {
    "Ancient Coin",
    "Bronze Jar",
    "Copper Goblet",
    "Gold Crown",
    "Gold Goblet",
    "Gold Jar",
    "Golden Ring",
    "Green Jewel",
    "Perfect Crystal",
    "Red Jewel",
    "Rusty Goblet",
    "Silver Goblet",
    "Silver Jar",
    "Silver Ring",
}
local Trinket_list = {}
for i, v in pairs(trinket_list2) do
    table.insert(Trinket_list, v)
end

_G.TrinketFarm = false
_G.MainTrinketFarm = false
MiscellaneousSection:AddToggle({
    Name = "Trinket Farm",
    Flag = "MiscellaneousSection_TrinketFarm",
    Callback = function(NewValue, OldValue)
        _G.TrinketFarm = NewValue
        _G.MainTrinketFarm = NewValue
    end
})

local function getTrinket()
    local dist, trin = math.huge
    for i,v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("PickableItem") then
            if v.Name == "Perfect Crystal" or v.Name == "Green Jewel" or v.Name == "Red Jewel" then
                local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:GetModelCFrame().p).magnitude
                if mag < dist then
                    dist = mag
                    trin = v
                end
            else
                local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:GetModelCFrame().p).magnitude
                if mag < dist then
                    dist = mag
                    trin = v
                end
            end
        end
    end
    return trin
end

spawn(function()
    while wait() do
        if _G.TrinketFarm == true then
            local trinmag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - getTrinket():GetModelCFrame().p).magnitude
            if trinmag <= 20 then
                for i,v in pairs(workspace:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("PickableItem") and v:FindFirstChild("Part") then
                        local partmag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChild("Part").Position).magnitude 
                        if partmag < 20 then
                            game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Character", "Interaction", v.Part)
                        end
                    end
                end
            else
                moveto(getTrinket():GetModelCFrame() * CFrame.new(0,0,0))
            end
        end
    end
end)

_G.RareFarm = false
MiscellaneousSection:AddToggle({
    Name = "Epic Trinket Farm",
    Flag = "MiscellaneousSection_RareTrinketFarm",
    Callback = function(NewValue, OldValue)
        _G.RareFarm = NewValue
    end
})

local function GetEpicTrinket()
    local tri
    for i, v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Perfect Crystal" or v.Name == "Green Jewel" or v.Name == "Red Jewel" then
            if v:IsA("Model") and v:FindFirstChild("PickableItem") then
               tri = v
            end
        end
    end
    return tri
end

task.spawn(function()
    while wait() do
        if _G.RareFarm == true then
            local part = GetEpicTrinket()
            if part then

                if _G.TrinketFarm == true then
                    _G.TrinketFarm = false
                end

                local trinmag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - part:GetModelCFrame().p).magnitude
                if trinmag <= 20 then
                    for i,v in pairs(workspace:GetChildren()) do
                        if v:IsA("Model") and v:FindFirstChild("PickableItem") then
                            if v:FindFirstChild("Part") then
                                local partmag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChild("Part").Position).magnitude 
                                if partmag < 20 then
                                    game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Character", "Interaction", v.Part)
                                    _G.TrinketFarm = _G.MainTrinketFarm
                                end
                            elseif v:FindFirstChild("Main") then
                                local partmag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChild("Main").Position).magnitude 
                                if partmag < 20 then
                                    game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Character", "Interaction", v.Main)
                                    _G.TrinketFarm = _G.MainTrinketFarm
                                end
                            end

                        end
                    end
                else
                    m2oveto(part:GetModelCFrame() * CFrame.new(0,0,0))
                end
            end
        end
    end
end)

-- _G.SmartTrinketFarm = false
-- _G.TimeToSell = false
-- MiscellaneousSection:AddToggle({
--     Name = "Smart Trinket Farm",
--     Flag = "MiscellaneousSection_TrinketFarm",
--     Callback = function(NewValue, OldValue)
--         _G.SmartTrinketFarm = NewValue
--     end
-- })

-- spawn(function()
--     while wait() do
--         if _G.SmartTrinketFarm == true and _G.TimeToSell == false then
--             local trinmag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - getTrinket():GetModelCFrame().p).magnitude
--             if trinmag <= 20 then
--                 for i,v in pairs(workspace:GetChildren()) do
--                     if v:IsA("Model") and v:FindFirstChild("PickableItem") and v:FindFirstChild("Part") then
--                         local partmag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChild("Part").Position).magnitude 
--                         if partmag < 20 then
--                             game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Character", "Interaction", v.Part)
--                         end
--                     end
--                 end
--             else
--                 moveto(getTrinket():GetModelCFrame() * CFrame.new(0,0,0))
--             end
--         elseif _G.SmartTrinketFarm == true and _G.TimeToSell == true then
--             local market = game.Workspace.Npcs:FindFirstChild("Merchant")
--             if market then
--                 moveto(market:GetModelCFrame())
--                 if (player.Character.HumanoidRootPart.Position - market.HumanoidRootPart.Position).Magnitude < 20 then

--                     wait(2)

--                     local args = {
--                         [1] = "Dialogue",
--                         [2] = "Prompt",
--                         [3] = market
--                     }
                    
--                     game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Sync"):InvokeServer(unpack(args))
                    
--                     wait(2)

--                     local answer1 = "I want to sell all my trinkets"
--                     for i, v in pairs(player.Character.Answers:GetChildren()) do
--                         if v.Value == answer1 then
--                             answer1 = v
--                         end
--                     end

--                     local args1 = {
--                         [1] = "Dialogue",
--                         [2] = "Answer",
--                         [3] = answer1.Value,
--                         [4] = "Merchant"
--                     }

--                     game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Sync"):InvokeServer(unpack(args1))

--                     wait(2)

--                     _G.TimeToSell = false

--                 end
--             end
--         end
--     end
-- end)

-- spawn(function()
--     while wait(30) do
--         if _G.SmartTrinketFarm == true then
--             if _G.TimeToSell == false then
--                 _G.TimeToSell = true
--             elseif _G.TimeToSell == true then
--                 _G.TimeToSell = false
--             end
--         end
--     end
-- end)

_G.PickupAura = false
MiscellaneousSection:AddToggle({
    Name = "Pickup-Aura",
    Flag = "MiscellaneousSection_PickupAura",
    Callback = function(NewValue, OldValue)
        _G.PickupAura = NewValue
    end
})

task.spawn(function()
    while task.wait() do
        if _G.PickupAura == true then
            pcall(function()
                for i,v in pairs(workspace:GetChildren()) do
                    if v.Name == "DropItem" then
                        local partmag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude
                        if partmag < 20 then
                            game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Character", "Interaction", v)
                        end
                    end
                end
            end)
        end
    end
end)

_G.AutoBreath = false
MiscellaneousSection:AddToggle({
    Name = "Auto Breath",
    Flag = "FarmingSection_AutoBreath",
    Callback = function(NewValue, OldValue)
        _G.AutoBreath = NewValue
        if NewValue == false then
            game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Character", "Breath", false)
        end
    end
})

spawn(function()
    while wait() do
        if _G.AutoBreath == true then
            if game.Players.LocalPlayer.Character:FindFirstChild("Busy") then
                game.Players.LocalPlayer.Character:FindFirstChild("Busy"):Destroy()
            end

            if game.Players.LocalPlayer.Character:FindFirstChild("Slow") then 
                game.Players.LocalPlayer.Character:FindFirstChild("Slow"):Destroy()
            end
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoBreath == true then
            if game:GetService("Players").LocalPlayer.Breathing.Value ~= 100 then 
                game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Character", "Breath", true)
            end
            wait(2)
        end
    end
end)


MiscellaneousSection:AddButton({
    Name = "Godmode",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Character", "FallDamageServer", 0/0)
    end
})

MiscellaneousSection:AddButton({
    Name = "Normal Health (Kills you)",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Character", "FallDamageServer", 9999999999999)
    end
})

local TeleportsSection = GeneralTab:CreateSection({
    Name = "Teleports",
    Side = "Left"
})

local breath_style = {
    ["Tanjiro"] = "Sun Breath",
    ["Kokushibo"] = "Moon Breath",
    ["Urokodaki"] = "Water Breath",
    ["Kujima"] = "Thunder Breath",
    ["Rengoku"] = "Flame Breath",
    ["Grimm"] = "Wind Breath",
    ["Tokito"] = "Mist Breath",
    ["Shinobu"] = "Insect Breath",
    ["Uzui"] = "Sound Breath",
}

local breath_style2 = {
    ["Sun Breath"] = "Tanjiro",
    ["Moon Breath"] = "Kokushibo",
    ["Water Breath"] = "Urokodaki",
    ["Thunder Breath"] = "Kujima",
    ["Flame Breath"] = "Rengoku",
    ["Wind Breath"] = "Grimm",
    ["Mist Breath"] = "Tokito",
    ["Insect Breath"] = "Shinobu",
    ["Sound Breath"] = "Uzui",
}

_G.BreathingStyle = "Tanjiro"
TeleportsSection:AddSearchBox({
    Name = "Select Breath Style",
    Value = "Sun Breathing",
    List = breath_style,
    Flag = "TeleportsSection_BreathingStyle",
    Callback = function(NewValue, LastValue)
        _G.BreathingStyle = NewValue
    end
})

TeleportsSection:AddButton({
    Name = "To Breath",
    Callback = function()
        pcall(function()
            moveto(workspace.Npcs:FindFirstChild(breath_style2[_G.BreathingStyle]):GetModelCFrame(), tonumber(_G.TweenSpeed))
        end)
    end
})

local npc_list = {}
for i,v in pairs(workspace.Npcs:GetChildren()) do
    if v:IsA("Model") and not table.find(npc_list, v.Name) then
        table.insert(npc_list, v.Name)
    end
end

_G.NPC = "Tanjiro"
TeleportsSection:AddSearchBox({
    Name = "Select NPC",
    Value = _G.NPC,
    List = npc_list,
    Flag = "TeleportsSection_SelectNPC",
    Callback = function(NewValue, LastValue)
        _G.NPC = NewValue
    end
})

TeleportsSection:AddButton({
    Name = "To NPC",
    Callback = function()
        pcall(function()
            moveto(workspace.Npcs:FindFirstChild(_G.NPC):GetModelCFrame(), tonumber(_G.TweenSpeed))
        end)
    end
})

local RaidsSection = GeneralTab:CreateSection({
    Name = "Raids",
    Side = "Right"
})

_G.InfinityCastle = false
RaidsSection:AddToggle({
    Name = "Farm Infinity Castle",
    Flag = "RaidsSection_InfinityCastle",
    Callback = function(NewValue, OldValue)
        _G.InfinityCastle = NewValue
    end
})

task.spawn(function()
    while task.wait() do
        if _G.InfinityCastle == true then
            pcall(function()
                if _G.AkazaIsDone == true then
                    repeat
                        task.wait()
                        moveto(CFrame.new(3348.25048828125, 3732.3056640625, 1690.620361328125) * CFrame.new(0,0,0))
                    until game.Workspace:FindFirstChild("Doma")
                    _G.AkazaIsDone = false
                elseif _G.AkazaIsDone == false then
                    local enemy_mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - getInifintyCastleBossAndMob():GetModelCFrame().p).magnitude

                    if not getInifintyCastleBossAndMob():FindFirstChild("Executed") then
                        m2oveto(getInifintyCastleBossAndMob():GetModelCFrame() * CFrame.new(0,0,3), tonumber(_G.TweenSpeed))
                    end
    
                    if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Model"):FindFirstChild("Blade") then
                        if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Model"):FindFirstChild("Equipped").Part0 == nil then
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "R", false, game)
                        end
                    end
    
                    if getInifintyCastleBossAndMob():FindFirstChild("Executed") then
                        if getInifintyCastleBossAndMob().Name == "Akaza" then
                            _G.AkazaIsDone = true
                        end
                        wait(1)
                        -- getInifintyCastleBossAndMob():Destroy()
                    end
    
                    if getInifintyCastleBossAndMob():FindFirstChild("Down") then
                        m2oveto(getInifintyCastleBossAndMob():GetModelCFrame() * CFrame.new(0,0,3), tonumber(_G.TweenSpeed))
                        game:GetService("ReplicatedStorage").Remotes.Sync:InvokeServer("Character", "Execute")
                    end
    
                    for Index, Value in next, Player.Character:GetChildren() do
                        if Value.Name == "Stun" or Value.Name == "SequenceCooldown" or Value.Name == "HeavyCooldown" or Value.Name == "Sequence" or Value.Name == "SequenceFactor" then 
                            Value:Destroy()
                        end
                    end
    
                    if enemy_mag <= 10 then
                        if getInifintyCastleBossAndMob():FindFirstChild("Block") then
                            game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Katana", "Heavy")
                        else
                            game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Katana", "Server")
                        end
                    end
                end
            end)

        end
    end
end)
