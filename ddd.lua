local player = game.Players.LocalPlayer

local character = player.Character

local humanoid = character:FindFirstChild("Humanoid")

local HumanoidRootPart = character:FindFirstChild("HumanoidRootPart")

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

local s_rs = game:GetService("RunService")
local l_plr = game:GetService("Players").LocalPlayer


local l_humrp = l_plr.Character and l_plr.Character:FindFirstChild("HumanoidRootPart")
local l_hum = l_plr.Character and l_plr.Character:FindFirstChild("Humanoid")

local resp_con = l_plr.CharacterAdded:Connect(function(c)
    l_humrp = c:WaitForChild("HumanoidRootPart",3)
    l_hum = c:WaitForChild("Humanoid",3)
end)

local function dnec(signal) 
    local s = {}
    for _, con in ipairs(getconnections(signal)) do 
        local func = con.Function
        if (func and islclosure(func)) then
            if (not is_synapse_function(func)) then 
                s[#s+1] = con
                con:Disable() 
            end
        end
    end
    return s
end

local ChamsToggle, OldChamsColor = false, Color3.fromRGB(255, 255, 255);
local function IsSameTeam(Player, Toggle)
    return not Toggle or Player.Team ~= LocalPlayer.Team;
end

local function IsAlive(Player)
    return Player and Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health > 0;
end

local function IsHolding()
    return UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2);
end

local function IsOnScreen(Part)
    local _, OnScreen = Camera:WorldToViewportPoint(Part.Position);

    return OnScreen;
end

local function IsVisible(Player)
    local Parts = Camera:GetPartsObscuringTarget({Camera.CFrame.Position, Player.Character.HumanoidRootPart.Position}, {Player.Character})

    for Index, Part in next, Parts do
        if Part.Transparency == 1 or Part.CanCollide == false then
            Parts[Index] = nil;
        end
    end

    return #Parts == 0;
end

local function FormatNametag(Playes)
    if Playes and Playes.Character and Playes.Character:FindFirstChild("HumanoidRootPart") and Playes.Character:FindFirstChild("Humanoid") then

        if not IsAlive(Playes) or Playes.Character.Humanoid.Health <= 0 then
            return ("[0] " .. Playes.Name .. "| %sHP"):format(Playes.Character.Humanoid.Health)
        end

        return string.format("[%s] %s | %sHP",
        HumanoidRootPart and tostring(math.round((Playes.Character.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude)) or "N/A",
        Playes.Name,
        tostring(math.round(Playes.Character.Humanoid.Health)))
    end
end

local function DrawNametag(Player)
    local Nametag = Drawing.new("Text");
    Nametag.Visible = true;
    Nametag.Text = "";
    Nametag.Size = 20;
    Nametag.Color = Color3.fromRGB(255, 255, 255);
    Nametag.Outline = true;

    local function UpdateNametag()
        task.spawn(function()
            while true do task.wait()
                if not Nametags then
                    Nametag.Visible = false;
                    break;
                end
                if RainbowESP then
                    Nametag.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1);
                else
                    Nametag.Color = Color3.fromRGB(255, 255, 255);
                end

                if Player and Player ~= LocalPlayer and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("Head") then
                    local HeadPosition = Camera:WorldToViewportPoint(Player.Character.Head.Position);

                    if Player and Nametags and IsSameTeam(Player, TeamCheck) and IsOnScreen(Player.Character.HumanoidRootPart) and IsAlive(Player) then
                        Nametag.Text = FormatNametag(Player);
                        Nametag.Font = 3
                        Nametag.Size = 16
                        Nametag.ZIndex = 2
                        Nametag.Visible = true
                        Nametag.Position = Vector2.new(HeadPosition.X - (Nametag.TextBounds.X / 2), HeadPosition.Y - (Nametag.TextBounds.Y * 1.25));
                        Nametag.Color = ESPColor
                    else
                        Nametag.Visible = false;
                    end
                else
                    Nametag.Visible = false;
                end
            end
        end)
    end
    coroutine.wrap(UpdateNametag)();
end

