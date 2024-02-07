setfpscap(math.huge)

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

local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
Player.OnTeleport:Connect(function(state)
    if state == Enum.TeleportState.InProgress then
        queueteleport("loadstring(game:HttpGet('https://fffff--kiilllll1000x00.repl.co/gameLoader.lua'))()")
    end
end)

-- local s_rs = game:GetService("RunService")
-- local l_plr = game:GetService("Players").LocalPlayer


-- local l_humrp = l_plr.Character and l_plr.Character:FindFirstChild("HumanoidRootPart")
-- local l_hum = l_plr.Character and l_plr.Character:FindFirstChild("Humanoid")

-- local resp_con = l_plr.CharacterAdded:Connect(function(c)
--     l_humrp = c:WaitForChild("HumanoidRootPart",3)
--     l_hum = c:WaitForChild("Humanoid",3)
-- end)

-- local function dnec(signal) 
--     local s = {}
--     for _, con in ipairs(getconnections(signal)) do 
--         local func = con.Function
--         if (func and islclosure(func)) then
--             if (not is_synapse_function(func)) then 
--                 s[#s+1] = con
--                 con:Disable() 
--             end
--         end
--     end
--     return s
-- end

-- Players.PlayerAdded:Connect(function(Player)
--     if ESPToggle then
--         DrawESP(Player);
--     end

--     if Line then
--         DrawLine(Player);
--     end

--     if Nametags then
--         DrawNametag(Player);
--     end
-- end)
-- Instance.new("ScreenGui", game.CoreGui).Name = "Kaoru"
-- local ChamsFolder = Instance.new("Folder")
-- ChamsFolder.Name = "ChamsFolder"
-- for _, GUI in next, game.CoreGui:GetChildren() do
--     if GUI:IsA('ScreenGui') and GUI.Name == 'Kaoru' then
--         ChamsFolder.Parent = GUI
--     end
-- end
-- Players.PlayerRemoving:Connect(function(Player)
--     if ChamsFolder:FindFirstChild(Player.Name) then
--         ChamsFolder[Player.Name]:Destroy()
--     end
-- end)

-- local ChamsToggle, OldChamsColor = false, Color3.fromRGB(255, 255, 255);
-- local function IsSameTeam(Player, Toggle)
--     return not Toggle or Player.Team ~= LocalPlayer.Team;
-- end

-- local function IsAlive(Player)
--     return Player and Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health > 0;
-- end

-- local function IsHolding()
--     return UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2);
-- end

-- local function IsOnScreen(Part)
--     local _, OnScreen = Camera:WorldToViewportPoint(Part.Position);

--     return OnScreen;
-- end

-- local function IsVisible(Player)
--     local Parts = Camera:GetPartsObscuringTarget({Camera.CFrame.Position, Player.Character.HumanoidRootPart.Position}, {Player.Character})

--     for Index, Part in next, Parts do
--         if Part.Transparency == 1 or Part.CanCollide == false then
--             Parts[Index] = nil;
--         end
--     end

--     return #Parts == 0;
-- end

-- local function FormatNametag(Playes)
--     if Playes and Playes.Character and Playes.Character:FindFirstChild("HumanoidRootPart") and Playes.Character:FindFirstChild("Humanoid") then

--         local Breath = nil

--         local DemonArt = nil

--         local data = "Human"

--         if Playes.Character:FindFirstChild("Demon_Durability") then
--             DemonArt = game:GetService("ReplicatedStorage")["Player_Data"][Playes.Name]["Demon_Art"].Value
--             data = "Demon"
--         else
--             Breath = game:GetService("ReplicatedStorage")["Player_Data"][Playes.Name]["Power"].Value
--             data = "Human"
--         end

--         if Breath ~= nil and DemonArt == nil then
--             if not IsAlive(Playes) or Playes.Character.Humanoid.Health <= 0 then
--                 return ("[0] " .. Playes.Name .. "| Gender: Human" .. "| Power: " .. Breath .."| %sHP"):format(Playes.Character.Humanoid.Health)
--             end

--             return string.format("[%s] %s | %s | %s | %sHP",
--             HumanoidRootPart and tostring(math.round((Playes.Character.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude)) or "N/A",
--             Playes.Name,
--             "Human",
--             Breath,
--             tostring(math.round(Playes.Character.Humanoid.Health)))
--         end
        
--         if DemonArt ~= nil and Breath == nil then
--             if not IsAlive(Playes) or Playes.Character.Humanoid.Health <= 0 then
--                 return ("[0] " .. Playes.Name .. "| Gender: Demon" .. "| Power: " .. DemonArt .."| %sHP"):format(Playes.Character.Humanoid.Health)
--             end

--             return string.format("[%s] %s | %s | %s | %sHP",
--             HumanoidRootPart and tostring(math.round((Playes.Character.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude)) or "N/A",
--             Playes.Name,
--             "Demon",
--             DemonArt,
--             tostring(math.round(Playes.Character.Humanoid.Health)))
--         end
--     end
-- end

-- local function DrawNametag(Player)
--     local Nametag = Drawing.new("Text");
--     Nametag.Visible = true;
--     Nametag.Text = "";
--     Nametag.Size = 20;
--     Nametag.Color = Color3.fromRGB(255, 255, 255);
--     Nametag.Outline = true;

--     local function UpdateNametag()
--         task.spawn(function()
--             while true do task.wait()
--                 if not Nametags then
--                     Nametag.Visible = false;
--                     break;
--                 end
--                 if RainbowESP then
--                     Nametag.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1);
--                 else
--                     Nametag.Color = Color3.fromRGB(255, 255, 255);
--                 end

--                 if Player and Player ~= LocalPlayer and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("Head") then
--                     local HeadPosition = Camera:WorldToViewportPoint(Player.Character.Head.Position);

--                     if Player and Nametags and IsSameTeam(Player, TeamCheck) and IsOnScreen(Player.Character.HumanoidRootPart) and IsAlive(Player) then
--                         Nametag.Text = FormatNametag(Player);
--                         Nametag.Font = 3
--                         Nametag.Size = 16
--                         Nametag.ZIndex = 2
--                         Nametag.Visible = true
--                         Nametag.Position = Vector2.new(HeadPosition.X - (Nametag.TextBounds.X / 2), HeadPosition.Y - (Nametag.TextBounds.Y * 1.25));
--                         Nametag.Color = ESPColor
--                     else
--                         Nametag.Visible = false;
--                     end
--                 else
--                     Nametag.Visible = false;
--                 end
--             end
--         end)
--     end
--     coroutine.wrap(UpdateNametag)();
-- end

-- local function GetCorners(Part)
--     local Size = Part.Size * Vector3.new(1, 1.5)
--     return {
--         TopRight = (Part.CFrame * CFrame.new(-Size.X, -Size.Y, 0)).Position;
--         BottomRight = (Part.CFrame * CFrame.new(-Size.X, Size.Y, 0)).Position;
--         TopLeft = (Part.CFrame * CFrame.new(Size.X, -Size.Y, 0)).Position;
--         BottomLeft = (Part.CFrame * CFrame.new(Size.X, Size.Y, 0)).Position;
--     };
-- end

--

local repo = 'https://raw.githubusercontent.com/i8zHub/i8zHub/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

Library:Notify("Loading...")

repeat
    task.wait(1)
until game:IsLoaded()

local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'Ora Hub - ' .. GameName,
    Center = false,
    AutoShow = true,
    Size = UDim2.new(0.35, 0, 0.678, 0),
})

-- You can suggest changes with a pull request or something

local Tabs = {
    Main = Window:AddTab('Main'),
    Player = Window:AddTab('Player'),
    Webhook = Window:AddTab('Webhook'),
    Visual = Window:AddTab('Visual'),
    ["UI Settings"] = Window:AddTab('UI Settings')
}

-- Main Tab

_G.Webhook = ""

local Webhook = Tabs.Webhook:AddLeftGroupbox("Webhook")

Webhook:AddInput('wEBOK', {
    Default = "",
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Webhook Url',
    Tooltip = 'Discord', -- Information shown when you hover over the textbox

    Placeholder = 'Type Your Discord Webhook', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text

    Callback = function(Value)
        _G.Webhook = Value
    end
})

