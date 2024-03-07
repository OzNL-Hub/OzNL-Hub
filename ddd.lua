setfpscap(math.huge)

repeat
    task.wait(1)
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
    Name = "Farming"
})
FarmingSection:AddToggle({
    Name = "EXP Grinder",
    Flag = "FarmingSection_EXPGrinder"
})
FarmingSection:AddToggle({
    Name = "Trick Spammer",
    Flag = "FarmingSection_TrickSpammer",
    Keybind = 1,
    Callback = print
})
FarmingSection:AddSlider({
    Name = "Trick Rate",
    Flag = "FarmingSection_TrickRate",
    Value = 0.15,
    Precise = 2,
    Min = 0,
    Max = 1
})
FarmingSection:AddToggle({
    Name = "TP To Coins",
    Flag = "FarmingSection_TPCoins"
})
FarmingSection:AddToggle({
    Name = "Collect Coins",
    Flag = "FarmingSection_CollectCoins",
    Callback = print
})
FarmingSection:AddSlider({
    Name = "Coin Distance",
    Flag = "FarmingSection_CoinDistance",
    Value = 175,
    Min = 0,
    Max = 200,
    Format = function(Value)
        if Value == 0 then
            return "Collection Distance: Infinite"
        else
            return "Collection Distance: " .. tostring(Value)
        end
    end
})

local BoardControlSection = GeneralTab:CreateSection({
    Name = "Board Control"
})
BoardControlSection:AddToggle({
    Name = "Anti Trip/Ragdoll",
    Flag = "BoardControlSection_AntiTripRagdoll",
    Callback = print
})
BoardControlSection:AddToggle({
    Name = "No Wear & Tear",
    Flag = "BoardControlSection_NoWearTear"
})
BoardControlSection:AddToggle({
    Name = "No Trick Cooldown",
    Flag = "BoardControlSection_NoTrickCooldown",
    Callback = print
})
BoardControlSection:AddToggle({
    Name = "Extend Combo Timout",
    Flag = "BoardControlSection_ExtendComboTimeout"
})
BoardControlSection:AddSlider({
    Name = "Timeout Extension",
    Flag = "BoardControlSection_CoinDistance",
    Value = 3,
    Min = 0,
    Max = 20,
    Format = function(Value)
        if Value == 0 then
            return "Combo Timeout: Never"
        else
            return "Combo Timeout: " .. tostring(Value) .. "s"
        end
    end
})

local MiscSection = GeneralTab:CreateSection({
    Name = "Misc",
    Side = "Right"
})
MiscSection:AddToggle({
    Name = "Unlock Gamepasses",
    Flag = "MiscSection_UnlockGamepasses",
    Callback = print
})
MiscSection:AddToggle({
    Name = "Auto Compete",
    Flag = "MiscSection_AutoCompete",
    Callback = print
})
MiscSection:AddButton({
    Name = "Repair Board",
    Callback = function()
        print("Fixed")
    end
})
MiscSection:AddKeybind({
    Name = "Test Key",
    Callback = print
})
MiscSection:AddToggle({
    Name = "Test Toggle/Key",
    Keybind = {
        Mode = "Dynamic"
    },
    Callback = print
})

local FunSection = GeneralTab:CreateSection({
    Name = "Fun Cosmetics"
})
FunSection:AddToggle({
    Name = "Ragdoll Assumes Flight",
    Flag = "FunSection_AssumesFlight"
})
FunSection:AddToggle({
    Name = "Ragdoll On Player Collision",
    Flag = "FunSection_RagdollOnPlayerCollision"
})
FunSection:AddToggle({
    Name = "Un-Ragdoll When Motionless",
    Flag = "FunSection_UnRagdollWhenMotionless"
})
FunSection:AddToggle({
    Name = "Extend Ragdoll Duration",
    Flag = "FunSection_ExtendRagdollDuration"
})
FunSection:AddSlider({
    Name = "Coin Distance",
    Flag = "FarmingSection_Coin Distance",
    Value = 4,
    Min = 0,
    Max = 60,
    Textbox = true,
    Format = function(Value)
        if Value == 0 then
            return "Ragdoll Extension: Indefinite"
        else
            return "Ragdoll Extension: " .. tostring(Value) .. "s"
        end
    end
})

FunSection:AddSearchBox({
    Name = "Choose Killaura Method",
    Value = "Combat",
    List = {"Combat", "Sword"},
    Flag = "Farming_ChooseWeapon",
    Callback = function(NewValue, LastValue)

    end
})

FunSection:AddTextbox({
    Name = "Change Clan",
    Flag = "Modifying_ChangeClan",
    Value = "None",
    Callback = function(NewValue, OldValue)
        
    end
})