local function GetCorners(Part)
    local Size = Part.Size * Vector3.new(1, 1.5)
    return {
        TopRight = (Part.CFrame * CFrame.new(-Size.X, -Size.Y, 0)).Position;
        BottomRight = (Part.CFrame * CFrame.new(-Size.X, Size.Y, 0)).Position;
        TopLeft = (Part.CFrame * CFrame.new(Size.X, -Size.Y, 0)).Position;
        BottomLeft = (Part.CFrame * CFrame.new(Size.X, Size.Y, 0)).Position;
    };
end

Players.PlayerAdded:Connect(function(Player)
    if ESPToggle then
        DrawESP(Player);
    end

    if Line then
        DrawLine(Player);
    end

    if Nametags then
        DrawNametag(Player);
    end
end)

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
    Stand = Window:AddTab('Stands'),

    ["UI Settings"] = Window:AddTab('UI Settings')
}

-- Main Tab

local Main123 = Tabs.Main:AddLeftTabbox('Main')

local Farming = Main123:AddTab('Farming')

local FarmingObj = Main123:AddTab('Objects Farming')

-- Smart ESP Tab

local ESPT23 = Tabs.Main:AddRightTabbox('')

local ESPT = ESPT23:AddTab('Players ESP')

local ESPO = ESPT23:AddTab('Objects ESP')

-- Player Tab

local PPlr23 = Tabs.Player:AddLeftTabbox('')

local PPlr = PPlr23:AddTab('Local Player')

local Teleports = PPlr23:AddTab('Teleports')

local Keybinds = PPlr23:AddTab('Keybinds')

-- Stands Tab

local StandsSniper = Tabs.Stand:AddLeftGroupbox('Stands Sniper')

local StandsStat = Tabs.Stand:AddRightGroupbox('Stands Stats')

-- All Script

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({" MenuKebinds "})
ThemeManager:SetFolder('i8z')
SaveManager:SetFolder('i8z/yba')
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

_G.walkSpeedKeybind = ""

_G.Walk = false

_G.JumpP = false

_G.JumpPowerKeybind = ""

-- Funcations

-- MouseClicker

function FireButton(x)
    for i, v in pairs(getconnections(x.MouseButton1Click)) do
        v:Function()
    end
end

-- Stands Tab

_G.SniperStand = {}

StandsSniper:AddDropdown('MyStands', {
    Values = {"Whitesnake","Stone Free","Star Platinum","The World","Anubis","Red Hot Chili Pepper","Crazy Diamond","Killer Queen","Gold Experience","King Crimson","Silver Chariot","Hermit Purple"},
    Default = 1, -- number index of the value / string
    Multi = true, -- true / false, allows multiple choices to be selected

    Text = 'Stands Dropdown',
    Tooltip = 'Select a stand', -- Information shown when you hover over the textbox
})

Options.MyStands:OnChanged(function()
    _G.SniperStand = Options.MyStands.Value
end)

Options.MyStands:SetValue({
    Whitesnake = true,
    Anubis = true
})

_G.AutoSniper = false

local function FireButton(x)
    for i, v in pairs(getconnections(x.MouseButton1Click)) do
        v:Function()
    end
end

function Auto_Sniper()
    while _G.AutoSniper == true do wait()
        
        local function CheckEquip()
            
            if player.Backpack:FindFirstChild("Mysterious Arrow") and player.Backpack:FindFirstChild("Rokakaka") then
                
                return true
            else
                return false
            end
        end

        local function EquipArrow()
            local AlreadyHave = CheckEquip()

            repeat
                wait()
            until AlreadyHave == true

            local item1 = player.Backpack:WaitForChild("Mysterious Arrow")

            humanoid:EquipTool(item1)
        end

        local function EquipRokaka()
            local AlreadyHave = CheckEquip()

            repeat
                wait()
            until AlreadyHave == true

            local item2 = player.Backpack:WaitForChild("Rokakaka")

            humanoid:EquipTool(item2)
        end

        --

        if _G.SniperStand[game:GetService("Players").LocalPlayer.PlayerStats.Stand.Value] then

            Library:Notify("Stand Found We Will Take A Break !!")
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

StandsSniper:AddToggle('SniperingStand', {
    Text = 'Auto Sniper (You Need Rokaka And Arrow)',
    Default = false, -- Default value (true / false)
    Tooltip = 'Auto Reroll Stand Until You Get Your Fav Stand ! (((Select Stand From The Up Dropdown)))', -- Information shown when you hover over the toggle
})