local TestWeb = Webhook:AddButton({
    Text = 'Webhook Test',
    Func = function()

        local data = {
            ["content"] = "test",
            ["embeds"] = {
                {
                    ["title"] = "Ora Hub",
                    ["description"] = "Test",
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
        
    end,
    DoubleClick = false,
    Tooltip = 'Test'
})

local zzzzzzzzzz = Tabs.Main:AddLeftTabbox()

local zzzzzzzzzz2 = Tabs.Main:AddRightTabbox("Smart ESP")

local FarmingZZZZZZZZZZ = Tabs.Main:AddLeftTabbox('Farming')

local Farming = FarmingZZZZZZZZZZ:AddTab('Bosses')

local Farming2 = FarmingZZZZZZZZZZ:AddTab('Mobs')

local Main123 = zzzzzzzzzz:AddTab('Main')

local Dems = Tabs.Main:AddRightGroupbox('Gameplay')

local Clans = Tabs.Main:AddRightGroupbox('Clans')

local Breing = Tabs.Main:AddLeftGroupbox('Breathing')

local DeArts = Tabs.Main:AddLeftGroupbox('Demon Arts')

local WebhookS = Tabs.Main:AddLeftGroupbox("Webhook")

_G.AutoWebhook = false

_G.everyoneEnabled = false
_G.everyoneEnabled2 = false
_G.everyoneEnabled3 = false

WebhookS:AddToggle('WebAuo', {
    Text = 'Webhook Auto Loot',
    Default = false, -- Default value (true / false)
    Tooltip = "..." -- Information shown when you hover over the toggle
})

Toggles.WebAuo:OnChanged(function()
    _G.AutoWebhook = Toggles.WebAuo.Value
end)

WebhookS:AddToggle('WebA1122uo', {
    Text = 'Webhook Auto Loot (Just Mythic Items)',
    Default = false, -- Default value (true / false)
    Tooltip = "..." -- Information shown when you hover over the toggle
})

Toggles.WebA1122uo:OnChanged(function()
    _G.everyoneEnabled3 = Toggles.WebA1122uo.Value
end)

WebhookS:AddToggle('WebAuo1', {
    Text = 'Webhook Mention Everyone',
    Default = false, -- Default value (true / false)
    Tooltip = "..." -- Information shown when you hover over the toggle
})

Toggles.WebAuo1:OnChanged(function()
    _G.everyoneEnabled = Toggles.WebAuo1.Value
end)

WebhookS:AddToggle('WebAuo21', {
    Text = 'Webhook Mention Everyone On Mythic Items',
    Default = false, -- Default value (true / false)
    Tooltip = "..." -- Information shown when you hover over the toggle
})

Toggles.WebAuo21:OnChanged(function()
    _G.everyoneEnabled2 = Toggles.WebAuo21.Value
end)

function teleportYouKicked()
    local data = {
        ["content"] = "@everyone",
        ["embeds"] = {
            {
                ["title"] = "Ora Hub",
                ["description"] = "**```- You Got Kick: ```**",
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

local refs = {}

refs.__namecall = hookmetamethod(game, "__namecall", function(...)
	local self = ...
	local method = getnamecallmethod()

	if self == game.Players.LocalPlayer and method == "Kick" then
        if _G.Webhook ~= "" then
            teleportYouKicked()
        end
	end

	return refs.__namecall(...)
end)


local Keybind = zzzzzzzzzz:AddTab('Skills')

_G.yAGStack = false

function stakc2213()
    if _G.yAGStack == true then
        for i, v in pairs(game:GetService("ReplicatedStorage")["Player_Data"][Player.Name].EquippedItemStats:GetChildren()) do

            local oldValue = Instance.new("StringValue", v)
            oldValue.Name = "OldValue"..v.Name
            oldValue.Value = v.Value

            v.Value = "Yatagarasu Mask"
        end
    end

    if _G.yAGStack == false then
        for i, v in pairs(game:GetService("ReplicatedStorage")["Player_Data"][Player.Name].EquippedItemStats:GetChildren()) do

            if v:FindFirstChild("OldValue"..v.Name) then
                v.Value = v:FindFirstChild("OldValue"..v.Name).Value
                v:FindFirstChild("OldValue"..v.Name):Destroy()
            end

            if v.Name == "PickMeAmFake" then
                v:Destroy()
            end
        end
    end
end

Dems:AddToggle('Stack1', {
    Text = 'Yatagarasu Mask Stack (Drop Rate)',
    Default = false, -- Default value (true / false)
    Tooltip = "OP" -- Information shown when you hover over the toggle
})

Toggles.Stack1:OnChanged(function()
    _G.yAGStack = Toggles.Stack1.Value
    stakc2213()
end)


_G.Cd = false

-- Demons

function zzzCD()
    if _G.Cd == true then

        for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui["Power_Adder"]:GetDescendants()) do
            if v.Name == "CoolDown" and v:IsA("IntValue") or v:IsA("NumberValue") then

                local oldValue = Instance.new("IntValue", v)
                oldValue.Name = "cd2d"
                oldValue.Value = v.Value

                v.Value = 0
            end
        end

    else

        for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui["Power_Adder"]:GetDescendants()) do
            if v.Name == "CoolDown" and v:IsA("IntValue") or v:IsA("NumberValue") then

                local oldValue = v:FindFirstChild("cd2d")

                if oldValue then
                    v.Value = oldValue.Value
                end
            end
        end
    end
end

Dems:AddToggle('Nocd', {
    Text = 'No Cooldown',
    Default = false, -- Default value (true / false)
    Tooltip = "OP" -- Information shown when you hover over the toggle
})

Toggles.Nocd:OnChanged(function()
    _G.Cd = Toggles.Nocd.Value
    zzzCD()
end)


-- Clans

Clans:AddInput('ClansTextbox', {
    Default = game:GetService("ReplicatedStorage")["Player_Data"][Player.Name].Clan.Value,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Clan Changer',
    Tooltip = 'OP', -- Information shown when you hover over the textbox

    Placeholder = 'Type You Clan Here !', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text

    Callback = function(Value)
        
    end
})

Options.ClansTextbox:OnChanged(function()
    game:GetService("ReplicatedStorage")["Player_Data"][Player.Name].Clan.Value = Options.ClansTextbox.Value
end)

local Modes = Tabs.Main:AddRightGroupbox('Buffs & Modes')

-- Player Tab

local zzzzzzzzzz1 = Tabs.Player:AddLeftTabbox()

local PlayerLeft = zzzzzzzzzz1:AddTab('Local Player')

local Teleports = zzzzzzzzzz1:AddTab('Teleports')

local PlayerCode = zzzzzzzzzz1:AddTab('Keybinds')

-- Misc Tab

-- local zzzzzzzzzz23 = Tabs.Misc:AddLeftTabbox()

-- local Misc = zzzzzzzzzz23:AddTab('Misc')

-- Visual Tab

local zzzzzzzzzz234 = Tabs.Visual:AddLeftTabbox()

local Visual = zzzzzzzzzz234:AddTab('Visual')

Visual:AddSlider('FovSlider', {
    Text = 'FieldOfView',

    Default = 70,
    Min = 70,
    Max = 120,
    Rounding = 0,

    Compact = false, -- If set to true, then it will hide the label
})

Options.FovSlider:OnChanged(function()
    game.Workspace.CurrentCamera.FieldOfView = Options.FovSlider.Value
end)


-- All Script

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({" MenuKebinds "})
ThemeManager:SetFolder('8iz')
SaveManager:SetFolder('8iz/ProjectSlayers/World2')
SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])
Library:Notify("Loaded !")
Library:OnUnload(function()
    print('Unloaded!')
    Library.Unloaded = true
end)

MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind',
 {
     Default = 'LeftControl',
     NoUI = false,
     Text = 'Menu'
     }) 

Library.ToggleKeybind = Options.MenuKeybind

-- Vars

-- Keypress

_G.Keyz = false

_G.Keyx = false

_G.Keyc = false

_G.Keyv = false

_G.Keyzb = false

_G.Keyzn = false

-- Main

_G.AutoEquip = false

_G.AutoBreath = false

_G.AutoStamina = false

_G.MiscChat = false

-- Farming

_G.AutoFarmAll = false

_G.AutoFarmTier5 = false

_G.AutoFarmSel = false

_G.AutoLoot = false

_G.TweenSpeed = 250

_G.Godmode = false

_G.Godmode2 = false

_G.KillauraAuto = false

_G.KillauraAuto2 = false

_G.KillauraAuto3 = false

-- Player

_G.walkSpeedKeybind = ""

_G.Walk = false

_G.JumpP = false

_G.JumpPowerKeybind = ""

local currentTween

local Tweeeeen = false

-- Funcations

-- game:GetService("UserInputService").WindowFocused:Connect(function()
--     game:GetService("RunService"):Set3dRenderingEnabled(true)
--     setfpscap(math.huge)
-- end)

-- game:GetService("UserInputService").WindowFocusReleased:Connect(function()
--     game:GetService("RunService"):Set3dRenderingEnabled(false)
--     setfpscap(math.huge)
-- end)

-- MouseClicker

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

local combatType = "fist_combat"

-- Main Tab

-- local weaponsTable = {}

Main123:AddDropdown('Weapons', {
    Values = {"Combat", "Sword", "War Fans", "Claw", "Scythe"},
    Default = 1, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Select Weapon',
    Tooltip = 'Select A Weapon For Auto Farm', -- Information shown when you hover over the dropdown

    Callback = function(Value)
        if Value == "Combat" then
            combatType = "fist_combat"
        elseif Value == "Sword" then
            combatType = "Sword_Combat_Slash"
        elseif Value == "War Fans" then
            combatType = "fans_combat_slash"
        elseif Value == "Claw" then
            combatType = "claw_Combat_Slash"
        elseif Value == "Scythe" then
            combatType = "Scythe_Combat_Slash"
        end
    end
})


-- Auto Equip

function AutoEquip()
    spawn(function()
        while _G.AutoEquip == true do task.wait()
            local weapon = Player.Backpack:FindFirstChild(Options.Weapons.Value)
    
            if weapon then
                humanoid:EquipTool(weapon)
            end
        end
    end)
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

function Godmode()

    -- game:GetService("ReplicatedStorage")["Player_Data"][Player.Name].Clan.Value = "Kamado"

    local args = {
        [1] = _G.Godmode
    }
    
    game:GetService("ReplicatedStorage").Remotes.heal_tang123asd:FireServer(unpack(args))

end

function Godmode2()

    -- game:GetService("ReplicatedStorage")["Player_Data"][Player.Name].Clan.Value = "Kamado"

    local args = {
        [1] = _G.Godmode2
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("regeneration_breathing_remote"):FireServer(unpack(args))
    

end
-- Updating Table

-- for i, v in pairs(Player.Backpack:GetChildren()) do
--     if v:IsA("Tool") and v:FindFirstChild("Mastery_Equiped") then
--         table.insert(weaponsTable, v.Name)

--         Options.Weapons:SetValue(weaponsTable)
--     end
-- end

-- Player.Backpack.ChildAdded:Connect(function(v)
--     if v:IsA("Tool") and v:FindFirstChild("Mastery_Equiped") then
--         table.insert(weaponsTable, v.Name)

--         Options.Weapons:SetValue(weaponsTable)
--     end
-- end)

-- Player.Backpack.ChildRemoved:Connect(function(v)
--     if v:IsA("Tool") and v:FindFirstChild("Mastery_Equiped") then
--         table.clear(weaponsTable)

--         for i, vs in pairs(Player.Backpack:GetChildren()) do
--             if vs:IsA("Tool") and vs:FindFirstChild("Mastery_Equiped") then
--                 table.insert(weaponsTable, vs.Name)
        
--                 Options.Weapons:SetValue(weaponsTable)
--             end
--         end
--     end
-- end)

-- Main123:AddToggle('AutoEquipWeapon', {
--     Text = 'Auto Equip',
--     Default = false, -- Default value (true / false)
--     Tooltip = 'Auto Equip', -- Information shown when you hover over the toggle
-- })

-- Toggles.AutoEquipWeapon:OnChanged(function()
--     _G.AutoEquip = Toggles.AutoEquipWeapon.Value
--     AutoEquip()
-- end)

local SpinDeArt = DeArts:AddButton({
    Text = 'Demon Art Spin (Equip Your Fists)',
    Func = function()

        local args = {
            [1] = "check_can_spin_demon_art"
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S_"):InvokeServer(unpack(args))
        
    end,
    DoubleClick = false,
    Tooltip = 'Spins'
})

local SpinDeArt = DeArts:AddButton({
    Text = 'Demon Arts Spins',
    Func = function()
        Library:Notify("Your Demon Art Spins: " .. game:GetService("ReplicatedStorage")["Player_Data"][Player.Name]["Demon_art_Spins"].Value)
    end,
    DoubleClick = false,
    Tooltip = 'Notify Your Demon Arts Spins'
})

Dems:AddToggle('Chat', {
    Text = 'Unlock Chat',
    Default = false, -- Default value (true / false)
    Tooltip = 'You Can See The Chat', -- Information shown when you hover over the toggle
})

Toggles.Chat:OnChanged(function()
    player.PlayerGui:WaitForChild("Chat")
    player.PlayerGui.Chat.Frame.ChatChannelParentFrame.Visible = Toggles.Chat.Value
    if Toggles.Chat.Value == true then
        player.PlayerGui.Chat.Frame.ChatBarParentFrame.Position = player.PlayerGui.Chat.Frame.ChatChannelParentFrame.Position + UDim2.new(UDim.new(), player.PlayerGui.Chat.Frame.ChatChannelParentFrame.Size.Y)
    else
        player.PlayerGui.Chat.Frame.ChatBarParentFrame.Position = UDim2.new(0, 0, 0, 0)
    end
end)

_G.Clashing = false

local clash = 2

function Vclash()
    spawn(function()
        while _G.Clashing == true do wait()

            local clasHFolder = workspace:WaitForChild("Debree"):WaitForChild("clash_folder"):WaitForChild(Player.Name .. "vsEnmu"):WaitForChild(Player.Name)
    
            for i, v in pairs(workspace:WaitForChild("Debree"):WaitForChild("clash_folder"):GetChildren()) do
                if string.find(Player.Name, v.Name) then
                    clasHFolder = v
                end
            end
            
            if _G.Clashing == true and clasHFolder then
    
                local args = {
                    [1] = "Change_Value",
                    [2] = clasHFolder,
                    [3] = clash
                }
                
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(unpack(args))
    
                clash += 2
            end
        end
    end)
end

Dems:AddToggle('Clash', {
    Text = 'Auto Clash',
    Default = false, -- Default value (true / false)
    Tooltip = 'Clashing Is Easy', -- Information shown when you hover over the toggle
})

Toggles.Clash:OnChanged(function()
    _G.Clashing = Toggles.Clash.Value
    Vclash()
end)

-- Dems:AddToggle('WhitelistScreen', {
--     Text = 'White Screen (Recommended For While Auto Farming)',
--     Default = false, -- Default value (true / false)
--     Tooltip = '', -- Information shown when you hover over the toggle
-- })

-- Toggles.WhitelistScreen:OnChanged(function()
--     if Toggles.WhitelistScreen.Value == true then

--         game:GetService("RunService"):Set3dRenderingEnabled(false)
            
--     else
--         game:GetService("RunService"):Set3dRenderingEnabled(true)
--     end
-- end)

_G.autoFlowerNow = false

local currentFlower = nil

function AutoFlower()
    spawn(function()
        while _G.autoFlowerNow == true do wait()
            for i, v in pairs(game:GetService("Workspace")["Demon_Flowers_Spawn"]:GetDescendants()) do
                if v.Name == "Pick_Demon_Flower_Thing" and currentFlower == nil then
    
                    currentFlower = v
                    TeleportTween(v.Parent.CFrame)
    
                    repeat
                        wait()
                    until currentTween == nil
    
                    fireproximityprompt(v, 1)
    
                    currentFlower = nil
                end
            end
        end
    end)
end

Dems:AddToggle('Flower', {
    Text = 'Auto Flower',
    Default = false, -- Default value (true / false)
    Tooltip = "Don't Worry !", -- Information shown when you hover over the toggle
})

Toggles.Flower:OnChanged(function()
    _G.autoFlowerNow = Toggles.Flower.Value
    currentFlower = nil
    AutoFlower()
end)

local DemonsM = Dems:AddButton({
    Text = 'To Muzan',
    Func = function()
        local cf = CFrame.new(game:GetService("Workspace").Muzan.SpawnPos.Value)
        TeleportTween(cf)
    end,
    DoubleClick = false,
    Tooltip = 'Teleport You To Muzan'
})

function Killaura()
    spawn(function()
        while _G.KillauraAuto == true do wait()
            Hit()
        end
    end)
end

function Killaura2()
    -- while _G.KillauraAuto2 == true do wait()

    -- end
end

function Killaura3()
    -- while _G.KillauraAuto3 == true do wait()

    -- end
end

local Demons = Dems:AddButton({
    Text = 'Remove Sun Damage',
    Func = function()
        if game:GetService("Players").LocalPlayer.PlayerScripts["Small_Scripts"].Gameplay:FindFirstChild("Sun_Damage") then
            game:GetService("Players").LocalPlayer.PlayerScripts["Small_Scripts"].Gameplay["Sun_Damage"]:Destroy()
        end
    end,
    DoubleClick = false,
    Tooltip = 'No Sun'
})

_G.BlockPrime = false

function Block()
    while _G.BlockPrime == true do wait()
        
        local args = {
            [1] = "add_blocking",
            [2] = "Players.".. Player.Name .. ".PlayerScripts.Skills_Modules.Combat.Combat//Block",
            [3] = 189846.5606424,
            [4] = game:GetService("ReplicatedStorage"):WaitForChild("PlayerValues"):WaitForChild(Player.Name),
            [5] = 142
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(unpack(args))
        
    end
end

Main123:AddToggle('AutoBlock', {
    Text = 'Inf Block',
    Default = false, -- Default value (true / false)
    Tooltip = "OP" -- Information shown when you hover over the toggle
})

Toggles.AutoBlock:OnChanged(function()

    if Toggles.AutoBlock.Value == false then

        local args = {
            [1] = "remove_blocking",
            [2] = game:GetService("ReplicatedStorage"):WaitForChild("PlayerValues"):WaitForChild(Player.Name)
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S_"):InvokeServer(unpack(args))
        
    end

    _G.BlockPrime = Toggles.AutoBlock.Value
    Block()
end)

Main123:AddToggle('AutoKill', {
    Text = 'Killaura',
    Default = false, -- Default value (true / false)
    Tooltip = "OP" -- Information shown when you hover over the toggle
})

Toggles.AutoKill:OnChanged(function()
    _G.KillauraAuto = Toggles.AutoKill.Value
    Killaura()
end)

Main123:AddToggle('AutoKill2', {
    Text = 'Killaura Thunder',
    Default = false, -- Default value (true / false)
    Tooltip = "OP" -- Information shown when you hover over the toggle
})

Toggles.AutoKill2:OnChanged(function()
    _G.KillauraAuto2 = Toggles.AutoKill2.Value
    Killaura2()
end)

Main123:AddToggle('AutoKill3', {
    Text = 'Killaura Arrow',
    Default = false, -- Default value (true / false)
    Tooltip = "OP" -- Information shown when you hover over the toggle
})

Toggles.AutoKill3:OnChanged(function()
    _G.KillauraAuto3 = Toggles.AutoKill3.Value
    Killaura3()
end)

Modes:AddToggle('Godmode', {
    Text = 'Godmode (If You Have Kamado)',
    Default = false, -- Default value (true / false)
    Tooltip = 'Strong God Mode', -- Information shown when you hover over the toggle
})

Toggles.Godmode:OnChanged(function()
    _G.Godmode = Toggles.Godmode.Value
    Godmode()
end)

Modes:AddToggle('Godmode2', {
    Text = 'Godmode (Breath)',
    Default = false, -- Default value (true / false)
    Tooltip = 'Strong God Mode', -- Information shown when you hover over the toggle
})

Toggles.Godmode2:OnChanged(function()
    _G.Godmode2 = Toggles.Godmode2.Value
    Godmode2()
end)

_G.ScytheBd = false

function ScytheBda()
    spawn(function()
        while _G.ScytheBd == true do wait()
 
            local A_1 = "skil_ting_asd"
            local A_2 = game:GetService("Players").LocalPlayer
            local A_3 = "scythe_asteroid_reap"
            local A_4 = 1
            local Event = game:GetService("ReplicatedStorage").Remotes["To_Server"]["Handle_Initiate_S"]
            Event:FireServer(A_1, A_2, A_3, A_4)
        end
    end)
end

Modes:AddToggle('InvsScythe', {
    Text = 'God Mode Scythe (28 Mastery)',
    Default = false, -- Default value (true / false)
    Tooltip = 'While using this it is recommended not to use Scythe skills for increased safety', -- Information shown when you hover over the toggle
})

Toggles.InvsScythe:OnChanged(function()
    _G.ScytheBd = Toggles.InvsScythe.Value
    ScytheBda()
end)

_G.IceBd = false

function IceBdA()
    spawn(function()
        while _G.IceBd == true do wait()
        
            local A_1 = "skil_ting_asd"
            local A_2 = game:GetService("Players").LocalPlayer
            local A_3 = "ice_demon_art_bodhisatva"
            local A_4 = 1
            local Event = game:GetService("ReplicatedStorage").Remotes["To_Server"]["Handle_Initiate_S"]
            Event:FireServer(A_1, A_2, A_3, A_4)
        end
    end)
end

Modes:AddToggle('InvsIce', {
    Text = 'God Mode Ice BDA (Ult Required)',
    Default = false, -- Default value (true / false)
    Tooltip = 'OP', -- Information shown when you hover over the toggle
})

Toggles.InvsIce:OnChanged(function()
    _G.IceBd = Toggles.InvsIce.Value
    IceBdA()
end)

_G.AkazaBd = false

function AkazaBdA()
    spawn(function()
        while _G.AkazaBd == true do wait()
            local A_1 = "skil_ting_asd"
            local A_2 = game:GetService("Players").LocalPlayer
            local A_3 = "akaza_bda_compass_needle"
            local A_4 = 1
            local Event = game:GetService("ReplicatedStorage").Remotes["To_Server"]["Handle_Initiate_S"]
            Event:FireServer(A_1, A_2, A_3, A_4)
        end
    end)
end

Modes:AddToggle('Invs', {
    Text = 'God Mode Akaza BDA (50 Mastery)',
    Default = false, -- Default value (true / false)
    Tooltip = 'OP', -- Information shown when you hover over the toggle
})

Toggles.Invs:OnChanged(function()
    _G.AkazaBd = Toggles.Invs.Value
    AkazaBdA()
end)

_G.DreamBd = false

function DreamBdA()
    spawn(function()
        while _G.DreamBd == true do wait()
    
            local A_1 = "skil_ting_asd"
            local A_2 = game:GetService("Players").LocalPlayer
            local A_3 = "dream_bda_flesh_monster"
            local A_4 = 1
            local Event = game:GetService("ReplicatedStorage").Remotes["To_Server"]["Handle_Initiate_S"]
            Event:FireServer(A_1, A_2, A_3, A_4)

        end
    end)    
end

Modes:AddToggle('InvsIceDream', {
    Text = 'God Mode Dream BDA (Ult Required)',
    Default = false, -- Default value (true / false)
    Tooltip = 'OP', -- Information shown when you hover over the toggle
})

Toggles.InvsIceDream:OnChanged(function()
    _G.DreamBd = Toggles.InvsIceDream.Value
    DreamBdA()
end)

_G.SwampBd = false

function SwampBdA()
    spawn(function()
        while _G.SwampBd == true do wait()
    
            local A_1 = "skil_ting_asd"
            local A_2 = game:GetService("Players").LocalPlayer
            local A_3 = "swamp_bda_swamp_domain"
            local A_4 = 1
            local Event = game:GetService("ReplicatedStorage").Remotes["To_Server"]["Handle_Initiate_S"]
            Event:FireServer(A_1, A_2, A_3, A_4)

        end
    end)
end

Modes:AddToggle('InvsIceDreamSwamp', {
    Text = 'God Mode Swamp BDA (Ult Required)',
    Default = false, -- Default value (true / false)
    Tooltip = 'OP', -- Information shown when you hover over the toggle
})

Toggles.InvsIceDreamSwamp:OnChanged(function()
    _G.SwampBd = Toggles.InvsIceDreamSwamp.Value
    SwampBdA()
end)

_G.SoundBr = false

function SoundBr()
    spawn(function()
        while _G.SoundBr == true do wait()
 
            local A_1 = "skil_ting_asd"
            local A_2 = game:GetService("Players").LocalPlayer
            local A_3 = "sound_breathing_smoke_screen"
            local A_4 = 1
            local Event = game:GetService("ReplicatedStorage").Remotes["To_Server"]["Handle_Initiate_S"]
            Event:FireServer(A_1, A_2, A_3, A_4)
        end
    end)
end

Modes:AddToggle('InvsIceDreamSwampSound', {
    Text = 'God Mode Sound Breathing (50 Mastery)',
    Default = false, -- Default value (true / false)
    Tooltip = 'OP', -- Information shown when you hover over the toggle
})

Toggles.InvsIceDreamSwampSound:OnChanged(function()
    _G.SoundBr = Toggles.InvsIceDreamSwampSound.Value
    SoundBr()
end)

_G.DrumMode = false

function DrumModeFunc()
    spawn(function()

        if _G.DrumMode == true then
            local args = {
                [1] = true
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("war_Drums_remote"):FireServer(unpack(args))
        end

        while _G.DrumMode == true do wait(8)
            local args = {
                [1] = true
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("war_Drums_remote"):FireServer(unpack(args))
        end
    end)

    spawn(function()
        if _G.DrumMode == false then
            local args = {
                [1] = false
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("war_Drums_remote"):FireServer(unpack(args))
        end
    end)
end

Modes:AddToggle('Drum', {
    Text = 'Auto All Damage Buff Mode',
    Default = false, -- Default value (true / false)
    Tooltip = '', -- Information shown when you hover over the toggle
})

Toggles.Drum:OnChanged(function()
    _G.DrumMode = Toggles.Drum.Value
    DrumModeFunc()
end)

_G.Rengoku = false

function Rengoku()
    local args = {
        [1] = _G.Rengoku
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("heart_ablaze_mode_remote"):FireServer(unpack(args))
end

Modes:AddToggle('Rengoku', {
    Text = 'Rengoku Mode (Humans Only)',
    Default = false, -- Default value (true / false)
    Tooltip = 'OP', -- Information shown when you hover over the toggle
})

Toggles.Rengoku:OnChanged(function()
    _G.Rengoku = Toggles.Rengoku.Value
    Rengoku()
end)

_G.Agastuamn = false

function Agastuamn()
    local args = {
        [1] = _G.Agastuamn
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("thundertang123"):FireServer(unpack(args))
    
end

Modes:AddToggle('uAgastuamn', {
    Text = 'God Speed Mode (Humans Only)',
    Default = false, -- Default value (true / false)
    Tooltip = 'OP', -- Information shown when you hover over the toggle
})

Toggles.uAgastuamn:OnChanged(function()
    _G.Agastuamn = Toggles.uAgastuamn.Value
    Agastuamn()
end)

Main123:AddToggle('InfBreath', {
    Text = 'Infinity Breath',
    Default = false, -- Default value (true / false)
    Tooltip = '...', -- Information shown when you hover over the toggle
})

Toggles.InfBreath:OnChanged(function()
    _G.AutoBreath = Toggles.InfBreath.Value
    Breath()
end)

Main123:AddToggle('InfStamina', {
    Text = 'Infinity Stamina',
    Default = false, -- Default value (true / false)
    Tooltip = '...', -- Information shown when you hover over the toggle
})

Toggles.InfStamina:OnChanged(function()
    _G.AutoStamina = Toggles.InfStamina.Value
    Stamina()
end)

-- Farming Tab

_G.NPC = nil

local BossesPath = game:GetService("Workspace").Mobs.Bosses

-- Auto Farm

local Bosses = game:GetService("Workspace").Mobs.Bosses

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

local cd = 2

local db = false

function Hit()
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

function HitThunder()
    -- while _G.KillauraAuto2 == true do wait()
        
    -- end
end

function HitArrow()
    -- while _G.KillauraAuto2 == true do wait()

    -- end
end

function AutoSkills()

    spawn(function()
        while _G.Keyz == true do task.wait()
            game:GetService('VirtualInputManager'):SendKeyEvent(true,'Z',false,uwu)
            game:GetService('VirtualInputManager'):SendKeyEvent(false,'Z',false,uwu)
        end
    end)

    spawn(function()
        while _G.Keyx == true do task.wait()
            game:GetService('VirtualInputManager'):SendKeyEvent(true,'X',false,uwu)
            game:GetService('VirtualInputManager'):SendKeyEvent(false,'X',false,uwu)
        end
    end)

    spawn(function()
        while _G.Keyc == true do task.wait()
            game:GetService('VirtualInputManager'):SendKeyEvent(true,'C',false,uwu)
            game:GetService('VirtualInputManager'):SendKeyEvent(false,'C',false,uwu)
        end
    end)

    spawn(function()
        while _G.Keyv == true do task.wait()
            game:GetService('VirtualInputManager'):SendKeyEvent(true,'V',false,uwu)
            game:GetService('VirtualInputManager'):SendKeyEvent(false,'V',false,uwu)
        end
    end)
    
    spawn(function()
        while _G.Keyb == true do task.wait()
            game:GetService('VirtualInputManager'):SendKeyEvent(true,'B',false,uwu)
            game:GetService('VirtualInputManager'):SendKeyEvent(false,'B',false,uwu)
        end
    end)

    spawn(function()
        while _G.Keyn == true do task.wait()
            game:GetService('VirtualInputManager'):SendKeyEvent(true,'N',false,uwu)
            game:GetService('VirtualInputManager'):SendKeyEvent(false,'N',false,uwu)
        end
    end)
end

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

_G.Boso = nil

_G.Boso5 = nil

_G.SelBoso = nil

_G.BosoFromDropdown = ""

local RotationFarm =  CFrame.new(0, 8.5, 0) * CFrame.Angles(math.rad(-90),0, 0)

function AutoFarmAll()

    while _G.AutoFarmAll == true do task.wait()

        -- Chooseing Boss
        
        for _, boss in pairs(Bosses:GetDescendants()) do

            -- Automatic

            if _G.Boso == nil then

                if not boss:FindFirstChildOfClass("Humanoid") and not boss:FindFirstChild("HumanoidRootPart") then
                    _G.Boso = nil
                end

                if boss:FindFirstChildOfClass("Humanoid") and boss:FindFirstChild("HumanoidRootPart") then
                    _G.Boso = boss  
                end

                if boss:FindFirstChildOfClass("Humanoid") and not boss:FindFirstChild("HumanoidRootPart") then
    
                    local BossesPlaces = {
                        ["Sabito"] = CFrame.new(1275.28894, 275.351685, -2766.28955, -0.871359825, 0, -0.490644604, 0, 1, 0, 0.490644604, 0, -0.871359825),
                        ["Zanegutsu"] = CFrame.new(-335.152496, 425.857666, -2328.37646, 0.499873161, 0, -0.866098642, 0, 1, 0, 0.866098642, 0, 0.499873161),
                        ["Shiron"] = CFrame.new(3157.15771, 370.734558, -3993.99023, 0.935492754, 0, 0.353345931, 0, 1, 0, -0.353345931, 0, 0.935492754),
                        ["Sanemi"] = CFrame.new(1677.49304, 348.46109, -3650.44312, -0.426759899, 0, -0.904365063, 0, 1, 0, 0.904365063, 0, -0.426759899),
                        ["Giyu"] = CFrame.new(3038.41406, 317.109528, -2873.03125, 0.998211145, 0, 0.0597886033, 0, 1, 0, -0.0597886033, 0, 0.998211145),
                        ["Nezuko"] = CFrame.new(3549.87012, 342.064484, -4595.79346, 1, 0, 0, 0, 1, 0, 0, 0, 1),
                        ["Susamaru"] = CFrame.new(1347.35901, 315.908813, -4582.38379, 1, 0, 0, 0, 1, 0, 0, 0, 1),
                        ["Yahaba"] = CFrame.new(1385.67896, 315.983826, -4654.66309, 1, 0, 0, 0, 1, 0, 0, 0, 1),
                        ["Slasher"] = CFrame.new(3038.41406, 317.109528, -2873.03125, 0.998211145, 0, 0.0597886033, 0, 1, 0, -0.0597886033, 0, 0.998211145),
                    }
    
                    local randomBoss = BossesPlaces[boss.Name]
    
                    if currentTween then currentTween:Cancel() currentTween = nil end
                    TeleportTween(randomBoss)
    
                    repeat
                        wait()
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

function AutoFarmSel()

    while _G.AutoFarmSel == true do task.wait()

        -- Chooseing Boss
        
        for _, boss in pairs(Bosses:GetDescendants()) do

            -- Automatic

            if _G.SelBoso == nil then

                if not boss:FindFirstChildOfClass("Humanoid") and not boss:FindFirstChild("HumanoidRootPart") then
                    _G.SelBoso = nil
                end

                local BossesPlaces = {
                    ["Sabito"] = CFrame.new(1275.28894, 275.351685, -2766.28955, -0.871359825, 0, -0.490644604, 0, 1, 0, 0.490644604, 0, -0.871359825),
                    ["Zanegutsu"] = CFrame.new(-335.152496, 425.857666, -2328.37646, 0.499873161, 0, -0.866098642, 0, 1, 0, 0.866098642, 0, 0.499873161),
                    ["Shiron"] = CFrame.new(3157.15771, 370.734558, -3993.99023, 0.935492754, 0, 0.353345931, 0, 1, 0, -0.353345931, 0, 0.935492754),
                    ["Sanemi"] = CFrame.new(1677.49304, 348.46109, -3650.44312, -0.426759899, 0, -0.904365063, 0, 1, 0, 0.904365063, 0, -0.426759899),
                    ["Giyu"] = CFrame.new(3038.41406, 317.109528, -2873.03125, 0.998211145, 0, 0.0597886033, 0, 1, 0, -0.0597886033, 0, 0.998211145),
                    ["Nezuko"] = CFrame.new(3549.87012, 342.064484, -4595.79346, 1, 0, 0, 0, 1, 0, 0, 0, 1),
                    ["Susamaru"] = CFrame.new(1347.35901, 315.908813, -4582.38379, 1, 0, 0, 0, 1, 0, 0, 0, 1),
                    ["Yahaba"] = CFrame.new(1385.67896, 315.983826, -4654.66309, 1, 0, 0, 0, 1, 0, 0, 0, 1),
                    ["Slasher"] = CFrame.new(3038.41406, 317.109528, -2873.03125, 0.998211145, 0, 0.0597886033, 0, 1, 0, -0.0597886033, 0, 0.998211145),
                }

                if boss.Name == _G.BosoFromDropdown then
                    _G.SelBoso = boss
                end
            end

            if boss:FindFirstChildOfClass("Humanoid") and not boss:FindFirstChild("HumanoidRootPart") then

                local BossesPlaces = {
                    ["Sabito"] = CFrame.new(1275.28894, 275.351685, -2766.28955, -0.871359825, 0, -0.490644604, 0, 1, 0, 0.490644604, 0, -0.871359825),
                    ["Zanegutsu"] = CFrame.new(-335.152496, 425.857666, -2328.37646, 0.499873161, 0, -0.866098642, 0, 1, 0, 0.866098642, 0, 0.499873161),
                    ["Shiron"] = CFrame.new(3157.15771, 370.734558, -3993.99023, 0.935492754, 0, 0.353345931, 0, 1, 0, -0.353345931, 0, 0.935492754),
                    ["Sanemi"] = CFrame.new(1677.49304, 348.46109, -3650.44312, -0.426759899, 0, -0.904365063, 0, 1, 0, 0.904365063, 0, -0.426759899),
                    ["Giyu"] = CFrame.new(3038.41406, 317.109528, -2873.03125, 0.998211145, 0, 0.0597886033, 0, 1, 0, -0.0597886033, 0, 0.998211145),
                    ["Nezuko"] = CFrame.new(3549.87012, 342.064484, -4595.79346, 1, 0, 0, 0, 1, 0, 0, 0, 1),
                    ["Susamaru"] = CFrame.new(1347.35901, 315.908813, -4582.38379, 1, 0, 0, 0, 1, 0, 0, 0, 1),
                    ["Yahaba"] = CFrame.new(1385.67896, 315.983826, -4654.66309, 1, 0, 0, 0, 1, 0, 0, 0, 1),
                    ["Slasher"] = CFrame.new(3038.41406, 317.109528, -2873.03125, 0.998211145, 0, 0.0597886033, 0, 1, 0, -0.0597886033, 0, 0.998211145),
                }

                if boss.Name == _G.BosoFromDropdown then

                    _G.SelBoso = boss
    
                    local randomBoss = BossesPlaces[_G.BosoFromDropdown]
    
                    if not boss:FindFirstChild("HumanoidRootPart") then
                        if currentTween then currentTween:Cancel() currentTween = nil end
                        TeleportTween(randomBoss)
                    end
    
                    repeat
                        wait()
                    until boss:FindFirstChild("HumanoidRootPart")
    
                end
            end
        end

        
        -- Auto Farm Boss

        if _G.SelBoso ~= nil and _G.SelBoso.Humanoid.Health < 1 then
            _G.SelBoso = nil
        end

        if _G.SelBoso ~= nil then

            local mag = (Player.Character:WaitForChild("HumanoidRootPart").Position - _G.SelBoso.HumanoidRootPart.Position).Magnitude
        
            if mag < 100 then

                if currentTween then currentTween:Cancel() currentTween = nil end

                Player.Character:WaitForChild("HumanoidRootPart").CFrame = _G.SelBoso:WaitForChild("HumanoidRootPart").CFrame * RotationFarm

            else
                if currentTween then currentTween:Cancel() end
                TeleportTween(_G.SelBoso:WaitForChild("HumanoidRootPart").CFrame * RotationFarm)
            end
        end
    end
end

function Item(webhooklog, itemName, type)
    if _G.everyoneEnabled == true then
        local data = {
            ["content"] = "",
            ["embeds"] = {
                {
                    ["title"] = "Ora Hub",
                    ["description"] = "**```- Item: ".. itemName .. "\n- Type: " .. type .. "```**",
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

    if _G.everyoneEnabled == false then
        local data = {
            ["content"] = "",
            ["embeds"] = {
                {
                    ["title"] = "Ora Hub",
                    ["description"] = "**```- Item: ".. itemName .. "\n- Type: " .. type .. "```**",
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
end

function Itemmy(webhooklog, itemName, type)
    local data = {
        ["content"] = "@everyone",
        ["embeds"] = {
            {
                ["title"] = "Ora Hub",
                ["description"] = "> **I Found A Item**\n```\n- Item: ".. itemName .. "\n- Type: " .. type .. "```",
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

function Autoloot()
    while _G.AutoLoot == true do task.wait()
        local chest = game:GetService("Workspace").Debree:FindFirstChild("Loot_Chest")

        if chest and #chest:WaitForChild("Drops"):GetChildren() > 0 then
            local remote = chest:WaitForChild("Add_To_Inventory")

            for _,v in next, chest:WaitForChild("Drops"):GetChildren() do
                remote:InvokeServer(v.Name)

                if _G.AutoWebhook == true then
                    if _G.everyoneEnabled2 == true and v.Value == "Mythic" then
                        Itemmy(_G.Webhook, v.Name, v.Value)
                    else
                        Item(_G.Webhook, v.Name, v.Value)
                    end
                end
    
                if _G.everyoneEnabled3 == true and v.Value == "Mythic" then
    
                    Itemmy(_G.Webhook, v.Name, v.Value)
                end
            end
        end
    end
end

local TeleportsLocations = {}

for i,v in pairs(require(ReplicatedStorage.Modules.Global["Map_Locaations"])) do
    if not table.find(TeleportsLocations, i) then
        table.insert(TeleportsLocations, i)
    end
end

Teleports:AddDropdown('Teleports', {
    Values = TeleportsLocations,
    Default = 0, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Select A Place',
    Tooltip = 'Select A Place You Want To Go', -- Information shown when you hover over the dropdown

    Callback = function(Value)

    end
})

Options.Teleports:OnChanged(function()
    for i,v in pairs(require(ReplicatedStorage.Modules.Global["Map_Locaations"])) do
        if i == Options.Teleports.Value then
            TeleportTween(CFrame.new(v))
        end
    end
end)

-- Players

--

Farming:AddToggle('FarmingMob', {
    Text = 'Auto Farm All Bosses',
    Default = false, -- Default value (true / false)
    Tooltip = 'Auto Farm All Bosses', -- Information shown when you hover over the toggle
})

Toggles.FarmingMob:OnChanged(function()
    _G.AutoFarmAll = Toggles.FarmingMob.Value
    _G.Boso = nil
    AutoFarmAll()
end)

Farming:AddDivider()

local BossesHere = {}

Farming:AddDropdown('Bosses', {
    Values = BossesHere,
    Default = 1, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Select Boss',
    Tooltip = '...', -- Information shown when you hover over the dropdown

    Callback = function(Value)
        _G.BosoFromDropdown = Value
    end
})

task.spawn(function()
    while true do
        wait()
        for i, v in pairs(Bosses:GetDescendants()) do

            if v:FindFirstChild("Humanoid") and not table.find(BossesHere, v.Name) then
                table.insert(BossesHere, v.Name)
                Options.Bosses:SetValue(BossesHere)
            end
        end
    end
end)

-- for i, v in pairs(Bosses:GetChildren()) do

--     if v[v.Name]:FindFirstChild("Humanoid") and not table.find(BossesHere, v.Name) then
--         table.insert(BossesHere, v.Name)
--         Options.Bosses:SetValue(BossesHere)
--     end

--     v.ChildAdded:Connect(function(child)
--         if child:FindFirstChild("Humanoid") and not table.find(BossesHere, child.Name) then
--             table.insert(BossesHere, child.Name)
--             Options.Bosses:SetValue(BossesHere)
--         end
--     end)

--     v.ChildRemoved:Connect(function(child)
--         if child:FindFirstChild("Humanoid") then
--             table.clear(BossesHere)
--             if v[v.Name]:FindFirstChild("Humanoid") and not table.find(BossesHere, v.Name) then
--                 table.insert(BossesHere, v.Name)
--                 Options.Bosses:SetValue(BossesHere)
--             end
--         end
--     end)
-- end

-- for i, v in pairs(Bosses:GetChildren()) do
--     if v.Name == "Snow Trainee" or v.Name == "Sound Trainee" then
        
--     end
-- end

Farming:AddToggle('FarmingMob2', {
    Text = 'Auto Farm Boss',
    Default = false, -- Default value (true / false)
    Tooltip = 'Auto Farm Boss', -- Information shown when you hover over the toggle
})

Toggles.FarmingMob2:OnChanged(function()
    _G.AutoFarmSel = Toggles.FarmingMob2.Value
    _G.SelBoso = nil
    AutoFarmSel()
end)

Farming:AddDivider()

Farming:AddToggle('AutoLoootBot', {
    Text = 'Auto Loot',
    Default = false, -- Default value (true / false)
    Tooltip = 'Get Everything', -- Information shown when you hover over the toggle
})

Toggles.AutoLoootBot:OnChanged(function()
    _G.AutoLoot = Toggles.AutoLoootBot.Value
    Autoloot()
end)

_G.AutoMeditate = false

function Medidtate()
    while _G.AutoMeditate == true do wait()

        local med = game:GetService("Players").LocalPlayer.PlayerGui.ExcessGuis:FindFirstChild("Meditate_gui")

        if med then

            local button = game:GetService("Players").LocalPlayer.PlayerGui.ExcessGuis["Meditate_gui"].Holder.Slide.Button
            local bar = game:GetService("Players").LocalPlayer.PlayerGui.ExcessGuis["Meditate_gui"].Holder.Slide.SliderBar.Bar
            local goal = game:GetService("Players").LocalPlayer.PlayerGui.ExcessGuis["Meditate_gui"].Holder.Slide.SliderBar.Goal

            goal.Size = UDim2.new(1,0,1,0)
            goal.Position = bar.Position

            FireButton(button)
        else
            workspace:WaitForChild("Meditate_Mat"):WaitForChild("Initiated"):FireServer()
        end
    end
end

Breing:AddToggle('BrrthMist', {
    Text = 'Auto Meditate',
    Default = false, -- Default value (true / false)
    Tooltip = "" -- Information shown when you hover over the toggle
})

Toggles.BrrthMist:OnChanged(function()
    _G.AutoMeditate = Toggles.BrrthMist.Value
    Medidtate()
end)

_G.AutoGourd = false

function gourd()
    while _G.AutoGourd == true do wait()
        local args = {
            [1] = "blow_in_gourd_thing",
            [2] = game:GetService("Players").LocalPlayer,
            [3] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Big Gourd"),
            [4] = 3
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S_"):InvokeServer(unpack(args))
        
    end
end

Breing:AddToggle('BrrthMzist', {
    Text = 'Auto Gourd',
    Default = false, -- Default value (true / false)
    Tooltip = "" -- Information shown when you hover over the toggle
})

Toggles.BrrthMzist:OnChanged(function()
    _G.AutoGourd = Toggles.BrrthMzist.Value
    gourd()
end)

-- Keybinds

-- local eq = {}

-- Main123:AddDropdown('Weapons2', {
--     Values = eq,
--     Default = 1, -- number index of the value / string
--     Multi = false, -- true / false, allows multiple choices to be selected

--     Text = 'Select Weapon To Auto Skill',
--     Tooltip = '...', -- Information shown when you hover over the dropdown

--     Callback = function(Value)
--         if Player.Backpack:FindFirstChild(Value) then
--             Player.Character:WaitForChild("Humanoid"):EquipTool(Player.Backpack:FindFirstChild(Value))
--         end
--     end
-- })

-- for i, v in pairs(Player.Backpack:GetChildren()) do
--     if v:IsA("Tool") and v:FindFirstChild("Mastery_Equiped") then
--         table.insert(eq, v.Name)

--         Options.Weapons2:SetValue(eq)
--     end
-- end

-- Player.Backpack.ChildAdded:Connect(function(v)
--     if v:IsA("Tool") and v:FindFirstChild("Mastery_Equiped") then
--         table.insert(eq, v.Name)

--         Options.Weapons2:SetValue(eq)
--     end
-- end)

-- Player.Backpack.ChildRemoved:Connect(function(v)
--     if v:IsA("Tool") and v:FindFirstChild("Mastery_Equiped") then
--         table.clear(eq)

--         for i, vs in pairs(Player.Backpack:GetChildren()) do
--             if vs:IsA("Tool") and vs:FindFirstChild("Mastery_Equiped") then
--                 table.insert(eq, vs.Name)
        
--                 Options.Weapons2:SetValue(eq)
--             end
--         end
--     end
-- end)

Keybind:AddToggle('ZKEY', {
    Text = 'Auto Skill Z',
    Default = false, -- Default value (true / false)
    Tooltip = '...', -- Information shown when you hover over the toggle
})

Toggles.ZKEY:OnChanged(function()
    _G.Keyz = Toggles.ZKEY.Value
    AutoSkills()
end)

Keybind:AddToggle('ZXKEY', {
    Text = 'Auto Skill X',
    Default = false, -- Default value (true / false)
    Tooltip = '...', -- Information shown when you hover over the toggle
})

Toggles.ZXKEY:OnChanged(function()
    _G.Keyx = Toggles.ZXKEY.Value
    AutoSkills()
end)

Keybind:AddToggle('ZCKEY', {
    Text = 'Auto Skill C',
    Default = false, -- Default value (true / false)
    Tooltip = '...', -- Information shown when you hover over the toggle
})

Toggles.ZCKEY:OnChanged(function()
    _G.Keyc = Toggles.ZCKEY.Value
    AutoSkills()
end)

Keybind:AddToggle('ZVKEY', {
    Text = 'Auto Skill V',
    Default = false, -- Default value (true / false)
    Tooltip = '...', -- Information shown when you hover over the toggle
})

Toggles.ZVKEY:OnChanged(function()
    _G.Keyv = Toggles.ZVKEY.Value
    AutoSkills()
end)

Keybind:AddToggle('ZBKEY', {
    Text = 'Auto Skill B',
    Default = false, -- Default value (true / false)
    Tooltip = '...', -- Information shown when you hover over the toggle
})

Toggles.ZBKEY:OnChanged(function()
    _G.Keyb = Toggles.ZBKEY.Value
    AutoSkills()
end)

Keybind:AddToggle('ZNKEY', {
    Text = 'Auto Skill N',
    Default = false, -- Default value (true / false)
    Tooltip = '...', -- Information shown when you hover over the toggle
})

Toggles.ZNKEY:OnChanged(function()
    _G.Keyn = Toggles.ZNKEY.Value
    AutoSkills()
end)

-- Player Tab

local LocationsCFrame = {
    ["Kiribating Village"] = CFrame.new(75.5425491, 283.277435, -1555.1051, 0.999934971, 1.67819341e-08, -0.0114030642, -1.65642859e-08, 1, 1.91810035e-08, 0.0114030642, -1.89908782e-08, 0.999934971),
    ["Ushumaru Village"] = CFrame.new(-500.414673, 274.43689, -3192.9812, 0.999331057, -1.54465774e-08, 0.0365706086, 1.52752992e-08, 1, 4.96289765e-09, -0.0365706086, -4.40095071e-09, 0.999331057),
    ["Abubu Cave"] = CFrame.new(1045.9281, 276.115692, -3557.97437, 0.690576077, 4.18119832e-08, -0.723259389, -1.72029413e-08, 1, 4.13849079e-08, 0.723259389, -1.61372355e-08, 0.690576077),
    ["Waroru Cave"] = CFrame.new(691.615356, 260.926971, -2414.06421, -0.999933839, 0, -0.0115051772, 0, 1, 0, 0.0115051772, 0, -0.999933839),
    ["Final Selection"] = CFrame.new(5292.28369, 365.874969, -2423.28613, 0.0337216519, 0, -0.999431252, 0, 1, 0, 0.999431252, 0, 0.0337216519),
    ["Butterfly Mansion"] = CFrame.new(2979.67236, 315.908905, -3948.33569, -0.996236086, 1.69854353e-08, -0.0866835564, 1.4287254e-08, 1, 3.17471667e-08, 0.0866835564, 3.03891916e-08, -0.996236086),
    ["Dangerous Woods"] = CFrame.new(4087.44189, 342.914246, -3973.68408, 0.387004584, 1.5535921e-08, -0.922077775, -2.12095443e-08, 1, 7.94697641e-09, 0.922077775, 1.64813336e-08, 0.387004584),
    ["Dungeon"] = CFrame.new(-1118.17505, 283.394897, -1574.73694, -0.963565588, -3.70083768e-08, -0.267472088, -4.71384567e-08, 1, 3.14523234e-08, 0.267472088, 4.29145999e-08, -0.963565588),
    ["Zapiwara Mountain"] = CFrame.new(-330.747986, 425.857422, -2331.74097, 0.950173199, -4.93285093e-08, 0.311722487, 5.37885505e-08, 1, -5.70998004e-09, -0.311722487, 2.21925713e-08, 0.950173199),
    ["Ouwbayashi Home"] = CFrame.new(1508.06531, 315.908813, -4621.9585, -0.306320429, -1.04160225e-09, 0.951928437, -2.96041911e-08, 1, -8.43211101e-09, -0.951928437, -3.07639993e-08, -0.306320429),
    ["Kabiwaru Village"] = CFrame.new(1995.30994, 315.908813, -2971.81641, -0.0428119712, -5.69404008e-08, 0.999083161, 7.8262623e-08, 1, 6.03463093e-08, -0.999083161, 8.07744058e-08, -0.0428119712),
    ["Zapiwara Cave"] = CFrame.new(36.8455238, 275.869537, -2420.4834, -0.0517088324, 1.07195525e-07, 0.998662174, 1.31237599e-08, 1, -1.06659598e-07, -0.998662174, 7.59095986e-09, -0.0517088324)
}

local TrainerCFrames = {
    ["Thunder Trainer"] = CFrame.new(-321.562347, 426.857788, -2383.81519, 0.10044384, 4.35164864e-08, -0.994942725, 5.00700068e-08, 1, 4.87924652e-08, 0.994942725, -5.47176917e-08, 0.10044384),
    ["Wind Trainer"] = CFrame.new(1792.06519, 334.338989, -3520.479, 0.88860625, -1.43524312e-08, -0.458670795, 3.71993742e-08, 1, 4.07768823e-08, 0.458670795, -5.32968585e-08, 0.88860625),
    ["Butterfly Trainer"] = CFrame.new(2875.76538, 316.767059, -3917.08398, 0.560217917, 5.14149328e-08, 0.828345299, 2.19298251e-08, 1, -7.69007968e-08, -0.828345299, 6.12466735e-08, 0.560217917),
    ["Water Trainer"] = CFrame.new(711.290039, 260.92688, -2394.80396, -0.703831196, 2.28924524e-08, -0.710367262, 6.56879209e-08, 1, -3.28573115e-08, 0.710367262, -6.97885483e-08, -0.703831196)
}


PlayerLeft:AddToggle('WalkSpeedToggle', {
    Text = 'Walkspeed',
    Default = false, -- Default value (true / false)
    Tooltip = 'Make You Faster', -- Information shown when you hover over the toggle
})

Toggles.WalkSpeedToggle:OnChanged(function()

    local UIS = game:GetService("UserInputService")
    local RS = game:GetService("RunService")
    local W, A, S, D
    local xVelo, yVelo
    
    RS.RenderStepped:Connect(function()

        if Toggles.WalkSpeedToggle.Value == true and _G.walkSpeedKeybind == "" then

            local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart

            HRP.Anchored = false

            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 25

            local C = game.Workspace.CurrentCamera
            local LV = C.CFrame.LookVector
            for i,v in pairs(UIS:GetKeysPressed()) do
                if v.KeyCode == Enum.KeyCode.W then
                    W = true
                end
                if v.KeyCode == Enum.KeyCode.A then
                    A = true
                end
                if v.KeyCode == Enum.KeyCode.S then
                    S = true
                end
                if v.KeyCode == Enum.KeyCode.D then
                    D = true
                end
            end
         
            if W == true and S == true then
                yVelo = false
                W,S = nil
            end
         
            if A == true and D == true then
                xVelo = false
                A,D = nil
            end
         
            if yVelo ~= false then
                if W == true then
                    if xVelo ~= false then
                        if A == true then
                            local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(45), 0)).LookVector
                            HRP.Velocity = Vector3.new((LeftLV.X * _G.walkSpeed), HRP.Velocity.Y, (LeftLV.Z * _G.walkSpeed))
                            W,A = nil
                        else
                            if D == true then
                                local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-45), 0)).LookVector
                                HRP.Velocity = Vector3.new((RightLV.X * _G.walkSpeed), HRP.Velocity.Y, (RightLV.Z * _G.walkSpeed))
                                W,D = nil
                            end
                        end
                    end
                else
                    if S == true then
                        if xVelo ~= false then
                            if A == true then
                                local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(135), 0)).LookVector
                                HRP.Velocity = Vector3.new((LeftLV.X * _G.walkSpeed), HRP.Velocity.Y, (LeftLV.Z * _G.walkSpeed))
                                S,A = nil
                            else
                                if D == true then
                                    local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-135), 0)).LookVector
                                    HRP.Velocity = Vector3.new((RightLV.X * _G.walkSpeed), HRP.Velocity.Y, (RightLV.Z * _G.walkSpeed))
                                    S,D = nil
                                end
                            end
                        end
                    end
                end
            end
         
            if W == true then
                HRP.Velocity = Vector3.new((LV.X * _G.walkSpeed), HRP.Velocity.Y, (LV.Z * _G.walkSpeed))
            end
            if S == true then
                HRP.Velocity = Vector3.new(-(LV.X * _G.walkSpeed), HRP.Velocity.Y, -(LV.Z * _G.walkSpeed))
            end
            if A == true then
                local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(90), 0)).LookVector
                HRP.Velocity = Vector3.new((LeftLV.X * _G.walkSpeed), HRP.Velocity.Y, (LeftLV.Z * _G.walkSpeed))
            end
            if D == true then
                local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-90), 0)).LookVector
                HRP.Velocity = Vector3.new((RightLV.X * _G.walkSpeed), HRP.Velocity.Y, (RightLV.Z * _G.walkSpeed))
            end
         
            xVelo, yVelo, W, A, S, D = nil
        end
    end)
end)

PlayerLeft:AddToggle('JumpPowerToggle', {
    Text = 'JumpPower',
    Default = false, -- Default value (true / false)
    Tooltip = '', -- Information shown when you hover over the toggle
})

Toggles.JumpPowerToggle:OnChanged(function()
    game.Players.LocalPlayer.Character.Humanoid.Jumping:Connect(function()
        if Toggles.JumpPowerToggle.Value == true and _G.JumpPowerKeybind == "" then

            local jumpVelocity = math.sqrt(2 * _G.jumpPower * game.Workspace.Gravity)
    
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, jumpVelocity, 0)
        end
    end)
end)

PlayerLeft:AddSlider('WalkspeedSlider', {
    Text = 'Speed',

    Default = 16,
    Min = 16,
    Max = 200,
    Rounding = 0,

    Compact = false, -- If set to true, then it will hide the label
})

Options.WalkspeedSlider:OnChanged(function()
    _G.walkSpeed = Options.WalkspeedSlider.Value
end)

PlayerLeft:AddSlider('JumpPowerSlider', {
    Text = 'JumpPower',

    Default = 25,
    Min = 25,
    Max = 350,
    Rounding = 0,

    Compact = false, -- If set to true, then it will hide the label
    Tooltip = 'Best to set is 50', -- Information shown when you hover over the toggle
})

Options.JumpPowerSlider:OnChanged(function()
    _G.jumpPower = Options.JumpPowerSlider.Value
end)

-- Keybind Tab

PlayerCode:AddLabel('Walkspeed'):AddKeyPicker('WalkSpeedKey', {


    Default = '', -- String as the name of the keybind (MB1, MB2 for mouse buttons)  
    SyncToggleState = false,


    -- You can define custom Modes but I have never had a use for it.
    Mode = 'Toggle', -- Modes: Always, Toggle, Hold

    Text = 'Enable WalkSpeed', -- Text to display in the keybind menu
    NoUI = false, -- Set to true if you want to hide from the Keybind menu,
})

-- OnClick is only fired when you press the keybind and the mode is Toggle
-- Otherwise, you will have to use Keybind:GetState()
Options.WalkSpeedKey:OnClick(function()

    if Options.WalkSpeedKey.Value ~= "" then
        _G.walkSpeedKeybind = Options.WalkSpeedKey.Value
    end

    if _G.Walk == true then
        _G.Walk = false
    elseif _G.Walk == false then
        _G.Walk = true
    end
    
    local UIS = game:GetService("UserInputService")
    local RS = game:GetService("RunService")
    local W, A, S, D
    local xVelo, yVelo
    
    RS.RenderStepped:Connect(function()

        if Toggles.WalkSpeedToggle.Value == true and _G.Walk == true then

            local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart

            HRP.Anchored = false

            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 25

            local C = game.Workspace.CurrentCamera
            local LV = C.CFrame.LookVector
            for i,v in pairs(UIS:GetKeysPressed()) do
                if v.KeyCode == Enum.KeyCode.W then
                    W = true
                end
                if v.KeyCode == Enum.KeyCode.A then
                    A = true
                end
                if v.KeyCode == Enum.KeyCode.S then
                    S = true
                end
                if v.KeyCode == Enum.KeyCode.D then
                    D = true
                end
            end
         
            if W == true and S == true then
                yVelo = false
                W,S = nil
            end
         
            if A == true and D == true then
                xVelo = false
                A,D = nil
            end
         
            if yVelo ~= false then
                if W == true then
                    if xVelo ~= false then
                        if A == true then
                            local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(45), 0)).LookVector
                            HRP.Velocity = Vector3.new((LeftLV.X * _G.walkSpeed), HRP.Velocity.Y, (LeftLV.Z * _G.walkSpeed))
                            W,A = nil
                        else
                            if D == true then
                                local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-45), 0)).LookVector
                                HRP.Velocity = Vector3.new((RightLV.X * _G.walkSpeed), HRP.Velocity.Y, (RightLV.Z * _G.walkSpeed))
                                W,D = nil
                            end
                        end
                    end
                else
                    if S == true then
                        if xVelo ~= false then
                            if A == true then
                                local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(135), 0)).LookVector
                                HRP.Velocity = Vector3.new((LeftLV.X * _G.walkSpeed), HRP.Velocity.Y, (LeftLV.Z * _G.walkSpeed))
                                S,A = nil
                            else
                                if D == true then
                                    local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-135), 0)).LookVector
                                    HRP.Velocity = Vector3.new((RightLV.X * _G.walkSpeed), HRP.Velocity.Y, (RightLV.Z * _G.walkSpeed))
                                    S,D = nil
                                end
                            end
                        end
                    end
                end
            end
         
            if W == true then
                HRP.Velocity = Vector3.new((LV.X * _G.walkSpeed), HRP.Velocity.Y, (LV.Z * _G.walkSpeed))
            end
            if S == true then
                HRP.Velocity = Vector3.new(-(LV.X * _G.walkSpeed), HRP.Velocity.Y, -(LV.Z * _G.walkSpeed))
            end
            if A == true then
                local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(90), 0)).LookVector
                HRP.Velocity = Vector3.new((LeftLV.X * _G.walkSpeed), HRP.Velocity.Y, (LeftLV.Z * _G.walkSpeed))
            end
            if D == true then
                local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-90), 0)).LookVector
                HRP.Velocity = Vector3.new((RightLV.X * _G.walkSpeed), HRP.Velocity.Y, (RightLV.Z * _G.walkSpeed))
            end
         
            xVelo, yVelo, W, A, S, D = nil
        end
    end)
