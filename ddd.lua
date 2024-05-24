local Player = game.Players.LocalPlayer
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
local request = (syn and syn.request) or (http and http.request) or http_request
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService");
local GameName = MarketplaceService:GetProductInfo(game.PlaceId).Name;
local ESPColor, RainbowESP = Color3.fromRGB(255, 255, 255), false;
local ESPToggle, OldEspColor = false, Color3.fromRGB(255, 255, 255);
local ChamsColor, RainbowChams = Color3.fromRGB(255, 255, 255), false;
local Nametags = false;
local TeamCheck = false;

-- local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
-- Player.OnTeleport:Connect(function(state)
--     --print(state, queueteleport)
--     if state == Enum.TeleportState.InProgress and queueteleport then 
--         queueteleport("loadstring(game:HttpGet('https://fffff--kiilllll1000x00.repl.co/gameLoader.lua'))()")
--     end 
-- end)

local repo = "https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/"

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

Library:Notify("Loading...")

local HisWipe = true

local Times = 0

_G.Playing = true

_G.Njumb = 0

_G.Message1 = true

_G.Message2 = true

_G.Message3 = true

_G.Message4 = true

_G.Message5 = true

spawn(function()
    while true do

        wait(0.085)

        if HisWipe == true then
            _G.Njumb += 1

            task.delay(math.random(1, 10), function()
                if _G.Message1 == true then
                    _G.Message1 = false

                    Library:Notify("Uploading...")
                end
            end)
                
            task.delay(math.random(4, 5), function()
                if _G.Message2 == true then
                    _G.Message2 = false

                    Library:Notify("Bulding...")
                end
            end)
                
            task.delay(math.random(6, 8), function()
                if _G.Message3 == true then
                    _G.Message3 = false
    
                    Library:Notify("Checking key...")
                end
            end)
                
            task.delay(math.random(7, 8), function()
                if _G.Message4 == true then
                    _G.Message4 = false
    
                    Library:Notify("We got close...")
                end
            end)

            task.delay(math.random(8.5, 9), function()
                if _G.Message5 == true then
                    _G.Message5 = false

                    Library:Notify("We're done...")

                    
                end
            end)

            repeat
                wait()
            until  _G.Message5 == false
            
            break
        end
    end
end)

repeat
    task.wait()
until game:IsLoaded()

local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'Ora Hub - Grand Piece Online',
    Center = false, 
    AutoShow = true,
    Size = UDim2.new(0.35, 0, 0.678, 0),
})

-- You can suggest changes with a pull request or something

local Tabs = {
    Main = Window:AddTab('Battle Royale'),
    ["UI Settings"] = Window:AddTab('UI Settings')
}

local LeftGroupBox3 = Tabs.Main:AddLeftGroupbox('Player')
local LeftGroupBox4 = Tabs.Main:AddLeftGroupbox('Smart ESP')
local RightGroupBox = Tabs.Main:AddRightGroupbox('Esp')
local LeftGroupBox2 = Tabs.Main:AddRightGroupbox('Colors')
local LeftGroupBox5 = Tabs.Main:AddRightGroupbox('Chest Colors')
local LeftGroupBox7 = Tabs.Main:AddRightGroupbox('Skills')
local LeftGroupBox6 = Tabs.Main:AddRightGroupbox('Keybinds')

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({" MenuKebinds "})
ThemeManager:SetFolder('Ora')
SaveManager:SetFolder('Ora/BattleRoyale')
SaveManager:BuildConfigSection(Tabs['UI Settings']) 
ThemeManager:ApplyToTab(Tabs['UI Settings'])
Library:Notify("Loaded !")
Library:OnUnload(function()
    Library:Notify("Unloaded !")
    Library.Unloaded = true
end)

_G.Fruit = nil

_G.Running = false

_G.Speed = false

_G.Speedy = 0

_G.SkyWalk = false

_G.NoSpeed = false

_G.Jump = false

_G.AutoFarmPlayer = true

_G.SelectedPlayer = nil

_G.SelectedPlayerName = ""

_G.CurrentPlayerDied = false

_G.ShowHitbox = false

_G.ChestESP = true

_G.EspDroppedFruits = false


_G.InfinteyJump = false

_G.CommonChest = false

_G.UncommonChest = false

_G.RareChest = false

_G.LegandryChest = false

_G.MythicChest = false

_G.HealthDrink = false

_G.StaminaDrink = false

_G.SPReset = false

_G.DarkRoot = false

_G.SipirtEssence = false

--

_G.walkSpeed = 16

_G.jumpPower = 50

_G.Gat = false

_G.Rap = false

function SkyWalks() 
    while true do
        wait()
        if _G.SkyWalk == true then
            _G.SkyWalk = false
            if game.ReplicatedStorage:FindFirstChild("Stats" .. Player.Name) then
                local x = game.ReplicatedStorage:FindFirstChild("Stats" .. Player.Name)
    
                x.Skills.skyWalk.Value = _G.SkyWalk
            end
        elseif _G.SkyWalk == false then
            _G.SkyWalk = true
            if game.ReplicatedStorage:FindFirstChild("Stats" .. Player.Name) then
                local x = game.ReplicatedStorage:FindFirstChild("Stats" .. Player.Name)
    
                x.Skills.skyWalk.Value = _G.SkyWalk
            end
        end
    end
end

function ShiftLockS(sf)
    Player.PlayerScripts.PlayerModule.CameraModule.MouseLockController.BoundKeys.Value = sf
end

function AntiFallDamages()
    if game:GetService("ReplicatedStorage").Events:FindFirstChild("FallDmg") then
        game:GetService("ReplicatedStorage").Events.FallDmg:Destroy()
    end
end