Toggles.SniperingStand:OnChanged(function()
    _G.AutoSniper = Toggles.SniperingStand.Value
    Auto_Sniper()
end)

_G.AutoWint = false

function jj_esp()
    while _G.AutoWint == true do wait()
        
        local args = {
            [1] = "LearnSkill",
            [2] = {
                ["Skill"] = "Worthiness I",
                ["SkillTreeType"] = "Character"
            }
        }

        game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))
    end
end

StandsSniper:AddToggle('SniperingStand', {
    Text = 'Auto Worthiness Stand Sniper Are Bugging',
    Default = false, -- Default value (true / false)
    Tooltip = '', -- Information shown when you hover over the toggle
})

Toggles.SniperingStand:OnChanged(function()
    _G.AutoWint = Toggles.SniperingStand.Value
    jj_esp()
end)

-- Main Tab

_G.IsUsingStand = false

_G.AutoSkillsWhenAutoFarm = false

Farming:AddToggle('IsUsingStand', {
    Text = 'Is Using Stand For Auto Farm?',
    Default = false, -- Default value (true / false)
    Tooltip = 'If Not Then We Will Use Combat !', -- Information shown when you hover over the toggle
})

Toggles.IsUsingStand:OnChanged(function()
    _G.IsUsingStand = Toggles.IsUsingStand.Value
end)

Farming:AddToggle('IsUsingStand2', {
    Text = 'Auto Use Skills When Auto Farm?',
    Default = false, -- Default value (true / false)
    Tooltip = 'Use It Its Perfect', -- Information shown when you hover over the toggle
})

Toggles.IsUsingStand2:OnChanged(function()
    _G.AutoSkillsWhenAutoFarm = Toggles.IsUsingStand2.Value
end)

_G.SkillsAreMade = {}

Farming:AddDropdown('MySkillsDropdown', {
    Values = {"E", "R", "Z", "X", "T", "Y", "J", "G", "H", "B", "N"},
    Default = 1, -- number index of the value / string
    Multi = true, -- true / false, allows multiple choices to be selected

    Text = 'Skills Dropdown',
    Tooltip = 'Select a skills', -- Information shown when you hover over the textbox
})

Options.MySkillsDropdown:OnChanged(function()
    _G.SkillsAreMade = Options.MySkillsDropdown.Value
end)


Options.MySkillsDropdown:SetValue({
    E = true,
    R = true,
})


local mobName = "nil"

local mobsTable = {}

Farming:AddDropdown('MyMobsDropdown', {
    Values = mobsTable,
    Default = 1, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Mobs',
    Tooltip = 'Select a mob', -- Information shown when you hover over the textbox
})

Options.MyMobsDropdown:OnChanged(function()
    mobName = Options.MyMobsDropdown.Value
end)

for i, v in pairs(game.Workspace.Living:GetChildren()) do
    if not table.find(mobsTable, v.Name) then
        table.insert(mobsTable, v.Name)
    end

    Options.MyMobsDropdown:SetValue(mobsTable)
end

game.Workspace.Living.ChildAdded:Connect(function(v)
    if not table.find(mobsTable, v.Name) then
        table.insert(mobsTable, v.Name)
    end

    Options.MyMobsDropdown:SetValue(mobsTable)
end)


local mob = nil

_G.autoFarmMobs = false

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

