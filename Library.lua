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

local library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
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
    Name = "General"
})

local FarmingSection = GeneralTab:CreateSection({
    Name = "Farming",
    Side = "Left"
})

local HorsesSection = GeneralTab:CreateSection({
    Name = "Horses",
    Side = "Right"
})

-- Farming Section

_G.AutoGetFeeds = false
_G.CurrentBarrel = nil

function AutoGetFeeds()
    while _G.AutoGetFeeds == true do wait()

        local folder = game.Workspace.Interactions.Resource:GetChildren()
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

FarmingSection:AddToggle({
    Name = "Auto Get Feed",
    Flag = "FarmingSection_GetFeed",
    Callback = function(NewValue, OldValue)
        _G.AutoGetFeeds = NewValue
        AutoGetFeeds()
        AutoDamageFeeds()
    end
})

-- Horses Section

_G.AutoFeedHorse = false
_G.CurrentHorse = nil

function AutoFeedHorse()
    while _G.AutoFeedHorse == true do wait()
        
        local args = {
            [1] = _G.CurrentHorse.Name,
            [2] = "Apple"
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("FeedAnimalRemote"):InvokeServer(unpack(args))
        
    end
end



HorsesSection:AddToggle({
    Name = "Auto Feed Horse (Apple)",
    Flag = "HorsesSection_FeedHorse",
    Callback = function(NewValue, OldValue)
        _G.AutoFeedHorse = NewValue
        AutoFeedHorse()
    end
})

local horsesTable = {}

spawn(function()
    for i, v in pairs(game.Players.LocalPlayer.PlayerGui.Data.Animals:GetChildren()) do
        
        local explore = v.CustomNmae.Value

        if not table.find(horsesTable, explore) then
            
            table.insert(horsesTable, explore)
        end
    end
end)

game.Players.LocalPlayer.PlayerGui.Data.Animals.ChildAdded:Connect(function(Child)
    local explore = Child.CustomNmae.Value

    if not table.find(horsesTable, explore) then
            
        table.insert(horsesTable, explore)
    end
end)

game.Players.LocalPlayer.PlayerGui.Data.Animals.ChildRemoved:Connect(function(Child)

    table.clear(horsesTable)

    for i, v in pairs(game.Players.LocalPlayer.PlayerGui.Data.Animals:GetChildren()) do
        
        local explore = v.CustomNmae.Value

        if not table.find(horsesTable, explore) then
            
            table.insert(horsesTable, explore)
        end
    end
end)


HorsesSection:AddSearchBox({
    Name = "Choose Horse",
    Value = "None",
    List = horsesTable,
    Flag = "HorsesSection_Horses",
    Callback = function(NewValue, LastValue)

        for i, v in pairs(game.Players.LocalPlayer.PlayerGui.Data.Animals:GetChildren()) do
        
            if v.CustomNmae.Value == NewValue then
                
                _G.CurrentHorse = v
            end
        end

    end
})