function AntiRagdolls()
    if game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("Ragdolls") then
        game:GetService("Players").LocalPlayer.PlayerScripts.Ragdolls:Destroy()
    end
end

function AntiStun()
    if game:GetService("Players").LocalPlayer:FindFirstChild("StunFolder") then
        game:GetService("Players").LocalPlayer.StunFolder:Destroy()
    end
end

spawn(function()
    while _G.SPReset == true do
        wait()

        for i, v in pairs(game.Workspace.Effects:GetChildren()) do
            if v.Name == "SP Reset Essence" then

                local x = v.Handle

                local cam = workspace.CurrentCamera

                local pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"

                if x.Name ~= "Essence112" then

                    x.Name = "Essence112"

                    local Textlabel = Drawing.new("Text");
                    local Metters = Drawing.new("Text")
                    
                    Textlabel.Size = UDim2.new(1, 0, 0.75, 0)
                    Textlabel.Position = UDim2.new(0, 5)
                    Textlabel.Font = 3
                    Textlabel.ZIndex = 2
                    Textlabel.Text = "SP Reset"
                    Textlabel.TextSize = 16
                    
                    Textlabel.TextColor3 = Color3.fromRGB(240, 33, 248)
                    Textlabel.BackgroundTransparency = 1
                    
                    Metters.Size = UDim2.new(1, 0, 1, 0)
                    Metters.Font = 3
                    Metters.ZIndex = 1
                    Metters.Text = pos .. "m Away"
                    Metters.TextSize = 15
                    
                    Metters.TextColor3 = Color3.fromRGB(240, 33, 248)
                    Metters.BackgroundTransparency = 1
    
                    Textlabel.TextStrokeTransparency = 0
                    Metters.TextStrokeTransparency = 0
    
                    local function UpdateNametag()
                        task.spawn(function()
                            while true do task.wait()
        
                                pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"
        
                                Textlabel.Visible = _G.MONEYCHESTESP1112
                                Metters.Visible = _G.MONEYCHESTESP1112
        
                                if not Textlabel and not Metters then
                                    Textlabel.Visible = false;
                                    Metters.Visible = false
                                    break;
                                end
                
                                if x then
                                    local HeadPosition = Camera:WorldToViewportPoint(x.Position);
                
                                    if x then
                                        Textlabel.Text = "Peli Chest";
                                        Textlabel.Font = 3
                                        Textlabel.Size = 16
                                        Textlabel.ZIndex = 2
                                        Textlabel.Position = Vector2.new(HeadPosition.X - (Textlabel.TextBounds.X / 2), HeadPosition.Y - (Textlabel.TextBounds.Y * 1.25));
                                        Textlabel.Color = Color3.fromRGB(0, 255, 0);
                                        Textlabel.Outline = true;
        
                                        pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"
        
                                        Metters.Text = pos;
                                        Metters.Font = 3
                                        Metters.Size = 16
                                        Metters.ZIndex = 2
                                        Metters.Position = Vector2.new(HeadPosition.X - (Metters.TextBounds.X / 2), HeadPosition.Y - (Metters.TextBounds.Y * 0.5));
                                        Metters.Color = Color3.fromRGB(0, 255, 0);
                                        Metters.Outline = true;
                                    else
                                        Textlabel.Visible = false;
                                        Metters.Visible = false;
                                    end
                                else
                                    Textlabel.Visible = false;
                                    Metters.Visible = false;
                                end
                            end
                        end)
                    end
                    coroutine.wrap(UpdateNametag)();
                end
            end
        end
    end
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

_G.ESP = false

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
                if OnScreen and _G.ESP == true then
                    local head = camera:WorldToViewportPoint(plr.Character.Head.Position)
                    local DistanceY = math.clamp((Vector2.new(head.X, head.Y) - Vector2.new(HumPos.X, HumPos.Y)).magnitude, 2, math.huge)
                    
                    local function Size(item)
                        item.PointA = Vector2.new(HumPos.X + DistanceY, HumPos.Y - DistanceY * 2)
                        item.PointB = Vector2.new(HumPos.X - DistanceY, HumPos.Y - DistanceY * 2)
                        item.PointC = Vector2.new(HumPos.X - DistanceY, HumPos.Y + DistanceY * 2)
                        item.PointD = Vector2.new(HumPos.X + DistanceY, HumPos.Y + DistanceY * 2)
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

local Colors = {
    [1] = Color3.fromRGB(108, 88, 75),
    [2] = Color3.fromRGB(99, 95, 98),
    [3] = Color3.fromRGB(163, 162, 165),
    [4] = Color3.fromRGB(0, 0, 0),
    [5] = Color3.fromRGB(255, 180, 229)
}

local ChestColors = {
    [1] = Color3.fromRGB(161, 124, 96),
    [2] = Color3.fromRGB(255, 255, 255),
    [3] = Color3.fromRGB(88, 211, 88),
    [4] = Color3.fromRGB(95, 230, 230),
    [5] = Color3.fromRGB(241, 158, 90),
    [6] = Color3.fromRGB(130, 136, 240),
}

function ChestESP()
    spawn(function()
        while _G.ChestESP == true do
            wait()
     
            for _, Chest in pairs(game:GetService("Workspace").Effects:GetChildren()) do
                if Chest:IsA("Model") and Chest:FindFirstChild("Top") or Chest:FindFirstChild("Lock") or Chest:FindFirstChild("Bottom") then
                    if Chest:FindFirstChildOfClass("MeshPart") then
     
                        local x = Chest:FindFirstChildOfClass("MeshPart")
     
                        local cam = workspace.CurrentCamera
     
                        local pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"
     
                        if x.Color == Colors[1] and not Chest:FindFirstChild("ESP Part") and _G.CommonChest == true then
     
                            x.Name = "ESP Part"
     
                            Chest.Name = "Common Chest" .. Player.Name
                
                            local Textlabel = Drawing.new("Text");
                            Textlabel.Visible = true;
                            Textlabel.Text = "Chest";
                            Textlabel.Font = 3
                            Textlabel.Size = 16
                            Textlabel.ZIndex = 2
                            Textlabel.Visible = true
                            Textlabel.Color = ChestColors[1]
                            Textlabel.Outline = true;
                
                            local Metters = Drawing.new("Text");
                            Metters.Visible = true;
                            Metters.Text = "135 M Away";
                            Metters.Font = 3
                            Metters.Size = 16
                            Metters.ZIndex = 2
                            Metters.Visible = true
                            Metters.Color = ChestColors[1]
                            Metters.Outline = true;
                
                            local function UpdateNametag()
                                task.spawn(function()
                                    while true do task.wait()
                
                                        pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"
                
                                        Textlabel.Visible = _G.CommonChest
                                        Metters.Visible = _G.CommonChest
                
                                        if not Textlabel and not Metters then
                                            Textlabel.Visible = false;
                                            Metters.Visible = false
                                            break;
                                        end
                        
                                        if x then
                                            local HeadPosition = Camera:WorldToViewportPoint(x.Position);
                        
                                            if x then
                                                Textlabel.Text = "Common Chest";
                                                Textlabel.Font = 3
                                                Textlabel.Size = 16
                                                Textlabel.ZIndex = 2
                                                Textlabel.Position = Vector2.new(HeadPosition.X - (Textlabel.TextBounds.X / 2), HeadPosition.Y - (Textlabel.TextBounds.Y * 1.25));
                                                Textlabel.Color = ChestColors[1]
                                                Textlabel.Outline = true;
                
                                                pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"
                
                                                Metters.Text = pos;
                                                Metters.Font = 3
                                                Metters.Size = 16
                                                Metters.ZIndex = 2
                                                Metters.Position = Vector2.new(HeadPosition.X - (Metters.TextBounds.X / 2), HeadPosition.Y - (Metters.TextBounds.Y * 0.5));
                                                Metters.Color = ChestColors[1]
                                                Metters.Outline = true;
                                            else
                                                Textlabel.Visible = false;
                                                Metters.Visible = false;
                                            end
                                        else
                                            Textlabel.Visible = false;
                                            Metters.Visible = false;
                                        end
                                    end
                                end)
                            end
                            coroutine.wrap(UpdateNametag)();
     
     
                            -- else
                                -- x:FindFirstChild("GPO"):Destroy()
                            -- end
     
                        --     local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
     
                        --     -- config
                        --     ESP.Players = false
                        --     ESP.Boxes = false
                        --     ESP.Names = true
                        --     ESP:Toggle(true)
                            
                        --     -- object
                        
                        --     ESP:AddObjectListener(Chest, { -- Object Path, For example: Workspace.ThisFolder
                        --     Name = "CurrentESP" .. Player.Name, --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
                        --     CustomName = "Common Chest", -- Name you want to be displayed
                        --     Color = Color3.fromRGB(117, 91, 71), -- Color
                        --     IsEnabled = "Chest" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
                        -- })
                        -- ESP.Chest = true
                    end
     
                        if x.Color == Colors[2] and not Chest:FindFirstChild("ESP Part") and _G.UncommonChest == true then
     
                            x.Name = "ESP Part"
     
                            Chest.Name = "Uncommon Chest" .. Player.Name
     
                            local Textlabel = Drawing.new("Text");
                            Textlabel.Visible = true;
                            Textlabel.Text = "Uncommon Chest";
                            Textlabel.Font = 3
                            Textlabel.Size = 16
                            Textlabel.ZIndex = 2
                            Textlabel.Visible = true
                            Textlabel.Color = ChestColors[3]
                            Textlabel.Outline = true;
                
                            local Metters = Drawing.new("Text");
                            Metters.Visible = true;
                            Metters.Text = "135 M Away";
                            Metters.Font = 3
                            Metters.Size = 16
                            Metters.ZIndex = 2
                            Metters.Visible = true
                            Metters.Color = ChestColors[3]
                            Metters.Outline = true;
                
                            local function UpdateNametag()
                                task.spawn(function()
                                    while true do task.wait()
                
                                        pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"
                
                                        Textlabel.Visible = _G.UncommonChest
                                        Metters.Visible = _G.UncommonChest
                
                                        if not Textlabel and not Metters then
                                            Textlabel.Visible = false;
                                            Metters.Visible = false
                                            break;
                                        end
                        
                                        if x then
                                            local HeadPosition = Camera:WorldToViewportPoint(x.Position);
                        
                                            if x then
                                                Textlabel.Text = "Uncommon Chest";
                                                Textlabel.Font = 3
                                                Textlabel.Size = 16
                                                Textlabel.ZIndex = 2
                                                Textlabel.Position = Vector2.new(HeadPosition.X - (Textlabel.TextBounds.X / 2), HeadPosition.Y - (Textlabel.TextBounds.Y * 1.25));
                                                Textlabel.Color = ChestColors[3]
                                                Textlabel.Outline = true;
                
                                                pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"
                
                                                Metters.Text = pos;
                                                Metters.Font = 3
                                                Metters.Size = 16
                                                Metters.ZIndex = 2
                                                Metters.Position = Vector2.new(HeadPosition.X - (Metters.TextBounds.X / 2), HeadPosition.Y - (Metters.TextBounds.Y * 0.5));
                                                Metters.Color = ChestColors[3]
                                                Metters.Outline = true;
                                            else
                                                Textlabel.Visible = false;
                                                Metters.Visible = false;
                                            end
                                        else
                                            Textlabel.Visible = false;
                                            Metters.Visible = false;
                                        end
                                    end
                                end)
                            end
                            coroutine.wrap(UpdateNametag)();
     
     

                        end
     
                        if x.Color == Colors[3] and not Chest:FindFirstChild("ESP Part") and _G.RareChest == true then
     
                            x.Name = "ESP Part"
     
                            Chest.Name = "Rare Chest" .. Player.Name
     
                            local Textlabel = Drawing.new("Text");
                            Textlabel.Visible = true;
                            Textlabel.Text = "Rare Chest";
                            Textlabel.Font = 3
                            Textlabel.Size = 16
                            Textlabel.ZIndex = 2
                            Textlabel.Visible = true
                            Textlabel.Color = ChestColors[3]
                            Textlabel.Outline = true;
                
                            local Metters = Drawing.new("Text");
                            Metters.Visible = true;
                            Metters.Text = "135 M Away";
                            Metters.Font = 3
                            Metters.Size = 16
                            Metters.ZIndex = 2
                            Metters.Visible = true
                            Metters.Color = ChestColors[3]
                            Metters.Outline = true;
                
                            local function UpdateNametag()
                                task.spawn(function()
                                    while true do task.wait()
                
                                        pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"
                
                                        Textlabel.Visible = _G.RareChest
                                        Metters.Visible = _G.RareChest
                
                                        if not Textlabel and not Metters then
                                            Textlabel.Visible = false;
                                            Metters.Visible = false
                                            break;
                                        end
                        
                                        if x then
                                            local HeadPosition = Camera:WorldToViewportPoint(x.Position);
                        
                                            if x then
                                                Textlabel.Text = "Rare Chest";
                                                Textlabel.Font = 3
                                                Textlabel.Size = 16
                                                Textlabel.ZIndex = 2
                                                Textlabel.Position = Vector2.new(HeadPosition.X - (Textlabel.TextBounds.X / 2), HeadPosition.Y - (Textlabel.TextBounds.Y * 1.25));
                                                Textlabel.Color = ChestColors[4]
                                                Textlabel.Outline = true;
                
                                                pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"
                
                                                Metters.Text = pos;
                                                Metters.Font = 3
                                                Metters.Size = 16
                                                Metters.ZIndex = 2
                                                Metters.Position = Vector2.new(HeadPosition.X - (Metters.TextBounds.X / 2), HeadPosition.Y - (Metters.TextBounds.Y * 0.5));
                                                Metters.Color = ChestColors[4]
                                                Metters.Outline = true;
                                            else
                                                Textlabel.Visible = false;
                                                Metters.Visible = false;
                                            end
                                        else
                                            Textlabel.Visible = false;
                                            Metters.Visible = false;
                                        end
                                    end
                                end)
                            end
                            coroutine.wrap(UpdateNametag)();

                        end
     
                        if x.Color == Colors[4] and not Chest:FindFirstChild("ESP Part") and _G.LegandryChest == true then
     
                            x.Name = "ESP Part"
     
                            Chest.Name = "Legandry Chest" .. Player.Name
     
     
                            local Textlabel = Drawing.new("Text");
                            Textlabel.Visible = true;
                            Textlabel.Text = "Uncommon Chest";
                            Textlabel.Font = 3
                            Textlabel.Size = 16
                            Textlabel.ZIndex = 2
                            Textlabel.Visible = true
                            Textlabel.Color = ChestColors[5]
                            Textlabel.Outline = true;
                
                            local Metters = Drawing.new("Text");
                            Metters.Visible = true;
                            Metters.Text = "135 M Away";
                            Metters.Font = 3
                            Metters.Size = 16
                            Metters.ZIndex = 2
                            Metters.Visible = true
                            Metters.Color = ChestColors[5]
                            Metters.Outline = true;
                
                            local function UpdateNametag()
                                task.spawn(function()
                                    while true do task.wait()
                
                                        pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"
                
                                        Textlabel.Visible = _G.LegandryChest
                                        Metters.Visible = _G.LegandryChest
                
                                        if not Textlabel and not Metters then
                                            Textlabel.Visible = false;
                                            Metters.Visible = false
                                            break;
                                        end
                        
                                        if x then
                                            local HeadPosition = Camera:WorldToViewportPoint(x.Position);
                        
                                            if x then
                                                Textlabel.Text = "Legandry Chest";
                                                Textlabel.Font = 3
                                                Textlabel.Size = 16
                                                Textlabel.ZIndex = 2
                                                Textlabel.Position = Vector2.new(HeadPosition.X - (Textlabel.TextBounds.X / 2), HeadPosition.Y - (Textlabel.TextBounds.Y * 1.25));
                                                Textlabel.Color = ChestColors[5]
                                                Textlabel.Outline = true;
                
                                                pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"
                
                                                Metters.Text = pos;
                                                Metters.Font = 3
                                                Metters.Size = 16
                                                Metters.ZIndex = 2
                                                Metters.Position = Vector2.new(HeadPosition.X - (Metters.TextBounds.X / 2), HeadPosition.Y - (Metters.TextBounds.Y * 0.5));
                                                Metters.Color = ChestColors[5]
                                                Metters.Outline = true;
                                            else
                                                Textlabel.Visible = false;
                                                Metters.Visible = false;
                                            end
                                        else
                                            Textlabel.Visible = false;
                                            Metters.Visible = false;
                                        end
                                    end
                                end)
                            end
                            coroutine.wrap(UpdateNametag)();
                        end
     
                        if x.Color == Colors[5] and not Chest:FindFirstChild("ESP Part") and _G.MythicChest == true then
     
                            x.Name = "ESP Part"
     
                            Chest.Name = "Mythic Chest" .. Player.Name
     
                            local Textlabel = Drawing.new("Text");
                            Textlabel.Visible = true;
                            Textlabel.Text = "Mythic Chest";
                            Textlabel.Font = 3
                            Textlabel.Size = 16
                            Textlabel.ZIndex = 2
                            Textlabel.Visible = true
                            Textlabel.Color = ChestColors[6]
                            Textlabel.Outline = true;
                
                            local Metters = Drawing.new("Text");
                            Metters.Visible = true;
                            Metters.Text = "135 M Away";
                            Metters.Font = 3
                            Metters.Size = 16
                            Metters.ZIndex = 2
                            Metters.Visible = true
                            Metters.Color = ChestColors[6]
                            Metters.Outline = true;
                
                            local function UpdateNametag()
                                task.spawn(function()
                                    while true do task.wait()
                
                                        pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"
                
                                        Textlabel.Visible = _G.MythicChest
                                        Metters.Visible = _G.MythicChest
                
                                        if not Textlabel and not Metters then
                                            Textlabel.Visible = false;
                                            Metters.Visible = false
                                            break;
                                        end
                        
                                        if x then
                                            local HeadPosition = Camera:WorldToViewportPoint(x.Position);
                        
                                            if x then
                                                Textlabel.Text = "Mythic Chest";
                                                Textlabel.Font = 3
                                                Textlabel.Size = 16
                                                Textlabel.ZIndex = 2
                                                Textlabel.Position = Vector2.new(HeadPosition.X - (Textlabel.TextBounds.X / 2), HeadPosition.Y - (Textlabel.TextBounds.Y * 1.25));
                                                Textlabel.Color = ChestColors[6]
                                                Textlabel.Outline = true;
                
                                                pos = math.floor((cam.CFrame.p - x.CFrame.p).Magnitude) .."m Away"
                
                                                Metters.Text = pos;
                                                Metters.Font = 3
                                                Metters.Size = 16
                                                Metters.ZIndex = 2
                                                Metters.Position = Vector2.new(HeadPosition.X - (Metters.TextBounds.X / 2), HeadPosition.Y - (Metters.TextBounds.Y * 0.5));
                                                Metters.Color = ChestColors[6]
                                                Metters.Outline = true;
                                            else
                                                Textlabel.Visible = false;
                                                Metters.Visible = false;
                                            end
                                        else
                                            Textlabel.Visible = false;
                                            Metters.Visible = false;
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
    end)
end

ChestESP()

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

_G.Kebind = ""

LeftGroupBox3:AddToggle('WalkSpeedToggle', {
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

        if Toggles.WalkSpeedToggle.Value == true and _G.Kebind == "" then

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

_G.Walk = false

_G.JumpP = false

_G.Keybind2 = ""

LeftGroupBox3:AddToggle('JumpPowerToggle', {
    Text = 'JumpPower',
    Default = false, -- Default value (true / false)
    Tooltip = '', -- Information shown when you hover over the toggle
})

Toggles.JumpPowerToggle:OnChanged(function()
    game.Players.LocalPlayer.Character.Humanoid.Jumping:Connect(function()
        if Toggles.JumpPowerToggle.Value == true and _G.Keybind2 == "" then

            local jumpVelocity = math.sqrt(2 * _G.jumpPower * game.Workspace.Gravity)
    
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, jumpVelocity, 0)
        end
    end)
end)

_G.hitbox123123 = false

_G.Oa = false

_G.Pla = false

_G.Kebind3 = ""

_G.AutoFarmNear = false

_G.Near2 = false

_G.Keybind4 = ""

-- Define the function to get the nearest player
local function getNearestPlayer()
    local players = game:GetService("Players"):GetPlayers()
    local nearestPlayer, minDistance = nil, 50
    for _,p in pairs(players) do
        if p.Character and p ~= Player and p.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (p.Character.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
            if distance < minDistance then
                nearestPlayer = p
                minDistance = distance
            end
        end
    end
    return nearestPlayer
end

function AutoFarm()
    while _G.AutoFarmNear == true and _G.Keybind4 == "" do

        wait()

        local nearestPlayer = getNearestPlayer()

        if nearestPlayer then
            local destination = nearestPlayer.Character.HumanoidRootPart.Position
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(destination)
        end
    end
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

_G.NOclup = false

function nocupfunct()
    
    if _G.NOclup == false then
        clip()
    end

    if _G.NOclup == true then

        noclip()
    end
end

LeftGroupBox:AddToggle('noclup', {
    Text = 'No Clip',
    Default = false, -- Default value (true / false)
    Tooltip = 'gg', -- Information shown when you hover over the toggle
})

Toggles.noclup:OnChanged(function()
    _G.NOclup = Toggles.noclup.Value
    nocupfunct()
end)

LeftGroupBox3:AddToggle('HitboxSize123', {
    Text = 'Hitbox Extender',
    Default = false, -- Default value (true / false)
    Tooltip = 'Make An A Killaura for all players',
})

Toggles.HitboxSize123:OnChanged(function()
    for i, v in pairs(Players:GetPlayers()) do
        if v ~= Player then
            if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local x = v.Character.HumanoidRootPart

                if Toggles.HitboxSize123.Value == true then
                    x.Size = Vector3.new(60,60,60)
                end

                if Toggles.HitboxSize123.Value == false then
                    x.Size = Vector3.new(2,2,1)
                end
            end
        end
    end
end)

LeftGroupBox3:AddToggle('AutoFarmNearest', {
    Text = 'Auto Farm Nearest Player',
    Default = false, -- Default value (true / false)
    Tooltip = 'Auto Kill Nearest Player (its better if its solo mode so it dont bug out)',
})

Toggles.AutoFarmNearest:OnChanged(function()
    _G.AutoFarmNear = Toggles.AutoFarmNearest.Value
    AutoFarm()
end)

LeftGroupBox3:AddToggle('SkyWalksToggle', {
    Text = 'Sky Walk',
    Default = false, -- Default value (true / false)
    Tooltip = 'Gives You Sky Walk For Free ', -- Information shown when you hover over the toggle
})

LeftGroupBox3:AddToggle('InfintyJumpToggle', {
    Text = 'Infinty Jump',
    Default = false, -- Default value (true / false)
    Tooltip = 'Make You Have Infinty Jump', -- Information shown when you hover over the toggle
})

Toggles.InfintyJumpToggle:OnChanged(function()
    
    local uis = game:GetService("UserInputService")

    uis.InputBegan:Connect(function(input, gameProcessedEvent)
        if gameProcessedEvent then
            return
        end

        if input.KeyCode == Enum.KeyCode.Space and Toggles.InfintyJumpToggle.Value then
            local hum = Player.Character:WaitForChild("Humanoid")
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end)

Toggles.SkyWalksToggle:OnChanged(function()
    _G.SkyWalk = Toggles.SkyWalksToggle.Value
    if game.ReplicatedStorage:FindFirstChild("Stats" .. Player.Name) then
        local x = game.ReplicatedStorage:FindFirstChild("Stats" .. Player.Name)

        x.Skills.skyWalk.Value = _G.SkyWalk
    end
end)

local devilfruits = {"Suke-Suke","Spin-Spin","Kilo-Kilo","Gomu-Gomu","Bari-Bari","Mero-Mero","Horo-Horo","Bomu-Bomu","Yomi-Yomi","Zushi-Zushi","Gura-Gura","Suna-Suna","Hie-Hie","Ito-Ito","Goro-Goro","Paw-Paw","Mera-Mera","Kage-Kage","Magu-Magu","Pika-Pika","Yami-Yami","Yuki-Yuki","Tori-Tori","Mochi-Mochi"}

_G.FruitEated = ""

function DF_Finder()
    for i, v in pairs(devilfruits) do
        if Player.Backpack:FindFirstChild(v) then
            _G.FruitEated = v
        elseif Player.Character:FindFirstChild(v) then
            _G.FruitEated = v
        end
    end
end

LeftGroupBox3:AddToggle('WaterDrown', {
    Text = 'Swim With Fruit',
    Default = false, -- Default value (true / false)
    Tooltip = 'prevent you from drowning', -- Information shown when you hover over the toggle
})

Toggles.WaterDrown:OnChanged(function()

    local x = devilfruits

    local xx = game.ReplicatedStorage:FindFirstChild("Stats" .. Player.Name).Stats.DF
    
    spawn(function()
        while Toggles.WaterDrown.Value == true do
            task.wait()


            xx.Value = ""

            for i, v in pairs(x) do
                if v == _G.FruitEated then
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.Stats.Frame.DevilFruitMastery.Visible = true
                end
            end
        end
    end)

    spawn(function()
        while Toggles.WaterDrown.Value == false do
            task.wait()

            DF_Finder()

            for i, v in pairs(x) do
                if v == _G.FruitEated then
                    xx.Value = _G.FruitEated
                end
            end
        end
    end)
end)


_G.KeybindGat = ""
_G.KeybindRap = ""

_G.Gatling = false

_G.RapidSlashes = false

LeftGroupBox7:AddToggle('Gatling', {
    Text = 'Smart Gatling',
    Default = false, -- Default value (true / false)
    Tooltip = 'Spam Gatling (Requires Gomu)', -- Information shown when you hover over the toggle
})

function Gatlings()
    while _G.Gatling == true do

        wait()

        if _G.KeybindGat == "" then
            
            local args = {
                [1] = "Gomu-Gomu no Gatling",
                [2] = {
                    ["cf"] = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * CFrame.Angles(3.141592502593994, 0.17062515020370483, -3.141592502593994)
                }
            }
        
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
        else
            wait()
        end
    end
end

Toggles.Gatling:OnChanged(function()
    _G.Gatling = Toggles.Gatling.Value
    _G.Gat = Toggles.Gatling.Value
    Gatlings()
end)

LeftGroupBox7:AddToggle('RapidSlashes', {
    Text = 'Smart Rapid Slashes',
    Default = false, -- Default value (true / false)
    Tooltip = 'Spam Rapid Slashes (Requires Katana)', -- Information shown when you hover over the toggle
})

function RapidSlashes()
    while _G.RapidSlashes == true do

        wait()

        if _G.KeybindRap == "" then
            local args = {
                [1] = "Rapid Slashes"
            }
    
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
        else
            wait()
        end
    end
end

Toggles.RapidSlashes:OnChanged(function()
    _G.RapidSlashes = Toggles.RapidSlashes.Value
    _G.Rap = Toggles.RapidSlashes.Value
    RapidSlashes()
end)

LeftGroupBox4:AddLabel('Chest ESP 🠗')

-- LeftGroupBox4:AddToggle('ChestESP_Toggle', {
--     Text = 'Chest ESP',
--     Default = false, -- Default value (true / false)
--     Tooltip = 'Make You See Every Chest In The Game !!', -- Information shown when you hover over the toggle
-- })

-- Toggles.ChestESP_Toggle:OnChanged(function()
--     _G.ChestESP = Toggles.ChestESP_Toggle.Value
--     ChestESP()
-- end)

LeftGroupBox4:AddToggle('Common_Toggle', {
    Text = 'Common Chest',
    Default = true, -- Default value (true / false)
    Tooltip = 'Make You See Every Common Chest In The Game !!', -- Information shown when you hover over the toggle
})

Toggles.Common_Toggle:OnChanged(function()
    _G.CommonChest = Toggles.Common_Toggle.Value
end)

LeftGroupBox4:AddToggle('Uncommon_Toggle', {
    Text = 'Uncommon Chest',
    Default = true, -- Default value (true / false)
    Tooltip = 'Make You See Every Uncommon Chest In The Game !!', -- Information shown when you hover over the toggle
})

Toggles.Uncommon_Toggle:OnChanged(function()
    _G.UncommonChest = Toggles.Uncommon_Toggle.Value
end)

LeftGroupBox4:AddToggle('RareChest_Toggle', {
    Text = 'Rare Chest',
    Default = true, -- Default value (true / false)
    Tooltip = 'Make You See Every Rare Chest In The Game !!', -- Information shown when you hover over the toggle
})

Toggles.RareChest_Toggle:OnChanged(function()
    _G.RareChest = Toggles.RareChest_Toggle.Value
end)

LeftGroupBox4:AddToggle('Legandry_Toggle', {
    Text = 'Legandry Chest',
    Default = true, -- Default value (true / false)
    Tooltip = 'Make You See Every Legandry Chest In The Game !!', -- Information shown when you hover over the toggle
})

Toggles.Legandry_Toggle:OnChanged(function()
    _G.LegandryChest = Toggles.Legandry_Toggle.Value
end)

LeftGroupBox4:AddToggle('Mythic_Toggle', {
    Text = 'Mythic Chest',
    Default = true, -- Default value (true / false)
    Tooltip = 'Make You See Every Mythic Chest In The Game !!', -- Information shown when you hover over the toggle
})

Toggles.Mythic_Toggle:OnChanged(function()
    _G.MythicChest = Toggles.Mythic_Toggle.Value
end)


local AntiRagdoll = LeftGroupBox3:AddButton('Anti Ragdoll', function()
    AntiRagdolls()
end)

AntiRagdoll:AddTooltip("Make You Can't To Be Ragdolled")

local AntiStun = LeftGroupBox3:AddButton('Anti Stun', function()
    AntiStun()
end)

AntiStun:AddTooltip("Make You Can't To Be Stunned")

local AntiFallDamage = LeftGroupBox3:AddButton('Anti FallDamage', function()
    AntiFallDamages()
end)

AntiFallDamage:AddTooltip("Make You Can't To Get FallDamage")

LeftGroupBox3:AddSlider('WalkspeedSlider', {
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

LeftGroupBox3:AddSlider('JumpPowerSlider', {
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


Players.PlayerAdded:Connect(function(Player)
    if ESPToggle then
        DrawESP(Player);
    end

    if Tracers then
        DrawTracer(Player);
    end

    if Nametags then
        DrawNametag(Player);
    end
end)

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

        local x = game.ReplicatedStorage:FindFirstChild("Stats" .. Playes.Name).Stamina

        if not IsAlive(Playes) or Playes.Character.Humanoid.Health <= 0 then
            return ("[0] " .. Playes.Name .. "| Fruit: %s" .. game.ReplicatedStorage:FindFirstChild("Stats" .. Playes.Name).Stats.DF.Value .. "| %sSTAM"):format(Playes.Character.Humanoid.Health) .. ("| %sHP"):format(x.Value)
        end

        if game.ReplicatedStorage:FindFirstChild("Stats" .. Playes.Name).Stats.DF.Value == "" then
            game.ReplicatedStorage:FindFirstChild("Stats" .. Playes.Name).Stats.DF.Value = "Fruitless"
        end

        return string.format("[%s] %s | Fruit: %s | %sHP | %sSTAM",
        HumanoidRootPart and tostring(math.round((Playes.Character.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude)) or "N/A",
        Playes.Name,
        game.ReplicatedStorage:FindFirstChild("Stats" .. Playes.Name).Stats.DF.Value,
        tostring(math.round(Playes.Character.Humanoid.Health)),
        tostring(math.round(x.Value)))
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

RightGroupBox:AddToggle('Names_tog', {
    Text = 'Names',
    Default = false, -- Default value (true / false)
    Tooltip = 'Esp Name: shows player name | the fruit he ate | his health', -- Information shown when you hover over the toggle
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

RightGroupBox:AddToggle('EspSmart', {
    Text = 'Full Esp',
    Default = false, -- Default value (true / false)
    Tooltip = 'Box - Lines - Bars But Without Names', -- Information shown when you hover over the toggle
})

Toggles.EspSmart:OnChanged(function()
    _G.ESP = Toggles.EspSmart.Value
end)

RightGroupBox:AddToggle('Line', {
    Text = 'Line',
    Default = true, -- Default value (true / false)
    Tooltip = 'Esp Option', -- Information shown when you hover over the toggle
})

Toggles.Line:OnChanged(function()
    Settings.Tracers = Toggles.Line.Value
end)

LeftGroupBox5:AddLabel("Chest Colors")

LeftGroupBox5:AddLabel('Common Chest'):AddColorPicker('ChestCommonColor', {
    Default = ChestColors[1], -- Bright green
    Title = "Common Color", -- Optional. Allows you to have a custom color picker title (when you open it)
})

Options.ChestCommonColor:OnChanged(function()
    ChestColors[1] = Options.ChestCommonColor.Value
end)

--

LeftGroupBox5:AddLabel('Uncommon Chest'):AddColorPicker('ChestUncommonColor', {
    Default = ChestColors[3], -- Bright green
    Title = "Uncommon Color", -- Optional. Allows you to have a custom color picker title (when you open it)
})

Options.ChestUncommonColor:OnChanged(function()
    ChestColors[3] = Options.ChestUncommonColor.Value
end)

--

LeftGroupBox5:AddLabel('Rare Chest'):AddColorPicker('ChestRareColor', {
    Default = ChestColors[4], -- Bright green
    Title = "Rare Color", -- Optional. Allows you to have a custom color picker title (when you open it)
})

Options.ChestRareColor:OnChanged(function()
    ChestColors[4] = Options.ChestRareColor.Value
end)

--

LeftGroupBox5:AddLabel('Legandry Chest'):AddColorPicker('ChestLegandryColor', {
    Default = ChestColors[5], -- Bright green
    Title = "Legandry Color", -- Optional. Allows you to have a custom color picker title (when you open it)
})

--

Options.ChestLegandryColor:OnChanged(function()
    ChestColors[5] = Options.ChestLegandryColor.Value
end)

LeftGroupBox5:AddLabel('Mythic Chest'):AddColorPicker('ChestMythicColor', {
    Default = ChestColors[6], -- Bright green
    Title = "Mythic Color", -- Optional. Allows you to have a custom color picker title (when you open it)
})

Options.ChestMythicColor:OnChanged(function()
    ChestColors[6] = Options.ChestMythicColor.Value
end)


MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind',
 {
     Default = 'LeftAlt',
     NoUI = false,
     Text = 'Menu'
     }) 

Library.ToggleKeybind = Options.MenuKeybind

LeftGroupBox6:AddLabel('Walkspeed'):AddKeyPicker('WalkSpeedKey', {


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
        _G.Kebind = Options.WalkSpeedKey.Value
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

LeftGroupBox6:AddLabel('JumpPower'):AddKeyPicker('JumpPowerKeybind', {
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

    _G.Keybind2 = Options.JumpPowerKeybind.Value

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

LeftGroupBox6:AddLabel('Auto Farm Nearest Player'):AddKeyPicker('FarmNearestSmart', {
    -- SyncToggleState only works with toggles. 
    -- It allows you to make a keybind which has its state synced with its parent toggle

    -- Example: Keybind which you use to toggle flyhack, etc.
    -- Changing the toggle disables the keybind state and toggling the keybind switches the toggle state

    Default = '', -- String as the name of the keybind (MB1, MB2 for mouse buttons)  
    SyncToggleState = false,


    -- You can define custom Modes but I have never had a use for it.
    Mode = 'Toggle', -- Modes: Always, Toggle, Hold

    Text = 'Enable Near', -- Text to display in the keybind menu
    NoUI = false, -- Set to true if you want to hide from the Keybind menu,
})

function AutoFarm2()
    while _G.Near2 == true and _G.AutoFarmNear == true do
        wait()

        local nearestPlayer = getNearestPlayer()
        
        if nearestPlayer then
            local destination = nearestPlayer.Character.HumanoidRootPart.Position
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(destination)
        end
    end
end


Options.FarmNearestSmart:OnClick(function()
    if _G.Near2 == true then
        _G.Near2 = false
    elseif _G.Near2 == false then
        _G.Near2 = true
    end

    if Options.FarmNearestSmart.Value ~= "" then
        _G.Keybind4 = Options.FarmNearestSmart.Value
    end
    AutoFarm2()
end)

function GatlingKey()
    while _G.Gat == true do

        wait()

        if _G.KeybindGat ~= "" then
            local args = {
                [1] = "Gomu-Gomu no Gatling",
                [2] = {
                    ["cf"] = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * CFrame.Angles(3.141592502593994, 0.17062515020370483, -3.141592502593994)
                }
            }
        
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
        else
            wait()
        end
    end
end

function RapidSlashesKey()
    while _G.Rap == true do

        wait()

        if _G.KeybindRap ~= "" then
            local args = {
                [1] = "Rapid Slashes"
            }
    
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
        else
            wait()
        end
    end
end

LeftGroupBox6:AddLabel('Smart Rapid Slashes'):AddKeyPicker('RapidSlashesKeybind', {
    -- SyncToggleState only works with toggles. 
    -- It allows you to make a keybind which has its state synced with its parent toggle

    -- Example: Keybind which you use to toggle flyhack, etc.
    -- Changing the toggle disables the keybind state and toggling the keybind switches the toggle state

    Default = '', -- String as the name of the keybind (MB1, MB2 for mouse buttons)  
    SyncToggleState = false,


    -- You can define custom Modes but I have never had a use for it.
    Mode = 'Toggle', -- Modes: Always, Toggle, Hold

    Text = 'Enable Rapid Slashes', -- Text to display in the keybind menu
    NoUI = false, -- Set to true if you want to hide from the Keybind menu,
})

-- OnClick is only fired when you press the keybind and the mode is Toggle
-- Otherwise, you will have to use Keybind:GetState()
Options.RapidSlashesKeybind:OnClick(function()
    if _G.Rap == true then
        _G.Rap = false
    elseif _G.Rap == false then
        _G.Rap = true
    end

    if Options.RapidSlashesKeybind.Value ~= "" then
        _G.KeybindRap = Options.RapidSlashesKeybind.Value
    end
    RapidSlashesKey()
end)

LeftGroupBox6:AddLabel('Smart Gatling'):AddKeyPicker('GatlingSmart', {
    -- SyncToggleState only works with toggles. 
    -- It allows you to make a keybind which has its state synced with its parent toggle

    -- Example: Keybind which you use to toggle flyhack, etc.
    -- Changing the toggle disables the keybind state and toggling the keybind switches the toggle state

    Default = '', -- String as the name of the keybind (MB1, MB2 for mouse buttons)  
    SyncToggleState = false,


    -- You can define custom Modes but I have never had a use for it.
    Mode = 'Toggle', -- Modes: Always, Toggle, Hold

    Text = 'Enable Gatling', -- Text to display in the keybind menu
    NoUI = false, -- Set to true if you want to hide from the Keybind menu,
})


Options.GatlingSmart:OnClick(function()
    if _G.Gat == true then
        _G.Gat = false
    elseif _G.Gat == false then
        _G.Gat = true
    end

    if Options.GatlingSmart.Value ~= "" then
        _G.KeybindGat = Options.GatlingSmart.Value
    end
    GatlingKey()
end)

SaveManager:LoadAutoloadConfig()