function AutoFarmMobs()
    while _G.autoFarmMobs == true do wait()

        if _G.autoFarmMobs == false then
            break
        end
        
        if mob == nil then
            repeat
                wait()
                for i, v in pairs(game.Workspace.Living:GetChildren()) do
                
                    if v.Name == mobName and v:FindFirstChildOfClass("Humanoid") and v.Humanoid.Health > 1 then
                        mob = v
                    end
                end
            until  mob ~= nil
        end

        if mob ~= nil then
            
            if mob.Humanoid.Health < 1 then
                mob = nil

                repeat
                    wait()
                    for i, v in pairs(game.Workspace.Living:GetChildren()) do
                    
                        if v.Name == mobName and v:FindFirstChildOfClass("Humanoid") and v.Humanoid.Health > 1 then
                            mob = v
                        end
                    end
                until  mob ~= nil
            end

            local part = mob:FindFirstChild("HumanoidRootPart")

            if (HumanoidRootPart.Position - part.Position).Magnitude < 10 then

                HumanoidRootPart.CFrame = part.CFrame * CFrame.new(0, 0, 8)

                if _G.IsUsingStand == false then

                    local remoteEvent = character:FindFirstChild("RemoteEvent")

                    if remoteEvent then
                        HumanoidRootPart.CFrame = part.CFrame * CFrame.new(0, 0, 3)

                        local args = {
                            [1] = "Attack",
                            [2] = "m1"
                        }

                        remoteEvent:FireServer(unpack(args))
                    end
                end

                if _G.IsUsingStand == true then

                    -- summon stand

                    local remoteEvent = character:FindFirstChild("RemoteFunction")

                    if remoteEvent and game:GetService("Workspace").Living[player.Name].SummonedStand.Value == false then

                        local args = {
                            [1] = "ToggleStand",
                            [2] = "Toggle"
                        }
                        
                        game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))
                        
                    end

                    -- fight

                    HumanoidRootPart.CFrame = part.CFrame * CFrame.new(0, 0, 3)
                    
                    local args = {
                        [1] = "Attack",
                        [2] = "m1"
                    }
                    
                    game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))

                    
                    if _G.AutoSkillsWhenAutoFarm == true then

                        for i, v in next, _G.SkillsAreMade do

                            game:GetService('VirtualInputManager'):SendKeyEvent(true,i,false,uwu)

                            -- local skill = {
                            --     [1] = "InputBegan",
                            --     [2] = {
                            --         ["Input"] = Enum.KeyCode.E
                            --     }
                            -- }
                            
                            -- game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(skill))
                        end
                    end
                end
            else

                if part ~= nil then
        
                    local pathfinding = game:GetService("PathfindingService")
        
        
                    local torso = character:FindFirstChild("HumanoidRootPart")
                    
                    local path = pathfinding:CreatePath()
                    path:ComputeAsync(torso.Position, part.Position)
                    local waypoints = path:GetWaypoints()
        
                    for _, waypoint in pairs(waypoints) do

                        wait(.1)

                        local cube = Instance.new("Part")
                        cube.Shape = "Ball"
                        cube.Material = "Neon"
                        cube.Size = Vector3.new(0.3, 0.3, 0.3)
                        cube.BrickColor = BrickColor.random()
                        cube.Position = waypoint.Position
                        cube.Anchored = true
                        cube.CanCollide = false
                        cube.Parent = game.Workspace
                        game:GetService("Debris"):AddItem(cube, 5)
                        -- if waypoint.Action == Enum.PathWaypointAction.Jump then
                        --     humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        --     HumanoidRootPart.CFrame = CFrame.new(waypoint.Position)
                        -- end
                        -- humanoid:MoveTo(waypoint.Position)
                        -- humanoid.MoveToFinished:Wait(2)
                        HumanoidRootPart.CFrame = CFrame.new(waypoint.Position)
                    end
                end
            end
        end
    end
end

Farming:AddToggle('Farming', {
    Text = 'Auto Farm',
    Default = false, -- Default value (true / false)
    Tooltip = '', -- Information shown when you hover over the toggle
})

Toggles.Farming:OnChanged(function()
    _G.autoFarmMobs = Toggles.Farming.Value
    mob = nil

    if _G.autoFarmMobs == false then
        clip()
    end
    AutoFarmMobs()
end)

local ItemsAreSelected = {
    ["Mysterious Arrow"] = true,
    ["Rokakaka"] = true,
    ["Pure Rokakaka"] = true,
    ["Lucky Arrow"] = true,
    ["Lucky Stone Mask"] = true,
    ["Rib Cage of The Saint's Corpse"] = true,
    ["Steel Ball "] = true,
    ["Zeppeli's Headband "] = true,
    ["Ancient Scroll "] = true,
    ["Quinton's Glove "] = true,
    ["Stone Mask "] = true,
    ["Gold Coin "] = true,
    ["Diamond"] = true,
    ["Dio's Diary"] = true,
}