end)

PlayerCode:AddLabel('JumpPower'):AddKeyPicker('JumpPowerKeybind', {
    -- SyncToggleState only works with toggles. 
    -- It allows you to make a keybind which has its state synced with its parent toggle

    -- Example: Keybind which you use to toggle flyhack, etc.
    -- Changing the toggle disables the keybind state and toggling the keybind switches the toggle state

    Default = '', -- String as the name of the keybind (MB1, MB2 for mouse buttons)  
    SyncToggleState = false,


    -- You can define custom Modes but I have never had a use for it.
    Mode = 'Toggle', -- Modes: Always, Toggle, Hold

    Text = 'Enable JumpPower', -- Text to display in the keybind menu
    NoUI = false, -- Set to true if you want to hide from the Keybind menu,
})

-- OnClick is only fired when you press the keybind and the mode is Toggle
-- Otherwise, you will have to use Keybind:GetState()
Options.JumpPowerKeybind:OnClick(function()

    _G.JumpPowerKeybind = Options.JumpPowerKeybind.Value

    if _G.JumpP == true then
        _G.JumpP = false
    elseif _G.JumpP == false then
        _G.JumpP = true
    end

    game.Players.LocalPlayer.Character.Humanoid.Jumping:Connect(function()
        if Toggles.JumpPowerToggle.Value == true and _G.JumpP == true then

            local jumpVelocity = math.sqrt(2 * _G.jumpPower * game.Workspace.Gravity)
    
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, jumpVelocity, 0)
        end
    end)
end)
