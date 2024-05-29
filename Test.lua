-- SETUP

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
    Name = "Farming Mobs",
    Side = "Left",
})

_G.AutoKillDemons = false
_G.AutoKillSlayers = false
_G.ShowHitboxs = false

_G.Tools = {}
_G.CurrentTool = nil

function ShowAllHitbox()
    if _G.ShowHitboxs == true then
        for i, v in pairs(game:GetService("Workspace").MobsHolder:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") then
                v.HumanoidRootPart.Transparency = 0.5
                v.HumanoidRootPart.Color = Color3.new(1,0,0)
            end
        end
    else
        for i, v in pairs(game:GetService("Workspace").MobsHolder:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") then
                v.HumanoidRootPart.Transparency = 1
            end
        end
    end
end

function AutoDemons()
    while _G.AutoKillDemons == true do
        wait()

        for i, v in pairs(game:GetService("Workspace").MobsHolder:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") and v:WaitForChild("Humanoid").Health >= 1 then
                repeat
                    wait()
                    HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,5)
                    game:GetService("Players").LocalPlayer:WaitForChild("Attack"):FireServer()
                until v.Humanoid.Health <= 1
            end
        end
    end
end

spawn(function()
    for i, v in pairs(player.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            if not table.find(_G.Tools, v.Name) then
                table.insert(_G.Tools, v.Name)
            end
        end
    end
end)

player.Backpack.ChildAdded:Connect(function(v)
    if v:IsA("Tool") then
        if not table.find(_G.Tools, v.Name) then
            table.insert(_G.Tools, v.Name)
        end
    end
end)

player.Backpack.ChildRemoved:Connect(function()
    table.clear(_G.Tools)
    spawn(function()
        for i, v in pairs(player.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                if not table.find(_G.Tools, v.Name) then
                    table.insert(_G.Tools, v.Name)
                end
            end
        end
    end)
end)

_G.EnableWeapon = true

FarmingSection:AddSearchBox({
    Name = "Auto Equip Choose",
    Value = "...",
    List = _G.Tools,
    Flag = "Farming_ChooseWeapon",
    Callback = function(NewValue, LastValue)
        _G.CurrentTool = NewValue
        if player.Backpack:FindFirstChild(NewValue) then
            _G.CurrentTool = player.Backpack:WaitForChild(NewValue)
        elseif player.Character:FindFirstChild(NewValue) then
            _G.CurrentTool = player.Character:WaitForChild(NewValue)
        end
    end
})

spawn(function()
    while true do
        wait()
        if _G.EnableWeapon == true then
            if _G.CurrentTool.Parent == player.Backpack then
                humanoid:EquipTool(_G.CurrentTool)
            end
        end
    end
end)

FarmingSection:AddToggle({
    Name = "Auto Farm Demons",
    Flag = "FarmingSection_AutoDemons",
    Keybind = 1,
    Callback = function(NewValue, OldValue)
        _G.AutoKillDemons = NewValue
        AutoDemons()
    end
})

FarmingSection:AddToggle({
    Name = "Auto Farm Slayers",
    Flag = "FarmingSection_AutoSlayers",
    Keybind = 1,
    Callback = function(NewValue, OldValue)
        _G.AutoKillSlayers = NewValue
    end
})

FarmingSection:AddToggle({
    Name = "Show Hitboxs?",
    Flag = "FarmingSection_ShowHitbox",
    Keybind = 1,
    Callback = function(NewValue, OldValue)
        _G.ShowHitboxs = NewValue
        ShowAllHitbox()
    end
})

local TycoonSection = GeneralTab:CreateSection({
    Name = "Tycoon",
    Side = "Right",
})

TycoonSection:AddButton({
    Name = "Teleport To Your Tycoon",
    Callback = function()
        for i, v in pairs(game:GetService("Workspace").TycoonSets.Tycoons:GetChildren()) do
            if v.Owner.Value == player then
               HumanoidRootPart.CFrame = v.Essentials.Spawn.CFrame * CFrame.new(0,5,0)
            end
        end
    end
})

_G.AutoUpgradeTycoon = false

function AutoUpgrade()
    while _G.AutoUpgradeTycoon == true do
        wait()

        for i, v in pairs(game:GetService("Workspace").TycoonSets.Tycoons:GetChildren()) do
            if v.Owner.Value == player then
               for _, button in pairs(v.Buttons:GetChildren()) do
                  if button:FindFirstChild("Head") then
                    if button.Transparency == 0 then
                        HumanoidRootPart.CFrame = button.Head.CFrame
                    end
                  end
               end
            end
        end
    end
end

TycoonSection:AddToggle({
    Name = "Auto Upgrade Tycoon",
    Flag = "TycoonSection_UpgradeTycoon",
    Keybind = 1,
    Callback = function(NewValue, OldValue)
        _G.AutoUpgradeTycoon = NewValue
        AutoUpgrade()
    end
})

local FarmingTreeSection = GeneralTab:CreateSection({
    Name = "Farming Trees",
    Side = "Left",
})

_G.AutoCutTree = false

function CutTrees()
    while _G.AutoCutTree == true do
        wait()
        for i, v in pairs(game:GetService("Workspace").Map:GetChildren()) do
            if v:FindFirstChild("WoodHitPart") and v:FindFirstChild("WoodCutScript") then
                v.WoodHitPart.CanCollide = false
                v.WoodHitPart.Transparency = 0
                HumanoidRootPart.CFrame = v.WoodHitPart.CFrame
                game:GetService("Players").LocalPlayer:WaitForChild("Attack"):FireServer()
            end
        end
    end
end

FarmingTreeSection:AddToggle({
    Name = "Auto Farm Trees",
    Flag = "FarmingTreeSection_AutoFarmTrees",
    Keybind = 1,
    Callback = function(NewValue, OldValue)
        _G.AutoCutTree = NewValue
        CutTrees()
    end
})