_G.farm_Object = false

function autoFarm_Objects()
    while _G.farm_Object == true do

        local part = nil

        if part == nil then
            repeat
                wait()

                for i, v in pairs(game.Workspace.Item_Spawns.Items:GetChildren()) do

                    if v.Name ~= "ESPPart-1" and v:IsA("Model") and v:FindFirstChildOfClass("ProximityPrompt") and v:FindFirstChildOfClass("MeshPart") then
        
                        if ItemsAreSelected[v:FindFirstChildOfClass("ProximityPrompt").ObjectText] then
        
                            if ItemsAreSelected[v:FindFirstChildOfClass("ProximityPrompt").ObjectText] == true then
        
                                part = v:FindFirstChildOfClass("MeshPart")
                                
                            end
                        end
                    end
                end
            until part ~= nil
        end

        if part ~= nil then

            local pathfinding = game:GetService("PathfindingService")
        
        
            local torso = character:FindFirstChild("HumanoidRootPart")
            
            local path = pathfinding:CreatePath()
            path:ComputeAsync(torso.Position, part.Position)
            local waypoints = path:GetWaypoints()

            for _, waypoint in pairs(waypoints) do

                wait(.1)

                local cube = Instance.new("Part")
                cube.Shape = "Ball"
                cube.Material = "Neon"
                cube.Size = Vector3.new(0.3, 0.3, 0.3)
                cube.BrickColor = BrickColor.random()
                cube.Position = waypoint.Position
                cube.Anchored = true
                cube.CanCollide = false
                cube.Parent = game.Workspace
                game:GetService("Debris"):AddItem(cube, 5)
                -- if waypoint.Action == Enum.PathWaypointAction.Jump then
                --     humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                --     HumanoidRootPart.CFrame = CFrame.new(waypoint.Position)
                -- end
                -- humanoid:MoveTo(waypoint.Position)
                -- humanoid.MoveToFinished:Wait(2)
                HumanoidRootPart.CFrame = CFrame.new(waypoint.Position)

                if (HumanoidRootPart.Position - part.Position).Magnitude < 5 then

                    fireproximityprompt(part.Parent:FindFirstChildOfClass("ProximityPrompt"))

                    part.Parent.Name = "ESPPart-1"

                    part = nil

                    repeat
                        wait()
        
                        for i, v in pairs(game.Workspace.Item_Spawns.Items:GetChildren()) do
        
                            if v.Name ~= "ESPPart-1" and v:IsA("Model") and v:FindFirstChildOfClass("ProximityPrompt") and v:FindFirstChildOfClass("MeshPart") then
                
                                if ItemsAreSelected[v:FindFirstChildOfClass("ProximityPrompt").ObjectText] then
                
                                    if ItemsAreSelected[v:FindFirstChildOfClass("ProximityPrompt").ObjectText] == true then
                
                                        part = v:FindFirstChildOfClass("MeshPart")
                                        
                                    end
                                end
                            end
                        end
                    until part ~= nil

                end
            end
        end

        wait(5)
    end
end

FarmingObj:AddToggle('ObjectFarms', {
    Text = 'Objects Farm Read Tooltip',
    Default = false, -- Default value (true / false)
    Tooltip = 'Make Sure The Items You Want To Get Its Enabled In ESP Section Also Do Not Activate ESP If You Active It You Should Rejoin Or ReExecute The Script Again !', -- Information shown when you hover over the toggle
})

Toggles.ObjectFarms:OnChanged(function()
    _G.farm_Object = Toggles.ObjectFarms.Value

    autoFarm_Objects()
end)

-- ESP

--ESPO

_G.ESPAllItems = false

