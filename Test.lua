-- SETUP

loadstring(game:HttpGet("https://raw.githubusercontent.com/OzNL-Hub/OzNL-Hub/main/Setup.lua"))()

repeat
  wait()
until _G.iiiiiiiiiiiiiiiiiii == true

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

-- Important Values

_G.TweenSpeed = 75

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

local function moveto(obj)
    local info = TweenInfo.new(((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - obj.Position).Magnitude) / _G.TweenSpeed, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = obj})

    if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
        noclipE = game:GetService("RunService").Stepped:Connect(noclip)
        tween:Play()
    end
        
    tween.Completed:Connect(function()
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
                    moveto(getMob():GetModelCFrame() * CFrame.new(0,0,3), tonumber(_G.TweenSpeed))
                end

                if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Model"):FindFirstChild("Blade") then
                    if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Model"):FindFirstChild("Equipped").Part0 == nil then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "R", false, game)
                    end
                end

                if getMob():FindFirstChild("Executed") then
                    wait(1)
                    getMob():Destroy()
                end

                if getMob():FindFirstChild("Down") then
                    moveto(getMob():GetModelCFrame() * CFrame.new(0,0,3), tonumber(_G.TweenSpeed))
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

MiscellaneousSection:AddButton({
    Name = "Godmode",
    Callback = function()
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Character", "FallDamageServer", 0/0)
        end)
    end
})

MiscellaneousSection:AddButton({
    Name = "Normal Health (Kill you)",
    Callback = function()
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Character", "FallDamageServer", 9999999999999999999999999999)
        end)
    end
})

local TeleportsSection = GeneralTab:CreateSection({
    Name = "Teleports",
    Side = "Left"
})

local breath_style = {
    ["SunBreath"] = "Tanjiro",
    ["MoonBreath"] = "Kokushibo",
    ["WaterBreath"] = "Urokodaki",
    ["ThunderBreath"] = "Kujima",
    ["FlameBreath"] = "Rengoku",
    ["WindBreath"] = "Grimm",
    ["MistBreath"] = "Tokito",
    ["InsectBreath"] = "Shinobu",
    ["SoundBreath"] = "Uzui",
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
            moveto(workspace.Npcs:FindFirstChild(_G.BreathingStyle):GetModelCFrame(), tonumber(_G.TweenSpeed))
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