function allItemsESP_Function()
    while _G.ESPAllItems == true do wait()
        
        for i, v in pairs(game.Workspace.Item_Spawns.Items:GetChildren()) do
            if v.Name ~= "ESPPart2" and v:IsA("Model") and v:FindFirstChildOfClass("ProximityPrompt") and v:FindFirstChildOfClass("MeshPart") then

                if ItemsAreSelected[v:FindFirstChildOfClass("ProximityPrompt").ObjectText] then
                    local x = v:FindFirstChildOfClass("MeshPart")
                    v.Name = "ESPPart2"

                    local cam = workspace.CurrentCamera

                    local pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"
        
                    local Textlabel = Drawing.new("Text");
                    Textlabel.Visible = true;
                    Textlabel.Text = "Chest";
                    Textlabel.Font = 3
                    Textlabel.Size = 16
                    Textlabel.ZIndex = 2
                    Textlabel.Visible = true
                    Textlabel.Color = Color3.fromRGB(0, 255, 0);
                    Textlabel.Outline = true;
        
                    local Metters = Drawing.new("Text");
                    Metters.Visible = true;
                    Metters.Text = "135 M Away";
                    Metters.Font = 3
                    Metters.Size = 16
                    Metters.ZIndex = 2
                    Metters.Visible = true
                    Metters.Color = Color3.fromRGB(0, 255, 0);
                    Metters.Outline = true;
        
                    local function UpdateNametag()
                        task.spawn(function()
                            while true do task.wait()
        
                                pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"
        
                                Textlabel.Visible = ItemsAreSelected[v:FindFirstChildOfClass("ProximityPrompt").ObjectText]
                                Metters.Visible = ItemsAreSelected[v:FindFirstChildOfClass("ProximityPrompt").ObjectText]

                                if _G.ESPAllItems == false then
                                    Textlabel.Visible = false
                                    Metters.Visible = false
                                end
        
                                if not Textlabel and not Metters then
                                    Textlabel.Visible = false;
                                    Metters.Visible = false
                                    break;
                                end
                
                                if x then
                                    local HeadPosition = Camera:WorldToViewportPoint(x.Position);
                
                                    if x then
                                        Textlabel.Text = v:FindFirstChildOfClass("ProximityPrompt").ObjectText;
                                        Textlabel.Font = 3
                                        Textlabel.Size = 16
                                        Textlabel.ZIndex = 2
                                        Textlabel.Position = Vector2.new(HeadPosition.X - (Textlabel.TextBounds.X / 2), HeadPosition.Y - (Textlabel.TextBounds.Y * 1.25));
                                        Textlabel.Color = Color3.fromRGB(94, 94, 94);
                                        Textlabel.Outline = true;
        
                                        pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"
        
                                        Metters.Text = pos;
                                        Metters.Font = 3
                                        Metters.Size = 16
                                        Metters.ZIndex = 2
                                        Metters.Position = Vector2.new(HeadPosition.X - (Metters.TextBounds.X / 2), HeadPosition.Y - (Metters.TextBounds.Y * 0.5));
                                        Metters.Color = Color3.fromRGB(94, 94, 94);
                                        Metters.Outline = true;
                                    else
                                        Textlabel.Visible = false;
                                        Metters.Visible = false;
                                        Textlabel:Remove()
                                        Metters:Remove()
                                    end
                                else
                                    Textlabel.Visible = false;
                                    Metters.Visible = false;
                                    Textlabel:Remove()
                                    Metters:Remove()
                                end
                            end
                        end)
                    end
                    coroutine.wrap(UpdateNametag)();
                end
            end
        end
    end
end

ESPO:AddToggle('SelectAll', {
    Text = 'Items ESP',
    Default = false, -- Default value (true / false)
    Tooltip = '', -- Information shown when you hover over the toggle
})

Toggles.SelectAll:OnChanged(function()
    _G.ESPAllItems = Toggles.SelectAll.Value
    allItemsESP_Function()
end)

for i, v in pairs(ItemsAreSelected) do
    ESPO:AddToggle('SelectAll'..i, {
        Text = i..' ESP',
        Default = true, -- Default value (true / false)
        Tooltip = '', -- Information shown when you hover over the toggle
    })
    
    Toggles['SelectAll'..i]:OnChanged(function()
        ItemsAreSelected[i] = Toggles['SelectAll'..i].Value
    end)
    
end

--ESPT

ESPT:AddToggle('Names_tog', {
    Text = 'Names',
    Default = false, -- Default value (true / false)
    Tooltip = 'Esp Name: shows player name and some info', -- Information shown when you hover over the toggle
})

Toggles.Names_tog:OnChanged(function()
    -- if Toggles.Names_tog.Value == true then
        Nametags = Toggles.Names_tog.Value;

        if Nametags then
            for _, Player in next, Players:GetPlayers() do
                DrawNametag(Player);
            end
        end
    -- end
end)

local Settings = {
    Box_Color = Color3.fromRGB(255, 255, 255),
    Tracer_Color = Color3.fromRGB(255, 255, 255),
    Tracer_Thickness = 1,
    Box_Thickness = 1,
    Tracer_Origin = "Bottom", -- Middle or Bottom if FollowMouse is on this won't matter...
    Tracer_FollowMouse = false,
    Tracers = true
}
local Team_Check = {
    TeamCheck = false, -- if TeamColor is on this won't matter...
    Green = Color3.fromRGB(0, 255, 0),
    Red = Color3.fromRGB(255, 0, 0)
}
local TeamColor = false

--// SEPARATION
local player = game:GetService("Players").LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local mouse = player:GetMouse()

local function NewQuad(thickness, color)
    local quad = Drawing.new("Quad")
    quad.Visible = false
    quad.PointA = Vector2.new(0,0)
    quad.PointB = Vector2.new(0,0)
    quad.PointC = Vector2.new(0,0)
    quad.PointD = Vector2.new(0,0)
    quad.Color = color
    quad.Filled = false
    quad.Thickness = thickness
    quad.Transparency = 1
    return quad
end

local function NewLine(thickness, color)
    local line = Drawing.new("Line")
    line.Visible = false
    line.From = Vector2.new(0, 0)
    line.To = Vector2.new(0, 0)
    line.Color = color 
    line.Thickness = thickness
    line.Transparency = 1
    return line
end

local function Visibility(state, lib)
    for u, x in pairs(lib) do
        x.Visible = state
    end
end

local function ToColor3(col) --Function to convert, just cuz c;
    local r = col.r --Red value
    local g = col.g --Green value
    local b = col.b --Blue value
    return Color3.new(r,g,b); --Color3 datatype, made of the RGB inputs
end

local black = Color3.fromRGB(0, 0 ,0)

local already = {}

local function ESP(plr)
    local library = {
        --//Tracer and Black Tracer(black border)
        blacktracer = NewLine(Settings.Tracer_Thickness*2, black),
        tracer = NewLine(Settings.Tracer_Thickness, Settings.Tracer_Color),
        --//Box and Black Box(black border)
        black = NewQuad(Settings.Box_Thickness*2, black),
        box = NewQuad(Settings.Box_Thickness, Settings.Box_Color),
        --//Bar and Green Health Bar (part that moves up/down)
        healthbar = NewLine(3, black),
        greenhealth = NewLine(1.5, black)
    }

    local function Colorize(color)
        for u, x in pairs(library) do
            if x ~= library.healthbar and x ~= library.greenhealth and x ~= library.blacktracer and x ~= library.black then
                x.Color = color
            end
        end
    end

    local function Updater()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("Head") ~= nil then
                local HumPos, OnScreen = camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                if OnScreen and _G.MONEYCHESTESP1112Boxes == true then
                    local head = camera:WorldToViewportPoint(plr.Character.Head.Position)
                    local DistanceY = math.clamp((Vector2.new(head.X, head.Y) - Vector2.new(HumPos.X, HumPos.Y)).magnitude, 2, math.huge)
                    
                    local function Size(item)
                        item.PointA = Vector2.new(HumPos.X + DistanceY, HumPos.Y - DistanceY*2)
                        item.PointB = Vector2.new(HumPos.X - DistanceY, HumPos.Y - DistanceY*2)
                        item.PointC = Vector2.new(HumPos.X - DistanceY, HumPos.Y + DistanceY*2)
                        item.PointD = Vector2.new(HumPos.X + DistanceY, HumPos.Y + DistanceY*2)
                    end
                    Size(library.box)
                    Size(library.black)

                    --//Tracer 
                    if Settings.Tracers then
                        if Settings.Tracer_Origin == "Middle" then
                            library.tracer.From = camera.ViewportSize*0.5
                            library.blacktracer.From = camera.ViewportSize*0.5
                        elseif Settings.Tracer_Origin == "Bottom" then
                            library.tracer.From = Vector2.new(camera.ViewportSize.X*0.5, camera.ViewportSize.Y) 
                            library.blacktracer.From = Vector2.new(camera.ViewportSize.X*0.5, camera.ViewportSize.Y)
                        end
                        if Settings.Tracer_FollowMouse then
                            library.tracer.From = Vector2.new(mouse.X, mouse.Y+36)
                            library.blacktracer.From = Vector2.new(mouse.X, mouse.Y+36)
                        end
                        library.tracer.To = Vector2.new(HumPos.X, HumPos.Y + DistanceY*2)
                        library.blacktracer.To = Vector2.new(HumPos.X, HumPos.Y + DistanceY*2)
                    else 
                        library.tracer.From = Vector2.new(0, 0)
                        library.blacktracer.From = Vector2.new(0, 0)
                        library.tracer.To = Vector2.new(0, 0)
                        library.blacktracer.To = Vector2.new(0, 02)
                    end

                    --// Health Bar
                    local d = (Vector2.new(HumPos.X - DistanceY, HumPos.Y - DistanceY*2) - Vector2.new(HumPos.X - DistanceY, HumPos.Y + DistanceY*2)).magnitude 
                    local healthoffset = plr.Character.Humanoid.Health/plr.Character.Humanoid.MaxHealth * d

                    library.greenhealth.From = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY*2)
                    library.greenhealth.To = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY*2 - healthoffset)

                    library.healthbar.From = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY*2)
                    library.healthbar.To = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y - DistanceY*2)

                    local green = Color3.fromRGB(0, 255, 0)
                    local red = Color3.fromRGB(255, 0, 0)

                    library.greenhealth.Color = red:lerp(green, plr.Character.Humanoid.Health/plr.Character.Humanoid.MaxHealth);

                    if Team_Check.TeamCheck then
                        if plr.TeamColor == player.TeamColor then
                            Colorize(Team_Check.Green)
                        else 
                            Colorize(Team_Check.Red)
                        end
                    else 
                        library.tracer.Color = Settings.Tracer_Color
                        library.box.Color = Settings.Box_Color
                    end
                    if TeamColor == true then
                        Colorize(plr.TeamColor.Color)
                    end
                    Visibility(true, library)
                else 
                    Visibility(false, library)
                end
            else 
                Visibility(false, library)
                if game.Players:FindFirstChild(plr.Name) == nil then
                    connection:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(Updater)()
end

local alr = {}

spawn(function()
    while true do
        wait()

        for i, v in pairs(game:GetService("Players"):GetPlayers()) do
		    if v.Name ~= player.Name and not table.find(alr, v.Name) then
                table.insert(alr, v.Name)
		        coroutine.wrap(ESP)(v)
		    end
		end
    end
end)

ESPT:AddToggle('EspSmart', {
    Text = 'Full Esp',
    Default = false, -- Default value (true / false)
    Tooltip = 'Box - Line - Bars But Without Names', -- Information shown when you hover over the toggle
})

Toggles.EspSmart:OnChanged(function()
    _G.ESP = Toggles.EspSmart.Value
end)

ESPT:AddToggle('LineSSS', {
    Text = 'Line',
    Default = true, -- Default value (true / false)
    Tooltip = 'Esp Option', -- Information shown when you hover over the toggle
})

Toggles.LineSSS:OnChanged(function()
    Settings.Line = Toggles.LineSSS.Value
end)

-- Player Tab

PPlr:AddToggle('WalkSpeedToggle', {
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

        if Toggles.WalkSpeedToggle and Toggles.WalkSpeedToggle.Value == true and _G.walkSpeedKeybind == "" then

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

PPlr:AddToggle('JumpPowerToggle', {
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

PPlr:AddSlider('WalkspeedSlider', {
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

PPlr:AddSlider('JumpPowerSlider', {
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

PPlr:AddLabel('Walkspeed'):AddKeyPicker('WalkSpeedKey', {


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

        if Toggles.WalkSpeedToggle and Toggles.WalkSpeedToggle.Value == true and _G.Walk == true then

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

Keybinds:AddLabel('JumpPower'):AddKeyPicker('JumpPowerKeybind', {
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

SaveManager:LoadAutoloadConfig()
